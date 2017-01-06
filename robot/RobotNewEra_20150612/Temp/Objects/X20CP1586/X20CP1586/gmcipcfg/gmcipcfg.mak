UnmarkedObjectFolder := E:/Robot_moban/RobotNewEra_20150612/Logical/MotionHandling/Interpreter/GmcIpConfig/gmcipcfg
MarkedObjectFolder := E:/Robot_moban/RobotNewEra_20150612/Logical/MotionHandling/Interpreter/GmcIpConfig/gmcipcfg

$(AS_CPU_PATH)/gmcipcfg.br: \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/Interpreter/GmcIpConfig/gmcipcfg/gmcipcfg.cnc
	@"$(AS_BIN_PATH)/BR.MC.Builder.exe"   "$(AS_PROJECT_PATH)/Logical/MotionHandling/Interpreter/GmcIpConfig/gmcipcfg/gmcipcfg.cnc" -o "$(AS_CPU_PATH)/gmcipcfg.br" -T SG4  -B G4.06 -v V2.47.4 -s "MotionHandling.Interpreter.GmcIpConfig.gmcipcfg" -L "Acp10_MC: V2.47.2, Acp10man: V2.47.2, Acp10par: V2.47.2, Arnc0man: V2.47.4, NcGlobal: V2.47.2" -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.mc.builder.exe"

