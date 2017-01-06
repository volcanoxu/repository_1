$(AS_CPU_PATH)/arconfig.br: \
	FORCE \
	$(AS_PROJECT_CONFIG_PATH)/Hardware.hw \
	$(AS_PROJECT_CPU_PATH)/IoMap.iom \
	$(AS_PROJECT_CPU_PATH)/Motion/AXESMap.ncm \
	$(AS_PROJECT_CPU_PATH)/Motion/CNCMap.ncm 
	@"$(AS_BIN_PATH)/BR.AS.ConfigurationBuilder.exe" "$(AS_PROJECT_CONFIG_PATH)/Hardware.hw" "$(AS_PROJECT_CPU_PATH)/IoMap.iom" "$(AS_PROJECT_CPU_PATH)/Motion/AXESMap.ncm" "$(AS_PROJECT_CPU_PATH)/Motion/CNCMap.ncm"  -arconfig -L "Acp10_MC: V2.47.2, Acp10man: V2.47.2, Acp10par: V2.47.2, Arnc0man: V2.47.4, NcGlobal: V2.47.2" -c APC820 -v V1.11.2 -S "5PC900_TS77_00" -o "$(AS_CPU_PATH)/arconfig.br" "$(AS_CPU_PATH)/ChannelConfiguration.xml" "$(AS_CPU_PATH)/HardwareConfiguration.xml" "$(AS_CPU_PATH)/ReActionTechnologyConfiguration.xml" -T SG4  -B D4.21 -P "$(AS_PROJECT_PATH)" -s "APC820" -secret "$(AS_PROJECT_PATH)_br.as.configurationbuilder.exe"

FORCE:

-include $(AS_CPU_PATH)/Force.mak 
