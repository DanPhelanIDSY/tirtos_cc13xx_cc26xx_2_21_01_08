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
#include <xdc/std.h>
#include <xdc/runtime/System.h>

#include <DmConcentratorRadioTask.h>
#include <seb/SEB.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/knl/Semaphore.h>
#include <ti/sysbios/knl/Event.h>

/* Drivers */
#include <ti/drivers/rf/RF.h>
#include <ti/drivers/PIN.h>

/* Board Header files */
#include "Board.h"

#include "easylink/EasyLink.h"
#include "RadioProtocol.h"


/***** Defines *****/
#define CONCENTRATORRADIO_TASK_STACK_SIZE 1024
#define CONCENTRATORRADIO_TASK_PRIORITY   3

#define RADIO_EVENT_ALL                  0xFFFFFFFF
#define RADIO_EVENT_VALID_PACKET_RECEIVED      (uint32_t)(1 << 0)
#define RADIO_EVENT_INVALID_PACKET_RECEIVED (uint32_t)(1 << 1)

#define CONCENTRATORRADIO_MAX_RETRIES 2
#define NORERADIO_ACK_TIMEOUT_TIME_MS (160)


#define CONCENTRATOR_SUB1_ACTIVITY_LED Board_LED0
#define CONCENTRATOR_BLE_ACTIVITY_LED Board_LED1

#define CONCENTRATOR_0M_TXPOWER    -10

/***** Type declarations *****/



/***** Variable declarations *****/
static Task_Params concentratorRadioTaskParams;
Task_Struct concentratorRadioTask; /* not static so you can see in ROV */
static uint8_t concentratorRadioTaskStack[CONCENTRATORRADIO_TASK_STACK_SIZE];
Event_Struct radioOperationEvent;  /* not static so you can see in ROV */
static Event_Handle radioOperationEventHandle;

static ConcentratorRadio_PacketReceivedCallback packetReceivedCallback;
static union ConcentratorPacket latestRxPacket;
static EasyLink_TxPacket txPacket;
static struct AckPacket ackPacket;
static uint8_t concentratorAddress;
static int8_t latestRssi;

static ConcentratorAdvertiser bleAdveriser = {
        CONCENTRATOR_ADVERTISE_INVALID,
        Concentrator_AdertiserNone
};

/* The Eddystone UID spec advices to use the first 10 bytes of the sha-1 hash
 * of an owned domain or subdonmian. The subdomain of
 * http://www.ti.com/product/CC1350 = 792f082074ebc132032cad5fdaada66154e14e98 */
static uint8_t uidNameSpace[10] = {0x79, 0x2f, 0x08, 0x20, 0x74, 0xeb, 0xc1,
                                   0x32, 0x03, 0x2c};

/* uid Instance should be set to 6 LSB's of IEEE addr */
static uint8_t uidInstanceId[6] = {0};

/* propreitory advertisement packet */
static uint8_t localNameAdvertisement[] = {
        0x02, //Length of this Data section
        0x01, //<<Flags>>
        0x02, //LE General Discoverable Mode
        0x18, //Length of this Data section
        0x09, //<<Complete local name>>
        'C', 'C', '1', '3', '5', '0', ' ',
        'L', 'a', 'u', 'n', 'c', 'h',
        'p', 'a', 'd', ' ', '-', ' ', '0', 'x', '0', '0'
        };

/* propreitory advertisement packet */
static uint8_t propAdvertisement[] = {
        0x02, //Length of this section
        0x01, //<<Flags>>
        0x02, //LE General Discoverable Mode
        0x06, //Length of this section
        0xff, //<<Manufacturer Specific Data>>
        0x0d,
        0x00,
        0x03,
        0x00,
        0x00}; //BTN state

SimpleBeacon_Frame propAdvFrame;
SimpleBeacon_Frame localNameAdvFrame;

static uint8_t bleMacAddr[6];

/***** Prototypes *****/
static void concentratorRadioTaskFunction(UArg arg0, UArg arg1);
static void rxDoneCallback(EasyLink_RxPacket * rxPacket, EasyLink_Status status);
static void notifyPacketReceived(union ConcentratorPacket* latestRxPacket);
static void sendAck(uint8_t latestSourceAddress);
static void sendBleAdvertisement(struct DualModeSensorPacket sensorPacket);

/* Pin driver handle */
static PIN_Handle ledPinHandle;
static PIN_State ledPinState;

/* Configure LED Pin */
PIN_Config ledPinTable[] = {
        CONCENTRATOR_SUB1_ACTIVITY_LED | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW | PIN_PUSHPULL | PIN_DRVSTR_MAX,
        CONCENTRATOR_BLE_ACTIVITY_LED | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW | PIN_PUSHPULL | PIN_DRVSTR_MAX,
#ifdef __CC1350_LAUNCHXL_BOARD_H__
        Board_DIO1_RFSW | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW | PIN_PUSHPULL | PIN_DRVSTR_MAX,
        Board_DIO30_SWPWR | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW | PIN_PUSHPULL | PIN_DRVSTR_MAX,
#endif //__CC1350_LAUNCHXL_BOARD_H__
    PIN_TERMINATE
};

/***** Function definitions *****/
void ConcentratorRadioTask_init(void) {

    /* Open LED pins */
    ledPinHandle = PIN_open(&ledPinState, ledPinTable);
    if (!ledPinHandle)
    {
        System_abort("Error initializing board 3.3V domain pins\n");
    }

    /* Create event used internally for state changes */
    Event_Params eventParam;
    Event_Params_init(&eventParam);
    Event_construct(&radioOperationEvent, &eventParam);
    radioOperationEventHandle = Event_handle(&radioOperationEvent);

    /* Create the concentrator radio protocol task */
    Task_Params_init(&concentratorRadioTaskParams);
    concentratorRadioTaskParams.stackSize = CONCENTRATORRADIO_TASK_STACK_SIZE;
    concentratorRadioTaskParams.priority = CONCENTRATORRADIO_TASK_PRIORITY;
    concentratorRadioTaskParams.stack = &concentratorRadioTaskStack;
    Task_construct(&concentratorRadioTask, concentratorRadioTaskFunction, &concentratorRadioTaskParams, NULL);
}

void ConcentratorRadioTask_registerPacketReceivedCallback(ConcentratorRadio_PacketReceivedCallback callback) {
    packetReceivedCallback = callback;
}

void ConcentratorRadioTask_setAdvertiser(ConcentratorAdvertiser advertiser) {
    bleAdveriser.sourceAddress = advertiser.sourceAddress;
    bleAdveriser.type = advertiser.type;
}

static void concentratorRadioTaskFunction(UArg arg0, UArg arg1)
{
    /* Set mulitclient mode for Prop Sub1G */
    EasyLink_setCtrl(EasyLink_Ctrl_MultiClient_Mode, 1);

    /* Initialize EasyLink */
    if (EasyLink_init(RADIO_EASYLINK_MODULATION) != EasyLink_Status_Success)
    {
        System_abort("EasyLink_init failed");
    }


    /* If you wich to use a frequency other than the default use
     * the below API
     * EasyLink_setFrequency(868000000);
     */

    /* Set concentrator address */;
    concentratorAddress = RADIO_CONCENTRATOR_ADDRESS;
    EasyLink_enableRxAddrFilter(&concentratorAddress, 1, 1);

    /* Set up Ack packet */
    ackPacket.header.sourceAddress = concentratorAddress;
    ackPacket.header.packetType = RADIO_PACKET_TYPE_ACK_PACKET;

    /* initialise the Simple Beacon module called dirrectly for Prop Adv
     * Set multiclient mode to true
     */
    SimpleBeacon_init(true);

    /* initialise the Simple Eddystone Beacon module
     * Set multiclient mode to true
     */
    SEB_init(true);

    /* Set the Eddystone URL */
    SEB_initUrl("https://www.ti.com/product/cc1350", CONCENTRATOR_0M_TXPOWER);

    SimpleBeacon_getIeeeAddr(bleMacAddr);

    propAdvFrame.deviceAddress = bleMacAddr;
    propAdvFrame.length = sizeof(propAdvertisement);
    propAdvFrame.pAdvData = propAdvertisement;

    localNameAdvFrame.deviceAddress = bleMacAddr;
    localNameAdvFrame.length = sizeof(localNameAdvertisement);
    localNameAdvFrame.pAdvData = localNameAdvertisement;

#ifdef __CC1350_LAUNCHXL_BOARD_H__
    /* Enable power to RF switch to 2.4G antenna */
    PIN_setOutputValue(ledPinHandle, Board_DIO30_SWPWR, 1);
#endif //__CC1350_LAUNCHXL_BOARD_H__

    /* Enter receive */
    if (EasyLink_receiveAsync(rxDoneCallback, 0) != EasyLink_Status_Success) {
        System_abort("EasyLink_receiveAsync failed");
    }

    while (1)
    {
        uint32_t events = Event_pend(radioOperationEventHandle, 0, RADIO_EVENT_ALL, BIOS_WAIT_FOREVER);

        /* If valid packet received */
        if (events & RADIO_EVENT_VALID_PACKET_RECEIVED)
        {

            /* Send ack packet */
            sendAck(latestRxPacket.header.sourceAddress);

            /* Call packet received callback */
            notifyPacketReceived(&latestRxPacket);

            if ( (latestRxPacket.header.sourceAddress == bleAdveriser.sourceAddress) &&
                 (bleAdveriser.type != Concentrator_AdertiserNone) &&
                 (latestRxPacket.header.packetType == RADIO_PACKET_TYPE_DM_SENSOR_PACKET) )
            {
                uint8_t nodeAddress = latestRxPacket.header.sourceAddress;

                //convert nodeAddress to Ascii hex
                localNameAdvertisement[27] = ((nodeAddress & 0x0F) < 0xa) ?
                        (nodeAddress & 0x0F) + 0x30:
                        (nodeAddress & 0x0F) - 0xa + 0x41;
                localNameAdvertisement[26] = (((nodeAddress & 0xF0) >> 4) < 0xa) ?
                        ((nodeAddress & 0xF0) >> 4) + 0x30:
                        ((nodeAddress & 0xF0) >> 4) - 0xa + 0x41;

                //send ble avertisement
                sendBleAdvertisement(latestRxPacket.dmSensorPacket);
            }

            /* Go back to RX */
            if (EasyLink_receiveAsync(rxDoneCallback, 0) != EasyLink_Status_Success)
            {
                System_abort("EasyLink_receiveAsync failed");
            }

            /* toggle Sub1G Activity LED */
            PIN_setOutputValue(ledPinHandle, CONCENTRATOR_SUB1_ACTIVITY_LED,
                    !PIN_getOutputValue(CONCENTRATOR_SUB1_ACTIVITY_LED));
        }

        /* If invalid packet received */
        if (events & RADIO_EVENT_INVALID_PACKET_RECEIVED)
        {
            /* Go back to RX */
            if (EasyLink_receiveAsync(rxDoneCallback, 0) != EasyLink_Status_Success)
            {
                System_abort("EasyLink_receiveAsync failed");
            }
        }
    }
}

static void sendBleAdvertisement(struct DualModeSensorPacket sensorPacket)
{
    uint8_t txCnt, chan;

#ifdef __CC1350_LAUNCHXL_BOARD_H__
    //Swtich RF switch to 2.4G antenna
    PIN_setOutputValue(ledPinHandle, Board_DIO1_RFSW, 0);
#endif //__CC1350_LAUNCHXL_BOARD_H__

    //Prepare TLM frame interleaved with URL and UID
    if ((bleAdveriser.type == Concentrator_AdertiserUrl) ||
        (bleAdveriser.type == Concentrator_AdertiserMsUrl))
    {
        SEB_initTLM(sensorPacket.batt, sensorPacket.adcValue, sensorPacket.time100MiliSec);
    }

    if(bleAdveriser.type == Concentrator_AdertiserUid)
    {
        //Prepare TLM frame interleaved with URL and UID
        SEB_initTLM(sensorPacket.batt, sensorPacket.adcValue, sensorPacket.time100MiliSec);

        //Set uid intance for the eddystone UID frame
        uidInstanceId[0] = sensorPacket.header.sourceAddress;
        SEB_initUID(uidNameSpace, uidInstanceId, CONCENTRATOR_0M_TXPOWER);
    }

    for (txCnt = 0; txCnt < SimpleBeacon_AdvertisementTimes; txCnt++)
    {
        for (chan = 37; chan < 40; chan++)
        {
            if ((bleAdveriser.type == Concentrator_AdertiserMs) ||
                (bleAdveriser.type == Concentrator_AdertiserMsUrl))
            {
                //set BTN value in Prop advertisement
                propAdvertisement[9] = sensorPacket.button;

                //advertisement advertise local name
                SimpleBeacon_sendFrame(localNameAdvFrame,  1, (uint64_t) 1<<chan);
                //advertisement advertise button value
                SimpleBeacon_sendFrame(propAdvFrame, 1, (uint64_t) 1<<chan);
            }
            if ((bleAdveriser.type == Concentrator_AdertiserUrl)  ||
                (bleAdveriser.type == Concentrator_AdertiserMsUrl))
            {
                SEB_sendFrame(SEB_FrameType_Url, bleMacAddr, 1, (uint64_t) 1<<chan);
                SEB_sendFrame(SEB_FrameType_Tlm, bleMacAddr, 1, (uint64_t) 1<<chan);
            }
            if (bleAdveriser.type == Concentrator_AdertiserUid)
            {
                SEB_sendFrame(SEB_FrameType_Uuid, bleMacAddr, 1, (uint64_t) 1<<chan);
                SEB_sendFrame(SEB_FrameType_Tlm, bleMacAddr, 1, (uint64_t) 1<<chan);
            }
        }

        //sleep on all but last advertisement
        if(txCnt+1 < SimpleBeacon_AdvertisementTimes)
        {
            Task_sleep(SimpleBeacon_AdvertisementIntervals[txCnt]);
        }
    }

#ifdef __CC1350_LAUNCHXL_BOARD_H__
    //Swtich RF switch to Sub1G antenna
    PIN_setOutputValue(ledPinHandle, Board_DIO1_RFSW, 1);
#endif //__CC1350_LAUNCHXL_BOARD_H__

    /* Toggle activity LED */
    PIN_setOutputValue(ledPinHandle, CONCENTRATOR_BLE_ACTIVITY_LED,!PIN_getOutputValue(CONCENTRATOR_BLE_ACTIVITY_LED));
}

static void sendAck(uint8_t latestSourceAddress) {

    /* Set destinationAdress, but use EasyLink layers destination adress capability */
    txPacket.dstAddr[0] = latestSourceAddress;

    /* Copy ACK packet to payload, skipping the destination adress byte.
     * Note that the EasyLink API will implcitily both add the length byte and the destination address byte. */
    memcpy(txPacket.payload, &ackPacket.header, sizeof(ackPacket));
    txPacket.len = sizeof(ackPacket);

    /* Send packet  */
    if (EasyLink_transmit(&txPacket) != EasyLink_Status_Success)
    {
        System_abort("EasyLink_transmit failed");
    }
}

static void notifyPacketReceived(union ConcentratorPacket* latestRxPacket)
{
    if (packetReceivedCallback)
    {
        packetReceivedCallback(latestRxPacket, latestRssi);
    }
}

static void rxDoneCallback(EasyLink_RxPacket * rxPacket, EasyLink_Status status)
{
    union ConcentratorPacket* tmpRxPacket;

    /* If we received a packet successfully */
    if (status == EasyLink_Status_Success)
    {
        /* Save the latest RSSI, which is later sent to the receive callback */
        latestRssi = (int8_t)rxPacket->rssi;

        /* Check that this is a valid packet */
        tmpRxPacket = (union ConcentratorPacket*)(rxPacket->payload);

        /* If this is a known packet */
        if (tmpRxPacket->header.packetType == RADIO_PACKET_TYPE_ADC_SENSOR_PACKET)
        {
            /* Save packet */
            memcpy((void*)&latestRxPacket, &rxPacket->payload, sizeof(struct AdcSensorPacket));

            /* Signal packet received */
            Event_post(radioOperationEventHandle, RADIO_EVENT_VALID_PACKET_RECEIVED);
        }
        else if (tmpRxPacket->header.packetType == RADIO_PACKET_TYPE_DM_SENSOR_PACKET)
        {
            /* Save packet */
            memcpy((void*)&latestRxPacket, &rxPacket->payload, sizeof(struct DualModeSensorPacket));

            /* Signal packet received */
            Event_post(radioOperationEventHandle, RADIO_EVENT_VALID_PACKET_RECEIVED);
        }
        else
        {
            /* Signal invalid packet received */
            Event_post(radioOperationEventHandle, RADIO_EVENT_INVALID_PACKET_RECEIVED);
        }
    }
    else
    {
        /* Signal invalid packet received */
        Event_post(radioOperationEventHandle, RADIO_EVENT_INVALID_PACKET_RECEIVED);
    }
}
