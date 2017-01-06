$(AS_CPU_PATH)/acp10map.br: \
	$(AS_PROJECT_CPU_PATH)/Motion/Acp10map.ncm \
	$(AS_PROJECT_PATH)/physical/x20cp1586/x20cp1586/motion/acp10map.ncm \
	$(AS_PROJECT_PATH)/physical/x20cp1586/hardware.hw
	@"$(AS_BIN_PATH)/BR.MC.Builder.exe" "$(AS_PROJECT_CPU_PATH)/Motion/Acp10map.ncm"  -v V1.11.2 -a "$(AS_PROJECT_CONFIG_PATH)/Hardware.hw" -L "Acp10_MC: V2.47.2, Acp10man: V2.47.2, Acp10par: V2.47.2, Arnc0man: V2.47.4, NcGlobal: V2.47.2" -P "$(AS_PROJECT_PATH)" -o "$(AS_CPU_PATH)/Acp10map.br" -T SG4  -s "X20CP1586.X20CP1586.Motion" -secret "$(AS_PROJECT_PATH)_br.mc.builder.exe"

-include $(AS_CPU_PATH)/Force.mak 
