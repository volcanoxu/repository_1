(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Package: HmiJog
 * File: HmiJogGlobal.typ
 * Author: renj
 * Created: January 06, 2015
 ********************************************************************
 * Data types of package HmiJog
 ********************************************************************)

TYPE
	HmiJogLayerDefaultType : 	STRUCT 
		ButtoToolCheck : HmiButtonType;
		ButtonWorkObjectCheck : HmiButtonType;
		TextWorkObjectName : HmiTextType;
		TextToolName : HmiTextType;
		DropdownEulerQuan : HmiDropdownType;
		DropdownDegreeRad : HmiDropdownType;
		DropdownJointTCP : HmiDropdownType;
		NumericPos : ARRAY[0..6]OF HmiNumericType;
		NumericJogStep : HmiNumericType;
		TextPos : ARRAY[0..6]OF HmiTextType;
		TextPosUnit : ARRAY[0..5]OF HmiTextType;
		TextNotAvailable : HmiTextType;
		ButtonActSet : HmiButtonType;
		NumericPosSet : ARRAY[0..6]OF HmiNumericWithRangeType;
		TextActSet : HmiTextType;
		ButtonCheckVar : HmiButtonType;
		TextSetVar : HmiTextType;
		HotSpotFrameBrowse : HmiHotSpotType;
		HotSpotSetBrowse : HmiHotSpotType;
		HotSpotToolBrowse : HmiHotSpotType;
	END_STRUCT;
	HmiJogCtrlComponentsType : 	STRUCT 
		LayerDefault : HmiJogLayerDefaultType;
	END_STRUCT;
	HmiJogCtrlType : 	STRUCT 
		Components : HmiJogCtrlComponentsType;
	END_STRUCT;
END_TYPE
