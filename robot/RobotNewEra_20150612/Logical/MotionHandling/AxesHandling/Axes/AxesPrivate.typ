(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Program: Axes
 * File: Axes.typ
 * Author: B&R
 * Created: February 09, 2009
 ********************************************************************
 * Local data types of program Axes
 ********************************************************************)

TYPE
	AxesDryRunSteps_Type : 
		(
		AXESDRYRUN_START,
		AXESDRYRUN_RUN
		);
	AxesPrivateDryRun_Type : 	STRUCT 
		ActualDryRunWheelPosition : REAL;
		ActualPosition : REAL;
		DryRunWheelFactor : REAL;
		DryRunWheelFactorOld : REAL;
		WheelStartOffset : REAL;
		CalcDryRunWheelPosition : REAL;
		CalcDryRunWheelPositionOld : REAL;
		Step : AxesDryRunSteps_Type;
		InvertWheelOld : BOOL;
		OnLimitPosition : BOOL;
		TimeDelayTon : TON;
		Stopping : BOOL;
		MC_MoveAbsolute_0 : MC_MoveAbsolute;
		MC_MoveAbsolute_1 : MC_MoveAbsolute;
	END_STRUCT;
	AxesPrivateNetTimoutStep_Type : 
		(
		AXESNETTIMEOUT_CHECK_INIT,
		AXESNETTIMEOUT_CHECK_RUNTIME,
		AXESNETTIMEOUT_ERROR_INIT,
		AXESNETTIMEOUT_ERROR_RUNTIME
		);
	AxesPrivateCommandErrorStep_Type : 
		(
		AXESCOMMANDERROR_CHECK,
		AXESCOMMANDERROR_ERROR
		);
	AxesPrivateActionRequest_Type : 
		(
		AX_CMD_READY := 0,
		AX_CMD_GLOBAL_INIT,
		AX_CMD_SUBJECT_INIT,
		AX_CMD_ABS_MOVE,
		AX_CMD_ADD_MOVE,
		AX_CMD_VEL_MOVE,
		AX_CMD_HOMING,
		AX_CMD_SW_CTRL_OFF,
		AX_CMD_SW_CTRL_ON,
		AX_CMD_SW_SIMULATION_OFF,
		AX_CMD_SW_SIMULATION_ON,
		AX_CMD_CAM_PROF_LINK,
		AX_CMD_CAM_PROF_INIT,
		AX_CMD_CAM_PROF_START,
		AX_CMD_ESTOP,
		AX_CMD_STOP,
		AX_CMD_ERROR_STOP,
		AX_CMD_ERROR_ACK,
		AX_CMD_GLOBAL_SAVE,
		AX_CMD_GLOBAL_LOAD
		);
	AxesPrivateActionStep_Type : 
		(
		AX_NETWORK_INIT,
		AX_COMMAND := 10,
		AX_SW_CTRL_OFF_STOP_MOVE,
		AX_W_CTRL_OFF_STOP_MOVE,
		AX_SW_CTRL_OFF,
		AX_W_CTRL_OFF,
		AX_SW_CTRL_ON,
		AX_W_CTRL_ON,
		AX_GLOBAL_INIT,
		AX_W_GLOBAL_INIT,
		AX_SUBJECT_INIT,
		AX_W_SUBJECT_INIT,
		AX_START_HOMING,
		AX_W_HOME_OK,
		AX_SW_SIMULATION_ON,
		AX_W_SIMULATION_ON,
		AX_SW_SIMULATION_OFF,
		AX_W_SIMULATION_OFF,
		AX_START_ABS_MOVE,
		AX_START_ADD_MOVE,
		AX_START_VEL_MOVE,
		AX_W_BASIS_MOVE,
		AX_MOVE_ESTOP,
		AX_MOVE_STOP,
		AX_W_MOVE_STOP,
		AX_CAM_PROF_INIT,
		AX_CAM_PROF_LINK,
		AX_CAM_PROF_START,
		AX_W_CAM_PROF_START,
		AX_ERROR_STOP,
		AX_W_ERROR_STOP,
		AX_ERROR_CONTROLLER_OFF,
		AX_W_ERROR_CONTROLLER_OFF,
		AX_ERROR_TEXT,
		AX_ERROR_QUIT,
		AX_ERROR_TST,
		AX_GLOBAL_SAVE,
		AX_W_GLOBAL_SAVE,
		AX_GLOBAL_LOAD,
		AX_W_GLOBAL_LOAD
		);
	AxesPrivateStateStep_Type : 
		(
		STATE_INIT,
		STATE_W_INIT,
		STATE_AXIS_PAR,
		STATE_DISABLED := 10,
		STATE_ENABLE_ON,
		STATE_W_ENABLE_ON,
		STATE_W_ENABLE_OFF,
		STATE_STANDSTILL,
		STATE_HOMING,
		STATE_W_HOMING,
		STATE_MOVE_ABS,
		STATE_W_MOVE_ABS,
		STATE_W_MOVE_ABS_CNC,
		STATE_MOVE_ADD,
		STATE_W_MOVE_ADD,
		STATE_W_MOVE_ADD_CNC,
		STATE_MOVE_VEL,
		STATE_W_MOVE_VEL,
		STATE_W_MOVE_VEL_CNC,
		STATE_STOPPING,
		STATE_STOPPING_CNC,
		STATE_ERRORSTOP
		);
	AxesPrivate_Type : 	STRUCT 
		AccessOk : BOOL;
		AccessStatus : UINT;
		AxesDatAddress : UDINT;
		NetTimeoutStep : AxesPrivateNetTimoutStep_Type;
		NetTimeoutNetTimer : UDINT;
		NetInitOk : BOOL;
		CommandErrorID : UINT;
		CommandErrorName : STRING[20];
		CommandErrorStep : AxesPrivateCommandErrorStep_Type;
		CommandError : BOOL;
		UnitfaktorOk : BOOL;
		HomeAutoPosition : BOOL;
		TempHomeDefaultPosition : DINT;
		TempHomeDefaultMode : USINT;
		DryRun : AxesPrivateDryRun_Type;
		ActionRequest : AxesPrivateActionRequest_Type;
		ActionStep : AxesPrivateActionStep_Type;
		ActionStatus : UINT;
		StateStep : AxesPrivateStateStep_Type;
		Resetting : BOOL;
		MessageCountOld : USINT;
		Error1 : Error_Type;
		Error : Error_Type;
	END_STRUCT;
END_TYPE
