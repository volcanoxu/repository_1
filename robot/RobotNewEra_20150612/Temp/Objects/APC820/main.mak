SHELL = cmd.exe
CYGWIN=nontsec
export PATH := C:\Program Files\Dell\DW WLAN Card;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Program Files\SourceGear\Common\DiffMerge\;C:\Program Files\MATLAB\MATLAB Compiler Runtime\v80\runtime\win32;C:\Program Files\Common Files\Hilscher GmbH\TLRDecode;C:\Program Files\Common Files\Hilscher GmbH\TLRDecode
export AS_BUILD_MODE := BuildAndCreateCompactFlash
export AS_VERSION := 4.2.1.211
export AS_COMPANY_NAME :=  
export AS_USER_NAME := dengh
export AS_PATH := E:/Program\ Files/BrAutomation/AS42
export AS_BIN_PATH := E:/Program Files/BrAutomation/AS42/Bin-en
export AS_PROJECT_PATH := E:/Robot_moban/RobotNewEra_20150612
export AS_PROJECT_NAME := RobotNewEra
export AS_SYSTEM_PATH := E:/Program\ Files/BrAutomation/AS/System
export AS_VC_PATH := E:/Program\ Files/BrAutomation/AS42/AS/VC
export AS_TEMP_PATH := E:/Robot_moban/RobotNewEra_20150612/Temp
export AS_CONFIGURATION := APC820
export AS_BINARIES_PATH := E:/Robot_moban/RobotNewEra_20150612/Binaries
export AS_GNU_INST_PATH := E:/Program\ Files/BrAutomation/AS42/AS/GnuInst/V4.1.2
export AS_GNU_BIN_PATH := $(AS_GNU_INST_PATH)/bin
export AS_GNU_INST_PATH_SUB_MAKE := E:/Program Files/BrAutomation/AS42/AS/GnuInst/V4.1.2
export AS_GNU_BIN_PATH_SUB_MAKE := $(AS_GNU_INST_PATH_SUB_MAKE)/bin
export AS_INSTALL_PATH := E:/Program\ Files/BrAutomation/AS42
export WIN32_AS_PATH := "E:\Program Files\BrAutomation\AS42"
export WIN32_AS_BIN_PATH := "E:\Program Files\BrAutomation\AS42\Bin-en"
export WIN32_AS_PROJECT_PATH := "E:\Robot_moban\RobotNewEra_20150612"
export WIN32_AS_SYSTEM_PATH := "E:\Program Files\BrAutomation\AS\System"
export WIN32_AS_VC_PATH := "E:\Program Files\BrAutomation\AS42\AS\VC"
export WIN32_AS_TEMP_PATH := "E:\Robot_moban\RobotNewEra_20150612\Temp"
export WIN32_AS_BINARIES_PATH := "E:\Robot_moban\RobotNewEra_20150612\Binaries"
export WIN32_AS_GNU_INST_PATH := "E:\Program Files\BrAutomation\AS42\AS\GnuInst\V4.1.2"
export WIN32_AS_GNU_BIN_PATH := "$(WIN32_AS_GNU_INST_PATH)\\bin" 
export WIN32_AS_INSTALL_PATH := "E:\Program Files\BrAutomation\AS42"

.suffixes:

ProjectMakeFile:

	@"$(AS_BIN_PATH)/BR.AS.AnalyseProject.exe" "$(AS_PROJECT_PATH)/RobotNewEra.apj" -t "$(AS_TEMP_PATH)" -c "$(AS_CONFIGURATION)" -o "$(AS_BINARIES_PATH)"   -sfas -buildMode "BuildAndCreateCompactFlash" 

	@$(AS_GNU_BIN_PATH)/mingw32-make.exe -r -f 'E:/Robot_moban/RobotNewEra_20150612/Temp/Objects/$(AS_CONFIGURATION)/5PC900_TS77_00/#cpu.mak' -k 

