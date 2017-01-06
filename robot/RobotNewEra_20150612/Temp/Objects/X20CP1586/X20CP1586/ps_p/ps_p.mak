UnmarkedObjectFolder := E:/Robot_moban/RobotNewEra_20150612/Logical/MotionHandling/MotionInitFiles/ps_p
MarkedObjectFolder := E:/Robot_moban/RobotNewEra_20150612/Logical/MotionHandling/MotionInitFiles/ps_p

$(AS_CPU_PATH)/ps_p.br: \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/MotionInitFiles/ps_p/ps_p.apt
	@"$(AS_BIN_PATH)/BR.MC.Builder.exe"   "$(AS_PROJECT_PATH)/Logical/MotionHandling/MotionInitFiles/ps_p/ps_p.apt" -o "$(AS_CPU_PATH)/ps_p.br" -T SG4  -B G4.06 -v V1.11.2 -s "MotionHandling.MotionInitFiles.ps_p" -L "Acp10_MC: V2.47.2, Acp10man: V2.47.2, Acp10par: V2.47.2, Arnc0man: V2.47.4, NcGlobal: V2.47.2" -warmRestart -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.mc.builder.exe"

