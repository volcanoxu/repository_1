(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: HmiFile
 * File: HmiFileLocal.typ
 * Author: renj
 * Created: October 29, 2014
 ********************************************************************
 * Local data types of program HmiFile
 ********************************************************************)

TYPE
	HmiFileCtrlInternalState_Type : 
		(
		HMIFILE_IDLE,
		HMIFILE_OPEN,
		HMIFILE_READ,
		HMIFILE_CLOSE,
		HMIFILE_CREATE,
		HMIFILE_DELETE,
		HMIFILE_WRITE,
		HMIFILE_ERROR
		);
	HmiFileCtrlInternal_Type : 	STRUCT 
		State : HmiFileCtrlInternalState_Type;
		FileIdent : UDINT;
		FileByte : UDINT;
	END_STRUCT;
END_TYPE
