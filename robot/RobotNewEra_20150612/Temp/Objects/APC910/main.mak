SHELL = cmd.exe
CYGWIN=nontsec
export PATH := C:\ProgramData\Oracle\Java\javapath;D:\Program Files\tcl\bin;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Program Files\Microsoft DNX\Dnvm\;C:\Program Files\Windows Kits\8.1\Windows Performance Toolkit\;D:\Program Files\Altium Designer Summer 09\System;D:\Program Files\MATLAB\R2015a\runtime\win32;D:\Program Files\MATLAB\R2015a\bin;D:\Program Files\Java\jdk1.8.0_101\bin;D:\Program Files\Java\jdk1.8.0_101\jre\bin;C:\Program Files\Common Files\Hilscher GmbH\TLRDecode;D:\Program Files\Java\jdk1.8.0_101\bin;D:\Program Files\Java\jdk1.8.0_101\jre\bin;C:\Program Files\Common Files\Hilscher GmbH\TLRDecode
export AS_BUILD_MODE := BuildAndCreateCompactFlash
export AS_VERSION := 4.2.4.149
export AS_COMPANY_NAME := Microsoft
export AS_USER_NAME := CAN
export AS_PATH := D:/Program Files/BrAutomation/AS42
export AS_BIN_PATH := D:/Program Files/BrAutomation/AS42/Bin-en
export AS_PROJECT_PATH := D:/AS/workspace/projects/RobotNewEra_20150612
export AS_PROJECT_NAME := RobotNewEra
export AS_SYSTEM_PATH := D:/Program\ Files/BrAutomation/AS/System
export AS_VC_PATH := D:/Program\ Files/BrAutomation/AS42/AS/VC
export AS_TEMP_PATH := D:/AS/workspace/projects/RobotNewEra_20150612/Temp
export AS_CONFIGURATION := APC910
export AS_BINARIES_PATH := D:/AS/workspace/projects/RobotNewEra_20150612/Binaries
export AS_GNU_INST_PATH := D:/Program\ Files/BrAutomation/AS42/AS/GnuInst/V4.1.2
export AS_GNU_BIN_PATH := $(AS_GNU_INST_PATH)/bin
export AS_GNU_INST_PATH_SUB_MAKE := D:/Program Files/BrAutomation/AS42/AS/GnuInst/V4.1.2
export AS_GNU_BIN_PATH_SUB_MAKE := $(AS_GNU_INST_PATH_SUB_MAKE)/bin
export AS_INSTALL_PATH := D:/Program\ Files/BrAutomation/AS42
export WIN32_AS_PATH := "D:\Program Files\BrAutomation\AS42"
export WIN32_AS_BIN_PATH := "D:\Program Files\BrAutomation\AS42\Bin-en"
export WIN32_AS_PROJECT_PATH := "D:\AS\workspace\projects\RobotNewEra_20150612"
export WIN32_AS_SYSTEM_PATH := "D:\Program Files\BrAutomation\AS\System"
export WIN32_AS_VC_PATH := "D:\Program Files\BrAutomation\AS42\AS\VC"
export WIN32_AS_TEMP_PATH := "D:\AS\workspace\projects\RobotNewEra_20150612\Temp"
export WIN32_AS_BINARIES_PATH := "D:\AS\workspace\projects\RobotNewEra_20150612\Binaries"
export WIN32_AS_GNU_INST_PATH := "D:\Program Files\BrAutomation\AS42\AS\GnuInst\V4.1.2"
export WIN32_AS_GNU_BIN_PATH := "$(WIN32_AS_GNU_INST_PATH)\\bin" 
export WIN32_AS_INSTALL_PATH := "D:\Program Files\BrAutomation\AS42"

.suffixes:

ProjectMakeFile:

	@"$(AS_BIN_PATH)/BR.AS.AnalyseProject.exe" "$(AS_PROJECT_PATH)/RobotNewEra.apj" -t "$(AS_TEMP_PATH)" -c "$(AS_CONFIGURATION)" -o "$(AS_BINARIES_PATH)"   -sfas -buildMode "BuildAndCreateCompactFlash" 

	@$(AS_GNU_BIN_PATH)/mingw32-make.exe -r -f 'D:/AS/workspace/projects/RobotNewEra_20150612/Temp/Objects/$(AS_CONFIGURATION)/5PC900_TS77_02/#cpu.mak' -k 

