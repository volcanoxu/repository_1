/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_24_
#define _BUR_1479044160_24_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct HmiMainCtrlComponentsType
{	struct HmiEditType EditPrgRun;
	struct HmiTextType TextFileName;
	struct HmiButtonType ButtonJumpToMain;
	struct HmiSimpleType HotSpotPrgRun;
	struct HmiButtonType ButtonSetPtr;
} HmiMainCtrlComponentsType;

typedef struct HmiMainControlType
{	struct HmiMainCtrlComponentsType Components;
} HmiMainControlType;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/HmiHandling/HmiMain/HmiMainGlobal.typ\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_24_ */

