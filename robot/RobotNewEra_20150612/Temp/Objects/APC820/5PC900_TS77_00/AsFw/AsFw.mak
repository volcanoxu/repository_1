$(AS_CPU_PATH)/asfw.br: \
	$(AS_PROJECT_CONFIG_PATH)/Hardware.hw \
	FORCE
	@"$(AS_BIN_PATH)/BR.AS.ConfigurationBuilder.exe"  "$(AS_PROJECT_CONFIG_PATH)/Hardware.hw" -v V1.11.2 -S "5PC900_TS77_00" -o "$(AS_CPU_PATH)/asfw.br" -T SG4 -B D4.21 -P "$(AS_PROJECT_PATH)" -c "$(AS_CONFIGURATION)" -zip -s 5PC900_TS77_00 -firmware -secret "$(AS_PROJECT_PATH)_br.as.configurationbuilder.exe"


FORCE:
