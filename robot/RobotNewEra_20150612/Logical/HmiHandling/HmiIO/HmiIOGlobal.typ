(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Program: HmiDiagnostics
 * File: HmiDiagnostics.typ
 * Author: B&R, International Applications
 * Created: February 13, 2009
 ********************************************************************
 * Local data types of program HmiDiagnostics
 ********************************************************************)

TYPE
	HmiIOCtrl_Type : 	STRUCT 
		Input : HmiIOCtrlInput_Type;
		Output : HmiIOCtrlOutput_Type;
	END_STRUCT;
	HmiIOCtrlInputCommand_Type : 	STRUCT 
		InfoLineUp : BOOL;
		InfoLineDown : BOOL;
		Enter : BOOL;
		DiscardChange : BOOL;
		ForcingOn : BOOL;
		ForcingOff : BOOL;
		ForcingAllOff : BOOL;
		SetValue : BOOL;
		PageUp : BOOL;
		PageDown : BOOL;
	END_STRUCT;
	HmiIOCtrlInput_Type : 	STRUCT 
		Command : HmiIOCtrlInputCommand_Type;
	END_STRUCT;
	HmiIOCtrlOutput_Type : 	STRUCT 
		ModuleInfo : HmiIOCtrlOutputModuleDiag_Type;
		IOInfo : HmiIOCtrlOutputIODiag_Type;
		Status : HmiIOCtrlOutputStatus_Type;
	END_STRUCT;
	HmiIOCtrlOutputModuleDiag_Type : 	STRUCT 
		ModuleName : ARRAY[0..MAX_LINES_MINUS_ONE]OF STRING[20]; (*module name*)
		ModulePath : ARRAY[0..MAX_LINES_MINUS_ONE]OF STRING[30]; (*module path*)
		ModuleState : ARRAY[0..MAX_LINES_MINUS_ONE]OF USINT; (*module state*)
		ErrorModuleName : ARRAY[0..MAX_LINES_MINUS_ONE]OF STRING[20]; (*error module name*)
		Color : ARRAY[0..MAX_LINES_MINUS_ONE]OF UINT; (*color of each row*)
		WrongModulStatus : ARRAY[0..MAX_LINES_MINUS_ONE]OF USINT; (*wrong module inserted status*)
	END_STRUCT;
	HmiIOCtrlOutputIODiag_Type : 	STRUCT 
		ModuleName : STRING[20]; (*module name*)
		ModulePath : STRING[30]; (*module path*)
		ModuleStatus : USINT; (*module status*)
		PVName : ARRAY[0..MAX_IO_LINES_MINUS_ONE]OF STRING[64]; (*PV names*)
		LogicalName : ARRAY[0..MAX_IO_LINES_MINUS_ONE]OF STRING[32]; (*logical names*)
		DiagnosicsType : ARRAY[0..MAX_IO_LINES_MINUS_ONE]OF USINT; (*data type*)
		ActValue : ARRAY[0..MAX_IO_LINES_MINUS_ONE]OF DINT; (*actual value*)
		ForceValue : ARRAY[0..MAX_IO_LINES_MINUS_ONE]OF DINT; (*force value*)
		MinValue : ARRAY[0..MAX_IO_LINES_MINUS_ONE]OF DINT; (*minimum value*)
		MaxValue : ARRAY[0..MAX_IO_LINES_MINUS_ONE]OF DINT; (*maximum value*)
		Color : ARRAY[0..MAX_IO_LINES_MINUS_ONE]OF UINT; (*color of each row*)
		NumericColor : ARRAY[0..MAX_IO_LINES_MINUS_ONE]OF UINT; (*color for numeric fields*)
		EnableForcing : ARRAY[0..MAX_IO_LINES_MINUS_ONE]OF BOOL; (*enable forcing*)
		InivisibleLines : ARRAY[0..MAX_IO_LINES_MINUS_ONE]OF USINT; (*hide rows datapoint*)
		CompletionCmdForcing : BOOL; (*completion datapoint for forcing button*)
		SelectedIO : HmiIOCtrlSelected_Type;
	END_STRUCT;
	HmiIOCtrlSelected_Type : 	STRUCT 
		LogicalName : STRING[40];
		PVName : STRING[64];
		ForceValue : DINT;
		MinValue : DINT;
		MaxValue : DINT;
		Status : UINT;
	END_STRUCT;
	HmiIOCtrlOutputStatus_Type : 	STRUCT 
		IOInformationStatus : USINT;
		SimulationActive : BOOL;
		DiagnosticsInitDone : BOOL;
		PageFocusColor : UINT; (*page focus color datapoint*)
		Address : UDINT;
		IOForced : USINT;
		ModuleInfoLayerStatus : USINT; (*runitme datapoint of module information layer*)
		IOInfoLayerStatus : USINT; (*runtime datapoint of I/O info layer*)
		StatusLayerMessage : USINT; (*runtime datapoint of warning message layer*)
	END_STRUCT;
	ModuleInformation_Type : 	STRUCT 
		ModulePath : STRING[30]; (*module path*)
		ModuleName : STRING[20]; (*module name*)
		ModuleState : USINT; (*module state*)
		ModuleColor : USINT; (*module color*)
		ErrorModuleName : STRING[20]; (*name of module with error*)
	END_STRUCT;
	HW_DI_typ : 	STRUCT 
		I1 : BOOL;
		I2 : BOOL;
		I3 : BOOL;
		I4 : BOOL;
		I5 : BOOL;
		I6 : BOOL;
		I7 : BOOL;
		I8 : BOOL;
		I9 : BOOL;
		I10 : BOOL;
		I11 : BOOL;
		I12 : BOOL;
		I13 : BOOL;
		I14 : BOOL;
		I15 : BOOL;
		I16 : BOOL;
	END_STRUCT;
	HW_DO_typ : 	STRUCT 
		O1 : BOOL;
		O2 : BOOL;
		O3 : BOOL;
		O4 : BOOL;
		O5 : BOOL;
		O6 : BOOL;
		O7 : BOOL;
		O8 : BOOL;
		O9 : BOOL;
		O10 : BOOL;
		O11 : BOOL;
		O12 : BOOL;
		O13 : BOOL;
		O14 : BOOL;
		O15 : BOOL;
		O16 : BOOL;
	END_STRUCT;
END_TYPE
