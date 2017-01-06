/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_8_
#define _BUR_1479044160_8_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef enum SystemInConfModeAxBehav_Type
{	STOP_AXES,
	IGNORE_AXES,
	HOMEAUTO_AXES,
	HOMEAUTO_MOVE_AXES,
	HOMEAUTO_CYCLICPOS_AXES,
	HOMEAUTO_MOVE_CYCLICPOS_AXES,
	MOVE_AXES,
	MOVE_HOMEAUTO_AXES,
	MOVE_HOMEAUTO_CYCLICPOS_AXES,
	MOVE_CYCLICPOS_AXES,
	CYCLICPOS_AXES
} SystemInConfModeAxBehav_Type;

typedef enum SystemInConfModeCncBehav_Type
{	STOP_CNC,
	IGNORE_CNC
} SystemInConfModeCncBehav_Type;

typedef enum SystemInputParameterSimMode_Type
{	SIMULATE_CNC,
	SIMULATE_MOTOR
} SystemInputParameterSimMode_Type;

typedef enum SystemInputParamterMode_Type
{	FORCE_OFF,
	FORCE_ON,
	PROGRAM_DEPENDED
} SystemInputParamterMode_Type;

typedef enum SystemModeAxesTyp_Type
{	NO_TYPE,
	CNC_AXES,
	SPINDLE_0_AXES,
	SPINDLE_1_AXES,
	SPINDLE_2_AXES,
	SPINDLE_3_AXES,
	JOG_AXES,
	AUXILIARY_AXES
} SystemModeAxesTyp_Type;

typedef struct SystemInputConfigSystemAxes_Type
{	unsigned char Index;
	unsigned char HomeOrder;
	plcbit IsSpindle;
	plcbit IsEncoder;
} SystemInputConfigSystemAxes_Type;

typedef struct SystemInputConfigModeCnc_Type
{	unsigned char Index;
	enum SystemInConfModeCncBehav_Type Behavior;
	plcbit Visible;
} SystemInputConfigModeCnc_Type;

typedef struct SystemInputConfigModeAxes_Type
{	unsigned char Index;
	enum SystemModeAxesTyp_Type Type;
	enum SystemInConfModeAxBehav_Type Behavior;
	plcbit ResetJoltTime;
	plcbit Visible;
} SystemInputConfigModeAxes_Type;

typedef struct SystemInputConfigMode_Type
{	plcstring Label[81];
	struct SystemInputConfigModeCnc_Type Cnc[1];
	struct SystemInputConfigModeAxes_Type Axes[13];
} SystemInputConfigMode_Type;

typedef struct SystemInputConfiguration_Type
{	plcbit Active;
	plcstring Label[81];
	unsigned char SystemPowerAxesIndex[13];
	struct SystemInputConfigSystemAxes_Type SystemAxes[13];
	unsigned char SystemCncIndex[1];
	struct SystemInputConfigMode_Type Mode[2];
} SystemInputConfiguration_Type;

typedef struct SystemInputCommand_Type
{	unsigned char Init;
	unsigned char Enable;
	unsigned char Home;
	unsigned char ChangeMode;
	unsigned char EmergencyStop;
	unsigned char Stop;
	unsigned char Reset;
	unsigned char Acknowledge;
	unsigned char StartService;
	unsigned char StopService;
	unsigned char StartSimulation;
	unsigned char StopSimulation;
} SystemInputCommand_Type;

typedef struct SystemInputParamterCooling_Type
{	enum SystemInputParamterMode_Type Mode;
} SystemInputParamterCooling_Type;

typedef struct SystemInputParamterSpindle_Type
{	enum SystemInputParamterMode_Type Mode;
	float SpindleVelocity[4];
	float Override;
} SystemInputParamterSpindle_Type;

typedef struct SystemInputParamter_Type
{	unsigned char Mode;
	struct SystemInputParamterCooling_Type Cooling;
	struct SystemInputParamterSpindle_Type Spindle;
	enum SystemInputParameterSimMode_Type SimulationMode;
	plcbit ConfigOk;
	unsigned long AxesAddress;
	unsigned long CncAddress;
	unsigned char CommandID;
} SystemInputParamter_Type;

typedef struct SystemInput_Type
{	struct SystemInputConfiguration_Type Configuration;
	struct SystemInputCommand_Type Command;
	struct SystemInputParamter_Type Parameter;
} SystemInput_Type;

typedef struct SystemOutputState_Type
{	plcbit Disabled;
	plcbit Standby;
	plcbit Homing;
	plcbit Active;
	plcbit Stopping;
	plcbit Errorstop;
	plcbit Service;
} SystemOutputState_Type;

typedef struct SystemOutputStatus_Type
{	plcbit AccessOk;
	plcbit Busy;
	plcbit HomingOk;
	plcbit NetworkInit;
	plcbit Booting;
	plcbit Ready;
	unsigned char ControllerStatus;
	plcbit CommandError;
} SystemOutputStatus_Type;

typedef struct SystemOutputMonitorCnc_Type
{	plcbit Active;
	plcstring Label[81];
	unsigned char Index;
	unsigned long CncDatAddress;
} SystemOutputMonitorCnc_Type;

typedef struct SystemOutputMonitorAxes_Type
{	plcstring Label[81];
	unsigned char Index;
	unsigned long AxesDatAddress;
	enum SystemModeAxesTyp_Type Type;
	plcbit IsSpindle;
	float ActualPostion;
	plcstring UnitPositionLabel[81];
	float ActualVelocity;
	plcstring UnitVelocityLabel[81];
} SystemOutputMonitorAxes_Type;

typedef struct SystemOutputMonitor_Type
{	plcstring ModeLabel[81];
	unsigned char Mode;
	struct SystemOutputMonitorCnc_Type Cnc[1];
	struct SystemOutputMonitorAxes_Type Axes[13];
	plcbit Cooling;
	plcbit SpindleMoving;
	float SpindleMaximalVelocity;
	unsigned long SystemAddress;
} SystemOutputMonitor_Type;

typedef struct SystemOutput_Type
{	struct SystemOutputState_Type State;
	struct SystemOutputStatus_Type Status;
	struct SystemOutputMonitor_Type Monitor;
	struct Error_Type Error;
} SystemOutput_Type;

typedef struct System_Type
{	struct SystemInput_Type Input;
	struct SystemOutput_Type Output;
} System_Type;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/MotionHandling/SystemHandling/System.typ\\\" scope \\\"global\\\"\\n\"");

/* Additional IEC dependencies */
__asm__(".ascii \"iecdep \\\"Logical/MotionHandling/MotionGlobalSize.var\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_8_ */

