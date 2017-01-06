/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_50_
#define _BUR_1479044160_50_

#include <bur/plctypes.h>

/* Constants */
#ifdef _REPLACE_CONST
#else
#endif


/* Variables */
_BUR_LOCAL struct TRF_EXT_typ ExtTrfData;
_BUR_LOCAL struct TRF_extEntity_t ExtJoint;
_BUR_LOCAL struct TRF_DYN_typ RobotDynGeneric;
_BUR_LOCAL float SimPos[6];
_BUR_LOCAL float SimPosVisu[6];
_BUR_LOCAL unsigned long TrfDirectTransStatus;
_BUR_LOCAL unsigned long TrfDirectInfo[2];
_BUR_LOCAL double TrfInPosExt[6];
_BUR_LOCAL double TrfInPos[6];
_BUR_LOCAL double TrfOutPos[6];
_BUR_LOCAL unsigned long AxesAddress;
_BUR_LOCAL struct Axes_Type (*pAxes)[13];
_BUR_LOCAL unsigned long TRF_6AX_InitStatus;





__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/MotionHandling/Transformations/Trf/TrfPrv.var\\\" scope \\\"local\\\"\\n\"");

/* Additional IEC dependencies */
__asm__(".ascii \"iecdep \\\"Logical/MotionHandling/MotionGlobalSize.var\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_50_ */

