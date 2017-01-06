/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_18_
#define _BUR_1479044160_18_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct HmiGlobalAddress_Type
{	unsigned long SystemAddress;
	unsigned long AxesAddress;
	unsigned long CncAddress;
	unsigned long JogAddress;
	unsigned long RecipeAddress;
	unsigned long ErrorAddress;
} HmiGlobalAddress_Type;

typedef struct HmiGlobalPageCtrl_Type
{	unsigned short ActPage;
	unsigned short SetPage;
} HmiGlobalPageCtrl_Type;

typedef struct HmiGlobal_Type
{	struct HmiGlobalAddress_Type Address;
	struct HmiGlobalPageCtrl_Type PageControl;
} HmiGlobal_Type;

typedef struct HmiEditControl_Type
{	plcstring CommandRequest[201];
	plcstring CommandResponse[201];
	unsigned short CommandStatus;
	unsigned long CursorLine;
	unsigned short StatusDatapoint;
	signed long LastExcuteLine;
	signed long LastHighLightLine;
	plcstring URL[81];
	unsigned long CursorCol;
	unsigned long TargetCursorCol;
	unsigned long TargetCursorLine;
} HmiEditControl_Type;

typedef struct HmiProgramRetain_Type
{	plcstring Name[81];
	unsigned char Mode;
	plcstring URLPathOnly[81];
	plcstring URL[81];
	plcstring Device[81];
	unsigned short Ptr;
} HmiProgramRetain_Type;

typedef struct HmiKeyControlRetain_Type
{	plcbit MechHomeOK;
} HmiKeyControlRetain_Type;

typedef struct HmiEditorRetain_Type
{	plcstring Name[81];
	plcstring URLPathOnly[81];
	plcstring URL[81];
	plcstring Device[81];
} HmiEditorRetain_Type;

typedef struct HmiJointLimitType
{	float Max;
	float Min;
} HmiJointLimitType;

typedef struct HmiCartesianLimitType
{	float Min;
	float Max;
} HmiCartesianLimitType;

typedef struct HmiMechType
{	float OffsetY;
	float OffsetZ;
	float OffsetX;
	unsigned char Direction;
} HmiMechType;

typedef struct HmiCouplingType
{	double Coefficient;
	plcbit Enable;
} HmiCouplingType;

typedef struct HmiRobot_Type
{	struct HmiJointLimitType JointLimits[6];
	struct HmiCartesianLimitType CartesianLimits[3];
	struct MXPointType HomePos;
	struct HmiMechType Mech[6];
	struct HmiCouplingType Coupling[3];
} HmiRobot_Type;

typedef struct HmiJogFrameRetainType
{	plcstring VarName[31];
	struct MXFrameType Frame;
} HmiJogFrameRetainType;

typedef struct HmiJogToolRetainType
{	plcstring VarName[31];
	struct MXToolType Tool;
} HmiJogToolRetainType;

typedef struct HmiJogJointRetainType
{	plcstring VarName[31];
	struct MXAxisTargetType Joint;
	plcbit Set;
} HmiJogJointRetainType;

typedef struct HmiJogPointRetainType
{	plcstring VarName[31];
	struct MXPointType Point;
	plcbit Set;
} HmiJogPointRetainType;

typedef struct HmiJogRetain_Type
{	struct HmiJogFrameRetainType Frame;
	struct HmiJogToolRetainType Tool;
	struct HmiJogJointRetainType Joint;
	struct HmiJogPointRetainType Point;
	plcstring Name[81];
	plcstring Device[81];
} HmiJogRetain_Type;

typedef struct HmiRetain_Type
{	struct HmiProgramRetain_Type HmiProgram;
	struct HmiKeyControlRetain_Type HmiKeyControl;
	struct HmiEditorRetain_Type HmiEditor;
	struct HmiRobot_Type HmiRobot;
	struct HmiJogRetain_Type HmiJog;
} HmiRetain_Type;

typedef struct HmiFileCtrlOutputStatus_Type
{	plcbit ReadOK;
	plcbit WriteOK;
	plcbit Busy;
} HmiFileCtrlOutputStatus_Type;

typedef struct HmiFileCtrlOutput_Type
{	struct HmiFileCtrlOutputStatus_Type Status;
} HmiFileCtrlOutput_Type;

typedef struct HmiFileCtrlInputCmd_Type
{	plcbit Read;
	plcbit Write;
	plcbit AckError;
} HmiFileCtrlInputCmd_Type;

typedef struct HmiFileCtrlInputParam_Type
{	plcstring FileName[81];
	unsigned long StringBufferSize;
	unsigned long StringBufferAdr;
	plcstring FileDevice[81];
} HmiFileCtrlInputParam_Type;

typedef struct HmiFileCtrlInput_Type
{	struct HmiFileCtrlInputCmd_Type Command;
	struct HmiFileCtrlInputParam_Type Parameter;
} HmiFileCtrlInput_Type;

typedef struct HmiFileCtrl_Type
{	struct HmiFileCtrlInput_Type Input;
	struct HmiFileCtrlOutput_Type Output;
} HmiFileCtrl_Type;

typedef struct HmiButtonType
{	unsigned char Value;
	unsigned char OldValue;
	unsigned short StatusDatapoint;
	unsigned char CompletionDatapoint;
	unsigned char BmpIdx;
} HmiButtonType;

typedef struct HmiLayerType
{	unsigned short StatusDatapoint;
} HmiLayerType;

typedef struct HmiScaleType
{	float StartDatapoint;
	float EndDatapoint;
} HmiScaleType;

typedef struct HmiSliderType
{	float Value;
	unsigned short StatusDatapoint;
} HmiSliderType;

typedef struct HmiStringType
{	plcstring Value[81];
	unsigned short StatusDatapoint;
} HmiStringType;

typedef struct HmiNumericTypeR
{	float* Value;
	unsigned short StatusDatapoint;
} HmiNumericTypeR;

typedef struct HmiDropdownTypeR
{	unsigned char* SelectedIndex;
	unsigned char OldIndex;
} HmiDropdownTypeR;

typedef struct HmiNumericType
{	float Value;
	unsigned short StatusDatapoint;
} HmiNumericType;

typedef struct HmiTextType
{	unsigned char TextIndex;
	unsigned short StatusDatapoint;
} HmiTextType;

typedef struct HmiEditType
{	plcstring CommandRequest[201];
	plcstring CommandResponse[201];
	unsigned short CommandStatus;
	unsigned long CursorLine;
	unsigned long CursorCol;
	plcstring URL[81];
	unsigned short StatusDatapoint;
	plcstring StringBuffer[10001];
} HmiEditType;

typedef struct HmiDropdownType
{	unsigned char SelectedIndex;
	unsigned char OldIndex;
} HmiDropdownType;

typedef struct HmiHotSpotType
{	unsigned char Value;
	unsigned char OldValue;
} HmiHotSpotType;

typedef struct HmiListboxType
{	plcstring Entries[20][81];
	unsigned char MaxListIndex;
	unsigned char SelectedIndex;
	unsigned char CompletionDatapoint;
	unsigned char OldSelectedIndex;
	plcbit IsEmpty;
} HmiListboxType;

typedef struct HmiTabsType
{	unsigned char TabMaxIndex;
	unsigned char TabSelectedIndex;
	struct HmiButtonType ButtonsTab[5];
	struct HmiTextType TabBg;
} HmiTabsType;

typedef struct HmiPopupType
{	struct HmiLayerType Layer;
	struct HmiButtonType ButtonCancel;
	struct HmiButtonType ButtonConfirm;
} HmiPopupType;

typedef struct HmiNumericWithRangeType
{	float Value;
	unsigned short StatusDatapoint;
	float Max;
	float Min;
} HmiNumericWithRangeType;

typedef struct HmiBitmapType
{	unsigned char BmpIndex;
} HmiBitmapType;

typedef struct HmiPopupWithStringType
{	struct HmiLayerType Layer;
	struct HmiButtonType ButtonCancel;
	struct HmiButtonType ButtonConfirm;
	struct HmiStringType StringInput;
	struct HmiTextType TextInfo;
} HmiPopupWithStringType;

typedef struct HmiSimpleType
{	unsigned short StatusDatapoint;
} HmiSimpleType;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/HmiHandling/HmiGlobal.typ\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_18_ */

