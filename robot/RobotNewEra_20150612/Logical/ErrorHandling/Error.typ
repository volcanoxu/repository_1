(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Program: Error
 * File: Error.typ
 * Author: haged
 * Created: July 07, 2010
 ********************************************************************
 * Global data types of program Error
 ********************************************************************)

TYPE
	ErrorHandlingInputCommand_Type : 	STRUCT 
		Acknowledge : BOOL;
		Reset : BOOL;
	END_STRUCT;
	ErrorHandlingInputPara_Type : 	STRUCT 
		SystemAddress : UDINT;
		CncAddress : UDINT;
		AxesAddress : UDINT;
	END_STRUCT;
	ErrorHandlingInput_Type : 	STRUCT 
		Parameter : ErrorHandlingInputPara_Type;
		Command : ErrorHandlingInputCommand_Type;
	END_STRUCT;
	ErrorHandlingOutputMon_Type : 	STRUCT 
		ErrorHandlingAddress : UDINT;
		AlarmImage : ARRAY[0..MAX_ALARMS]OF BOOL;
	END_STRUCT;
	ErrorHandlingOutput_Type : 	STRUCT 
		Monitor : ErrorHandlingOutputMon_Type;
		Status : ErrorHandlingStatus_Type;
	END_STRUCT;
	ErrorHandlingStatus_Type : 	STRUCT 
		SystemError : BOOL;
		CncError : BOOL;
		Axeserror : BOOL;
	END_STRUCT;
	ErrorHandling_Type : 	STRUCT 
		Input : ErrorHandlingInput_Type;
		Output : ErrorHandlingOutput_Type;
	END_STRUCT;
END_TYPE
