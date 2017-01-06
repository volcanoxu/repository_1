/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1435298025_52_
#define _BUR_1435298025_52_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct TrqFF6axA_Axes_Type
{	unsigned char Index;
	float Sign;
	float MaxTorque;
	float SetTorque;
	float CorrectTorque;
} TrqFF6axA_Axes_Type;

typedef struct TrqFF6axA_Type
{	plcbit Enable;
	struct TrqFF6axA_Axes_Type Axes[6];
	float Ramp;
	plcbit Active;
} TrqFF6axA_Type;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/MotionHandling/FeedForward/6axATrqFF/6axATrqFF.typ\\\" scope \\\"local\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1435298025_52_ */

