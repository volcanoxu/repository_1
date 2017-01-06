/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_20_
#define _BUR_1479044160_20_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct HmiHardKeyOutput_Typ
{	unsigned char Run_Led;
	unsigned char Error_Led;
	unsigned char Motion_Led;
	unsigned char Process_Led;
	unsigned char KeyLevel;
} HmiHardKeyOutput_Typ;

typedef struct HmiHardKeyInput_Typ
{	plcbit MP50_SimKey[51];
	plcbit MP50_Key[51];
	signed long Joystick_XValue;
	signed long Joystick_YValue;
	signed long Joystick_ZValue;
} HmiHardKeyInput_Typ;

typedef struct HmiHardKey_Type
{	struct HmiHardKeyInput_Typ Input;
	struct HmiHardKeyOutput_Typ Output;
} HmiHardKey_Type;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/HmiHandling/HmiHardKey/HmiHardKeyGlobal.typ\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_20_ */

