(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Package: HmiHardKey
 * File: HmiHardKeyGlobal.typ
 * Author: renj
 * Created: March 04, 2013
 ********************************************************************
 * Data types of package HmiHardKey
 ********************************************************************)

TYPE
	HmiHardKeyOutput_Typ : 	STRUCT 
		Run_Led : USINT;
		Error_Led : USINT;
		Motion_Led : USINT;
		Process_Led : USINT;
		KeyLevel : USINT;
	END_STRUCT;
	HmiHardKeyInput_Typ : 	STRUCT 
		MP50_SimKey : ARRAY[0..50]OF BOOL;
		MP50_Key : ARRAY[0..50]OF BOOL;
		Joystick_XValue : DINT;
		Joystick_YValue : DINT;
		Joystick_ZValue : DINT;
	END_STRUCT;
	HmiHardKey_Type : 	STRUCT 
		Input : HmiHardKeyInput_Typ;
		Output : HmiHardKeyOutput_Typ;
	END_STRUCT;
END_TYPE
