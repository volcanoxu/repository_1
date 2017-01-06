SHELL = cmd.exe
export AS_PLC := PLC1
export AS_TEMP_PLC := PLC1
export AS_CPU_PATH := $(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)
export AS_CPU_PATH_2 := D:/AS/workspace/projects/RobotNewEra_20150612/Temp//Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)
export AS_PROJECT_CONFIG_PATH := $(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)
export AS_PROJECT_CPU_PATH := $(AS_PROJECT_CONFIG_PATH)/$(AS_PLC)
export AS_STATIC_ARCHIVES_PATH := $(AS_TEMP_PATH)/Archives/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)
export WIN32_AS_CPU_PATH := $(WIN32_AS_TEMP_PATH)\Objects\$(AS_CONFIGURATION)\$(AS_TEMP_PLC)
export WIN32_AS_ACTIVE_CONFIG_PATH := $(WIN32_AS_PROJECT_PATH)\Physical\$(AS_CONFIGURATION)\$(AS_PLC)


CpuMakeFile: \
$(AS_CPU_PATH)/ashwd.br \
$(AS_CPU_PATH)/asfw.br \
$(AS_CPU_PATH)/sysconf.br \
$(AS_CPU_PATH)/arconfig.br \
$(AS_CPU_PATH)/arnc0cfg.br \
$(AS_CPU_PATH)/acp10cfg.br \
$(AS_CPU_PATH)/axesmap.br \
$(AS_CPU_PATH)/cncmap.br \
$(AS_CPU_PATH)/acp10map.br \
$(AS_CPU_PATH)/arnc0map.br \
$(AS_CPU_PATH)/ModDiag.br \
$(AS_STATIC_ARCHIVES_PATH)/libMyLib_s.a \
$(AS_CPU_PATH)/OptMotion.br \
$(AS_CPU_PATH)/Cnc.br \
$(AS_CPU_PATH)/System.br \
$(AS_CPU_PATH)/Axes.br \
$(AS_CPU_PATH)/Jog.br \
$(AS_CPU_PATH)/Config.br \
$(AS_CPU_PATH)/Trf.br \
$(AS_CPU_PATH)/Error.br \
$(AS_CPU_PATH)/HmiKeyCtrl.br \
$(AS_CPU_PATH)/HmiPrg.br \
$(AS_CPU_PATH)/HmiAlarm.br \
$(AS_CPU_PATH)/HmiMain.br \
$(AS_CPU_PATH)/HmiFile.br \
$(AS_CPU_PATH)/HmiJogCtrl.br \
$(AS_CPU_PATH)/RecipeCont.br \
$(AS_CPU_PATH)/UserStd.br \
$(AS_CPU_PATH)/HmiHardKey.br \
$(AS_CPU_PATH)/HmiEditor.br \
$(AS_CPU_PATH)/HmiFileVar.br \
$(AS_CPU_PATH)/HmiSetup.br \
$(AS_CPU_PATH)/sdc_p.br \
$(AS_CPU_PATH)/ps_p.br \
$(AS_CPU_PATH)/sdc_i.br \
$(AS_CPU_PATH)/AcpError.br \
$(AS_CPU_PATH)/sdc_j1_i.br \
$(AS_CPU_PATH)/sdc_j2_i.br \
$(AS_CPU_PATH)/sdc_j3_i.br \
$(AS_CPU_PATH)/sdc_j4_i.br \
$(AS_CPU_PATH)/JogInit.br \
$(AS_CPU_PATH)/sdc_j5_i.br \
$(AS_CPU_PATH)/sdc_j6_i.br \
$(AS_CPU_PATH)/JogPrg.br \
$(AS_CPU_PATH)/robot_i.br \
$(AS_CPU_PATH)/gmcipsys.br \
$(AS_CPU_PATH)/gmciplbr.br \
$(AS_CPU_PATH)/gmcipcbr.br \
$(AS_CPU_PATH)/gmciplsm.br \
$(AS_CPU_PATH)/gmcipcsm.br \
$(AS_CPU_PATH)/gmcipcfg.br \
$(AS_CPU_PATH)/gmcipiec.br \
$(AS_CPU_PATH)/gmciplog.br \
$(AS_CPU_PATH)/gmcipesm.br \
$(AS_CPU_PATH)/gmcipmxd.br \
$(AS_CPU_PATH)/gmcipmx.br \
$(AS_CPU_PATH)/gmcipvar.br \
$(AS_CPU_PATH)/gmcipfun.br \
$(AS_CPU_PATH)/gmcipfub.br \
$(AS_CPU_PATH)/gmcipubr.br \
$(AS_CPU_PATH)/gmcipusm.br \
$(AS_CPU_PATH)/gmcipus.br \
$(AS_CPU_PATH)/gmcipuc.br \
$(AS_CPU_PATH)/gmcipvar1.br \
$(AS_CPU_PATH)/gmcipfun1.br \
$(AS_CPU_PATH)/gmcipfub1.br \
$(AS_CPU_PATH)/gmcipubr1.br \
$(AS_CPU_PATH)/gmcipusm1.br \
$(AS_CPU_PATH)/gmcipus1.br \
$(AS_CPU_PATH)/gmcipuc1.br \
$(AS_CPU_PATH)/gmcipsys1.br \
$(AS_CPU_PATH)/gmciplbr1.br \
$(AS_CPU_PATH)/gmcipcbr1.br \
$(AS_CPU_PATH)/gmciplsm1.br \
$(AS_CPU_PATH)/gmcipcsm1.br \
$(AS_CPU_PATH)/gmcipcfg1.br \
$(AS_CPU_PATH)/gmcipiec1.br \
$(AS_CPU_PATH)/gmciplog1.br \
$(AS_CPU_PATH)/gmcipesm1.br \
$(AS_CPU_PATH)/gmcipmxd1.br \
$(AS_CPU_PATH)/gmcipmx1.br \
$(AS_CPU_PATH)/MP50Ke.br \
$(AS_CPU_PATH)/Visu.br \
$(AS_CPU_PATH)/iomap.br \
$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/Transfer.lst


$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/Transfer.lst: \
	FORCE
	@"$(AS_BIN_PATH)/BR.AS.FinalizeBuild.exe" "$(AS_PROJECT_PATH)/RobotNewEra.apj" -t "$(AS_TEMP_PATH)" -o "$(AS_BINARIES_PATH)" -c "$(AS_CONFIGURATION)" -i "D:/Program Files/BrAutomation/AS42" -S "PLC1"  -all -A "AR000" -pil   -swFiles "$(AS_PROJECT_PATH)/Physical/Simulation/PLC1/Cpu.sw" -C "/RT=1000 /AM=* /DAIP=127.0.0.1 /REPO=11160 /ANSL=1" -D "/IF=tcpip /LOPO=11159 /SA=78" -M IA32 -T SG4

#nothing to do (just call module make files)

include $(AS_CPU_PATH)/iomap/iomap.mak
include $(AS_CPU_PATH)/Visu/Visu.mak
include $(AS_CPU_PATH)/MP50Ke/MP50Ke.mak
include $(AS_CPU_PATH)/gmcipmx1/gmcipmx1.mak
include $(AS_CPU_PATH)/gmcipmxd1/gmcipmxd1.mak
include $(AS_CPU_PATH)/gmcipesm1/gmcipesm1.mak
include $(AS_CPU_PATH)/gmciplog1/gmciplog1.mak
include $(AS_CPU_PATH)/gmcipiec1/gmcipiec1.mak
include $(AS_CPU_PATH)/gmcipcfg1/gmcipcfg1.mak
include $(AS_CPU_PATH)/gmcipcsm1/gmcipcsm1.mak
include $(AS_CPU_PATH)/gmciplsm1/gmciplsm1.mak
include $(AS_CPU_PATH)/gmcipcbr1/gmcipcbr1.mak
include $(AS_CPU_PATH)/gmciplbr1/gmciplbr1.mak
include $(AS_CPU_PATH)/gmcipsys1/gmcipsys1.mak
include $(AS_CPU_PATH)/gmcipuc1/gmcipuc1.mak
include $(AS_CPU_PATH)/gmcipus1/gmcipus1.mak
include $(AS_CPU_PATH)/gmcipusm1/gmcipusm1.mak
include $(AS_CPU_PATH)/gmcipubr1/gmcipubr1.mak
include $(AS_CPU_PATH)/gmcipfub1/gmcipfub1.mak
include $(AS_CPU_PATH)/gmcipfun1/gmcipfun1.mak
include $(AS_CPU_PATH)/gmcipvar1/gmcipvar1.mak
include $(AS_CPU_PATH)/gmcipuc/gmcipuc.mak
include $(AS_CPU_PATH)/gmcipus/gmcipus.mak
include $(AS_CPU_PATH)/gmcipusm/gmcipusm.mak
include $(AS_CPU_PATH)/gmcipubr/gmcipubr.mak
include $(AS_CPU_PATH)/gmcipfub/gmcipfub.mak
include $(AS_CPU_PATH)/gmcipfun/gmcipfun.mak
include $(AS_CPU_PATH)/gmcipvar/gmcipvar.mak
include $(AS_CPU_PATH)/gmcipmx/gmcipmx.mak
include $(AS_CPU_PATH)/gmcipmxd/gmcipmxd.mak
include $(AS_CPU_PATH)/gmcipesm/gmcipesm.mak
include $(AS_CPU_PATH)/gmciplog/gmciplog.mak
include $(AS_CPU_PATH)/gmcipiec/gmcipiec.mak
include $(AS_CPU_PATH)/gmcipcfg/gmcipcfg.mak
include $(AS_CPU_PATH)/gmcipcsm/gmcipcsm.mak
include $(AS_CPU_PATH)/gmciplsm/gmciplsm.mak
include $(AS_CPU_PATH)/gmcipcbr/gmcipcbr.mak
include $(AS_CPU_PATH)/gmciplbr/gmciplbr.mak
include $(AS_CPU_PATH)/gmcipsys/gmcipsys.mak
include $(AS_CPU_PATH)/robot_i/robot_i.mak
include $(AS_CPU_PATH)/JogPrg/JogPrg.mak
include $(AS_CPU_PATH)/sdc_j6_i/sdc_j6_i.mak
include $(AS_CPU_PATH)/sdc_j5_i/sdc_j5_i.mak
include $(AS_CPU_PATH)/JogInit/JogInit.mak
include $(AS_CPU_PATH)/sdc_j4_i/sdc_j4_i.mak
include $(AS_CPU_PATH)/sdc_j3_i/sdc_j3_i.mak
include $(AS_CPU_PATH)/sdc_j2_i/sdc_j2_i.mak
include $(AS_CPU_PATH)/sdc_j1_i/sdc_j1_i.mak
include $(AS_CPU_PATH)/AcpError/AcpError.mak
include $(AS_CPU_PATH)/sdc_i/sdc_i.mak
include $(AS_CPU_PATH)/ps_p/ps_p.mak
include $(AS_CPU_PATH)/sdc_p/sdc_p.mak
include $(AS_CPU_PATH)/HmiSetup/HmiSetup.mak
include $(AS_CPU_PATH)/HmiFileVar/HmiFileVar.mak
include $(AS_CPU_PATH)/HmiEditor/HmiEditor.mak
include $(AS_CPU_PATH)/HmiHardKey/HmiHardKey.mak
include $(AS_CPU_PATH)/UserStd/UserStd.mak
include $(AS_CPU_PATH)/RecipeCont/RecipeCont.mak
include $(AS_CPU_PATH)/HmiJogCtrl/HmiJogCtrl.mak
include $(AS_CPU_PATH)/HmiFile/HmiFile.mak
include $(AS_CPU_PATH)/HmiMain/HmiMain.mak
include $(AS_CPU_PATH)/HmiAlarm/HmiAlarm.mak
include $(AS_CPU_PATH)/HmiPrg/HmiPrg.mak
include $(AS_CPU_PATH)/HmiKeyCtrl/HmiKeyCtrl.mak
include $(AS_CPU_PATH)/Error/Error.mak
include $(AS_CPU_PATH)/Trf/Trf.mak
include $(AS_CPU_PATH)/Config/Config.mak
include $(AS_CPU_PATH)/Jog/Jog.mak
include $(AS_CPU_PATH)/Axes/Axes.mak
include $(AS_CPU_PATH)/System/System.mak
include $(AS_CPU_PATH)/Cnc/Cnc.mak
include $(AS_CPU_PATH)/OptMotion/OptMotion.mak
include $(AS_CPU_PATH)/MyLib/MyLib.mak
include $(AS_CPU_PATH)/ModDiag/ModDiag.mak
include $(AS_CPU_PATH)/arnc0map/arnc0map.mak
include $(AS_CPU_PATH)/acp10map/acp10map.mak
include $(AS_CPU_PATH)/cncmap/cncmap.mak
include $(AS_CPU_PATH)/axesmap/axesmap.mak
include $(AS_CPU_PATH)/acp10cfg/acp10cfg.mak
include $(AS_CPU_PATH)/arnc0cfg/arnc0cfg.mak
include $(AS_CPU_PATH)/arconfig/arconfig.mak
include $(AS_CPU_PATH)/sysconf/sysconf.mak
include $(AS_CPU_PATH)/asfw/asfw.mak
include $(AS_CPU_PATH)/ashwd/ashwd.mak

.DEFAULT:
#nothing to do (need this target for prerequisite files that don't exit)

FORCE:
