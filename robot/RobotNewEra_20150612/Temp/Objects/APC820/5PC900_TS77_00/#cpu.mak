SHELL = cmd.exe
export AS_PLC := 5PC900_TS77_00
export AS_TEMP_PLC := 5PC900_TS77_00
export AS_CPU_PATH := $(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)
export AS_CPU_PATH_2 := E:/Robot_moban/RobotNewEra_20150612/Temp//Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)
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
$(AS_CPU_PATH)/acp10map.br \
$(AS_CPU_PATH)/arnc0map.br \
$(AS_CPU_PATH)/axesmap.br \
$(AS_CPU_PATH)/cncmap.br \
$(AS_CPU_PATH)/acp10cfg.br \
$(AS_CPU_PATH)/arnc0cfg.br \
$(AS_CPU_PATH)/ModDiag.br \
$(AS_STATIC_ARCHIVES_PATH)/libMyLib_s.a \
$(AS_CPU_PATH)/Config.br \
$(AS_CPU_PATH)/Jog.br \
$(AS_CPU_PATH)/Axes.br \
$(AS_CPU_PATH)/System.br \
$(AS_CPU_PATH)/Cnc.br \
$(AS_CPU_PATH)/Trf.br \
$(AS_CPU_PATH)/6axATrqFF.br \
$(AS_CPU_PATH)/OptMotion.br \
$(AS_CPU_PATH)/Error.br \
$(AS_CPU_PATH)/HmiKeyCtrl.br \
$(AS_CPU_PATH)/HmiJogCtrl.br \
$(AS_CPU_PATH)/HmiSetup.br \
$(AS_CPU_PATH)/RecipeCont.br \
$(AS_CPU_PATH)/UserStd.br \
$(AS_CPU_PATH)/HmiIO.br \
$(AS_CPU_PATH)/HmiAlarm.br \
$(AS_CPU_PATH)/HmiHardKey.br \
$(AS_CPU_PATH)/HmiEditor.br \
$(AS_CPU_PATH)/HmiMain.br \
$(AS_CPU_PATH)/AcpError.br \
$(AS_CPU_PATH)/ps_p.br \
$(AS_CPU_PATH)/acpm_p.br \
$(AS_CPU_PATH)/acpmic_p.br \
$(AS_CPU_PATH)/joint1_i.br \
$(AS_CPU_PATH)/joint2_i.br \
$(AS_CPU_PATH)/joint3_i.br \
$(AS_CPU_PATH)/joint4_i.br \
$(AS_CPU_PATH)/joint5_i.br \
$(AS_CPU_PATH)/joint6_i.br \
$(AS_CPU_PATH)/sdc_i.br \
$(AS_CPU_PATH)/sdc_p.br \
$(AS_CPU_PATH)/JogInit.br \
$(AS_CPU_PATH)/JogPrg.br \
$(AS_CPU_PATH)/robot_i.br \
$(AS_CPU_PATH)/iomap.br \
$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/Transfer.lst


$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/Transfer.lst: \
	FORCE
	@"$(AS_BIN_PATH)/BR.AS.FinalizeBuild.exe" "$(AS_PROJECT_PATH)/RobotNewEra.apj" -t "$(AS_TEMP_PATH)" -o "$(AS_BINARIES_PATH)" -c "$(AS_CONFIGURATION)" -i "E:/Program Files/BrAutomation/AS42" -S "5PC900_TS77_00"   -A "APC9xx" -pil   -swFiles "$(AS_PROJECT_PATH)/Physical/APC820/5PC900_TS77_00/Cpu.sw" -C "/RT=1000 /AM=*" -D "/IF=COM1 /BD=57600 /PA=2 /IT=20 /RS=0" -M IA32 -T SG4

#nothing to do (just call module make files)

include $(AS_CPU_PATH)/iomap/iomap.mak
include $(AS_CPU_PATH)/robot_i/robot_i.mak
include $(AS_CPU_PATH)/JogPrg/JogPrg.mak
include $(AS_CPU_PATH)/JogInit/JogInit.mak
include $(AS_CPU_PATH)/sdc_p/sdc_p.mak
include $(AS_CPU_PATH)/sdc_i/sdc_i.mak
include $(AS_CPU_PATH)/joint6_i/joint6_i.mak
include $(AS_CPU_PATH)/joint5_i/joint5_i.mak
include $(AS_CPU_PATH)/joint4_i/joint4_i.mak
include $(AS_CPU_PATH)/joint3_i/joint3_i.mak
include $(AS_CPU_PATH)/joint2_i/joint2_i.mak
include $(AS_CPU_PATH)/joint1_i/joint1_i.mak
include $(AS_CPU_PATH)/acpmic_p/acpmic_p.mak
include $(AS_CPU_PATH)/acpm_p/acpm_p.mak
include $(AS_CPU_PATH)/ps_p/ps_p.mak
include $(AS_CPU_PATH)/AcpError/AcpError.mak
include $(AS_CPU_PATH)/HmiMain/HmiMain.mak
include $(AS_CPU_PATH)/HmiEditor/HmiEditor.mak
include $(AS_CPU_PATH)/HmiHardKey/HmiHardKey.mak
include $(AS_CPU_PATH)/HmiAlarm/HmiAlarm.mak
include $(AS_CPU_PATH)/HmiIO/HmiIO.mak
include $(AS_CPU_PATH)/UserStd/UserStd.mak
include $(AS_CPU_PATH)/RecipeCont/RecipeCont.mak
include $(AS_CPU_PATH)/HmiSetup/HmiSetup.mak
include $(AS_CPU_PATH)/HmiJogCtrl/HmiJogCtrl.mak
include $(AS_CPU_PATH)/HmiKeyCtrl/HmiKeyCtrl.mak
include $(AS_CPU_PATH)/Error/Error.mak
include $(AS_CPU_PATH)/OptMotion/OptMotion.mak
include $(AS_CPU_PATH)/6axATrqFF/6axATrqFF.mak
include $(AS_CPU_PATH)/Trf/Trf.mak
include $(AS_CPU_PATH)/Cnc/Cnc.mak
include $(AS_CPU_PATH)/System/System.mak
include $(AS_CPU_PATH)/Axes/Axes.mak
include $(AS_CPU_PATH)/Jog/Jog.mak
include $(AS_CPU_PATH)/Config/Config.mak
include $(AS_CPU_PATH)/MyLib/MyLib.mak
include $(AS_CPU_PATH)/ModDiag/ModDiag.mak
include $(AS_CPU_PATH)/arnc0cfg/arnc0cfg.mak
include $(AS_CPU_PATH)/acp10cfg/acp10cfg.mak
include $(AS_CPU_PATH)/cncmap/cncmap.mak
include $(AS_CPU_PATH)/axesmap/axesmap.mak
include $(AS_CPU_PATH)/arnc0map/arnc0map.mak
include $(AS_CPU_PATH)/acp10map/acp10map.mak
include $(AS_CPU_PATH)/arconfig/arconfig.mak
include $(AS_CPU_PATH)/sysconf/sysconf.mak
include $(AS_CPU_PATH)/AsFw/AsFw.mak
include $(AS_CPU_PATH)/AsHwd/AsHwd.mak

.DEFAULT:
#nothing to do (need this target for prerequisite files that don't exit)

FORCE:
