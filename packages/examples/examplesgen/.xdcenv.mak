#
_XDCBUILDCOUNT = 
ifneq (,$(findstring path,$(_USEXDCENV_)))
override XDCPATH = /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/packages;/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/tidrivers_cc13xx_cc26xx_2_21_01_01/packages;/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages;/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/uia_2_01_00_01/packages;
override XDCROOT = /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core
override XDCBUILDCFG = /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/tirtos.bld
endif
ifneq (,$(findstring args,$(_USEXDCENV_)))
override XDCARGS = profile=release XDCTOOLS=/home/xlibrary/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core TIRTOS=/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08 TIDRIVERS=/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/tidrivers_cc13xx_cc26xx_2_21_01_01 BIOS=/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38 UIA=/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/uia_2_01_00_01 CC13XXWARE=/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/cc13xxware_2_04_03_17272 CC26XXWARE=/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/cc26xxware_2_24_03_17272 ti.targets.arm.elf.M3=/db/vendors/ti/arm/5.2.5/Linux iar.targets.arm.M3=/db/vendors/iar/arm/7.50/Linux gnu.targets.arm.M3=/db/vendors/linaro/gcc-arm-none-eabi-4_8-2014q3
override XDCTARGETS = 
endif
#
ifeq (0,1)
PKGPATH = /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/packages;/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/tidrivers_cc13xx_cc26xx_2_21_01_01/packages;/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages;/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/uia_2_01_00_01/packages;/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages;../..
HOSTOS = Linux
endif
