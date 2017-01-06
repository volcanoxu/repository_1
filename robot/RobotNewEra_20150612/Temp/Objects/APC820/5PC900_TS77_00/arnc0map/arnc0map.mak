$(AS_CPU_PATH)/arnc0map.br: \
	FORCE \
	$(AS_PROJECT_CPU_PATH)/Motion/Arnc0map.ncm 
	@"$(AS_BIN_PATH)/BR.MC.Builder.exe" "$(AS_PROJECT_CPU_PATH)/Motion/Arnc0map.ncm"  -v V1.11.2 -a "$(AS_PROJECT_CONFIG_PATH)/Hardware.hw" -L "Acp10_MC: V2.47.2, Acp10man: V2.47.2, Acp10par: V2.47.2, Arnc0man: V2.47.4, NcGlobal: V2.47.2" -P "$(AS_PROJECT_PATH)" -o "$(AS_CPU_PATH)/Arnc0map.br" -T SG4  -s "APC820.5PC900_TS77_00.Motion" -secret "$(AS_PROJECT_PATH)_br.mc.builder.exe"

FORCE:

-include $(AS_CPU_PATH)/Force.mak 
