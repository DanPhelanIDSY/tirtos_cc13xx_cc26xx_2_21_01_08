/*
 *  ======== productList.xs ========
 */

function getMSP43xExtraOptions(productGroup, xdcArgs, type) {
    /* Initialize prodList & argMap */
    var prodList = createProductList(productGroup, xdcArgs, type);

    return ({
        "msp430DriverLib": prodList["msp430DriverLib"].dir,
        "msp432DriverLib": prodList["msp432DriverLib"].dir,
        "msp430GrLib": prodList["msp430GrLib"].dir,
        "msp430UsbLib": prodList["msp430UsbLib"].dir,
        "msp430Headers": prodList["msp430Headers"].dir,
        "msp432Headers": prodList["msp432Headers"].dir,
        "iarMSP430Headers": prodList["iarMSP430Headers"].dir,
        "iarMSP432Headers": prodList["iarMSP432Headers"].dir
    });
}

/*
 *  ======== createProductList ========
 *  Parses XDCARGS returning an object with product versions, installation
 *  directories, & symbols for makefiles & TREX resource files.
 */
function createProductList(productGroup, xdcArgs, type)
{
    var tirtosPath = "";          var tirtosVer = "";
    var tidriversPath = "";       var tidriversVer = "";
    var biosPath = "";            var biosVer = "";
    var ipcPath = "";             var ipcVer = "";
    var ndkPath = "";             var ndkVer = "";
    var nsPath = "";              var nsVer = "";
    var uiaPath = "";             var uiaVer = "";
    var cc13xxPath= "";           var cc13xxVer = "";
    var cc26xxPath = "";          var cc26xxVer = "";
    var cc32xxwarePath = "";      var cc32xxVer = "";
    var msp430DriverLibPath = ""; var msp430DriverLibVer = "";
    var msp432DriverLibPath = ""; var msp432DriverLibVer = "";
    var msp430GrLibPath = "";     var msp430GrLibVer = "";
    var msp430UsbLibPath = "";    var msp430UsbLibVer = "";
    var mwarePath = "";           var mwareVer = "";
    var tivawarePath = "";        var tivawareVer = "";
    var xdcToolsPath = "";        var xdcToolsVer = "";
    var msp430Headers = "";       var msp432Headers = "";
    var iarMSP430Headers = "";    var iarMSP432Headers = "";

    if (typeof xdcArgs == "undefined" || xdcArgs == "") {
        throw "Products must be specified in XDCARGS";
    }

    if (typeof productGroup == "undefined" || productGroup == "") {
        throw "Product group must be specified";
    }

    /* Parse product versions from XDCARGS options */
    var argMap = xdc.loadCapsule("ti/drivers/xdcArgParser.xs").parseArgs(xdcArgs);

    if (argMap["xdctools"]) {
        xdcToolsPath = argMap["xdctools"];
        xdcToolsVer = String(xdcToolsPath.match(/((\d+)_)+\w*/g));
    }
    if (argMap["tirtos"]) {
        tirtosPath = argMap["tirtos"];
        tirtosVer = String(tirtosPath.match(/tirtos_[a-z0-9_]*[_eng]*/));
    }
    if (argMap["tidrivers"]) {
        tidriversPath = argMap["tidrivers"];
        tidriversVer = String(tidriversPath.match(/tidrivers_[a-z0-9_]*[_eng]*/));
    }
    if (argMap["bios"]) {
        biosPath = argMap["bios"];
        biosVer = String(biosPath.match(/bios_[0-9_]*[_eng]*/));
    }
    if (argMap["ndk"]) {
        ndkPath = argMap["ndk"];
        ndkVer = String(ndkPath.match(/ndk_[0-9_]*[_eng]*/));
    }
    if (argMap["ns"]) {
        nsPath = argMap["ns"];
        nsVer = String(nsPath.match(/ns_[0-9_]*[_eng]*/));
    }
    if (argMap["uia"]) {
        uiaPath = argMap["uia"];
        uiaVer = String(uiaPath.match(/uia_[0-9_]*[_eng]*/));
    }
    if (argMap["cc13xxware"]) {
        cc13xxPath = argMap["cc13xxware"];
        cc13xxVer = String(cc13xxPath.match(/cc13xxware[0-9\.a-z_]*/));
    }
    if (argMap["cc26xxware"]) {
        cc26xxPath = argMap["cc26xxware"];
        cc26xxVer = String(cc26xxPath.match(/cc26xxware[0-9\.a-z_]*/));
    }
    if (argMap["cc32xxware"]) {
        cc32xxwarePath = argMap["cc32xxware"];
        cc32xxVer = String(cc32xxwarePath.match(/CC32XX_driverlib_[0-9\.a-z_]*/));
    }
    if (argMap["msp430DriverLib"]) {
        msp430DriverLibPath = argMap["msp430DriverLib"];
        msp430DriverLibVer = String(msp430DriverLibPath.match(/msp430_driverlib_[0-9\.a-z_]*/));
    }
    if (argMap["msp432DriverLib"]) {
        msp432DriverLibPath = argMap["msp432DriverLib"];
        msp432DriverLibVer = String(msp432DriverLibPath.match(/msp432_driverlib_[0-9\.a-z_]*/));
    }
    if (argMap["msp430GrLib"]) {
        msp430GrLibPath = argMap["msp430GrLib"];
        msp430GrLibVer = String(msp430GrLibPath.match(/msp430_grlib_[0-9\.a-z_]*/));
    }
    if (argMap["msp430UsbLib"]) {
        msp430UsbLibPath = argMap["msp430UsbLib"];
        msp430UsbLibVer = String(msp430UsbLibPath.match(/msp430_usblib_[0-9\.a-z_]*/));
    }
    if (argMap["mware"]) {
        mwarePath = argMap["mware"];
        mwareVer = String(mwarePath.match(/MWare_v\d{3}[a-zA-Z]?/));
    }
    if (argMap["tivaware"]) {
        tivawarePath = argMap["tivaware"];
        tivawareVer = String(tivawarePath.match(/TivaWare_C_Series-[0-9\.a-z_]*/));
    }
    /* Additional options for MSP43x product */
    if (argMap["msp430Headers"]) {
        msp430Headers = argMap["msp430Headers"];
    }
    if (argMap["msp432Headers"]) {
        msp432Headers = argMap["msp432Headers"];
    }
    if (argMap["iarMSP430Headers"]) {
        iarMSP430Headers = argMap["iarMSP430Headers"];
    }
    if (argMap["iarMSP432Headers"]) {
        iarMSP432Headers = argMap["iarMSP432Headers"];
    }

    /* Create the CCS symbol by product group */
    var ccsSymbol = "${COM_TI_RTSC_TIRTOS" + productGroup.toUpperCase() +
        "_INSTALL_DIR}";

    /*
     * Populate a list of product versions, installation paths, & symbols to be
     * used in compiler/linker options.
     *
     * Each entry must contain the following:
     * ver - product version including name (ex. tirtos_xx_yy_zz_eng).
     * absPath - path to the product install directory (not packages directory).
     * dir - placeholder for the path to the product's install directory.
     * packages - placeholder for the path to a products packages directory.
     * makeVar - Variable name used in makefiles to refer to a product's install
     *           directory.
     * makeVarPath - Access the product's install directory (makeVar wrapped
     *               in "$()" characters).
     * makePackages - Variable name used in makefiles to refer to a product's
     *                packages directory.
     * makePackagesPath - Access the product's packages directory
     *                    (makePackagesPath wrapped in "$()" characters).
     * ccsDir - Path to a product's install directory using CCS defined symbols.
     * ccsPackagesPath - Path to a product's packages directory using CCS
     *                   defined symbols.
     */
    var prodList = {
        "xdctools": {
            ver: xdcToolsVer,
            absPath: xdcToolsPath,
            dir: "",
            packages: "",
            ccsDir: "",
            ccsPackagesPath: "",
            iarName: "XDCROOT",
            iarPath: xdcToolsPath,
            makeVar: "XDC_INSTALL_DIR",
            makeVarPath: "$(XDC_INSTALL_DIR)",
            makePackages: "XDC_PACKAGES_DIR",
            makePackagesPath: "$(XDC_PACKAGES_DIR)"
        },
        "tirtos": {
            ver: tirtosVer,
            absPath: tirtosPath,
            dir: "",
            packages: "",
            ccsDir: ccsSymbol,
            ccsPackagesPath: ccsSymbol + "/packages",
            iarName: "TIRTOS",
            iarPath: tirtosPath + "/packages",
            makeVar:"TIRTOS_INSTALL_DIR",
            makeVarPath: "$(TIRTOS_INSTALL_DIR)",
            makePackages: "TIRTOS_PACKAGES_DIR",
            makePackagesPath: "$(TIRTOS_PACKAGES_DIR)"
        },
        "tidrivers": {
            ver: tidriversVer,
            absPath: tidriversPath,
            dir: "",
            packages: "",
            ccsDir: ccsSymbol + "/products/" + tidriversVer,
            ccsPackagesPath: ccsSymbol + "/products/" + tidriversVer + "/packages",
            iarName: "TIDRIVERS",
            iarPath: tidriversPath + "/packages",
            makeVar: "TIDRIVERS_INSTALL_DIR",
            makeVarPath: "$(TIDRIVERS_INSTALL_DIR)",
            makePackages: "TIDRIVERS_PACKAGES_DIR",
            makePackagesPath: "$(TIDRIVERS_PACKAGES_DIR)"
        },
        "bios": {
            ver: biosVer,
            absPath: biosPath,
            dir: "",
            packages: "",
            ccsDir: ccsSymbol + "/products/" + biosVer,
            ccsPackagesPath: ccsSymbol + "/products/" + biosVer + "/packages",
            iarName: "BIOS",
            iarPath: biosPath + "/packages",
            makeVar: "BIOS_INSTALL_DIR",
            makeVarPath: "$(BIOS_INSTALL_DIR)",
            makePackages: "BIOS_PACKAGES_DIR",
            makePackagesPath: "$(BIOS_PACKAGES_DIR)"
        },
        "ndk": {
            ver: ndkVer,
            absPath: ndkPath,
            dir: "",
            packages: "",
            ccsDir: ccsSymbol + "/products/" + ndkVer,
            ccsPackagesPath: ccsSymbol + "/products/" + ndkVer + "/packages",
            iarName: "NDK",
            iarPath: ndkPath + "/packages",
            makeVar: "NDK_INSTALL_DIR",
            makeVarPath: "$(NDK_INSTALL_DIR)",
            makePackages: "NDK_PACKAGES_DIR",
            makePackagesPath: "$(NDK_PACKAGES_DIR)"
        },
        "ns": {
            ver: nsVer,
            absPath: nsPath,
            dir: "",
            packages: "",
            ccsDir: ccsSymbol + "/products/" + nsVer,
            ccsPackagesPath: ccsSymbol + "/products/" + nsVer + "/packages",
            iarName: "NS",
            iarPath: nsPath + "/packages",
            makeVar: "NS_INSTALL_DIR",
            makeVarPath: "$(NS_INSTALL_DIR)",
            makePackages: "NS_PACKAGES_DIR",
            makePackagesPath: "$(NS_PACKAGES_DIR)"
        },
        "uia": {
            ver: uiaVer,
            absPath: uiaPath,
            dir: "",
            packages: "",
            ccsDir: ccsSymbol + "/products/" + uiaVer,
            ccsPackagesPath: ccsSymbol + "/products/" + uiaVer + "/packages",
            iarName: "UIA",
            iarPath: uiaPath + "/packages",
            makeVar: "UIA_INSTALL_DIR",
            makeVarPath: "$(UIA_INSTALL_DIR)",
            makePackages: "UIA_PACKAGES_DIR",
            makePackagesPath: "$(UIA_PACKAGES_DIR)"
        },
        "cc13xxware": {
            ver: cc13xxVer,
            absPath: cc13xxPath,
            dir: "",
            packages: "",
            ccsDir: ccsSymbol + "/products/" + cc13xxVer,
            ccsPackagesPath: ccsSymbol + "/products/" + cc13xxVer,
            iarName: "CC13XXWARE",
            iarPath: cc13xxPath,
            makeVar: "CC13XXWARE_INSTALL_DIR",
            makeVarPath: "$(CC13XXWARE_INSTALL_DIR)",
            makePackages: "CC13XXWARE_INSTALL_DIR",
            makePackagesPath: "$(CC13XXWARE_INSTALL_DIR)"
        },
        "cc26xxware": {
            ver: cc26xxVer,
            absPath: cc26xxPath,
            dir: "",
            packages: "",
            ccsDir: ccsSymbol + "/products/" + cc26xxVer,
            ccsPackagesPath: ccsSymbol + "/products/" + cc26xxVer,
            iarName: "CC26XXWARE",
            iarPath: cc26xxPath,
            makeVar: "CC26XXWARE_INSTALL_DIR",
            makeVarPath: "$(CC26XXWARE_INSTALL_DIR)",
            makePackages: "CC26XXWARE_INSTALL_DIR",
            makePackagesPath: "$(CC26XXWARE_INSTALL_DIR)"
        },
        "cc32xxware": {
            ver: cc32xxVer,
            absPath: cc32xxwarePath,
            dir: "",
            packages: "",
            ccsDir: ccsSymbol + "/products/" + cc32xxVer,
            ccsPackagesPath: ccsSymbol + "/products/" + cc32xxVer,
            iarName: "CC32XXWARE",
            iarPath: cc32xxwarePath,
            makeVar: "CC32XXWARE_INSTALL_DIR",
            makeVarPath: "$(CC32XXWARE_INSTALL_DIR)",
            makePackages: "CC32XXWARE_INSTALL_DIR",
            makePackagesPath: "$(CC32XXWARE_INSTALL_DIR)"
        },
        "msp430DriverLib": {
            ver: msp430DriverLibVer,
            absPath: msp430DriverLibPath,
            dir: "",
            packages: "",
            ccsDir: ccsSymbol + "/products/" + msp430DriverLibVer,
            ccsPackagesPath: ccsSymbol + "/products/" + msp430DriverLibVer,
            iarName: "MSP430DRIVERLIB",
            iarPath: msp430DriverLibPath,
            makeVar: "MSP430DRIVERLIB_INSTALL_DIR",
            makeVarPath: "$(MSP430DRIVERLIB_INSTALL_DIR)",
            makePackages: "MSP430DRIVERLIB_INSTALL_DIR",
            makePackagesPath: "$(MSP430DRIVERLIB_INSTALL_DIR)"
        },
        "msp432DriverLib": {
            ver: msp432DriverLibVer,
            absPath: msp432DriverLibPath,
            dir: "",
            packages: "",
            ccsDir: ccsSymbol + "/products/" + msp432DriverLibVer,
            ccsPackagesPath: ccsSymbol + "/products/" + msp432DriverLibVer,
            iarName: "MSP432DRIVERLIB",
            iarPath: msp432DriverLibPath,
            makeVar: "MSP432DRIVERLIB_INSTALL_DIR",
            makeVarPath: "$(MSP432DRIVERLIB_INSTALL_DIR)",
            makePackages: "MSP432DRIVERLIB_INSTALL_DIR",
            makePackagesPath: "$(MSP432DRIVERLIB_INSTALL_DIR)"
        },
        "msp430GrLib": {
            ver: msp430GrLibVer,
            absPath: msp430GrLibPath,
            dir: "",
            packages: "",
            ccsDir: ccsSymbol + "/products/" + msp430GrLibVer,
            ccsPackagesPath: ccsSymbol + "/products/" + msp430GrLibVer,
            iarName: "MSP430GRLIB",
            iarPath: msp430GrLibPath,
            makeVar: "MSP430GRLIB_INSTALL_DIR",
            makeVarPath: "$(MSP430GRLIB_INSTALL_DIR)",
            makePackages: "MSP430GRLIB_INSTALL_DIR",
            makePackagesPath: "$(MSP430GRLIB_INSTALL_DIR)"
        },
        "msp430UsbLib": {
            ver: msp430UsbLibVer,
            absPath: msp430UsbLibPath,
            dir: "",
            packages: "",
            ccsDir: ccsSymbol + "/products/" + msp430UsbLibVer,
            ccsPackagesPath: ccsSymbol + "/products/" + msp430UsbLibVer,
            iarName: "MSP430USBLIB",
            iarPath: msp430UsbLibPath,
            makeVar: "MSP430USBLIB_INSTALL_DIR",
            makeVarPath: "$(MSP430USBLIB_INSTALL_DIR)",
            makePackages: "MSP430USBLIB_INSTALL_DIR",
            makePackagesPath: "$(MSP430USBLIB_INSTALL_DIR)"
        },
        "mware": {
            ver: mwareVer,
            absPath: mwarePath,
            dir: "",
            packages: "",
            ccsDir: ccsSymbol + "/products/" + mwareVer,
            ccsPackagesPath: ccsSymbol + "/products/" + mwareVer,
            iarName: "MWARE",
            iarPath: mwarePath,
            makeVar: "MWARE_INSTALL_DIR",
            makeVarPath: "$(MWARE_INSTALL_DIR)",
            makePackages: "MWARE_INSTALL_DIR",
            makePackagesPath: "$(MWARE_INSTALL_DIR)"
        },
        "tivaware": {
            ver: tivawareVer,
            absPath: tivawarePath,
            dir: "",
            packages: "",
            ccsDir: ccsSymbol + "/products/" + tivawareVer,
            ccsPackagesPath: ccsSymbol + "/products/" + tivawareVer,
            iarName: "TIVAWARE",
            iarPath: tivawarePath,
            makeVar: "TIVAWARE_INSTALL_DIR",
            makeVarPath: "$(TIVAWARE_INSTALL_DIR)",
            makePackages: "TIVAWARE_INSTALL_DIR",
            makePackagesPath: "$(TIVAWARE_INSTALL_DIR)"
        },
        /* Additional options for MSP43x product */
        "msp430Headers": {
            ver: "",
            absPath: "",
            dir: "",
            packages: "",
            ccsDir: "",
            ccsPackagesPath: "",
            iarName: "",
            iarPath: "",
            makeVar: "",
            makeVarPath: msp430Headers,
            makePackages: "",
            makePackagesPath: msp430Headers
        },
        "msp432Headers": {
            ver: "",
            absPath: "",
            dir: "",
            packages: "",
            ccsDir: "",
            ccsPackagesPath: "",
            iarName: "",
            iarPath: "",
            makeVar: "",
            makeVarPath: msp432Headers,
            makePackages: "",
            makePackagesPath: msp430Headers
        },
        "iarMSP430Headers": {
            ver: "",
            absPath: "",
            dir: "",
            packages: "",
            ccsDir: "",
            ccsPackagesPath: "",
            iarName: "",
            iarPath: "",
            makeVar: "",
            makeVarPath: iarMSP430Headers,
            makePackages: "",
            makePackagesPath: iarMSP430Headers
        },
        "iarMSP432Headers": {
            ver: "",
            absPath: "",
            dir: "",
            packages: "",
            ccsDir: "",
            ccsPackagesPath: "",
            iarName: "",
            iarPath: "",
            makeVar: "",
            makeVarPath: iarMSP432Headers,
            makePackages: "",
            makePackagesPath: iarMSP432Headers
        }
    };

    /* Init prodList fields to the setting specified by type parameter */
    initProductListSymbols(prodList, type);

    return (prodList);
}

/*
 *  ======== initProductListSymbols ========
 *  Sets the productList symbol parameter to the type specified
 *  (i.e. makefile or trex symbols).
 */
function initProductListSymbols(productList, type)
{
    switch (type) {
        case "makefiles":
            for each (var prod in productList) {
                prod.dir = prod.makeVarPath;
                prod.packages = prod.makePackagesPath;
            }
            break;

        case "trex":
            for each (var prod in productList) {
                prod.dir = prod.ccsDir;
                prod.packages = prod.ccsPackagesPath;
            }
            break;

        default:
            throw ("Symbol type must be specified");
    }
}
