(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: HmiMain
 * File: HmiMainLocal.typ
 * Author: renj
 * Created: November 17, 2014
 ********************************************************************
 * Local data types of program HmiMain
 ********************************************************************)

TYPE
	HmiMainCtrlInternal_Type : 	STRUCT 
		MainEditCtrlState : HmiMainCtrlState_Type;
		StringBuffer : STRING[10000];
	END_STRUCT;
	HmiMainCtrlState_Type : 
		(
		HMIMAIN_WAIT,
		HMIMAIN_READWAIT,
		HMIMAIN_READPROCESS,
		HMIMAIN_LOADED,
		HMIMAIN_HIGHLIGHT_WAIT,
		HMIMAIN_ERROR
		);
END_TYPE
