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
 *  ======== Boards.xs ========
 */

var msp43xOptions = xdc.loadCapsule("ti/drivers/msp43xOptions.xs");
var targetOpts = xdc.loadCapsule("ti/sysbios/examples/TargetOptions.xs").targetOptions;

var CC1310DK_7XD = {
    name: "CC1310DK_7XD",
    trexName: "CC1310 Development Kit",
    developmentBoard: "CC1310DK_7XD",
    productGroup: "CC13XX_CC26XX",
    family: "ARM",
    variant: "M3",
    deviceId: "Cortex M.CC1310F128",
    searchDirs: ["lprf", "cc13xx_cc26xx"],
    searchPaths: ["/source/rf/smartrf_settings/cc1310", "/source/rf/sce/dk"],
    platform: "ti.platforms.simplelink:CC1310F128",
    driverlib: "cc13xxware",
    fileList: [
        {path: "/CC1310DK_7XD/Board.h"},
        {path: "/CC1310DK_7XD/CC1310DK_7XD.c"},
        {path: "/CC1310DK_7XD/CC1310DK_7XD.h"},
        {path: "/CC1310DK_7XD/ccfg.c"}
    ],
    linkercmd: {
        TI: {path: "/CC1310DK_7XD/CC1310DK_7XD.cmd"},
        IAR: {path: "/CC1310DK_7XD/CC1310DK_7XD.icf"},
        GNU: {path: "/CC1310DK_7XD/CC1310DK_7XD.lds"}
    },
    compilerBuildOptions: {
        TI: " -I" + prodList["cc13xxware"].dir + " -Dccs",
        IAR: " -I" + prodList["cc13xxware"].dir + " -Dewarm",
        GNU: " -I" + prodList["cc13xxware"].dir + " -Dgcc"
    },
    linkerBuildOptions: {
        TI: " -l" + prodList["cc13xxware"].dir + "/driverlib/bin/ccs/driverlib.lib",
        IAR: " " + prodList["cc13xxware"].dir + "/driverlib/bin/iar/driverlib.lib",
        GNU: " -l:" + prodList["cc13xxware"].dir + "/driverlib/bin/gcc/driverlib.lib"
    },
    supportedDriverExamples: ["Empty", "Display", "PIN", "PWM", "RF", "UART", "ADCBuf", "ADC"]
};

var CC1310_LAUNCHXL = {
    name: "CC1310_LAUNCHXL",
    trexName: "CC1310 LaunchPad",
    developmentBoard: "CC1310-LAUNCHXL",
    productGroup: "CC13XX_CC26XX",
    family: "ARM",
    variant: "M3",
    deviceId: "Cortex M.CC1310F128",
    searchDirs: ["lprf", "cc13xx_cc26xx"],
    searchPaths: ["/source/rf/smartrf_settings/cc1310", "/source/rf/sce/launchxl"],
    platform: "ti.platforms.simplelink:CC1310F128",
    driverlib: "cc13xxware",
    fileList: [
        {path: "/CC1310_LAUNCHXL/Board.h"},
        {path: "/CC1310_LAUNCHXL/CC1310_LAUNCHXL.c"},
        {path: "/CC1310_LAUNCHXL/CC1310_LAUNCHXL.h"},
        {path: "/CC1310_LAUNCHXL/ccfg.c"}
    ],
    linkercmd: {
        TI: {path: "/CC1310_LAUNCHXL/CC1310_LAUNCHXL.cmd"},
        IAR: {path: "/CC1310_LAUNCHXL/CC1310_LAUNCHXL.icf"},
        GNU: {path: "/CC1310_LAUNCHXL/CC1310_LAUNCHXL.lds"}
    },
    compilerBuildOptions: {
        TI: " -I" + prodList["cc13xxware"].dir + " -Dccs",
        IAR: " -I" + prodList["cc13xxware"].dir + " -Dewarm",
        GNU: " -I" + prodList["cc13xxware"].dir + " -Dgcc"
    },
    linkerBuildOptions: {
        TI: " -l" + prodList["cc13xxware"].dir + "/driverlib/bin/ccs/driverlib.lib",
        IAR: " " + prodList["cc13xxware"].dir + "/driverlib/bin/iar/driverlib.lib",
        GNU: " -l:" + prodList["cc13xxware"].dir + "/driverlib/bin/gcc/driverlib.lib"
    },
    supportedDriverExamples: ["Empty", "Display", "PIN", "PWM", "RF", "UART", "ADCBuf", "ADC"]
};

var CC1350_LAUNCHXL = {
    name: "CC1350_LAUNCHXL",
    trexName: "CC1350 LaunchPad",
    developmentBoard: "CC1350-LAUNCHXL",
    productGroup: "CC13XX_CC26XX",
    family: "ARM",
    variant: "M3",
    deviceId: "Cortex M.CC1350F128",
    searchDirs: ["lprf", "cc13xx_cc26xx"],
    searchPaths: ["/source/rf/smartrf_settings/cc1350-lp", "/source/rf/sce/launchxl"],
    platform: "ti.platforms.simplelink:CC1350F128",
    driverlib: "cc13xxware",
    fileList: [
        {path: "/CC1350_LAUNCHXL/Board.h"},
        {path: "/CC1350_LAUNCHXL/CC1350_LAUNCHXL.c"},
        {path: "/CC1350_LAUNCHXL/CC1350_LAUNCHXL.h"},
        {path: "/CC1350_LAUNCHXL/ccfg.c"}
    ],
    linkercmd: {
        TI: {path: "/CC1350_LAUNCHXL/CC1350_LAUNCHXL.cmd"},
        IAR: {path: "/CC1350_LAUNCHXL/CC1350_LAUNCHXL.icf"},
        GNU: {path: "/CC1350_LAUNCHXL/CC1350_LAUNCHXL.lds"}
    },
    compilerBuildOptions: {
        TI: " -I" + prodList["cc13xxware"].dir + " -Dccs",
        IAR: " -I" + prodList["cc13xxware"].dir + " -Dewarm",
        GNU: " -I" + prodList["cc13xxware"].dir + " -Dgcc"
    },
    linkerBuildOptions: {
        TI: " -l" + prodList["cc13xxware"].dir + "/driverlib/bin/ccs/driverlib.lib",
        IAR: " " + prodList["cc13xxware"].dir + "/driverlib/bin/iar/driverlib.lib",
        GNU: " -l:" + prodList["cc13xxware"].dir + "/driverlib/bin/gcc/driverlib.lib"
    },
    supportedDriverExamples: ["Empty", "Display", "PIN", "PWM", "RF", "UART", "ADCBuf", "ADC"]
};

var CC1350STK = {
    name: "CC1350STK",
    trexName: "CC1350 SensorTag",
    developmentBoard: "CC1350 SensorTag",
    productGroup: "CC13XX_CC26XX",
    family: "ARM",
    variant: "M3",
    deviceId: "Cortex M.CC1350F128",
    searchDirs: ["lprf", "cc13xx_cc26xx"],
    searchPaths: ["/source/rf/smartrf_settings/cc1350-stk"],
    platform: "ti.platforms.simplelink:CC1350F128",
    driverlib: "cc13xxware",
    fileList: [
        {path: "/CC1350STK/Board.h"},
        {path: "/CC1350STK/CC1350STK.c"},
        {path: "/CC1350STK/CC1350STK.h"},
        {path: "/CC1350STK/ccfg.c"}
    ],
    linkercmd: {
        TI: {path: "/CC1350STK/CC1350STK.cmd"},
        IAR: {path: "/CC1350STK/CC1350STK.icf"},
        GNU: {path: "/CC1350STK/CC1350STK.lds"}
    },
    compilerBuildOptions: {
        TI: " -I" + prodList["cc13xxware"].dir + " -Dccs",
        IAR: " -I" + prodList["cc13xxware"].dir + " -Dewarm",
        GNU: " -I" + prodList["cc13xxware"].dir + " -Dgcc"
    },
    linkerBuildOptions: {
        TI: " -l" + prodList["cc13xxware"].dir + "/driverlib/bin/ccs/driverlib.lib",
        IAR: " " + prodList["cc13xxware"].dir + "/driverlib/bin/iar/driverlib.lib",
        GNU: " -l:" + prodList["cc13xxware"].dir + "/driverlib/bin/gcc/driverlib.lib"
    },
    supportedDriverExamples: ["Empty", "I2C", "Display", "PIN", "PWM", "RF", "UART", "PDM"]
};

var CC2650_LAUNCHXL= {
    name: "CC2650_LAUNCHXL",
    trexName: "CC2650 LaunchPad",
    developmentBoard: "CC2650-LAUNCHXL",
    productGroup: "CC13XX_CC26XX",
    family: "ARM",
    variant: "M3",
    deviceId: "Cortex M.CC2650F128",
    searchDirs: ["lprf", "cc13xx_cc26xx"],
    searchPaths: ["/source/rf/smartrf_settings/cc2650", "/source/rf/sce/launchxl"],
    platform: "ti.platforms.simplelink:CC2650F128",
    driverlib: "cc26xxware",
    fileList: [
        {path: "/CC2650_LAUNCHXL/Board.h"},
        {path: "/CC2650_LAUNCHXL/CC2650_LAUNCHXL.c"},
        {path: "/CC2650_LAUNCHXL/CC2650_LAUNCHXL.h"},
        {path: "/CC2650_LAUNCHXL/ccfg.c"}
    ],
    linkercmd: {
        TI: {path: "/CC2650_LAUNCHXL/CC2650_LAUNCHXL.cmd"},
        IAR: {path: "/CC2650_LAUNCHXL/CC2650_LAUNCHXL.icf"},
        GNU: {path: "/CC2650_LAUNCHXL/CC2650_LAUNCHXL.lds"}
    },
    compilerBuildOptions: {
        TI: " -I" + prodList["cc26xxware"].dir + " -Dccs",
        IAR: " -I" + prodList["cc26xxware"].dir + " -Dewarm",
        GNU: " -I" + prodList["cc26xxware"].dir + " -Dgcc"
    },
    linkerBuildOptions: {
        TI: " -l" + prodList["cc26xxware"].dir + "/driverlib/bin/ccs/driverlib.lib",
        IAR: " " + prodList["cc26xxware"].dir + "/driverlib/bin/iar/driverlib.lib",
        GNU: " -l:" + prodList["cc26xxware"].dir + "/driverlib/bin/gcc/driverlib.lib"
    },
    supportedDriverExamples: ["Empty", "Display", "PIN", "PWM", "RF", "UART", "ADCBuf", "ADC"]
};
var CC2650DK_4XS = {
    name: "CC2650DK_4XS",
    trexName: "CC2650 Development Kit (4XS)",
    developmentBoard: "CC2650DK_4XS",
    productGroup: "CC13XX_CC26XX",
    family: "ARM",
    variant: "M3",
    deviceId: "Cortex M.CC2650F128",
    searchDirs: ["lprf", "cc13xx_cc26xx"],
    searchPaths: ["/source/rf/smartrf_settings/cc2650", "/source/rf/sce/dk"],
    platform: "ti.platforms.simplelink:CC2650F128",
    driverlib: "cc26xxware",
    fileList: [
        {path: "/CC2650DK_4XS/Board.h"},
        {path: "/CC2650DK_4XS/CC2650DK_4XS.c"},
        {path: "/CC2650DK_4XS/CC2650DK_4XS.h"},
        {path: "/CC2650DK_4XS/ccfg.c"}
    ],
    linkercmd: {
        TI: {path: "/CC2650DK_4XS/CC2650DK_4XS.cmd"},
        IAR: {path: "/CC2650DK_4XS/CC2650DK_4XS.icf"},
        GNU: {path: "/CC2650DK_4XS/CC2650DK_4XS.lds"}
    },
    compilerBuildOptions: {
        TI: " -I" + prodList["cc26xxware"].dir + " -Dccs",
        IAR: " -I" + prodList["cc26xxware"].dir + " -Dewarm",
        GNU: " -I" + prodList["cc26xxware"].dir + " -Dgcc"
    },
    linkerBuildOptions: {
        TI: " -l" + prodList["cc26xxware"].dir + "/driverlib/bin/ccs/driverlib.lib",
        IAR: " " + prodList["cc26xxware"].dir + "/driverlib/bin/iar/driverlib.lib",
        GNU: " -l:" + prodList["cc26xxware"].dir + "/driverlib/bin/gcc/driverlib.lib"
    },
    supportedDriverExamples: ["Empty", "Display", "PIN", "PWM", "UART"]
};

var CC2650DK_5XD = {
    name: "CC2650DK_5XD",
    trexName: "CC2650 Development Kit (5XD)",
    developmentBoard: "CC2650DK_5XD",
    productGroup: "CC13XX_CC26XX",
    family: "ARM",
    variant: "M3",
    deviceId: "Cortex M.CC2650F128",
    searchDirs: ["lprf", "cc13xx_cc26xx"],
    searchPaths: ["/source/rf/smartrf_settings/cc2650", "/source/rf/sce/dk"],
    platform: "ti.platforms.simplelink:CC2650F128",
    driverlib: "cc26xxware",
    fileList: [
        {path: "/CC2650DK_5XD/Board.h"},
        {path: "/CC2650DK_5XD/CC2650DK_5XD.c"},
        {path: "/CC2650DK_5XD/CC2650DK_5XD.h"},
        {path: "/CC2650DK_5XD/ccfg.c"}
    ],
    linkercmd: {
        TI: {path: "/CC2650DK_5XD/CC2650DK_5XD.cmd"},
        IAR: {path: "/CC2650DK_5XD/CC2650DK_5XD.icf"},
        GNU: {path: "/CC2650DK_5XD/CC2650DK_5XD.lds"}
    },
    compilerBuildOptions: {
        TI: " -I" + prodList["cc26xxware"].dir + " -Dccs",
        IAR: " -I" + prodList["cc26xxware"].dir + " -Dewarm",
        GNU: " -I" + prodList["cc26xxware"].dir + " -Dgcc"
    },
    linkerBuildOptions: {
        TI: " -l" + prodList["cc26xxware"].dir + "/driverlib/bin/ccs/driverlib.lib",
        IAR: " " + prodList["cc26xxware"].dir + "/driverlib/bin/iar/driverlib.lib",
        GNU: " -l:" + prodList["cc26xxware"].dir + "/driverlib/bin/gcc/driverlib.lib"
    },
    supportedDriverExamples: ["Empty", "Display", "PIN", "PWM", "UART"]
};

var CC2650DK_7ID = {
    name: "CC2650DK_7ID",
    trexName: "CC2650 Development Kit (7ID)",
    developmentBoard: "CC2650DK_7ID",
    productGroup: "CC13XX_CC26XX",
    family: "ARM",
    variant: "M3",
    deviceId: "Cortex M.CC2650F128",
    searchDirs: ["lprf", "cc13xx_cc26xx"],
    searchPaths: ["/source/rf/smartrf_settings/cc2650", "/source/rf/sce/dk"],
    platform: "ti.platforms.simplelink:CC2650F128",
    driverlib: "cc26xxware",
    fileList: [
        {path: "/CC2650DK_7ID/Board.h"},
        {path: "/CC2650DK_7ID/CC2650DK_7ID.c"},
        {path: "/CC2650DK_7ID/CC2650DK_7ID.h"},
        {path: "/CC2650DK_7ID/ccfg.c"}
    ],
    linkercmd: {
        TI: {path: "/CC2650DK_7ID/CC2650DK_7ID.cmd"},
        IAR: {path: "/CC2650DK_7ID/CC2650DK_7ID.icf"},
        GNU: {path: "/CC2650DK_7ID/CC2650DK_7ID.lds"}
    },
    compilerBuildOptions: {
        TI: " -I" + prodList["cc26xxware"].dir + " -Dccs",
        IAR: " -I" + prodList["cc26xxware"].dir + " -Dewarm",
        GNU: " -I" + prodList["cc26xxware"].dir + " -Dgcc"
    },
    linkerBuildOptions: {
        TI: " -l" + prodList["cc26xxware"].dir + "/driverlib/bin/ccs/driverlib.lib",
        IAR: " " + prodList["cc26xxware"].dir + "/driverlib/bin/iar/driverlib.lib",
        GNU: " -l:" + prodList["cc26xxware"].dir + "/driverlib/bin/gcc/driverlib.lib"
    },
    supportedDriverExamples: ["Empty", "Display", "PIN", "PWM", "RF", "UART", "ADCBuf", "ADC"]
};

var CC2650STK = {
    name: "CC2650STK",
    trexName: "CC2650 SensorTag",
    developmentBoard: "CC2650 SensorTag",
    productGroup: "CC13XX_CC26XX",
    family: "ARM",
    variant: "M3",
    deviceId: "Cortex M.CC2650F128",
    searchDirs: ["lprf", "cc13xx_cc26xx"],
    platform: "ti.platforms.simplelink:CC2650F128",
    driverlib: "cc26xxware",
    fileList: [
        {path: "/CC2650STK/Board.h"},
        {path: "/CC2650STK/CC2650STK.c"},
        {path: "/CC2650STK/CC2650STK.h"},
        {path: "/CC2650STK/ccfg.c"}
    ],
    linkercmd: {
        TI: {path: "/CC2650STK/CC2650STK.cmd"},
        IAR: {path: "/CC2650STK/CC2650STK.icf"},
        GNU: {path: "/CC2650STK/CC2650STK.lds"}
    },
    compilerBuildOptions: {
        TI: " -I" + prodList["cc26xxware"].dir + " -Dccs",
        IAR: " -I" + prodList["cc26xxware"].dir + " -Dewarm",
        GNU: " -I" + prodList["cc26xxware"].dir + " -Dgcc"
    },
    linkerBuildOptions: {
        TI: " -l" + prodList["cc26xxware"].dir + "/driverlib/bin/ccs/driverlib.lib",
        IAR: " " + prodList["cc26xxware"].dir + "/driverlib/bin/iar/driverlib.lib",
        GNU: " -l:" + prodList["cc26xxware"].dir + "/driverlib/bin/gcc/driverlib.lib"
    },
    supportedDriverExamples: ["Empty", "Display", "I2C", "PIN", "PWM", "UART", "PDM"]
};

var CC3200_LAUNCHXL = {
    name: "CC3200_LAUNCHXL",
    trexName: "CC3200-LAUNCHXL SimpleLink Wi-Fi Launchpad",
    developmentBoard: "CC3200-LAUNCHXL",
    productGroup: "CC32XX",
    family: "ARM",
    variant: "M4",
    deviceId: "Cortex M.CC3200",
    searchDirs: ["cc3200_launchxl", "cc3200"],
    platform: "ti.platforms.simplelink:CC3200",
    driverlib: "cc32xxware",
    fileList: [
        {path: "/CC3200_LAUNCHXL/Board.h"},
        {path: "/CC3200_LAUNCHXL/CC3200_LAUNCHXL.c"},
        {path: "/CC3200_LAUNCHXL/CC3200_LAUNCHXL.h"},
        {path: "/CC3200_LAUNCHXL/pin_mux_config.h"}
    ],
    linkercmd: {
        TI: {path: "/CC3200_LAUNCHXL/CC3200_LAUNCHXL.cmd"},
        IAR: {path: "/CC3200_LAUNCHXL/CC3200_LAUNCHXL.icf"},
        GNU: {path: "/CC3200_LAUNCHXL/CC3200_LAUNCHXL.lds"}
    },
    compilerBuildOptions: {
        TI:
            " -I" + prodList["cc32xxware"].dir +
            " -I" + prodList["cc32xxware"].dir + "/inc" +
            " -I" + prodList["cc32xxware"].dir + "/driverlib" +
            " -Dccs -DCC32XXWARE",
        IAR:
            " -I" + prodList["cc32xxware"].dir +
            " -I" + prodList["cc32xxware"].dir + "/inc" +
            " -I" + prodList["cc32xxware"].dir + "/driverlib" +
            " -Dewarm -DCC32XXWARE",
        GNU:
            " -I" + prodList["cc32xxware"].dir +
            " -I" + prodList["cc32xxware"].dir + "/inc" +
            " -I" + prodList["cc32xxware"].dir + "/driverlib" +
            " -Dgcc -DCC32XXWARE",
    },
    linkerBuildOptions: {
        TI:
            " -l" + prodList["cc32xxware"].dir + "/driverlib/ccs/Release/driverlib.a",
        IAR:
            " " + prodList["cc32xxware"].dir + "/driverlib/ewarm/Release/Exe/driverlib.a",
        GNU:
            " -L" + prodList["cc32xxware"].dir + "/driverlib/gcc/exe -ldriver",
    },
    supportedDriverExamples: ["Empty", "FatFs", "GPIO", "I2C", "I2S", "PWM", "SPI", "UART", "Watchdog"],
    supportedNetworkExamples: ["WiFi"]
};

var CC3220_LAUNCHXL = {
    name: "CC3220_LAUNCHXL",
    trexName: "CC3220-LAUNCHXL SimpleLink Wi-Fi Launchpad",
    developmentBoard: "CC3220-LAUNCHXL",
    productGroup: "CC32XX",
    family: "ARM",
    variant: "M4",
    deviceId: "Cortex M.CC3220",
    searchDirs: ["cc3200_launchxl", "cc3220", "cc3200"],
    platform: "ti.platforms.simplelink:CC3220",
    driverlib: "cc32xxware",
    fileList: [
        {path: "/CC3220_LAUNCHXL/Board.h"},
        {path: "/CC3220_LAUNCHXL/CC3220_LAUNCHXL.c"},
        {path: "/CC3220_LAUNCHXL/CC3220_LAUNCHXL.h"},
        {path: "/CC3220_LAUNCHXL/pin_mux_config.h"}
    ],
    linkercmd: {
        TI: {path: "/CC3220_LAUNCHXL/CC3220_LAUNCHXL.cmd"},
        IAR: {path: "/CC3220_LAUNCHXL/CC3220_LAUNCHXL.icf"},
        GNU: {path: "/CC3220_LAUNCHXL/CC3220_LAUNCHXL.lds"}
    },
    compilerBuildOptions: {
        TI:
            " -I" + prodList["cc32xxware"].dir +
            " -I" + prodList["cc32xxware"].dir + "/inc" +
            " -I" + prodList["cc32xxware"].dir + "/driverlib" +
            " -Dccs -DCC32XXWARE",
        IAR:
            " -I" + prodList["cc32xxware"].dir +
            " -I" + prodList["cc32xxware"].dir + "/inc" +
            " -I" + prodList["cc32xxware"].dir + "/driverlib" +
            " -Dewarm -DCC32XXWARE",
        GNU:
            " -I" + prodList["cc32xxware"].dir +
            " -I" + prodList["cc32xxware"].dir + "/inc" +
            " -I" + prodList["cc32xxware"].dir + "/driverlib" +
            " -Dgcc -DCC32XXWARE",
    },
    linkerBuildOptions: {
        TI:
            " -l" + prodList["cc32xxware"].dir + "/driverlib/ccs/Release/driverlib.a",
        IAR:
            " " + prodList["cc32xxware"].dir + "/driverlib/ewarm/Release/Exe/driverlib.a",
        GNU:
            " -L" + prodList["cc32xxware"].dir + "/driverlib/gcc/exe -ldriver",
    },
    supportedDriverExamples: ["Empty", "FatFs", "GPIO", "I2C", "I2S", "PWM", "SPI", "UART", "Watchdog"]
};

var CC3220S_LAUNCHXL = {
    name: "CC3220S_LAUNCHXL",
    trexName: "CC3220S-LAUNCHXL SimpleLink Wi-Fi Launchpad",
    developmentBoard: "CC3220S-LAUNCHXL",
    productGroup: "CC32XX",
    family: "ARM",
    variant: "M4",
    deviceId: "Cortex M.CC3220S",
    searchDirs: ["cc3200_launchxl", "cc3220", "cc3200"],
    platform: "ti.platforms.simplelink:CC3220S",
    driverlib: "cc32xxware",
    fileList: [
        {path: "/CC3220_LAUNCHXL/Board.h"},
        {path: "/CC3220_LAUNCHXL/CC3220_LAUNCHXL.c"},
        {path: "/CC3220_LAUNCHXL/CC3220_LAUNCHXL.h"},
        {path: "/CC3220_LAUNCHXL/pin_mux_config.h"}
    ],
    linkercmd: {
        TI: {path: "/CC3220_LAUNCHXL/CC3220S_LAUNCHXL.cmd"},
        IAR: {path: "/CC3220_LAUNCHXL/CC3220S_LAUNCHXL.icf"},
        GNU: {path: "/CC3220_LAUNCHXL/CC3220S_LAUNCHXL.lds"}
    },
    compilerBuildOptions: {
        TI:
            " -I" + prodList["cc32xxware"].dir +
            " -I" + prodList["cc32xxware"].dir + "/inc" +
            " -I" + prodList["cc32xxware"].dir + "/driverlib" +
            " -Dccs -DCC32XXWARE",
        IAR:
            " -I" + prodList["cc32xxware"].dir +
            " -I" + prodList["cc32xxware"].dir + "/inc" +
            " -I" + prodList["cc32xxware"].dir + "/driverlib" +
            " -Dewarm -DCC32XXWARE",
        GNU:
            " -I" + prodList["cc32xxware"].dir +
            " -I" + prodList["cc32xxware"].dir + "/inc" +
            " -I" + prodList["cc32xxware"].dir + "/driverlib" +
            " -Dgcc -DCC32XXWARE",
    },
    linkerBuildOptions: {
        TI:
            " -l" + prodList["cc32xxware"].dir + "/driverlib/ccs/Release/driverlib.a",
        IAR:
            " " + prodList["cc32xxware"].dir + "/driverlib/ewarm/Release/Exe/driverlib.a",
        GNU:
            " -L" + prodList["cc32xxware"].dir + "/driverlib/gcc/exe -ldriver",
    },
    supportedDriverExamples: ["Empty", "FatFs", "GPIO", "I2C", "I2S", "PWM", "SPI", "UART", "Watchdog"]
};

var CC3220SF_LAUNCHXL = {
    name: "CC3220SF_LAUNCHXL",
    trexName: "CC3220SF-LAUNCHXL SimpleLink Wi-Fi Launchpad",
    developmentBoard: "CC3220SF-LAUNCHXL",
    productGroup: "CC32XX",
    family: "ARM",
    variant: "M4",
    deviceId: "Cortex M.CC3220SF",
    searchDirs: ["cc3200_launchxl", "cc3220", "cc3200"],
    platform: "ti.platforms.simplelink:CC3220SF",
    driverlib: "cc32xxware",
    fileList: [
        {path: "/CC3220_LAUNCHXL/Board.h"},
        {path: "/CC3220_LAUNCHXL/CC3220_LAUNCHXL.c"},
        {path: "/CC3220_LAUNCHXL/CC3220_LAUNCHXL.h"},
        {path: "/CC3220_LAUNCHXL/pin_mux_config.h"}
    ],
    linkercmd: {
        TI: {path: "/CC3220_LAUNCHXL/CC3220SF_LAUNCHXL.cmd"},
        IAR: {path: "/CC3220_LAUNCHXL/CC3220SF_LAUNCHXL.icf"},
        GNU: {path: "/CC3220_LAUNCHXL/CC3220SF_LAUNCHXL.lds"}
    },
    compilerBuildOptions: {
        TI:
            " -I" + prodList["cc32xxware"].dir +
            " -I" + prodList["cc32xxware"].dir + "/inc" +
            " -I" + prodList["cc32xxware"].dir + "/driverlib" +
            " -Dccs -DCC32XXWARE",
        IAR:
            " -I" + prodList["cc32xxware"].dir +
            " -I" + prodList["cc32xxware"].dir + "/inc" +
            " -I" + prodList["cc32xxware"].dir + "/driverlib" +
            " -Dewarm -DCC32XXWARE",
        GNU:
            " -I" + prodList["cc32xxware"].dir +
            " -I" + prodList["cc32xxware"].dir + "/inc" +
            " -I" + prodList["cc32xxware"].dir + "/driverlib" +
            " -Dgcc -DCC32XXWARE",
    },
    linkerBuildOptions: {
        TI:
            " -l" + prodList["cc32xxware"].dir + "/driverlib/ccs/Release/driverlib.a",
        IAR:
            " " + prodList["cc32xxware"].dir + "/driverlib/ewarm/Release/Exe/driverlib.a",
        GNU:
            " -L" + prodList["cc32xxware"].dir + "/driverlib/gcc/exe -ldriver",
    },
    supportedDriverExamples: ["Empty", "FatFs", "GPIO", "I2C", "I2S", "PWM", "SPI", "UART", "Watchdog"]
};

var DK_TM4C129X = {
    name: "DK_TM4C129X",
    trexName: "DK-TM4C129X Evaluation Kit",
    developmentBoard: "DK-TM4C129X",
    productGroup: "TivaC",
    family: "ARM",
    variant: "M4F",
    deviceId: "Cortex M.TM4C129XNCZAD",
    searchDirs: ["dk_tm4c129x"],
    platform: "ti.platforms.tiva:TM4C129XNCZAD",
    driverlib: "tivaware",
    fileList: [
        {path: "/DK_TM4C129X/Board.h"},
        {path: "/DK_TM4C129X/DK_TM4C129X.c"},
        {path: "/DK_TM4C129X/DK_TM4C129X.h"}
    ],
    linkercmd: {
        TI: {path: "/DK_TM4C129X/DK_TM4C129X.cmd"},
        IAR: {path: "/DK_TM4C129X/DK_TM4C129X.icf"},
        GNU: {path: "/DK_TM4C129X/DK_TM4C129X.lds"}
    },
    compilerBuildOptions: {
        TI:
            " -I" + prodList["tivaware"].dir +
            " -I" + prodList["bios"].packages + "/ti/sysbios/posix" +
            " -DPART_TM4C129XNCZAD -Dccs -DTIVAWARE",
        IAR:
            " -I" + prodList["tivaware"].dir +
            " -I" + prodList["bios"].packages + "/ti/sysbios/posix" +
            " -DPART_TM4C129XNCZAD -Dewarm -DTIVAWARE",
        GNU:
            " -I" + prodList["tivaware"].dir +
            " -I" + prodList["bios"].packages + "/ti/sysbios/posix" +
            " -D_POSIX_SOURCE -D PART_TM4C129XNCZAD -D gcc -D TIVAWARE",
    },
    linkerBuildOptions: {
        TI:
            " -l" + prodList["tivaware"].dir + "/grlib/ccs/Debug/grlib.lib" +
            " -l" + prodList["tivaware"].dir + "/usblib/ccs/Debug/usblib.lib" +
            " -l" + prodList["tivaware"].dir + "/driverlib/ccs/Debug/driverlib.lib",
        IAR:
            " " + prodList["tivaware"].dir + "/grlib/ewarm/Exe/grlib.a" +
            " " + prodList["tivaware"].dir + "/usblib/ewarm/Exe/usblib.a" +
            " " + prodList["tivaware"].dir + "/driverlib/ewarm/Exe/driverlib.a",
        GNU:
            " -L" + prodList["tivaware"].dir + "/driverlib/gcc" +
            " -L" + prodList["tivaware"].dir + "/grlib/gcc" +
            " -L" + prodList["tivaware"].dir + "/usblib/gcc" +
            " -lgr -lusb -ldriver",
    },
    supportedDriverExamples: ["Empty", "FatFs", "GPIO", "I2C", "PWM", "SPI", "UART", "USB", "Watchdog"],
    supportedNetworkExamples: ["Ethernet", "PPP", "WiFi"]
};

var EK_TM4C123GXL = {
    name: "EK_TM4C123GXL",
    trexName: "EK-TM4C123GXL Evaluation Kit",
    developmentBoard: "EK-TM4C123GXL",
    productGroup: "TivaC",
    family: "ARM",
    variant: "M4F",
    deviceId: "Cortex M.TM4C123GH6PM",
    searchDirs: ["ek_tm4c123gxl"],
    platform: "ti.platforms.tiva:TM4C123GH6PM",
    driverlib: "tivaware",
    fileList: [
        {path: "/EK_TM4C123GXL/Board.h"},
        {path: "/EK_TM4C123GXL/EK_TM4C123GXL.c"},
        {path: "/EK_TM4C123GXL/EK_TM4C123GXL.h"}
    ],
    linkercmd: {
        TI: {path: "/EK_TM4C123GXL/EK_TM4C123GXL.cmd"},
        IAR: {path: "/EK_TM4C123GXL/EK_TM4C123GXL.icf"},
        GNU: {path: "/EK_TM4C123GXL/EK_TM4C123GXL.lds"}
    },
    compilerBuildOptions: {
        TI:
            " -I" + prodList["tivaware"].dir +
            " -I" + prodList["bios"].packages + "/ti/sysbios/posix" +
            " -DPART_TM4C123GH6PM -Dccs -DTIVAWARE",
        IAR:
            " -I" + prodList["tivaware"].dir +
            " -I" + prodList["bios"].packages + "/ti/sysbios/posix" +
            " -DPART_TM4C123GH6PM -Dewarm -DTIVAWARE",
        GNU:
            " -I" + prodList["tivaware"].dir +
            " -I" + prodList["bios"].packages + "/ti/sysbios/posix" +
            " -D_POSIX_SOURCE -D PART_TM4C123GH6PM -D gcc -D TIVAWARE",
    },
    linkerBuildOptions: {
        TI:
            " -l" + prodList["tivaware"].dir + "/grlib/ccs/Debug/grlib.lib" +
            " -l" + prodList["tivaware"].dir + "/usblib/ccs/Debug/usblib.lib" +
            " -l" + prodList["tivaware"].dir + "/driverlib/ccs/Debug/driverlib.lib",
        IAR:
            " " + prodList["tivaware"].dir + "/grlib/ewarm/Exe/grlib.a" +
            " " + prodList["tivaware"].dir + "/usblib/ewarm/Exe/usblib.a" +
            " " + prodList["tivaware"].dir + "/driverlib/ewarm/Exe/driverlib.a",
        GNU:
            " -L" + prodList["tivaware"].dir + "/grlib/gcc" +
            " -L" + prodList["tivaware"].dir + "/usblib/gcc" +
            " -L" + prodList["tivaware"].dir + "/driverlib/gcc" +
            " -lgr -lusb -ldriver",
    },
    supportedDriverExamples: ["Empty", "FatFs", "GPIO", "I2C", "PWM", "SPI", "UART", "USB", "Watchdog"],
    supportedNetworkExamples: ["WiFi"]
};

var EK_TM4C1294XL = {
    name: "EK_TM4C1294XL",
    trexName: "EK-TM4C1294XL Evaluation Kit",
    developmentBoard: "EK-TM4C1294XL",
    productGroup: "TivaC",
    family: "ARM",
    variant: "M4F",
    deviceId: "Cortex M.TM4C1294NCPDT",
    searchDirs: ["ek_tm4c1294xl"],
    platform: "ti.platforms.tiva:TM4C1294NCPDT",
    driverlib: "tivaware",
    fileList: [
        {path: "/EK_TM4C1294XL/Board.h"},
        {path: "/EK_TM4C1294XL/EK_TM4C1294XL.c"},
        {path: "/EK_TM4C1294XL/EK_TM4C1294XL.h"}
    ],
    linkercmd: {
        TI: {path: "/EK_TM4C1294XL/EK_TM4C1294XL.cmd"},
        IAR: {path: "/EK_TM4C1294XL/EK_TM4C1294XL.icf"},
        GNU: {path: "/EK_TM4C1294XL/EK_TM4C1294XL.lds"}
    },
    compilerBuildOptions: {
        TI:
            " -I" + prodList["tivaware"].dir +
            " -I" + prodList["bios"].packages + "/ti/sysbios/posix" +
            " -DPART_TM4C1294NCPDT -Dccs -DTIVAWARE",
        IAR:
            " -I" + prodList["tivaware"].dir +
            " -I" + prodList["bios"].packages + "/ti/sysbios/posix" +
            " -DPART_TM4C1294NCPDT -Dewarm -DTIVAWARE",
        GNU:
            " -I" + prodList["tivaware"].dir +
            " -I" + prodList["bios"].packages + "/ti/sysbios/posix" +
            " -D_POSIX_SOURCE -D PART_TM4C1294NCPDT -D gcc -D TIVAWARE",
    },
    linkerBuildOptions: {
        TI:
            " -l" + prodList["tivaware"].dir + "/grlib/ccs/Debug/grlib.lib" +
            " -l" + prodList["tivaware"].dir + "/usblib/ccs/Debug/usblib.lib" +
            " -l" + prodList["tivaware"].dir + "/driverlib/ccs/Debug/driverlib.lib",
        IAR:
            " " + prodList["tivaware"].dir + "/grlib/ewarm/Exe/grlib.a" +
            " " + prodList["tivaware"].dir + "/usblib/ewarm/Exe/usblib.a" +
            " " + prodList["tivaware"].dir + "/driverlib/ewarm/Exe/driverlib.a",
        GNU:
            " -L" + prodList["tivaware"].dir + "/grlib/gcc" +
            " -L" + prodList["tivaware"].dir + "/usblib/gcc" +
            " -L" + prodList["tivaware"].dir + "/driverlib/gcc" +
            " -lgr -lusb -ldriver",
    },
    supportedDriverExamples: ["Empty", "FatFs", "GPIO", "I2C", "PWM", "SPI", "UART", "USB", "Watchdog"],
    supportedNetworkExamples: ["Ethernet", "PPP", "WiFi"]
};

var EK_TM4C129EXL = {
    name: "EK_TM4C129EXL",
    trexName: "EK-TM4C129EXL Evaluation Kit",
    developmentBoard: "EK-TM4C129EXL",
    productGroup: "TivaC",
    family: "ARM",
    variant: "M4F",
    deviceId: "Cortex M.TM4C129ENCPDT",
    searchDirs: ["ek_tm4c129exl"],
    platform: "ti.platforms.tiva:TM4C129ENCPDT",
    driverlib: "tivaware",
    fileList: [
        {path: "/EK_TM4C129EXL/Board.h"},
        {path: "/EK_TM4C129EXL/EK_TM4C129EXL.c"},
        {path: "/EK_TM4C129EXL/EK_TM4C129EXL.h"}
    ],
    linkercmd: {
        TI: {path: "/EK_TM4C129EXL/EK_TM4C129EXL.cmd"},
        IAR: {path: "/EK_TM4C129EXL/EK_TM4C129EXL.icf"},
        GNU: {path: "/EK_TM4C129EXL/EK_TM4C129EXL.lds"}
    },
    compilerBuildOptions: {
        TI:
            " -I" + prodList["tivaware"].dir +
            " -I" + prodList["bios"].packages + "/ti/sysbios/posix" +
            " -DPART_TM4C129ENCPDT -Dccs -DTIVAWARE",
        IAR:
            " -I" + prodList["tivaware"].dir +
            " -I" + prodList["bios"].packages + "/ti/sysbios/posix" +
            " -DPART_TM4C129ENCPDT -Dewarm -DTIVAWARE",
        GNU:
            " -I" + prodList["tivaware"].dir +
            " -I" + prodList["bios"].packages + "/ti/sysbios/posix" +
            " -D_POSIX_SOURCE -D PART_TM4C129ENCPDT -D gcc -D TIVAWARE",
    },
    linkerBuildOptions: {
        TI:
            " -l" + prodList["tivaware"].dir + "/grlib/ccs/Debug/grlib.lib" +
            " -l" + prodList["tivaware"].dir + "/usblib/ccs/Debug/usblib.lib" +
            " -l" + prodList["tivaware"].dir + "/driverlib/ccs/Debug/driverlib.lib",
        IAR:
            " " + prodList["tivaware"].dir + "/grlib/ewarm/Exe/grlib.a" +
            " " + prodList["tivaware"].dir + "/usblib/ewarm/Exe/usblib.a" +
            " " + prodList["tivaware"].dir + "/driverlib/ewarm/Exe/driverlib.a",
        GNU:
            " -L" + prodList["tivaware"].dir + "/grlib/gcc" +
            " -L" + prodList["tivaware"].dir + "/usblib/gcc" +
            " -L" + prodList["tivaware"].dir + "/driverlib/gcc" +
            " -lgr -lusb -ldriver",
    },
    supportedDriverExamples: ["Empty", "FatFs", "GPIO", "I2C", "PWM", "SPI", "UART", "USB", "Watchdog"],
    supportedNetworkExamples: ["Ethernet", "PPP", "WiFi"]
};

var MSP_EXP430F5529LP = {
    name: "MSP_EXP430F5529LP",
    trexName: "MSP-EXP430F5529 Launchpad",
    developmentBoard: "MSP-EXP430F5529LP",
    productGroup: "MSP430",
    family: "MSP430",
    variant: "MSP430",
    deviceId: "MSP430F5529",
    searchDirs: ["msp_exp430f5529lp", "msp430"],
    platform: "ti.platforms.msp430:MSP430F5529",
    driverlib: "msp430DriverLib",
    fileList: [
        {path: "/MSP_EXP430F5529LP/Board.h"},
        {path: "/MSP_EXP430F5529LP/MSP_EXP430F5529LP.c"},
        {path: "/MSP_EXP430F5529LP/MSP_EXP430F5529LP.h"}
    ],
    linkercmd: {
        TI: {path: "/MSP_EXP430F5529LP/MSP_EXP430F5529LP.cmd"},
        IAR: {path: "/MSP_EXP430F5529LP/MSP_EXP430F5529LP.xcl"}
    },
    compilerBuildOptions: {
        TI:
            msp43xOptions.getCompilerLinkerOptions("MSP430F5529", msp43xExtraOptions, "TI").cOpts +
            " --use_hw_mpy=F5 --silicon_errata=CPU21 --silicon_errata=CPU22" +
            " --silicon_errata=CPU23 --silicon_errata=CPU40 -Dccs -DMSP430WARE",
        IAR:
            msp43xOptions.getCompilerLinkerOptions("MSP430F5529", msp43xExtraOptions, "IAR").cOpts +
            " -Dewarm -DMSP430WARE",
    },
    linkerBuildOptions: {
        TI:
            msp43xOptions.getCompilerLinkerOptions("MSP430F5529", msp43xExtraOptions, "TI").lOpts,
        IAR:
            msp43xOptions.getCompilerLinkerOptions("MSP430F5529", msp43xExtraOptions, "IAR").lOpts
    },
    supportedDriverExamples: ["Empty", "FatFs", "GPIO", "I2C", "UART", "USB", "Watchdog"],
    supportedNetworkExamples: ["WiFi"]
};

var MSP_EXP430FR5969 = {
    name: "MSP_EXP430FR5969",
    trexName: "MSP-EXP430FR5969 Launchpad",
    developmentBoard: "MSP-EXP430FR5969",
    productGroup: "MSP430",
    family: "MSP430",
    variant: "MSP430",
    deviceId: "MSP430FR5969",
    searchDirs: ["msp_exp430fr5969", "msp430"],
    platform: "ti.platforms.msp430:MSP430FR5969",
    driverlib: "msp430DriverLib",
    fileList: [
        {path: "/MSP_EXP430FR5969/Board.h"},
        {path: "/MSP_EXP430FR5969/MSP_EXP430FR5969.c"},
        {path: "/MSP_EXP430FR5969/MSP_EXP430FR5969.h"}
    ],
    linkercmd: {
        TI: {path: "/MSP_EXP430FR5969/MSP_EXP430FR5969.cmd"},
        IAR: {path: "/MSP_EXP430FR5969/MSP_EXP430FR5969.xcl"}
    },
    compilerBuildOptions: {
        TI:
            msp43xOptions.getCompilerLinkerOptions("MSP430FR5969", msp43xExtraOptions, "TI").cOpts +
            " --use_hw_mpy=F5 --silicon_errata=CPU21 --silicon_errata=CPU22" +
            " --silicon_errata=CPU40 -D_MPU_ENABLE -Dccs -DMSP430WARE",
        IAR:
            msp43xOptions.getCompilerLinkerOptions("MSP430FR5969", msp43xExtraOptions, "IAR").cOpts +
            " -Dewarm -DMSP430WARE",
    },
    linkerBuildOptions: {
        TI:
            msp43xOptions.getCompilerLinkerOptions("MSP430FR5969", msp43xExtraOptions, "TI").lOpts,
        IAR:
            msp43xOptions.getCompilerLinkerOptions("MSP430FR5969", msp43xExtraOptions, "IAR").lOpts
    },
    supportedDriverExamples: ["Demo", "Empty", "FatFs", "GPIO", "I2C", "UART", "Watchdog"],
    supportedNetworkExamples: ["WiFi"]
};

var MSP_EXP430FR5994 = {
    name: "MSP_EXP430FR5994",
    trexName: "MSP-EXP430FR5994 Launchpad",
    developmentBoard: "MSP-EXP430FR5994",
    productGroup: "MSP430",
    family: "MSP430",
    variant: "MSP430",
    deviceId: "MSP430FR5994",
    searchDirs: ["msp_exp430fr5994", "msp430"],
    platform: "ti.platforms.msp430:MSP430FR5994",
    driverlib: "msp430DriverLib",
    fileList: [
        {path: "/MSP_EXP430FR5994/Board.h"},
        {path: "/MSP_EXP430FR5994/MSP_EXP430FR5994.c"},
        {path: "/MSP_EXP430FR5994/MSP_EXP430FR5994.h"}
    ],
    linkercmd: {
        TI: {path: "/MSP_EXP430FR5994/MSP_EXP430FR5994.cmd"},
        IAR: {path: "/MSP_EXP430FR5994/MSP_EXP430FR5994.xcl"}
    },
    compilerBuildOptions: {
        TI:
            msp43xOptions.getCompilerLinkerOptions("MSP430FR5994", msp43xExtraOptions, "TI").cOpts +
            " --use_hw_mpy=F5 --silicon_errata=CPU21 --silicon_errata=CPU22" +
            " --silicon_errata=CPU40 -D_MPU_ENABLE -Dccs -DMSP430WARE",
        IAR:
            msp43xOptions.getCompilerLinkerOptions("MSP430FR5994", msp43xExtraOptions, "IAR").cOpts +
            " -Dewarm -DMSP430WARE",
    },
    linkerBuildOptions: {
        TI:
            msp43xOptions.getCompilerLinkerOptions("MSP430FR5994", msp43xExtraOptions, "TI").lOpts,
        IAR:
            msp43xOptions.getCompilerLinkerOptions("MSP430FR5994", msp43xExtraOptions, "IAR").lOpts
    },
    supportedDriverExamples: ["Demo", "Empty", "FatFs", "GPIO", "I2C", "UART", "Watchdog"],
};

var MSP_EXP430FR6989 = {
    name: "MSP_EXP430FR6989",
    trexName: "MSP-EXP430FR6989 Launchpad",
    developmentBoard: "MSP-EXP430FR6989",
    productGroup: "MSP430",
    family: "MSP430",
    variant: "MSP430",
    deviceId: "MSP430FR6989",
    searchDirs: ["msp_exp430fr6989", "msp430"],
    platform: "ti.platforms.msp430:MSP430FR6989",
    driverlib: "msp430DriverLib",
    fileList: [
        {path: "/MSP_EXP430FR6989/Board.h"},
        {path: "/MSP_EXP430FR6989/MSP_EXP430FR6989.c"},
        {path: "/MSP_EXP430FR6989/MSP_EXP430FR6989.h"}
    ],
    linkercmd: {
        TI: {path: "/MSP_EXP430FR6989/MSP_EXP430FR6989.cmd"},
        IAR: {path: "/MSP_EXP430FR6989/MSP_EXP430FR6989.xcl"}
    },
    compilerBuildOptions: {
        TI:
            msp43xOptions.getCompilerLinkerOptions("MSP430FR6989", msp43xExtraOptions, "TI").cOpts +
            " --use_hw_mpy=F5 --silicon_errata=CPU21 --silicon_errata=CPU22" +
            " --silicon_errata=CPU40 -D_MPU_ENABLE -Dccs -DMSP430WARE",
        IAR:
            msp43xOptions.getCompilerLinkerOptions("MSP430FR6989", msp43xExtraOptions, "IAR").cOpts +
            " -Dewarm -DMSP430WARE",
    },
    linkerBuildOptions: {
        TI:
            msp43xOptions.getCompilerLinkerOptions("MSP430FR6989", msp43xExtraOptions, "TI").lOpts,
        IAR:
            msp43xOptions.getCompilerLinkerOptions("MSP430FR6989", msp43xExtraOptions, "IAR").lOpts
    },
    supportedDriverExamples: [ "Empty", "FatFs", "GPIO", "I2C", "UART", "Watchdog"],
    supportedNetworkExamples: ["WiFi"]
};

var MSP_EXP432P401R = {
    name: "MSP_EXP432P401R",
    trexName: "MSP-EXP432P401R Launchpad",
    developmentBoard: "MSP-EXP432P401R",
    productGroup: "MSP430",
    family: "MSP432",
    variant: "M4F",
    deviceId: "MSP432P401R",
    searchDirs: ["msp_exp432p401r", "msp432p401r", "msp432"],
    platform: "ti.platforms.msp432:MSP432P401R",
    driverlib: "msp432DriverLib",
    fileList: [
        {path: "/MSP_EXP432P401R/Board.h"},
        {path: "/MSP_EXP432P401R/MSP_EXP432P401R.c"},
        {path: "/MSP_EXP432P401R/MSP_EXP432P401R.h"}
    ],
    linkercmd: {
        TI: {path: "/MSP_EXP432P401R/MSP_EXP432P401R.cmd"},
        IAR: {path: "/MSP_EXP432P401R/MSP_EXP432P401R.icf"},
        GNU: {path: "/MSP_EXP432P401R/MSP_EXP432P401R.lds"}
    },
    compilerBuildOptions: {
        TI:
            msp43xOptions.getCompilerLinkerOptions("MSP432P401R", msp43xExtraOptions, "TI").cOpts +
            " -Dccs -DMSP432WARE",
        IAR:
            msp43xOptions.getCompilerLinkerOptions("MSP432P401R", msp43xExtraOptions, "IAR").cOpts +
            " -Dewarm -DMSP432WARE",
        GNU:
            msp43xOptions.getCompilerLinkerOptions("MSP432P401R", msp43xExtraOptions, "GNU").cOpts +
            " -D_POSIX_SOURCE -D gcc -D MSP432WARE",
    },
    linkerBuildOptions: {
        TI:
            msp43xOptions.getCompilerLinkerOptions("MSP432P401R", msp43xExtraOptions, "TI").lOpts,
        IAR:
            msp43xOptions.getCompilerLinkerOptions("MSP432P401R", msp43xExtraOptions, "IAR").lOpts,
        GNU:
            msp43xOptions.getCompilerLinkerOptions("MSP432P401R", msp43xExtraOptions, "GNU").lOpts,
    },
    supportedDriverExamples: ["ADC", "Empty", "FatFs", "GPIO", "I2C", "PWM", "SPI", "UART", "Watchdog"],
    supportedNetworkExamples: ["WiFi"]
};

var TMDXDOCK28M36_M3 = {
    name: "TMDXDOCK28M36_M3",
    trexName: "TMDXDOCK28M36 Experimenter Kit",
    developmentBoard: "TMDSDOCK28M36",
    productGroup: "C2000",
    family: "ARM",
    variant: "M3",
    deviceId: "Cortex M.F28M36P63C2",
    searchDirs: ["tmdxdock28m36_m3", "concerto_m3"],
    platform: "ti.platforms.concertoM3:F28M36P63C2",
    driverlib: "mware",
    fileList: [
        {path: "/TMDXDOCK28M36/Board.h"},
        {path: "/TMDXDOCK28M36/TMDXDOCK28M36.c"},
        {path: "/TMDXDOCK28M36/TMDXDOCK28M36.h"}
    ],
    linkercmd: {
        TI: {path: "/TMDXDOCK28M36/TMDXDOCK28M36_M3.cmd"}
    },
    compilerBuildOptions: {
        TI:
            " -I" + prodList["mware"].dir +
            " -I" + prodList["bios"].packages + "/ti/sysbios/posix" +
            " -Dccs -DMWARE",
    },
    linkerBuildOptions: {
        TI:
            " -l" + prodList["mware"].dir + "/grlib/ccs/Debug/grlib.lib" +
            " -l" + prodList["mware"].dir + "/usblib/ccs/Debug/usblib.lib" +
            " -l" + prodList["mware"].dir + "/driverlib/ccs/Debug/driverlib.lib",
    },
    supportedDriverExamples: ["Empty", "FatFs", "GPIO", "I2C", "SPI", "UART", "USB", "Watchdog"],
    supportedNetworkExamples: ["Ethernet"]
};

var TMDXDOCK28M36_C28 = {
    name: "TMDXDOCK28M36_C28",
    trexName: "TMDXDOCK28M36 Experimenter Kit",
    developmentBoard: "TMDSDOCK28M36",
    productGroup: "C2000",
    family: "C2000",
    variant: "C28",
    deviceId: "TMS320C28XX.F28M36P63C2",
    searchDirs: ["tmdxdock28m36_c28","concerto_c28", "c28"],
    platform: "ti.platforms.concertoC28:F28M36P63C2",
    driverlib: "mware",
    fileList: [],
    linkercmd: {
        TI: {path: "/TMDXDOCK28M36/TMDXDOCK28M36_C28.cmd"}
    },
    compilerBuildOptions: {
        TI: " "
    },
    linkerBuildOptions: {
        TI: " "
    }
};

var TMDXDOCKH52C1_M3 = {
    name: "TMDXDOCKH52C1_M3",
    trexName: "TMDXDOCKH52C1 Experimenter Kit",
    developmentBoard: "TMDSDOCKH52C1",
    productGroup: "C2000",
    family: "ARM",
    variant: "M3",
    deviceId: "Cortex M.F28M35H52C1",
    searchDirs: ["tmdxdockh52c1_m3", "concerto_m3"],
    platform: "ti.platforms.concertoM3:F28M35H52C1",
    driverlib: "mware",
    fileList: [
        {path: "/TMDXDOCKH52C1/Board.h"},
        {path: "/TMDXDOCKH52C1/TMDXDOCKH52C1.c"},
        {path: "/TMDXDOCKH52C1/TMDXDOCKH52C1.h"}
    ],
    linkercmd: {
        TI: {path: "/TMDXDOCKH52C1/TMDXDOCKH52C1_M3.cmd"}
    },
    compilerBuildOptions: {
        TI:
            " -I" + prodList["mware"].dir +
            " -I" + prodList["bios"].packages + "/ti/sysbios/posix" +
            " -Dccs -DMWARE",
    },
    linkerBuildOptions: {
        TI:
            " -l" + prodList["mware"].dir + "/grlib/ccs/Debug/grlib.lib" +
            " -l" + prodList["mware"].dir + "/usblib/ccs/Debug/usblib.lib" +
            " -l" + prodList["mware"].dir + "/driverlib/ccs/Debug/driverlib.lib",
    },
    supportedDriverExamples: ["Empty", "FatFs", "GPIO", "I2C", "SPI", "UART", "USB", "Watchdog"],
    supportedNetworkExamples: ["Ethernet"]
};

var TMDXDOCKH52C1_C28 = {
    name: "TMDXDOCKH52C1_C28",
    trexName: "TMDXDOCKH52C1 Experimenter Kit",
    developmentBoard: "TMDSDOCKH52C1",
    productGroup: "C2000",
    family: "C2000",
    variant: "C28",
    deviceId: "TMS320C28XX.F28M35H52C1",
    searchDirs: ["tmdxdockh52c1_c28", "concerto_c28", "c28"],
    platform: "ti.platforms.concertoC28:F28M35M52C1",
    driverlib: "mware",
    fileList: [],
    linkercmd: {
        TI: {path: "/TMDXDOCKH52C1/TMDXDOCKH52C1_C28.cmd"}
    },
    compilerBuildOptions: {
        TI: " "
    },
    linkerBuildOptions: {
        TI: " "
    }
};

var allBoards = [
    CC1310DK_7XD,
    CC1310_LAUNCHXL,
    CC1350_LAUNCHXL,
    CC1350STK,
    CC2650_LAUNCHXL,
    CC2650DK_4XS,
    CC2650DK_5XD,
    CC2650DK_7ID,
    CC2650STK,
    CC3200_LAUNCHXL,
    CC3220_LAUNCHXL,
    CC3220S_LAUNCHXL,
    CC3220SF_LAUNCHXL,
    DK_TM4C129X,
    EK_TM4C123GXL,
    EK_TM4C1294XL,
    EK_TM4C129EXL,
    MSP_EXP430F5529LP,
    MSP_EXP430FR5969,
    MSP_EXP430FR5994,
    MSP_EXP430FR6989,
    MSP_EXP432P401R,
    TMDXDOCK28M36_M3,
    TMDXDOCK28M36_C28,
    TMDXDOCKH52C1_M3,
    TMDXDOCKH52C1_C28
];

/*
 *  ======== compilerOptionsHelper ========
 */
function compilerOptionsHelper(board, tool)
{
    var boardOptions = board.compilerBuildOptions[tool];
    var kernelCompilerOpts =
        targetOpts[tool][board.family][board.variant].compilerBuildOptions;

    return ({boardOptions: boardOptions, kernelOptions: kernelCompilerOpts});
}

/*
 *  ======== getIdeCompilerOptions ========
 */
function getIdeCompilerOptions(board, tool)
{
    var options = compilerOptionsHelper(board, tool);

    /*
     * Special condition: add --dlib_config file for MSP430 devices.
     * This option could be automatically provided by the target....
     */
    if (tool == "TI" && (board.family == "MSP430" || board.family == "MSP432")) {
        options.boardOptions += " --advice:power_severity=suppress ";
    }

    return (options.boardOptions + options.kernelOptions);
}

/*
 *  ======== getMakefileCompilerOptions ========
 */
function getMakefileCompilerOptions(board, tool)
{
    var options = compilerOptionsHelper(board, tool);

    /*
     * Special condition: add --dlib_config file for MSP430 devices.
     * This option could be automatically provided by the target....
     */
    if (tool == "IAR" && board.family == "MSP430") {
        options.boardOptions += " --dlib_config $(CODEGEN_INSTALL_DIR)" +
            "/lib/dlib/dl430xlsfn.h"
    }

    return (options.boardOptions + options.kernelOptions);
}

/*
 *  ======== linkerOptionsHelper ========
 */
function linkerOptionsHelper(board, tool) {
    var boardLinkerOpts = "";
    var kernelLinkerOpts = "";

    boardLinkerOpts = board.linkerBuildOptions[tool];

    if (tool == "GNU") {
        kernelLinkerOpts = targetOpts[tool][board.family]
            [board.variant].linkerBuildOptions;
    }
    else {
        kernelLinkerOpts = targetOpts[tool][board.family]
            [board.variant].linkerBuildOptions;
    }

    return ({kernelOpts: kernelLinkerOpts, boardOpts: boardLinkerOpts});
}

/*
 *  ======== getIdeLinkerOptions ========
 */
function getIdeLinkerOptions(board, tool)
{
    var options = linkerOptionsHelper(board, tool);
    return (options.boardOpts + options.kernelOpts);
}

/*
 *  ======== getMakefileLinkerOptions ========
 */
function getMakefileLinkerOptions(board, tool)
{
    var options;
    var boardLinkerOpts;
    var kernelLinkerOpts;
    var linkerOpts;

    options = linkerOptionsHelper(board, tool);
    boardLinkerOpts = options.boardOpts;
    kernelLinkerOpts = options.kernelOpts;

    /* Add linker file & compiler specific updates to kernel paths */
    var linkerFile = board.linkercmd[tool].path.split("/").pop();
    if (tool == "TI") {
        linkerOpts = " " + linkerFile + " -m$(NAME).map";
        kernelLinkerOpts += " -i$(CODEGEN_INSTALL_DIR)/lib -llibc.a";

        if (board.family == "MSP430") {
            /* Add math library & path */
            linkerOpts += " -i" + msp43xExtraOptions["msp430Headers"] +
                "/../lib/5xx_6xx_FRxx -llibmath.a";

            /* Add MPU library & path for MSP430FRxxxx devices */
            if (board.deviceId.match(/MSP430FR[56]\d\w]*/g)) {
                linkerOpts += " -i" + msp43xExtraOptions["msp430Headers"] +
                "/../lib/FR59xx -llibmpu_init.a";
            }
        }
    }
    else if (tool == "IAR") {
        if (board.family == "MSP430") {
            /*
             * Special condition: the following linker options must be defined
             * for IAR MSP430 makefiles.  However, they MUST not be defined for
             * IAR workbench ipcf files.
             */
            linkerOpts =
                " -D_STACK_SIZE=400 -D_DATA16_HEAP_SIZE=0 -D_DATA20_HEAP_SIZE=0" +
                " -C $(CODEGEN_INSTALL_DIR)/lib/dlib/dl430xlsfn.r43" +
                " -rt -s __program_start";

            linkerOpts += " -f " + linkerFile + " -l $(NAME).map";
        }
        else {
            /* ARM & MSP432 */
            linkerOpts = " --config " + linkerFile + " --map $(NAME).map";
            kernelLinkerOpts += " --semihosting=iar_breakpoint";
        }
    }
    else if (tool == "GNU") {
        linkerOpts = " -Wl,-T," + linkerFile + " -Wl,-Map,$(NAME).map" +
            " -Wl,-T,$(NAME)/linker.cmd";

        /* Change all {xdc_find:} instances to TI-RTOS kernel directory */
        while (kernelLinkerOpts.indexOf("${xdc_find:") != -1) {
            kernelLinkerOpts = kernelLinkerOpts.replace("${xdc_find:",
                prodList["bios"].packages + "/");
        }
        while (kernelLinkerOpts.indexOf(":${ProjName}}") != -1) {
            kernelLinkerOpts = kernelLinkerOpts.replace(":${ProjName}}", "");
        }

        /* GNU: linkerOpts MUST be before board & kernel linker opts */
        return (linkerOpts + boardLinkerOpts + kernelLinkerOpts);
    }
    else {
        throw ("Unsupported tool-chain: '" + tool + "'");
    }

    return (boardLinkerOpts + linkerOpts + kernelLinkerOpts);
}

/*
 *  ======== getPlatform ========
 */
function getPlatform(board)
{
    return (board.platform);
}

/*
 *  ======== getTarget ========
 */
function getTarget(board, tool)
{
    return (targetOpts[tool][board.family][board.variant].target);
}

/*
 *  ======== inDeviceFamily ========
 */
function inDeviceFamily(board, deviceFamily)
{
    return (deviceFamily == "" || board.family == deviceFamily);
}

/*
 *  ======== inProductGroup ========
 */
function inProductGroup(board, productGroup)
{
    return (board.productGroup == productGroup || productGroup == "Full");
}

/*
 *  ======== isToolSupported ========
 */
function isToolSupported(board, tool)
{
    return (board.linkercmd[tool] && board.compilerBuildOptions[tool] &&
        board.linkerBuildOptions[tool]);
}
