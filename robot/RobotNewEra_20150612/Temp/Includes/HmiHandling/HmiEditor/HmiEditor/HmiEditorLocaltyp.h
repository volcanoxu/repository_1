/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_59_
#define _BUR_1479044160_59_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef enum HmiEditorInternalStateType
{	HMIEDITOR_WAIT,
	HMIEDITOR_READ,
	HMIEDITOR_LOADED,
	HMIEDITOR_WRITE_WAIT,
	HMIEDITOR_ERROR
} HmiEditorInternalStateType;

typedef struct HmiEditorInternalType
{	enum HmiEditorInternalStateType State;
} HmiEditorInternalType;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/HmiHandling/HmiEditor/HmiEditor/HmiEditorLocal.typ\\\" scope \\\"local\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_59_ */

