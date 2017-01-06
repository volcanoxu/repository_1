/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_57_
#define _BUR_1479044160_57_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef enum HmiProgramState_Type
{	HMIPROGRAM_DIRINITREAD,
	HMIPROGRAM_LISTSHOW,
	HMIPROGRAM_IDLE,
	HMIPROGRAM_PASTE,
	HMIPROGRAM_RENAME,
	HMIPROGRAM_NEWFILE,
	HMIPROGRAM_ACTIVATEPROGRAM,
	HMIPROGRAM_DELETE,
	HMIPROGRAM_EDIT,
	HMIPROGRAM_ERROR
} HmiProgramState_Type;

typedef struct HmiProgramInternal_Type
{	unsigned short SubState;
	enum HmiProgramState_Type State;
	enum HmiProgramState_Type OldState;
} HmiProgramInternal_Type;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/HmiHandling/HmiPrg/HmiPrg/HmiProgramLocal.typ\\\" scope \\\"local\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_57_ */

