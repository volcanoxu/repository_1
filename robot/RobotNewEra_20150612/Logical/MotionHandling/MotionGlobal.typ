(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * File: Global.typ
 * Author: radaka
 * Created: February 09, 2009
 ********************************************************************
 * Global data types of project CncMotionHandling
 ********************************************************************)

TYPE
	ErrorText_Type : 	STRUCT 
		Line1 : STRING[79];
		Line2 : STRING[79];
		Line3 : STRING[79];
		Line4 : STRING[79];
	END_STRUCT;
	Error_Type : 	STRUCT 
		Count : UINT;
		HmiCount : UINT;
		Class : UINT;
		Number : UDINT;
		Info : ARRAY[0..11]OF USINT;
		Text : ErrorText_Type;
	END_STRUCT;
END_TYPE
