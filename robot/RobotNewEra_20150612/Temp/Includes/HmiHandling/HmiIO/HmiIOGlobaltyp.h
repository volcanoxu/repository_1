/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_31_
#define _BUR_1479044160_31_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct HmiIOCtrlInputCommand_Type
{	plcbit InfoLineUp;
	plcbit InfoLineDown;
	plcbit Enter;
	plcbit DiscardChange;
	plcbit ForcingOn;
	plcbit ForcingOff;
	plcbit ForcingAllOff;
	plcbit SetValue;
	plcbit PageUp;
	plcbit PageDown;
} HmiIOCtrlInputCommand_Type;

typedef struct HmiIOCtrlInput_Type
{	struct HmiIOCtrlInputCommand_Type Command;
} HmiIOCtrlInput_Type;

typedef struct HmiIOCtrlOutputModuleDiag_Type
{	plcstring ModuleName[21][21];
	plcstring ModulePath[21][31];
	unsigned char ModuleState[21];
	plcstring ErrorModuleName[21][21];
	unsigned short Color[21];
	unsigned char WrongModulStatus[21];
} HmiIOCtrlOutputModuleDiag_Type;

typedef struct HmiIOCtrlSelected_Type
{	plcstring LogicalName[41];
	plcstring PVName[65];
	signed long ForceValue;
	signed long MinValue;
	signed long MaxValue;
	unsigned short Status;
} HmiIOCtrlSelected_Type;

typedef struct HmiIOCtrlOutputIODiag_Type
{	plcstring ModuleName[21];
	plcstring ModulePath[31];
	unsigned char ModuleStatus;
	plcstring PVName[15][65];
	plcstring LogicalName[15][33];
	unsigned char DiagnosicsType[15];
	signed long ActValue[15];
	signed long ForceValue[15];
	signed long MinValue[15];
	signed long MaxValue[15];
	unsigned short Color[15];
	unsigned short NumericColor[15];
	plcbit EnableForcing[15];
	unsigned char InivisibleLines[15];
	plcbit CompletionCmdForcing;
	struct HmiIOCtrlSelected_Type SelectedIO;
} HmiIOCtrlOutputIODiag_Type;

typedef struct HmiIOCtrlOutputStatus_Type
{	unsigned char IOInformationStatus;
	plcbit SimulationActive;
	plcbit DiagnosticsInitDone;
	unsigned short PageFocusColor;
	unsigned long Address;
	unsigned char IOForced;
	unsigned char ModuleInfoLayerStatus;
	unsigned char IOInfoLayerStatus;
	unsigned char StatusLayerMessage;
} HmiIOCtrlOutputStatus_Type;

typedef struct HmiIOCtrlOutput_Type
{	struct HmiIOCtrlOutputModuleDiag_Type ModuleInfo;
	struct HmiIOCtrlOutputIODiag_Type IOInfo;
	struct HmiIOCtrlOutputStatus_Type Status;
} HmiIOCtrlOutput_Type;

typedef struct HmiIOCtrl_Type
{	struct HmiIOCtrlInput_Type Input;
	struct HmiIOCtrlOutput_Type Output;
} HmiIOCtrl_Type;

typedef struct ModuleInformation_Type
{	plcstring ModulePath[31];
	plcstring ModuleName[21];
	unsigned char ModuleState;
	unsigned char ModuleColor;
	plcstring ErrorModuleName[21];
} ModuleInformation_Type;

typedef struct HW_DI_typ
{	plcbit I1;
	plcbit I2;
	plcbit I3;
	plcbit I4;
	plcbit I5;
	plcbit I6;
	plcbit I7;
	plcbit I8;
	plcbit I9;
	plcbit I10;
	plcbit I11;
	plcbit I12;
	plcbit I13;
	plcbit I14;
	plcbit I15;
	plcbit I16;
} HW_DI_typ;

typedef struct HW_DO_typ
{	plcbit O1;
	plcbit O2;
	plcbit O3;
	plcbit O4;
	plcbit O5;
	plcbit O6;
	plcbit O7;
	plcbit O8;
	plcbit O9;
	plcbit O10;
	plcbit O11;
	plcbit O12;
	plcbit O13;
	plcbit O14;
	plcbit O15;
	plcbit O16;
} HW_DO_typ;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/HmiHandling/HmiIO/HmiIOGlobal.typ\\\" scope \\\"global\\\"\\n\"");

/* Additional IEC dependencies */
__asm__(".ascii \"iecdep \\\"Logical/HmiHandling/HmiIO/HmiIOGlobal.var\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_31_ */

