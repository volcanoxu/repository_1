$(AS_CPU_PATH)/asfw.br: \
	$(AS_PROJECT_CONFIG_PATH)/Hardware.hw \
	$(AS_INSTALL_PATH)/Upgrades/Modified.txt
	@"$(AS_BIN_PATH)/BR.AS.ConfigurationBuilder.exe"  "$(AS_PROJECT_CONFIG_PATH)/Hardware.hw" -v V1.11.2 -S "X20CP1586" -o "$(AS_CPU_PATH)/asfw.br" -T SG4 -B G4.06 -P "$(AS_PROJECT_PATH)" -c "$(AS_CONFIGURATION)" -zip -s X20CP1586 -firmware -secret "$(AS_PROJECT_PATH)_br.as.configurationbuilder.exe"

