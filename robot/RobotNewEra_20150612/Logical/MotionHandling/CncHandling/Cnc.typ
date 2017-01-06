(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Program: Cnc
 * File: Cnc.typ
 * Author: radaka
 * Created: February 16, 2009
 ********************************************************************
 * Local data types of program Cnc
 ********************************************************************)

TYPE
	Cnc_Type : 	STRUCT 
		Input : CncInput_Type; (*Input structure*)
		Output : CncOutput_Type; (*Output structure*)
	END_STRUCT;
	CncInput_Type : 	STRUCT 
		Configuration : CncInputConfiguration_Type; (*Configuration*)
		Command : CncInputCommand_Type; (*Command*)
		Parameter : CncInputParamter_Type; (*Parameter*)
	END_STRUCT;
	CncInputCommand_Type : 	STRUCT 
		Enable : USINT; (*This command brings the cnc to state standstill, including a global initalisation*)
		InitCncPar : USINT; (*This command initializes the cnc parameters in the cnc data structure.*)
		InitCncSubjectPar : USINT; (*This command enables the user to selectively initialize structure elements from the cnc data structure.*)
		SaveCncPar : USINT; (*This command writes the cnc parameters in the cnc data structure to an init parameter module with the specified name "SaveCncParDataObjectName".*)
		LoadCncPar : USINT; (*This command loads the cnc parameters from the specified init parameter module "LoadCncParDataObjectName" to the cnc data structure.*)
		CncSimulationOn : USINT; (*This command can be used to turn simulation mode on.*)
		CncSimulationOff : USINT; (*This command can be used to turn simulation mode off.*)
		StartSingleStep : USINT; (*Switch On "Single Step" Operating Mode.*)
		StopSingleStep : USINT; (*Switch Off "Single Step" Operating Mode.*)
		SwitchOnRestart : USINT; (*Switch On Saving RESTART INFO.*)
		SwitchOffRestart : USINT; (*Switch Off Saving RESTART INFO.*)
		SaveRestart : USINT; (*Save RESTART INFO in a Data Module.*)
		SetRestart : USINT; (*Set Data from Data Module as RESTART INFO.*)
		StartNcProgram : USINT; (*Start NC Program.*)
		StartNcBlock : USINT; (*Start NC Block*)
		StartDryRun : USINT; (*Start DryRun (HandWheel behaviour)*)
		RestartInfo : USINT; (*Determine RESTART INFO.*)
		RestartProgram : USINT; (*RESTART of an NC Program.*)
		Halt : USINT; (*Interrupt Movement with "Halt".*)
		Continue : USINT; (*Continue Movement after "Halt" or halting during "Single Step".*)
		Stop : USINT; (*Stopping a Movement.*)
		EmergencyStop : USINT; (*Stopping a Movement with E-Stop.*)
		Acknowledge : USINT; (*Acknowledge Current Message Record.*)
		Reset : USINT; (*This command makes a transition in the State Diagram from Errorstop to Standstill or Disabled by resetting all internal cnc related errors.*)
		SetZeroTable : USINT; (*Set Data Module as Zero Point Offset Table.*)
		SetToolTable : USINT; (*Set Data Module as Tool Data Table.*)
		SetRParTable : USINT; (*Set Data Module as R Parameter Table.*)
		SetPositionMonitorMode : USINT; (*With this command, the desired display mode of the axis positions in the CNC monitor is changed.*)
		ContinueDecoder : USINT; (*Continue Decoder with SYNC Command*)
		LoadNcProgram : USINT; (*The NC program specified by NcProgramName is parsed and ?if no errors occur ?is saved to the main memory of Runtime Target*)
		UnloadNcProgram : USINT; (*The NC program indicated by NcProgramName is removed from memory*)
	END_STRUCT;
	CncInputConfiguration_Type : 	STRUCT 
		Active : BOOL; (*This bit determines if a cnc is part of the application or not.*)
		Label : STRING[LABEL_SIZE]; (*Label is the identifier for external use like the visualization.*)
		NcMapObjName : STRING[LABEL_SIZE]; (*Name (character address respectively string) of NC Object (corresponds to "NC Object Name" in an NC Deployment Table).*)
		Warnings : USINT; (*ncON Switch On Error Messages with Class 0 / ncOFF Switch Off Error Messages with Class 0*)
		StopOnError : BOOL; (*Determines if the cnc should be stopped in case of an object error.*)
		ErrorTextDataModulName : STRING[LABEL_SIZE]; (*Name of error text module.*)
		UnitFeedrateLabel : STRING[LABEL_SIZE];
		Axes : ARRAY[0..14]OF CncInputConfigurationAxes_Type; (*Axes configuration*)
	END_STRUCT;
	CncInputConfigurationAxes_Type : 	STRUCT 
		UnitPositionLabel : STRING[LABEL_SIZE]; (*Label of the several axes position unit*)
	END_STRUCT;
	CncInputParameterTable_Type : 	STRUCT 
		ZeroTableName : STRING[LABEL_SIZE]; (*Name of the NC Data Object.*)
		ToolTableName : STRING[LABEL_SIZE]; (*Name of the NC Data Object.*)
		RParTableName : STRING[LABEL_SIZE]; (*Name of the NC Data Object.*)
	END_STRUCT;
	CncInputParameterRestart_Type : 	STRUCT 
		RestartModuleName : STRING[12]; (*Name of data module where restart info will be save or from which will be loaded*)
		NcInitProgramName : STRING[LABEL_SIZE]; (*Name of the NC Init Program (restart).*)
		NcProgramName : STRING[LABEL_SIZE]; (*Name of the NC Program (restart).*)
		NcProgramStartMode : USINT; (*Start mode for CNC program (restart): / ncSTANDARD ... Standard NC data module / ncFILE ... File .PRG) automatically converted to NC data module / ncFILE_XL ... Large File .PRG) directly loaded with FIFO buffer*)
		Restart_Type : USINT; (*Type of restart point (restart): / ncBLOCKNUMBER ... Position at block number / ncPATHDISTANCE ... Position at path distance (default) / ncBYTEOFFSET ...Position at path distance (default)*)
		BlockNumber : UDINT; (*Block number in current NC program (restart).*)
		Position : REAL; (*Path position in the current NC program [Units]: ncOFF (restart)*)
		Start_pos_typ : USINT; (*Start position type*)
		S_ncprog : REAL; (*Position from restart info*)
		ByteOffset : UDINT; (* Byte offset in current NC program (restart).*)
	END_STRUCT;
	CncInputParamter_Type : 	STRUCT 
		FeedrateOverride : REAL; (*The feed override affects the programmed feed.*)
		RapidOverride : REAL; (*Rapid override has only effect on Rapid Interpolation (G00).*)
		NcInitProgramName : STRING[LABEL_SIZE]; (*Name of the NC Init Program.*)
		NcProgramName : STRING[LABEL_SIZE]; (*Name of the NC Program.*)
		NcProgramStartPos : DINT;
		NcProgramStartMode : USINT; (*Start mode for CNC program: ncSTANDARD / ncFILE / ncFILE_XL, necessary for StartNcProgram, StartDryRun, LoadNcProgram*)
		NcProgramUnloadMode : USINT; (*With ARNC0 V1.00,only UnloadMode = ncOFF (Removing a specific program) and UnloadModes = ncUSER+ncINCLUDE+ncPRELOAD (remove all loaded programs) are implemented*)
		NcBlock : STRING[52]; (*NC Block*)
		DryRunWheelPosition : REAL; (*Target path position for the handwheel bahviour [Units * DryRunWheelFactor * (if DryRunInvertWheel = 1) -1].*)
		DryRunWheelFactor : REAL; (*Factor for DryRunWheelPosition (0.0 for "DryRunWheelFactor" is possible but stops the cnc without bringing it to the state Standstill!).*)
		DryRunMode : USINT; (*Mode = 2 Override Behaviour, Mode 1 Positioning with ncAction on the Path. Mode 2 preferred *)
		InitCncSubjectPar : UINT; (*Subject of the cnc structure whose data should be initialized: / ncGLOBAL / ncLIMITS / ncDECODER / ncAXES / ncCNC_PLC*)
		PositionMonitorMode : USINT; (*CNC position monitor mode: / ncOFF ... Position monitor in machine coordinates / ncCSTRF + ncTOOLDAT ... Position monitor in programmed coordinates / ncCSTRFDAT ... Position monitor with consideration of coordinate system transformation / ncTOOLDAT ... Position monitor with consideration of tool data (length, offset)*)
		Table : CncInputParameterTable_Type; (*Table*)
		Restart : CncInputParameterRestart_Type; (*Restart*)
		ConfigOk : BOOL; (*Startup condition: Is true if the Config task successfully wrotes the configuration (has to be true to control the cnc)*)
		CommandID : USINT;
		LoadCncParDataObjectName : STRING[LABEL_SIZE]; (*The data contained in the INIT LoadCncParDataObjectName parameter module is transferred into the corresponding parameters within the user data structure of the NC object.*)
		SaveCncParDataObjectName : STRING[LABEL_SIZE]; (*The INIT parameters contained in the NC object's user data are saved into the specified via SaveCncParDataObjectName INIT parameter module.*)
	END_STRUCT;
	CncOutput_Type : 	STRUCT 
		State : CncOutputState_Type; (*State information*)
		Status : CncOutputStatus_Type; (*Status information*)
		Monitor : CncOutputMonitor_Type; (*Monitor information*)
		Error : Error_Type; (*Error*)
	END_STRUCT;
	CncOutputMonitorTable_Type : 	STRUCT 
		ZeroTableName : STRING[12]; (*Actual Name of the NC Data Object.*)
		ToolTableName : STRING[12]; (*Actual Name of the NC Data Object.*)
		RParTableName : STRING[12]; (*Actual Name of the NC Data Object.*)
	END_STRUCT;
	CncOutputMonitorRestart_Type : 	STRUCT 
		NcInitProgramName : STRING[LABEL_SIZE]; (*Actual Name of the NC Init Program (restart).*)
		NcProgramName : STRING[LABEL_SIZE]; (*Actual Name of the NC Program (restart).*)
		NcProgramStartMode : USINT; (*Actual restart Start Mode.*)
		Restart_Type : USINT; (*Actual restart Type.*)
		BlockNumber : UDINT; (*Actual restart Block Number.*)
		Position : REAL; (*Actual Restart Pathposition.*)
		ByteOffset : UDINT; (*Actual Restart Byte Offset.*)
		AxPosition : ARRAY[0..14]OF REAL; (*Set Restart Positions of all Axes [Units]*)
		Start_pos_type : USINT; (*Start position type*)
		S_ncprog : REAL; (*Actual path position from restart info*)
	END_STRUCT;
	CncOutputMonitor_Type : 	STRUCT 
		NcProgram : CncOutputMonitorNcProgram_Type; (*NC Program*)
		NcBlock : CncOutputMonitorNcBlock_Type; (*NC Block*)
		Path : CncOutputMonitorPath_Type; (*Path*)
		Parameter : CncOutputMonitorParamter_Type; (*Parameter*)
		Table : CncOutputMonitorTable_Type; (*Table*)
		Axes : ARRAY[0..14]OF CncOutputMonitorAxes_Type; (*Axes*)
		Restart : CncOutputMonitorRestart_Type; (*Restart*)
		CncAddress : UDINT; (*Address of Cnc user structure (Datatype Cnc_typ)*)
	END_STRUCT;
	CncOutputMonitorAxes_Type : 	STRUCT 
		Position : REAL; (*Actual Position (PositionMonitorMode depended)*)
		AxesDatAddress : UDINT; (*Address of the axis ACP10AXIS_typ*)
	END_STRUCT;
	CncOutputMonitorNcBlock_Type : 	STRUCT 
		Number : UDINT; (*Current blocknumber in CNC program.*)
		Type : UINT; (*Type of current NC block.*)
		TextLast2 : STRING[80]; (*Last but one NC block*)
		TextLast1 : STRING[80]; (*Last NC block*)
		TextActual : STRING[80]; (*Current NC block*)
		TextNext1 : STRING[80]; (*Next NC block*)
		TextNext2 : STRING[80]; (*Next but one NC block*)
		RemainingPathDistance : REAL; (*Remaining path length until end of current NC block.*)
		PathLengthActual : REAL; (*Path length of current NC block.*)
		PathLengthNext1 : REAL; (*Path length of next NC block.*)
	END_STRUCT;
	CncOutputMonitorNcProgram_Type : 	STRUCT 
		Number : UDINT; (*Number of the current NC program.*)
		Name : STRING[LABEL_SIZE]; (*Name of current CNC program.*)
		Position : UDINT; (*Path position in the current NC program [Units].*)
		DefinedVelocity : REAL; (*Path speed currently defined in NC program [Units/min].*)
		ToolNumber : UINT; (*Number of the active tool data record.*)
		ZeroIndex : UINT; (*Index of the active absolute zero point offset.*)
	END_STRUCT;
	CncOutputMonitorParamter_Type : 	STRUCT 
		ExternalParameterAccessAddress : UDINT; (*Address of the EX-Parameter (Structure with type, ARNC0EXPAR_typ).*)
		MParameterAccessAddress : UDINT; (*Address of the M-Parameter (Structure with type, ARNC0M_PAR_typ).*)
		MFunctionAccessAddress : UDINT; (*Address of the M-Function (Structure with type, USINT[1024]).*)
		TFunctionValue : UINT; (*T function value.*)
		SFunctionValue : ARRAY[0..3]OF UDINT; (*S function values.*)
	END_STRUCT;
	CncOutputMonitorPath_Type : 	STRUCT 
		ActualVelocity : REAL; (*Current Path speed [Units/min].*)
		ActualPathLenght : REAL; (*Current Position in the NC program.*)
		ActualRunTime : REAL; (*Run time of the NC program [s].*)
		MaximalVelocity : REAL; (* Maximal path velocity *)
	END_STRUCT;
	CncOutputState_Type : 	STRUCT 
		Disabled : BOOL; (*Enable has not powerd the cnc. See State diagram.*)
		Standby : BOOL; (*Cnc is ready for starting NC Programs or NC blocks. See State diagram.*)
		Moving : BOOL; (*NC Program or Block is active. See State Diagram.*)
		Stopping : BOOL; (*Stop is active. See State diagram.*)
		Errorstop : BOOL; (*An error has occured. See State diagram.*)
	END_STRUCT;
	CncOutputStatus_Type : 	STRUCT 
		AccessOk : BOOL; (*shows if the access was successful.*)
		Ready : BOOL; (*shows if the cnc is ready.*)
		SingleStep : BOOL; (*shows if single step is active.*)
		Halted : BOOL; (*shows if cnc is halted*)
		Simulation : BOOL; (*shows if the cnc is in simulation mode.*)
		DryRun : BOOL; (*shows if DryRun is active.*)
		PositionMonitorMode : USINT; (*shows the actual monitor mode for monitoring positions.*)
		DecoderStatusSync : USINT; (*State "waiting for SYNC": ncFALSE / ncTRUE *)
		Busy : BOOL; (*shows if the cnc is ready for commands.*)
		Error : BOOL; (*shows if at least one error or warning has occurred*)
		CncDatAddress : UDINT; (*Address to access with the ARNC0 cnc pointer (Datatype = ARNC0CNC_typ).*)
	END_STRUCT;
END_TYPE
