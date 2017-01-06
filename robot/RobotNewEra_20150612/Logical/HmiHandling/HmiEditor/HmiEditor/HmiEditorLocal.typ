(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: HmiEdit
 * File: HmiEdit.typ
 * Author: renj
 * Created: October 21, 2014
 ********************************************************************
 * Local data types of program HmiEdit
 ********************************************************************)

TYPE
	HmiEditorInternalStateType : 
		(
		HMIEDITOR_WAIT,
		HMIEDITOR_READ,
		HMIEDITOR_LOADED,
		HMIEDITOR_WRITE_WAIT,
		HMIEDITOR_ERROR
		);
	HmiEditorInternalType : 	STRUCT 
		State : HmiEditorInternalStateType;
	END_STRUCT;
END_TYPE
