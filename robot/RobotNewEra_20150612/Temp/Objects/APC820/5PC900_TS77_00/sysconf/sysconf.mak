$(AS_CPU_PATH)/sysconf.br: \
	FORCE \
	$(AS_PROJECT_CONFIG_PATH)/Hardware.hw 
	@"$(AS_BIN_PATH)/BR.AS.ConfigurationBuilder.exe" "$(AS_PROJECT_CONFIG_PATH)/Hardware.hw"  -c APC820 -sysconf -S "5PC900_TS77_00" -o "$(AS_CPU_PATH)/sysconf.br" -T SG4  -B D4.21 -P "$(AS_PROJECT_PATH)" -s "APC820" -secret "$(AS_PROJECT_PATH)_br.as.configurationbuilder.exe"

FORCE:

-include $(AS_CPU_PATH)/Force.mak 
