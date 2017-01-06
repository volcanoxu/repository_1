UnmarkedObjectFolder := D:/AS/workspace/projects/RobotNewEra_20150612/Logical/Recipe/RecipeControl
MarkedObjectFolder := D:/AS/workspace/projects/RobotNewEra_20150612/Logical/Recipe/RecipeControl

$(AS_CPU_PATH)/RecipeCont.br: \
	$(AS_PROJECT_CPU_PATH)/Cpu.per \
	FORCE \
	$(AS_CPU_PATH)/RecipeCont/RecipeCont.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/RecipeCont/RecipeCont.ox" -o "$(AS_CPU_PATH)/RecipeCont.br" -v V1.11.2 -f "$(AS_CPU_PATH)/NT.ofs" -offsetLT "$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/LT.ofs" -T SG4  -M IA32  -B D4.24 -extConstants -r Cyclic8 -p 6 -s "Recipe.RecipeControl" -L "Acp10_MC: V2.48.1, Acp10man: V2.48.1, Acp10par: V2.48.1, Acp10sdc: V2.48.1, Acp10sim: V2.48.1, Arnc0ext: V2.47.4, Arnc0man: V2.48.1, Arnc0mx: V2.48.1, AsArLog: V*, AsArProf: V*, AsBrStr: V*, AsICMP: V*, AsIecCon: V*, AsIO: V*, AsIODiag: V*, AsIOMMan: V*, AsMem: V*, asrfbext: V*, AsSem: V*, astime: V*, AsUSB: V*, brsystem: V*, DataObj: V*, FileIO: V*, LoopConR: V2.80.9, ModDiag: V2.02.0, MyLib: V*, NcGlobal: V2.48.1, Operator: V*, Runtime: V*, standard: V*, sys_lib: V*, TRF_LIB: V2.02.0, visapi: V*" -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/RecipeCont/RecipeCont.ox: \
	$(AS_CPU_PATH)/RecipeCont/a.out \
	FORCE 
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/RecipeCont/a.out" -o "$(AS_CPU_PATH)/RecipeCont/RecipeCont.ox" -T SG4 -r Cyclic8   -G V4.1.2  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/RecipeCont/a.out: \
	$(AS_CPU_PATH)/RecipeCont/RecipeControl.c.o \
	$(AS_TEMP_PATH)/Archives/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/libMyLib_s.a \
	FORCE
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)//RecipeCont/RecipeCont.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/RecipeCont/RecipeControl.c.o: \
	$(AS_PROJECT_PATH)/Logical/Recipe/RecipeControl/RecipeControl.c \
	FORCE 
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Recipe/RecipeControl/RecipeControl.c" -o "$(AS_CPU_PATH)/RecipeCont/RecipeControl.c.o"  -T SG4  -M IA32  -B D4.24 -G V4.1.2  -s "Recipe.RecipeControl" -t "$(AS_TEMP_PATH)" -I "$(AS_PROJECT_PATH)/Logical/Recipe/RecipeControl" "$(AS_TEMP_PATH)/Includes/Recipe/RecipeControl"  "$(AS_TEMP_PATH)/Includes/Recipe" "$(AS_TEMP_PATH)/Includes" "$(AS_PROJECT_PATH)/Logical/Libraries/MyLib" -trigraphs -fno-asm -D _DEFAULT_INCLUDES -D _SG4 -fPIC -O0 -g -Wall -include "$(AS_CPU_PATH)/Libraries.h" -x c -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 



FORCE: