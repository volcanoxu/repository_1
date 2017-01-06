/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_53_
#define _BUR_1479044160_53_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef enum HmiMainCtrlState_Type
{	HMIMAIN_WAIT,
	HMIMAIN_READWAIT,
	HMIMAIN_READPROCESS,
	HMIMAIN_LOADED,
	HMIMAIN_HIGHLIGHT_WAIT,
	HMIMAIN_ERROR
} HmiMainCtrlState_Type;

typedef struct HmiMainCtrlInternal_Type
{	enum HmiMainCtrlState_Type MainEditCtrlState;
	plcstring StringBuffer[10001];
} HmiMainCtrlInternal_Type;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/HmiHandling/HmiMain/HmiMain/HmiMainLocal.typ\\\" scope \\\"local\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_53_ */

