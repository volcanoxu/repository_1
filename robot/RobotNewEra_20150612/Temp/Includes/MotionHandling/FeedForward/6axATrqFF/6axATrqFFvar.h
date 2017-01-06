/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1435298025_53_
#define _BUR_1435298025_53_

#include <bur/plctypes.h>

/* Constants */
#ifdef _REPLACE_CONST
#else
#endif


/* Variables */
_LOCAL unsigned long AxesAddress;
_LOCAL plcbit CncProgWasActive;
_LOCAL plcbit OptMotInMotion;
_LOCAL unsigned char i;
_LOCAL struct Axes_Type (*pAxes)[13];
_LOCAL struct TrqFF6axA_Type TrqFF6axA;
_LOCAL plcbit AllAxControllerOn;
_LOCAL plcbit AllAxHomingOk;





__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/MotionHandling/FeedForward/6axATrqFF/6axATrqFF.var\\\" scope \\\"local\\\"\\n\"");

/* Additional IEC dependencies */
__asm__(".ascii \"iecdep \\\"Logical/MotionHandling/MotionGlobalSize.var\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1435298025_53_ */

