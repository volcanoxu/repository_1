UnmarkedObjectFolder := E:/Robot_moban/RobotNewEra_20150612/Logical/HmiHandling/HmiJog/HmiJogCtrl
MarkedObjectFolder := E:/Robot_moban/RobotNewEra_20150612/Logical/HmiHandling/HmiJog/HmiJogCtrl

$(AS_CPU_PATH)/HmiJogCtrl.br: \
	$(AS_PROJECT_CPU_PATH)/Cpu.per \
	FORCE \
	$(AS_CPU_PATH)/HmiJogCtrl/HmiJogCtrl.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/HmiJogCtrl/HmiJogCtrl.ox" -o "$(AS_CPU_PATH)/HmiJogCtrl.br" -v V1.11.2 -f "$(AS_CPU_PATH)/NT.ofs" -offsetLT "$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/LT.ofs" -T SG4  -M IA32  -B D4.21 -extConstants -r Cyclic4 -p 2 -s "HmiHandling.HmiJog.HmiJogCtrl" -L "Acp10_MC: V2.47.2, Acp10man: V2.47.2, Acp10par: V2.47.2, Acp10sdc: V2.47.2, Acp10sim: V2.47.2, Arnc0ext: V2.47.4, Arnc0man: V2.47.4, Arnc0mx: V2.47.4, AsArLog: V*, AsArProf: V*, AsBrStr: V*, AsICMP: V*, AsIecCon: V*, AsIO: V*, AsIODiag: V*, AsIOMMan: V*, AsMem: V*, asrfbext: V*, AsSem: V*, astime: V*, AsUSB: V*, brsystem: V*, DataObj: V*, FileIO: V*, LoopConR: V2.80.9, ModDiag: V2.02.0, MyLib: V*, NcGlobal: V2.47.2, Operator: V*, Runtime: V*, standard: V*, sys_lib: V*, TRF_LIB: V2.02.0, visapi: V*" -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/HmiJogCtrl/HmiJogCtrl.ox: \
	$(AS_CPU_PATH)/HmiJogCtrl/a.out \
	FORCE 
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/HmiJogCtrl/a.out" -o "$(AS_CPU_PATH)/HmiJogCtrl/HmiJogCtrl.ox" -T SG4 -r Cyclic4   -G V4.1.2  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/HmiJogCtrl/a.out: \
	$(AS_CPU_PATH)/HmiJogCtrl/HmiJogCtrl.cpp.o \
	$(AS_TEMP_PATH)/Archives/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/libMyLib_s.a \
	FORCE
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)//HmiJogCtrl/HmiJogCtrl.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/HmiJogCtrl/HmiJogCtrl.cpp.o: \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiJog/HmiJogCtrl/HmiJogCtrl.cpp \
	FORCE 
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" "$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiJog/HmiJogCtrl/HmiJogCtrl.cpp" -o "$(AS_CPU_PATH)/HmiJogCtrl/HmiJogCtrl.cpp.o"  -T SG4  -M IA32  -B D4.21 -G V4.1.2  -s "HmiHandling.HmiJog.HmiJogCtrl" -t "$(AS_TEMP_PATH)" -I "$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiJog/HmiJogCtrl" "$(AS_TEMP_PATH)/Includes/HmiHandling/HmiJog/HmiJogCtrl"  "$(AS_TEMP_PATH)/Includes/HmiHandling/HmiJog"  "$(AS_TEMP_PATH)/Includes/HmiHandling" "$(AS_TEMP_PATH)/Includes" -trigraphs -fno-asm -D _DEFAULT_INCLUDES -D _SG4 -fPIC -O0 -g -Wall -include "$(AS_CPU_PATH)/Libraries.h" -x c++ -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 



FORCE: