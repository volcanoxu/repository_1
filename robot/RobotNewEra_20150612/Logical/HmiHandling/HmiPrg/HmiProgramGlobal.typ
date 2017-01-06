(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Program: HmiProgram
 * File: HmiProgramInterface.typ
 * Author: B&R, International Applications
 * Created: October 08, 2008
 ********************************************************************
 * Local data types of program HmiProgram
 ********************************************************************)

TYPE
	HmiProgramLayerDefaultType : 	STRUCT 
		Layer : HmiLayerType;
		ListboxFiles : HmiListboxType;
		ListboxDevices : HmiListboxType;
		ButtonPageDown : HmiButtonType;
		ButtonPageUp : HmiButtonType;
		ButtonRename : HmiButtonType;
		ButtonEdit : HmiButtonType;
		ButtonLoad : HmiButtonType;
		ButtonNew : HmiButtonType;
		ButtonDelete : HmiButtonType;
		ButtonPaste : HmiButtonType;
		ButtonCopy : HmiButtonType;
		ButtonCut : HmiButtonType;
		ScaleScrollbar : HmiScaleType;
	END_STRUCT;
	HmiProgramComponentsType : 	STRUCT 
		LayerDefault : HmiProgramLayerDefaultType;
		LayerDeletePopup : HmiPopupType;
		LayerNewPopup : HmiPopupWithStringType;
		LayerRenamePopup : HmiPopupWithStringType;
		LayerCutPopup : HmiPopupType;
	END_STRUCT;
	HmiProgram_Type : 	STRUCT 
		Components : HmiProgramComponentsType;
	END_STRUCT;
END_TYPE
