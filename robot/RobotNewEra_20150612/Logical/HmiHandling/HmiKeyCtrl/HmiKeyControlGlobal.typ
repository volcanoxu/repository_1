(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Program: HmiKeyControl
 * File: HmiKeyControl.typ
 * Author: B&R, International Applications
 * Created: March 16, 2009
 ********************************************************************
 * Data types of program HmiKeyControl
 ********************************************************************)

TYPE
	HmiKeyControlSpace_typ : 	STRUCT 
		Enable : BOOL;
		X1 : REAL;
		Y1 : REAL;
		Z1 : REAL;
		X2 : REAL;
		Y2 : REAL;
		Z2 : REAL;
	END_STRUCT;
	HmiKeyControlInputCommand_Type : 	STRUCT 
		StartKey : BOOL; (* Start button has been pressed *)
		StopKey : BOOL; (* Stop button has been pressed *)
		EmergencyStopKey : BOOL;
		PageKey : ARRAY[0..MAX_PAGE_KEY_MINUS_ONE]OF BOOL;
		VirFunctionKeyLeft : ARRAY[0..MAX_FUNCTION_KEY_MINUS_ONE]OF BOOL;
		VirFunctionKey : ARRAY[0..MAX_FUNCTION_KEY_MINUS_ONE]OF BOOL;
		FunctionKey : ARRAY[0..MAX_FUNCTION_KEY_MINUS_ONE]OF BOOL;
		PlusKey : ARRAY[0..MAX_PLUS_MINUS_KEY_MINUS_ONE]OF BOOL;
		MinusKey : ARRAY[0..MAX_PLUS_MINUS_KEY_MINUS_ONE]OF BOOL;
		KeySwitch : ARRAY[0..1]OF BOOL;
		Key2nd : BOOL;
		ProgramActive : BOOL;
		Acknowledge : BOOL;
		Reset : BOOL;
		JogMode : BOOL;
		JogEnable : BOOL;
		FeedrateChange : BOOL;
		StepOn : BOOL;
		SaftyKeyRight : BOOL;
		SaftyKeyLeft : BOOL;
		SetPC : BOOL;
		FileSelect : BOOL;
		PosSwitch : BOOL;
	END_STRUCT;
	HmiKeyControlInputPara_Type : 	STRUCT 
		JogMode : USINT;
		SystemAddress : UDINT;
		CncAddress : UDINT;
		AxesAddress : UDINT;
		JogAddress : UDINT;
		RecipeAddress : UDINT;
		ErrorAddress : UDINT;
		JoystickXValue : DINT;
		JoystickYValue : DINT;
		JoystickZValue : DINT;
	END_STRUCT;
	HmiKeyControlInput_Type : 	STRUCT 
		Parameter : HmiKeyControlInputPara_Type;
		Command : HmiKeyControlInputCommand_Type;
	END_STRUCT;
	HmiKeyControlOutputMon_Type : 	STRUCT 
		JogJointVelocity : REAL;
		ToolIndex : USINT;
		JogToolIndex : USINT;
		FileName : STRING[32];
		ModuleType : UDINT;
		PosSelect : UINT;
		ShowPos : ARRAY[0..5]OF REAL;
		JogMode : USINT;
	END_STRUCT;
	HmiKeyControlOutput_Type : 	STRUCT 
		Monitor : HmiKeyControlOutputMon_Type;
		Status : HmiKeyControlOutputStatus_Type;
	END_STRUCT;
	HmiKeyControlOutputStatus_Type : 	STRUCT 
		Enable : USINT;
		Run : BOOL;
		Error : BOOL;
		Moving : BOOL;
		JogEnable : BOOL;
		RealContinue : BOOL;
		MoveStatus : USINT;
		AutoStatus : USINT;
		StatusIconIndex : USINT;
		SwitchMode : USINT;
		SWLimitsIgnored : ARRAY[0..5]OF BOOL;
		MoveAxis : ARRAY[0..5]OF SINT;
	END_STRUCT;
	HmiKeyControlComponentsType : 	STRUCT 
		LayerButtons : HmiKeyCtrlLayerButtonsType;
		LayerLogin : HmiKeyCtrlLayerLoginType;
	END_STRUCT;
	HmiKeyCtrlLayerLoginType : 	STRUCT 
		Layer : HmiLayerType;
	END_STRUCT;
	HmiKeyCtrlLayerButtonsType : 	STRUCT 
		Layer : HmiLayerType;
		Tabs : HmiTabsType;
		ButtonVMinus : HmiButtonType;
		ButtonVPlus : HmiButtonType;
		ButtonSwitchOn : HmiButtonType;
		ButtonLogin : HmiButtonType;
		ButtonJogBase : HmiButtonType;
		ButtonJogTool : HmiButtonType;
		ButtonJogJoint : HmiButtonType;
		ButtonJogDirect : HmiButtonType;
		ButtonSingle : HmiButtonType;
		ButtonCont : HmiButtonType;
		SliderV : HmiSliderType;
		NumericV : HmiNumericType;
	END_STRUCT;
	HmiKeyControl_Type : 	STRUCT 
		Input : HmiKeyControlInput_Type;
		Output : HmiKeyControlOutput_Type;
		Components : HmiKeyControlComponentsType;
	END_STRUCT;
END_TYPE
