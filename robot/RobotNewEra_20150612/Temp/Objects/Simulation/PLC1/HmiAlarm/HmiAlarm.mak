UnmarkedObjectFolder := D:/AS/workspace/projects/RobotNewEra_20150612/Logical/HmiHandling/HmiAlarm/HmiAlarm
MarkedObjectFolder := D:/AS/workspace/projects/RobotNewEra_20150612/Logical/HmiHandling/HmiAlarm/HmiAlarm

$(AS_CPU_PATH)/HmiAlarm.br: \
	$(AS_PROJECT_CPU_PATH)/Cpu.per \
	FORCE \
	$(AS_CPU_PATH)/HmiAlarm/HmiAlarm.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/HmiAlarm/HmiAlarm.ox" -o "$(AS_CPU_PATH)/HmiAlarm.br" -v V1.11.2 -f "$(AS_CPU_PATH)/NT.ofs" -offsetLT "$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/LT.ofs" -T SG4  -M IA32  -B D4.24 -extConstants -d "runtime: V* - V*,asieccon: V* - V*" -r Cyclic8 -p 2 -s "HmiHandling.HmiAlarm.HmiAlarm" -L "Acp10_MC: V2.48.1, Acp10man: V2.48.1, Acp10par: V2.48.1, Acp10sdc: V2.48.1, Acp10sim: V2.48.1, Arnc0ext: V2.47.4, Arnc0man: V2.48.1, Arnc0mx: V2.48.1, AsArLog: V*, AsArProf: V*, AsBrStr: V*, AsICMP: V*, AsIecCon: V*, AsIO: V*, AsIODiag: V*, AsIOMMan: V*, AsMem: V*, asrfbext: V*, AsSem: V*, astime: V*, AsUSB: V*, brsystem: V*, DataObj: V*, FileIO: V*, LoopConR: V2.80.9, ModDiag: V2.02.0, MyLib: V*, NcGlobal: V2.48.1, Operator: V*, Runtime: V*, standard: V*, sys_lib: V*, TRF_LIB: V2.02.0, visapi: V*" -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/HmiAlarm/HmiAlarm.ox: \
	$(AS_CPU_PATH)/HmiAlarm/a.out \
	FORCE 
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/HmiAlarm/a.out" -o "$(AS_CPU_PATH)/HmiAlarm/HmiAlarm.ox" -T SG4 -r Cyclic8   -G V4.1.2  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/HmiAlarm/a.out: \
	$(AS_CPU_PATH)/HmiAlarm/HmiAlarm.st.o \
	FORCE
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)//HmiAlarm/HmiAlarm.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/HmiAlarm/HmiAlarm.st.o: \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiAlarm/HmiAlarm/HmiAlarm.st \
	FORCE 
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiAlarm/HmiAlarm/HmiAlarm.st" -o "$(AS_CPU_PATH)/HmiAlarm/HmiAlarm.st.o"  -O "$(AS_CPU_PATH)//HmiAlarm/HmiAlarm.st.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 



FORCE: