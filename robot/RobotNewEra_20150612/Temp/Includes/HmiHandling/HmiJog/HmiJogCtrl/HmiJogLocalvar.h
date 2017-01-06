/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_62_
#define _BUR_1479044160_62_

#include <bur/plctypes.h>

/* Constants */
#ifdef _REPLACE_CONST
#else
#endif


/* Variables */
_BUR_LOCAL double JogStepSync;
_BUR_LOCAL plcbit FrmEnableSync;
_BUR_LOCAL plcbit ToolEnableSync;
_BUR_LOCAL struct MXPointType Point;
_BUR_LOCAL struct Axes_Type (*pAxes)[13];
_BUR_LOCAL struct System_Type *pSystem;
_BUR_LOCAL struct Cnc_Type *pCnc;





__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/HmiHandling/HmiJog/HmiJogCtrl/HmiJogLocal.var\\\" scope \\\"local\\\"\\n\"");

/* Additional IEC dependencies */
__asm__(".ascii \"iecdep \\\"Logical/MotionHandling/MotionGlobalSize.var\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_62_ */

