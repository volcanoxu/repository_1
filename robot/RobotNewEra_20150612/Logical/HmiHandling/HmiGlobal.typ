(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Package: Hmi
 * File: Hmi.typ
 * Author: liug
 * Created: March 04, 2013
 ********************************************************************
 * Data types of package Hmi
 ********************************************************************)

TYPE
	HmiGlobal_Type : 	STRUCT 
		Address : HmiGlobalAddress_Type;
		PageControl : HmiGlobalPageCtrl_Type;
	END_STRUCT;
	HmiGlobalPageCtrl_Type : 	STRUCT 
		ActPage : UINT;
		SetPage : UINT;
	END_STRUCT;
	HmiGlobalAddress_Type : 	STRUCT 
		SystemAddress : UDINT;
		AxesAddress : UDINT;
		CncAddress : UDINT;
		JogAddress : UDINT;
		RecipeAddress : UDINT;
		ErrorAddress : UDINT;
	END_STRUCT;
	HmiEditControl_Type : 	STRUCT 
		CommandRequest : STRING[200];
		CommandResponse : STRING[200];
		CommandStatus : UINT;
		CursorLine : UDINT;
		StatusDatapoint : UINT;
		LastExcuteLine : DINT;
		LastHighLightLine : DINT;
		URL : STRING[80];
		CursorCol : UDINT;
		TargetCursorCol : UDINT;
		TargetCursorLine : UDINT;
	END_STRUCT;
	HmiRetain_Type : 	STRUCT 
		HmiProgram : HmiProgramRetain_Type;
		HmiKeyControl : HmiKeyControlRetain_Type;
		HmiEditor : HmiEditorRetain_Type;
		HmiRobot : HmiRobot_Type;
		HmiJog : HmiJogRetain_Type;
	END_STRUCT;
	HmiJogToolRetainType : 	STRUCT 
		VarName : STRING[30];
		Tool : MXToolType;
	END_STRUCT;
	HmiJogJointRetainType : 	STRUCT 
		VarName : STRING[30];
		Joint : MXAxisTargetType;
		Set : BOOL;
	END_STRUCT;
	HmiJogPointRetainType : 	STRUCT 
		VarName : STRING[30];
		Point : {REDUND_UNREPLICABLE} MXPointType;
		Set : BOOL;
	END_STRUCT;
	HmiJogFrameRetainType : 	STRUCT 
		VarName : STRING[30];
		Frame : MXFrameType;
	END_STRUCT;
	HmiJogRetain_Type : 	STRUCT 
		Frame : HmiJogFrameRetainType;
		Tool : HmiJogToolRetainType;
		Joint : HmiJogJointRetainType;
		Point : HmiJogPointRetainType;
		Name : STRING[80];
		Device : STRING[80];
	END_STRUCT;
	HmiCartesianLimitType : 	STRUCT 
		Min : REAL;
		Max : REAL;
	END_STRUCT;
	HmiJointLimitType : 	STRUCT 
		Max : REAL;
		Min : REAL;
	END_STRUCT;
	HmiMechType : 	STRUCT 
		OffsetY : REAL;
		OffsetZ : REAL;
		OffsetX : REAL;
		Direction : USINT;
	END_STRUCT;
	HmiCouplingType : 	STRUCT 
		Coefficient : LREAL;
		Enable : BOOL;
	END_STRUCT;
	HmiRobot_Type : 	STRUCT 
		JointLimits : ARRAY[0..5]OF HmiJointLimitType;
		CartesianLimits : ARRAY[0..2]OF HmiCartesianLimitType;
		HomePos : MXPointType;
		Mech : ARRAY[0..5]OF HmiMechType;
		Coupling : ARRAY[0..2]OF HmiCouplingType; (*0: 4->5 1:5->6 2:4-6*)
	END_STRUCT;
	HmiKeyControlRetain_Type : 	STRUCT 
		MechHomeOK : BOOL;
	END_STRUCT;
	HmiEditorRetain_Type : 	STRUCT 
		Name : STRING[80];
		URLPathOnly : STRING[80];
		URL : STRING[80];
		Device : STRING[80];
	END_STRUCT;
	HmiProgramRetain_Type : 	STRUCT 
		Name : STRING[80];
		Mode : USINT;
		URLPathOnly : STRING[80];
		URL : STRING[80];
		Device : STRING[80];
		Ptr : UINT;
	END_STRUCT;
	HmiFileCtrlOutputStatus_Type : 	STRUCT 
		ReadOK : BOOL;
		WriteOK : BOOL;
		Busy : BOOL;
	END_STRUCT;
	HmiFileCtrlOutput_Type : 	STRUCT 
		Status : HmiFileCtrlOutputStatus_Type;
	END_STRUCT;
	HmiFileCtrlInputCmd_Type : 	STRUCT 
		Read : BOOL;
		Write : BOOL;
		AckError : BOOL;
	END_STRUCT;
	HmiFileCtrlInputParam_Type : 	STRUCT 
		FileName : STRING[80];
		StringBufferSize : UDINT;
		StringBufferAdr : UDINT;
		FileDevice : STRING[80];
	END_STRUCT;
	HmiFileCtrlInput_Type : 	STRUCT 
		Command : HmiFileCtrlInputCmd_Type;
		Parameter : HmiFileCtrlInputParam_Type;
	END_STRUCT;
	HmiFileCtrl_Type : 	STRUCT 
		Input : HmiFileCtrlInput_Type;
		Output : HmiFileCtrlOutput_Type;
	END_STRUCT;
END_TYPE

(*VisualComponentsType*)

TYPE
	HmiButtonType : 	STRUCT 
		Value : USINT;
		OldValue : USINT;
		StatusDatapoint : UINT;
		CompletionDatapoint : USINT;
		BmpIdx : USINT;
	END_STRUCT;
	HmiLayerType : 	STRUCT 
		StatusDatapoint : UINT;
	END_STRUCT;
	HmiScaleType : 	STRUCT 
		StartDatapoint : REAL;
		EndDatapoint : REAL;
	END_STRUCT;
	HmiSliderType : 	STRUCT 
		Value : REAL;
		StatusDatapoint : UINT;
	END_STRUCT;
	HmiStringType : 	STRUCT 
		Value : STRING[80];
		StatusDatapoint : UINT;
	END_STRUCT;
	HmiNumericTypeR : 	STRUCT 
		Value : REFERENCE TO REAL;
		StatusDatapoint : UINT;
	END_STRUCT;
	HmiDropdownTypeR : 	STRUCT 
		SelectedIndex : REFERENCE TO USINT;
		OldIndex : USINT;
	END_STRUCT;
	HmiNumericType : 	STRUCT 
		Value : REAL;
		StatusDatapoint : UINT;
	END_STRUCT;
	HmiTextType : 	STRUCT 
		TextIndex : USINT;
		StatusDatapoint : UINT;
	END_STRUCT;
	HmiEditType : 	STRUCT 
		CommandRequest : STRING[200];
		CommandResponse : STRING[200];
		CommandStatus : UINT;
		CursorLine : UDINT;
		CursorCol : UDINT;
		URL : STRING[80];
		StatusDatapoint : UINT;
		StringBuffer : STRING[10000];
	END_STRUCT;
	HmiDropdownType : 	STRUCT 
		SelectedIndex : USINT;
		OldIndex : USINT;
	END_STRUCT;
	HmiHotSpotType : 	STRUCT 
		Value : USINT;
		OldValue : USINT;
	END_STRUCT;
	HmiListboxType : 	STRUCT 
		Entries : ARRAY[0..19]OF STRING[80];
		MaxListIndex : USINT;
		SelectedIndex : USINT;
		CompletionDatapoint : USINT;
		OldSelectedIndex : USINT;
		IsEmpty : BOOL;
	END_STRUCT;
	HmiTabsType : 	STRUCT 
		TabMaxIndex : USINT;
		TabSelectedIndex : USINT;
		ButtonsTab : ARRAY[0..4]OF HmiButtonType;
		TabBg : HmiTextType;
	END_STRUCT;
	HmiPopupType : 	STRUCT 
		Layer : HmiLayerType;
		ButtonCancel : HmiButtonType;
		ButtonConfirm : HmiButtonType;
	END_STRUCT;
	HmiNumericWithRangeType : 	STRUCT 
		Value : REAL;
		StatusDatapoint : UINT;
		Max : REAL;
		Min : REAL;
	END_STRUCT;
	HmiBitmapType : 	STRUCT 
		BmpIndex : USINT;
	END_STRUCT;
	HmiPopupWithStringType : 	STRUCT 
		Layer : HmiLayerType;
		ButtonCancel : HmiButtonType;
		ButtonConfirm : HmiButtonType;
		StringInput : HmiStringType;
		TextInfo : HmiTextType;
	END_STRUCT;
	HmiSimpleType : 	STRUCT 
		StatusDatapoint : UINT;
	END_STRUCT;
END_TYPE
