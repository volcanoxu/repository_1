UnmarkedObjectFolder := D:/AS/workspace/projects/RobotNewEra_20150612/Logical/MotionHandling/Interpreter/GmcIpConfig/gmcipesm
MarkedObjectFolder := D:/AS/workspace/projects/RobotNewEra_20150612/Logical/MotionHandling/Interpreter/GmcIpConfig/gmcipesm

$(AS_CPU_PATH)/gmcipesm.br: \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/Interpreter/GmcIpConfig/gmcipesm/gmcipesm.cnc \
 	FORCE 
	@"$(AS_BIN_PATH)/BR.MC.Builder.exe"   "$(AS_PROJECT_PATH)/Logical/MotionHandling/Interpreter/GmcIpConfig/gmcipesm/gmcipesm.cnc" -o "$(AS_CPU_PATH)/gmcipesm.br" -T SG4  -B D4.24 -v V2.47.4 -s "MotionHandling.Interpreter.GmcIpConfig.gmcipesm" -L "Acp10_MC: V2.48.1, Acp10man: V2.48.1, Acp10par: V2.48.1, Arnc0man: V2.48.1, NcGlobal: V2.48.1" -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.mc.builder.exe"

FORCE: