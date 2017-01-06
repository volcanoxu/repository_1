UnmarkedObjectFolder := D:/AS/workspace/projects/RobotNewEra_20150612/Logical/MotionHandling/AxesHandling/AcpError
MarkedObjectFolder := D:/AS/workspace/projects/RobotNewEra_20150612/Logical/MotionHandling/AxesHandling/AcpError

$(AS_CPU_PATH)/AcpError.br: \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/AxesHandling/AcpError/AcpError.ett \
 	FORCE 
	@"$(AS_BIN_PATH)/BR.MC.Builder.exe"   "$(AS_PROJECT_PATH)/Logical/MotionHandling/AxesHandling/AcpError/AcpError.ett" -o "$(AS_CPU_PATH)/AcpError.br" -T SG4  -B D4.24 -v V1.11.2 -s "MotionHandling.AxesHandling.AcpError" -L "Acp10_MC: V2.48.1, Acp10man: V2.48.1, Acp10par: V2.48.1, Arnc0man: V2.48.1, NcGlobal: V2.48.1" -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.mc.builder.exe"

FORCE: