UnmarkedObjectFolder := E:/Robot_moban/RobotNewEra_20150612/Logical/MotionHandling/MotionInitFiles/joint4_i
MarkedObjectFolder := E:/Robot_moban/RobotNewEra_20150612/Logical/MotionHandling/MotionInitFiles/joint4_i

$(AS_CPU_PATH)/joint4_i.br: \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/MotionInitFiles/joint4_i/joint4_i.ax \
 	FORCE 
	@"$(AS_BIN_PATH)/BR.MC.Builder.exe"   "$(AS_PROJECT_PATH)/Logical/MotionHandling/MotionInitFiles/joint4_i/joint4_i.ax" -o "$(AS_CPU_PATH)/joint4_i.br" -T SG4  -B D4.21 -v V1.11.2 -s "MotionHandling.MotionInitFiles.joint4_i" -L "Acp10_MC: V2.47.2, Acp10man: V2.47.2, Acp10par: V2.47.2, Arnc0man: V2.47.4, NcGlobal: V2.47.2" -warmRestart -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.mc.builder.exe"

FORCE: