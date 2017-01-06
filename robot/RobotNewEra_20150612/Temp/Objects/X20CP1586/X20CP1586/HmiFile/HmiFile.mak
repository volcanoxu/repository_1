UnmarkedObjectFolder := E:/Robot_moban/RobotNewEra_20150612/Logical/HmiHandling/HmiMain/HmiFile
MarkedObjectFolder := E:/Robot_moban/RobotNewEra_20150612/Logical/HmiHandling/HmiMain/HmiFile

$(AS_CPU_PATH)/HmiFile.br: \
	$(AS_PROJECT_CPU_PATH)/Cpu.per \
	$(AS_CPU_PATH)/HmiFile/HmiFile.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/HmiFile/HmiFile.ox" -o "$(AS_CPU_PATH)/HmiFile.br" -v V1.11.2 -f "$(AS_CPU_PATH)/NT.ofs" -offsetLT "$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/LT.ofs" -T SG4  -M IA32  -B G4.06 -extConstants -d "runtime: V* - V*,asieccon: V* - V*" -r Cyclic8 -p 4 -s "HmiHandling.HmiMain.HmiFile" -L "Acp10_MC: V2.47.2, Acp10man: V2.47.2, Acp10par: V2.47.2, Acp10sdc: V2.47.2, Acp10sim: V2.47.2, Arnc0ext: V2.47.4, Arnc0man: V2.47.4, Arnc0mx: V2.47.4, AsArLog: V*, AsArProf: V*, AsBrStr: V*, AsICMP: V*, AsIecCon: V*, AsIO: V*, AsIODiag: V*, AsIOMMan: V*, AsMem: V*, asrfbext: V*, AsSem: V*, astime: V*, AsUSB: V*, brsystem: V*, DataObj: V*, FileIO: V*, LoopConR: V2.80.9, ModDiag: V2.02.0, MyLib: V*, NcGlobal: V2.47.2, Operator: V*, Runtime: V*, standard: V*, sys_lib: V*, TRF_LIB: V2.02.0, visapi: V*" -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/HmiFile/HmiFile.ox: \
	$(AS_CPU_PATH)/HmiFile/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/HmiFile/a.out" -o "$(AS_CPU_PATH)/HmiFile/HmiFile.ox" -T SG4 -r Cyclic8   -G V4.1.2  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/HmiFile/a.out: \
	$(AS_CPU_PATH)/HmiFile/HmiFileCtrl.st.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)//HmiFile/HmiFile.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/HmiFile/HmiFileCtrl.st.o: \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiMain/HmiFile/HmiFileCtrl.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.fun \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiMain/HmiFile/HmiFileLocal.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.var \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiMain/HmiFile/HmiFileLocal.typ \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiMain/HmiFileGlobal.var \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiGlobal.typ
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiMain/HmiFile/HmiFileCtrl.st" -o "$(AS_CPU_PATH)/HmiFile/HmiFileCtrl.st.o"  -O "$(AS_CPU_PATH)//HmiFile/HmiFileCtrl.st.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

