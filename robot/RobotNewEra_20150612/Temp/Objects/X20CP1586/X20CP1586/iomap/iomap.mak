$(AS_CPU_PATH)/iomap.br: \
	$(AS_PROJECT_CPU_PATH)/IoMap.iom \
	$(AS_PROJECT_CPU_PATH)/PvMap.vvm \
	$(AS_PROJECT_CPU_PATH)/Motion/MotionPvMa.vvm \
	$(AS_PROJECT_CPU_PATH)/HmiMap/Hmi.vvm \
	$(AS_CPU_PATH)/ChannelConfiguration.xml \
	$(AS_PROJECT_CONFIG_PATH)/Hardware.hw \
	$(AS_PROJECT_CPU_PATH)/Cpu.sw \
	$(AS_PROJECT_PATH)/logical/motionhandling/configuration/config.typ \
	$(AS_PROJECT_PATH)/logical/motionhandling/axeshandling/axes.typ \
	$(AS_PROJECT_PATH)/logical/motionhandling/cnchandling/cnc.typ \
	$(AS_PROJECT_PATH)/logical/motionhandling/systemhandling/system.typ \
	$(AS_PROJECT_PATH)/logical/motionhandling/transformations/trf/trfprv.var \
	$(AS_PROJECT_PATH)/logical/motionhandling/jogging/jog/jog.var \
	$(AS_PROJECT_PATH)/logical/motionhandling/feedforward/6axatrqff/6axatrqff.var \
	$(AS_PROJECT_PATH)/logical/hmihandling/hmiglobal.typ \
	$(AS_PROJECT_PATH)/logical/motionhandling/jogging/jogglobal.typ \
	$(AS_PROJECT_PATH)/logical/recipe/recipeglobal.typ \
	$(AS_PROJECT_PATH)/logical/errorhandling/error.typ
	@"$(AS_BIN_PATH)/BR.AS.IOMapBuilder.exe" "$(AS_PROJECT_CPU_PATH)/IoMap.iom" "$(AS_PROJECT_CPU_PATH)/PvMap.vvm" "$(AS_PROJECT_CPU_PATH)/Motion/MotionPvMa.vvm" "$(AS_PROJECT_CPU_PATH)/HmiMap/Hmi.vvm"  -m "$(AS_CPU_PATH)/ConfigInfo.cfi" -g "$(AS_TEMP_PATH)/Objects/Declarations.lst" -x "$(AS_CPU_PATH)/ChannelConfiguration.xml" -v V1.11.2 -f "$(AS_CPU_PATH)" -iomap -o "$(AS_CPU_PATH)/iomap.br" -T SG4  -B G4.06 -P "$(AS_PROJECT_PATH)" -s "X20CP1586.X20CP1586"

-include $(AS_CPU_PATH)/Force.mak 
