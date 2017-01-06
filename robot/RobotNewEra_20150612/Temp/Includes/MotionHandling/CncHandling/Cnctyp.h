/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_10_
#define _BUR_1479044160_10_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct CncInputConfigurationAxes_Type
{	plcstring UnitPositionLabel[81];
} CncInputConfigurationAxes_Type;

typedef struct CncInputConfiguration_Type
{	plcbit Active;
	plcstring Label[81];
	plcstring NcMapObjName[81];
	unsigned char Warnings;
	plcbit StopOnError;
	plcstring ErrorTextDataModulName[81];
	plcstring UnitFeedrateLabel[81];
	struct CncInputConfigurationAxes_Type Axes[15];
} CncInputConfiguration_Type;

typedef struct CncInputCommand_Type
{	unsigned char Enable;
	unsigned char InitCncPar;
	unsigned char InitCncSubjectPar;
	unsigned char SaveCncPar;
	unsigned char LoadCncPar;
	unsigned char CncSimulationOn;
	unsigned char CncSimulationOff;
	unsigned char StartSingleStep;
	unsigned char StopSingleStep;
	unsigned char SwitchOnRestart;
	unsigned char SwitchOffRestart;
	unsigned char SaveRestart;
	unsigned char SetRestart;
	unsigned char StartNcProgram;
	unsigned char StartNcBlock;
	unsigned char StartDryRun;
	unsigned char RestartInfo;
	unsigned char RestartProgram;
	unsigned char Halt;
	unsigned char Continue;
	unsigned char Stop;
	unsigned char EmergencyStop;
	unsigned char Acknowledge;
	unsigned char Reset;
	unsigned char SetZeroTable;
	unsigned char SetToolTable;
	unsigned char SetRParTable;
	unsigned char SetPositionMonitorMode;
	unsigned char ContinueDecoder;
	unsigned char LoadNcProgram;
	unsigned char UnloadNcProgram;
} CncInputCommand_Type;

typedef struct CncInputParameterTable_Type
{	plcstring ZeroTableName[81];
	plcstring ToolTableName[81];
	plcstring RParTableName[81];
} CncInputParameterTable_Type;

typedef struct CncInputParameterRestart_Type
{	plcstring RestartModuleName[13];
	plcstring NcInitProgramName[81];
	plcstring NcProgramName[81];
	unsigned char NcProgramStartMode;
	unsigned char Restart_Type;
	unsigned long BlockNumber;
	float Position;
	unsigned char Start_pos_typ;
	float S_ncprog;
	unsigned long ByteOffset;
} CncInputParameterRestart_Type;

typedef struct CncInputParamter_Type
{	float FeedrateOverride;
	float RapidOverride;
	plcstring NcInitProgramName[81];
	plcstring NcProgramName[81];
	signed long NcProgramStartPos;
	unsigned char NcProgramStartMode;
	unsigned char NcProgramUnloadMode;
	plcstring NcBlock[53];
	float DryRunWheelPosition;
	float DryRunWheelFactor;
	unsigned char DryRunMode;
	unsigned short InitCncSubjectPar;
	unsigned char PositionMonitorMode;
	struct CncInputParameterTable_Type Table;
	struct CncInputParameterRestart_Type Restart;
	plcbit ConfigOk;
	unsigned char CommandID;
	plcstring LoadCncParDataObjectName[81];
	plcstring SaveCncParDataObjectName[81];
} CncInputParamter_Type;

typedef struct CncInput_Type
{	struct CncInputConfiguration_Type Configuration;
	struct CncInputCommand_Type Command;
	struct CncInputParamter_Type Parameter;
} CncInput_Type;

typedef struct CncOutputState_Type
{	plcbit Disabled;
	plcbit Standby;
	plcbit Moving;
	plcbit Stopping;
	plcbit Errorstop;
} CncOutputState_Type;

typedef struct CncOutputStatus_Type
{	plcbit AccessOk;
	plcbit Ready;
	plcbit SingleStep;
	plcbit Halted;
	plcbit Simulation;
	plcbit DryRun;
	unsigned char PositionMonitorMode;
	unsigned char DecoderStatusSync;
	plcbit Busy;
	plcbit Error;
	unsigned long CncDatAddress;
} CncOutputStatus_Type;

typedef struct CncOutputMonitorNcProgram_Type
{	unsigned long Number;
	plcstring Name[81];
	unsigned long Position;
	float DefinedVelocity;
	unsigned short ToolNumber;
	unsigned short ZeroIndex;
} CncOutputMonitorNcProgram_Type;

typedef struct CncOutputMonitorNcBlock_Type
{	unsigned long Number;
	unsigned short Type;
	plcstring TextLast2[81];
	plcstring TextLast1[81];
	plcstring TextActual[81];
	plcstring TextNext1[81];
	plcstring TextNext2[81];
	float RemainingPathDistance;
	float PathLengthActual;
	float PathLengthNext1;
} CncOutputMonitorNcBlock_Type;

typedef struct CncOutputMonitorPath_Type
{	float ActualVelocity;
	float ActualPathLenght;
	float ActualRunTime;
	float MaximalVelocity;
} CncOutputMonitorPath_Type;

typedef struct CncOutputMonitorParamter_Type
{	unsigned long ExternalParameterAccessAddress;
	unsigned long MParameterAccessAddress;
	unsigned long MFunctionAccessAddress;
	unsigned short TFunctionValue;
	unsigned long SFunctionValue[4];
} CncOutputMonitorParamter_Type;

typedef struct CncOutputMonitorTable_Type
{	plcstring ZeroTableName[13];
	plcstring ToolTableName[13];
	plcstring RParTableName[13];
} CncOutputMonitorTable_Type;

typedef struct CncOutputMonitorAxes_Type
{	float Position;
	unsigned long AxesDatAddress;
} CncOutputMonitorAxes_Type;

typedef struct CncOutputMonitorRestart_Type
{	plcstring NcInitProgramName[81];
	plcstring NcProgramName[81];
	unsigned char NcProgramStartMode;
	unsigned char Restart_Type;
	unsigned long BlockNumber;
	float Position;
	unsigned long ByteOffset;
	float AxPosition[15];
	unsigned char Start_pos_type;
	float S_ncprog;
} CncOutputMonitorRestart_Type;

typedef struct CncOutputMonitor_Type
{	struct CncOutputMonitorNcProgram_Type NcProgram;
	struct CncOutputMonitorNcBlock_Type NcBlock;
	struct CncOutputMonitorPath_Type Path;
	struct CncOutputMonitorParamter_Type Parameter;
	struct CncOutputMonitorTable_Type Table;
	struct CncOutputMonitorAxes_Type Axes[15];
	struct CncOutputMonitorRestart_Type Restart;
	unsigned long CncAddress;
} CncOutputMonitor_Type;

typedef struct CncOutput_Type
{	struct CncOutputState_Type State;
	struct CncOutputStatus_Type Status;
	struct CncOutputMonitor_Type Monitor;
	struct Error_Type Error;
} CncOutput_Type;

typedef struct Cnc_Type
{	struct CncInput_Type Input;
	struct CncOutput_Type Output;
} Cnc_Type;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/MotionHandling/CncHandling/Cnc.typ\\\" scope \\\"global\\\"\\n\"");

/* Additional IEC dependencies */
__asm__(".ascii \"iecdep \\\"Logical/MotionHandling/MotionGlobalSize.var\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_10_ */

