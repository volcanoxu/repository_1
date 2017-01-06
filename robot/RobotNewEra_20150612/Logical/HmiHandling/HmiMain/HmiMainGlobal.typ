(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Package: HmiMainNew
 * File: HmiMainGlobal.typ
 * Author: renj
 * Created: November 17, 2014
 ********************************************************************
 * Data types of package HmiMainNew
 ********************************************************************)

TYPE
	HmiMainCtrlComponentsType : 	STRUCT 
		EditPrgRun : HmiEditType;
		TextFileName : HmiTextType;
		ButtonJumpToMain : HmiButtonType;
		HotSpotPrgRun : HmiSimpleType;
		ButtonSetPtr : HmiButtonType;
	END_STRUCT;
	HmiMainControlType : 	STRUCT 
		Components : HmiMainCtrlComponentsType;
	END_STRUCT;
END_TYPE
