/*
 * Copyright (c) 2015-2016, Texas Instruments Incorporated
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

/*
 *  ======== lcdSmartRF06EB.c ========
 */

/* XDCtools Header files */
#include <xdc/std.h>
#include <xdc/runtime/System.h>

/* BIOS Header files */
#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Clock.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/knl/Semaphore.h>

/* TI-RTOS Header files */
#include <ti/mw/lcd/LCDDogm1286.h>
#include <ti/drivers/Power.h>
#include <ti/drivers/power/PowerCC26XX.h>
#include <ti/drivers/SPI.h>



/* Example/Board Header files */
#include "Board.h"

#define TASKSTACKSIZE   768

LCD_Handle lcdHandle = NULL;
PIN_Handle pinHandle = NULL;

/* This application supports two LCD buffers */
Char lcdBuffer0[LCD_BYTES] = { 0 };
Char lcdBuffer1[LCD_BYTES] = { 0 };

Task_Struct task0Struct, task1Struct;
Char task0Stack[TASKSTACKSIZE], task1Stack[TASKSTACKSIZE];
Task_Handle lcdLowPriorityTask, lcdHighPriorityTask;
Semaphore_Struct sem0Struct;
Semaphore_Handle lcdHighPrioritySem;

/*
 * Populate LCD_Buffer structure with buffer pointers and buffer sizes.
 * The Semaphore structure will be constructed when opening the LCD.
 */
LCD_Buffer lcdBuffers[] = {
        { lcdBuffer0, LCD_BYTES, {NULL} },
        { lcdBuffer1, LCD_BYTES, {NULL} },
};
/*
 * Application pin configuration table:
 *   - The LCD powr domain is enabled.
 *   - LEDs are off.
 *   - Down button interrupt set to trigger on falling edge.
 */
PIN_Config pinTable[] = {
    Board_LED1     | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW  | PIN_PUSHPULL | PIN_DRVSTR_MAX,
    Board_LED2     | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW  | PIN_PUSHPULL | PIN_DRVSTR_MAX,
    Board_LED3     | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW  | PIN_PUSHPULL | PIN_DRVSTR_MAX,
    Board_LED4     | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW  | PIN_PUSHPULL | PIN_DRVSTR_MAX,
    Board_KEY_DOWN | PIN_INPUT_EN       | PIN_PULLUP    | PIN_IRQ_NEGEDGE,
    Board_3V3_EN   | PIN_GPIO_OUTPUT_EN | PIN_GPIO_HIGH | PIN_PUSHPULL,
    PIN_TERMINATE
};

/*
 * ======== gpioButtonFxn ========
 *  Board_BUTTON0 callback function to unblock the high priority task.
 *
 */
void gpioButtonFxn(PIN_Handle handle, PIN_Id pinId) {
    /* Unblock the high priority task */
    Semaphore_post(lcdHighPrioritySem);
}

/*
 * ======== lcdHighPriorityFxn ========
 *  High priority task LCD function.  The task for this function is created
 *  statically, see the project's .cfg file.
 *
 */
Void lcdHighPriorityFxn(UArg a0, UArg a1) {
    while (1) {
        /*
         * Wait on semaphore.  The semaphore is created statically, see the
         * project's .cfg file.
         */
        Semaphore_pend(lcdHighPrioritySem, BIOS_WAIT_FOREVER);

        /* Toggle Board_LED2 */
        PIN_setOutputValue(pinHandle, Board_LED2, !PIN_getOutputValue(Board_LED2));

        /* Write high priority task message to buffer and send it to the LCD */
        LCD_bufferClear(lcdHandle, 0);
        LCD_bufferPrintString(lcdHandle, 0, "This is a LCD example", 0, LCD_PAGE0);
        LCD_bufferPrintString(lcdHandle, 0, "High Priority Task", 0, LCD_PAGE1);
        LCD_bufferPrintString(lcdHandle, 0, "Writing to Buffer 0", 0, LCD_PAGE2);
        LCD_bufferPrintStringAligned(lcdHandle, 0, "***", LCD_ALIGN_CENTER, LCD_PAGE4);
        LCD_bufferPrintStringAligned(lcdHandle, 0, "*", LCD_ALIGN_CENTER, LCD_PAGE5);
        LCD_bufferPrintStringAligned(lcdHandle, 0, "***", LCD_ALIGN_CENTER, LCD_PAGE6);
        LCD_update(lcdHandle, 0);
    }
}

/*
 *  ======== lcdLowPriorityFxn ========
 *  Low priority task LCD function.  The task for this function is created
 *  statically, see the project's .cfg file.
 *
 */
Void lcdLowPriorityFxn(UArg a0, UArg a1) {
    LCD_Params lcdParams;
    PIN_State  pinState;
    uint32_t   counter = 0;

    /* Open the PIN driver */
    pinHandle = PIN_open(&pinState, pinTable);

    /* Register callback on Board_BUTTON0 */
    PIN_registerIntCb(pinHandle, &gpioButtonFxn);

    /* Open LCD driver instance */
    if (!lcdHandle) {
        LCD_Params_init(&lcdParams);
        lcdParams.spiBitRate = 1000000;
        lcdHandle = LCD_open(lcdBuffers, 2, &lcdParams);
        if (!lcdHandle) {
            System_abort("Error initializing LCD\n");
        }
    }

    /* Write welcome message to buffer and send it to the LCD */
    LCD_bufferClear(lcdHandle, 1);
    LCD_bufferPrintString(lcdHandle, 1, "Hello SmartRF06EB!", 0, LCD_PAGE0);
    LCD_bufferPrintString(lcdHandle, 1, "Low Priority Task", 0, LCD_PAGE1);
    LCD_bufferPrintString(lcdHandle, 1, "Writing to Buffer 1", 0, LCD_PAGE2);
    LCD_update(lcdHandle, 1);

    while (1) {
        /* Toggle Board_LED1 */
        PIN_setOutputValue(pinHandle, Board_LED1, !PIN_getOutputValue(Board_LED1));
        counter++;

        if (!(counter % 4)) {
            /* Print on every 4th count */
            LCD_bufferPrintString(lcdHandle, 1, "Count value is:", 0, LCD_PAGE4);
            LCD_bufferClearPage(lcdHandle, 1, LCD_PAGE5);
            LCD_bufferPrintInt(lcdHandle, 1, counter, 1, LCD_PAGE5);
            LCD_bufferClearPage(lcdHandle, 1, LCD_PAGE6);
            LCD_update(lcdHandle, 1);
        } else {
            /* Update the count on the LCD */
            LCD_writeLine(lcdHandle, 1, "Dec", counter, 10, LCD_PAGE4);
            LCD_writeLine(lcdHandle, 1, "Bin", counter, 2, LCD_PAGE5);
            LCD_writeLine(lcdHandle, 1, "Hex", counter, 16, LCD_PAGE6);
        }

        /* Sleep for 5 seconds before updating the LCD */
        Task_sleep(5000000 / Clock_tickPeriod);
    }
}

/*
 *  ======== main ========
 *
 */
int main(void)
{
    Task_Params taskParams;
    Semaphore_Params semParams;

    /* Call board init functions */
    Board_initGeneral();
    SPI_init();

    /* Construct lcd Task threads */
    Task_Params_init(&taskParams);
    taskParams.stackSize = TASKSTACKSIZE;
    taskParams.stack = &task0Stack;
    taskParams.priority = 2;
    taskParams.instance->name = "lcdHighPriorityFxn";
    Task_construct(&task0Struct, (Task_FuncPtr)lcdHighPriorityFxn, &taskParams, NULL);
    lcdHighPriorityTask = Task_handle(&task0Struct);

    taskParams.stack = &task1Stack;
    taskParams.priority = 1;
    taskParams.instance->name = "lcdLowPriorityFxn";
    Task_construct(&task1Struct, (Task_FuncPtr)lcdLowPriorityFxn, &taskParams, NULL);
    lcdLowPriorityTask = Task_handle(&task1Struct);

    Semaphore_Params_init(&semParams);
    semParams.mode = Semaphore_Mode_BINARY;
    Semaphore_construct(&sem0Struct, 0, &semParams);
    lcdHighPrioritySem = Semaphore_handle(&sem0Struct);

    /* Start BIOS */
    BIOS_start();

    return (0);
}
