$(AS_CPU_PATH)/acp10cfg.br: \
	FORCE \
	$(AS_PROJECT_CPU_PATH)/Motion/Acp10cfg.ncc 
	@"$(AS_BIN_PATH)/BR.MC.Builder.exe" "$(AS_PROJECT_CPU_PATH)/Motion/Acp10cfg.ncc"  -a "$(AS_PROJECT_CONFIG_PATH)/Hardware.hw" -m "$(AS_PROJECT_CPU_PATH)/Motion/AXESMap.ncm" "$(AS_PROJECT_CPU_PATH)/Motion/CNCMap.ncm" "$(AS_PROJECT_CPU_PATH)/Motion/Acp10map.ncm" -L "Acp10_MC: V2.48.1, Acp10man: V2.48.1, Acp10par: V2.48.1, Arnc0man: V2.48.1, NcGlobal: V2.48.1" -P "$(AS_PROJECT_PATH)" -o "$(AS_CPU_PATH)/acp10cfg.br" -T SG4  -s "Simulation.PLC1.Motion" -secret "$(AS_PROJECT_PATH)_br.mc.builder.exe"

FORCE:

-include $(AS_CPU_PATH)/Force.mak 
