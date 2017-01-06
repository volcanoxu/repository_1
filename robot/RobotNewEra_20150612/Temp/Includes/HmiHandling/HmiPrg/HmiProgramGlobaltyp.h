/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_33_
#define _BUR_1479044160_33_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct HmiProgramLayerDefaultType
{	struct HmiLayerType Layer;
	struct HmiListboxType ListboxFiles;
	struct HmiListboxType ListboxDevices;
	struct HmiButtonType ButtonPageDown;
	struct HmiButtonType ButtonPageUp;
	struct HmiButtonType ButtonRename;
	struct HmiButtonType ButtonEdit;
	struct HmiButtonType ButtonLoad;
	struct HmiButtonType ButtonNew;
	struct HmiButtonType ButtonDelete;
	struct HmiButtonType ButtonPaste;
	struct HmiButtonType ButtonCopy;
	struct HmiButtonType ButtonCut;
	struct HmiScaleType ScaleScrollbar;
} HmiProgramLayerDefaultType;

typedef struct HmiProgramComponentsType
{	struct HmiProgramLayerDefaultType LayerDefault;
	struct HmiPopupType LayerDeletePopup;
	struct HmiPopupWithStringType LayerNewPopup;
	struct HmiPopupWithStringType LayerRenamePopup;
	struct HmiPopupType LayerCutPopup;
} HmiProgramComponentsType;

typedef struct HmiProgram_Type
{	struct HmiProgramComponentsType Components;
} HmiProgram_Type;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/HmiHandling/HmiPrg/HmiProgramGlobal.typ\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_33_ */

