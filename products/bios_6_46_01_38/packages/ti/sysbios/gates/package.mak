#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#

unexport MAKEFILE_LIST
MK_NOGENDEPS := $(filter clean,$(MAKECMDGOALS))
override PKGDIR = ti/sysbios/gates
XDCINCS = -I. -I$(strip $(subst ;, -I,$(subst $(space),\$(space),$(XPKGPATH))))
XDCCFGDIR = package/cfg/

#
# The following dependencies ensure package.mak is rebuilt
# in the event that some included BOM script changes.
#
ifneq (clean,$(MAKECMDGOALS))
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/utils.js:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/utils.js
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/xdc.tci:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/xdc.tci
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/template.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/template.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/om2.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/om2.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/xmlgen.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/xmlgen.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/xmlgen2.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/xmlgen2.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/Warnings.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/Warnings.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/IPackage.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/IPackage.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/package.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/package.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/services/global/Clock.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/services/global/Clock.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/services/global/Trace.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/services/global/Trace.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/bld.js:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/bld.js
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/BuildEnvironment.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/BuildEnvironment.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/PackageContents.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/PackageContents.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/_gen.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/_gen.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Library.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Library.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Executable.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Executable.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Repository.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Repository.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Configuration.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Configuration.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Script.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Script.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Manifest.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Manifest.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Utils.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Utils.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/ITarget.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/ITarget.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/ITarget2.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/ITarget2.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/ITarget3.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/ITarget3.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/ITargetFilter.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/ITargetFilter.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/package.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/package.xs
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/bios.bld:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/bios.bld
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/ti/targets/ITarget.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/ti/targets/ITarget.xs
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/ti/targets/C28_large.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/ti/targets/C28_large.xs
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/ti/targets/C28_float.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/ti/targets/C28_float.xs
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/ti/targets/package.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/ti/targets/package.xs
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/ti/targets/arm/elf/IArm.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/ti/targets/arm/elf/IArm.xs
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/ti/targets/arm/elf/package.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/ti/targets/arm/elf/package.xs
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/ITarget.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/ITarget.xs
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/_utils.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/_utils.xs
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/Linux86.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/Linux86.xs
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/Mingw.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/Mingw.xs
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/package.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/package.xs
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/ITarget.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/ITarget.xs
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/GCArmv6.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/GCArmv6.xs
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/GCArmv7A.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/GCArmv7A.xs
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/IM.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/IM.xs
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/M3.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/M3.xs
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/M4.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/M4.xs
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/M4F.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/M4F.xs
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/A8F.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/A8F.xs
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/A9F.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/A9F.xs
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/A15F.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/A15F.xs
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/A53F.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/A53F.xs
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/package.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/package.xs
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/iar/targets/arm/ITarget.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/iar/targets/arm/ITarget.xs
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/iar/targets/arm/package.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/iar/targets/arm/package.xs
package.mak: package.bld
/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/ti/sysbios/Build.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/ti/sysbios/Build.xs
endif

ti.targets.arm.elf.M3.rootDir ?= /db/vendors/ti/arm/5.2.5/Linux
ti.targets.arm.elf.packageBase ?= /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/ti/targets/arm/elf/
gnu.targets.arm.M3.rootDir ?= /db/vendors/linaro/gcc-arm-none-eabi-4_8-2014q3
gnu.targets.arm.packageBase ?= /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/
iar.targets.arm.M3.rootDir ?= /db/vendors/iar/arm/7.50/Linux
iar.targets.arm.packageBase ?= /db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/iar/targets/arm/
.PRECIOUS: $(XDCCFGDIR)/%.oem3
.PHONY: all,em3 .dlls,em3 .executables,em3 test,em3
all,em3: .executables,em3
.executables,em3: .libraries,em3
.executables,em3: .dlls,em3
.dlls,em3: .libraries,em3
.libraries,em3: .interfaces
	@$(RM) $@
	@$(TOUCH) "$@"

.help::
	@$(ECHO) xdc test,em3
	@$(ECHO) xdc .executables,em3
	@$(ECHO) xdc .libraries,em3
	@$(ECHO) xdc .dlls,em3

.PRECIOUS: $(XDCCFGDIR)/%.om3g
.PHONY: all,m3g .dlls,m3g .executables,m3g test,m3g
all,m3g: .executables,m3g
.executables,m3g: .libraries,m3g
.executables,m3g: .dlls,m3g
.dlls,m3g: .libraries,m3g
.libraries,m3g: .interfaces
	@$(RM) $@
	@$(TOUCH) "$@"

.help::
	@$(ECHO) xdc test,m3g
	@$(ECHO) xdc .executables,m3g
	@$(ECHO) xdc .libraries,m3g
	@$(ECHO) xdc .dlls,m3g

.PRECIOUS: $(XDCCFGDIR)/%.orm3
.PHONY: all,rm3 .dlls,rm3 .executables,rm3 test,rm3
all,rm3: .executables,rm3
.executables,rm3: .libraries,rm3
.executables,rm3: .dlls,rm3
.dlls,rm3: .libraries,rm3
.libraries,rm3: .interfaces
	@$(RM) $@
	@$(TOUCH) "$@"

.help::
	@$(ECHO) xdc test,rm3
	@$(ECHO) xdc .executables,rm3
	@$(ECHO) xdc .libraries,rm3
	@$(ECHO) xdc .dlls,rm3


all: .executables 
.executables: .libraries .dlls
.libraries: .interfaces

PKGCFGS := $(wildcard package.xs) package/build.cfg
.interfaces: package/package.xdc.inc package/package.defs.h package.xdc $(PKGCFGS)

-include package/package.xdc.dep
package/%.xdc.inc package/%_ti.sysbios.gates.c package/%.defs.h: %.xdc $(PKGCFGS)
	@$(MSG) generating interfaces for package ti.sysbios.gates" (because $@ is older than $(firstword $?))" ...
	$(XSRUN) -f xdc/services/intern/cmd/build.xs $(MK_IDLOPTS) -m package/package.xdc.dep -i package/package.xdc.inc package.xdc

ifeq (,$(MK_NOGENDEPS))
-include package/package.cfg.dep
endif

package/package.cfg.xdc.inc: .interfaces $(XDCROOT)/packages/xdc/cfg/cfginc.js package.xdc
	@$(MSG) generating schema include file list ...
	$(CONFIG) -f $(XDCROOT)/packages/xdc/cfg/cfginc.js ti.sysbios.gates $@

.libraries,em3 .libraries: lib/sysbios/debug/ti.sysbios.gates.aem3

-include lib/sysbios/debug/ti.sysbios.gates.aem3.mak
lib/sysbios/debug/ti.sysbios.gates.aem3: 
	$(RM) $@
	@$(MSG) archiving package/lib/lib/sysbios/debug/ti.sysbios.gates/package/package_ti.sysbios.gates.oem3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateHwi.oem3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateAll.oem3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateSwi.oem3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateTask.oem3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateTest.oem3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateMutex.oem3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateMutexPri.oem3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateSpinlock.oem3  into $@ ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armar  rq $@   package/lib/lib/sysbios/debug/ti.sysbios.gates/package/package_ti.sysbios.gates.oem3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateHwi.oem3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateAll.oem3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateSwi.oem3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateTask.oem3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateTest.oem3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateMutex.oem3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateMutexPri.oem3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateSpinlock.oem3 
lib/sysbios/debug/ti.sysbios.gates.aem3: export C_DIR=
lib/sysbios/debug/ti.sysbios.gates.aem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

clean,em3 clean::
	-$(RM) lib/sysbios/debug/ti.sysbios.gates.aem3
.libraries,m3g .libraries: lib/sysbios/debug/ti.sysbios.gates.am3g

-include lib/sysbios/debug/ti.sysbios.gates.am3g.mak
lib/sysbios/debug/ti.sysbios.gates.am3g: 
	$(RM) $@
	@$(MSG) archiving package/lib/lib/sysbios/debug/ti.sysbios.gates/package/package_ti.sysbios.gates.om3g package/lib/lib/sysbios/debug/ti.sysbios.gates/GateHwi.om3g package/lib/lib/sysbios/debug/ti.sysbios.gates/GateAll.om3g package/lib/lib/sysbios/debug/ti.sysbios.gates/GateSwi.om3g package/lib/lib/sysbios/debug/ti.sysbios.gates/GateTask.om3g package/lib/lib/sysbios/debug/ti.sysbios.gates/GateTest.om3g package/lib/lib/sysbios/debug/ti.sysbios.gates/GateMutex.om3g package/lib/lib/sysbios/debug/ti.sysbios.gates/GateMutexPri.om3g package/lib/lib/sysbios/debug/ti.sysbios.gates/GateSpinlock.om3g  into $@ ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-ar  cr $@   package/lib/lib/sysbios/debug/ti.sysbios.gates/package/package_ti.sysbios.gates.om3g package/lib/lib/sysbios/debug/ti.sysbios.gates/GateHwi.om3g package/lib/lib/sysbios/debug/ti.sysbios.gates/GateAll.om3g package/lib/lib/sysbios/debug/ti.sysbios.gates/GateSwi.om3g package/lib/lib/sysbios/debug/ti.sysbios.gates/GateTask.om3g package/lib/lib/sysbios/debug/ti.sysbios.gates/GateTest.om3g package/lib/lib/sysbios/debug/ti.sysbios.gates/GateMutex.om3g package/lib/lib/sysbios/debug/ti.sysbios.gates/GateMutexPri.om3g package/lib/lib/sysbios/debug/ti.sysbios.gates/GateSpinlock.om3g 
lib/sysbios/debug/ti.sysbios.gates.am3g: export LD_LIBRARY_PATH=

clean,m3g clean::
	-$(RM) lib/sysbios/debug/ti.sysbios.gates.am3g
.libraries,rm3 .libraries: lib/sysbios/debug/ti.sysbios.gates.arm3

-include lib/sysbios/debug/ti.sysbios.gates.arm3.mak
lib/sysbios/debug/ti.sysbios.gates.arm3: 
	$(RM) $@
	@$(MSG) archiving package/lib/lib/sysbios/debug/ti.sysbios.gates/package/package_ti.sysbios.gates.orm3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateHwi.orm3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateAll.orm3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateSwi.orm3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateTask.orm3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateTest.orm3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateMutex.orm3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateMutexPri.orm3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateSpinlock.orm3  into $@ ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iarchive --silent -o $@   package/lib/lib/sysbios/debug/ti.sysbios.gates/package/package_ti.sysbios.gates.orm3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateHwi.orm3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateAll.orm3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateSwi.orm3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateTask.orm3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateTest.orm3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateMutex.orm3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateMutexPri.orm3 package/lib/lib/sysbios/debug/ti.sysbios.gates/GateSpinlock.orm3 

clean,rm3 clean::
	-$(RM) lib/sysbios/debug/ti.sysbios.gates.arm3
test:;
%,copy:
	@$(if $<,,$(MSG) don\'t know how to build $*; exit 1)
	@$(MSG) cp $< $@
	$(RM) $@
	$(CP) $< $@
package_ti.sysbios.gates.oem3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/package/package_ti.sysbios.gates.oem3
package_ti.sysbios.gates.sem3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/package/package_ti.sysbios.gates.sem3
GateHwi.oem3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateHwi.oem3
GateHwi.sem3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateHwi.sem3
GateAll.oem3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateAll.oem3
GateAll.sem3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateAll.sem3
GateSwi.oem3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateSwi.oem3
GateSwi.sem3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateSwi.sem3
GateTask.oem3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateTask.oem3
GateTask.sem3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateTask.sem3
GateTest.oem3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateTest.oem3
GateTest.sem3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateTest.sem3
GateMutex.oem3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateMutex.oem3
GateMutex.sem3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateMutex.sem3
GateMutexPri.oem3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateMutexPri.oem3
GateMutexPri.sem3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateMutexPri.sem3
GateSpinlock.oem3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateSpinlock.oem3
GateSpinlock.sem3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateSpinlock.sem3
package_ti.sysbios.gates.om3g,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/package/package_ti.sysbios.gates.om3g
package_ti.sysbios.gates.sm3g,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/package/package_ti.sysbios.gates.sm3g
GateHwi.om3g,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateHwi.om3g
GateHwi.sm3g,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateHwi.sm3g
GateAll.om3g,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateAll.om3g
GateAll.sm3g,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateAll.sm3g
GateSwi.om3g,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateSwi.om3g
GateSwi.sm3g,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateSwi.sm3g
GateTask.om3g,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateTask.om3g
GateTask.sm3g,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateTask.sm3g
GateTest.om3g,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateTest.om3g
GateTest.sm3g,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateTest.sm3g
GateMutex.om3g,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateMutex.om3g
GateMutex.sm3g,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateMutex.sm3g
GateMutexPri.om3g,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateMutexPri.om3g
GateMutexPri.sm3g,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateMutexPri.sm3g
GateSpinlock.om3g,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateSpinlock.om3g
GateSpinlock.sm3g,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateSpinlock.sm3g
package_ti.sysbios.gates.orm3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/package/package_ti.sysbios.gates.orm3
package_ti.sysbios.gates.srm3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/package/package_ti.sysbios.gates.srm3
GateHwi.orm3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateHwi.orm3
GateHwi.srm3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateHwi.srm3
GateAll.orm3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateAll.orm3
GateAll.srm3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateAll.srm3
GateSwi.orm3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateSwi.orm3
GateSwi.srm3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateSwi.srm3
GateTask.orm3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateTask.orm3
GateTask.srm3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateTask.srm3
GateTest.orm3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateTest.orm3
GateTest.srm3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateTest.srm3
GateMutex.orm3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateMutex.orm3
GateMutex.srm3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateMutex.srm3
GateMutexPri.orm3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateMutexPri.orm3
GateMutexPri.srm3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateMutexPri.srm3
GateSpinlock.orm3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateSpinlock.orm3
GateSpinlock.srm3,copy : package/lib/lib/sysbios/debug/ti.sysbios.gates/GateSpinlock.srm3

$(XDCCFGDIR)%.c $(XDCCFGDIR)%.h $(XDCCFGDIR)%.xdl: $(XDCCFGDIR)%.cfg $(XDCROOT)/packages/xdc/cfg/Main.xs | .interfaces
	@$(MSG) "configuring $(_PROG_NAME) from $< ..."
	$(CONFIG) $(_PROG_XSOPTS) xdc.cfg $(_PROG_NAME) $(XDCCFGDIR)$*.cfg $(XDCCFGDIR)$*

.PHONY: release,ti_sysbios_gates
ifeq (,$(MK_NOGENDEPS))
-include package/rel/ti_sysbios_gates.tar.dep
-include package/rel/ti_sysbios_gates.tar.rcl.dep
endif
package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml: package/package.bld.xml
package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml: package/build.cfg
package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml: package/package.xdc.inc
package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml: package.bld
package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml: GateHwi.xml
package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml: GateMutex.xml
package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml: GateMutexPri.xml
package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml: GateSwi.xml
package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml: GateTask.xml
package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml: GateAll.xml
package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml: GateSpinlock.xml
package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml: package/package.cfg.xdc.inc
package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml: lib/sysbios/debug/ti.sysbios.gates.aem3
package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml: package/package_ti.sysbios.gates.c
package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml: GateHwi.c
package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml: GateAll.c
package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml: GateSwi.c
package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml: GateTask.c
package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml: GateTest.c
package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml: GateMutex.c
package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml: GateMutexPri.c
package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml: GateSpinlock.c
package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml: lib/sysbios/debug/ti.sysbios.gates.am3g
package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml: lib/sysbios/debug/ti.sysbios.gates.arm3
package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml: .force
	@$(MSG) generating external release references $@ ...
	$(XS) $(JSENV) -f $(XDCROOT)/packages/xdc/bld/rel.js $(MK_RELOPTS) . $@

ti_sysbios_gates.tar: package/rel/ti_sysbios_gates.xdc.inc package/rel/ti_sysbios_gates/ti/sysbios/gates/package/package.rel.xml
	@$(MSG) making release file $@ "(because of $(firstword $?))" ...
	-$(RM) $@
	$(call MKRELTAR,package/rel/ti_sysbios_gates.xdc.inc,package/rel/ti_sysbios_gates.tar.dep, ti/sysbios/libFilter.xs)


release release,ti_sysbios_gates: all ti_sysbios_gates.tar
clean:: .clean
	-$(RM) ti_sysbios_gates.tar
	-$(RM) package/rel/ti_sysbios_gates.xdc.inc
	-$(RM) package/rel/ti_sysbios_gates.tar.dep

clean:: .clean
	-$(RM) .libraries $(wildcard .libraries,*)
clean:: 
	-$(RM) .dlls $(wildcard .dlls,*)
#
# The following clean rule removes user specified
# generated files or directories.
#
	-$(RMDIR) lib/

ifneq (clean,$(MAKECMDGOALS))
ifeq (,$(wildcard lib))
    $(shell $(MKDIR) lib)
endif
ifeq (,$(wildcard lib/sysbios))
    $(shell $(MKDIR) lib/sysbios)
endif
ifeq (,$(wildcard lib/sysbios/debug))
    $(shell $(MKDIR) lib/sysbios/debug)
endif
ifeq (,$(wildcard package))
    $(shell $(MKDIR) package)
endif
ifeq (,$(wildcard package/cfg))
    $(shell $(MKDIR) package/cfg)
endif
ifeq (,$(wildcard package/lib))
    $(shell $(MKDIR) package/lib)
endif
ifeq (,$(wildcard package/rel))
    $(shell $(MKDIR) package/rel)
endif
ifeq (,$(wildcard package/internal))
    $(shell $(MKDIR) package/internal)
endif
ifeq (,$(wildcard package/lib/lib))
    $(shell $(MKDIR) package/lib/lib)
endif
ifeq (,$(wildcard package/lib/lib/sysbios))
    $(shell $(MKDIR) package/lib/lib/sysbios)
endif
ifeq (,$(wildcard package/lib/lib/sysbios/debug))
    $(shell $(MKDIR) package/lib/lib/sysbios/debug)
endif
ifeq (,$(wildcard package/lib/lib/sysbios/debug/ti.sysbios.gates))
    $(shell $(MKDIR) package/lib/lib/sysbios/debug/ti.sysbios.gates)
endif
ifeq (,$(wildcard package/lib/lib/sysbios/debug/ti.sysbios.gates/package))
    $(shell $(MKDIR) package/lib/lib/sysbios/debug/ti.sysbios.gates/package)
endif
endif
clean::
	-$(RMDIR) package


