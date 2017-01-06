(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Package: Receipe
 * File: ReceipeGlobal.typ
 * Author: renj
 * Created: October 08, 2014
 ********************************************************************
 * Data types of package Receipe
 ********************************************************************)

TYPE
	RECIPE_DATA_USER_typ : 	STRUCT 
		Reserve : USINT;
	END_STRUCT;
	RECIPE_DATA_SYSTEM_typ : 	STRUCT 
		CurRcpIndex : UINT;
		RcpListName : ARRAY[0..LEN_RCP_NAME]OF STRING[NB_RECIPE];
		JointJogSpeed : REAL; (*deg/s*)
		PathJogSpeed : REAL; (*mm/s*)
		HomePosition : ARRAY[0..12]OF REAL;
		JogStepJoint : REAL;
		JogStepBase : REAL;
	END_STRUCT;
	RECIPE_DATA_typ : 	STRUCT 
		System : RECIPE_DATA_SYSTEM_typ;
		User : RECIPE_DATA_USER_typ;
	END_STRUCT;
	RECIPE_COMMAND_typ : 	STRUCT 
		Read : BOOL;
		UserDataWrite : BOOL;
		SysDataWrite : BOOL;
		Delete : BOOL;
		Rename : BOOL;
	END_STRUCT;
	RECIPE_MONITOR_typ : 	STRUCT 
		CurrentRcpName : STRING[LEN_RCP_NAME];
		RcpInitOK : BOOL;
		ListRcpIndex : UINT;
		DataAddress : UDINT;
		RecipeAddress : UDINT;
	END_STRUCT;
	RECIPE_SET_PAR_typ : 	STRUCT 
		NewRcpName : STRING[LEN_RCP_NAME];
	END_STRUCT;
	RECIPE_typ : 	STRUCT 
		Cmd : RECIPE_COMMAND_typ;
		Monitor : RECIPE_MONITOR_typ;
		SetPar : RECIPE_SET_PAR_typ;
		Data : RECIPE_DATA_typ;
	END_STRUCT;
END_TYPE
