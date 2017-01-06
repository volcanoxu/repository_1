$(AS_CPU_PATH)/arconfig.br: \
	$(AS_PROJECT_CONFIG_PATH)/Hardware.hw \
	$(AS_PROJECT_CPU_PATH)/IoMap.iom \
	$(AS_PROJECT_CPU_PATH)/Motion/AXESMap.ncm \
	$(AS_PROJECT_CPU_PATH)/Motion/CNCMap.ncm \
	$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/Hardware.hw
	@"$(AS_BIN_PATH)/BR.AS.ConfigurationBuilder.exe" "$(AS_PROJECT_CONFIG_PATH)/Hardware.hw" "$(AS_PROJECT_CPU_PATH)/IoMap.iom" "$(AS_PROJECT_CPU_PATH)/Motion/AXESMap.ncm" "$(AS_PROJECT_CPU_PATH)/Motion/CNCMap.ncm"  -arconfig -L "Acp10_MC: V2.47.2, Acp10man: V2.47.2, Acp10par: V2.47.2, Arnc0man: V2.47.4, NcGlobal: V2.47.2" -c X20CP1586 -v V1.11.2 -S "X20CP1586" -o "$(AS_CPU_PATH)/arconfig.br" "$(AS_CPU_PATH)/ChannelConfiguration.xml" "$(AS_CPU_PATH)/HardwareConfiguration.xml" "$(AS_CPU_PATH)/ReActionTechnologyConfiguration.xml" -T SG4  -B G4.06 -P "$(AS_PROJECT_PATH)" -s "X20CP1586" -secret "$(AS_PROJECT_PATH)_br.as.configurationbuilder.exe"

-include $(AS_CPU_PATH)/Force.mak 
