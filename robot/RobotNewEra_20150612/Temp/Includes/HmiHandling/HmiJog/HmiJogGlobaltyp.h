/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_41_
#define _BUR_1479044160_41_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct HmiJogLayerDefaultType
{	struct HmiButtonType ButtoToolCheck;
	struct HmiButtonType ButtonWorkObjectCheck;
	struct HmiTextType TextWorkObjectName;
	struct HmiTextType TextToolName;
	struct HmiDropdownType DropdownEulerQuan;
	struct HmiDropdownType DropdownDegreeRad;
	struct HmiDropdownType DropdownJointTCP;
	struct HmiNumericType NumericPos[7];
	struct HmiNumericType NumericJogStep;
	struct HmiTextType TextPos[7];
	struct HmiTextType TextPosUnit[6];
	struct HmiTextType TextNotAvailable;
	struct HmiButtonType ButtonActSet;
	struct HmiNumericWithRangeType NumericPosSet[7];
	struct HmiTextType TextActSet;
	struct HmiButtonType ButtonCheckVar;
	struct HmiTextType TextSetVar;
	struct HmiHotSpotType HotSpotFrameBrowse;
	struct HmiHotSpotType HotSpotSetBrowse;
	struct HmiHotSpotType HotSpotToolBrowse;
} HmiJogLayerDefaultType;

typedef struct HmiJogCtrlComponentsType
{	struct HmiJogLayerDefaultType LayerDefault;
} HmiJogCtrlComponentsType;

typedef struct HmiJogCtrlType
{	struct HmiJogCtrlComponentsType Components;
} HmiJogCtrlType;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/HmiHandling/HmiJog/HmiJogGlobal.typ\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_41_ */

