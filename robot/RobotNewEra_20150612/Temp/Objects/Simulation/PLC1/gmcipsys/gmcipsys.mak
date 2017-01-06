UnmarkedObjectFolder := D:/AS/workspace/projects/RobotNewEra_20150612/Logical/MotionHandling/Interpreter/GmcIpConfig/gmcipsys
MarkedObjectFolder := D:/AS/workspace/projects/RobotNewEra_20150612/Logical/MotionHandling/Interpreter/GmcIpConfig/gmcipsys

$(AS_CPU_PATH)/gmcipsys.br: \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/Interpreter/GmcIpConfig/gmcipsys/gmcipsys.cnc \
 	FORCE 
	@"$(AS_BIN_PATH)/BR.MC.Builder.exe"   "$(AS_PROJECT_PATH)/Logical/MotionHandling/Interpreter/GmcIpConfig/gmcipsys/gmcipsys.cnc" -o "$(AS_CPU_PATH)/gmcipsys.br" -T SG4  -B D4.24 -v V2.47.4 -s "MotionHandling.Interpreter.GmcIpConfig.gmcipsys" -L "Acp10_MC: V2.48.1, Acp10man: V2.48.1, Acp10par: V2.48.1, Arnc0man: V2.48.1, NcGlobal: V2.48.1" -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.mc.builder.exe"

FORCE: