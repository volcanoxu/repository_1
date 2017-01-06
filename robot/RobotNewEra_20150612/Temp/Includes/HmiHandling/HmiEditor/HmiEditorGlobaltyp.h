/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_35_
#define _BUR_1479044160_35_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct HmiEditorDataLayerDefaultType
{	struct HmiScaleType ScaleScrollbar;
	struct HmiButtonType ButtonScrolldown;
	struct HmiButtonType ButtonScrollup;
	struct HmiListboxType ListboxVariables;
	struct HmiTextType TextEditorName;
	struct HmiListboxType DropDownTypes;
	struct HmiLayerType Layer;
	struct HmiButtonType ButtonNew;
	struct HmiButtonType ButtonModify;
	struct HmiButtonType ButtonDelete;
	struct HmiButtonType ButtonReload;
	struct HmiButtonType ButtonSaveAll;
	struct HmiButtonType ButtonInsert;
} HmiEditorDataLayerDefaultType;

typedef struct HmiEditorDataLayerNewType
{	struct HmiLayerType Layer;
	struct HmiButtonType ButtonCancel;
	struct HmiButtonType ButtonConfirm;
	struct HmiStringType StringInput;
	struct HmiNumericType NumInput;
	struct HmiTextType TextInfo;
	struct HmiButtonType ButtonConstant;
} HmiEditorDataLayerNewType;

typedef struct HmiEditorDataLayerPointType
{	struct HmiNumericType NumericPosX;
	struct HmiNumericType NumericPosY;
	struct HmiNumericType NumericPosZ;
	struct HmiNumericType NumericOrientType;
	struct HmiNumericType NumericOrientAngle1;
	struct HmiNumericType NumericOrientAngle2;
	struct HmiNumericType NumericOrientAngle3;
	struct HmiNumericType NumericOrientAngle0;
	struct HmiNumericWithRangeType NumericIndex;
	struct HmiButtonType ButtonIndexDown;
	struct HmiButtonType ButtonIndexUp;
	struct HmiButtonType ButtonSave;
	struct HmiButtonType ButtonClear;
	struct HmiButtonType ButtonReload;
	struct HmiLayerType Layer;
	struct HmiStringType TextVarInfo;
	struct HmiButtonType ButtonClose;
	struct HmiButtonType ButtonSetJog;
	struct HmiButtonType ButtonTeach;
} HmiEditorDataLayerPointType;

typedef struct HmiEditorDataLayerAxisType
{	struct HmiLayerType Layer;
	struct HmiNumericType NumericJointAxis0;
	struct HmiNumericType NumericJointAxis1;
	struct HmiNumericType NumericJointAxis2;
	struct HmiNumericType NumericJointAxis3;
	struct HmiNumericType NumericJointAxis4;
	struct HmiNumericType NumericJointAxis5;
	struct HmiNumericWithRangeType NumericIndex;
	struct HmiButtonType ButtonIndexDown;
	struct HmiButtonType ButtonIndexUp;
	struct HmiButtonType ButtonClose;
	struct HmiStringType TextVarInfo;
	struct HmiButtonType ButtonClear;
	struct HmiButtonType ButtonReload;
	struct HmiButtonType ButtonSave;
	struct HmiButtonType ButtonSetJog;
	struct HmiButtonType ButtonTeach;
} HmiEditorDataLayerAxisType;

typedef struct HmiEditorDataLayerFrameType
{	struct HmiNumericType NumericPosX;
	struct HmiNumericType NumericPosY;
	struct HmiNumericType NumericPosZ;
	struct HmiNumericType NumericOrientType;
	struct HmiNumericType NumericOrientAngle1;
	struct HmiNumericType NumericOrientAngle2;
	struct HmiNumericType NumericOrientAngle3;
	struct HmiNumericType NumericOrientAngle0;
	struct HmiNumericWithRangeType NumericIndex;
	struct HmiButtonType ButtonIndexDown;
	struct HmiButtonType ButtonIndexUp;
	struct HmiLayerType Layer;
	struct HmiStringType TextVarInfo;
	struct HmiButtonType ButtonClose;
	struct HmiButtonType ButtonClear;
	struct HmiButtonType ButtonReload;
	struct HmiButtonType ButtonSave;
	struct HmiButtonType ButtonSetJog;
} HmiEditorDataLayerFrameType;

typedef struct HmiEditorDataLayerToolType
{	struct HmiNumericType NumericPosX;
	struct HmiNumericType NumericPosY;
	struct HmiNumericType NumericPosZ;
	struct HmiNumericType NumericOrientType;
	struct HmiNumericType NumericOrientAngle1;
	struct HmiNumericType NumericOrientAngle2;
	struct HmiNumericType NumericOrientAngle3;
	struct HmiNumericType NumericOrientAngle0;
	struct HmiNumericType NumericRadius;
	struct HmiNumericWithRangeType NumericIndex;
	struct HmiButtonType ButtonIndexDown;
	struct HmiButtonType ButtonIndexUp;
	struct HmiLayerType Layer;
	struct HmiStringType TextVarInfo;
	struct HmiButtonType ButtonClose;
	struct HmiButtonType ButtonClear;
	struct HmiButtonType ButtonReload;
	struct HmiButtonType ButtonSave;
	struct HmiButtonType ButtonSetJog;
} HmiEditorDataLayerToolType;

typedef struct HmiEditorDataLayerVelType
{	struct HmiLayerType Layer;
	struct HmiNumericType Numericv;
	struct HmiNumericType NumericMode;
	struct HmiNumericWithRangeType NumericIndex;
	struct HmiButtonType ButtonIndexDown;
	struct HmiButtonType ButtonIndexUp;
	struct HmiButtonType ButtonClose;
	struct HmiStringType TextVarInfo;
	struct HmiButtonType ButtonClear;
	struct HmiButtonType ButtonReload;
	struct HmiButtonType ButtonSave;
} HmiEditorDataLayerVelType;

typedef struct HmiEditorDataLayerPathType
{	struct HmiLayerType Layer;
	struct HmiNumericType NumericRadius;
	struct HmiNumericType NumericType;
	struct HmiNumericWithRangeType NumericIndex;
	struct HmiButtonType ButtonIndexDown;
	struct HmiButtonType ButtonIndexUp;
	struct HmiButtonType ButtonClose;
	struct HmiStringType TextVarInfo;
	struct HmiButtonType ButtonClear;
	struct HmiButtonType ButtonReload;
	struct HmiButtonType ButtonSave;
} HmiEditorDataLayerPathType;

typedef struct HmiEditorDataLayerINTType
{	struct HmiLayerType Layer;
	struct HmiNumericType NumericValue;
	struct HmiNumericWithRangeType NumericIndex;
	struct HmiButtonType ButtonIndexDown;
	struct HmiButtonType ButtonIndexUp;
	struct HmiButtonType ButtonClose;
	struct HmiStringType TextVarInfo;
	struct HmiButtonType ButtonClear;
	struct HmiButtonType ButtonReload;
	struct HmiButtonType ButtonSave;
} HmiEditorDataLayerINTType;

typedef struct HmiEditorDataLayerREALType
{	struct HmiLayerType Layer;
	struct HmiNumericType NumericValue;
	struct HmiNumericWithRangeType NumericIndex;
	struct HmiButtonType ButtonIndexDown;
	struct HmiButtonType ButtonIndexUp;
	struct HmiButtonType ButtonClose;
	struct HmiStringType TextVarInfo;
	struct HmiButtonType ButtonClear;
	struct HmiButtonType ButtonReload;
	struct HmiButtonType ButtonSave;
} HmiEditorDataLayerREALType;

typedef struct HmiEditorDataLayerBOOLType
{	struct HmiLayerType Layer;
	struct HmiNumericType NumericValue;
	struct HmiNumericWithRangeType NumericIndex;
	struct HmiButtonType ButtonIndexDown;
	struct HmiButtonType ButtonIndexUp;
	struct HmiButtonType ButtonClose;
	struct HmiStringType TextVarInfo;
	struct HmiButtonType ButtonClear;
	struct HmiButtonType ButtonReload;
	struct HmiButtonType ButtonSave;
} HmiEditorDataLayerBOOLType;

typedef struct HmiEditorPageDataType
{	struct HmiEditorDataLayerDefaultType LayerDefault;
	struct HmiEditorDataLayerNewType LayerNewPopup;
	struct HmiEditorDataLayerPointType LayerPoint;
	struct HmiEditorDataLayerAxisType LayerAxis;
	struct HmiEditorDataLayerFrameType LayerFrame;
	struct HmiEditorDataLayerToolType LayerTool;
	struct HmiEditorDataLayerVelType LayerVel;
	struct HmiEditorDataLayerPathType LayerPath;
	struct HmiEditorDataLayerINTType LayerINT;
	struct HmiEditorDataLayerREALType LayerREAL;
	struct HmiEditorDataLayerBOOLType LayerBOOL;
} HmiEditorPageDataType;

typedef struct HmiEditorEditLayerDefualtType
{	struct HmiHotSpotType HotSpotKeys[50];
	struct HmiLayerType Layer;
	struct HmiBitmapType BmpKeys;
	struct HmiEditType EditPrg;
	struct HmiTextType TextFileName;
	struct HmiHotSpotType HotSpotPrompts[5];
	struct HmiStringType StringPrompt;
	struct HmiHotSpotType HotSpotPromptRight;
	struct HmiHotSpotType HotSpotPromptLeft;
	struct HmiHotSpotType HotSpotVarSelect;
} HmiEditorEditLayerDefualtType;

typedef struct HmiEditorPageEditType
{	struct HmiEditorEditLayerDefualtType LayerDefault;
} HmiEditorPageEditType;

typedef struct HmiEditorCtrlComponentsType
{	struct HmiEditorPageDataType PageData;
	struct HmiEditorPageEditType PageEdit;
} HmiEditorCtrlComponentsType;

typedef struct HmiEditorCtrlType
{	struct HmiEditorCtrlComponentsType Components;
} HmiEditorCtrlType;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/HmiHandling/HmiEditor/HmiEditorGlobal.typ\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_35_ */

