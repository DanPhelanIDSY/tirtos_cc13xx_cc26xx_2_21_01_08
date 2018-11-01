/*
 * Copyright (c) 2015, Texas Instruments Incorporated
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

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/drivers/Power.h>

/* Drivers */
#include <ti/drivers/UART.h>
#include <ti/drivers/PIN.h>
#include <ti/drivers/rf/RF.h>

/* Local Header files */
#include "Board.h"
#include "smartrf_settings/smartrf_settings.h"


/***** Defines *****/
#define CW_TASK_STACK_SIZE 1024
#define CW_TASK_PRIORITY   2



/***** Prototypes *****/
static void cwTaskFunction(UArg arg0, UArg arg1);

/***** Variable declarations *****/
Task_Struct cwTask;    /* not static so you can see in ROV */
static Task_Params cwTaskParams;
static uint8_t cwTaskStack[CW_TASK_STACK_SIZE];

static RF_Object rfObject;
static RF_Handle rfHandle;



/***** Function definitions *****/
void CwTask_init(void) {
    Task_Params_init(&cwTaskParams);
    cwTaskParams.stackSize = CW_TASK_STACK_SIZE;
    cwTaskParams.priority = CW_TASK_PRIORITY;
    cwTaskParams.stack = &cwTaskStack;

    Task_construct(&cwTask, cwTaskFunction, &cwTaskParams, NULL);
}

static void cwTaskFunction(UArg arg0, UArg arg1)
{
    /* Configure the radio for Proprietary mode */
    RF_Params rfParams;
    RF_Params_init(&rfParams);

    /* Explicitly configure CW (1) or Modulated (0). Default modulated mode is PRBS-15. */
    RF_cmdTxTest.config.bUseCw = 1;

    /* In order to achieve +14dBm output power, make sure .txPower = 0xa73f, and
    that the define CCFG_FORCE_VDDR_HH = 0x1 in ccfg.c */

    /* Request access to the radio */
    rfHandle = RF_open(&rfObject, &RF_prop, (RF_RadioSetup*)&RF_cmdPropRadioDivSetup, &rfParams);

    /* Send CMD_FS and wait until it has completed */
    RF_runCmd(rfHandle, (RF_Op*)&RF_cmdFs, RF_PriorityNormal, NULL, 0);

    /* Send CMD_TX_TEST which sends forever */
    RF_runCmd(rfHandle, (RF_Op*)&RF_cmdTxTest, RF_PriorityNormal, NULL, 0);

    /* Should never come here */
    while (1);
}

/*
 *  ======== main ========
 */
int main(void)
{
    /* Call board init functions. */
    Board_initGeneral();

    /* Initialize tasks */
    CwTask_init();

    /* Start BIOS */
    BIOS_start();

    return (0);
}
