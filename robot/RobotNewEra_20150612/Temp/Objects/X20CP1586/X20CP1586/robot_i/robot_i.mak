UnmarkedObjectFolder := E:/Robot_moban/RobotNewEra_20150612/Logical/MotionHandling/MotionInitFiles/robot_i
MarkedObjectFolder := E:/Robot_moban/RobotNewEra_20150612/Logical/MotionHandling/MotionInitFiles/robot_i

$(AS_CPU_PATH)/robot_i.br: \
	$(AS_PROJECT_PATH)/Logical/MotionHandling/MotionInitFiles/robot_i/robot_i.cns
	@"$(AS_BIN_PATH)/BR.MC.Builder.exe"   "$(AS_PROJECT_PATH)/Logical/MotionHandling/MotionInitFiles/robot_i/robot_i.cns" -o "$(AS_CPU_PATH)/robot_i.br" -T SG4  -B G4.06 -v V1.11.2 -s "MotionHandling.MotionInitFiles.robot_i" -L "Acp10_MC: V2.47.2, Acp10man: V2.47.2, Acp10par: V2.47.2, Arnc0man: V2.47.4, NcGlobal: V2.47.2" -warmRestart -C "$(AS_PROJECT_PATH)/Logical/MotionHandling/MotionInitFiles/robot_i/robot_i.cns"  -m "$(AS_PROJECT_CPU_PATH)/Motion/Acp10map.ncm" "$(AS_PROJECT_CPU_PATH)/Motion/AXESMap.ncm" "$(AS_PROJECT_CPU_PATH)/Motion/Arnc0map.ncm" "$(AS_PROJECT_CPU_PATH)/Motion/CNCMap.ncm" -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.mc.builder.exe"

