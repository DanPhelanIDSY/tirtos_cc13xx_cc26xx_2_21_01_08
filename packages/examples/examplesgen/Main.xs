/*
 *  ======== Main.xs ========
 */

Boards = "";
ExamplesList = "";
prodList = "";
msp43xExtraOptions = "";

function run(cmdr, args)
{
    var boardsDir;
    var boardsFile;
    var examplelistFile;
    var genIarFiles = false;
    var ipcfList = [];
    var tirtosExamplesDir;
    var tirtosVersion;
    var toolRootDir;
    var xdcArgs = java.lang.System.getenv("XDCARGS");

    /* Ensure minimum required parameters have been provided */
    if (this.toolchain == "" || this.toolchainDir == "" ||
        this.output == "" || this.productGroup == "") {
        cmdr.usage();
        return (null);
    }

    /*
     * Get products installation directories & versions.  productList must be
     * defined before the boards & examples capsules are loaded.
     */
    var productList = xdc.loadCapsule("examples/productList.xs");
    prodList = productList.createProductList(this.productGroup, xdcArgs,
        "makefiles");
    msp43xExtraOptions = productList.getMSP43xExtraOptions(this.productGroup,
        xdcArgs, "makefiles");

    /* Ensure vital products have been defined */
    if (prodList["tirtos"].absPath == "" || prodList["tidrivers"].absPath == "" ||
        prodList["bios"].absPath == "" || prodList["xdctools"].absPath == "") {
        throw "TIRTOS, TIDRIVERS, BIOS & XDCTOOLS must be defined in the XDCARGS";
    }

    tirtosVersion = prodList["tirtos"].ver;
    if (tirtosVersion != null && tirtosVersion != "") {
        /* Only generate IAR IDE files if using installed product. */
        if (this.toolchain == "IAR" &&
            (prodList["bios"].absPath).search(tirtosVersion) >= 0) {
            genIarFiles = true;
        }
    }

    /* TI-RTOS examples directory required - used to locate templates. */
    tirtosExamplesDir = new java.io.File(prodList["tirtos"].absPath + "/packages/examples");
    if (!tirtosExamplesDir.exists()) {
        throw "Could not find TI-RTOS examples directory";
    }

    examplelistFile = new java.io.File(this.examplelistFile);
    if (!examplelistFile.exists()) {
        /* Use default ExampleList.xs */
        examplelistFile = new java.io.File(tirtosExamplesDir.getPath() + "/ExampleList.xs");
        if (!examplelistFile.exists()) {
            throw "Could not find examples list file";
        }
    }

    boardsFile = new java.io.File(this.boardsFile);
    if (!boardsFile.exists()) {
        /* Use default Boards.xs */
        boardsFile = new java.io.File(tirtosExamplesDir.getPath() + "/Boards.xs");
        if (!boardsFile.exists()) {
            throw "Could not find boards file";
        }
    }

    /* Check boardsFile directory for boards folder, otherwise use default */
    boardsDir = new java.io.File(boardsFile.getParentFile() + "/boards");
    if (!boardsDir.exists()) {
        boardsDir = new java.io.File(prodList["tidrivers"].absPath + "/packages/ti/boards");
        if (!boardsDir.exists()) {
            throw "Could not find boards directory";
        }
    }

    /*
     * Load boards script & example list script. Order is important,
     * ExampleList.xs relies on Boards.xs.
     */
    Boards = xdc.loadCapsule(boardsFile.getPath());
    ExamplesList = xdc.loadCapsule(examplelistFile.getPath());

    /* Create tool directory */
    toolRootDir = new java.io.File(this.output + "/" + this.toolchain);
    toolRootDir.mkdirs();

    /* Iterate through boards & generate examples */
    for each (var board in Boards.allBoards) {
        if (!Boards.inProductGroup(board, this.productGroup) ||
            !Boards.isToolSupported(board, this.toolchain) ||
            !Boards.inDeviceFamily(board, this.deviceFamily)) {
            continue;
        }

        /*
         * If boardFilter is provided, only add those in the list.  Otherwise,
         * add all boards in the productGroup.
         */
        if (this.boardFilter != "" &&
            this.boardFilter.indexOf(board.name) == -1) {
            continue;
        }

        /* Create board directory */
        var boardRootDir = new java.io.File(toolRootDir.getPath() +
            "/" + board.name);
        boardRootDir.mkdir();

        /* Add top-level makefiles & makedefs */
        var srcDir = tirtosExamplesDir + "/examplesgen/makefiles";
        var targDir = boardRootDir.getPath();
        generateMakefiles(srcDir, targDir, "makedefs", board, this);
        generateMakefiles(srcDir, targDir, "topmake", board);

        for each (var example in ExamplesList.allExamples) {
            if (!ExamplesList.isBoardSupported(example, board) ||
                !ExamplesList.isToolSupported(example, this.toolchain)) {
                continue;
            }

            /* Create example directory */
            var exampleDir = new java.io.File(boardRootDir.getPath() +
                "/" + example.name);
            exampleDir.mkdir();

            /* Copy makefile, board files & example files */
            srcDir = tirtosExamplesDir + "/examplesgen/makefiles";
            targDir = exampleDir.getPath();
            generateMakefiles(srcDir, targDir, "lowmake", example, this.toolchain);

            srcDir = boardsDir.getPath();
            var boardFileList = copyBoardFiles(srcDir, targDir, board,
                this.toolchain);

            srcDir = examplelistFile.getParent();
            var exampleFileList = copyExampleFiles(srcDir, targDir, board, example,
                this.toolchain);

            /* Generate example IPCF files (IAR) */
            if (genIarFiles) {
                srcDir = tirtosExamplesDir + "/examplesgen/iar";
                generateIARFiles(srcDir, targDir, "ipcf", board, example,
                    boardFileList.concat(exampleFileList), ipcfList);
            }
        }
    }

    /* Generate IAR HTML files */
    if (genIarFiles) {
        var srcDir = tirtosExamplesDir + "/examplesgen/iar";
        var targDir = toolRootDir.getPath();
        generateIARFiles(srcDir, targDir, "html", tirtosVersion, ipcfList);
    }
}

/*
 *  ====== copyBoardFiles ========
 *  Copies all board files and linker file into target directory.
 *
 *  Returns a FileDesc array with file objects.
 */
function copyBoardFiles(srcDir, targDir, board, tool) {
    var fileList = [];

    fileList = fileList.concat(board.fileList);
    fileList.push(board.linkercmd[tool]);
    copyFileList(srcDir, targDir, fileList);

    return fileList;
}

/*
 *  ====== copyExampleFiles ========
 *  Copies all example files into target directory.
 *
 *  Returns a FileDesc array with file objects.
 */
function copyExampleFiles(srcDir, targDir, board, example, tool) {
    var fileList = [];

    fileList = fileList.concat(ExamplesList.getExampleSourceFiles(srcDir,
        board, example));
    copyFileList(srcDir, targDir, fileList);

    return fileList;
}

/*
 *  ====== copyFile ========
 *  Copies a single file from source path to the target path.
 */
function copyFile(srcPath, targPath) {
    var length;
    var inputStream = new java.io.FileInputStream(new java.io.File(srcPath));
    var outputStream = new java.io.FileOutputStream(new java.io.File(targPath));
    var buffer = java.lang.reflect.Array.newInstance(java.lang.Byte.TYPE, 1024);

    while ((length = inputStream.read(buffer)) > 0) {
        outputStream.write(buffer, 0, length);
    }

    inputStream.close();
    outputStream.close();
}

/*
 *  ====== copyFileList ========
 *  Copies file list array files to the target directory creating subdirectories
 *  as necessary.
 */
function copyFileList(srcDir, targDir, fileList)
{
    var fileName;
    var srcPath;
    var targPath;

    for each (var entry in fileList) {
        fileName = entry.path.split("/").pop();

        /* Substitute Makefile symbols for the product absPath */
        if (entry.path.match(/\$\(.*\)/)) {
            var symbol = entry.path.match(/\$\(.*\)/);
            srcPath = entry.path;
            for each (var prod in prodList) {
                if (prod.makeVarPath == symbol) {
                    srcPath = srcPath.replace(symbol, prod.absPath);
                    break;
                }
            }
        }
        else {
            /* set SrcDir as base path to search for the file */
            srcPath = srcDir + entry.path;
        }

        /* Create sub-directories if source file requires it */
        if (entry.targetDirectory && entry.targetDirectory != ".") {
            var targetDirectory = new java.io.File(targDir + "/" +
                entry.targetDirectory);
            targetDirectory.mkdirs();

            targPath = targetDirectory.getPath() + "/" + fileName;
        }
        else {
            targPath = targDir + "/" + fileName;
        }

        copyFile(srcPath, targPath);
    }
}

/*
 *  ====== generateIARFiles ========
 *  Generates IAR required example files.
 */
function generateIARFiles(srcDir, targDir, type, board, example, fileList, opts)
{
    var srcPath;
    var targPath;

    switch (type) {
        case "ipcf":
            /*
             * opts - reference to the ipcfList.
             */
            srcPath = srcDir + "/ipcf.xdt";
            targPath = targDir + "/" + example.name + ".ipcf";

            /* Store IPCF object, it is required to generate IAR html */
            opts.push({path: targPath, board: board, example: example});

            xdc.loadTemplate(srcPath).genFile(targPath, this,
                [Boards, board, example, prodList, targDir, fileList]);
            break;

        case "html":
            var iconDir;
            var iconPath;
            /*
             * board - contains TI-RTOS version.
             * example - contains IPCF object list.
             * fileList & opts are unused
             */
            srcPath = srcDir + "/html.xdt";
            targPath = targDir + "/Examples.html";
            xdc.loadTemplate(srcPath).genFile(targPath, this, [example]);

            srcPath = srcDir + "/args.xdt";
            targPath = targDir + "/" + board + ".custom_argvars";
            xdc.loadTemplate(srcPath).genFile(targPath, this,
                [board, targDir, prodList]);

            /* Copy HTML images */
            iconDir = new java.io.File(targDir + "/icons");
            iconDir.mkdir();

            iconPath = iconDir.getPath();
            copyFile(srcDir + "/icons/chip_closed.png", iconPath + "/chip_closed.png");
            copyFile(srcDir + "/icons/chip_open.png", iconPath + "/chip_open.png");
            copyFile(srcDir + "/icons/cubeAqua_closed.png", iconPath + "/cubeAqua_closed.png");
            copyFile(srcDir + "/icons/cubeAqua_open.png", iconPath + "/cubeAqua_open.png");
            copyFile(srcDir + "/icons/examplefile_s.png", iconPath + "/examplefile_s.png");
            copyFile(srcDir + "/icons/tilogo.gif", iconPath + "/tilogo.gif");
            copyFile(srcDir + "/icons/titagline.gif", iconPath + "/titagline.gif");
            break;

        default:
            throw "Must specify IAR file type";
    }
}

/*
 *  ====== generateMakefiles ========
 *  Generates example makefiles.
 */
function generateMakefiles(srcDir, targDir, type, object, opts)
{
    var srcPath;
    var targPath;

    switch (type) {
        case "topmake":
            srcPath = srcDir + "/makefile";
            targPath = targDir + "/makefile";
            copyFile(srcPath, targPath);
            break;

        case "lowmake":
            /*
             * object - reference to an example.
             * opts - toolchain name.
             */
            srcPath = srcDir + "/makefile.xdt";
            targPath = targDir + "/makefile";
            xdc.loadTemplate(srcPath).genFile(targPath, this, [object, opts]);
            break;

        case "makedefs":
            /*
             * object - reference to a board.
             * opts - reference to caller of function (to get scope variables).
             */
            var makedefsOptions = [
                Boards, object, opts.toolchain, opts.toolchainDir, prodList,
                opts.extraCOpts, opts.extraLOpts, opts.xdcExtraPaths
            ];

            srcPath = srcDir + "/makedefs.xdt";
            targPath = targDir + "/makedefs";
            xdc.loadTemplate(srcPath).genFile(targPath, this, makedefsOptions);
            break;

        default:
            throw "Must specify makefile type";
    }
}
