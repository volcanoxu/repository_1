/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_14_
#define _BUR_1479044160_14_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct Jog_Type
{	plcbit Run;
	signed char MoveAxis[6];
	float Speed;
	unsigned char Mode;
	unsigned char Tool;
	unsigned char State;
	unsigned long JogAddress;
	plcbit Step;
	plcbit JogStepBase;
	plcbit JogStepJoint;
} Jog_Type;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/MotionHandling/Jogging/JogGlobal.typ\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_14_ */

