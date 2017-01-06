(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: HmiPrgNew
 * File: HmiProgramLocal.typ
 * Author: renj
 * Created: December 02, 2014
 ********************************************************************
 * Local data types of program HmiPrgNew
 ********************************************************************)

TYPE
	HmiProgramState_Type : 
		(
		HMIPROGRAM_DIRINITREAD,
		HMIPROGRAM_LISTSHOW,
		HMIPROGRAM_IDLE,
		HMIPROGRAM_PASTE,
		HMIPROGRAM_RENAME,
		HMIPROGRAM_NEWFILE,
		HMIPROGRAM_ACTIVATEPROGRAM,
		HMIPROGRAM_DELETE,
		HMIPROGRAM_EDIT,
		HMIPROGRAM_ERROR
		);
	HmiProgramInternal_Type : 	STRUCT 
		SubState : UINT;
		State : HmiProgramState_Type;
		OldState : HmiProgramState_Type;
	END_STRUCT;
END_TYPE
