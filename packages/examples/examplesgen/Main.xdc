/*
 *  Copyright 2015 by Texas Instruments Incorporated.
 *
 */

/*!
 *  ======== Main ========
 *  This tool generates TIRTOS examples from the installed product.
 *  It creates a directory structure for the examples based on toolchain.  Each
 *  toolchain folder has folders for all boards it supports which in
 *  turn contain folders for every example supported by that board.
 *  Also makefiles to build these examples with that toolchain are provided so
 *  that a user can run a top level make, to build all examples or run make in
 *  a given example to build it specifically.
 *
 *  options:
 *    [--toolchain        Toolchain name (e.g. TI, IAR, GNU)]
 *    [--toolchainDir     Toolchain install path]
 *    [--output           Output directory]
 *    [--productGroup     Device TI-RTOS product group (e.g. C2000, MSP43x, SimpleLink, TivaC)]
 *    [--deviceFamily     Device family (e.g. C2000, MSP40, MSP432, SimpleLink, TivaC)]
 *    [--boardFilter      List of specific boards for which to generate examples]
 *    [--boardsFile       File containing a list of boards]
 *    [--examplelistFile  File containing a list of examples to generate]
 *    [--extraCOpts       Compiler options appended to makedefs options for all examples]
 *    [--extraLOpts       Linker options appended to makedefs options for all examples]
 *    [--xdcExtraPaths    Paths appended to makedefs XDC path for all examples]
 *
 */

metaonly module Main inherits xdc.tools.ICmd
{
    override config String usage[] = [
        '[--toolchain        Toolchain name (e.g. TI, IAR, GNU)]',
        '[--toolchainDir     Toolchain install path]',
        '[--output           Output path]',
        '[--productGroup     TI-RTOS product group (e.g. C2000, MSP43x, SimpleLink, TivaC)]',
        '[--deviceFamily     Device family (e.g. C2000, MSP40, MSP432, SimpleLink, TivaC)]',
        '[--boardFilter      List of specific boards for which to generate examples]',
        '[--boardsFile       File containing a list of boards]',
        '[--examplelistFile  File containing a list of examples to generate]',
        '[--extraCOpts       Compiler options appended to makedefs options for all examples]',
        '[--extraLOpts       Linker options appended to makedefs options for all examples]',
        '[--xdcExtraPaths    Paths appended to makedefs XDC path for all examples]'
    ];

instance:

    /*!
     *  ======== toolchain ========
     *  Name of the toolchain for which examples will be generated
     *
     *  This option is required.
     *
     */
    @CommandOption("toolchain")
    config String toolchain;

    /*!
     *  ======== toolchainDir ========
     *  Toolchain installation path
     *
     *  This option is required and must be specified in UNIX directory format
     *  (i.e. no forward slashes).
     *
     */
    @CommandOption("toolchainDir")
    config String toolchainDir;

    /*!
     *  ======== output ========
     *  Output directory to which the examples will be generated
     *
     *  This option is required and must be specified in UNIX directory format
     *  (i.e. no forward slashes).
     *
     */
    @CommandOption("output")
    config String output;

    /*!
     *  ======== productGroup ========
     *  Name of the product group for which examples will be generated.  The
     *  argument must match a product group specified in "Boards.xs"
     *
     *  This option is required.
     *
     */
    @CommandOption("productGroup")
    config String productGroup;

    /*!
     *  ======== deviceFamily ========
     *  Name of the device family for which to generate examples (i.e. ARM,
     *  C2000, MSP430, MSP432)
     *
     *  Parameter is optional.
     *
     */
    @CommandOption("deviceFamily")
    config String deviceFamily = "";

    /*!
     *
     *  ======== boardFilter ========
     *  List of specific boards for which to generate examples
     *
     *  Parameter is optional and names must match those specified in the boards
     *  file.
     *
     */
    @CommandOption("boardFilter")
    config String boardFilter = "";

    /*!
     *
     *  ======== boardsFile ========
     *  Specify a file which contains board descriptions
     *
     *  Parameter is optional.
     *
     */
    @CommandOption("boardsFile")
    config String boardsFile = "";

    /*!
     *
     *  ======== examplelistFile ========
     *  Specify a file which contains the description of examples to generate
     *
     *  Parameter is optional.
     *
     */
    @CommandOption("examplelistFile")
    config String examplelistFile = "";

    /*!
     *
     *  ======== extraCOpts ========
     *  Compiler options to be appended to the makedefs compiler options for
     *  all examples
     *
     *  Parameter is optional.
     *
     */
    @CommandOption("extraCOpts")
    config String extraCOpts = "";

    /*!
     *
     *  ======== extraLOpts ========
     *  Linker options to be appended to the makedefs linker options for
     *  all examples
     *
     *  Parameter is optional.
     *
     */
    @CommandOption("extraLOpts")
    config String extraLOpts = "";

    /*!
     *
     *  ======== xdcExtraPaths ========
     *  Paths appended to the makedefs XDC path for all examples
     *
     *  Parameter is optional and when specified must be in UNIX path format
     *  (i.e. no forward slashes).
     *
     */
    @CommandOption("xdcExtraPaths")
    config String xdcExtraPaths = "";

    /*!
     *  ======== run ========
     */
    override Any run(xdc.tools.Cmdr.Instance cmdr, String args[]);
}
