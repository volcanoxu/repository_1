UnmarkedObjectFolder := D:/AS/workspace/projects/RobotNewEra_20150612/Logical/GmcIpConfig/gmcipcsm
MarkedObjectFolder := D:/AS/workspace/projects/RobotNewEra_20150612/Logical/GmcIpConfig/gmcipcsm

$(AS_CPU_PATH)/gmcipcsm1.br: \
	$(AS_PROJECT_PATH)/Logical/GmcIpConfig/gmcipcsm/gmcipcsm.cnc \
 	FORCE 
	@"$(AS_BIN_PATH)/BR.MC.Builder.exe"   "$(AS_PROJECT_PATH)/Logical/GmcIpConfig/gmcipcsm/gmcipcsm.cnc" -o "$(AS_CPU_PATH)/gmcipcsm1.br" -T SG4  -B D4.24 -v V2.48.1 -s "GmcIpConfig.gmcipcsm" -L "Acp10_MC: V2.48.1, Acp10man: V2.48.1, Acp10par: V2.48.1, Arnc0man: V2.48.1, NcGlobal: V2.48.1" -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.mc.builder.exe"

FORCE: