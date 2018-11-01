#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#
#  target compatibility key = ti.targets.arm.elf.M3{1,0,5.2,5
#
ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/grlib/package/package_ti.mw.grlib.oem3.dep
package/lib/lib/grlib/package/package_ti.mw.grlib.oem3.dep: ;
endif

package/lib/lib/grlib/package/package_ti.mw.grlib.oem3: | .interfaces
package/lib/lib/grlib/package/package_ti.mw.grlib.oem3: package/package_ti.mw.grlib.c lib/grlib.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/package -fr=./package/lib/lib/grlib/package -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/grlib/package -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/package -fr=./package/lib/lib/grlib/package
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/grlib/package/package_ti.mw.grlib.oem3: export C_DIR=
package/lib/lib/grlib/package/package_ti.mw.grlib.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/grlib/package/package_ti.mw.grlib.sem3: | .interfaces
package/lib/lib/grlib/package/package_ti.mw.grlib.sem3: package/package_ti.mw.grlib.c lib/grlib.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/package -fr=./package/lib/lib/grlib/package -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/grlib/package -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/package -fr=./package/lib/lib/grlib/package
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/grlib/package/package_ti.mw.grlib.sem3: export C_DIR=
package/lib/lib/grlib/package/package_ti.mw.grlib.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/grlib/./fonts/fontfixed6x8.oem3.dep
package/lib/lib/grlib/./fonts/fontfixed6x8.oem3.dep: ;
endif

package/lib/lib/grlib/./fonts/fontfixed6x8.oem3: | .interfaces
package/lib/lib/grlib/./fonts/fontfixed6x8.oem3: ./fonts/fontfixed6x8.c lib/grlib.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/./fonts -fr=./package/lib/lib/grlib/./fonts -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/grlib/./fonts -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/./fonts -fr=./package/lib/lib/grlib/./fonts
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/grlib/./fonts/fontfixed6x8.oem3: export C_DIR=
package/lib/lib/grlib/./fonts/fontfixed6x8.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/grlib/./fonts/fontfixed6x8.sem3: | .interfaces
package/lib/lib/grlib/./fonts/fontfixed6x8.sem3: ./fonts/fontfixed6x8.c lib/grlib.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/./fonts -fr=./package/lib/lib/grlib/./fonts -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/grlib/./fonts -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/./fonts -fr=./package/lib/lib/grlib/./fonts
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/grlib/./fonts/fontfixed6x8.sem3: export C_DIR=
package/lib/lib/grlib/./fonts/fontfixed6x8.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/grlib/./circle.oem3.dep
package/lib/lib/grlib/./circle.oem3.dep: ;
endif

package/lib/lib/grlib/./circle.oem3: | .interfaces
package/lib/lib/grlib/./circle.oem3: ./circle.c lib/grlib.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/. -fr=./package/lib/lib/grlib/. -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/grlib/. -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/. -fr=./package/lib/lib/grlib/.
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/grlib/./circle.oem3: export C_DIR=
package/lib/lib/grlib/./circle.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/grlib/./circle.sem3: | .interfaces
package/lib/lib/grlib/./circle.sem3: ./circle.c lib/grlib.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/. -fr=./package/lib/lib/grlib/. -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/grlib/. -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/. -fr=./package/lib/lib/grlib/.
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/grlib/./circle.sem3: export C_DIR=
package/lib/lib/grlib/./circle.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/grlib/./context.oem3.dep
package/lib/lib/grlib/./context.oem3.dep: ;
endif

package/lib/lib/grlib/./context.oem3: | .interfaces
package/lib/lib/grlib/./context.oem3: ./context.c lib/grlib.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/. -fr=./package/lib/lib/grlib/. -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/grlib/. -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/. -fr=./package/lib/lib/grlib/.
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/grlib/./context.oem3: export C_DIR=
package/lib/lib/grlib/./context.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/grlib/./context.sem3: | .interfaces
package/lib/lib/grlib/./context.sem3: ./context.c lib/grlib.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/. -fr=./package/lib/lib/grlib/. -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/grlib/. -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/. -fr=./package/lib/lib/grlib/.
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/grlib/./context.sem3: export C_DIR=
package/lib/lib/grlib/./context.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/grlib/./image.oem3.dep
package/lib/lib/grlib/./image.oem3.dep: ;
endif

package/lib/lib/grlib/./image.oem3: | .interfaces
package/lib/lib/grlib/./image.oem3: ./image.c lib/grlib.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/. -fr=./package/lib/lib/grlib/. -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/grlib/. -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/. -fr=./package/lib/lib/grlib/.
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/grlib/./image.oem3: export C_DIR=
package/lib/lib/grlib/./image.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/grlib/./image.sem3: | .interfaces
package/lib/lib/grlib/./image.sem3: ./image.c lib/grlib.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/. -fr=./package/lib/lib/grlib/. -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/grlib/. -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/. -fr=./package/lib/lib/grlib/.
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/grlib/./image.sem3: export C_DIR=
package/lib/lib/grlib/./image.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/grlib/./line.oem3.dep
package/lib/lib/grlib/./line.oem3.dep: ;
endif

package/lib/lib/grlib/./line.oem3: | .interfaces
package/lib/lib/grlib/./line.oem3: ./line.c lib/grlib.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/. -fr=./package/lib/lib/grlib/. -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/grlib/. -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/. -fr=./package/lib/lib/grlib/.
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/grlib/./line.oem3: export C_DIR=
package/lib/lib/grlib/./line.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/grlib/./line.sem3: | .interfaces
package/lib/lib/grlib/./line.sem3: ./line.c lib/grlib.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/. -fr=./package/lib/lib/grlib/. -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/grlib/. -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/. -fr=./package/lib/lib/grlib/.
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/grlib/./line.sem3: export C_DIR=
package/lib/lib/grlib/./line.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/grlib/./rectangle.oem3.dep
package/lib/lib/grlib/./rectangle.oem3.dep: ;
endif

package/lib/lib/grlib/./rectangle.oem3: | .interfaces
package/lib/lib/grlib/./rectangle.oem3: ./rectangle.c lib/grlib.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/. -fr=./package/lib/lib/grlib/. -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/grlib/. -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/. -fr=./package/lib/lib/grlib/.
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/grlib/./rectangle.oem3: export C_DIR=
package/lib/lib/grlib/./rectangle.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/grlib/./rectangle.sem3: | .interfaces
package/lib/lib/grlib/./rectangle.sem3: ./rectangle.c lib/grlib.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/. -fr=./package/lib/lib/grlib/. -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/grlib/. -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/. -fr=./package/lib/lib/grlib/.
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/grlib/./rectangle.sem3: export C_DIR=
package/lib/lib/grlib/./rectangle.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/grlib/./string.oem3.dep
package/lib/lib/grlib/./string.oem3.dep: ;
endif

package/lib/lib/grlib/./string.oem3: | .interfaces
package/lib/lib/grlib/./string.oem3: ./string.c lib/grlib.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/. -fr=./package/lib/lib/grlib/. -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/grlib/. -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/. -fr=./package/lib/lib/grlib/.
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/grlib/./string.oem3: export C_DIR=
package/lib/lib/grlib/./string.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/grlib/./string.sem3: | .interfaces
package/lib/lib/grlib/./string.sem3: ./string.c lib/grlib.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/. -fr=./package/lib/lib/grlib/. -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/grlib/. -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/grlib/. -fr=./package/lib/lib/grlib/.
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/grlib/./string.sem3: export C_DIR=
package/lib/lib/grlib/./string.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

clean,em3 ::
	-$(RM) package/lib/lib/grlib/package/package_ti.mw.grlib.oem3
	-$(RM) package/lib/lib/grlib/./fonts/fontfixed6x8.oem3
	-$(RM) package/lib/lib/grlib/./circle.oem3
	-$(RM) package/lib/lib/grlib/./context.oem3
	-$(RM) package/lib/lib/grlib/./image.oem3
	-$(RM) package/lib/lib/grlib/./line.oem3
	-$(RM) package/lib/lib/grlib/./rectangle.oem3
	-$(RM) package/lib/lib/grlib/./string.oem3
	-$(RM) package/lib/lib/grlib/package/package_ti.mw.grlib.sem3
	-$(RM) package/lib/lib/grlib/./fonts/fontfixed6x8.sem3
	-$(RM) package/lib/lib/grlib/./circle.sem3
	-$(RM) package/lib/lib/grlib/./context.sem3
	-$(RM) package/lib/lib/grlib/./image.sem3
	-$(RM) package/lib/lib/grlib/./line.sem3
	-$(RM) package/lib/lib/grlib/./rectangle.sem3
	-$(RM) package/lib/lib/grlib/./string.sem3

lib/grlib.aem3: package/lib/lib/grlib/package/package_ti.mw.grlib.oem3 package/lib/lib/grlib/./fonts/fontfixed6x8.oem3 package/lib/lib/grlib/./circle.oem3 package/lib/lib/grlib/./context.oem3 package/lib/lib/grlib/./image.oem3 package/lib/lib/grlib/./line.oem3 package/lib/lib/grlib/./rectangle.oem3 package/lib/lib/grlib/./string.oem3 lib/grlib.aem3.mak

clean::
	-$(RM) lib/grlib.aem3.mak