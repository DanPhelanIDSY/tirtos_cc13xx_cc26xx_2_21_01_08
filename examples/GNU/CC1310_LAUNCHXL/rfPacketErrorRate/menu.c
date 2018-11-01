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

/* XDCtools Header files */
#include <xdc/runtime/Assert.h>
#include <xdc/runtime/System.h>
#include <xdc/std.h>

/* BIOS Header files */
#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Event.h>
#include <ti/sysbios/knl/Task.h>

/* Middleware Header files */
#include <ti/mw/display/Display.h>

/* Application specific Header files */
#include "menu.h"

/***** Defines *****/

/* Task and event configuration */
#define MENU_TASK_STACKSIZE     2048


#if defined __CC1350_LAUNCHXL_BOARD_H__
extern PIN_Handle buttonPinHandle;
#endif

/***** Variable declarations *****/
const char* const MENU_TASK_NAME = "menuTask";
uint8_t taskStack[MENU_TASK_STACKSIZE];
Task_Struct menu_task;
Event_Struct menu_event;
const char* const MENU_EVENT_NAME = "menuEvent";

/* Menu row indices */
typedef enum
{
    TitleRow = 0,
    TestCaseRow,
    FrequencyRow,
    PacketCountRow,
    OperationModeRow,
    StartRow,
    NrOfMainMenuRows,
} MenuIndex;

/* String constants for different boards */
#if defined CC1310EM_7XD_7793
    static const char* const button0Text = "UP";
    static const char* const button1Text = "DOWN";
#elif defined __CC2650EM_7ID_H__
    static const char* const button0Text = "UP";
    static const char* const button1Text = "DOWN";
#elif defined __CC1310_LAUNCHXL_BOARD_H__
    static const char* const button0Text = "BTN-1";
    static const char* const button1Text = "BTN-2";
#elif defined __CC1350_LAUNCHXL_BOARD_H__
    static const char* const button0Text = "BTN-1";
    static const char* const button1Text = "BTN-2";
#elif defined __CC2650_LAUNCHXL_BOARD_H__
    static const char* const button0Text = "BTN-1";
    static const char* const button1Text = "BTN-2";
#elif defined __CC1350STK_SENSORTAG_BOARD_H__
    static const char* const button0Text = "LEFT";
    static const char* const button1Text = "RIGHT";
#else
    #error This board is not supported.
#endif

/* Convenience macros for printing on a vt100 terminal via UART */
#define vt100_print0(handle, row, col, text) \
    Display_print2(handle, 0, 0, "\x1b[%d;%df" text, row+1, col+1)

#define vt100_print1(handle, row, col, formatString, arg1) \
    Display_print3(handle, 0, 0, "\x1b[%d;%df" formatString, row+1, col+1, arg1)

#define vt100_print2(handle, row, col, formatString, arg1, arg2) \
    Display_print4(handle, 0, 0, "\x1b[%d;%df" formatString, row+1, col+1, arg1, arg2)

#define vt100_clear(handle) \
    Display_print0(handle, 0, 0, "\x1b[2J\x1b[H")

#define vt100_setCursorVisible(handle, visible) \
    Display_print1(handle, 0, 0, "\x1b[?25%c", ((visible) == true) ? 'h' : 'l')

/* Holds the configuration for the current test case */
static ApplicationConfig config =
{
    RfSetup_Fsk,
    OperationMode_Rx,
    10,
    0,
    0
};

static Display_Handle lcdDisplay;
static Display_Handle uartDisplay;

/***** Prototypes *****/

/* Menu task main function */
void menu_runTask(UArg arg0, UArg arg1);

/*
Sets up tasks and kernel resources.

All RF examples use dynamic creation during run-time. A more convenient way would be
static creation. Please refer to 'Creating Tasks Statically' in the SysBIOS User's Guide.
 */
void menu_init()
{
    Task_Params taskParams;
    Task_Params_init(&taskParams);
    taskParams.instance->name = (xdc_String)MENU_TASK_NAME;
    taskParams.stackSize = MENU_TASK_STACKSIZE;
    taskParams.stack = taskStack;
    Task_construct(&menu_task, (Task_FuncPtr)&menu_runTask, &taskParams, NULL);

    Event_Params eventParams;
    Event_Params_init(&eventParams);
    eventParams.instance->name = (xdc_String)(MENU_EVENT_NAME);
    Event_construct(&menu_event, &eventParams);
}

bool menu_isButtonPressed()
{
    return (Event_pend(Event_handle(&menu_event), Event_Id_NONE, MenuEvent_AnyButtonPushed,
            BIOS_NO_WAIT) & MenuEvent_AnyButtonPushed) != 0;
}

/*
Menu task function.

This task contains the main application logic. It prints the menu on both,
LCD and UART and starts the RX and TX test cases.
The setup code is generated from the .cfg file.

*/
void menu_runTask(UArg arg0, UArg arg1)
{
    uint8_t cursorRow = TestCaseRow;
    uint8_t packetIndex = 0;

    config.frequencyTable = config_frequencyTable_Lut[config.rfSetup];

    /* Init displays */
    Display_Params params;
    Display_Params_init(&params);
    params.lineClearMode = DISPLAY_CLEAR_NONE;

    lcdDisplay = Display_open(Display_Type_LCD, &params);
    Assert_isTrue(lcdDisplay != NULL, NULL);
    Display_clear(lcdDisplay);

    uartDisplay = Display_open(Display_Type_UART, &params);
    Assert_isTrue(uartDisplay != NULL, NULL);
    vt100_clear(uartDisplay);
    vt100_setCursorVisible(uartDisplay, false);

    /* Splash screen */
    Display_print0(lcdDisplay, 0, 0, "PER TEST");
    Display_print0(lcdDisplay, 1, 0, "Version 2.0");
    Display_print1(lcdDisplay, 3, 0, "Select:   %s", button0Text);
    Display_print1(lcdDisplay, 4, 0, "Navigate: %s", button1Text);
    Display_print0(lcdDisplay, 6, 0, "Push a button");
    Display_print0(lcdDisplay, 7, 0, "to proceed...");

    vt100_print0(uartDisplay, 0, 0, "PER TEST");
    vt100_print0(uartDisplay, 1, 0, "Version 2.0");
    vt100_print1(uartDisplay, 3, 0, "Select:   %s", button0Text);
    vt100_print1(uartDisplay, 4, 0, "Navigate: %s", button1Text);
    vt100_print0(uartDisplay, 6, 0, "Push a button");
    vt100_print0(uartDisplay, 7, 0, "to proceed...");

    Event_pend(Event_handle(&menu_event), Event_Id_NONE, (MenuEvent_AnyButtonPushed), BIOS_WAIT_FOREVER);
    Display_clear(lcdDisplay);
    vt100_clear(uartDisplay);

    while(true)
    {
        /* Main Menu */
        Display_print0(lcdDisplay, 0, 0, "Main Menu");
        Display_print1(lcdDisplay, TestCaseRow, 0,      " Test: %s", config_rfSetupLabels[config.rfSetup]);
        Display_print1(lcdDisplay, FrequencyRow, 0,     " Freq: %s", config.frequencyTable[config.frequency].label);
        Display_print1(lcdDisplay, PacketCountRow, 0,   " Pkts: %-5d", config.packetCount);
        Display_print1(lcdDisplay, OperationModeRow, 0, " Mode: %s", config_opmodeLabels[config.operationMode]);
        Display_print0(lcdDisplay, StartRow, 0, " Start...");

        vt100_print0(uartDisplay, 0, 0, "Main Menu");
        vt100_print1(uartDisplay, TestCaseRow, 0,      " Test: %s", config_rfSetupLabels[config.rfSetup]);
        vt100_print1(uartDisplay, FrequencyRow, 0,     " Freq: %s", config.frequencyTable[config.frequency].label);
        vt100_print1(uartDisplay, PacketCountRow, 0,   " Pkts: %-5d", config.packetCount);
        vt100_print1(uartDisplay, OperationModeRow, 0, " Mode: %s", config_opmodeLabels[config.operationMode]);
        vt100_print0(uartDisplay, StartRow, 0, " Start...");

        /* Print the selector */
        Display_print0(lcdDisplay, cursorRow, 0, ">");
        vt100_print0(uartDisplay, cursorRow, 0, ">" "\x1b[1A"); // Overlay selector and cursor

        /* Navigation is done event based. Events are created from button interrupts */
        UInt events = Event_pend(Event_handle(&menu_event), Event_Id_NONE, (MenuEvent_Navigate + MenuEvent_Select), BIOS_WAIT_FOREVER);
        if (events & MenuEvent_Navigate)
        {
            cursorRow++;
            if (cursorRow >= NrOfMainMenuRows)
            {
                cursorRow = TestCaseRow;
            }
        }
        if (events & MenuEvent_Select)
        {
            switch(cursorRow)
            {
                case TestCaseRow:

                    config.rfSetup = (RfSetup)((config.rfSetup + 1) % NrOfRfSetups);
                    config.frequencyTable = config_frequencyTable_Lut[config.rfSetup];
                    config.frequency = 0;

#if defined __CC1350_LAUNCHXL_BOARD_H__
                    if(config.rfSetup == RfSetup_Ble)
                    {
                        //Enable power to RF switch to 2.4G antenna
                        PIN_setOutputValue(buttonPinHandle, Board_DIO30_SWPWR, 1);
                        //Swtich RF switch to 2.4G antenna
                        PIN_setOutputValue(buttonPinHandle, Board_DIO1_RFSW, 0);
                    }
                    else
                    {
                        //Enable power to RF switch to 2.4G antenna
                        PIN_setOutputValue(buttonPinHandle, Board_DIO30_SWPWR, 1);
                        //Swtich RF switch to Sub1G antenna
                        PIN_setOutputValue(buttonPinHandle, Board_DIO1_RFSW, 1);
                    }
#endif
                    break;

                case FrequencyRow:
                    //custom settings only use the freq from Smartrf settings
                    if (config.rfSetup != RfSetup_Custom)
                    {
                        config.frequency = (config.frequency + 1);
                        if(config.frequencyTable[config.frequency].frequency == 0xFFFF)
                        {
                            config.frequency = 0;
                        }
                    }
                    break;

            case PacketCountRow:

                packetIndex = (packetIndex + 1) % config_NrOfPacketCounts;
                config.packetCount = config_packetCountTable[packetIndex];
                break;

            case OperationModeRow:

                config.operationMode = (OperationMode)((config.operationMode + 1) % NrOfOperationModes);
                break;

            case StartRow:

                if (config.operationMode == OperationMode_Rx)
                {
                    /* Prepare rx display */
                    Display_clear(lcdDisplay);
                    Display_print0(lcdDisplay, 0, 0, "Receiving...");
                    Display_print2(lcdDisplay, 1, 0, "%s %s",
                            config_rfSetupLabels[config.rfSetup],
                            config.frequencyTable[config.frequency].label);
                    Display_print1(lcdDisplay, 2, 0, "Pkts ok   :%-5d", 0);
                    Display_print0(lcdDisplay, 3, 0, "RSSI [dBm]:n/a");
                    Display_print0(lcdDisplay, 4, 0, "PER  [%%]  :n/a");
                    Display_print0(lcdDisplay, 6, 0, "Push a button");
                    Display_print0(lcdDisplay, 7, 0, "to abort.");

                    vt100_clear(uartDisplay);
                    vt100_print0(uartDisplay, 0, 0, "Receiving...");
                    vt100_print2(uartDisplay, 1, 0, "%s %s",
                            config_rfSetupLabels[config.rfSetup],
                            config.frequencyTable[config.frequency].label);
                    vt100_print1(uartDisplay, 2, 0, "Pkts ok   : %-5d", 0);
                    vt100_print0(uartDisplay, 3, 0, "RSSI [dBm]: n/a");
                    vt100_print0(uartDisplay, 4, 0, "PER  [%%]  : n/a");
                    vt100_print0(uartDisplay, 6, 0, "Push a button");
                    vt100_print0(uartDisplay, 7, 0, "to abort.");

                    /* Run the test. We are not interersted in the result. */
                    rx_runRxTest(&config);
                }
                else
                {
                    /* Prepare tx display */
                    Display_clear(lcdDisplay);
                    Display_print0(lcdDisplay, 0, 0, "Sending...");
                    Display_print2(lcdDisplay, 1, 0, "%s %s",
                            config_rfSetupLabels[config.rfSetup],
                            config.frequencyTable[config.frequency].label);
                    Display_print1(lcdDisplay, 3, 0, "Pkts sent: %-5d", 0);

                    vt100_clear(uartDisplay);
                    vt100_print0(uartDisplay, 0, 0, "Sending...");
                    vt100_print2(uartDisplay, 1, 0, "%s %s",
                            config_rfSetupLabels[config.rfSetup],
                            config.frequencyTable[config.frequency].label);
                    vt100_print1(uartDisplay, 3, 0, "Pkts sent: %-5d", 0);

                    /* Run the test. */
                    TestResult result = tx_runTxTest(&config);
                    if (result == TestResult_Aborted)
                    {
                        Display_print0(lcdDisplay, 6, 0, "...aborted.");
                        vt100_print0(uartDisplay, 6, 0, "...aborted.");
                    }
                    else if (result == TestResult_Finished)
                    {
                        Display_print0(lcdDisplay, 6, 0, "...finished.");
                        vt100_print0(uartDisplay, 6, 0, "...finished.");
                    }
                    Display_print0(lcdDisplay, 7, 0, "Push a button...");
                    vt100_print0(uartDisplay, 7, 0, "Push a button...");
                    Event_pend(Event_handle(&menu_event), Event_Id_NONE, (MenuEvent_AnyButtonPushed), BIOS_WAIT_FOREVER);
                }
                Display_clear(lcdDisplay);
                vt100_clear(uartDisplay);
                break;
            }
        }
    }
}

/*
Callback for button interrupts.

This function is supposed to be called asynchronously from within an interrupt
handler and signals a button press event to the application logic.
*/
void menu_notifyButtonPressed(Button button)
{
    if (button == Button_Navigate)
    {
        Event_post(Event_handle(&menu_event), MenuEvent_Navigate);
    }
    else
    {
        Event_post(Event_handle(&menu_event), MenuEvent_Select);
    }
}

/*
Updates the screen content during an ongoing receive.

Call this function from any other task to refresh the menu with
updated parameters.
*/
void menu_updateRxScreen(uint32_t packetsReceived, int8_t rssi)
{
    char buffer[6];

    /* Convert float to string buffer */
    if (packetsReceived <= config.packetCount)
    {
        float per = (float)((config.packetCount - packetsReceived) * 100.0f / config.packetCount);
        System_snprintf(buffer, 6, "%.2f", per);
    }
    else
    {
        System_sprintf(buffer, "n/a  ");
    }

    Display_print1(lcdDisplay, 2, 11, "%-5d", packetsReceived);
    Display_print1(lcdDisplay, 3, 11, "%-5i", rssi);
    Display_print1(lcdDisplay, 4, 11, "%s", &buffer);

    vt100_print1(uartDisplay, 2, 0, "Pkts ok   : %-5d", packetsReceived);
    vt100_print1(uartDisplay, 3, 0, "RSSI [dBm]: %-5i", rssi);
    vt100_print1(uartDisplay, 4, 0, "PER  [%%]  : %s", &buffer);
}

/*
Updates the screen content during an ongoing transmission.

Call this function from any other task to refresh the menu with
updated parameters.

 */
void menu_updateTxScreen(uint32_t packetsSent)
{
    Display_print1(lcdDisplay, 3, 11, "%-5d", packetsSent);
    vt100_print1(uartDisplay, 3, 11, "%-5d", packetsSent);
}
