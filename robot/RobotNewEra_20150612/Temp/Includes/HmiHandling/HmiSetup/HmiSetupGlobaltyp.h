/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_28_
#define _BUR_1479044160_28_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct HmiSetupCalibInfoType
{	struct HmiLayerType Layer;
} HmiSetupCalibInfoType;

typedef struct HmiSetupCalibDefaultType
{	struct HmiLayerType Layer;
	struct HmiButtonType ButtonAxisRefresh[6];
	struct HmiButtonType ButtonAxisToggle[6];
	struct HmiNumericType NumericEncoderValue[6];
	struct HmiButtonType ButtonSave;
} HmiSetupCalibDefaultType;

typedef struct HmiSetupCalibType
{	struct HmiSetupCalibInfoType LayerInfo;
	struct HmiSetupCalibDefaultType LayerDefault;
} HmiSetupCalibType;

typedef struct HmiSetupKineDefaultType
{	struct HmiButtonType ButtonSave;
	struct HmiNumericType NumericC56Value;
	struct HmiNumericType NumericC46Value;
	struct HmiNumericType NumericC45Value;
	struct HmiButtonType ButtonC56Enable;
	struct HmiButtonType ButtonC46Enable;
	struct HmiButtonType ButtonC45Enable;
	struct HmiDropdownType DropdownAxisSelect;
} HmiSetupKineDefaultType;

typedef struct HmiSetupKineInfoType
{	struct HmiLayerType Layer;
} HmiSetupKineInfoType;

typedef struct HmiSetupKineType
{	struct HmiSetupKineDefaultType LayerDefault;
	struct HmiSetupKineInfoType LayerInfo;
} HmiSetupKineType;

typedef struct HmiSetupMainInfoType
{	struct HmiLayerType Layer;
	struct HmiButtonType ButtonRestart;
} HmiSetupMainInfoType;

typedef struct HmiSetupMainDefaultType
{	struct HmiHotSpotType HotspotRestart;
	struct HmiLayerType Layer;
} HmiSetupMainDefaultType;

typedef struct HmiSetupMainType
{	struct HmiSetupMainInfoType LayerInfo;
	struct HmiSetupMainDefaultType LayerDefault;
} HmiSetupMainType;

typedef struct HmiSetupComponentsType
{	struct HmiSetupCalibType PageCalib;
	struct HmiSetupKineType PageKine;
	struct HmiSetupMainType PageMain;
} HmiSetupComponentsType;

typedef struct HmiSetupControl_Type
{	struct HmiSetupComponentsType Components;
} HmiSetupControl_Type;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/HmiHandling/HmiSetup/HmiSetupGlobal.typ\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_28_ */

