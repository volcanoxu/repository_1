/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_32_
#define _BUR_1479044160_32_

#include <bur/plctypes.h>

/* Constants */
#ifdef _REPLACE_CONST
 #define MAX_IO_LINES 15U
 #define MAX_IO_LINES_MINUS_ONE 14U
 #define MAX_LINES_MINUS_ONE 20U
 #define MAX_LINES 21U
#else
 _GLOBAL_CONST unsigned char MAX_IO_LINES;
 _GLOBAL_CONST unsigned char MAX_IO_LINES_MINUS_ONE;
 _GLOBAL_CONST unsigned char MAX_LINES_MINUS_ONE;
 _GLOBAL_CONST unsigned char MAX_LINES;
#endif


/* Variables */
_GLOBAL struct HW_DO_typ DO5;
_GLOBAL struct HW_DO_typ DO4;
_GLOBAL struct HW_DO_typ DO3;
_GLOBAL struct HW_DO_typ DO2;
_GLOBAL struct HW_DO_typ DO1;
_GLOBAL struct HW_DI_typ DI5;
_GLOBAL struct HW_DI_typ DI4;
_GLOBAL struct HW_DI_typ DI3;
_GLOBAL struct HW_DI_typ DI2;
_GLOBAL struct HW_DI_typ DI1;
_GLOBAL struct HmiIOCtrl_Type HmiIOCtrl;





__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/HmiHandling/HmiIO/HmiIOGlobal.var\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_32_ */

