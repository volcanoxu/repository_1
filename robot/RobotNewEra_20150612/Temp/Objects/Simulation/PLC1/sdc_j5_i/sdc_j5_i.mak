UnmarkedObjectFolder := D:/AS/workspace/projects/RobotNewEra_20150612/Logical/MotionHandling/MotionInitFiles/SDC/sdc_j5_i
MarkedObjectFolder := D:/AS/workspace/projects/RobotNewEra_20150612/Logical/MotionHandling/MotionInitFiles/SDC/sdc_j5_i

$(AS_CPU_PATH)/sdc_j5_i.br: \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/MotionInitFiles/SDC/sdc_j5_i/sdc_j5_i.ax \
 	FORCE 
	@"$(AS_BIN_PATH)/BR.MC.Builder.exe"   "$(AS_PROJECT_PATH)/Logical/MotionHandling/MotionInitFiles/SDC/sdc_j5_i/sdc_j5_i.ax" -o "$(AS_CPU_PATH)/sdc_j5_i.br" -T SG4  -B D4.24 -v V1.11.2 -s "MotionHandling.MotionInitFiles.SDC.sdc_j5_i" -L "Acp10_MC: V2.48.1, Acp10man: V2.48.1, Acp10par: V2.48.1, Arnc0man: V2.48.1, NcGlobal: V2.48.1" -warmRestart -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.mc.builder.exe"

FORCE: