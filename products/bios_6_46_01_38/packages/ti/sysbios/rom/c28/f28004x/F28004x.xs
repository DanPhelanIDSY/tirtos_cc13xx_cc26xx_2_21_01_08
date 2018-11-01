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
 *  ======== F28004x.xs ========
 */

var BIOS = null;
var Build = null;
var Program = null;
var ROM = null;
var F28004x = null;
var appName = null;

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }

    BIOS = xdc.useModule('ti.sysbios.BIOS');
    Build = xdc.useModule('ti.sysbios.Build');
    ROM = xdc.module('ti.sysbios.rom.ROM');
    F28004x = xdc.module('ti.sysbios.rom.c28.f28004x.F28004x');

    /* no need for abstract interface */
    F28004x.common$.fxntab = false;

    Program = xdc.useModule('xdc.cfg.Program');

    appName = Program.name.substring(0, Program.name.lastIndexOf('.'));

    /*
     * By convention, the Build module is pulled in and Build.buildROM set
     * to true by the ROM build config file before any module in this package
     * (ti.sysbios.rom.c28.f28004x) will have it's module$meta$init() func called.
     *
     * Therefore it is safe to assume that Build.buildROM has been actively
     * set to true when the ROM is being built, and set to false by default
     * when a ROM application is being built.
     */
    if (Build.buildROM == true) {
        Build.buildROMApp = false;
        BIOS.libDir = null;
        F28004x.libDir = String(F28004x.$package.packageBase + appName + "/");
    }
    else {
        Build.buildROMApp = true;
    }
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    if (!Program.platformName.match(/ti\.platforms\.tms320x28/) &&
         Build.buildROMApp == true) {
         this.$logError(
                "F28004x ROM Applications only support the \"ti.platforms.tms320x28\" platform",
                this);
    }

    if (BIOS.includeXdcRuntime == true) {
        var rtsLib = xdc.loadPackage(Program.build.target.$orig.rts);
        if ('Settings' in rtsLib) {
            rtsLib.Settings.bootOnly = true;
        }
        else {
            this.$logError(
                "Must use xdctools 3.26.00.19 or newer",
                this);
        }
    }

    /* install revision check reset function */ 
    if (F28004x.useFlash != true) {
        var Reset = xdc.useModule('xdc.runtime.Reset');
        Reset.fxns.$add(F28004x.checkRevision);
    }

    if (Build.buildROM == true) return;

    switch (ROM.romName) {
        case ROM.F28004x:
            F28004x.REVISION = 1915367466;
            F28004x.REVISION_WORD_ADDRESS = 0x003f910a;
            break;

        case ROM.F28004x_P2:
            F28004x.REVISION = 1114795641;
            F28004x.REVISION_WORD_ADDRESS = 0x003f9110;
            break;
    }

    /* inform getLibs() about location of library */
    switch (BIOS.libType) {
        case BIOS.LibType_Instrumented:
            /* this fall through is on purpose */
        case BIOS.LibType_NonInstrumented:
            /* this fall through is on purpose */
        case BIOS.LibType_Debug:
            /* this fall through to the custom logic is on purpose */
        case BIOS.LibType_Custom:
            F28004x.templateName = "F28004x_custom_makefile.xdt";
            xdc.includeFile(String(F28004x.$package.packageBase + "F28004x_custom_outpolicies.cfg.xs"));
            Build.$private.libraryName = "/rom_sysbios.a" + Program.build.target.suffix;
            var SourceDir = xdc.useModule("xdc.cfg.SourceDir");

            /* if building a pre-built library */
            if (BIOS.buildingAppLib == false) {
                var appName = Program.name.substring(0, Program.name.lastIndexOf('.'));
                Build.$private.libDir = this.$package.packageBase + BIOS.libDir;
                if (!java.io.File(this.$private.libDir).exists()) {
                    java.io.File(this.$private.libDir).mkdir();
                }
            }

            /*
             * If building an application in CCS or package.bld world
             * and libDir has been specified
             */
            if ((BIOS.buildingAppLib == true) && (BIOS.libDir !== null)) {
                SourceDir.outputDir = BIOS.libDir;
            }
            else {
                var curPath = java.io.File(".").getCanonicalPath();
                /* If package.bld world AND building an application OR pre-built lib */
                if (java.io.File(curPath).getName() != "configPkg") {
                    var appName = Program.name.substring(0, Program.name.lastIndexOf('.'));
                    appName = appName + "_p" + Program.build.target.suffix + ".src";
                    SourceDir.outputDir = "package/cfg/" + appName;
                    SourceDir.toBuildDir = ".";
                }
                /* Here ONLY if building an application in CCS world */
                else {
                    /* request output source directory for generated files */
                    SourceDir.toBuildDir = "..";
                }
            }

            var src = SourceDir.create("sysbios");
            src.libraryName = "sysbios" + Build.$private.libraryName;

            /*
             * save this directory in the Build private state (to be read during
             * generation, see Gen.xdt)
             */
            Build.$private.outputDir = src.getGenSourceDir();

            break;
    }
}

/*
 *  ======== module$validate ========
 */
function module$validate()
{
    var Settings = xdc.module("ti.sysbios.family.Settings");
    var Clock = xdc.module('ti.sysbios.knl.Clock');
    var Swi = xdc.module('ti.sysbios.knl.Swi');
    var Hwi = xdc.module('ti.sysbios.hal.Hwi');
    var c28Hwi = xdc.module('ti.sysbios.family.c28.Hwi');
    var Task = xdc.module('ti.sysbios.knl.Task');
    var Semaphore = xdc.module('ti.sysbios.knl.Semaphore');
    var HwiDelegate = xdc.module(Settings.getDefaultHwiDelegate());

    if (BIOS.assertsEnabled == true) {
        this.$logError(
            "BIOS.assertsEnabled must be set to 'false' when using ROM", BIOS, "assertsEnabled");
    }

    if (BIOS.logsEnabled == true) {
        this.$logError(
            "BIOS.logsEnabled must be set to 'false' when using ROM", BIOS, "logsEnabled");
    }

    if (BIOS.taskEnabled == false) {
        this.$logError(
            "BIOS.taskEnabled must be set to 'true' when using ROM", BIOS, "taskEnabled");
    }

    if (BIOS.swiEnabled == false) {
        this.$logError(
            "BIOS.swiEnabled must be set to 'true' when using ROM", BIOS, "swiEnabled");
    }

    if (BIOS.runtimeCreatesEnabled == false) {
        this.$logWarning(
            "Note that the ROM code was built with BIOS.runtimeCreatesEnabled set to true." +
            "No performance gain will be achieved by setting this parameter to false.", 
            BIOS, "runtimeCreatesEnabled");
    }

    if (BIOS.RtsGateProxy.delegate$.$name != "ti.sysbios.gates.GateMutex") { 
       this.$logError(
            "The BIOS.RtsGateProxy must be GateMutex when using ROM",
            BIOS, "RtsGateProxy");
    }

    if (Clock.tickSource != Clock.TickSource_TIMER) {
        this.$logError(
            "Clock.tickSource must be set to Clock.TickSource_TIMER when using ROM", 
                Clock, "tickSource");
    }

    if (Swi.hooks.length != 0) {
        this.$logError("Swi hooks are not supported when using ROM", Swi);
    }

    if (Swi.common$.namedInstance == true) {
        this.$logError("Swi.common$.namedInstance must be set to false when using ROM",
                Swi, "common$.namedInstance");
    }

    if (Task.hooks.length != 0) {
        this.$logError("Task hooks are not supported when using ROM", Task);
    }

    if (Task.deleteTerminatedTasks == true) {
        this.$logError("Task.deleteTerminatedTasks must be set to false when using ROM", 
                Task, "deleteTerminatedTasks");
    }

    if (Task.checkStackFlag == true) {
        this.$logError("Task.checkStackFlag must be set to false when using ROM", 
                Task, "checkStackFlag");
    }

    if (Task.common$.namedInstance == true) {
        this.$logError("Task.common$.namedInstance must be set to false when using ROM",
                Task, "common$.namedInstance");
    }

    if ((Hwi.numHooks != 0) || (HwiDelegate.hooks.length != 0)) {
        this.$logError("Hwi hooks are not supported when using ROM", Hwi);
    }

    if (Semaphore.supportsEvents == true) {
        this.$logError(
            "Semaphore.supportEvents must be set to 'false' when using ROM",
            Semaphore, "supportsEvents");
    }

    if (Semaphore.supportsPriority == true) {
        this.$logError(
            "Semaphore.supportPriority must be set to 'false' when using ROM",
            Semaphore, "supportsPriority");
    }

    if (Semaphore.common$.namedInstance == true) {
        this.$logError("Semaphore.common$.namedInstance must be set to false when using ROM",
                Semaphore, "common$.namedInstance");
    }

    if (c28Hwi.dispatcherIrpTrackingSupport == false) {
        this.$logError(
            "Hwi.dispatcherIrpTrackingSupport must be set to 'true' when using ROM",
            c28Hwi);
    }

    if (c28Hwi.dispatcherTaskSupport == false) {
        this.$logError(
            "Hwi.dispatcherTaskSupport must be set to 'true' when using ROM",
            c28Hwi);
    }

    if (c28Hwi.dispatcherSwiSupport == false) {
        this.$logError(
            "Hwi.dispatcherSwiSupport must be set to 'true' when using ROM",
            c28Hwi);
    }

    if (c28Hwi.dispatcherAutoNestingSupport == false) {
        this.$logError(
            "Hwi.dispatcherAutoNestingSupport must be set to 'true' when using ROM",
            c28Hwi);
    }

    if (c28Hwi.common$.namedInstance == true) {
        this.$logError("c28Hwi.common$.namedInstance must be set to false when using ROM",
                c28Hwi, "common$.namedInstance");
    }
}

/*
 *  ======== loadAppConfig ========
 */
function loadAppConfig()
{
    /*
     * Pull in all modules and their configurations that were used in
     * building the ROM.
     */

    xdc.includeFile(String(F28004x.$package.packageBase + "F28004x.cfg.xs"));
}
