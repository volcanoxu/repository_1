UnmarkedObjectFolder := E:/Robot_moban/RobotNewEra_20150612/Logical/HmiHandling/HmiKeyCtrl/HmiKeyCtrl
MarkedObjectFolder := E:/Robot_moban/RobotNewEra_20150612/Logical/HmiHandling/HmiKeyCtrl/HmiKeyCtrl

$(AS_CPU_PATH)/HmiKeyCtrl.br: \
	$(AS_PROJECT_CPU_PATH)/Cpu.per \
	$(AS_CPU_PATH)/HmiKeyCtrl/HmiKeyCtrl.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/HmiKeyCtrl/HmiKeyCtrl.ox" -o "$(AS_CPU_PATH)/HmiKeyCtrl.br" -v V1.11.2 -f "$(AS_CPU_PATH)/NT.ofs" -offsetLT "$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/LT.ofs" -T SG4  -M IA32  -B G4.06 -extConstants -d "runtime: V* - V*,asieccon: V* - V*" -r Cyclic2 -p 3 -s "HmiHandling.HmiKeyCtrl.HmiKeyCtrl" -L "Acp10_MC: V2.47.2, Acp10man: V2.47.2, Acp10par: V2.47.2, Acp10sdc: V2.47.2, Acp10sim: V2.47.2, Arnc0ext: V2.47.4, Arnc0man: V2.47.4, Arnc0mx: V2.47.4, AsArLog: V*, AsArProf: V*, AsBrStr: V*, AsICMP: V*, AsIecCon: V*, AsIO: V*, AsIODiag: V*, AsIOMMan: V*, AsMem: V*, asrfbext: V*, AsSem: V*, astime: V*, AsUSB: V*, brsystem: V*, DataObj: V*, FileIO: V*, LoopConR: V2.80.9, ModDiag: V2.02.0, MyLib: V*, NcGlobal: V2.47.2, Operator: V*, Runtime: V*, standard: V*, sys_lib: V*, TRF_LIB: V2.02.0, visapi: V*" -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/HmiKeyCtrl/HmiKeyCtrl.ox: \
	$(AS_CPU_PATH)/HmiKeyCtrl/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/HmiKeyCtrl/a.out" -o "$(AS_CPU_PATH)/HmiKeyCtrl/HmiKeyCtrl.ox" -T SG4 -r Cyclic2   -G V4.1.2  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/HmiKeyCtrl/a.out: \
	$(AS_CPU_PATH)/HmiKeyCtrl/HmiKeyControlCyclic.st.o \
	$(AS_CPU_PATH)/HmiKeyCtrl/HmiKeyControlInit.st.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)//HmiKeyCtrl/HmiKeyCtrl.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/HmiKeyCtrl/HmiKeyControlCyclic.st.o: \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiKeyCtrl/HmiKeyCtrl/HmiKeyControlCyclic.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/brsystem/brsystem.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/LoopConR/LoopConR.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsBrStr/AsBrStr.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/NcGlobal/Ncglobal.fun \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiKeyCtrl/HmiKeyCtrl/HmiKeyControlPrv.var \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/MotionGlobalSize.var \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/SystemHandling/System.typ \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/MotionGlobal.typ \
	$(AS_PROJECT_PATH)/Logical/Recipe/RecipeGlobal.typ \
	$(AS_PROJECT_PATH)/Logical/Recipe/RecipeGlobal.var \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/Jogging/JogGlobal.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/Arnc0man/arnc0man.typ \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/CncHandling/Cnc.typ \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/AxesHandling/Axes.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/NcGlobal/Ncglobal.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/Acp10_MC/acp10_mc.var \
	$(AS_PROJECT_PATH)/Logical/UserStd/GlobalUserStd.var \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiGlobal.var \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/MotionGlobalDefines.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/TRF_LIB/TRF_LIB.typ \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiJog/HmiJogGlobal.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/Arnc0mx/arnc0mx.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/Arnc0mx/arnc0mx.var \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiKeyCtrl/HmiKeyControlGlobal.var \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiKeyCtrl/HmiKeyControlGlobal.typ \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiKeyCtrl/HmiKeyCtrl/HmiKeyControlPrv.typ \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiSetup/HmiSetupGlobal.var \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiGlobal.typ \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiSetup/HmiSetupGlobal.typ \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiJog/HmiJogGlobal.typ \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiHardKey/HmiHardKeyGlobal.var \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiHardKey/HmiHardKeyGlobal.typ \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiIO/HmiIOGlobal.var \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiIO/HmiIOGlobal.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/Acp10par/Acp10par.var \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiKeyCtrl/HmiKeyCtrl/HmiKeyControlActions.st
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiKeyCtrl/HmiKeyCtrl/HmiKeyControlCyclic.st" -o "$(AS_CPU_PATH)/HmiKeyCtrl/HmiKeyControlCyclic.st.o"  -O "$(AS_CPU_PATH)//HmiKeyCtrl/HmiKeyControlCyclic.st.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HmiKeyCtrl/HmiKeyControlInit.st.o: \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiKeyCtrl/HmiKeyCtrl/HmiKeyControlInit.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/brsystem/brsystem.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/LoopConR/LoopConR.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsBrStr/AsBrStr.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/NcGlobal/Ncglobal.fun \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiKeyCtrl/HmiKeyCtrl/HmiKeyControlPrv.var \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/MotionGlobalSize.var \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/SystemHandling/System.typ \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/MotionGlobal.typ \
	$(AS_PROJECT_PATH)/Logical/Recipe/RecipeGlobal.typ \
	$(AS_PROJECT_PATH)/Logical/Recipe/RecipeGlobal.var \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/Jogging/JogGlobal.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/Arnc0man/arnc0man.typ \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/CncHandling/Cnc.typ \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/AxesHandling/Axes.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/NcGlobal/Ncglobal.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/Acp10_MC/acp10_mc.var \
	$(AS_PROJECT_PATH)/Logical/UserStd/GlobalUserStd.var \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiGlobal.var \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/MotionGlobalDefines.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/TRF_LIB/TRF_LIB.typ \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiJog/HmiJogGlobal.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/Arnc0mx/arnc0mx.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/Arnc0mx/arnc0mx.var \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiKeyCtrl/HmiKeyControlGlobal.var \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiKeyCtrl/HmiKeyControlGlobal.typ \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiKeyCtrl/HmiKeyCtrl/HmiKeyControlPrv.typ \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiSetup/HmiSetupGlobal.var \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiGlobal.typ \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiSetup/HmiSetupGlobal.typ \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiJog/HmiJogGlobal.typ \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiHardKey/HmiHardKeyGlobal.var \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiHardKey/HmiHardKeyGlobal.typ \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiIO/HmiIOGlobal.var \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiIO/HmiIOGlobal.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/Acp10par/Acp10par.var \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiKeyCtrl/HmiKeyCtrl/HmiKeyControlActions.st
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiKeyCtrl/HmiKeyCtrl/HmiKeyControlInit.st" -o "$(AS_CPU_PATH)/HmiKeyCtrl/HmiKeyControlInit.st.o"  -O "$(AS_CPU_PATH)//HmiKeyCtrl/HmiKeyControlInit.st.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

