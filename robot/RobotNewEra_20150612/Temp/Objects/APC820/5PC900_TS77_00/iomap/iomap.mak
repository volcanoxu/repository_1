$(AS_CPU_PATH)/iomap.br: \
	FORCE \
	$(AS_PROJECT_CPU_PATH)/IoMap.iom \
	$(AS_PROJECT_CPU_PATH)/PvMap.vvm \
	$(AS_PROJECT_CPU_PATH)/Motion/MotionPvMa.vvm \
	$(AS_PROJECT_CPU_PATH)/HmiMap/Hmi.vvm \
	$(AS_CPU_PATH)/ChannelConfiguration.xml \
	$(AS_PROJECT_CONFIG_PATH)/Hardware.hw \
	$(AS_PROJECT_CPU_PATH)/Cpu.sw 
	@"$(AS_BIN_PATH)/BR.AS.IOMapBuilder.exe" "$(AS_PROJECT_CPU_PATH)/IoMap.iom" "$(AS_PROJECT_CPU_PATH)/PvMap.vvm" "$(AS_PROJECT_CPU_PATH)/Motion/MotionPvMa.vvm" "$(AS_PROJECT_CPU_PATH)/HmiMap/Hmi.vvm"  -m "$(AS_CPU_PATH)/ConfigInfo.cfi" -g "$(AS_TEMP_PATH)/Objects/Declarations.lst" -x "$(AS_CPU_PATH)/ChannelConfiguration.xml" -v V1.11.2 -f "$(AS_CPU_PATH)" -iomap -o "$(AS_CPU_PATH)/iomap.br" -T SG4  -B D4.21 -P "$(AS_PROJECT_PATH)" -s "APC820.5PC900_TS77_00"

FORCE:

-include $(AS_CPU_PATH)/Force.mak 
