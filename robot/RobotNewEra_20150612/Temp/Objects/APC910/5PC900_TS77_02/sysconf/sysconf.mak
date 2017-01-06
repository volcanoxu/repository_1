$(AS_CPU_PATH)/sysconf.br: \
	$(AS_PROJECT_CONFIG_PATH)/Hardware.hw 
	@"$(AS_BIN_PATH)/BR.AS.ConfigurationBuilder.exe" "$(AS_PROJECT_CONFIG_PATH)/Hardware.hw"  -c APC910 -sysconf -S "5PC900_TS77_02" -o "$(AS_CPU_PATH)/sysconf.br" -T SG4  -B N4.06 -P "$(AS_PROJECT_PATH)" -s "APC910" -secret "$(AS_PROJECT_PATH)_br.as.configurationbuilder.exe"

-include $(AS_CPU_PATH)/Force.mak 
