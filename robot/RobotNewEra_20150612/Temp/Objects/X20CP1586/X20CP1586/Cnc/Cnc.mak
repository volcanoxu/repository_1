UnmarkedObjectFolder := E:/Robot_moban/RobotNewEra_20150612/Logical/MotionHandling/CncHandling/Cnc
MarkedObjectFolder := E:/Robot_moban/RobotNewEra_20150612/Logical/MotionHandling/CncHandling/Cnc

$(AS_CPU_PATH)/Cnc.br: \
	$(AS_PROJECT_CPU_PATH)/Cpu.per \
	$(AS_CPU_PATH)/Cnc/Cnc.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/Cnc/Cnc.ox" -o "$(AS_CPU_PATH)/Cnc.br" -v V1.11.2 -f "$(AS_CPU_PATH)/NT.ofs" -offsetLT "$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/LT.ofs" -T SG4  -M IA32  -B G4.06 -extConstants -d "runtime: V* - V*,asieccon: V* - V*" -r Cyclic1 -p 6 -s "MotionHandling.CncHandling.Cnc" -L "Acp10_MC: V2.47.2, Acp10man: V2.47.2, Acp10par: V2.47.2, Acp10sdc: V2.47.2, Acp10sim: V2.47.2, Arnc0ext: V2.47.4, Arnc0man: V2.47.4, Arnc0mx: V2.47.4, AsArLog: V*, AsArProf: V*, AsBrStr: V*, AsICMP: V*, AsIecCon: V*, AsIO: V*, AsIODiag: V*, AsIOMMan: V*, AsMem: V*, asrfbext: V*, AsSem: V*, astime: V*, AsUSB: V*, brsystem: V*, DataObj: V*, FileIO: V*, LoopConR: V2.80.9, ModDiag: V2.02.0, MyLib: V*, NcGlobal: V2.47.2, Operator: V*, Runtime: V*, standard: V*, sys_lib: V*, TRF_LIB: V2.02.0, visapi: V*" -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/Cnc/Cnc.ox: \
	$(AS_CPU_PATH)/Cnc/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/Cnc/a.out" -o "$(AS_CPU_PATH)/Cnc/Cnc.ox" -T SG4 -r Cyclic1   -G V4.1.2  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/Cnc/a.out: \
	$(AS_CPU_PATH)/Cnc/Cnc.st.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)//Cnc/Cnc.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/Cnc/Cnc.st.o: \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/CncHandling/Cnc/Cnc.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsBrStr/AsBrStr.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/NcGlobal/Ncglobal.fun \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/CncHandling/Cnc/CncPrivate.var \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/CncHandling/Cnc/CncPrivate.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/Arnc0man/arnc0man.typ \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/CncHandling/Cnc.typ \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/MotionGlobal.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/NcGlobal/Ncglobal.var \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/MotionGlobalSize.var \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/CncHandling/Cnc.var \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/CncHandling/Cnc/CncActions.st
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/MotionHandling/CncHandling/Cnc/Cnc.st" -o "$(AS_CPU_PATH)/Cnc/Cnc.st.o"  -O "$(AS_CPU_PATH)//Cnc/Cnc.st.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

