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
	Jog_Type : 	STRUCT 
		Run : BOOL; (*enable jogging*)
		MoveAxis : ARRAY[0..5]OF SINT; (*select axes to move in positive (1) or negative (-1) direction*)
		Speed : REAL; (*in units per seconds*)
		Mode : USINT; (*joint=0, base=1, tool=2*)
		Tool : USINT; (*index from tooltable*)
		State : USINT; (*internal state*)
		JogAddress : UDINT;
		Step : BOOL;
		JogStepBase : BOOL;
		JogStepJoint : BOOL;
	END_STRUCT;
END_TYPE
