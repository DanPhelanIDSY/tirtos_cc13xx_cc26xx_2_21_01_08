#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#
#  target compatibility key = iar.targets.arm.M3{1,0,7.50,1
#
ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.events/package/package_ti.uia.events.orm3.dep
package/lib/lib/release/ti.uia.events/package/package_ti.uia.events.orm3.dep: ;
endif

package/lib/lib/release/ti.uia.events/package/package_ti.uia.events.orm3: | .interfaces
package/lib/lib/release/ti.uia.events/package/package_ti.uia.events.orm3: package/package_ti.uia.events.c lib/release/ti.uia.events.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_50_1 -Ohs --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/release/ti.uia.events/package/package_ti.uia.events.srm3: | .interfaces
package/lib/lib/release/ti.uia.events/package/package_ti.uia.events.srm3: package/package_ti.uia.events.c lib/release/ti.uia.events.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_50_1 -Ohs --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.events/UIAAppCtx.orm3.dep
package/lib/lib/release/ti.uia.events/UIAAppCtx.orm3.dep: ;
endif

package/lib/lib/release/ti.uia.events/UIAAppCtx.orm3: | .interfaces
package/lib/lib/release/ti.uia.events/UIAAppCtx.orm3: UIAAppCtx.c lib/release/ti.uia.events.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_50_1 -Ohs --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/release/ti.uia.events/UIAAppCtx.srm3: | .interfaces
package/lib/lib/release/ti.uia.events/UIAAppCtx.srm3: UIAAppCtx.c lib/release/ti.uia.events.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_50_1 -Ohs --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.events/UIAChanCtx.orm3.dep
package/lib/lib/release/ti.uia.events/UIAChanCtx.orm3.dep: ;
endif

package/lib/lib/release/ti.uia.events/UIAChanCtx.orm3: | .interfaces
package/lib/lib/release/ti.uia.events/UIAChanCtx.orm3: UIAChanCtx.c lib/release/ti.uia.events.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_50_1 -Ohs --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/release/ti.uia.events/UIAChanCtx.srm3: | .interfaces
package/lib/lib/release/ti.uia.events/UIAChanCtx.srm3: UIAChanCtx.c lib/release/ti.uia.events.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_50_1 -Ohs --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.events/UIAFrameCtx.orm3.dep
package/lib/lib/release/ti.uia.events/UIAFrameCtx.orm3.dep: ;
endif

package/lib/lib/release/ti.uia.events/UIAFrameCtx.orm3: | .interfaces
package/lib/lib/release/ti.uia.events/UIAFrameCtx.orm3: UIAFrameCtx.c lib/release/ti.uia.events.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_50_1 -Ohs --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/release/ti.uia.events/UIAFrameCtx.srm3: | .interfaces
package/lib/lib/release/ti.uia.events/UIAFrameCtx.srm3: UIAFrameCtx.c lib/release/ti.uia.events.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_50_1 -Ohs --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.events/UIAThreadCtx.orm3.dep
package/lib/lib/release/ti.uia.events/UIAThreadCtx.orm3.dep: ;
endif

package/lib/lib/release/ti.uia.events/UIAThreadCtx.orm3: | .interfaces
package/lib/lib/release/ti.uia.events/UIAThreadCtx.orm3: UIAThreadCtx.c lib/release/ti.uia.events.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_50_1 -Ohs --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/release/ti.uia.events/UIAThreadCtx.srm3: | .interfaces
package/lib/lib/release/ti.uia.events/UIAThreadCtx.srm3: UIAThreadCtx.c lib/release/ti.uia.events.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_50_1 -Ohs --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.events/UIAUserCtx.orm3.dep
package/lib/lib/release/ti.uia.events/UIAUserCtx.orm3.dep: ;
endif

package/lib/lib/release/ti.uia.events/UIAUserCtx.orm3: | .interfaces
package/lib/lib/release/ti.uia.events/UIAUserCtx.orm3: UIAUserCtx.c lib/release/ti.uia.events.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_50_1 -Ohs --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/release/ti.uia.events/UIAUserCtx.srm3: | .interfaces
package/lib/lib/release/ti.uia.events/UIAUserCtx.srm3: UIAUserCtx.c lib/release/ti.uia.events.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_50_1 -Ohs --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

clean,rm3 ::
	-$(RM) package/lib/lib/release/ti.uia.events/package/package_ti.uia.events.orm3
	-$(RM) package/lib/lib/release/ti.uia.events/UIAAppCtx.orm3
	-$(RM) package/lib/lib/release/ti.uia.events/UIAChanCtx.orm3
	-$(RM) package/lib/lib/release/ti.uia.events/UIAFrameCtx.orm3
	-$(RM) package/lib/lib/release/ti.uia.events/UIAThreadCtx.orm3
	-$(RM) package/lib/lib/release/ti.uia.events/UIAUserCtx.orm3
	-$(RM) package/lib/lib/release/ti.uia.events/package/package_ti.uia.events.srm3
	-$(RM) package/lib/lib/release/ti.uia.events/UIAAppCtx.srm3
	-$(RM) package/lib/lib/release/ti.uia.events/UIAChanCtx.srm3
	-$(RM) package/lib/lib/release/ti.uia.events/UIAFrameCtx.srm3
	-$(RM) package/lib/lib/release/ti.uia.events/UIAThreadCtx.srm3
	-$(RM) package/lib/lib/release/ti.uia.events/UIAUserCtx.srm3

lib/release/ti.uia.events.arm3: package/lib/lib/release/ti.uia.events/package/package_ti.uia.events.orm3 package/lib/lib/release/ti.uia.events/UIAAppCtx.orm3 package/lib/lib/release/ti.uia.events/UIAChanCtx.orm3 package/lib/lib/release/ti.uia.events/UIAFrameCtx.orm3 package/lib/lib/release/ti.uia.events/UIAThreadCtx.orm3 package/lib/lib/release/ti.uia.events/UIAUserCtx.orm3 lib/release/ti.uia.events.arm3.mak

clean::
	-$(RM) lib/release/ti.uia.events.arm3.mak
