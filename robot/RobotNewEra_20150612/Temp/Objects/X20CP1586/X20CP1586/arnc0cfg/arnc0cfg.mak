$(AS_CPU_PATH)/arnc0cfg.br: \
	$(AS_PROJECT_CPU_PATH)/Motion/Arnc0cfg.ncc \
	$(AS_PROJECT_PATH)/physical/x20cp1586/x20cp1586/motion/arnc0cfg.ncc \
	$(AS_PROJECT_PATH)/physical/x20cp1586/hardware.hw \
	$(AS_PROJECT_PATH)/physical/x20cp1586/x20cp1586/motion/arnc0map.ncm
	@"$(AS_BIN_PATH)/BR.MC.Builder.exe" "$(AS_PROJECT_CPU_PATH)/Motion/Arnc0cfg.ncc"  -a "$(AS_PROJECT_CONFIG_PATH)/Hardware.hw" -m "$(AS_PROJECT_CPU_PATH)/Motion/AXESMap.ncm" "$(AS_PROJECT_CPU_PATH)/Motion/Arnc0map.ncm" "$(AS_PROJECT_CPU_PATH)/Motion/CNCMap.ncm" -L "Acp10_MC: V2.47.2, Acp10man: V2.47.2, Acp10par: V2.47.2, Arnc0man: V2.47.4, NcGlobal: V2.47.2" -P "$(AS_PROJECT_PATH)" -o "$(AS_CPU_PATH)/arnc0cfg.br" -T SG4  -s "X20CP1586.X20CP1586.Motion" -secret "$(AS_PROJECT_PATH)_br.mc.builder.exe"

-include $(AS_CPU_PATH)/Force.mak 
