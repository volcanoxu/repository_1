UnmarkedObjectFolder := E:/Robot_moban/RobotNewEra_20150612/Logical/ErrorHandling/Error
MarkedObjectFolder := E:/Robot_moban/RobotNewEra_20150612/Logical/ErrorHandling/Error

$(AS_CPU_PATH)/Error.br: \
	$(AS_PROJECT_CPU_PATH)/Cpu.per \
	FORCE \
	$(AS_CPU_PATH)/Error/Error.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/Error/Error.ox" -o "$(AS_CPU_PATH)/Error.br" -v V1.11.2 -f "$(AS_CPU_PATH)/NT.ofs" -offsetLT "$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/LT.ofs" -T SG4  -M IA32  -B D4.21 -extConstants -d "runtime: V* - V*,asieccon: V* - V*" -r Cyclic2 -p 2 -s "ErrorHandling.Error" -L "Acp10_MC: V2.47.2, Acp10man: V2.47.2, Acp10par: V2.47.2, Acp10sdc: V2.47.2, Acp10sim: V2.47.2, Arnc0ext: V2.47.4, Arnc0man: V2.47.4, Arnc0mx: V2.47.4, AsArLog: V*, AsArProf: V*, AsBrStr: V*, AsICMP: V*, AsIecCon: V*, AsIO: V*, AsIODiag: V*, AsIOMMan: V*, AsMem: V*, asrfbext: V*, AsSem: V*, astime: V*, AsUSB: V*, brsystem: V*, DataObj: V*, FileIO: V*, LoopConR: V2.80.9, ModDiag: V2.02.0, MyLib: V*, NcGlobal: V2.47.2, Operator: V*, Runtime: V*, standard: V*, sys_lib: V*, TRF_LIB: V2.02.0, visapi: V*" -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/Error/Error.ox: \
	$(AS_CPU_PATH)/Error/a.out \
	FORCE 
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/Error/a.out" -o "$(AS_CPU_PATH)/Error/Error.ox" -T SG4 -r Cyclic2   -G V4.1.2  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/Error/a.out: \
	$(AS_CPU_PATH)/Error/Error.st.o \
	FORCE
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)//Error/Error.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/Error/Error.st.o: \
	$(AS_PROJECT_PATH)/Logical/ErrorHandling/Error/Error.st \
	FORCE 
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/ErrorHandling/Error/Error.st" -o "$(AS_CPU_PATH)/Error/Error.st.o"  -O "$(AS_CPU_PATH)//Error/Error.st.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 



FORCE: