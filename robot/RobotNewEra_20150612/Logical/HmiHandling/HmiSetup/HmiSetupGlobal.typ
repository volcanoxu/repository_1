(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Package: HmiMain
 * File: HmiMainGlobal.typ
 * Author: renj
 * Created: September 25, 2014
 ********************************************************************
 * Data types of package HmiMain
 ********************************************************************)

TYPE
	HmiSetupControl_Type : 	STRUCT 
		Components : HmiSetupComponentsType;
	END_STRUCT;
	HmiSetupCalibType : 	STRUCT 
		LayerInfo : HmiSetupCalibInfoType;
		LayerDefault : HmiSetupCalibDefaultType;
	END_STRUCT;
	HmiSetupCalibInfoType : 	STRUCT 
		Layer : HmiLayerType;
	END_STRUCT;
	HmiSetupCalibDefaultType : 	STRUCT 
		Layer : HmiLayerType;
		ButtonAxisRefresh : ARRAY[0..5]OF HmiButtonType;
		ButtonAxisToggle : ARRAY[0..5]OF HmiButtonType;
		NumericEncoderValue : ARRAY[0..5]OF HmiNumericType;
		ButtonSave : HmiButtonType;
	END_STRUCT;
	HmiSetupMainDefaultType : 	STRUCT 
		HotspotRestart : HmiHotSpotType;
		Layer : HmiLayerType;
	END_STRUCT;
	HmiSetupMainInfoType : 	STRUCT 
		Layer : HmiLayerType;
		ButtonRestart : HmiButtonType;
	END_STRUCT;
	HmiSetupMainType : 	STRUCT 
		LayerInfo : HmiSetupMainInfoType;
		LayerDefault : HmiSetupMainDefaultType;
	END_STRUCT;
	HmiSetupComponentsType : 	STRUCT 
		PageCalib : HmiSetupCalibType;
		PageKine : HmiSetupKineType;
		PageMain : HmiSetupMainType;
	END_STRUCT;
	HmiSetupKineDefaultType : 	STRUCT 
		ButtonSave : HmiButtonType;
		NumericC56Value : HmiNumericType;
		NumericC46Value : HmiNumericType;
		NumericC45Value : HmiNumericType;
		ButtonC56Enable : HmiButtonType;
		ButtonC46Enable : HmiButtonType;
		ButtonC45Enable : HmiButtonType;
		DropdownAxisSelect : HmiDropdownType;
	END_STRUCT;
	HmiSetupKineInfoType : 	STRUCT 
		Layer : HmiLayerType;
	END_STRUCT;
	HmiSetupKineType : 	STRUCT 
		LayerDefault : HmiSetupKineDefaultType;
		LayerInfo : HmiSetupKineInfoType;
	END_STRUCT;
END_TYPE
