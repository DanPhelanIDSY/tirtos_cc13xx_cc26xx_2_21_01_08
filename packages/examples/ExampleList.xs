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
 *  ======== ExampleList.xs ========
 */

var cc3x00COpts = " -I" + prodList["tidrivers"].packages + "/ti/mw/wifi/cc3x00/oslib" +
    " -I" + prodList["tidrivers"].packages + "/ti/mw/wifi/cc3x00/simplelink" +
    " -I" + prodList["tidrivers"].packages + "/ti/mw/wifi/cc3x00/simplelink/include" +
    " -DSL_FULL -DSL_PLATFORM_MULTI_THREADED";

var msp430GrLibPath = prodList["msp430GrLib"].dir;
var msp430GrlibFiles = [
    {path: msp430GrLibPath + "/src/grlib/button.c",      targetDirectory: "grlib"},
    {path: msp430GrLibPath + "/src/grlib/button.h",      targetDirectory: "grlib"},
    {path: msp430GrLibPath + "/src/grlib/checkbox.c",    targetDirectory: "grlib"},
    {path: msp430GrLibPath + "/src/grlib/checkbox.h",    targetDirectory: "grlib"},
    {path: msp430GrLibPath + "/src/grlib/circle.c",      targetDirectory: "grlib"},
    {path: msp430GrLibPath + "/src/grlib/context.c",     targetDirectory: "grlib"},
    {path: msp430GrLibPath + "/src/grlib/display.c",     targetDirectory: "grlib"},
    {path: msp430GrLibPath + "/src/grlib/grlib.h",       targetDirectory: "grlib"},
    {path: msp430GrLibPath + "/src/grlib/image.c",       targetDirectory: "grlib"},
    {path: msp430GrLibPath + "/src/grlib/imageButton.c", targetDirectory: "grlib"},
    {path: msp430GrLibPath + "/src/grlib/imageButton.h", targetDirectory: "grlib"},
    {path: msp430GrLibPath + "/src/grlib/line.c",        targetDirectory: "grlib"},
    {path: msp430GrLibPath + "/src/grlib/radioButton.c", targetDirectory: "grlib"},
    {path: msp430GrLibPath + "/src/grlib/radioButton.h", targetDirectory: "grlib"},
    {path: msp430GrLibPath + "/src/grlib/rectangle.c",   targetDirectory: "grlib"},
    {path: msp430GrLibPath + "/src/grlib/string.c",      targetDirectory: "grlib"}
];

var msp430UsbLibPath = prodList["msp430UsbLib"].dir + "/MSP430_USB_Software/MSP430_USB_API/USB_API";
var msp430UsbLibFiles = [
    /* USB_CDC_API */
    {path: msp430UsbLibPath + "/USB_CDC_API/UsbCdc.c",             targetDirectory: "USB_API/USB_CDC_API"},
    {path: msp430UsbLibPath + "/USB_CDC_API/UsbCdc.h",             targetDirectory: "USB_API/USB_CDC_API"},
    /* USB_Common */
    {path: msp430UsbLibPath + "/USB_Common/defMSP430USB.h",        targetDirectory: "USB_API/USB_Common"},
    {path: msp430UsbLibPath + "/USB_Common/device.h",              targetDirectory: "USB_API/USB_Common"},
    {path: msp430UsbLibPath + "/USB_Common/types.h",               targetDirectory: "USB_API/USB_Common"},
    {path: msp430UsbLibPath + "/USB_Common/usb.c",                 targetDirectory: "USB_API/USB_Common"},
    {path: msp430UsbLibPath + "/USB_Common/usb.h",                 targetDirectory: "USB_API/USB_Common"},
    {path: msp430UsbLibPath + "/USB_Common/usbdma.c",              targetDirectory: "USB_API/USB_Common"},
    {path: msp430UsbLibPath + "/USB_Common/UsbIsr.h",              targetDirectory: "USB_API/USB_Common"},
    /* USB_HID_API */
    {path: msp430UsbLibPath + "/USB_HID_API/UsbHid.c",             targetDirectory: "USB_API/USB_HID_API"},
    {path: msp430UsbLibPath + "/USB_HID_API/UsbHid.h",             targetDirectory: "USB_API/USB_HID_API"},
    {path: msp430UsbLibPath + "/USB_HID_API/UsbHidReq.c",          targetDirectory: "USB_API/USB_HID_API"},
    {path: msp430UsbLibPath + "/USB_HID_API/UsbHidReq.h",          targetDirectory: "USB_API/USB_HID_API"},
    /* USB_MSC_API */
    {path: msp430UsbLibPath + "/USB_MSC_API/UsbMsc.h",             targetDirectory: "USB_API/USB_MSC_API"},
    {path: msp430UsbLibPath + "/USB_MSC_API/UsbMscReq.c",          targetDirectory: "USB_API/USB_MSC_API"},
    {path: msp430UsbLibPath + "/USB_MSC_API/UsbMscReq.h",          targetDirectory: "USB_API/USB_MSC_API"},
    {path: msp430UsbLibPath + "/USB_MSC_API/UsbMscScsi.c",         targetDirectory: "USB_API/USB_MSC_API"},
    {path: msp430UsbLibPath + "/USB_MSC_API/UsbMscScsi.h",         targetDirectory: "USB_API/USB_MSC_API"},
    {path: msp430UsbLibPath + "/USB_MSC_API/UsbMscStateMachine.c", targetDirectory: "USB_API/USB_MSC_API"},
    {path: msp430UsbLibPath + "/USB_MSC_API/UsbMscStateMachine.h", targetDirectory: "USB_API/USB_MSC_API"},
    /* USB_PHDC_API */
    {path: msp430UsbLibPath + "/USB_PHDC_API/UsbPHDC.c",           targetDirectory: "USB_API/USB_PHDC_API"},
    {path: msp430UsbLibPath + "/USB_PHDC_API/UsbPHDC.h",           targetDirectory: "USB_API/USB_PHDC_API"},
    /* USB linker file */
    {path: msp430UsbLibPath + "/msp430USB.cmd",                    targetDirectory: "USB_API"}
];

var allExamples = [
    /*
     *
     ********* Driver Examples ********
     *
     */
    /********* Demo Examples *********/
    {
        title: "Graphics Library Demo",
        name: "grlibdemo",
        description: "Display picture/text on the onboard LED using the graphic library.",
        rootDir: "/source/demo",
        fileList: msp430GrlibFiles.concat([
            {name: "grlibdemo.c"},
            {name: "grlibdemo.cfg"},
            {name: "driverlibHeaders.h"},
            {name: "README.md"},
            {name: "images.h",             targetDirectory: "images"},
            {name: "LPRocket_96x37.c",     targetDirectory: "images"},
            {name: "TI_Logo_69x64.c",      targetDirectory: "images"},
            {name: "Sharp96x96.h",         targetDirectory: "lcdDriver"},
            {name: "Sharp96x96.c",         targetDirectory: "lcdDriver"},
            {name: "Sharp96x96utils.h",    targetDirectory: "lcdDriver"},
            {name: "Sharp96x96utils.asm",  targetDirectory: "lcdDriver"},
            {name: "fontfixed6x8.c",       targetDirectory: "fonts"},
        ]),
        group: "Demo",
        options: "TREX",
        tools: ["TI"],
        boards: [
//            Boards.MSP_EXP430FR5969
        ]
    },
    /********* Display Examples *********/
    {
        title: "Display",
        name: "display",
        description: "An example demonstrating how to use the display driver",
        rootDir: "/source/display",
        fileList: [
            {name: "display.c"},
            {name: "display.cfg"},
            {name: "splash_image.c"},
            {name: "splash_image.h"},
            {name: "README.md"},
        ],
        group: "Display",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1310DK_7XD,
            Boards.CC1310_LAUNCHXL,
            Boards.CC1350STK,
            Boards.CC1350_LAUNCHXL,
            Boards.CC2650_LAUNCHXL,
            Boards.CC2650DK_4XS,
            Boards.CC2650DK_5XD,
            Boards.CC2650DK_7ID,
            Boards.CC2650STK
        ]
    },
    /********* ADC Examples *********/
    {
        title: "ADC Project",
        name: "adcsinglechannel",
        description: "An ADC single channel TI-RTOS project",
        rootDir: "/source/adcsinglechannel",
        fileList: [
            {name: "adcsinglechannel.c"},
            {name: "adcsinglechannel.cfg"},
            {name: "README.md"}
        ],
        group: "ADC",
        options: "NPW,TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1310_LAUNCHXL,
            Boards.CC1310DK_7XD,
            Boards.CC1350_LAUNCHXL,
            Boards.CC2650_LAUNCHXL,
            Boards.CC2650DK_7ID,
            Boards.MSP_EXP432P401R
        ]
    },
    /********* ADCBuf Examples *********/
    {
        title: "ADCBuf Project",
        name: "adcbufcontinuous",
        description: "An ADCBuf continuous sampling TI-RTOS project",
        rootDir: "/source/adcbufcontinuous",
        fileList: [
            {name: "adcBufContinuousSampling.c"},
            {name: "adcBufContinuousSampling.cfg"},
            {name: "README.md"}
        ],
        group: "ADCBuf",
        options: "NPW,TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1310_LAUNCHXL,
            Boards.CC1310DK_7XD,
            Boards.CC1350_LAUNCHXL,
            Boards.CC2650_LAUNCHXL,
            Boards.CC2650DK_7ID,
//             Boards.MSP_EXP432P401R
        ]
    },
    /********* Empty Examples *********/
    {
        title: "Empty Project",
        name: "empty",
        description: "An empty TI-RTOS project",
        rootDir: "/source/empty",
        fileList: [
            {name: "empty.c"},
            {name: "empty.cfg"},
            {name: "README.md"}
        ],
        group: "Empty",
        options: "NPW,TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1310DK_7XD,
            Boards.CC1310_LAUNCHXL,
            Boards.CC1350STK,
            Boards.CC1350_LAUNCHXL,
            Boards.CC2650DK_4XS,
            Boards.CC2650DK_5XD,
            Boards.CC2650DK_7ID,
            Boards.CC2650STK,
            Boards.CC2650_LAUNCHXL,
            Boards.CC3200_LAUNCHXL,
            Boards.CC3220_LAUNCHXL,
            Boards.CC3220S_LAUNCHXL,
            Boards.CC3220SF_LAUNCHXL,
            Boards.DK_TM4C129X,
            Boards.EK_TM4C123GXL,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.MSP_EXP430F5529LP,
            Boards.MSP_EXP430FR5969,
            Boards.MSP_EXP430FR5994,
            Boards.MSP_EXP430FR6989,
            Boards.MSP_EXP432P401R,
            Boards.TMDXDOCK28M36_M3,
            Boards.TMDXDOCKH52C1_M3
        ]
    },
    {
        title: "Empty (Minimal) Project",
        name: "empty_min",
        description: "An empty TI-RTOS project with minimal footprint",
        rootDir: "/source/empty_min",
        fileList: [
            {name: "empty_min.c"},
            {name: "empty_min.cfg"},
            {name: "README.md"}
        ],
        group: "Empty",
        options: "NPW,TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1310DK_7XD,
            Boards.CC1310_LAUNCHXL,
            Boards.CC1350STK,
            Boards.CC1350_LAUNCHXL,
            Boards.CC2650DK_4XS,
            Boards.CC2650DK_5XD,
            Boards.CC2650DK_7ID,
            Boards.CC2650_LAUNCHXL,
            Boards.CC2650STK,
            Boards.CC3200_LAUNCHXL,
            Boards.CC3220_LAUNCHXL,
            Boards.CC3220S_LAUNCHXL,
            Boards.CC3220SF_LAUNCHXL,
            Boards.DK_TM4C129X,
            Boards.EK_TM4C123GXL,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.MSP_EXP430F5529LP,
            Boards.MSP_EXP430FR5969,
            Boards.MSP_EXP430FR5994,
            Boards.MSP_EXP430FR6989,
            Boards.MSP_EXP432P401R,
            Boards.TMDXDOCK28M36_M3,
            Boards.TMDXDOCKH52C1_M3
        ]
    },
    /********* FatFs Examples *********/
    {
        title: "FatSD",
        name: "fatsd",
        description: "An example using an SDcard",
        rootDir: "/source/fatsd",
        fileList: [
            {name: "fatsd.c"},
            {name: "fatsd.cfg"},
            {name: "README.md"}
        ],
        group: "FatFs",
        options: "TREX",
        tools: ["TI"],
        boards: [
            Boards.CC3200_LAUNCHXL,
            Boards.CC3220_LAUNCHXL,
            Boards.CC3220S_LAUNCHXL,
            Boards.CC3220SF_LAUNCHXL,
            Boards.DK_TM4C129X,
            Boards.EK_TM4C123GXL,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.MSP_EXP430F5529LP,
            Boards.MSP_EXP430FR5969,
            Boards.MSP_EXP430FR5994,
            Boards.MSP_EXP430FR6989,
            Boards.MSP_EXP432P401R,
            Boards.TMDXDOCK28M36_M3,
            Boards.TMDXDOCKH52C1_M3
        ]
    },
    {
        title: "FatSD Raw",
        name: "fatsdraw",
        description: "An example using an SDcard with FatFs API calls",
        rootDir: "/source/fatsdraw",
        fileList:[
            {name: "fatsdraw.c"},
            {name: "fatsdraw.cfg"},
            {name: "README.md"}
        ],
        group: "FatFs",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC3200_LAUNCHXL,
            Boards.CC3220_LAUNCHXL,
            Boards.CC3220S_LAUNCHXL,
            Boards.CC3220SF_LAUNCHXL,
            Boards.DK_TM4C129X,
            Boards.EK_TM4C123GXL,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.MSP_EXP430F5529LP,
            Boards.MSP_EXP430FR5969,
            Boards.MSP_EXP430FR5994,
            Boards.MSP_EXP430FR6989,
            Boards.MSP_EXP432P401R,
            Boards.TMDXDOCK28M36_M3,
            Boards.TMDXDOCKH52C1_M3
        ]
    },
    {
        title: "FatSD USB Copy",
        name: "fatsdusbcopy",
        description: "An example copying a file from a SD Card to a USB Drive",
        rootDir: "/source/fatsdusbcopy",
        fileList:[
            {name: "fatsdusbcopy.c"},
            {name: "fatsdusbcopy.cfg"},
            {name: "README.md"}
        ],
        group: "USB",
        options: "TREX",
        tools: ["TI"],
        boards: [
            Boards.DK_TM4C129X,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.TMDXDOCK28M36_M3,
            Boards.TMDXDOCKH52C1_M3
        ]
    },
    /********* GPIO Examples *********/
    {
        title: "GPIO Interrupt",
        name: "gpiointerrupt",
        description: "An example using interrupts to toggle an LED after a button press",
        rootDir: "/source/gpiointerrupt",
        fileList:[
            {name: "gpiointerrupt.c"},
            {name: "gpiointerrupt.cfg"},
            {name: "README.md"}
        ],
        group: "GPIO",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC3200_LAUNCHXL,
            Boards.CC3220_LAUNCHXL,
            Boards.CC3220S_LAUNCHXL,
            Boards.CC3220SF_LAUNCHXL,
            Boards.DK_TM4C129X,
            Boards.EK_TM4C123GXL,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.MSP_EXP430F5529LP,
            Boards.MSP_EXP430FR5969,
            Boards.MSP_EXP430FR5994,
            Boards.MSP_EXP430FR6989,
            Boards.MSP_EXP432P401R,
            Boards.TMDXDOCK28M36_M3,
            Boards.TMDXDOCKH52C1_M3
        ]
    },
    /********* I2C Examples *********/
    {
        title: "I2C EEPROM",
        name: "i2ceeprom",
        description: "An example that performs page reads and writes to the onboard EEPROM",
        rootDir: "/source/i2ceeprom",
        fileList: [
            {name: "i2ceeprom.c"},
            {name: "i2ceeprom.cfg"},
            {name: "README.md"}
        ],
        group: "I2C",
        options: "TREX",
        tools: ["TI"],
        boards: [Boards.TMDXDOCKH52C1_M3]
    },
    {
        title: "I2C RF430CL330 Load",
        name: "i2crf430cl330_load",
        description: "An example NFC RF430CL330 example that sends the CPU Load",
        rootDir: "/source/i2crf430cl330_load",
        fileList: [
            {name: "i2crf430cl330_load.c"},
            {name: "i2crf430cl330_load.cfg"},
            {name: "README.md"}
        ],
        group: "I2C",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.DK_TM4C129X,
            Boards.EK_TM4C123GXL,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.MSP_EXP430F5529LP,
            Boards.MSP_EXP430FR5969,
            Boards.MSP_EXP430FR5994,
            Boards.MSP_EXP430FR6989,
            Boards.MSP_EXP432P401R
        ]
    },
    {
        title: "I2C TMP006",
        name: "i2ctmp006",
        description: "An example on how to use the I2C driver with the TMP006 boosterpack",
        rootDir: "/source/i2ctmp006",
        fileList: [
            {name: "i2ctmp006.c"},
            {name: "i2ctmp006.cfg"},
            {name: "README.md"}
        ],
        group: "I2C",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC3200_LAUNCHXL,
            Boards.CC3220_LAUNCHXL,
            Boards.CC3220S_LAUNCHXL,
            Boards.CC3220SF_LAUNCHXL,
            Boards.DK_TM4C129X,
            Boards.EK_TM4C123GXL,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.MSP_EXP430F5529LP,
            Boards.MSP_EXP430FR5969,
            Boards.MSP_EXP430FR5994,
            Boards.MSP_EXP430FR6989,
            Boards.MSP_EXP432P401R
        ]
    },
    {
        title: "I2C TMP007",
        name: "i2ctmp007",
        description: "An example on how to use the I2C driver with the TMP007 boosterpack",
        rootDir: "/source/i2ctmp007",
        fileList: [
            {name: "i2ctmp007.c"},
            {name: "i2ctmp007.cfg"},
            {name: "README.md"}
        ],
        group: "I2C",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1350STK,
            Boards.CC2650STK
        ]
    },
    {
        title: "I2C TPL0401EVM",
        name: "i2ctpl0401evm",
        description: "An example on how to use the I2C driver with the TPL0401EVM boosterpack",
        rootDir: "/source/i2ctpl0401evm",
        fileList: [
            {name: "i2ctpl0401evm.c"},
            {name: "i2ctpl0401evm.cfg"},
            {name: "README.md"}
        ],
        group: "I2C",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.DK_TM4C129X,
            Boards.EK_TM4C123GXL,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.MSP_EXP430F5529LP,
            Boards.MSP_EXP430FR5969,
            Boards.MSP_EXP430FR5994,
            Boards.MSP_EXP430FR6989,
            Boards.MSP_EXP432P401R
        ]
    },
    /********* I2S Examples **********/
    {
        title: "I2S Echo",
        name: "i2secho",
        description: "An example that performs audio echo on the CC3200AUDBOOST boosterpack",
        rootDir: "/source/i2secho",
        fileList: [
            {name: "i2secho.c"},
            {name: "i2secho.cfg"},
            {name: "README.md"},
            {name: "ti_codec.c"},
            {name: "ti_codec.h"}
        ],
        group: "I2S",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC3200_LAUNCHXL,
            Boards.CC3220_LAUNCHXL,
            Boards.CC3220S_LAUNCHXL,
            Boards.CC3220SF_LAUNCHXL,
        ]
    },
    /********* PDM Examples **********/
    {
        title: "PDM Stream",
        name: "pdmstream",
        description: "An example which takes audio from a digital microphone and transmits it on UART",
        rootDir: "/source/pdmstream",
        fileList: [
            {name: "pdmstream.c"},
            {name: "pdmstream.cfg"},
            {name: "README.md"}
        ],
        group: "PDM",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1350STK,
            Boards.CC2650STK
       ]
    },
    /********* LCD EXAMPLES *********/
    {
        title: "LCD SmartRF06EB",
        name: "lcdSmartRF06EB",
        description: "An example demonstrating how to use the LCD on the SmartRF06 Evaluation Board",
        rootDir: "/source/lcdSmartRF06EB",
        fileList: [
            {name: "lcdSmartRF06EB.c"},
            {name: "lcdSmartRF06EB.cfg"},
            {name: "README.md"}
        ],
        group: "Display",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1310DK_7XD,
            Boards.CC2650DK_7ID,
        ]
    },
    /********* PIN EXAMPLES *********/
    {
        title: "Pin Interrupt",
        name: "pinInterrupt",
        description: "An example using interrupts to toggle an LED after a button press",
        rootDir: "/source/pinInterrupt",
        fileList: [
            {name: "pinInterrupt.c"},
            {name: "pinInterrupt.cfg"},
            {name: "README.md"}
        ],
        group: "PIN",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1310DK_7XD,
            Boards.CC1310_LAUNCHXL,
            Boards.CC1350STK,
            Boards.CC1350_LAUNCHXL,
            Boards.CC2650_LAUNCHXL,
            Boards.CC2650DK_4XS,
            Boards.CC2650DK_5XD,
            Boards.CC2650DK_7ID,
            Boards.CC2650STK,
        ]
    },
    {
        title: "Pin Shutdown",
        name: "pinShutdown",
        description: "An example using the PIN driver and the Power module to put the device in shutdown mode",
        rootDir: "/source/pinShutdown",
        fileList: [
            {name: "pinShutdown.c"},
            {name: "pinShutdown.cfg"},
            {name: "README.md"}
        ],
        group: "PIN",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards:[
            Boards.CC1310DK_7XD,
            Boards.CC1310_LAUNCHXL,
            Boards.CC1350STK,
            Boards.CC1350_LAUNCHXL,
            Boards.CC2650_LAUNCHXL,
            Boards.CC2650DK_4XS,
            Boards.CC2650DK_5XD,
            Boards.CC2650DK_7ID,
            Boards.CC2650STK,
        ],
    },
    {
        title: "Pin Standby",
        name: "pinStandby",
        description: "An example using the PIN driver and the Power module to put the device in standby mode",
        rootDir: "/source/pinStandby",
        fileList: [
            {name: "pinStandby.c"},
            {name: "pinStandby.cfg"},
            {name: "README.md"}
        ],
        group: "PIN",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards:[
            Boards.CC1310DK_7XD,
            Boards.CC1310_LAUNCHXL,
            Boards.CC1350STK,
            Boards.CC1350_LAUNCHXL,
            Boards.CC2650_LAUNCHXL,
            Boards.CC2650DK_4XS,
            Boards.CC2650DK_5XD,
            Boards.CC2650DK_7ID,
            Boards.CC2650STK,
        ],
    },
    /********* PWM Examples *********/
    {
        title: "PWM LED",
        name: "pwmled",
        description: "An example on how to use the PWM driver to control on-board LEDs",
        rootDir: "/source/pwmled",
        fileList: [
            {name: "pwmled.c"},
            {name: "pwmled.cfg"},
            {name: "README.md"}
        ],
        group: "PWM",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1310_LAUNCHXL,
            Boards.CC1310DK_7XD,
            Boards.CC1350_LAUNCHXL,
            Boards.CC1350STK,
            Boards.CC2650_LAUNCHXL,
            Boards.CC2650DK_4XS,
            Boards.CC2650DK_5XD,
            Boards.CC2650DK_7ID,
            Boards.CC2650STK,
            Boards.CC3200_LAUNCHXL,
            Boards.CC3220_LAUNCHXL,
            Boards.CC3220S_LAUNCHXL,
            Boards.CC3220SF_LAUNCHXL,
            Boards.DK_TM4C129X,
            Boards.EK_TM4C123GXL,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.MSP_EXP432P401R
        ]
    },
    /********* RF Examples *********/
    {
        title: "RF Packet TX",
        name: "rfPacketTx",
        description: "A transmitter example on how to use the RF driver",
        rootDir: "/source/rfpacket/tx",
        fileList: [
            {name: "rfPacketTx.c"},
            {path: "/source/rf/rfExamples.cfg"},
            {name: "README.md"},
            {name: "smartrf_settings.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings.c", targetDirectory: "smartrf_settings"},
        ],
        group: "RF",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1310DK_7XD,
            Boards.CC1310_LAUNCHXL,
            Boards.CC1350STK,
            Boards.CC1350_LAUNCHXL,
            Boards.CC2650_LAUNCHXL,
            Boards.CC2650DK_7ID
        ]
    },
    {
        title: "RF Packet RX",
        name: "rfPacketRx",
        description: "A receiver example on how to use the RF driver",
        rootDir: "/source/rfpacket/rx",
        fileList: [
            {name: "rfPacketRx.c"},
            {path: "/source/rf/rfExamples.cfg"},
            {name: "README.md"},
            {path: "/source/rf/RFQueue.h"},
            {path: "/source/rf/RFQueue.c"},
            {name: "smartrf_settings.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings.c", targetDirectory: "smartrf_settings"},
        ],
        group: "RF",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1310DK_7XD,
            Boards.CC1310_LAUNCHXL,
            Boards.CC1350STK,
            Boards.CC1350_LAUNCHXL,
            Boards.CC2650_LAUNCHXL,
            Boards.CC2650DK_7ID
        ]
    },
    {
        title: "RF Carrier Wave",
        name: "rfCarrierWave",
        description: "An example that uses the RF driver to generate a carrier wave",
        rootDir: "/source/rfcarrierwave",
        fileList: [
            {name: "rfCarrierWave.c"},
            {path: "/source/rf/rfExamples.cfg"},
            {name: "README.md"},
            {name: "smartrf_settings.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings.c", targetDirectory: "smartrf_settings"},
        ],
        group: "RF",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1310DK_7XD,
            Boards.CC1310_LAUNCHXL,
            Boards.CC1350STK,
            Boards.CC1350_LAUNCHXL,
            Boards.CC2650_LAUNCHXL,
            Boards.CC2650DK_7ID
        ]
    },
    {
        title: "RF EasyLink TX",
        name: "rfEasyLinkTx",
        description: "An EasyLink transmit example",
        rootDir: "/source/rfeasylink/tx",
        fileList: [
            {name: "rfEasyLinkTx.c"},
            {path: "/source/rf/rfExamples.cfg"},
            {name: "README.md"},
            {path: "/source/rf/easylink/EasyLink.h", targetDirectory: "easylink"},
            {path: "/source/rf/easylink/EasyLink.c", targetDirectory: "easylink"},
            {name: "smartrf_settings_predefined.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings_predefined.c", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings.c", targetDirectory: "smartrf_settings"},
        ],
        group: "RF",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1310DK_7XD,
            Boards.CC1310_LAUNCHXL,
            Boards.CC1350STK,
            Boards.CC1350_LAUNCHXL,
            Boards.CC2650_LAUNCHXL,
            Boards.CC2650DK_7ID
        ]
    },
    {
        title: "RF EasyLink RX",
        name: "rfEasyLinkRx",
        description: "An EasyLink receive example",
        rootDir: "/source/rfeasylink/rx",
        fileList: [
            {name: "rfEasyLinkRx.c"},
            {path: "/source/rf/rfExamples.cfg"},
            {name: "README.md"},
            {path: "/source/rf/easylink/EasyLink.h", targetDirectory: "easylink"},
            {path: "/source/rf/easylink/EasyLink.c", targetDirectory: "easylink"},
            {name: "smartrf_settings_predefined.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings_predefined.c", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings.c", targetDirectory: "smartrf_settings"},
        ],
        group: "RF",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1310DK_7XD,
            Boards.CC1310_LAUNCHXL,
            Boards.CC1350STK,
            Boards.CC1350_LAUNCHXL,
            Boards.CC2650_LAUNCHXL,
            Boards.CC2650DK_7ID
        ]
    },
    {
        title: "RF EasyLink Network Processor",
        name: "rfEasyLinkNp",
        description: "An EasyLink AT Command Network Processor example",
        rootDir: "/source/rfeasylink/np",
        fileList: [
            {name: "rfEasyLinkNp.c"},
            {path: "/source/rf/rfExamples.cfg"},
            {name: "README.md"},
            {path: "/source/rf/easylink/EasyLink.h", targetDirectory: "easylink"},
            {path: "/source/rf/easylink/EasyLink.c", targetDirectory: "easylink"},
            {name: "smartrf_settings_predefined.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings_predefined.c", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings.c", targetDirectory: "smartrf_settings"},
            {path: "/source/rf/at/AtControl.c", targetDirectory: "at"},
            {path: "/source/rf/at/AtControl.h", targetDirectory: "at"},
            {path: "/source/rf/at/AtParams.c", targetDirectory: "at"},
            {path: "/source/rf/at/AtParams.h", targetDirectory: "at"},
            {path: "/source/rf/at/AtProcess.c", targetDirectory: "at"},
            {path: "/source/rf/at/AtProcess.h", targetDirectory: "at"},
            {path: "/source/rf/at/platform/inc/AtTerm.h", targetDirectory: "at/platform/inc"},
            {path: "/source/rf/at/platform/tirtos/AtTerm.c", targetDirectory: "at/platform/tirtos"},
            {path: "/source/rf/at/platform/tirtos/DbgPrint.h", targetDirectory: "at/platform/tirtos"},
            {path: "/source/rf/at/platform/tirtos/PlatformTypes.h", targetDirectory: "at/platform/tirtos"},
        ],
        group: "RF",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1310DK_7XD,
            Boards.CC1310_LAUNCHXL,
            Boards.CC1350STK,
            Boards.CC1350_LAUNCHXL,
            Boards.CC2650_LAUNCHXL,
            Boards.CC2650DK_7ID
        ]
    },
    {
        title: "RF Packet Error Rate Test",
        name: "rfPacketErrorRate",
        description: "Showcases different RF transfer modes and measures the packet error rate.",
        rootDir: "/source/rfPacketErrorRate",
        fileList: [
            {name: "config.c"},
            {name: "config.h"},
            {name: "menu.c"},
            {name: "menu.h"},
            {name: "README.md"},
            {name: "smartrf_settings_predefined.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings_predefined.c", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings.c", targetDirectory: "smartrf_settings"},
            {name: "rfPacketErrorRate.c"},
            {path: "/source/rf/rfExamples.cfg"},
            {name: "rx.c"},
            {name: "tx.c"},
            {path: "/source/rf/RFQueue.h"},
            {path: "/source/rf/RFQueue.c"},
        ],
        group: "RF",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1310DK_7XD,
            Boards.CC1310_LAUNCHXL,
        ]
    },
    {
        title: "RF Packet Error Rate Test",
        name: "rfPacketErrorRate",
        description: "Showcases different RF transfer modes and measures the packet error rate.",
        rootDir: "/source/rfPacketErrorRate",
        fileList: [
            {name: "config.c"},
            {name: "config.h"},
            {name: "menu.c"},
            {name: "menu.h"},
            {name: "README.md"},
            {name: "smartrf_settings_predefined.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings_predefined.c", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings.c", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings_ble.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings_ble.c", targetDirectory: "smartrf_settings"},
            {name: "rfPacketErrorRate.c"},
            {path: "/source/rf/rfExamples.cfg"},
            {name: "rx.c"},
            {name: "tx.c"},
            {path: "/source/rf/RFQueue.h"},
            {path: "/source/rf/RFQueue.c"},
        ],
        group: "RF",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1350STK,
            Boards.CC1350_LAUNCHXL,
            Boards.CC2650_LAUNCHXL,
            Boards.CC2650DK_7ID
        ]
    },
    {
        title: "RF Wireless Sensor Network Concentrator",
        name: "rfWsnConcentrator",
        description: "A wireless sensor network concentrator which collects data from sensor nodes",
        rootDir: "/source/rfwsn/concentrator",
        fileList: [
            {path: "/source/rf/rfExamples.cfg"},
            {path: "/source/rfwsn/RadioProtocol.h"},
            {path: "/source/rf/easylink/EasyLink.h", targetDirectory: "easylink"},
            {path: "/source/rf/easylink/EasyLink.c", targetDirectory: "easylink"},
            {name: "smartrf_settings_predefined.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings_predefined.c", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings.c", targetDirectory: "smartrf_settings"},
        ],
        group: "RF",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1310DK_7XD,
            Boards.CC1310_LAUNCHXL,
            Boards.CC2650_LAUNCHXL,
            Boards.CC2650DK_7ID
        ]
    },
    {
        title: "RF Wireless Sensor Network Node",
        name: "rfWsnNode",
        description: "A wireless sensor network node that sends data to the collector",
        rootDir: "/source/rfwsn/node",
        fileList: [
            {path: "/source/rf/rfExamples.cfg"},
            {path: "/source/rfwsn/RadioProtocol.h"},
            {path: "/source/rfwsn/SceAdc.c"},
            {path: "/source/rfwsn/SceAdc.h"},
            {path: "/source/rf/easylink/EasyLink.h", targetDirectory: "easylink"},
            {path: "/source/rf/easylink/EasyLink.c", targetDirectory: "easylink"},
            {name: "smartrf_settings_predefined.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings_predefined.c", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings.c", targetDirectory: "smartrf_settings"},
            {name: "adc_sample.scp", targetDirectory: "sce"},
            {name: "scif.c", targetDirectory: "sce"},
            {name: "scif.h", targetDirectory: "sce"},
            {name: "scif_framework.c", targetDirectory: "sce"},
            {name: "scif_framework.h", targetDirectory: "sce"},
            {name: "scif_osal_tirtos.c", targetDirectory: "sce"},
            {name: "scif_osal_tirtos.h", targetDirectory: "sce"},
        ],
        group: "RF",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1310DK_7XD,
            Boards.CC1310_LAUNCHXL,
            Boards.CC2650_LAUNCHXL,
            Boards.CC2650DK_7ID
        ]
    },
    {
        title: "RF Dual Mode Wireless Sensor Network Concentrator",
        name: "rfWsnDmConcentrator",
        description: "A wireless sensor network concentrator which collects data from Sub 1GHz sensor nodes and advertises data in a 2.4Ghz BLE Eddystone Beacon",
        rootDir: "/source/rfwsn/concentratordm",
        fileList: [
            {path: "/source/rf/rfDmExamples.cfg"},
            {path: "/source/rfwsn/RadioProtocol.h"},
            {path: "/source/rf/easylink/EasyLink.h", targetDirectory: "easylink"},
            {path: "/source/rf/easylink/EasyLink.c", targetDirectory: "easylink"},
            {name: "smartrf_settings_predefined.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings_predefined.c", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings.c", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings_ble.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings_ble.c", targetDirectory: "smartrf_settings"},
            {path: "/source/rf/seb/SEB.h", targetDirectory: "seb"},
            {path: "/source/rf/seb/SEB.c", targetDirectory: "seb"},
            {path: "/source/rf/seb/SimpleBeacon.h", targetDirectory: "seb"},
            {path: "/source/rf/seb/SimpleBeacon.c", targetDirectory: "seb"},
            {path: "/source/rf/bim/BimFactoryReset.h", targetDirectory: "bim"},
            {path: "/source/rf/bim/BimFactoryReset.c", targetDirectory: "bim"},
            {path: "/source/rf/bim/ext_flash_layout.h", targetDirectory: "bim"},
            {path: prodList["tidrivers"].dir + "/packages/ti/mw/extflash/ExtFlash.c", targetDirectory: "extflash"},
            {path: prodList["tidrivers"].dir + "/packages/ti/mw/extflash/ExtFlash.h", targetDirectory: "extflash"},
        ],
        group: "RF",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1350_LAUNCHXL,
            Boards.CC1350STK,
        ]
    },
    {
        title: "RF Dual Mode Wireless Sensor Network Node",
        name: "rfWsnDmNode",
        description: "A wireless sensor network node that sends data to the Sub 1GHz collector and advertises data in a 2.4Ghz BLE Eddystone Beacon",
        rootDir: "/source/rfwsn/nodedm",
        fileList: [
            {path: "/source/rfwsn/nodedm/node_dk_luanchxl/DmNodeRadioTask.c"},
            {path: "/source/rfwsn/nodedm/node_dk_luanchxl/DmNodeTask.c"},
            {path: "/source/rf/rfDmExamples.cfg"},
            {path: "/source/rfwsn/nodedm/README.md"},
            {path: "/source/rfwsn/RadioProtocol.h"},
            {path: "/source/rfwsn/SceAdc.c"},
            {path: "/source/rfwsn/SceAdc.h"},
            {path: "/source/rf/easylink/EasyLink.h", targetDirectory: "easylink"},
            {path: "/source/rf/easylink/EasyLink.c", targetDirectory: "easylink"},
            {name: "smartrf_settings_predefined.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings_predefined.c", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings.c", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings_ble.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings_ble.c", targetDirectory: "smartrf_settings"},
            {path: "/source/rf/seb/SEB.h", targetDirectory: "seb"},
            {path: "/source/rf/seb/SEB.c", targetDirectory: "seb"},
            {path: "/source/rf/seb/SimpleBeacon.h", targetDirectory: "seb"},
            {path: "/source/rf/seb/SimpleBeacon.c", targetDirectory: "seb"},
            {name: "adc_sample.scp", targetDirectory: "sce"},
            {name: "scif.c", targetDirectory: "sce"},
            {name: "scif.h", targetDirectory: "sce"},
            {name: "scif_framework.c", targetDirectory: "sce"},
            {name: "scif_framework.h", targetDirectory: "sce"},
            {name: "scif_osal_tirtos.c", targetDirectory: "sce"},
            {name: "scif_osal_tirtos.h", targetDirectory: "sce"},
            {path: "/source/rf/bim/BimFactoryReset.h", targetDirectory: "bim"},
            {path: "/source/rf/bim/BimFactoryReset.c", targetDirectory: "bim"},
            {path: "/source/rf/bim/ext_flash_layout.h", targetDirectory: "bim"},
            {path: prodList["tidrivers"].dir + "/packages/ti/mw/extflash/ExtFlash.c", targetDirectory: "extflash"},
            {path: prodList["tidrivers"].dir + "/packages/ti/mw/extflash/ExtFlash.h", targetDirectory: "extflash"},
        ],
        group: "RF",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1350_LAUNCHXL,
        ]
    },
    {
        title: "RF Dual Mode Wireless Sensor Network Node",
        name: "rfWsnDmNode",
        description: "A wireless sensor network node for Sensor Tag that sends data to the Sub 1GHz collector and advertises data in a 2.4Ghz BLE Eddystone Beacon",
        rootDir: "/source/rfwsn/nodedm",
        fileList: [
            {path: "/source/rfwsn/nodedm/node_stk/DmNodeRadioTask.c"},
            {path: "/source/rfwsn/nodedm/node_stk/DmNodeTask.c"},
            {path: "/source/rf/rfDmExamples.cfg"},
            {path: "/source/rfwsn/nodedm/README.md"},
            {path: "/source/rfwsn/RadioProtocol.h"},
            {path: "/source/rf/easylink/EasyLink.h", targetDirectory: "easylink"},
            {path: "/source/rf/easylink/EasyLink.c", targetDirectory: "easylink"},
            {name: "smartrf_settings_predefined.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings_predefined.c", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings.c", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings_ble.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings_ble.c", targetDirectory: "smartrf_settings"},
            {path: "/source/rf/seb/SEB.h", targetDirectory: "seb"},
            {path: "/source/rf/seb/SEB.c", targetDirectory: "seb"},
            {path: "/source/rf/seb/SimpleBeacon.h", targetDirectory: "seb"},
            {path: "/source/rf/seb/SimpleBeacon.c", targetDirectory: "seb"},
            {path: "/source/rf/bim/BimFactoryReset.h", targetDirectory: "bim"},
            {path: "/source/rf/bim/BimFactoryReset.c", targetDirectory: "bim"},
            {path: "/source/rf/bim/ext_flash_layout.h", targetDirectory: "bim"},
            {path: "/source/rf/bim/ExtFlash.c", targetDirectory: "bim"},
            {path: prodList["tidrivers"].dir + "/packages/ti/mw/sensors/SensorBmp280.c", targetDirectory: "sensors"},
            {path: prodList["tidrivers"].dir + "/packages/ti/mw/sensors/SensorBmp280.h", targetDirectory: "sensors"},
            {path: prodList["tidrivers"].dir + "/packages/ti/mw/sensors/SensorHdc1000.c", targetDirectory: "sensors"},
            {path: prodList["tidrivers"].dir + "/packages/ti/mw/sensors/SensorHdc1000.h", targetDirectory: "sensors"},
            {path: prodList["tidrivers"].dir + "/packages/ti/mw/sensors/SensorMpu9250.c", targetDirectory: "sensors"},
            {path: prodList["tidrivers"].dir + "/packages/ti/mw/sensors/SensorMpu9250.h", targetDirectory: "sensors"},
            {path: prodList["tidrivers"].dir + "/packages/ti/mw/sensors/SensorTmp007.c", targetDirectory: "sensors"},
            {path: prodList["tidrivers"].dir + "/packages/ti/mw/sensors/SensorTmp007.h", targetDirectory: "sensors"},
            {path: prodList["tidrivers"].dir + "/packages/ti/mw/sensors/SensorOpt3001.c", targetDirectory: "sensors"},
            {path: prodList["tidrivers"].dir + "/packages/ti/mw/sensors/SensorOpt3001.h", targetDirectory: "sensors"},
            {path: prodList["tidrivers"].dir + "/packages/ti/mw/sensors/SensorI2C.c", targetDirectory: "sensors"},
            {path: prodList["tidrivers"].dir + "/packages/ti/mw/sensors/SensorI2C.h", targetDirectory: "sensors"},
            {path: prodList["tidrivers"].dir + "/packages/ti/mw/sensors/SensorUtil.h", targetDirectory: "sensors"},
            {path: prodList["tidrivers"].dir + "/packages/ti/mw/extflash/ExtFlash.c", targetDirectory: "extflash"},
            {path: prodList["tidrivers"].dir + "/packages/ti/mw/extflash/ExtFlash.h", targetDirectory: "extflash"},
        ],
        group: "RF",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1350STK,
        ]
    },
    {
        title: "RF Wake-on-Radio TX",
        name: "rfWakeOnRadioTx",
        description: "A packet TX example that sends a long preamble.",
        rootDir: "/source/rfwakeonradio/tx",
        fileList: [
            {path: "/source/rf/rfExamples.cfg"},
            {name: "smartrf_settings.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings.c", targetDirectory: "smartrf_settings"},
        ],
        group: "RF",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1310DK_7XD,
            Boards.CC1310_LAUNCHXL,
            Boards.CC1350STK,
            Boards.CC1350_LAUNCHXL
        ]
    },
    {
        title: "RF Wake-on-Radio RX",
        name: "rfWakeOnRadioRx",
        description: "A packet RX example that uses carrier sense to detect the presence of a signal.",
        rootDir: "/source/rfwakeonradio/rx",
        fileList: [
            {path: "/source/rf/rfExamples.cfg"},
            {path: "/source/rf/RFQueue.h"},
            {path: "/source/rf/RFQueue.c"},
            {name: "smartrf_settings.h", targetDirectory: "smartrf_settings"},
            {name: "smartrf_settings.c", targetDirectory: "smartrf_settings"},
        ],
        group: "RF",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1310DK_7XD,
            Boards.CC1310_LAUNCHXL,
            Boards.CC1350STK,
            Boards.CC1350_LAUNCHXL
        ]
    },
    {
    title: "RF Listen Before Talk",
    name: "rfListenBeforeTalk",
    description: "Sends a packet after performing carrier sense and shows command chaining",
    rootDir: "/source/rfListenBeforeTalk",
    fileList: [
        {name: "application_settings.c"},
        {name: "application_settings.h"},
        {name: "rfListenBeforeTalk.c"},
        {path: "/source/rf/rfExamples.cfg"},
        {name: "README.md"},
        {name: "smartrf_settings.h", targetDirectory: "smartrf_settings"},
        {name: "smartrf_settings.c", targetDirectory: "smartrf_settings"},
    ],
    group: "RF",
    options: "TREX",
    tools: ["TI", "IAR", "GNU"],
    boards: [
        Boards.CC1310DK_7XD,
        Boards.CC1310_LAUNCHXL,
        Boards.CC1350STK,
        Boards.CC1350_LAUNCHXL
    ]
},
    /********* SPI EXAMPLES *********/
    {
        title: "SPI Loopback",
        name: "spiloopback",
        description: "An example that performs an external SPI loopback with master and slave SPI",
        rootDir: "/source/spiloopback",
        fileList: [
            {name: "spiloopback.c"},
            {name: "spiloopback.cfg"},
            {name: "README.md"}
        ],
        group: "SPI",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.DK_TM4C129X,
            Boards.EK_TM4C123GXL,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.MSP_EXP432P401R,
            Boards.TMDXDOCK28M36_M3,
            Boards.TMDXDOCKH52C1_M3
        ]
    },
    /********* UART Examples *********/
    {
        title: "UART Console",
        name: "uartconsole",
        description: "A basic console implemented with the UART driver and cstdio",
        rootDir: "/source/uartconsole",
        fileList: [
            {name: "uartconsole.c"},
            {name: "uartconsole.cfg"},
            {name: "README.md"},
            {path: "/source/uart/UARTUtils.c"},
            {path: "/source/uart/UARTUtils.h"},
            {path: "/source/usbtiva/USBCDCD_LoggerIdle.c"},
            {path: "/source/usbtiva/USBCDCD_LoggerIdle.h"}
        ],
        group: "UART",
        options: "TREX",
        tools: ["TI"],
        boards: [
            Boards.DK_TM4C129X,
            Boards.EK_TM4C123GXL,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.TMDXDOCK28M36_M3,
            Boards.TMDXDOCKH52C1_M3
        ]
    },
    {
        title: "UART Console",
        name: "uartconsole",
        description: "A basic console implemented with the UART driver and cstdio",
        rootDir: "/source/uartconsole",
        fileList: msp430UsbLibFiles.concat([
            {name: "uartconsole.c"},
            {name: "uartconsole.cfg"},
            {name: "README.md"},
            {path: "/source/uart/UARTUtils.c"},
            {path: "/source/uart/UARTUtils.h"},
            {path: "/source/usbmsp430/cdclogging/USBCDCD_LoggerIdle.c"},
            {path: "/source/usbmsp430/cdclogging/USBCDCD_LoggerIdle.h"},
            {path: "/source/usbmsp430/cdclogging/USB_config/descriptors.c",  targetDirectory: "USB_config"},
            {path: "/source/usbmsp430/cdclogging/USB_config/descriptors.h",  targetDirectory: "USB_config"},
            {path: "/source/usbmsp430/cdclogging/USB_config/UsbIsr.c",       targetDirectory: "USB_config"},
            {path: "/source/usbmsp430/cdclogging/USB_config/MSP430_CDC.inf", targetDirectory: "USB_config"}
        ]),
        group: "UART",
        options: "TREX",
        tools: ["TI"],
        boards: [Boards.MSP_EXP430F5529LP]
    },
    {
        title: "UART Echo",
        name: "uartecho",
        description: "Echoes characters back using the UART driver",
        rootDir: "/source/uartecho",
        fileList: [
            {name: "uartecho.c"},
            {name: "uartecho.cfg"},
            {name: "README.md"}
        ],
        group: "UART",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC1310DK_7XD,
            Boards.CC1310_LAUNCHXL,
            Boards.CC1350STK,
            Boards.CC1350_LAUNCHXL,
            Boards.CC2650DK_4XS,
            Boards.CC2650DK_5XD,
            Boards.CC2650DK_7ID,
            Boards.CC2650STK,
            Boards.CC2650_LAUNCHXL,
            Boards.CC3200_LAUNCHXL,
            Boards.CC3220_LAUNCHXL,
            Boards.CC3220S_LAUNCHXL,
            Boards.CC3220SF_LAUNCHXL,
            Boards.DK_TM4C129X,
            Boards.EK_TM4C123GXL,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.MSP_EXP430F5529LP,
            Boards.MSP_EXP430FR5969,
            Boards.MSP_EXP430FR5994,
            Boards.MSP_EXP430FR6989,
            Boards.MSP_EXP432P401R,
            Boards.TMDXDOCK28M36_M3,
            Boards.TMDXDOCKH52C1_M3
        ]
    },
    {
        title: "UART Echo DMA",
        name: "uartechodma",
        description: "Echoes characters back using the UART DMA driver",
        rootDir: "/source/uartecho",
        fileList: [
            {name: "uartecho.c"},
            {name: "uartecho.cfg"},
            {name: "README.md"}
        ],
        group: "UART",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        compilerBuildOptions: {
            TI:  " -DTI_DRIVERS_UART_DMA",
            IAR: " -DTI_DRIVERS_UART_DMA",
            GNU: " -DTI_DRIVERS_UART_DMA"
        },
        boards: [
            Boards.CC3200_LAUNCHXL,
            Boards.CC3220_LAUNCHXL,
            Boards.CC3220S_LAUNCHXL,
            Boards.CC3220SF_LAUNCHXL,
            Boards.DK_TM4C129X,
            Boards.EK_TM4C123GXL,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL
        ]
    },
    {
        title: "UART Logging",
        name: "uartlogging",
        description: "A simple example that sends Log data to the UART",
        rootDir: "/source/uartlogging",
        fileList: [
            {name: "uartlogging.c"},
            {name: "uartlogging.cfg"},
            {name: "README.md"},
            {path: "/source/uart/UARTUtils.c"},
            {path: "/source/uart/UARTUtils.h"}
        ],
        group: "UART",
        options: "TREX",
        tools: ["TI", "GNU"],
        boards: [
            Boards.CC3200_LAUNCHXL,
            Boards.CC3220_LAUNCHXL,
            Boards.CC3220S_LAUNCHXL,
            Boards.CC3220SF_LAUNCHXL,
            Boards.DK_TM4C129X,
            Boards.EK_TM4C123GXL,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.MSP_EXP430F5529LP,
            Boards.MSP_EXP430FR5969,
            Boards.MSP_EXP430FR5994,
            Boards.MSP_EXP430FR6989,
            Boards.MSP_EXP432P401R,
            Boards.TMDXDOCK28M36_M3,
            Boards.TMDXDOCKH52C1_M3
        ]
    },
    {
        title: "UART Power",
        name: "uartpower",
        description: "UART loopback example with power management",
        rootDir: "/source/uartpower",
        fileList: [
            {name: "uartpower.c"},
            {name: "uartpower.cfg"},
            {name: "README.md"}
        ],
        group: "UART",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC3200_LAUNCHXL,
            Boards.CC3220_LAUNCHXL,
            Boards.CC3220S_LAUNCHXL,
            Boards.CC3220SF_LAUNCHXL
        ]
    },
    /******** USB EXAMPLES *********/
    {
        title: "USB CDC Mouse Device",
        name: "usbcdcmousedevice",
        description: "USB composite example that features a CDC virtual serial port communications along with a HID Mouse device",
        rootDir: "/source/usbcdcmousedevice",
        fileList: [
            {name: "usbcdcmousedevice.c"},
            {name: "usbcdcmousedevice.cfg"},
            {name: "README.md"},
            {path: "/source/usbtiva/USBCDCMOUSE.h"},
            {path: "/source/usbtiva/USBCDCMOUSE.c"}
        ],
        group: "USB",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.DK_TM4C129X,
            Boards.EK_TM4C123GXL,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.TMDXDOCK28M36_M3,
            Boards.TMDXDOCKH52C1_M3
        ]
    },
    {
        title: "USB CDC Mouse Device",
        name: "usbcdcmousedevice",
        description: "USB composite example that features a CDC virtual serial port communications along with a HID Mouse device",
        rootDir: "/source/usbcdcmousedevice",
        fileList: msp430UsbLibFiles.concat([
            {name: "usbcdcmousedevice.c"},
            {name: "usbcdcmousedevice.cfg"},
            {name: "README.md"},
            {path: "/source/usbmsp430/cdchidm/USBCDCMOUSE.h"},
            {path: "/source/usbmsp430/cdchidm/USBCDCMOUSE.c"},
            {path: "/source/usbmsp430/cdchidm/USB_config/descriptors.c",  targetDirectory: "USB_config"},
            {path: "/source/usbmsp430/cdchidm/USB_config/descriptors.h",  targetDirectory: "USB_config"},
            {path: "/source/usbmsp430/cdchidm/USB_config/UsbIsr.c",       targetDirectory: "USB_config"},
            {path: "/source/usbmsp430/cdchidm/USB_config/MSP430_CDC.inf", targetDirectory: "USB_config"}
        ]),
        group: "USB",
        options: "TREX",
        tools: ["TI", "IAR"],
        boards: [Boards.MSP_EXP430F5529LP]
    },
    {
        title: "USB Keyboard Device",
        name: "usbkeyboarddevice",
        description: "USB HID Keyboard Device example that simulates a keyboard",
        rootDir: "/source/usbkeyboarddevice",
        fileList: [
            {name: "usbkeyboarddevice.c"},
            {name: "usbkeyboarddevice.cfg"},
            {name: "README.md"},
            {path: "/source/usbtiva/USBKBD.h"},
            {path: "/source/usbtiva/USBKBD.c"}
        ],
        group: "USB",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.DK_TM4C129X,
            Boards.EK_TM4C123GXL,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.TMDXDOCK28M36_M3,
            Boards.TMDXDOCKH52C1_M3
        ]
    },
    {
        title: "USB Keyboard Device",
        name: "usbkeyboarddevice",
        description: "USB HID Keyboard Device example that simulates a keyboard",
        rootDir: "/source/usbkeyboarddevice",
        fileList: msp430UsbLibFiles.concat([
            {name: "usbkeyboarddevice.c"},
            {name: "usbkeyboarddevice.cfg"},
            {name: "README.md"},
            {path: "/source/usbmsp430/hidk/USBKBD.h"},
            {path: "/source/usbmsp430/hidk/USBKBD.c"},
            {path: "/source/usbmsp430/hidk/USB_config/descriptors.c", targetDirectory: "USB_config"},
            {path: "/source/usbmsp430/hidk/USB_config/descriptors.h", targetDirectory: "USB_config"},
            {path: "/source/usbmsp430/hidk/USB_config/UsbIsr.c",      targetDirectory: "USB_config"}
        ]),
        group: "USB",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [Boards.MSP_EXP430F5529LP]
    },
    {
        title: "USB Keyboard Host",
        name: "usbkeyboardhost",
        description: "USB HID Keyboard Host example that reads characters from a USB Keyboard",
        rootDir: "/source/usbkeyboardhost",
        fileList: [
            {name: "usbkeyboardhost.c"},
            {name: "usbkeyboardhost.cfg"},
            {name: "README.md"},
            {path: "/source/usbtiva/USBKBH.h"},
            {path: "/source/usbtiva/USBKBH.c"}
        ],
        group: "USB",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.DK_TM4C129X,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.TMDXDOCK28M36_M3,
            Boards.TMDXDOCKH52C1_M3
        ]
    },
    {
        title: "USB Mouse Device",
        name: "usbmousedevice",
        description: "USB HID Mouse Device example that moves a mouse cursor and simulates mouse clicks",
        rootDir: "/source/usbmousedevice",
        fileList: [
            {name: "usbmousedevice.c"},
            {name: "usbmousedevice.cfg"},
            {name: "README.md"},
            {path: "/source/usbtiva/USBMD.h"},
            {path: "/source/usbtiva/USBMD.c"}
        ],
        group: "USB",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.DK_TM4C129X,
            Boards.EK_TM4C123GXL,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.TMDXDOCK28M36_M3,
            Boards.TMDXDOCKH52C1_M3
        ]
    },
    {
        title: "USB Mouse Device",
        name: "usbmousedevice",
        description: "USB HID Mouse Device example that moves a mouse cursor and simulates mouse clicks",
        rootDir: "/source/usbmousedevice",
        fileList: msp430UsbLibFiles.concat([
            {name: "usbmousedevice.c"},
            {name: "usbmousedevice.cfg"},
            {name: "README.md"},
            {path: "/source/usbmsp430/hidm/USBMD.h"},
            {path: "/source/usbmsp430/hidm/USBMD.c"},
            {path: "/source/usbmsp430/hidm/USB_config/descriptors.c", targetDirectory: "USB_config"},
            {path: "/source/usbmsp430/hidm/USB_config/descriptors.h", targetDirectory: "USB_config"},
            {path: "/source/usbmsp430/hidm/USB_config/UsbIsr.c",      targetDirectory: "USB_config"}
        ]),
        group: "USB",
        options: "TREX",
        tools: ["TI", "IAR"],
        boards: [Boards.MSP_EXP430F5529LP]
    },
    {
        title: "USB Mouse Host",
        name: "usbmousehost",
        description: "USB HID Mouse Host example that displays the status of a USB Mouse",
        rootDir: "/source/usbmousehost",
        fileList: [
            {name: "usbmousehost.c"},
            {name: "usbmousehost.cfg"},
            {name: "README.md"},
            {path: "/source/usbtiva/USBMH.h"},
            {path: "/source/usbtiva/USBMH.c"}
        ],
        group: "USB",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.DK_TM4C129X,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.TMDXDOCK28M36_M3,
            Boards.TMDXDOCKH52C1_M3
        ]
    },
    {
        title: "USB Serial Device",
        name: "usbserialdevice",
        description: "USB CDC Device that allows for serial communications using a virtual serial COM port",
        rootDir: "/source/usbserialdevice",
        fileList: [
            {name: "usbserialdevice.c"},
            {name: "usbserialdevice.cfg"},
            {name: "README.md"},
            {path: "/source/usbtiva/USBCDCD.h"},
            {path: "/source/usbtiva/USBCDCD.c"}
        ],
        group: "USB",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.DK_TM4C129X,
            Boards.EK_TM4C123GXL,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.TMDXDOCK28M36_M3,
            Boards.TMDXDOCKH52C1_M3
        ]
    },
    {
        title: "USB Serial Device",
        name: "usbserialdevice",
        description: "USB CDC Device that allows for serial communications using a virtual serial COM port",
        rootDir: "/source/usbserialdevice",
        fileList: msp430UsbLibFiles.concat([
            {name: "usbserialdevice.c"},
            {name: "usbserialdevice.cfg"},
            {name: "README.md"},
            {path: "/source/usbmsp430/cdc/USBCDCD.h"},
            {path: "/source/usbmsp430/cdc/USBCDCD.c"},
            {path: "/source/usbmsp430/cdc/USB_config/descriptors.c",  targetDirectory: "USB_config"},
            {path: "/source/usbmsp430/cdc/USB_config/descriptors.h",  targetDirectory: "USB_config"},
            {path: "/source/usbmsp430/cdc/USB_config/UsbIsr.c",       targetDirectory: "USB_config"},
            {path: "/source/usbmsp430/cdc/USB_config/MSP430_CDC.inf", targetDirectory: "USB_config"}
        ]),
        group: "USB",
        options: "TREX",
        tools: ["TI", "IAR"],
        boards: [Boards.MSP_EXP430F5529LP]
    },
    /********* Watchdog Examples *********/
    {
        title: "Watchdog",
        name: "watchdog",
        description: "Watchdog Timer example that services a watchdog until a button press and release",
        rootDir: "/source/watchdog",
        fileList: [
            {name: "watchdog.c"},
            {name: "watchdog.cfg"},
            {name: "README.md"}
        ],
        group: "Watchdog",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC3200_LAUNCHXL,
            Boards.CC3220_LAUNCHXL,
            Boards.CC3220S_LAUNCHXL,
            Boards.CC3220SF_LAUNCHXL,
            Boards.DK_TM4C129X,
            Boards.EK_TM4C123GXL,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.MSP_EXP430F5529LP,
            Boards.MSP_EXP430FR5969,
            Boards.MSP_EXP430FR5994,
            Boards.MSP_EXP430FR6989,
            Boards.MSP_EXP432P401R,
            Boards.TMDXDOCK28M36_M3,
            Boards.TMDXDOCKH52C1_M3
        ]
    },

    /*
     *
     ********* Instrumentation Examples **********
     *
     */
    {
        title: "Hello World",
        name: "helloworld",
        description: "A basic example that logs a hello world string that can be viewed using System Analyzer.",
        rootDir: "/source/instrumentation/helloworld",
        fileList: [
            {name: "helloworld.c"},
            {name: "helloworld.cfg"},
            {name: "README.md"}
        ],
        group: "Instrumentation",
        options: "TREX",
        tools: ["TI", "GNU"],
        boards: [
            Boards.CC3200_LAUNCHXL,
            Boards.CC3220_LAUNCHXL,
            Boards.CC3220S_LAUNCHXL,
            Boards.CC3220SF_LAUNCHXL,
            Boards.DK_TM4C129X,
            Boards.EK_TM4C123GXL,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.MSP_EXP430F5529LP,
            Boards.MSP_EXP430FR5969,
            Boards.MSP_EXP430FR5994,
            Boards.MSP_EXP430FR6989,
            Boards.MSP_EXP432P401R,
            Boards.TMDXDOCK28M36_C28,
            Boards.TMDXDOCK28M36_M3,
            Boards.TMDXDOCKH52C1_C28,
            Boards.TMDXDOCKH52C1_M3
        ]
    },
    {
        title: "Stairstep JTAG StopMode",
        name: "stairstepStopMode",
        description: "The stairstep example runs continuously and periodically generates log events. Different threads (Hwi, Swi, Task) run to present a CPU load to the system.  The Log data is obtained when the target is halted.  The sizes of the loggers in LoggingSetup might need to be decreased if your target does not have enough memory.",
        rootDir: "/source/instrumentation/stairstep",
        fileList: [
            {name: "stairstep.c"},
            {name: "stairstep.cfg"}
        ],
        group: "Instrumentation",
        options: "TREX",
        tools: ["TI", "GNU"],
        boards: [
            Boards.CC3200_LAUNCHXL,
            Boards.CC3220_LAUNCHXL,
            Boards.CC3220S_LAUNCHXL,
            Boards.CC3220SF_LAUNCHXL,
            Boards.DK_TM4C129X,
            Boards.EK_TM4C123GXL,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.MSP_EXP430F5529LP,
            Boards.MSP_EXP430FR5969,
            Boards.MSP_EXP430FR5994,
            Boards.MSP_EXP430FR6989,
            Boards.MSP_EXP432P401R,
            Boards.TMDXDOCK28M36_C28,
            Boards.TMDXDOCK28M36_M3,
            Boards.TMDXDOCKH52C1_C28,
            Boards.TMDXDOCKH52C1_M3
        ]
    },

    /*
     *
     ********* Kernel Examples **********
     *
     */
    {
        title: "Benchmark Example",
        name: "benchloop",
        description: "This example gathers and prints benchmark timing data for some representative SYS/BIOS APIs.",
        rootDir: "/source/kernel/benchloop",
        fileList: [
            {name: "benchloop.c"},
            {name: "benchloop.cfg"}
        ],
        group: "Kernel",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: Boards.allBoards
    },
    {
        title: "C++ Example (bigtime)",
        name: "bigtime",
        description: "In this program, C++ is used to create a real-time clock/calendar.",
        rootDir: "/source/kernel/bigtime",
        fileList: [
            {name: "bigtime.cpp"},
            {name: "bigtime.cfg"}
        ],
        group: "Kernel",
        options: "TREX",
        tools: ["TI", "GNU"],
        boards: Boards.allBoards
    },
    {
        title: "Clock Example",
        name: "clock",
        description: "The clock example shows how to use the ti.sysbios.knl.Clock module to create one-shot and periodic Clock Instances. Clock Instances are essentially functions that run after a certain number of Clock ticks.",
        rootDir: "/source/kernel/clock",
        fileList: [
            {name: "clock.c"},
            {name: "clock.cfg"}
        ],
        group: "Kernel",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: Boards.allBoards
    },
    {
        title: "Error Example",
        name: "error",
        description: "This example shows how to use Error_Blocks to catch runtime errors. An Error_Block is passed to Task_create() and then checked for create failure. When no Error_Block is passed, the application will terminate when an error occurs. The error.cfg file shows how to plug an error hook.",
        rootDir: "/source/kernel/error",
        fileList: [
            {name: "error.c"},
            {name: "error.cfg"}
        ],
        group: "Kernel",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: Boards.allBoards
    },
    {
        title: "Event Example",
        name: "event",
        description: "The event example shows how to use the ti.sysbios.knl.Event module. The ti.sysbios.knl.Event module solves the 'Wait on Multiple' problem. In this example a reader task waits on several events.",
        rootDir: "/source/kernel/event",
        fileList: [
            {name: "event.c"},
            {name: "event.cfg"}
        ],
        group: "Kernel",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC3200_LAUNCHXL,
            Boards.CC3220_LAUNCHXL,
            Boards.CC3220S_LAUNCHXL,
            Boards.CC3220SF_LAUNCHXL,
            Boards.DK_TM4C129X,
            Boards.EK_TM4C123GXL,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.MSP_EXP430F5529LP,
            Boards.MSP_EXP430FR5969,
            Boards.MSP_EXP430FR5994,
            Boards.MSP_EXP430FR6989,
            Boards.MSP_EXP432P401R,
            Boards.TMDXDOCK28M36_C28,
            Boards.TMDXDOCK28M36_M3,
            Boards.TMDXDOCKH52C1_C28,
            Boards.TMDXDOCKH52C1_M3
        ]
    },
    {
        title: "Hello Example",
        name: "hello",
        description: "The hello example serves as a basic sanity check program for SYS/BIOS. It demonstrates how to print the string 'hello world' to stdout.",
        rootDir: "/source/kernel/hello",
        fileList: [
            {name: "hello.c"},
            {name: "hello.cfg"}
        ],
        group: "Kernel",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: Boards.allBoards
    },
    {
        title: "Memory Example",
        name: "memory",
        description: "This example shows the use of xdc.runtime.Memory module and different xdc.runtime.IHeap implementations to manage memory. A system heap is created statically using ti.sysbios.heaps.HeapMem.",
        rootDir: "/source/kernel/memory",
        fileList: [
            {name: "memory.c"},
            {name: "memory.cfg"}
        ],
        group: "Kernel",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: Boards.allBoards
    },
    {
        title: "Task Mutex Example",
        name: "mutex",
        description: "This example shows the use of two tasks and one semaphore to protect data access.",
        rootDir: "/source/kernel/mutex",
        fileList: [
            {name: "mutex.c"},
            {name: "mutex.cfg"}
        ],
        group: "Kernel",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: Boards.allBoards
    },
    {
        title: "PIE Interrupt Example",
        name: "pie",
        description: "A 28x specific example which shows how to handle (simulated) peripheral interrupts from the PIE",
        rootDir: "/source/kernel/pie",
        fileList: [
            {name: "pie.c"},
            {name: "pie.cfg"}
        ],
        group: "Kernel",
        options: "TREX",
        tools: ["TI"],
        boards: [
            Boards.TMDXDOCK28M36_C28,
            Boards.TMDXDOCKH52C1_C28
        ]
    },
    {
        title: "Semi-Hosting Example",
        name: "semihost",
        description: "This example leverages Semi-Hosting for printf IO.  The configuration disables non-essential and debug-related SYS/BIOS features to reduce the application memory footprint.",
        rootDir: "/source/kernel/semihost",
        fileList: [
            {name: "semihost.c"},
            {name: "semihost.cfg"}
        ],
        group: "Kernel",
        options: "TREX",
        tools: ["GNU"],
        boards: Boards.allBoards
    },
    {
        title: "Swi Example",
        name: "swi",
        description: "The swi example shows how to use the ti.sysbios.knl.Swi module. It demonstrates how the various Swi APIs work.",
        rootDir: "/source/kernel/swi",
        fileList: [
            {name: "swi.c"},
            {name: "swi.cfg"}
        ],
        group: "Kernel",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: Boards.allBoards
    },

    /*
     *
     ********* Network Examples **********
     *
     */
    /********* Ethernet Examples *********/
    {
        title: "HTTP Client GET",
        name: "httpget",
        description: "The HTTP Client GET example showing how to use HTTP Client stack ",
        rootDir: "/source/httpget",
        fileList:[
            {name: "httpget.c"},
            {name: "httpget.cfg"},
            {name: "README.md"}
        ],
        compilerBuildOptions: {
            TI: " -I" + prodList["ndk"].packages + "/ti/ndk/inc/bsd" +
                " -DNET_NDK",
            IAR: " -I" + prodList["ndk"].packages + "/ti/ndk/inc/bsd" +
                " -DNET_NDK",
            GNU: " -I" + prodList["ndk"].packages + "/ti/ndk/inc/bsd" +
                " -DNET_NDK"
        },
        group: "Ethernet",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL
        ]
    },
    {
        title: "HTTPS Client GET",
        name: "httpsget",
        description: "The HTTPS Client GET example showing how to use HTTP Client stack with TLS ",
        rootDir: "/source/httpsget",
        fileList:[
            {name: "httpsget.c"},
            {name: "httpsget.cfg"},
            {name: "README.md"}
        ],
        compilerBuildOptions: {
            TI: " -I" + prodList["ndk"].packages + "/ti/ndk/inc/bsd" +
                " -DNET_NDK -DWOLFSSL_TIRTOS",
            IAR: " -I" + prodList["ndk"].packages + "/ti/ndk/inc/bsd" +
                " -DNET_NDK -DWOLFSSL_TIRTOS",
            GNU: " -I" + prodList["ndk"].packages + "/ti/ndk/inc/bsd" +
                " -DNET_NDK -DWOLFSSL_TIRTOS"
        },
        group: "Ethernet",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL
        ]
    },
    {
        title: "TCP Echo",
        name: "tcpEcho",
        description: "The TCP Echo example showing how to use TCP sockets",
        rootDir: "/source/tcpEcho",
        fileList:[
            {name: "tcpEcho.c"},
            {name: "tcpEcho.cfg"},
            {name: "tcpEchoHooks.c"},
            {name: "README.md"}
        ],
        compilerBuildOptions: {
            TI: " -I" + prodList["ndk"].packages + "/ti/ndk/inc/bsd",
            IAR: " -I" + prodList["ndk"].packages + "/ti/ndk/inc/bsd",
            GNU: " -I" + prodList["ndk"].packages + "/ti/ndk/inc/bsd"
        },
        group: "Ethernet",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.DK_TM4C129X,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.TMDXDOCK28M36_M3,
            Boards.TMDXDOCKH52C1_M3
        ]
    },
    {
        title: "TCP Echo IPv6",
        name: "tcpEchoIPv6",
        description: "The TCP Echo example showing how to use TCP sockets for IPv6",
        rootDir: "/source/tcpEchoIPv6",
        fileList:[
            {name: "tcpEchoIPv6.c"},
            {name: "tcpEchoIPv6.cfg"},
            {name: "tcpEchoHooksIPv6.c"},
            {name: "README.md"}
        ],
        compilerBuildOptions: {
            TI: " -I" + prodList["ndk"].packages + "/ti/ndk/inc" +
                " -I" + prodList["ndk"].packages + "/ti/ndk/inc/bsd" +
                " -D_INCLUDE_IPv6_CODE",
            IAR:
                " -I" + prodList["ndk"].packages + "/ti/ndk/inc" +
                " -I" + prodList["ndk"].packages + "/ti/ndk/inc/bsd" +
                " -D_INCLUDE_IPv6_CODE",
            GNU:
                " -I" + prodList["ndk"].packages + "/ti/ndk/inc" +
                " -I" + prodList["ndk"].packages + "/ti/ndk/inc/bsd" +
                " -D_INCLUDE_IPv6_CODE"
        },
        group: "Ethernet",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.DK_TM4C129X,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.TMDXDOCK28M36_M3,
            Boards.TMDXDOCKH52C1_M3
        ]
    },
    {
        title: "TCP Echo with TLS",
        name: "tcpEchoTLS",
        description: "The TCP Echo example showing how to use TCP sockets with TLS ",
        rootDir: "/source/tcpEchoTLS",
        fileList:[
            {name: "tcpEchoTLS.c"},
            {name: "tcpEchoTLS.cfg"},
            {name: "tcpEchoHooks.c"},
            {name: "README.md"}
        ],
        compilerBuildOptions: {
            TI: " -I" + prodList["ndk"].packages + "/ti/ndk/inc/bsd" +
                " -DWOLFSSL_TIRTOS",
            IAR: " -I" + prodList["ndk"].packages + "/ti/ndk/inc/bsd" +
                " -DWOLFSSL_TIRTOS",
            GNU: " -I" + prodList["ndk"].packages + "/ti/ndk/inc/bsd" +
                " -DWOLFSSL_TIRTOS"
        },
        group: "Ethernet",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL
        ]
    },
    {
        title: "UDP Echo",
        name: "udpEcho",
        description: "The UDP Echo example showing how to use UDP sockets",
        rootDir: "/source/udpEcho",
        fileList: [
            {name: "udpEcho.c"},
            {name: "udpEcho.cfg"},
            {name: "udpEchoHooks.c"},
            {name: "README.md"}
        ],
        compilerBuildOptions: {
            TI: " -I" + prodList["ndk"].packages + "/ti/ndk/inc/bsd",
            IAR: " -I" + prodList["ndk"].packages + "/ti/ndk/inc/bsd",
            GNU: " -I" + prodList["ndk"].packages + "/ti/ndk/inc/bsd"
        },
        group: "Ethernet",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.DK_TM4C129X,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.TMDXDOCK28M36_M3,
            Boards.TMDXDOCKH52C1_M3
        ]
    },
    {
        title: "UDP Echo IPv6",
        name: "udpEchoIPv6",
        description: "The UDP Echo example showing how to use UDP sockets for IPv6",
        rootDir: "/source/udpEchoIPv6",
        fileList:[
            {name: "udpEchoIPv6.c"},
            {name: "udpEchoIPv6.cfg"},
            {name: "udpEchoHooksIPv6.c"},
            {name: "README.md"}
        ],
        compilerBuildOptions: {
            TI: " -I" + prodList["ndk"].packages + "/ti/ndk/inc" +
                " -I" + prodList["ndk"].packages + "/ti/ndk/inc/bsd" +
                " -D_INCLUDE_IPv6_CODE",
            IAR:
                " -I" + prodList["ndk"].packages + "/ti/ndk/inc" +
                " -I" + prodList["ndk"].packages + "/ti/ndk/inc/bsd" +
                " -D_INCLUDE_IPv6_CODE",
            GNU:
                " -I" + prodList["ndk"].packages + "/ti/ndk/inc" +
                " -I" + prodList["ndk"].packages + "/ti/ndk/inc/bsd" +
                " -D_INCLUDE_IPv6_CODE"
        },
        group: "Ethernet",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.DK_TM4C129X,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.TMDXDOCK28M36_M3,
            Boards.TMDXDOCKH52C1_M3
        ]
    },
    /********* PPP Examples *********/
    {
        title: "TCP Echo PPP",
        name: "tcpEchoPPP",
        description: "The TCP Echo example showing how to use TCP sockets on a NULL modem PPP connection",
        rootDir: "/source/tcpEchoPPP",
        fileList:[
            {name: "tcpEchoPPP.c"},
            {name: "tcpEchoPPP.cfg"},
            {name: "tcpEchoHooks.c"},
            {name: "llserial.h"},
            {name: "llserial.c"},
            {name: "usbserialppp.c"},
            {name: "README.md"},
            {path: "/source/usbtiva/USBCDCD.h"},
            {path: "/source/usbtiva/USBCDCD.c"}
        ],
        compilerBuildOptions: {
            TI: " -I" + prodList["ndk"].packages + "/ti/ndk/inc" +
                " -I" + prodList["ndk"].packages + "/ti/ndk/inc/bsd" +
                " -DTI_EXAMPLES_PPP=1",
            IAR:
                " -I" + prodList["ndk"].packages + "/ti/ndk/inc" +
                " -I" + prodList["ndk"].packages + "/ti/ndk/inc/bsd" +
                " -DTI_EXAMPLES_PPP=1",
            GNU:
                " -I" + prodList["ndk"].packages + "/ti/ndk/inc" +
                " -I" + prodList["ndk"].packages + "/ti/ndk/inc/bsd" +
                " -DTI_EXAMPLES_PPP=1"
        },
        group: "PPP",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.DK_TM4C129X,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL
        ]
    },
    /********* WiFi Examples *********/
    {
        title: "HTTP Client GET for CC3100",
        name: "httpgetCC3100",
        description: "The HTTP Client example showing how to use HTTP Client stack with the SimpleLink Wi-Fi CC3100",
        rootDir: "/source/httpgetCC3100",
        fileList: [
            {name: "httpgetCC3100.c"},
            {name: "httpgetCC3100.cfg"},
            {path: "/source/cc3x00/sockets.c"},
            {path: "/source/cc3x00/sockets.h"},
            {name: "README.md"}
        ],
        compilerBuildOptions: {
            TI: cc3x00COpts + " -DNET_SL",
            IAR: cc3x00COpts + " -DNET_SL",
            GNU: cc3x00COpts + " -DNET_SL"
        },
        group: "WiFi",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards:[
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL
        ],
    },
    {
        title: "HTTPS Client GET for CC3100",
        name: "httpsgetCC3100",
        description: "The HTTPS Client example showing how to use HTTP Client stack with TLS on SimpleLink Wi-Fi CC3100",
        rootDir: "/source/httpsgetCC3100",
        fileList: [
            {name: "httpsgetCC3100.c"},
            {name: "httpsgetCC3100.cfg"},
            {path: "/source/cc3x00/sockets.c"},
            {path: "/source/cc3x00/sockets.h"},
            {name: "README.md"}
        ],
        compilerBuildOptions: {
            TI: cc3x00COpts + " -DNET_SL",
            IAR: cc3x00COpts + " -DNET_SL",
            GNU: cc3x00COpts + " -DNET_SL"
        },
        group: "WiFi",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards:[
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL
        ],
    },
    {
        title: "TCP Echo for CC3X00",
        name: "tcpEchoCC3X00",
        description: "The TCP Echo example showing how to use sockets with the SimpleLink Wi-Fi CC3X00",
        rootDir: "/source/tcpEchoCC3X00",
        fileList: [
            {name: "tcpEchoCC3X00.c"},
            {name: "tcpEchoCC3X00.cfg"},
            {path: "/source/cc3x00/sockets.c"},
            {path: "/source/cc3x00/sockets.h"},
            {name: "README.md"}
        ],
        compilerBuildOptions: {
            TI: cc3x00COpts,
            IAR: cc3x00COpts,
            GNU: cc3x00COpts
        },
        group: "WiFi",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC3200_LAUNCHXL,
            Boards.DK_TM4C129X,
            Boards.EK_TM4C123GXL,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.MSP_EXP430F5529LP,
            Boards.MSP_EXP430FR5969,
            Boards.MSP_EXP430FR6989,
            Boards.MSP_EXP432P401R
        ]
    },
    {
        title: "UDP Echo for CC3X00",
        name: "udpEchoCC3X00",
        description: "The UDP Echo example showing how to use sockets with the SimpleLink Wi-Fi CC3X00",
        rootDir: "/source/udpEchoCC3X00",
        cFile: "udpEchoCC3X00.c",
        cfgFile: "udpEchoCC3X00.cfg",
        fileList: [
            {name: "udpEchoCC3X00.c"},
            {name: "udpEchoCC3X00.cfg"},
            {path: "/source/cc3x00/sockets.c"},
            {path: "/source/cc3x00/sockets.h"},
            {name: "README.md"}
        ],
        compilerBuildOptions: {
            TI: cc3x00COpts,
            IAR: cc3x00COpts,
            GNU: cc3x00COpts,
        },
        group: "WiFi",
        options: "TREX",
        tools: ["TI", "IAR", "GNU"],
        boards: [
            Boards.CC3200_LAUNCHXL,
            Boards.DK_TM4C129X,
            Boards.EK_TM4C123GXL,
            Boards.EK_TM4C1294XL,
            Boards.EK_TM4C129EXL,
            Boards.MSP_EXP430F5529LP,
            Boards.MSP_EXP430FR5969,
            Boards.MSP_EXP430FR6989,
            Boards.MSP_EXP432P401R
        ]
    }
];

function getExampleSourceFiles(srcDir, board, example)
{
    var exampleFiles = [];
    var exampleFilesMap = {};
    var missingFilesMap = {};
    var exampleSrcDir = srcDir + example.rootDir;
    var searchDirs = [];
    var searchPaths = [];

    /*
     * Go through example fileList.  Add any files with explicit paths to the
     * exampleFilesMap.  If a path is not specified we need to search for the
     * file.  Add the file to the missingFilesMap, file names are used as keys.
     */
    for each (var file in example.fileList) {
        if (file.path && file.path != "") {
            var key;
            if (file.name && file.name != "") {
                key = file.name;
            }
            else {
                key = file.path.split("/").pop();
            }
            /* File path set explicitly, add object it to the list. */
            exampleFilesMap[key] =
                {path: file.path, targetDirectory: file.targetDirectory};
        }
        else {
            /* Path not provided, add the file name to search array */
            missingFilesMap[file.name] =
                {path: "", targetDirectory: file.targetDirectory};
        }
    }

    /*
     * Get the list of board specified directories in which to search for
     * example files
     */
    if (board.searchDirs) {
        for each (var dirName in board.searchDirs) {
            var tempDir = new java.io.File(exampleSrcDir + "/" + dirName);
            if (tempDir.exists()) {
                searchDirs.push(tempDir);
            }
        }
    }
    /* Add the example root directory last */
    searchDirs.push(new java.io.File(exampleSrcDir));

    /* Sequentially go through search directories and add example files. */
    for each (var dir in searchDirs) {
        for each (var file in dir.listFiles()) {
            if (file.isDirectory()) {
                continue;
            }

            /* Create file path relative to srcDir (not an absolute path) */
            var filePath = String(file.getPath().replace(srcDir, ""));
            while (filePath.indexOf("\\") != -1) {
                filePath = filePath.replace("\\", "/");
            }

            if (missingFilesMap[file.getName()]) {
                /*
                 * If found in missingFilesMap, remove it, update path
                 * and add it to exampleFilesMap.
                 */
                var entry = missingFilesMap[file.getName()];
                entry.path = filePath;
                exampleFilesMap[file.getName()] = entry;
                delete missingFilesMap[file.getName()];
            }
            else {
                /*
                 * File not in missingFilesMap, add it to exampleFilesMap
                 * if file not already present.
                 */
                if (!exampleFilesMap[file.getName()]) {
                    exampleFilesMap[file.getName()] = {path: filePath};
                }
            }
        }
    }

    /*
     * Get the list of board specified directories in which to search for
     * example files that are only included if referenced in the project
     */
    if (board.searchPaths) {
        for each (var dirName in board.searchPaths) {
            var tempDir = new java.io.File(srcDir + "/" + dirName);
            if (tempDir.exists()) {
                searchPaths.push(tempDir);
            }
        }
    }

    /* Sequentially go through search paths and add example files (if referenced). */
    for each (var dir in searchPaths) {
        for each (var file in dir.listFiles()) {
            if (file.isDirectory()) {
                continue;
            }

            /* Create file path relative to srcDir (not an absolute path) */
            var filePath = String(file.getPath().replace(srcDir, ""));
            while (filePath.indexOf("\\") != -1) {
                filePath = filePath.replace("\\", "/");
            }

            if (missingFilesMap[file.getName()]) {
                /*
                 * If found in missingFilesMap, remove it, update path
                 * and add it to exampleFilesMap.
                 */
                var entry = missingFilesMap[file.getName()];
                entry.path = filePath;
                exampleFilesMap[file.getName()] = entry;
                delete missingFilesMap[file.getName()];
            }
        }
    }

    /* Done searching directories, check if all files have been found */
    if (Object.keys(missingFilesMap).length) {
        throw ("Some example files have not been found!" +
            "\nExample: " + example.name + "\nFiles: " +
            Object.keys(missingFilesMap).toString());
    }

    /* Convert exampleFilesMap to array and return it */
    for each (var key in Object.keys(exampleFilesMap)) {
        exampleFiles.push(exampleFilesMap[key]);
    }

    return exampleFiles;
}

function isBoardSupported(example, board)
{
    return (example.boards.indexOf(board) != -1);
}

function isToolSupported(example, tool)
{
    return (example.tools.indexOf(tool) != -1);
}
