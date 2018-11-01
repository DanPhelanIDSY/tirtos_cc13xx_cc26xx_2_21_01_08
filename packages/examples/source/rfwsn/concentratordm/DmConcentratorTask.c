/*
 * Copyright (c) 2016, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/***** Includes *****/
#include <DmConcentratorRadioTask.h>
#include <DmConcentratorTask.h>
#include <xdc/std.h>
#include <xdc/runtime/System.h>

#include <string.h>

#include <ti/sysbios/BIOS.h>

#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/knl/Semaphore.h>
#include <ti/sysbios/knl/Event.h>

#ifdef USE_BIM
#include <ti/sysbios/knl/Clock.h>
#include "bim/BimFactoryReset.h"
#endif

/* Drivers */
#include <ti/drivers/PIN.h>
#include <ti/drivers/pin/PINCC26XX.h>
#include <ti/mw/display/Display.h>
#include <ti/mw/display/DisplayExt.h>

/* Board Header files */
#include "Board.h"

#include "RadioProtocol.h"



/***** Defines *****/
#define CONCENTRATOR_TASK_STACK_SIZE 1024
#define CONCENTRATOR_TASK_PRIORITY   3

#define CONCENTRATOR_EVENT_ALL                         0xFFFFFFFF
#define CONCENTRATOR_EVENT_NEW_ADC_SENSOR_VALUE    (uint32_t)(1 << 0)

#ifdef USE_BIM
#define CONCENTRATOR_EVENT_FACTORY_RESET           (uint32_t)(1 << 1)
#endif

#define CONCENTRATOR_MAX_NODES 7

#define CONCENTRATOR_DISPLAY_LINES 10

#ifdef USE_BIM
/* BLE Load button check timers - check button ever 100ms for 5s*/
#define NODE_BLE_BOOTLODER_BUTTON_CHECK_TIMER_MS    100
#define NODE_BLE_BOOTLODER_BUTTON_CHECK_DURATION_S  6

#endif

/***** Type declarations *****/
struct AdcSensorNode {
    uint8_t address;
    uint16_t latestAdcValue;
    uint8_t button;
    int8_t latestRssi;
};

/*
 * Application button pin configuration table:
 *   - Buttons interrupts are configured to trigger on falling edge.
 */
PIN_Config buttonPinTable[] = {
    Board_BUTTON0  | PIN_INPUT_EN | PIN_PULLUP | PIN_IRQ_NEGEDGE,
    Board_BUTTON1  | PIN_INPUT_EN | PIN_PULLUP | PIN_IRQ_NEGEDGE,
    PIN_TERMINATE
};

/***** Variable declarations *****/
static Task_Params concentratorTaskParams;
Task_Struct concentratorTask;    /* not static so you can see in ROV */
static uint8_t concentratorTaskStack[CONCENTRATOR_TASK_STACK_SIZE];
Event_Struct concentratorEvent;  /* not static so you can see in ROV */
static Event_Handle concentratorEventHandle;
static struct AdcSensorNode latestActiveAdcSensorNode;
struct AdcSensorNode knownSensorNodes[CONCENTRATOR_MAX_NODES];
static struct AdcSensorNode* lastAddedSensorNode = knownSensorNodes;
static uint8_t selectedNode = 0;
static Display_Handle hDisplayLcd;
static Display_Handle hDisplaySerial;
static PIN_Handle buttonPinHandle;
static PIN_State buttonPinState;
static ConcentratorAdvertiser advertiser;

#ifdef USE_BIM
/* Clock for the fast report timeout */
Clock_Struct bleBootloadBtnCheckClock;     /* not static so you can see in ROV */
static Clock_Handle bleBootloadBtnCheckClockHandle;
#endif

/***** Prototypes *****/
static void concentratorTaskFunction(UArg arg0, UArg arg1);
static void packetReceivedCallback(union ConcentratorPacket* packet, int8_t rssi);
static void updateLcd(void);
static void addNewNode(struct AdcSensorNode* node);
static void updateNode(struct AdcSensorNode* node);
static uint8_t isKnownNodeAddress(uint8_t address);
void buttonCallback(PIN_Handle handle, PIN_Id pinId);

#ifdef USE_BIM
void static bleBtnCheckTimerCallback(UArg arg0);
#endif

/***** Function definitions *****/
void ConcentratorTask_init(void) {

    /* Create event used internally for state changes */
    Event_Params eventParam;
    Event_Params_init(&eventParam);
    Event_construct(&concentratorEvent, &eventParam);
    concentratorEventHandle = Event_handle(&concentratorEvent);

#ifdef USE_BIM
    /* Create clock object which is used for ble bootload button check */
    Clock_Params clkParams;
    clkParams.period = 0;
    clkParams.startFlag = FALSE;
    Clock_construct(&bleBootloadBtnCheckClock, bleBtnCheckTimerCallback, 1, &clkParams);
    bleBootloadBtnCheckClockHandle = Clock_handle(&bleBootloadBtnCheckClock);
#endif

    /* Create the concentrator radio protocol task */
    Task_Params_init(&concentratorTaskParams);
    concentratorTaskParams.stackSize = CONCENTRATOR_TASK_STACK_SIZE;
    concentratorTaskParams.priority = CONCENTRATOR_TASK_PRIORITY;
    concentratorTaskParams.stack = &concentratorTaskStack;
    Task_construct(&concentratorTask, concentratorTaskFunction, &concentratorTaskParams, NULL);
}

static void concentratorTaskFunction(UArg arg0, UArg arg1)
{
    /* Initialize display and try to open both UART and LCD types of display. */
    Display_Params params;
    Display_Params_init(&params);
    params.lineClearMode = DISPLAY_CLEAR_BOTH;

    /* Open both an available LCD display and an UART display.
     * Whether the open call is successful depends on what is present in the
     * Display_config[] array of the board file.
     *
     * Note that for SensorTag evaluation boards combined with the SHARP96x96
     * Watch DevPack, there is a pin conflict with UART such that one must be
     * excluded, and UART is preferred by default. To display on the Watch
     * DevPack, add the precompiler define BOARD_DISPLAY_EXCLUDE_UART.
     */
    hDisplayLcd = Display_open(Display_Type_LCD, &params);
    hDisplaySerial = Display_open(Display_Type_UART, &params);

    /* Check if the selected Display type was found and successfully opened */
    if (hDisplaySerial)
    {
        Display_print0(hDisplaySerial, 0, 0, "Waiting for nodes...");
    }

    /* Check if the selected Display type was found and successfully opened */
    if (hDisplayLcd)
    {
        Display_print0(hDisplayLcd, 0, 0, "Waiting for nodes...");
    }

#ifdef USE_BIM
    /* setup timer for ble bootload button check */
    Clock_setTimeout(bleBootloadBtnCheckClockHandle,
            NODE_BLE_BOOTLODER_BUTTON_CHECK_TIMER_MS * 1000 / Clock_tickPeriod);
#endif

    buttonPinHandle = PIN_open(&buttonPinState, buttonPinTable);
    if(!buttonPinHandle)
    {
        System_abort("Error initializing button pins\n");
    }

    /* Setup callback for button pins */
    if (PIN_registerIntCb(buttonPinHandle, &buttonCallback) != 0)
    {
        System_abort("Error registering button callback function");
    }

    /* Register a packet received callback with the radio task */
    ConcentratorRadioTask_registerPacketReceivedCallback(packetReceivedCallback);

    /* set defauls for the ble advertiser settings */
    advertiser.sourceAddress = CONCENTRATOR_ADVERTISE_INVALID;
    advertiser.type = Concentrator_AdertiserNone;

    ConcentratorRadioTask_setAdvertiser(advertiser);

    //set selected node to 0
    selectedNode = 0;

    /* Enter main task loop */
    while (1)
    {
        /* Wait for event */
        uint32_t events = Event_pend(concentratorEventHandle, 0, CONCENTRATOR_EVENT_ALL, BIOS_WAIT_FOREVER);

        /* If we got a new ADC sensor value */
        if (events & CONCENTRATOR_EVENT_NEW_ADC_SENSOR_VALUE)
        {
            /* If we knew this node from before, update the value */
            if (isKnownNodeAddress(latestActiveAdcSensorNode.address))
            {
                updateNode(&latestActiveAdcSensorNode);
            }
            else
            {
                /* Else add it */
                addNewNode(&latestActiveAdcSensorNode);
            }

            /* Update the values on the LCD */
            updateLcd();
        }
#ifdef USE_BIM
        if (events & CONCENTRATOR_EVENT_FACTORY_RESET) {

            Display_control(hDisplayLcd, DISPLAY_CMD_TRANSPORT_CLOSE, NULL);

            BimFactoryReset_applyFactoryImage();

            /* BIM Factory Reset failed, reenable the LCD */
            Display_control(hDisplayLcd, DISPLAY_CMD_TRANSPORT_OPEN, NULL);

            /* Re-enable interrupts to detect button release. */
            PIN_setConfig(buttonPinHandle, PIN_BM_IRQ, Board_BUTTON0 | PIN_IRQ_NEGEDGE);
            PIN_setConfig(buttonPinHandle, PIN_BM_IRQ, Board_BUTTON1 | PIN_IRQ_NEGEDGE);
        }
#endif
    }
}

static void packetReceivedCallback(union ConcentratorPacket* packet, int8_t rssi)
{
    /* If we recived an ADC sensor packet, for backward compatibility */
    if (packet->header.packetType == RADIO_PACKET_TYPE_ADC_SENSOR_PACKET)
    {
        /* Save the values */
        latestActiveAdcSensorNode.address = packet->header.sourceAddress;
        latestActiveAdcSensorNode.latestAdcValue = packet->adcSensorPacket.adcValue;
        latestActiveAdcSensorNode.button = 0; //no button value in ADC packet
        latestActiveAdcSensorNode.latestRssi = rssi;

        Event_post(concentratorEventHandle, CONCENTRATOR_EVENT_NEW_ADC_SENSOR_VALUE);
    }
    /* If we recived an DualMode ADC sensor packet*/
    else if(packet->header.packetType == RADIO_PACKET_TYPE_DM_SENSOR_PACKET)
    {

        /* Save the values */
        latestActiveAdcSensorNode.address = packet->header.sourceAddress;
        latestActiveAdcSensorNode.latestAdcValue = packet->dmSensorPacket.adcValue;
        latestActiveAdcSensorNode.button = packet->dmSensorPacket.button;
        latestActiveAdcSensorNode.latestRssi = rssi;

        Event_post(concentratorEventHandle, CONCENTRATOR_EVENT_NEW_ADC_SENSOR_VALUE);
    }
}

static uint8_t isKnownNodeAddress(uint8_t address) {
    uint8_t found = 0;
    uint8_t i;
    for (i = 0; i < CONCENTRATOR_MAX_NODES; i++)
    {
        if (knownSensorNodes[i].address == address)
        {
            found = 1;
            break;
        }
    }
    return found;
}

static void updateNode(struct AdcSensorNode* node) {
    uint8_t i;
    for (i = 0; i < CONCENTRATOR_MAX_NODES; i++) {
        if (knownSensorNodes[i].address == node->address)
        {
            knownSensorNodes[i].latestAdcValue = node->latestAdcValue;
            knownSensorNodes[i].latestRssi = node->latestRssi;
            knownSensorNodes[i].button = node->button;
            break;
        }
    }
}

static void addNewNode(struct AdcSensorNode* node) {
    *lastAddedSensorNode = *node;

    /* Increment and wrap */
    lastAddedSensorNode++;
    if (lastAddedSensorNode > &knownSensorNodes[CONCENTRATOR_MAX_NODES-1])
    {
        lastAddedSensorNode = knownSensorNodes;
    }

    if(advertiser.sourceAddress == CONCENTRATOR_ADVERTISE_INVALID)
    {
        /* set first node as advertiser */
        advertiser.sourceAddress = node->address;
        ConcentratorRadioTask_setAdvertiser(advertiser);
    }
}

static void updateLcd(void) {
    struct AdcSensorNode* nodePointer = knownSensorNodes;
    uint8_t currentLcdLine;
    char selectedChar;

    Display_clear(hDisplayLcd);
    Display_print0(hDisplayLcd, 0, 0, "Nodes Value RSSI");

    //clear screen, put cuser to beggining of terminal and print the header
    Display_print0(hDisplaySerial, 0, 0, "\033[2J \033[0;0HNodes    Value    RSSI");

    /* Start on the second line */
    currentLcdLine = 1;

    /* Write one line per node */
    while ((nodePointer < &knownSensorNodes[CONCENTRATOR_MAX_NODES]) &&
          (nodePointer->address != 0) &&
          (currentLcdLine < CONCENTRATOR_DISPLAY_LINES))
    {
        if ( currentLcdLine == (selectedNode + 1))
        {
            selectedChar = '*';
        }
        else
        {
            selectedChar = ' ';
        }
        /* print to LCD */
        Display_print4(hDisplayLcd, currentLcdLine, 0, "%c0x%02x %04d  %04d", selectedChar,
                nodePointer->address, nodePointer->latestAdcValue, nodePointer->latestRssi);

        /* print to UART */
        Display_print4(hDisplaySerial, 0, 0, "%c0x%02x    %04d    %04d", selectedChar,
                nodePointer->address, nodePointer->latestAdcValue, nodePointer->latestRssi);

        nodePointer++;
        currentLcdLine++;
    }

    //if we have some nodes print the advertiser mode
    if (currentLcdLine > 1)
    {
        char advMode[16] = {0};

        /* print button status */
        if (knownSensorNodes[selectedNode].button)
        {
            Display_print0(hDisplayLcd, currentLcdLine, 0, "Button Pressed");
            Display_print0(hDisplaySerial, 0, 0, "Button Pressed");
        }
        else
        {
            Display_print0(hDisplayLcd, currentLcdLine, 0, "No Button Press");
            Display_print0(hDisplaySerial, 0, 0, "No Button Pressed");
        }


        if (advertiser.type == Concentrator_AdertiserMsUrl)
        {
             strncpy(advMode, "BLE MS + URL", 12);
        }
        else if (advertiser.type == Concentrator_AdertiserMs)
        {
             strncpy(advMode, "BLE MS", 6);
        }
        else if (advertiser.type == Concentrator_AdertiserUrl)
        {
             strncpy(advMode, "Eddystone URL", 13);
        }
        else if (advertiser.type == Concentrator_AdertiserUid)
        {
             strncpy(advMode, "Eddystone UID", 13);
        }
        else
        {
             strncpy(advMode, "BLE None", 8);
        }

        /* print to LCD */
        //Display_print0(hDisplayLcd, currentLcdLine+1, 0, "Adv Mode:");
        Display_print1(hDisplayLcd, currentLcdLine+1, 0, "%s", advMode);
        /* print to UART */
        Display_print1(hDisplaySerial, 0, 0, "Advertiser Mode: %s", advMode);
    }
}

/*
 *  ======== buttonCallback ========
 *  Pin interrupt Callback function board buttons configured in the pinTable.
 */
void buttonCallback(PIN_Handle handle, PIN_Id pinId)
{
    /* Debounce logic, only toggle if the button is still pushed (low) */
    CPUdelay(8000*50);

    if ((PIN_getInputValue(Board_BUTTON0) == 0) & (PIN_getInputValue(Board_BUTTON1) == 0))
    {
#ifdef USE_BIM
        //stop button interupts while checking ble bootload button hold
        PIN_setConfig(buttonPinHandle, PIN_BM_IRQ, Board_BUTTON0 | PIN_IRQ_DIS);
        PIN_setConfig(buttonPinHandle, PIN_BM_IRQ, Board_BUTTON1 | PIN_IRQ_DIS);
        //start BLE bootloader timer to check pins
        Clock_start(bleBootloadBtnCheckClockHandle);
#endif
    }
    else if (PIN_getInputValue(Board_BUTTON0) == 0)
    {
        //select node
        selectedNode++;
        if ( (selectedNode >CONCENTRATOR_MAX_NODES) ||
             (knownSensorNodes[selectedNode].address == 0) )
        {
            selectedNode = 0;
        }

        advertiser.type = Concentrator_AdertiserNone;
        advertiser.sourceAddress = knownSensorNodes[selectedNode].address;
        ConcentratorRadioTask_setAdvertiser(advertiser);

        //trigger LCD update
        Event_post(concentratorEventHandle, CONCENTRATOR_EVENT_NEW_ADC_SENSOR_VALUE);
    }
    else if (PIN_getInputValue(Board_BUTTON1) == 0)
    {
        //cycle between ms, url, uid and none
        advertiser.type++;
        if (advertiser.type == Concentrator_AdertiserTypeEnd)
        {
            advertiser.type = Concentrator_AdertiserNone;
        }

        //Set advertiemer
        ConcentratorRadioTask_setAdvertiser(advertiser);

        //trigger LCD update
        Event_post(concentratorEventHandle, CONCENTRATOR_EVENT_NEW_ADC_SENSOR_VALUE);
    }
}

#ifdef USE_BIM
static void bleBtnCheckTimerCallback(UArg arg0)
{
    static uint32_t btnHoldCnt = 0;

    if ((PIN_getInputValue(Board_BUTTON0) == 0) & (PIN_getInputValue(Board_BUTTON1) == 0))
    {
        if ( (++btnHoldCnt * NODE_BLE_BOOTLODER_BUTTON_CHECK_TIMER_MS) >
            (NODE_BLE_BOOTLODER_BUTTON_CHECK_DURATION_S*1000))
        {
            Event_post(concentratorEventHandle, CONCENTRATOR_EVENT_FACTORY_RESET);
            btnHoldCnt = 0;
        }
        else
        {
            Clock_start(bleBootloadBtnCheckClockHandle);
        }
    }
    else
    {
        btnHoldCnt = 0;
        /* Re-enable interrupts to detect button release. */
        PIN_setConfig(buttonPinHandle, PIN_BM_IRQ, Board_BUTTON0 | PIN_IRQ_NEGEDGE);
        PIN_setConfig(buttonPinHandle, PIN_BM_IRQ, Board_BUTTON1 | PIN_IRQ_NEGEDGE);
    }
}
#endif //USE_BIM
