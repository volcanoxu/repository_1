/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_48_
#define _BUR_1479044160_48_

#include <bur/plctypes.h>

/* Constants */
#ifdef _REPLACE_CONST
 #define JOG_RUN 1U
 #define JOG_WAIT 0U
#else
 _LOCAL_CONST unsigned char JOG_RUN;
 _LOCAL_CONST unsigned char JOG_WAIT;
#endif


/* Variables */
_BUR_LOCAL unsigned long CncAddress;
_BUR_LOCAL struct Jog_Type Jogging;
_BUR_LOCAL struct Cnc_Type (*pCnc)[1];





__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/MotionHandling/Jogging/Jog/Jog.var\\\" scope \\\"local\\\"\\n\"");

/* Additional IEC dependencies */
__asm__(".ascii \"iecdep \\\"Logical/MotionHandling/MotionGlobalSize.var\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_48_ */

