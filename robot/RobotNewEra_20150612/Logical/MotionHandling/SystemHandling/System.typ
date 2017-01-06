(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Program: System
 * File: System.typ
 * Author: radaka
 * Created: February 18, 2009
 ********************************************************************
 * Local data types of program System
 ********************************************************************)

TYPE
	System_Type : 	STRUCT 
		Input : SystemInput_Type; (*Input structure*)
		Output : SystemOutput_Type; (*Output structure*)
	END_STRUCT;
	SystemInConfModeAxBehav_Type : 
		(
		STOP_AXES, (*Axis with this behavior will be stopped during modechange.*)
		IGNORE_AXES, (*Axes with this behavior will be ingnored during Modechange. This is the only behavior without stopping the axis*)
		HOMEAUTO_AXES, (*Axes with this behavior will be direct homed to their AutoPosition parameter during Modechange*)
		HOMEAUTO_MOVE_AXES, (*Axes with this behavior will be direct homed to their AutoPosition Paramter and then ablsolute moved to the Position parameter during Modechange*)
		HOMEAUTO_CYCLICPOS_AXES, (*Axes with this behavior will be direct homed to their AutoPosition Paramter and then linked to their CyclicPosition parameter during Modechange*)
		HOMEAUTO_MOVE_CYCLICPOS_AXES, (*Axes with this behavior will be direct homed to their AutoPosition Paramter, absolute moved to the Position parameter and then linked to their CyclicPosition parameter during Modechange*)
		MOVE_AXES, (*Axes with this behavior will be absolute moved to their Position parameter during Modechange*)
		MOVE_HOMEAUTO_AXES, (*Axes with this behavior will be absolute moved to their Position parameter and then direct homed to their AutoPosition parameter during Modechange*)
		MOVE_HOMEAUTO_CYCLICPOS_AXES, (*Axes with this behavior will be absolute moved to their Position parameter, direct homed to their AutoPosition parameter and then linked to their CyclicPosition parameter during Modechange*)
		MOVE_CYCLICPOS_AXES, (*Axes with this behavior will be absolute moved to their Position parameter and then linked to their CyclicPosition parameter during Modechange*)
		CYCLICPOS_AXES (*Axes with this behavior will be linked to their CyclicPosition parameter during Modechange*)
		);
	SystemInConfModeCncBehav_Type : 
		(
		STOP_CNC,
		IGNORE_CNC
		);
	SystemInput_Type : 	STRUCT 
		Configuration : SystemInputConfiguration_Type; (*Configuration*)
		Command : SystemInputCommand_Type; (*Command*)
		Parameter : SystemInputParamter_Type; (*Parameter*)
	END_STRUCT;
	SystemInputCommand_Type : 	STRUCT 
		Init : USINT; (*This command initialize all objects of the system*)
		Enable : USINT; (*This command enables all object of the system*)
		Home : USINT; (*This command homes all axes in order defined in the HomeOrder of the axes*)
		ChangeMode : USINT; (*This command changes the mode of the system*)
		EmergencyStop : USINT; (*This command commands a controlled motion stop and transfers the cnc and axes to the state Stopping with the emergency parameters in the cnc and axes daa structure.*)
		Stop : USINT; (*This command commands a controlled motion stop and transfers the cnc and axes to the state Stopping.*)
		Reset : USINT; (*This command makes a transition in the State Diagram from Errorstop to Standstill or Disabled by resetting all internal object errors.*)
		Acknowledge : USINT; (*This command is used to acknowledge the current objects errors.*)
		StartService : USINT; (*This command sets the system into service mode. Global control of the single objects is deactivated*)
		StopService : USINT; (*This command makes a transition in the State Diaram from Service to Disabled or Standstill.*)
		StartSimulation : USINT; (*This command can be used to stwitch the simulation on (SIMULATE_CNC or SIMULATE_MOTOR). *)
		StopSimulation : USINT; (*This command can be used to switch the simulation off.*)
	END_STRUCT;
	SystemInputConfigMode_Type : 	STRUCT 
		Label : STRING[LABEL_SIZE]; (*Label is the identifier for external use like the visualization.*)
		Cnc : ARRAY[0..MAX_CNC_MINUS_ONE]OF SystemInputConfigModeCnc_Type; (*Cnc configuration*)
		Axes : ARRAY[0..MAX_AX_MINUS_ONE]OF SystemInputConfigModeAxes_Type; (*Axes configuration*)
	END_STRUCT;
	SystemInputConfigModeAxes_Type : 	STRUCT 
		Index : USINT; (*Index of the axis in the Axes_typ.*)
		Type : SystemModeAxesTyp_Type; (*Type of the axis:   CNC_AXES / SPINDLE_0_AXES / SPINDLE_1_AXES / SPINDLE_2_AXES / SPINDLE_3_AXES / JOG_AXES / AUXILIARY_AXES / NO_TYPE.*)
		Behavior : SystemInConfModeAxBehav_Type; (*Behaviour of the axis:  HOME_AUTOPOS_AXES / CYCLIC_POSITION_AXES / STOP_AXES / IGNORE_AXES.*)
		ResetJoltTime : BOOL; (*This is a flag to automatically reset jolt time to zero when exiting jogging mode*)
		Visible : BOOL; (*This bit decides if the axes will be visible in the system monitor.*)
	END_STRUCT;
	SystemInputConfigModeCnc_Type : 	STRUCT 
		Index : USINT; (*Index of the cnc in the Cnc_typ.*)
		Behavior : SystemInConfModeCncBehav_Type; (*Behaviour of the cnc: STOP_CNC / IGNORE_CNC.*)
		Visible : BOOL; (*This bit decides if the cnc will be visible in the system monitor.*)
	END_STRUCT;
	SystemInputConfigSystemAxes_Type : 	STRUCT 
		Index : USINT; (*Index of the axis in the Axes_typ*)
		HomeOrder : USINT; (*Position in the HomeOrder when calling the System.Input.Command.Home*)
		IsSpindle : BOOL; (*Information Flag for Visualizations*)
		IsEncoder : BOOL;
	END_STRUCT;
	SystemInputConfiguration_Type : 	STRUCT 
		Active : BOOL; (*This bit determines if an system is part of the application or not.*)
		Label : STRING[LABEL_SIZE]; (*Label is the identifier for external use like the visualization.*)
		SystemPowerAxesIndex : ARRAY[0..MAX_AX_MINUS_ONE]OF USINT; (*Index of the power supply modules*)
		SystemAxes : ARRAY[0..MAX_AX_MINUS_ONE]OF SystemInputConfigSystemAxes_Type; (*Axes basic configuration, which axis are part of the system*)
		SystemCncIndex : ARRAY[0..MAX_CNC_MINUS_ONE]OF USINT; (*Cnc basic configuration, which cnc system is part of the system*)
		Mode : ARRAY[0..MAX_MODE_MINUS_ONE]OF SystemInputConfigMode_Type; (*Mode configuration*)
	END_STRUCT;
	SystemInputParameterSimMode_Type : 
		(
		SIMULATE_CNC, (*This mode switches only the cnc into simulation mode*)
		SIMULATE_MOTOR (*This mode switches the axes into simulation mode*)
		);
	SystemInputParamter_Type : 	STRUCT 
		Mode : USINT; (* Mode into the system should be changed *)
		Cooling : SystemInputParamterCooling_Type; (* Cooling parameters *)
		Spindle : SystemInputParamterSpindle_Type; (* Spindle parameters *)
		SimulationMode : SystemInputParameterSimMode_Type; (* Simulation mode (SIMULATE_CNC / SIMULATE_MOTOR) *)
		ConfigOk : BOOL; (* Flag from the configuration, it is set when the system configuration was written *)
		AxesAddress : UDINT; (* Address of the axes structure *)
		CncAddress : UDINT; (* Address of the cnc structure *)
		CommandID : USINT; (* CommandID for axes or cnc commands from the system automaticly increased to be to differ betweeen the different systems *)
	END_STRUCT;
	SystemInputParamterCooling_Type : 	STRUCT 
		Mode : SystemInputParamterMode_Type; (* Cooling mode ( FORCE_ON / FORCE_OFF / PROGRAM_DEPENDED ) *)
	END_STRUCT;
	SystemInputParamterMode_Type : 
		(
		FORCE_OFF, (* Cooling or spindles are forced off  *)
		FORCE_ON, (* Colling or spindles are forced on *)
		PROGRAM_DEPENDED (* Cooling or spindles are running program depended *)
		);
	SystemInputParamterSpindle_Type : 	STRUCT 
		Mode : SystemInputParamterMode_Type; (* Spindle mode ( FORCE_ON / FORCE_OFF / PROGRAM_DEPENDED ) *)
		SpindleVelocity : ARRAY[0..3]OF REAL; (* Spindle velocities for the mode PROGRAM_DEPENDED *)
		Override : REAL; (* Spindle override *)
	END_STRUCT;
	SystemModeAxesTyp_Type : 
		(
		NO_TYPE, (* The axes have no type *)
		CNC_AXES, (* The axes with that type get their position from the cnc system ( relative, absolute ... coordinates ) *)
		SPINDLE_0_AXES, (* The axes with that type are spindle0 axes depending movements on the spindle mode and s0 word of the cnc system *)
		SPINDLE_1_AXES, (* The axes with that type are spindle1 axes depending movements on the spindle mode and s1 word of the cnc system *)
		SPINDLE_2_AXES, (* The axes with that type are spindle2 axes depending movements on the spindle mode and s2 word of the cnc system *)
		SPINDLE_3_AXES, (* The axes with that type are spindle3 axes depending movements on the spindle mode and s3 word of the cnc system *)
		JOG_AXES, (* The axes with that type are jogable axes *)
		AUXILIARY_AXES (* The axes with that type are auxiliary axes *)
		);
	SystemOutput_Type : 	STRUCT 
		State : SystemOutputState_Type; (* State information *)
		Status : SystemOutputStatus_Type; (* Status information *)
		Monitor : SystemOutputMonitor_Type; (* Monitor information *)
		Error : Error_Type; (* Error information *)
	END_STRUCT;
	SystemOutputMonitor_Type : 	STRUCT 
		ModeLabel : STRING[LABEL_SIZE]; (* Actual mode label *)
		Mode : USINT; (* Actual mode index *)
		Cnc : ARRAY[0..MAX_CNC_MINUS_ONE]OF SystemOutputMonitorCnc_Type; (* Cnc monitor information *)
		Axes : ARRAY[0..MAX_AX_MINUS_ONE]OF SystemOutputMonitorAxes_Type; (* Axes monitor information *)
		Cooling : BOOL; (* Cooling status *)
		SpindleMoving : BOOL; (* Spindle status *)
		SpindleMaximalVelocity : REAL; (* Maximal spindle information *)
		SystemAddress : UDINT; (* Address of the system (System_Type) *)
	END_STRUCT;
	SystemOutputMonitorAxes_Type : 	STRUCT 
		Label : STRING[LABEL_SIZE]; (* Axes label *)
		Index : USINT; (* Axes index (if no axes is active in that mode then the index is NO_PART_OF_SYSTEM) *)
		AxesDatAddress : UDINT; (* Address of axes ACP10AXIS_typ *)
		Type : SystemModeAxesTyp_Type; (* Axes Type (CNC_AXES / SPINDLE_0_AXES / SPINDLE_1_AXES / SPINDLE_2_AXES / SPINDLE_3_AXES / JOG_AXES / AUXILIARY_AXES / NO_TYPE) *)
		IsSpindle : BOOL; (* Spindle flag for visualization *)
		ActualPostion : REAL; (* Actual position depends of the type *)
		UnitPositionLabel : STRING[LABEL_SIZE]; (* Label of the axis position unit *)
		ActualVelocity : REAL; (* Actual velocity *)
		UnitVelocityLabel : STRING[LABEL_SIZE]; (* Label of the axis velocity unit *)
	END_STRUCT;
	SystemOutputMonitorCnc_Type : 	STRUCT 
		Active : BOOL; (* Shows if cnc system is active in the actual mode *)
		Label : STRING[LABEL_SIZE]; (* Label of the cnc system *)
		Index : USINT; (* Index of the cnc system (if no cnc system is active in that mode then the index is NO_PART_OF_SYSTEM) *)
		CncDatAddress : UDINT; (* Address of the cnc system ARNC0CNC_typ *)
	END_STRUCT;
	SystemOutputState_Type : 	STRUCT 
		Disabled : BOOL; (* State Disabled see Statediagram *)
		Standby : BOOL; (* State Standby see Statediagram *)
		Homing : BOOL; (* State Homing see Statediagram *)
		Active : BOOL; (* State Active see Statediagram *)
		Stopping : BOOL; (* State Stopping see Statediagram *)
		Errorstop : BOOL; (* State Errorstop see Statediagram *)
		Service : BOOL; (* State Service see Statediagram *)
	END_STRUCT;
	SystemOutputStatus_Type : 	STRUCT 
		AccessOk : BOOL; (* All system objects accessed *)
		Busy : BOOL; (* System is busy *)
		HomingOk : BOOL; (* All axes are homed *)
		NetworkInit : BOOL; (* All axes successfulle connected *)
		Booting : BOOL; (* System is booting *)
		Ready : BOOL; (*shows if the controller is ready to be turned on*)
		ControllerStatus : USINT; (*shows if the controllers are all turned on / turned off / not all turned on*)
		CommandError : BOOL; (* System command ignored *)
	END_STRUCT;
END_TYPE
