(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Package: Motion
 * File: Axes.typ
 * Author: passaglial
 * Created: October 22, 2008
 ********************************************************************
 * Data types of package Motion
 ********************************************************************)

TYPE
	Axes_Type : 	STRUCT 
		Input : AxesInput_Type; (*Input structure*)
		Output : AxesOutput_Type; (*Output structure*)
	END_STRUCT;
	AxesInput_Type : 	STRUCT 
		Configuration : AxesInputConfiguration_Type; (*Configuration*)
		Command : AxesInputCommand_Type; (*Command*)
		Parameter : AxesInputParameter_Type; (*Parameter*)
	END_STRUCT;
	AxesInputCommand_Type : 	STRUCT 
		Enable : USINT; (*This command switches on the controller of the axis.*)
		InitAxisPar : USINT; (*This command initializes the axis parameters in the axis data structure.*)
		InitAxisSubjecPar : USINT; (*This command enables the user to selectively initialize structure elements from the axis data structure.*)
		SaveAxisPar : USINT; (*This command writes the axis parameters in the axis data structure to an init parameter module with the specified name "SaveAxisParDataObjectName".*)
		LoadAxisPar : USINT; (*This command loads the axis parameters from the specified init parameter module "LoadAxisParDataObjectName" to the axis data structure.*)
		Home : USINT; (*This command starts the homing movement of an axis according to the homing parameters defined in the INIT Parameter Module.*)
		HomeAutoPosition : USINT; (*This command starts a direct homing to the Input.Parameter.AutoPosition*)
		Simulation : USINT; (*This command can be used to turn simulation mode on or off for a drive.*)
		MoveAbsolute : USINT; (*This command commands a controlled motion at a specific absolute position.*)
		MoveAdditive : USINT; (*This command commands a controlled motion of a specific relative distance that is added to the last commanded position.*)
		MoveVelocity : USINT; (*This command commands an "Axis" to move a specified velocity in a specific direction.*)
		CyclicPosition : USINT; (*This command acivates the cyclic position mode of the axis initialized by the default parameter linked to the Input.Parameter.CyclicPosition.*)
		StartDryRun : USINT; (*This command activates the handwheel behaviour of th axis linked to the Input.Parameter.DryRunWheelPosition.*)
		Stop : USINT; (*This command commands a controlled motion stop and transfers the axis to the state Stopping.*)
		EmergencyStop : USINT; (*This command commands a controlled motion stop and transfers the axis to the state Stopping with the emergency parameters in the axis data structure*)
		ErrorAcknowledge : USINT; (*This command is used to acknowledge the current axis error.*)
		Reset : USINT; (*This command makes a transition in the State Diagram from Errorstop to Standstill or Disabled by resetting all internal axis related errors.*)
		WriteAxisPar : USINT;
	END_STRUCT;
	AxesInputConfiguration_Type : 	STRUCT 
		Active : BOOL; (*This bit determines if an axis is part of the application or not.*)
		Label : STRING[LABEL_SIZE]; (*Label is the identifier for external use like the visualization.*)
		NcMapObjName : STRING[LABEL_SIZE]; (*Name (character address respectively string) of NC Object (corresponds to "NC Object Name" in an NC Deployment Table).*)
		ErrorDatObjName : STRING[LABEL_SIZE]; (*Name of error text module.*)
		UnitPositionLabel : STRING[LABEL_SIZE]; (*Label for the Unit of the Position.*)
		UnitPositionFaktor : REAL; (*Factor for scaling the Input.Parameter.Distance and Input.Parameter.Position to axis units.*)
		UnitVelocityLabel : STRING[LABEL_SIZE]; (*Label for the Unit of the Velocity.*)
		UnitVelocityFaktor : REAL; (*Faktor for scaling the Input.Parameter.Velocity and Input.Parameter.Acceleration and Input.Parameter.Deceleration to axis units.*)
		DistanceToStopBeforeSW : DINT; (*Distance to stop before software limits for axis*)
		PDOReadParID : ARRAY[0..3]OF UINT;
		PDOReadParType : ARRAY[0..3]OF UINT;
		PDOWriteParID : ARRAY[0..3]OF UINT;
		PDOWriteParType : ARRAY[0..3]OF UINT;
	END_STRUCT;
	AxesInputParameter_Type : 	STRUCT 
		Position : REAL; (*Target position for the motion [Units / UnitPositionFaktor].*)
		HomePosition : REAL; (*Target position for Command.Home*)
		AutoPosition : REAL; (*Target position for Command.HomeAutoPosition.*)
		CyclicPosition : REAL; (*Cyclic Position for Command.CyclicPosition.*)
		Distance : REAL; (*Relative distance for the motion [Units / UnitPositionFaktor].*)
		Direction : USINT; (*Movement direction: / mcPOSITIVE_DIR ... 0 / mcNEGATIVE_DIR ... 1 / mcCURRENT_DIR ... 2 / mcSHORTEST_WAY ... 3 / mcEXCEED_PERIOD ... 8 / + mcAUTOMAT_POS ... 100*)
		Velocity : REAL; (*Value of maximum velocity [Units/sec / UnitVelocityFaktor] (not necessarily reached).*)
		Acceleration : REAL; (*Value of maximum acceleration [Units/sec?/ UnitVelocityFaktor] (not necessarily reached).*)
		Deceleration : REAL; (*Value of maximum deceleration [Units/sec?/ UnitVelocityFaktor] (not necessarily reached).*)
		Override : REAL; (*Override factor for the velocity. / Range: 0.0 - 2.0 / Resolution: 0.0001 / Important: Override factor 0.0 for "VelFactor" is possible but stops the axis without bringing it to the state Standstill !*)
		DryRunWheelPosition : REAL; (*Target position for the handwheel bahviour [Units * DryRunWheelFactor * (if DryRunInvertWheel = 1) -1].*)
		DryRunWheelFactor : REAL; (*Factor for DryRunWheelPosition (0.0 for "DryRunWheelFactor" is possible but stops the axis without bringing it to the state Standstill!).*)
		DryRunInvertWheel : BOOL; (*Inverts the DryRunWheelPosition for the axis.*)
		InitAxisSubjectPar : UINT; (*Subject of the axis structure whose data should be initialized: / ncDIG_IN / ncENCODER_IF / ncLIMITS / ncCONTROLLER / ncSTOP / ncHOMING / ncGLOBAL / ncBASIS_MOVE / ncBASIS_TRG_STOP.*)
		SimulationCommand : UINT; (*Switch on simulation mode: mcMOTOR or Switch off simulation mode:  mcSIMULATION_OFF.*)
		ConfigOk : BOOL; (*Startup condition: Is true if the Config task successfully wrotes the configuration (has to be true to control the axis)*)
		PDOWriteValue : ARRAY[0..3]OF REAL;
		CommandID : USINT;
		JoltTime : REAL; (*Jolt Time for axis*)
		SaveAxisParDataObjectName : STRING[LABEL_SIZE]; (*Name of the save init parameter module.*)
		LoadAxisParDataObjectName : STRING[LABEL_SIZE]; (*Name of the load init parameter module.*)
		WriteParID : UINT;
		WriteParIDText : STRING[33];
	END_STRUCT;
	AxesOutput_Type : 	STRUCT 
		State : AxesOutputState_Type; (*State*)
		Status : AxesOutputStatus_Type; (*Status*)
		Monitor : AxesOutputMonitor_Type; (*Monitor*)
		Error : Error_Type; (*Error*)
	END_STRUCT;
	AxesOutputMonitor_Type : 	STRUCT 
		Position : REAL; (*Actual Position of the axis [Units / UnitPositionFaktor]*)
		CyclicPosition : REAL; (*Actual Position*)
		Velocity : REAL; (*Actual Position of the axis [Units/s / UnitVelocityFaktor]*)
		InPosition : BOOL; (*Is true after successful MoveAbsolute or MoveAdditive movemet*)
		InVelocity : BOOL; (*Is true when axis reaches the velocity defined by MoveVelocity*)
		MaximalVelocity : REAL; (*Maximal velocity*)
		AxesAddress : UDINT; (*Address of the Axes structure to control the axes from other tasks (Datatyp for access = Axes_Type)*)
		MCAxesAddress : UDINT; (*Address of the PLCopen FBKs (Datatyp for access = MCAxes_Type) *)
		PDOReadValue : ARRAY[0..4]OF REAL;
		DecoupledPosition : REAL;
	END_STRUCT;
	AxesOutputState_Type : 	STRUCT 
		Errorstop : BOOL; (*An error has occurred. Use to acknowledge errors. Once all errors have been acknowledged, the state will be Disabled or Standstill (after reset). If the error caused power to be turned off to the drive, the state will be Disabled, if not, it will be Standstill. See State Diagram.*)
		Disabled : BOOL; (*Enable has not powered the axis, or an error had been acknowledged by and the axis has been turned off. See State Diagram.*)
		Stopping : BOOL; (*Stop is active. See State Diagram.*)
		Standstill : BOOL; (*Motion is not active on the drive. Axis will enter state when successfully calling Enable from Disabled. See State Diagram.*)
		DiscreteMotion : BOOL; (*Axis is in motion due to one of the following FBs / Commands: MC_MoveAbsolute / MC_MoveAdditive / MC_BR_MoveAbsoluteTriggStop / MC_BR_MoveAdditiveTriggStop / MC_BR_EventMoveAbsolute  / "Mode" = mcONCE) / MC_BR_EventMoveAdditive ("Mode" = mcONCE) / MC_Halt.html / See State Diagram.*)
		ContinuousMotion : BOOL; (*Axis is in motion due to one of the following FBs / Commands: MC_MoveVelocity / MC_BR_MoveVelocityTriggStop / MC_BR_EventMoveAbsolute ("Mode" = mcCYCLIC or mcCYCLIC_ALL_EVENTS) / MC_BR_EventMoveAdditive ("Mode" = mcCYCLIC or mcCYCLIC_ALL_EVENTS) / MC_BR_EventMoveVelocity / Axis will enter this state also after starting one of the following FBs: / MC_CamOut / MC_GearOut / MC_BR_CyclicPosition / See State Diagram.*)
		SyncronizedMotion : BOOL; (*Axis is synchronized with another axis due to starting one of the following FBs: MC_CamIn / MC_GearIn / MC_GearInPos / MC_BR_AutControl / MC_BR_CamDwell / MC_BR_AutoCamDwell / See State Diagram.*)
		Homing : BOOL; (*MC_Home has started homing the axis. See State Diagram.*)
	END_STRUCT;
	AxesOutputStatus_Type : 	STRUCT 
		AccessOk : BOOL; (*shows if the access was successful*)
		Simulation : BOOL; (*shows if the simulation mode is active*)
		NetworkInit : BOOL; (*shows if the network is initialized*)
		HomeSwitch : BOOL; (*shows if the digital reference switch input is active*)
		PosHWSwitch : BOOL; (*shows if the positive hardware end switch is active*)
		NegHWSwitch : BOOL; (*shows if the negative hardware end switch is active*)
		Trigger1 : BOOL; (*shows if the first trigger input is active*)
		Trigger2 : BOOL; (*shows if the second trigger input is active*)
		DriveEnable : BOOL; (*shows if the enable input is closed*)
		ControllerReady : BOOL; (*shows if the controller is ready to be turned on*)
		ControllerStatus : BOOL; (*shows if the controller is turned on*)
		HomingOk : BOOL; (*shows if the axis is referenced*)
		AxisError : BOOL; (*shows if at least one error or warning has occurred*)
		LagWarning : BOOL; (*shows if the lag error has exceeded the limit value specified for a warning*)
		CommandError : BOOL; (*shows if a command was not allowed in current state, or command parameters were wrong*)
		AxesDatAddress : UDINT; (*Address to access with the ACP10 axes pointer (Datatype = ACP10_AXIS_typ).*)
		DryRunActive : BOOL; (*shows if DryRun is active.*)
		Busy : BOOL; (*shows if and not cyclic executed FUB is busy*)
	END_STRUCT;
	MCAxes_Type : 	STRUCT 
		Status : MC_DRIVESTATUS_TYP;
		Power : MC_Power;
		Stop : MC_Stop;
		Home : MC_Home;
		Reset : MC_Reset;
		ReadAxisError : MC_ReadAxisError;
		ReadStatus : MC_ReadStatus;
		MoveVelocity_0 : MC_MoveVelocity;
		MoveVelocity_1 : MC_MoveVelocity;
		MoveAbsolute_0 : MC_MoveAbsolute;
		MoveAbsolute_1 : MC_MoveAbsolute;
		MoveAdditive_0 : MC_MoveAdditive;
		MoveAdditive_1 : MC_MoveAdditive;
		Halt : MC_Halt;
		BR_InitAxisPar : MC_BR_InitAxisPar;
		BR_SaveAxisPar : MC_BR_SaveAxisPar;
		BR_LoadAxisPar : MC_BR_LoadAxisPar;
		BR_InitAxisSubjectPar : MC_BR_InitAxisSubjectPar;
		BR_ReadDriveStatus : MC_BR_ReadDriveStatus;
		BR_Simulation : MC_BR_Simulation;
		SetOverride : MC_SetOverride;
		BR_MoveCyclicPosition : MC_BR_MoveCyclicPosition;
		BR_ReadCyclicPosition : MC_BR_ReadCyclicPosition;
		BR_InitCyclicRead_0 : MC_BR_InitCyclicRead;
		BR_InitCyclicRead_1 : MC_BR_InitCyclicRead;
		BR_InitCyclicRead_2 : MC_BR_InitCyclicRead;
		BR_InitCyclicRead_3 : MC_BR_InitCyclicRead;
		BR_InitCyclicWrite_0 : MC_BR_InitCyclicWrite;
		BR_InitCyclicWrite_1 : MC_BR_InitCyclicWrite;
		BR_InitCyclicWrite_2 : MC_BR_InitCyclicWrite;
		BR_InitCyclicWrite_3 : MC_BR_InitCyclicWrite;
		BR_WriteParID : MC_BR_WriteParIDText;
		BR_GetErrorText : MC_BR_GetErrorText;
		ErrorRecord : MC_ERRORRECORD_REF;
	END_STRUCT;
END_TYPE
