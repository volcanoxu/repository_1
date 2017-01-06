UnmarkedObjectFolder := E:/Robot_moban/RobotNewEra_20150612/Logical/Libraries/MyLib
MarkedObjectFolder := E:/Robot_moban/RobotNewEra_20150612/Logical/Libraries/MyLib

$(AS_STATIC_ARCHIVES_PATH)/libMyLib_s.a:
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -staticlink  -o "$(AS_STATIC_ARCHIVES_PATH)/libMyLib_s.a"  -G V4.1.2  -T SG4  -M IA32  -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/MyLib/a.out:
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -o "$(AS_CPU_PATH)/MyLib/a.out"  -G V4.1.2  -T SG4  -M IA32  -$placeholder_archiv_files -specs=I386specs -Wl,-q,-T,bur_elf_i386.x

-include $(AS_CPU_PATH)/Force.mak 

