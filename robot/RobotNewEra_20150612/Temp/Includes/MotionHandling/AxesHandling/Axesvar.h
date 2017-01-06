/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_13_
#define _BUR_1479044160_13_

#include <bur/plctypes.h>

/* Constants */
#ifdef _REPLACE_CONST
 #define OUTPUT_CYCLIC_POSITION_EXTERN 1U
 #define ADDITIVE_CYCLIC_POSITION_EXTERN 1U
 #define MOVE_CYCLIC_POSITION_EXTERN 1U
 #define JOG_SW_LIMIT_MARGIN 2.0f
 #define DRYRUN_STOP_MOVEMENT_TIME_DELAY 2000
#else
 _GLOBAL_CONST unsigned char OUTPUT_CYCLIC_POSITION_EXTERN;
 _GLOBAL_CONST unsigned char ADDITIVE_CYCLIC_POSITION_EXTERN;
 _GLOBAL_CONST unsigned char MOVE_CYCLIC_POSITION_EXTERN;
 _GLOBAL_CONST float JOG_SW_LIMIT_MARGIN;
 _GLOBAL_CONST plctime DRYRUN_STOP_MOVEMENT_TIME_DELAY;
#endif


/* Variables */
_GLOBAL unsigned char ACP10_MC_MN_PRES_IF0[256];





__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/MotionHandling/AxesHandling/Axes.var\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_13_ */

