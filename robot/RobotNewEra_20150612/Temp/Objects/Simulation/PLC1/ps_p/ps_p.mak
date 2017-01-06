UnmarkedObjectFolder := D:/AS/workspace/projects/RobotNewEra_20150612/Logical/MotionHandling/MotionInitFiles/ps_p
MarkedObjectFolder := D:/AS/workspace/projects/RobotNewEra_20150612/Logical/MotionHandling/MotionInitFiles/ps_p

$(AS_CPU_PATH)/ps_p.br: \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/MotionInitFiles/ps_p/ps_p.apt \
 	FORCE 
	@"$(AS_BIN_PATH)/BR.MC.Builder.exe"   "$(AS_PROJECT_PATH)/Logical/MotionHandling/MotionInitFiles/ps_p/ps_p.apt" -o "$(AS_CPU_PATH)/ps_p.br" -T SG4  -B D4.24 -v V1.11.2 -s "MotionHandling.MotionInitFiles.ps_p" -L "Acp10_MC: V2.48.1, Acp10man: V2.48.1, Acp10par: V2.48.1, Arnc0man: V2.48.1, NcGlobal: V2.48.1" -warmRestart -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.mc.builder.exe"

FORCE: