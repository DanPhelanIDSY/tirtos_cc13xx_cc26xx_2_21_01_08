#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#
#  target compatibility key = gnu.targets.arm.M3{1,0,4.8,4
#
ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/rf_multiMode_cc13xxware_instrumented/package/package_ti.drivers.rf.om3g.dep
package/lib/lib/rf_multiMode_cc13xxware_instrumented/package/package_ti.drivers.rf.om3g.dep: ;
endif

package/lib/lib/rf_multiMode_cc13xxware_instrumented/package/package_ti.drivers.rf.om3g: | .interfaces
package/lib/lib/rf_multiMode_cc13xxware_instrumented/package/package_ti.drivers.rf.om3g: package/package_ti.drivers.rf.c lib/rf_multiMode_cc13xxware_instrumented.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -Dxdc_runtime_Assert_DISABLE_CONDITIONAL_ASSERT -DDebugP_ASSERT_ENABLED -DDebugP_LOG_ENABLED -I../.. -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/cc13xxware_2_04_03_17272 -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/rf_multiMode_cc13xxware_instrumented/package/package_ti.drivers.rf.om3g: export LD_LIBRARY_PATH=

package/lib/lib/rf_multiMode_cc13xxware_instrumented/package/package_ti.drivers.rf.sm3g: | .interfaces
package/lib/lib/rf_multiMode_cc13xxware_instrumented/package/package_ti.drivers.rf.sm3g: package/package_ti.drivers.rf.c lib/rf_multiMode_cc13xxware_instrumented.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -Dxdc_runtime_Assert_DISABLE_CONDITIONAL_ASSERT -DDebugP_ASSERT_ENABLED -DDebugP_LOG_ENABLED -I../.. -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/cc13xxware_2_04_03_17272  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/rf_multiMode_cc13xxware_instrumented/package/package_ti.drivers.rf.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/rf_multiMode_cc13xxware_instrumented/./RFCC26XX_multiMode.om3g.dep
package/lib/lib/rf_multiMode_cc13xxware_instrumented/./RFCC26XX_multiMode.om3g.dep: ;
endif

package/lib/lib/rf_multiMode_cc13xxware_instrumented/./RFCC26XX_multiMode.om3g: | .interfaces
package/lib/lib/rf_multiMode_cc13xxware_instrumented/./RFCC26XX_multiMode.om3g: ./RFCC26XX_multiMode.c lib/rf_multiMode_cc13xxware_instrumented.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -Dxdc_runtime_Assert_DISABLE_CONDITIONAL_ASSERT -DDebugP_ASSERT_ENABLED -DDebugP_LOG_ENABLED -I../.. -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/cc13xxware_2_04_03_17272 -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/rf_multiMode_cc13xxware_instrumented/./RFCC26XX_multiMode.om3g: export LD_LIBRARY_PATH=

package/lib/lib/rf_multiMode_cc13xxware_instrumented/./RFCC26XX_multiMode.sm3g: | .interfaces
package/lib/lib/rf_multiMode_cc13xxware_instrumented/./RFCC26XX_multiMode.sm3g: ./RFCC26XX_multiMode.c lib/rf_multiMode_cc13xxware_instrumented.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -Dxdc_runtime_Assert_DISABLE_CONDITIONAL_ASSERT -DDebugP_ASSERT_ENABLED -DDebugP_LOG_ENABLED -I../.. -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/cc13xxware_2_04_03_17272  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/rf_multiMode_cc13xxware_instrumented/./RFCC26XX_multiMode.sm3g: export LD_LIBRARY_PATH=

clean,m3g ::
	-$(RM) package/lib/lib/rf_multiMode_cc13xxware_instrumented/package/package_ti.drivers.rf.om3g
	-$(RM) package/lib/lib/rf_multiMode_cc13xxware_instrumented/./RFCC26XX_multiMode.om3g
	-$(RM) package/lib/lib/rf_multiMode_cc13xxware_instrumented/package/package_ti.drivers.rf.sm3g
	-$(RM) package/lib/lib/rf_multiMode_cc13xxware_instrumented/./RFCC26XX_multiMode.sm3g

lib/rf_multiMode_cc13xxware_instrumented.am3g: package/lib/lib/rf_multiMode_cc13xxware_instrumented/package/package_ti.drivers.rf.om3g package/lib/lib/rf_multiMode_cc13xxware_instrumented/./RFCC26XX_multiMode.om3g lib/rf_multiMode_cc13xxware_instrumented.am3g.mak

clean::
	-$(RM) lib/rf_multiMode_cc13xxware_instrumented.am3g.mak
