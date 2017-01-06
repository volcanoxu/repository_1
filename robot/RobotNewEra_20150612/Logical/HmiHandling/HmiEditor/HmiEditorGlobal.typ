(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Package: HmiEdit
 * File: HmiEditGlobal.typ
 * Author: renj
 * Created: October 20, 2014
 ********************************************************************
 * Data types of package HmiEdit
 ********************************************************************)

TYPE
	HmiEditorCtrlType : 	STRUCT 
		Components : HmiEditorCtrlComponentsType;
	END_STRUCT;
	HmiEditorCtrlComponentsType : 	STRUCT 
		PageData : HmiEditorPageDataType;
		PageEdit : HmiEditorPageEditType;
	END_STRUCT;
	HmiEditorPageEditType : 	STRUCT 
		LayerDefault : HmiEditorEditLayerDefualtType;
	END_STRUCT;
	HmiEditorEditLayerDefualtType : 	STRUCT 
		HotSpotKeys : ARRAY[0..49]OF HmiHotSpotType;
		Layer : HmiLayerType;
		BmpKeys : HmiBitmapType;
		EditPrg : HmiEditType;
		TextFileName : HmiTextType;
		HotSpotPrompts : ARRAY[0..4]OF HmiHotSpotType;
		StringPrompt : HmiStringType;
		HotSpotPromptRight : HmiHotSpotType;
		HotSpotPromptLeft : HmiHotSpotType;
		HotSpotVarSelect : HmiHotSpotType;
	END_STRUCT;
	HmiEditorPageDataType : 	STRUCT 
		LayerDefault : HmiEditorDataLayerDefaultType;
		LayerNewPopup : HmiEditorDataLayerNewType;
		LayerPoint : HmiEditorDataLayerPointType;
		LayerAxis : HmiEditorDataLayerAxisType;
		LayerFrame : HmiEditorDataLayerFrameType;
		LayerTool : HmiEditorDataLayerToolType;
		LayerVel : HmiEditorDataLayerVelType;
		LayerPath : HmiEditorDataLayerPathType;
		LayerINT : HmiEditorDataLayerINTType;
		LayerREAL : HmiEditorDataLayerREALType;
		LayerBOOL : HmiEditorDataLayerBOOLType;
	END_STRUCT;
	HmiEditorDataLayerNewType : 	STRUCT 
		Layer : HmiLayerType;
		ButtonCancel : HmiButtonType;
		ButtonConfirm : HmiButtonType;
		StringInput : HmiStringType;
		NumInput : HmiNumericType;
		TextInfo : HmiTextType;
		ButtonConstant : HmiButtonType;
	END_STRUCT;
	HmiEditorDataLayerPointType : 	STRUCT 
		NumericPosX : HmiNumericType;
		NumericPosY : HmiNumericType;
		NumericPosZ : HmiNumericType;
		NumericOrientType : HmiNumericType;
		NumericOrientAngle1 : HmiNumericType;
		NumericOrientAngle2 : HmiNumericType;
		NumericOrientAngle3 : HmiNumericType;
		NumericOrientAngle0 : HmiNumericType;
		NumericIndex : HmiNumericWithRangeType;
		ButtonIndexDown : HmiButtonType;
		ButtonIndexUp : HmiButtonType;
		ButtonSave : HmiButtonType;
		ButtonClear : HmiButtonType;
		ButtonReload : HmiButtonType;
		Layer : HmiLayerType;
		TextVarInfo : HmiStringType;
		ButtonClose : HmiButtonType;
		ButtonSetJog : HmiButtonType;
		ButtonTeach : HmiButtonType;
	END_STRUCT;
	HmiEditorDataLayerVelType : 	STRUCT 
		Layer : HmiLayerType;
		Numericv : HmiNumericType;
		NumericMode : HmiNumericType;
		NumericIndex : HmiNumericWithRangeType;
		ButtonIndexDown : HmiButtonType;
		ButtonIndexUp : HmiButtonType;
		ButtonClose : HmiButtonType;
		TextVarInfo : HmiStringType;
		ButtonClear : HmiButtonType;
		ButtonReload : HmiButtonType;
		ButtonSave : HmiButtonType;
	END_STRUCT;
	HmiEditorDataLayerPathType : 	STRUCT 
		Layer : HmiLayerType;
		NumericRadius : HmiNumericType;
		NumericType : HmiNumericType;
		NumericIndex : HmiNumericWithRangeType;
		ButtonIndexDown : HmiButtonType;
		ButtonIndexUp : HmiButtonType;
		ButtonClose : HmiButtonType;
		TextVarInfo : HmiStringType;
		ButtonClear : HmiButtonType;
		ButtonReload : HmiButtonType;
		ButtonSave : HmiButtonType;
	END_STRUCT;
	HmiEditorDataLayerAxisType : 	STRUCT 
		Layer : HmiLayerType;
		NumericJointAxis0 : HmiNumericType;
		NumericJointAxis1 : HmiNumericType;
		NumericJointAxis2 : HmiNumericType;
		NumericJointAxis3 : HmiNumericType;
		NumericJointAxis4 : HmiNumericType;
		NumericJointAxis5 : HmiNumericType;
		NumericIndex : HmiNumericWithRangeType;
		ButtonIndexDown : HmiButtonType;
		ButtonIndexUp : HmiButtonType;
		ButtonClose : HmiButtonType;
		TextVarInfo : HmiStringType;
		ButtonClear : HmiButtonType;
		ButtonReload : HmiButtonType;
		ButtonSave : HmiButtonType;
		ButtonSetJog : HmiButtonType;
		ButtonTeach : HmiButtonType;
	END_STRUCT;
	HmiEditorDataLayerFrameType : 	STRUCT 
		NumericPosX : HmiNumericType;
		NumericPosY : HmiNumericType;
		NumericPosZ : HmiNumericType;
		NumericOrientType : HmiNumericType;
		NumericOrientAngle1 : HmiNumericType;
		NumericOrientAngle2 : HmiNumericType;
		NumericOrientAngle3 : HmiNumericType;
		NumericOrientAngle0 : HmiNumericType;
		NumericIndex : HmiNumericWithRangeType;
		ButtonIndexDown : HmiButtonType;
		ButtonIndexUp : HmiButtonType;
		Layer : HmiLayerType;
		TextVarInfo : HmiStringType;
		ButtonClose : HmiButtonType;
		ButtonClear : HmiButtonType;
		ButtonReload : HmiButtonType;
		ButtonSave : HmiButtonType;
		ButtonSetJog : HmiButtonType;
	END_STRUCT;
	HmiEditorDataLayerToolType : 	STRUCT 
		NumericPosX : HmiNumericType;
		NumericPosY : HmiNumericType;
		NumericPosZ : HmiNumericType;
		NumericOrientType : HmiNumericType;
		NumericOrientAngle1 : HmiNumericType;
		NumericOrientAngle2 : HmiNumericType;
		NumericOrientAngle3 : HmiNumericType;
		NumericOrientAngle0 : HmiNumericType;
		NumericRadius : HmiNumericType;
		NumericIndex : HmiNumericWithRangeType;
		ButtonIndexDown : HmiButtonType;
		ButtonIndexUp : HmiButtonType;
		Layer : HmiLayerType;
		TextVarInfo : HmiStringType;
		ButtonClose : HmiButtonType;
		ButtonClear : HmiButtonType;
		ButtonReload : HmiButtonType;
		ButtonSave : HmiButtonType;
		ButtonSetJog : HmiButtonType;
	END_STRUCT;
	HmiEditorDataLayerINTType : 	STRUCT 
		Layer : HmiLayerType;
		NumericValue : HmiNumericType;
		NumericIndex : HmiNumericWithRangeType;
		ButtonIndexDown : HmiButtonType;
		ButtonIndexUp : HmiButtonType;
		ButtonClose : HmiButtonType;
		TextVarInfo : HmiStringType;
		ButtonClear : HmiButtonType;
		ButtonReload : HmiButtonType;
		ButtonSave : HmiButtonType;
	END_STRUCT;
	HmiEditorDataLayerREALType : 	STRUCT 
		Layer : HmiLayerType;
		NumericValue : HmiNumericType;
		NumericIndex : HmiNumericWithRangeType;
		ButtonIndexDown : HmiButtonType;
		ButtonIndexUp : HmiButtonType;
		ButtonClose : HmiButtonType;
		TextVarInfo : HmiStringType;
		ButtonClear : HmiButtonType;
		ButtonReload : HmiButtonType;
		ButtonSave : HmiButtonType;
	END_STRUCT;
	HmiEditorDataLayerBOOLType : 	STRUCT 
		Layer : HmiLayerType;
		NumericValue : HmiNumericType;
		NumericIndex : HmiNumericWithRangeType;
		ButtonIndexDown : HmiButtonType;
		ButtonIndexUp : HmiButtonType;
		ButtonClose : HmiButtonType;
		TextVarInfo : HmiStringType;
		ButtonClear : HmiButtonType;
		ButtonReload : HmiButtonType;
		ButtonSave : HmiButtonType;
	END_STRUCT;
	HmiEditorDataLayerDefaultType : 	STRUCT 
		ScaleScrollbar : HmiScaleType;
		ButtonScrolldown : HmiButtonType;
		ButtonScrollup : HmiButtonType;
		ListboxVariables : HmiListboxType;
		TextEditorName : HmiTextType;
		DropDownTypes : HmiListboxType;
		Layer : HmiLayerType;
		ButtonNew : HmiButtonType;
		ButtonModify : HmiButtonType;
		ButtonDelete : HmiButtonType;
		ButtonReload : HmiButtonType;
		ButtonSaveAll : HmiButtonType;
		ButtonInsert : HmiButtonType;
	END_STRUCT;
END_TYPE
