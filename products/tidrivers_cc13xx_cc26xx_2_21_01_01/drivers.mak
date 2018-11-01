#
#  ======== drivers.mak ========
#

#
# Update the variables below with paths to point to compilers & products
# installed locally.  If a particular compiler or product will not be used it
# must remain undefined.
#
# NOTE: Paths must not contain spaces.  If using a Windows PC the following
# command can be used to determine a directory's DOS path:
#
# 	> for %I in ("path") do echo %~sI
#
# IAR Workbench example:
#     Path:        c:\Program Files (x86)\IAR Systems\Embedded Workbench 7.2
#     DOS Path:    c:\PROGRA~2\IARSYS~1\EMBEDD~1.2
#

ti.targets.arm.elf.M3 ?=
ti.targets.arm.elf.M4 ?=
ti.targets.arm.elf.M4F ?=
ti.targets.msp430.elf.MSP430X ?=

gnu.targets.arm.M3 ?=
gnu.targets.arm.M4 ?=
gnu.targets.arm.M4F ?=

iar.targets.arm.M3 ?=
iar.targets.arm.M4 ?=
iar.targets.arm.M4F ?=
iar.targets.msp430.MSP430X_small ?=

XDC_INSTALL_DIR ?=
BIOS_INSTALL_DIR ?=
BIOS_PACKAGES_DIR ?= $(BIOS_INSTALL_DIR)/packages
NDK_INSTALL_DIR ?=
NDK_PACKAGES_DIR ?= $(NDK_INSTALL_DIR)/packages

CC13XXWARE ?=
CC26XXWARE ?=
CC32XXWARE ?=
MSP430DRIVERLIB ?=
MSP430GRLIB ?=
MSP430USBLIB ?=
MSP432DRIVERLIB ?=
MWARE ?=
TIVAWARE ?=

MSP430HEADERS ?=
MSP432HEADERS ?=
IAR_MSP430HEADERS ?=
IAR_MSP432HEADERS ?=
MSP430DEVLIST ?=
MSP432DEVLIST ?=

#
# Set XDCARGS to some of the variables above.  XDCARGS are passed
# to the XDC build engine... which will load drivers.bld... which will
# extract these variables and use them to determine what to build and which
# toolchains to use.
#
# Note that not all of these variables need to be set to something valid.
# Unfortunately, since these vars are unconditionally assigned, your build line
# will be longer and more noisy than necessary (e.g., it will include CC_V5T
# assignment even if you're just building for C64P).
#
# Some background is here:
#     http://rtsc.eclipse.org/docs-tip/Command_-_xdc#Environment_Variables
#
XDCARGS= \
	ti.targets.arm.elf.M3=$(ti.targets.arm.elf.M3) \
	ti.targets.arm.elf.M4=$(ti.targets.arm.elf.M4) \
	ti.targets.arm.elf.M4F=$(ti.targets.arm.elf.M4F) \
	ti.targets.msp430.elf.MSP430X=$(ti.targets.msp430.elf.MSP430X) \
	gnu.targets.arm.M3=$(gnu.targets.arm.M3) \
	gnu.targets.arm.M4=$(gnu.targets.arm.M4) \
	gnu.targets.arm.M4F=$(gnu.targets.arm.M4F) \
	iar.targets.msp430.MSP430X_small=$(iar.targets.msp430.MSP430X_small) \
	iar.targets.arm.M3=$(iar.targets.arm.M3) \
	iar.targets.arm.M4=$(iar.targets.arm.M4) \
	iar.targets.arm.M4F=$(iar.targets.arm.M4F) \
	\
	CC13XXWARE=$(CC13XXWARE) \
	CC26XXWARE=$(CC26XXWARE) \
	CC32XXWARE=$(CC32XXWARE) \
	MSP430DRIVERLIB=$(MSP430DRIVERLIB) \
	MSP430GRLIB=$(MSP430GRLIB) \
	MSP430USBLIB=$(MSP430USBLIB) \
	MSP432DRIVERLIB=$(MSP432DRIVERLIB) \
	MWARE=$(MWARE) \
	TIVAWARE=$(TIVAWARE) \
	MSP430HEADERS=$(MSP430HEADERS) \
	MSP432HEADERS=$(MSP432HEADERS) \
	IAR_MSP430HEADERS=$(IAR_MSP430HEADERS) \
	IAR_MSP432HEADERS=$(IAR_MSP432HEADERS) \
	MSP430DEVLIST=$(MSP430DEVLIST) \
	MSP432DEVLIST=$(MSP432DEVLIST)

#
# Set XDCPATH to contain necessary repositories.
#
XDCPATH = $(BIOS_PACKAGES_DIR);
ifneq ("$(NDK_INSTALL_DIR)", "")
XDCPATH = $(BIOS_PACKAGES_DIR);$(NDK_PACKAGES_DIR);
endif
export XDCPATH

#
# Set XDCOPTIONS.  Use -v for a verbose build.
#
#export XDCOPTIONS=v

#
# Set XDC executable command
# Note that XDCBUILDCFG points to the drivers.bld file which uses
# the arguments specified by XDCARGS
#
XDC = $(XDC_INSTALL_DIR)/xdc XDCBUILDCFG=./drivers.bld

######################################################
## Shouldnt have to modify anything below this line ##
######################################################

all:
	@ echo building drivers packages ...
	@ $(XDC) XDCARGS="$(XDCARGS)" all -j $(j) -PR ./packages

release:
	@ echo building drivers release ...
	@ $(XDC) XDCARGS="$(XDCARGS)" release -j $(j) -PR ./packages

clean:
	@ echo cleaning drivers packages ...
	@ $(XDC) XDCARGS="$(XDCARGS)" XDCBUILDCFG=./drivers.bld clean -PR ./packages
