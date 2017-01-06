/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_12_
#define _BUR_1479044160_12_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct AxesInputConfiguration_Type
{	plcbit Active;
	plcstring Label[81];
	plcstring NcMapObjName[81];
	plcstring ErrorDatObjName[81];
	plcstring UnitPositionLabel[81];
	float UnitPositionFaktor;
	plcstring UnitVelocityLabel[81];
	float UnitVelocityFaktor;
	signed long DistanceToStopBeforeSW;
	unsigned short PDOReadParID[4];
	unsigned short PDOReadParType[4];
	unsigned short PDOWriteParID[4];
	unsigned short PDOWriteParType[4];
} AxesInputConfiguration_Type;

typedef struct AxesInputCommand_Type
{	unsigned char Enable;
	unsigned char InitAxisPar;
	unsigned char InitAxisSubjecPar;
	unsigned char SaveAxisPar;
	unsigned char LoadAxisPar;
	unsigned char Home;
	unsigned char HomeAutoPosition;
	unsigned char Simulation;
	unsigned char MoveAbsolute;
	unsigned char MoveAdditive;
	unsigned char MoveVelocity;
	unsigned char CyclicPosition;
	unsigned char StartDryRun;
	unsigned char Stop;
	unsigned char EmergencyStop;
	unsigned char ErrorAcknowledge;
	unsigned char Reset;
	unsigned char WriteAxisPar;
} AxesInputCommand_Type;

typedef struct AxesInputParameter_Type
{	float Position;
	float HomePosition;
	float AutoPosition;
	float CyclicPosition;
	float Distance;
	unsigned char Direction;
	float Velocity;
	float Acceleration;
	float Deceleration;
	float Override;
	float DryRunWheelPosition;
	float DryRunWheelFactor;
	plcbit DryRunInvertWheel;
	unsigned short InitAxisSubjectPar;
	unsigned short SimulationCommand;
	plcbit ConfigOk;
	float PDOWriteValue[4];
	unsigned char CommandID;
	float JoltTime;
	plcstring SaveAxisParDataObjectName[81];
	plcstring LoadAxisParDataObjectName[81];
	unsigned short WriteParID;
	plcstring WriteParIDText[34];
} AxesInputParameter_Type;

typedef struct AxesInput_Type
{	struct AxesInputConfiguration_Type Configuration;
	struct AxesInputCommand_Type Command;
	struct AxesInputParameter_Type Parameter;
} AxesInput_Type;

typedef struct AxesOutputState_Type
{	plcbit Errorstop;
	plcbit Disabled;
	plcbit Stopping;
	plcbit Standstill;
	plcbit DiscreteMotion;
	plcbit ContinuousMotion;
	plcbit SyncronizedMotion;
	plcbit Homing;
} AxesOutputState_Type;

typedef struct AxesOutputStatus_Type
{	plcbit AccessOk;
	plcbit Simulation;
	plcbit NetworkInit;
	plcbit HomeSwitch;
	plcbit PosHWSwitch;
	plcbit NegHWSwitch;
	plcbit Trigger1;
	plcbit Trigger2;
	plcbit DriveEnable;
	plcbit ControllerReady;
	plcbit ControllerStatus;
	plcbit HomingOk;
	plcbit AxisError;
	plcbit LagWarning;
	plcbit CommandError;
	unsigned long AxesDatAddress;
	plcbit DryRunActive;
	plcbit Busy;
} AxesOutputStatus_Type;

typedef struct AxesOutputMonitor_Type
{	float Position;
	float CyclicPosition;
	float Velocity;
	plcbit InPosition;
	plcbit InVelocity;
	float MaximalVelocity;
	unsigned long AxesAddress;
	unsigned long MCAxesAddress;
	float PDOReadValue[5];
	float DecoupledPosition;
} AxesOutputMonitor_Type;

typedef struct AxesOutput_Type
{	struct AxesOutputState_Type State;
	struct AxesOutputStatus_Type Status;
	struct AxesOutputMonitor_Type Monitor;
	struct Error_Type Error;
} AxesOutput_Type;

typedef struct Axes_Type
{	struct AxesInput_Type Input;
	struct AxesOutput_Type Output;
} Axes_Type;

typedef struct MCAxes_Type
{	struct MC_DRIVESTATUS_TYP Status;
	struct MC_Power Power;
	struct MC_Stop Stop;
	struct MC_Home Home;
	struct MC_Reset Reset;
	struct MC_ReadAxisError ReadAxisError;
	struct MC_ReadStatus ReadStatus;
	struct MC_MoveVelocity MoveVelocity_0;
	struct MC_MoveVelocity MoveVelocity_1;
	struct MC_MoveAbsolute MoveAbsolute_0;
	struct MC_MoveAbsolute MoveAbsolute_1;
	struct MC_MoveAdditive MoveAdditive_0;
	struct MC_MoveAdditive MoveAdditive_1;
	struct MC_Halt Halt;
	struct MC_BR_InitAxisPar BR_InitAxisPar;
	struct MC_BR_SaveAxisPar BR_SaveAxisPar;
	struct MC_BR_LoadAxisPar BR_LoadAxisPar;
	struct MC_BR_InitAxisSubjectPar BR_InitAxisSubjectPar;
	struct MC_BR_ReadDriveStatus BR_ReadDriveStatus;
	struct MC_BR_Simulation BR_Simulation;
	struct MC_SetOverride SetOverride;
	struct MC_BR_MoveCyclicPosition BR_MoveCyclicPosition;
	struct MC_BR_ReadCyclicPosition BR_ReadCyclicPosition;
	struct MC_BR_InitCyclicRead BR_InitCyclicRead_0;
	struct MC_BR_InitCyclicRead BR_InitCyclicRead_1;
	struct MC_BR_InitCyclicRead BR_InitCyclicRead_2;
	struct MC_BR_InitCyclicRead BR_InitCyclicRead_3;
	struct MC_BR_InitCyclicWrite BR_InitCyclicWrite_0;
	struct MC_BR_InitCyclicWrite BR_InitCyclicWrite_1;
	struct MC_BR_InitCyclicWrite BR_InitCyclicWrite_2;
	struct MC_BR_InitCyclicWrite BR_InitCyclicWrite_3;
	struct MC_BR_WriteParIDText BR_WriteParID;
	struct MC_BR_GetErrorText BR_GetErrorText;
	struct MC_ERRORRECORD_REF ErrorRecord;
} MCAxes_Type;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/MotionHandling/AxesHandling/Axes.typ\\\" scope \\\"global\\\"\\n\"");

/* Additional IEC dependencies */
__asm__(".ascii \"iecdep \\\"Logical/MotionHandling/MotionGlobalSize.var\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_12_ */

