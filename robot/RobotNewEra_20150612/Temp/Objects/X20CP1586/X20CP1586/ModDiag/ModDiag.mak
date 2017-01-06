UnmarkedObjectFolder := E:/Robot_moban/RobotNewEra_20150612/Logical/HmiHandling/HmiIO/ModDiag
MarkedObjectFolder := E:/Robot_moban/RobotNewEra_20150612/Logical/HmiHandling/HmiIO/ModDiag

$(AS_CPU_PATH)/ModDiag.br: \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiIO/ModDiag/ANSIC.lby \
	$(AS_CPU_PATH)/ModDiag/ModDiag.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/ModDiag/ModDiag.ox" -o "$(AS_CPU_PATH)/ModDiag.br" -v V2.02.0 -f "$(AS_CPU_PATH)/NT.ofs" -offsetLT "$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/LT.ofs" -T SG4  -M IA32  -B G4.06 -extConstants -d "AsIO: V* - V*,AsIODiag: V* - V*,AsIOMMan: V* - V*,Sys_lib: V* - V*,Standard: V* - V*,DataObj: V* - V*" -r Library -s "HmiHandling.HmiIO.ModDiag" -L "Acp10_MC: V2.47.2, Acp10man: V2.47.2, Acp10par: V2.47.2, Acp10sdc: V2.47.2, Acp10sim: V2.47.2, Arnc0ext: V2.47.4, Arnc0man: V2.47.4, Arnc0mx: V2.47.4, AsArLog: V*, AsArProf: V*, AsBrStr: V*, AsICMP: V*, AsIecCon: V*, AsIO: V*, AsIODiag: V*, AsIOMMan: V*, AsMem: V*, asrfbext: V*, AsSem: V*, astime: V*, AsUSB: V*, brsystem: V*, DataObj: V*, FileIO: V*, LoopConR: V2.80.9, ModDiag: V2.02.0, MyLib: V*, NcGlobal: V2.47.2, Operator: V*, Runtime: V*, standard: V*, sys_lib: V*, TRF_LIB: V2.02.0, visapi: V*" -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/ModDiag/ModDiag.ox: \
	$(AS_CPU_PATH)/ModDiag/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/ModDiag/a.out" -o "$(AS_CPU_PATH)/ModDiag/ModDiag.ox" -T SG4 -r Library   -G V4.1.2  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/ModDiag/a.out: \
	$(AS_CPU_PATH)/ModDiag/iolist.c.o \
	$(AS_CPU_PATH)/ModDiag/iostatus.c.o \
	$(AS_CPU_PATH)/ModDiag/modulediagnose.c.o \
	$(AS_TEMP_PATH)/Archives/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/libMyLib_s.a
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)//ModDiag/ModDiag.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/ModDiag/iolist.c.o: \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiIO/ModDiag/iolist.c \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiIO/ModDiag/ModDiag.fun \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiIO/ModDiag/ModDiag.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsIO/AsIO.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsIOMMan/AsIOMMan.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/DataObj/DataObj.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsIODiag/AsIODiag.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/sys_lib/sys_lib.fun \
	$(AS_TEMP_PATH)/Includes/ModDiag.h \
	$(AS_TEMP_PATH)/Includes/DataObj.h \
	$(AS_TEMP_PATH)/Includes/runtime.h \
	$(AS_TEMP_PATH)/Includes/sys_lib.h \
	$(AS_TEMP_PATH)/Includes/standard.h \
	$(AS_TEMP_PATH)/Includes/AsIO.h \
	$(AS_TEMP_PATH)/Includes/AsIOMMan.h \
	$(AS_TEMP_PATH)/Includes/AsIODiag.h \
	$(AS_TEMP_PATH)/Includes/Sys_lib.h \
	$(AS_TEMP_PATH)/Includes/Standard.h \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiIO/ModDiag/internal_h.h
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" "$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiIO/ModDiag/iolist.c" -o "$(AS_CPU_PATH)/ModDiag/iolist.c.o"  -T SG4  -M IA32  -B G4.06 -G V4.1.2  -s "HmiHandling.HmiIO.ModDiag" -t "$(AS_TEMP_PATH)" -r Library -I "$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiIO/ModDiag" "$(AS_TEMP_PATH)/Includes/HmiHandling/HmiIO/ModDiag" "$(AS_TEMP_PATH)/Includes" "$(AS_PROJECT_PATH)/Logical/Libraries/MyLib" -trigraphs -fno-asm -D _DEFAULT_INCLUDES -D _SG4 -fPIC -O0 -g -Wall -include "$(AS_CPU_PATH)/Libraries.h" -trigraphs -fno-asm -D _MODDIAG_EXPORT -x c -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/ModDiag/iostatus.c.o: \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiIO/ModDiag/iostatus.c \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiIO/ModDiag/ModDiag.fun \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiIO/ModDiag/ModDiag.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsIO/AsIO.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsIOMMan/AsIOMMan.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/DataObj/DataObj.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsIODiag/AsIODiag.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/sys_lib/sys_lib.fun \
	$(AS_TEMP_PATH)/Includes/ModDiag.h \
	$(AS_TEMP_PATH)/Includes/DataObj.h \
	$(AS_TEMP_PATH)/Includes/runtime.h \
	$(AS_TEMP_PATH)/Includes/sys_lib.h \
	$(AS_TEMP_PATH)/Includes/standard.h \
	$(AS_TEMP_PATH)/Includes/AsIO.h \
	$(AS_TEMP_PATH)/Includes/AsIOMMan.h \
	$(AS_TEMP_PATH)/Includes/AsIODiag.h \
	$(AS_TEMP_PATH)/Includes/Sys_lib.h \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiIO/ModDiag/internal_h.h
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" "$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiIO/ModDiag/iostatus.c" -o "$(AS_CPU_PATH)/ModDiag/iostatus.c.o"  -T SG4  -M IA32  -B G4.06 -G V4.1.2  -s "HmiHandling.HmiIO.ModDiag" -t "$(AS_TEMP_PATH)" -r Library -I "$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiIO/ModDiag" "$(AS_TEMP_PATH)/Includes/HmiHandling/HmiIO/ModDiag" "$(AS_TEMP_PATH)/Includes" "$(AS_PROJECT_PATH)/Logical/Libraries/MyLib" -trigraphs -fno-asm -D _DEFAULT_INCLUDES -D _SG4 -fPIC -O0 -g -Wall -include "$(AS_CPU_PATH)/Libraries.h" -trigraphs -fno-asm -D _MODDIAG_EXPORT -x c -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/ModDiag/modulediagnose.c.o: \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiIO/ModDiag/modulediagnose.c \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiIO/ModDiag/ModDiag.fun \
	$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiIO/ModDiag/ModDiag.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsIO/AsIO.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsIOMMan/AsIOMMan.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/DataObj/DataObj.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsIODiag/AsIODiag.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/sys_lib/sys_lib.fun \
	$(AS_TEMP_PATH)/Includes/ModDiag.h \
	$(AS_TEMP_PATH)/Includes/DataObj.h \
	$(AS_TEMP_PATH)/Includes/runtime.h \
	$(AS_TEMP_PATH)/Includes/sys_lib.h \
	$(AS_TEMP_PATH)/Includes/standard.h \
	$(AS_TEMP_PATH)/Includes/AsIO.h \
	$(AS_TEMP_PATH)/Includes/AsIOMMan.h \
	$(AS_TEMP_PATH)/Includes/AsIODiag.h \
	$(AS_TEMP_PATH)/Includes/Standard.h
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" "$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiIO/ModDiag/modulediagnose.c" -o "$(AS_CPU_PATH)/ModDiag/modulediagnose.c.o"  -T SG4  -M IA32  -B G4.06 -G V4.1.2  -s "HmiHandling.HmiIO.ModDiag" -t "$(AS_TEMP_PATH)" -r Library -I "$(AS_PROJECT_PATH)/Logical/HmiHandling/HmiIO/ModDiag" "$(AS_TEMP_PATH)/Includes/HmiHandling/HmiIO/ModDiag" "$(AS_TEMP_PATH)/Includes" "$(AS_PROJECT_PATH)/Logical/Libraries/MyLib" -trigraphs -fno-asm -D _DEFAULT_INCLUDES -D _SG4 -fPIC -O0 -g -Wall -include "$(AS_CPU_PATH)/Libraries.h" -trigraphs -fno-asm -D _MODDIAG_EXPORT -x c -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

