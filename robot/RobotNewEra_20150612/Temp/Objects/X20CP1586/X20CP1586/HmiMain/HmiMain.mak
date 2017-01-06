UnmarkedObjectFolder := E:/Robot_moban/RobotNewEra_20150612/Logical/HmiHandling/HmiMain/HmiMain
MarkedObjectFolder := E:/Robot_moban/RobotNewEra_20150612/Logical/HmiHandling/HmiMain/HmiMain

$(AS_CPU_PATH)/HmiMain.br: \
	$(AS_PROJECT_CPU_PATH)/Cpu.per \
	$(AS_CPU_PATH)/HmiMain/HmiMain.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/HmiMain/HmiMain.ox" -o "$(AS_CPU_PATH)/HmiMain.br" -v V1.11.2 -f "$(AS_CPU_PATH)/NT.ofs" -offsetLT "$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/LT.ofs" -T SG4  -M IA32  -B G4.06 -extConstants -r Cyclic8 -p 3 -s "HmiHandling.HmiMain.HmiMain" -L "Acp10_MC: V2.47.2, Acp10man: V2.47.2, Acp10par: V2.47.2, Acp10sdc: V2.47.2, Acp10sim: V2.47.2, Arnc0ext: V2.47.4, Arnc0man: V2.47.4, Arnc0mx: V2.47.4, AsArLog: V*, AsArProf: V*, AsBrStr: V*, AsICMP: V*, AsIecCon: V*, AsIO: V*, AsIODiag: V*, AsIOMMan: V*, AsMem: V*, asrfbext: V*, AsSem: V*, astime: V*, AsUSB: V*, brsystem: V*, DataObj: V*, FileIO: V*, LoopConR: V2.80.9, ModDiag: V2.02.0, MyLib: V*, NcGlobal: V2.47.2, Operator: V*, Runtime: V*, standard: V*, sys_lib: V*, TRF_LIB: V2.02.0, visapi: V*" -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/HmiMain/HmiMain.ox: \
	$(AS_CPU_PATH)/HmiMain/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/HmiMain/a.out" -o "$(AS_CPU_PATH)/HmiMain/HmiMain.ox" -T SG4 -r Cyclic8   -G V4.1.2  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/HmiMain/a.out: \
	$(AS_CPU_PATH)/HmiMain/HmiMain.cpp.o \
	$(AS_TEMP_PATH)/Archives/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/libMyLib_s.a
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)//HmiMain/HmiMain.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/HmiMain/HmiMain.cpp.o: \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiMain/HmiMain/HmiMain.cpp \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiGlobal.var \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiIO/HmiIOGlobal.var \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/MotionGlobalSize.var \
	$(AS_PROJECT_PATH)/Logical/Recipe/RecipeGlobal.var \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiMain/HmiMain/HmiMainLocal.var \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/SystemHandling/System.typ \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/MotionGlobal.typ \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/CncHandling/Cnc.typ \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiMain/HmiMain/HmiMainLocal.typ \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiGlobal.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/Arnc0mx/arnc0mx.typ \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiMain/HmiMainGlobal.var \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiMain/HmiMainGlobal.typ \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiMain/HmiFileGlobal.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/MyLib/CusLib.hpp \
	$(AS_PROJECT_PATH)/Logical/Libraries/MyLib/deelx.h
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" "$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiMain/HmiMain/HmiMain.cpp" -o "$(AS_CPU_PATH)/HmiMain/HmiMain.cpp.o"  -T SG4  -M IA32  -B G4.06 -G V4.1.2  -s "HmiHandling.HmiMain.HmiMain" -t "$(AS_TEMP_PATH)" -I "$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiMain/HmiMain" "$(AS_TEMP_PATH)/Includes/HmiHandling/HmiMain/HmiMain"  "$(AS_TEMP_PATH)/Includes/HmiHandling/HmiMain"  "$(AS_TEMP_PATH)/Includes/HmiHandling" "$(AS_TEMP_PATH)/Includes" "$(AS_PROJECT_PATH)/Logical/Libraries/MyLib" -trigraphs -fno-asm -D _DEFAULT_INCLUDES -D _SG4 -fPIC -O0 -g -Wall -include "$(AS_CPU_PATH)/Libraries.h" -x c++ -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

