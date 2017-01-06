/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_58_
#define _BUR_1479044160_58_

#include <bur/plctypes.h>

/* Constants */
#ifdef _REPLACE_CONST
 #define MAX_FILESVIEW 12U
#else
 _LOCAL_CONST unsigned short MAX_FILESVIEW;
#endif


/* Variables */
_BUR_LOCAL struct DTStructure DTStruct;
_BUR_LOCAL struct fiDIR_READ_EX_DATA FileInfoReadDataEx;
_BUR_LOCAL struct HmiProgramInternal_Type Internal;
_BUR_LOCAL struct System_Type *pSystem;
_BUR_LOCAL struct Cnc_Type *pCnc;
_BUR_LOCAL struct FileRename FB_ProgramRename;
_BUR_LOCAL struct FileDelete FB_ProgramDelete;
_BUR_LOCAL struct FileCopy FB_ProgramCopy;
_BUR_LOCAL struct FileWrite FB_NewProgramWrite;
_BUR_LOCAL struct FileCreate FB_NewProgramCreate;
_BUR_LOCAL struct DirReadEx FB_DirReadEx;
_BUR_LOCAL struct DirOpen FB_DirOpen;
_BUR_LOCAL struct DirClose FB_DirClose;
_BUR_LOCAL struct FileClose FB_CloseFile;
_BUR_LOCAL plcstring EMPTY_STFILE[301];





__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/HmiHandling/HmiPrg/HmiPrg/HmiProgramLocal.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/FileIO/FileIO.fun\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_58_ */

