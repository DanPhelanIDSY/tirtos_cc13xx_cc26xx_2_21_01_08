//*****************************************************************************
//! @file       pinStandby.c
//! @brief      Pin standby example.
//!
//  Copyright (C) 2015-2016 Texas Instruments Incorporated - http://www.ti.com/
//
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions
//  are met:
//
//    Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//
//    Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in the
//    documentation and/or other materials provided with the distribution.
//
//    Neither the name of Texas Instruments Incorporated nor the names of
//    its contributors may be used to endorse or promote products derived
//    from this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
//  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
//  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
//  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
//  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
//  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
//  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
//  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
//  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
//  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//****************************************************************************/

//******************************************************************************
//! This example will cycle the device between active and standby states.
//! The CPU will toggle the LEDs each time it wakes up from standby,
//! using the PIN driver, and then immediately return to standby.
//! The time the device stays in standby is by default set to 5s; this can be
//! modified by changing the 'standbyDurationUs' variable.
//!
//! Note that if the standbyDurationUs is set to < 1ms, the device will actually
//! enter idle instead of standby, since there won't be sufficient time to
//! enter/exit standby.
//!
//! Note that if you are measuring power consumption during standby, it will be
//! higher when the LEDs are on, and will be much lower when the LEDs are off.
//!
//! Note that in order to get lowest standby current, the JTAG pins TMS and TCK
//! should be disconnected after programming the device by removing the
//! jumpers on P408 of the SmartRF06 EB. TMS and TCK have internal pull-ups and
//! are driven low when inactive from the emulator, hence after programming the
//! device these jumpers should be removed to avoid the extra leakage current.
//*****************************************************************************/

//******************************************************************************
// Includes
//*****************************************************************************/
#include <xdc/std.h>
#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Clock.h>
#include <ti/sysbios/knl/Task.h>
#include <Board.h>
#include <ti/drivers/pin/PINCC26XX.h>

//******************************************************************************
// Globals
//*****************************************************************************/
/* Task and task stack */
Task_Struct myTask;
Char myTaskStack[512];

/* Led pin table */
PIN_Config LedPinTable[] =
{
    Board_LED0    | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW | PIN_PUSHPULL | PIN_DRVSTR_MAX, /* LED initially off */
    Board_LED1    | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW | PIN_PUSHPULL | PIN_DRVSTR_MAX, /* LED initially off */
    PIN_TERMINATE                                                                      /* Terminate list */
};

/*!*****************************************************************************
 *  @brief      Task which repeatedly sleeps for a duration, to allow repeated
 *              entry/exit from standby.  The LED states are toggled on each
 *              iteration.
 *
 *  @param      UArg a0 : Not used
 *
 *  @param      UArg a1 : Not used
 *
 *  @return     none - Should never return
 ******************************************************************************/
static void taskFxn(UArg a0, UArg a1)
{
    /* Locals */
    PIN_State pinState;
    PIN_Handle hPin;
    uint_t currentOutputVal;
    uint32_t standbyDurationUs = 5000000;

    /* Allocate LED pins */
    hPin = PIN_open(&pinState, LedPinTable);

    /* Loop forever */
    while(TRUE)
    {
        /* Sleep, to let the power policy transition the device to standby */
        Task_sleep(standbyDurationUs / Clock_tickPeriod);

        /* Read current output value for all pins */
        currentOutputVal =  PIN_getPortOutputValue(hPin);

        /* Toggle the LEDs, configuring all LEDs at once */
        PIN_setPortOutputValue(hPin, ~currentOutputVal);
    }
}

/*!*****************************************************************************
 *  @brief      Application main entry point
 *
 *  @param      none
 *
 *  @return     int - Should never return
 ******************************************************************************/
int main(void)
{
    /* Locals */
    Task_Params taskParams;

    /* Do PIN init before starting the kernel */
    PIN_init(BoardGpioInitTable);

    /* Configure task. */
    Task_Params_init(&taskParams);
    taskParams.stack = myTaskStack;
    taskParams.stackSize = sizeof(myTaskStack);
    Task_construct(&myTask, taskFxn, &taskParams, NULL);

    /* Start kernel. */
    BIOS_start();

    /* Should never get here; include a return to keep the compiler happy */
    return 0;
}
