/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_3_
#define _BUR_1479044160_3_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct ErrorText_Type
{	plcstring Line1[80];
	plcstring Line2[80];
	plcstring Line3[80];
	plcstring Line4[80];
} ErrorText_Type;

typedef struct Error_Type
{	unsigned short Count;
	unsigned short HmiCount;
	unsigned short Class;
	unsigned long Number;
	unsigned char Info[12];
	struct ErrorText_Type Text;
} Error_Type;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/MotionHandling/MotionGlobal.typ\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_3_ */

