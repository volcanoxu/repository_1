/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_22_
#define _BUR_1479044160_22_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct HmiKeyControlSpace_typ
{	plcbit Enable;
	float X1;
	float Y1;
	float Z1;
	float X2;
	float Y2;
	float Z2;
} HmiKeyControlSpace_typ;

typedef struct HmiKeyControlInputCommand_Type
{	plcbit StartKey;
	plcbit StopKey;
	plcbit EmergencyStopKey;
	plcbit PageKey[7];
	plcbit VirFunctionKeyLeft[9];
	plcbit VirFunctionKey[9];
	plcbit FunctionKey[9];
	plcbit PlusKey[6];
	plcbit MinusKey[6];
	plcbit KeySwitch[2];
	plcbit Key2nd;
	plcbit ProgramActive;
	plcbit Acknowledge;
	plcbit Reset;
	plcbit JogMode;
	plcbit JogEnable;
	plcbit FeedrateChange;
	plcbit StepOn;
	plcbit SaftyKeyRight;
	plcbit SaftyKeyLeft;
	plcbit SetPC;
	plcbit FileSelect;
	plcbit PosSwitch;
} HmiKeyControlInputCommand_Type;

typedef struct HmiKeyControlInputPara_Type
{	unsigned char JogMode;
	unsigned long SystemAddress;
	unsigned long CncAddress;
	unsigned long AxesAddress;
	unsigned long JogAddress;
	unsigned long RecipeAddress;
	unsigned long ErrorAddress;
	signed long JoystickXValue;
	signed long JoystickYValue;
	signed long JoystickZValue;
} HmiKeyControlInputPara_Type;

typedef struct HmiKeyControlInput_Type
{	struct HmiKeyControlInputPara_Type Parameter;
	struct HmiKeyControlInputCommand_Type Command;
} HmiKeyControlInput_Type;

typedef struct HmiKeyControlOutputMon_Type
{	float JogJointVelocity;
	unsigned char ToolIndex;
	unsigned char JogToolIndex;
	plcstring FileName[33];
	unsigned long ModuleType;
	unsigned short PosSelect;
	float ShowPos[6];
	unsigned char JogMode;
} HmiKeyControlOutputMon_Type;

typedef struct HmiKeyControlOutputStatus_Type
{	unsigned char Enable;
	plcbit Run;
	plcbit Error;
	plcbit Moving;
	plcbit JogEnable;
	plcbit RealContinue;
	unsigned char MoveStatus;
	unsigned char AutoStatus;
	unsigned char StatusIconIndex;
	unsigned char SwitchMode;
	plcbit SWLimitsIgnored[6];
	signed char MoveAxis[6];
} HmiKeyControlOutputStatus_Type;

typedef struct HmiKeyControlOutput_Type
{	struct HmiKeyControlOutputMon_Type Monitor;
	struct HmiKeyControlOutputStatus_Type Status;
} HmiKeyControlOutput_Type;

typedef struct HmiKeyCtrlLayerButtonsType
{	struct HmiLayerType Layer;
	struct HmiTabsType Tabs;
	struct HmiButtonType ButtonVMinus;
	struct HmiButtonType ButtonVPlus;
	struct HmiButtonType ButtonSwitchOn;
	struct HmiButtonType ButtonLogin;
	struct HmiButtonType ButtonJogBase;
	struct HmiButtonType ButtonJogTool;
	struct HmiButtonType ButtonJogJoint;
	struct HmiButtonType ButtonJogDirect;
	struct HmiButtonType ButtonSingle;
	struct HmiButtonType ButtonCont;
	struct HmiSliderType SliderV;
	struct HmiNumericType NumericV;
} HmiKeyCtrlLayerButtonsType;

typedef struct HmiKeyCtrlLayerLoginType
{	struct HmiLayerType Layer;
} HmiKeyCtrlLayerLoginType;

typedef struct HmiKeyControlComponentsType
{	struct HmiKeyCtrlLayerButtonsType LayerButtons;
	struct HmiKeyCtrlLayerLoginType LayerLogin;
} HmiKeyControlComponentsType;

typedef struct HmiKeyControl_Type
{	struct HmiKeyControlInput_Type Input;
	struct HmiKeyControlOutput_Type Output;
	struct HmiKeyControlComponentsType Components;
} HmiKeyControl_Type;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/HmiHandling/HmiKeyCtrl/HmiKeyControlGlobal.typ\\\" scope \\\"global\\\"\\n\"");

/* Additional IEC dependencies */
__asm__(".ascii \"iecdep \\\"Logical/HmiHandling/HmiGlobal.var\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_22_ */

