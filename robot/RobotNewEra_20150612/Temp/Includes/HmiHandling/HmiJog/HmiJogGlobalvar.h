/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_42_
#define _BUR_1479044160_42_

#include <bur/plctypes.h>

/* Constants */
#ifdef _REPLACE_CONST
#else
#endif


/* Variables */
_GLOBAL struct HmiJointLimitType JointLimitsSync[6];
_GLOBAL_RETAIN plcbit JointTCPSync;
_GLOBAL_RETAIN struct MXPointType PointSync;
_GLOBAL_RETAIN struct MXAxisTargetType JointSync;
_GLOBAL_RETAIN struct MXToolType ToolSync;
_GLOBAL_RETAIN struct MXFrameType FrmSync;
_GLOBAL struct MXPointType PointAct;
_GLOBAL MXJointAxisType JointAct;
_GLOBAL struct HmiJogCtrlType HmiJog;





__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/HmiHandling/HmiJog/HmiJogGlobal.var\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_42_ */

