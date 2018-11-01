Boards = "";
ExamplesList = "";
prodList = "";
msp43xExtraOptions = "";

/*
 *  ======== module$meta$init ========
 */
function module$meta$init() {
    var rootString;
    var trexExamples = this;
    var productGroup = environment["productGroup"];
    var xdcArgs = java.lang.System.getenv("XDCARGS");

    if (typeof productGroup == "undefined" || productGroup == "") {
        print("NOTE: A product group must be provided. Ending generation.");
        return (null);
    }
    rootString = "examples." + productGroup;

    /*
     * Get products installation directories & versions.  prodList must be
     * defined before the boards & examples capsules are loaded.
     */
    var productList = xdc.loadCapsule("examples/productList.xs");
    prodList = productList.createProductList(productGroup, xdcArgs, "trex");
    msp43xExtraOptions = productList.getMSP43xExtraOptions(productGroup,
        xdcArgs, "trex");

    if (prodList["tirtos"].absPath == "" || prodList["tidrivers"].absPath == "" ||
        prodList["bios"].absPath == "" || prodList["xdctools"].absPath == "") {
        throw "TIRTOS, TIDRIVERS, BIOS & XDCTOOLS must be defined in the XDCARGS";
    }

    /*
     * Load boards script & ExamplesList script. Order is important,
     * ExampleList.xs relies on Boards.xs.
     */
    Boards = xdc.loadCapsule("examples/Boards.xs");
    ExamplesList = xdc.loadCapsule("examples/ExampleList.xs");

    /* Create the TI-RTOS examples root */
    trexExamples.templateGroupArr.$add({
        id          : rootString,
        name        : "TI-RTOS Examples",
        description : "TI-RTOS Examples and Templates"
    });

    /* Generate example for productGroup boards */
    for each (var board in Boards.allBoards) {
        if (!Boards.inProductGroup(board, productGroup)) {
            continue;
        }

        /* Create board, drivers, kernel & uia groups */
        createBoardTree(trexExamples, rootString, board);

        /* Create tool specific groups and add examples */
        if (Boards.isToolSupported(board, "TI")) {
            createToolTree(trexExamples, rootString, board, "TI");
            addExamples(trexExamples, rootString, board, "TI");
        }

        if (Boards.isToolSupported(board, "GNU")) {
            createToolTree(trexExamples, rootString, board, "GNU");
            addExamples(trexExamples, rootString, board, "GNU");
        }
    }
}

/*
 *  ======== addExamples ========
 */
function addExamples(trexExamples, rootString, devBoard, tool) {
    var exampleGroup;
    var fileList;
    var filter;

    var examplesSrcDir = new java.io.File(prodList["tirtos"].absPath +
        "/packages/examples").getPath();

    for each (var example in ExamplesList.allExamples) {
        var compilerOptions = "";
        var linkerOptions = "";
        var ccsSearchDirs = " -I${workspace_loc:/${ProjName}}";

        if (!ExamplesList.isBoardSupported(example, devBoard) ||
            !ExamplesList.isToolSupported(example, tool)) {
            continue;
        }

        /* Add board files, linker file, makefile & example files to fileList */
        fileList = [];
        for each (var boardFile in devBoard.fileList) {
            fileList.push({
                path: "ti/boards" + boardFile.path,
                targetDirectory: boardFile.targetDirectory
            });
        }
        fileList.push({
            path: "ti/boards" + devBoard.linkercmd[tool].path,
            targetDirectory: devBoard.linkercmd[tool].targetDirectory
        });
        fileList.push({path: "examples/makefile.defs"});

        for each (var exampleFile in
            ExamplesList.getExampleSourceFiles(examplesSrcDir, devBoard, example)) {
            var filePath = "";

            if (exampleFile.path.match(/\$\{.*\}/)) {
                /* Replace TREX symbols with paths relative to examples dir */
                filePath = exampleFile.path.replace(/\$\{.*\}/, "examples/../..");
            }
            else {
                filePath = "examples" + exampleFile.path;
            }

            fileList.push({
                path: filePath,
                targetDirectory: exampleFile.targetDirectory
            });
        }

        /* Update fileList with updated path & target directory */
        for (var x in fileList) {
            var tmpFile = {path: fileList[x].path};

            if (fileList[x].targetDirectory && fileList[x].targetDirectory != ".") {
                tmpFile["targetDirectory"] = "./" + fileList[x].targetDirectory;

                /*
                 * We need to add the targetDirectory to the compiler search
                 * directories for CCS.
                 */
                var searchDir = " -I${workspace_loc:/${ProjName}/" +
                    fileList[x].targetDirectory + "}";
                if (ccsSearchDirs.indexOf(searchDir) < 0) {
                    ccsSearchDirs += searchDir;
                }
            }
            fileList[x] = tmpFile;
        }

        /* Create example filter */
        filter = [{
            deviceFamily: devBoard.family,
            deviceId: devBoard.deviceId,
            toolChain: tool
        }];

        /* Create the example group string */
        if (example.group == "Kernel" || example.group == "Instrumentation") {
            exampleGroup = [rootString, devBoard.name, example.group.toLowerCase(),
                tool].join(".");
        }
        else if (devBoard.supportedNetworkExamples &&
            devBoard.supportedNetworkExamples.indexOf(example.group) != -1) {
            exampleGroup = [rootString, devBoard.name, "network", tool,
                example.group].join(".");
        }
        else {
            exampleGroup = [rootString, devBoard.name, "driver", tool,
                example.group].join(".");
        }

        /* Join compiler and linker options from board and example */
        if (example.compilerBuildOptions &&
            example.compilerBuildOptions[tool]) {
            compilerOptions += example.compilerBuildOptions[tool];
        }
        compilerOptions += ccsSearchDirs +
            Boards.getIdeCompilerOptions(devBoard, tool);

        if (example.linkerBuildOptions && example.linkerBuildOptions[tool]) {
            linkerOptions += example.linkerBuildOptions[tool];
        }
        linkerOptions += Boards.getIdeLinkerOptions(devBoard, tool);

        trexExamples.templateArr.$add({
            title: example.title,
            name: example.name + "_" + devBoard.name + "_" + tool,
            description: example.description,
            options: example.options,
            buildProfile: "release",
            target: Boards.getTarget(devBoard, tool),
            platform: Boards.getPlatform(devBoard),
            board: {tiCloudName: devBoard.developmentBoard},
            compilerBuildOptions: compilerOptions,
            linkerBuildOptions: linkerOptions,
            linkerCommandFile: "",
            fileList: fileList,
            filterArr: filter,
            isHybrid: true,
            xdcToolsVersion: prodList["xdctools"].ver,
            groups: [exampleGroup],
            configuroOptions: " --compileOptions &quot;${COMPILER_FLAGS} &quot;",
        });
    }
}

/*
 *  ======== createBoardTree ========
 */
function createBoardTree(trexExamples, rootString, board) {
    var boardRoot = rootString + "." + board.name;

    /* Create board root */
    trexExamples.templateGroupArr.$add({
       id          : boardRoot,
       name        : board.trexName,
       description : "TI-RTOS example projects for " + board.trexName,
       groups      : [rootString]
    });

    /* Create drivers root */
    trexExamples.templateGroupArr.$add({
        id          : boardRoot + ".driver",
        name        : "Driver Examples",
        description : "TI-RTOS driver example projects for " + board.trexName,
        groups      : [boardRoot]
    });

    /* Create kernel examples root */
    trexExamples.templateGroupArr.$add({
       id          : boardRoot + ".kernel",
       name        : "Kernel Examples",
       description : "SYS/BIOS kernel examples for " + board.trexName,
       groups      : [boardRoot]
    });

    /* Create network examples root */
    trexExamples.templateGroupArr.$add({
        id          : boardRoot + ".network",
        name        : "Network Examples",
        description : "TI-RTOS network examples for " + board.trexName,
        groups      : [boardRoot]
    });

    /* Create uia examples root */
    trexExamples.templateGroupArr.$add({
       id          : boardRoot + ".instrumentation",
       name        : "Instrumentation Examples",
       description : "Instrumentation examples for " + board.trexName,
       groups      : [boardRoot]
    });
}

/*
 *  ======== createToolTree ========
 */
function createToolTree(trexExamples, rootString, board, tool) {
    var driversRoot = rootString + "." + board.name + ".driver";
    var biosRoot = rootString + "." + board.name + ".kernel";
    var networkRoot = rootString + "." + board.name + ".network";
    var uiaRoot = rootString + "." + board.name + ".instrumentation";

    /* Create drivers tool root */
    trexExamples.templateGroupArr.$add({
       id          : driversRoot + "." + tool,
       name        : tool + " Driver Examples",
       description : tool + " driver example projects for " + board.trexName,
       groups      : [driversRoot]
    });

    if (board.supportedDriverExamples) {
        for each (var exType in board.supportedDriverExamples) {
            trexExamples.templateGroupArr.$add({
                id          : driversRoot + "." + tool + "." + exType,
                name        : exType + " Examples",
                description : exType + " example projects for " + board.trexName,
                groups      : [driversRoot + "." + tool]
            });
        }
    }

    /* Create kernel tool root */
    trexExamples.templateGroupArr.$add({
       id          : biosRoot + "." + tool,
       name        : tool + " Kernel Examples",
       description : tool + " SYS/BIOS kernel examples for " + board.trexName,
       groups      : [biosRoot]
    });

    /* Create network tool root */
    trexExamples.templateGroupArr.$add({
       id          : networkRoot + "." + tool,
       name        : tool + " Network Examples",
       description : tool + " TI-RTOS network examples for  " + board.trexName,
       groups      : [networkRoot]
    });

    if (board.supportedNetworkExamples) {
        for each (var exType in board.supportedNetworkExamples) {
            trexExamples.templateGroupArr.$add({
                id          : networkRoot + "." + tool + "." + exType,
                name        : exType + " Examples",
                description : exType + " example projects for " + board.trexName,
                groups      : [networkRoot + "." + tool]
            });
        }
    }

    /* Create uia tool root */
    trexExamples.templateGroupArr.$add({
       id          : uiaRoot + "." + tool,
       name        : tool + " Instrumentation Examples",
       description : tool + " Instrumentation examples for " + board.trexName,
       groups      : [uiaRoot]
    });
}
