(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Program: 6axATrqFF
 * File: 6axATrqFF.typ
 * Author: frigenif
 * Created: May 17, 2011
 ********************************************************************
 * Local data types of program 6axATrqFF
 ********************************************************************)

TYPE
	TrqFF6axA_Type : 	STRUCT 
		Enable : BOOL;
		Axes : ARRAY[0..5] OF TrqFF6axA_Axes_Type;
		Ramp : REAL;
		Active : BOOL;
	END_STRUCT;
	TrqFF6axA_Axes_Type : 	STRUCT 
		Index : USINT;
		Sign : REAL;
		MaxTorque : REAL;
		SetTorque : REAL;
		CorrectTorque : REAL;
	END_STRUCT;
END_TYPE
