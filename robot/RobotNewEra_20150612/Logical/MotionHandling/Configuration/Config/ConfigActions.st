(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Program: Config
 * File: DefaultConfig.st
 * Author: radaka
 * Created: February 18, 2009
 ********************************************************************
 * Implementation of program Config
 ********************************************************************) 

ACTION Configuration_Prepare:
	
	(* Loop over all systems *)
	FOR i:= 0 TO MAX_SYS_MINUS_ONE DO
			
		FOR j:= 0 TO MAX_AX_MINUS_ONE DO
			pSystem[i].Input.Configuration.SystemAxes[j].Index:= NO_PART_OF_SYSTEM;
			pSystem[i].Input.Configuration.SystemPowerAxesIndex[j]:= NO_PART_OF_SYSTEM;
		END_FOR
		FOR j:= 0 TO MAX_CNC_MINUS_ONE DO
			pSystem[i].Input.Configuration.SystemCncIndex[j]:= NO_PART_OF_SYSTEM;			
		END_FOR
		
		FOR j:= 0 TO MAX_MODE_MINUS_ONE DO
			FOR k:= 0 TO MAX_CNC_MINUS_ONE DO
				pSystem[i].Input.Configuration.Mode[j].Cnc[k].Index:= NO_PART_OF_SYSTEM;
			END_FOR
			FOR k:= 0 TO MAX_AX_MINUS_ONE DO
				pSystem[i].Input.Configuration.Mode[j].Axes[k].Index:= NO_PART_OF_SYSTEM;
			END_FOR
		END_FOR
		
	(* End Loop over all systems *)	
	END_FOR
	
END_ACTION



ACTION CNCConfig:
		
		(********************************************************************************************************)
		(* System Configuration *)

	pSystem[ROBOT].Input.Configuration.Active := 1;
	pSystem[ROBOT].Input.Configuration.Label := 'Robot';

	pSystem[ROBOT].Input.Configuration.SystemCncIndex[0] := CNC;
		
	pSystem[ROBOT].Input.Configuration.SystemPowerAxesIndex[0] := AXIS_PS;

	pSystem[ROBOT].Input.Configuration.SystemAxes[0].Index:= AXIS_X;
	pSystem[ROBOT].Input.Configuration.SystemAxes[0].HomeOrder:= 1;
	pSystem[ROBOT].Input.Configuration.SystemAxes[1].Index:= AXIS_Y;
	pSystem[ROBOT].Input.Configuration.SystemAxes[1].HomeOrder:= 1;
	pSystem[ROBOT].Input.Configuration.SystemAxes[2].Index:= AXIS_Z;
	pSystem[ROBOT].Input.Configuration.SystemAxes[2].HomeOrder:= 1;
	pSystem[ROBOT].Input.Configuration.SystemAxes[3].Index:= AXIS_A;
	pSystem[ROBOT].Input.Configuration.SystemAxes[3].HomeOrder:= 1;
	pSystem[ROBOT].Input.Configuration.SystemAxes[4].Index:= AXIS_B;
	pSystem[ROBOT].Input.Configuration.SystemAxes[4].HomeOrder:= 1;
	pSystem[ROBOT].Input.Configuration.SystemAxes[5].Index:= AXIS_C;
	pSystem[ROBOT].Input.Configuration.SystemAxes[5].HomeOrder:= 1;

	pSystem[ROBOT].Input.Configuration.SystemAxes[6].Index:= AXIS_Q1;
	pSystem[ROBOT].Input.Configuration.SystemAxes[6].HomeOrder:= 0;
	pSystem[ROBOT].Input.Configuration.SystemAxes[7].Index:= AXIS_Q2;
	pSystem[ROBOT].Input.Configuration.SystemAxes[7].HomeOrder:= 0;
	pSystem[ROBOT].Input.Configuration.SystemAxes[8].Index:= AXIS_Q3;
	pSystem[ROBOT].Input.Configuration.SystemAxes[8].HomeOrder:= 0;
	pSystem[ROBOT].Input.Configuration.SystemAxes[9].Index:= AXIS_Q4;
	pSystem[ROBOT].Input.Configuration.SystemAxes[9].HomeOrder:= 0;
	pSystem[ROBOT].Input.Configuration.SystemAxes[10].Index:= AXIS_Q5;
	pSystem[ROBOT].Input.Configuration.SystemAxes[10].HomeOrder:= 0;
	pSystem[ROBOT].Input.Configuration.SystemAxes[11].Index:= AXIS_Q6;
	pSystem[ROBOT].Input.Configuration.SystemAxes[11].HomeOrder:= 0;

	
	(********************************************************************************************************)
	(* Mode Configuration - CNC  *)
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Cnc[0].Index:= CNC;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Cnc[0].Behavior:= STOP_CNC;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Cnc[0].Visible:= 1;

	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[0].Index:= AXIS_X;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[0].Type:= CNC_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[0].Behavior:= HOMEAUTO_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[0].Visible:= 1;

	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[1].Index:= AXIS_Y;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[1].Type:= CNC_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[1].Behavior:= HOMEAUTO_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[1].Visible:= 1;

	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[2].Index:= AXIS_Z;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[2].Type:= CNC_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[2].Behavior:= HOMEAUTO_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[2].Visible:= 1;

	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[3].Index:= AXIS_A;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[3].Type:= CNC_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[3].Behavior:= HOMEAUTO_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[3].Visible:= 1;

	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[4].Index:= AXIS_B;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[4].Type:= CNC_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[4].Behavior:= HOMEAUTO_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[4].Visible:= 1;

	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[5].Index:= AXIS_C;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[5].Type:= CNC_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[5].Behavior:= HOMEAUTO_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[5].Visible:= 1;

	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[6].Index:= AXIS_Q1;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[6].Type:= CNC_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[6].Behavior:= STOP_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[6].Visible:= 1;

	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[7].Index:= AXIS_Q2;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[7].Type:= CNC_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[7].Behavior:= STOP_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[7].Visible:= 1;

	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[8].Index:= AXIS_Q3;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[8].Type:= CNC_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[8].Behavior:= STOP_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[8].Visible:= 1;

	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[9].Index:= AXIS_Q4;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[9].Type:= CNC_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[9].Behavior:= STOP_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[9].Visible:= 1;

	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[10].Index:= AXIS_Q5;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[10].Type:= CNC_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[10].Behavior:= STOP_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[10].Visible:= 1;

	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[11].Index:= AXIS_Q6;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[11].Type:= CNC_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[11].Behavior:= STOP_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_AUTO].Axes[11].Visible:= 1;

	(********************************************************************************************************)
	(* Mode Configuration - AXES  *)
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Cnc[0].Index:= CNC;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Cnc[0].Behavior:= STOP_CNC;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Cnc[0].Visible:= 0;

	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[0].Index:= AXIS_X;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[0].Type:= AUXILIARY_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[0].Behavior:= STOP_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[0].Visible:= 0;

	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[1].Index:= AXIS_Y;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[1].Type:= AUXILIARY_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[1].Behavior:= STOP_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[1].Visible:= 0;

	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[2].Index:= AXIS_Z;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[2].Type:= AUXILIARY_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[2].Behavior:= STOP_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[2].Visible:= 0;

	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[3].Index:= AXIS_A;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[3].Type:= AUXILIARY_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[3].Behavior:= STOP_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[3].Visible:= 0;

	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[4].Index:= AXIS_B;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[4].Type:= AUXILIARY_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[4].Behavior:= STOP_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[4].Visible:= 0;

	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[5].Index:= AXIS_C;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[5].Type:= AUXILIARY_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[5].Behavior:= STOP_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[5].Visible:= 0;

	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[6].Index:= AXIS_Q1;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[6].Type:= JOG_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[6].Behavior:= STOP_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[6].Visible:= 1;

	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[7].Index:= AXIS_Q2;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[7].Type:= JOG_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[7].Behavior:= STOP_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[7].Visible:= 1;

	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[8].Index:= AXIS_Q3;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[8].Type:= JOG_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[8].Behavior:= STOP_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[8].Visible:= 1;

	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[9].Index:= AXIS_Q4;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[9].Type:= JOG_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[9].Behavior:= STOP_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[9].Visible:= 1;

	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[10].Index:= AXIS_Q5;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[10].Type:= JOG_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[10].Behavior:= STOP_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[10].Visible:= 1;

	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[11].Index:= AXIS_Q6;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[11].Type:= JOG_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[11].Behavior:= STOP_AXES;
	pSystem[ROBOT].Input.Configuration.Mode[MODE_JOG].Axes[11].Visible:= 1;

	//		(********************************************************************************************************)
	(* Cnc Configuration *)
	pCnc[CNC].Input.Configuration.Active:= 1;
	pCnc[CNC].Input.Configuration.NcMapObjName:= 'gRobot';
	pCnc[CNC].Input.Configuration.Warnings:= ncOFF;
	pCnc[CNC].Input.Configuration.ErrorTextDataModulName:= 'arnc0001';			
	

	(********************************************************************************************************)
	(* Axes Configuration *)
		
	pAxes[AXIS_X].Input.Configuration.Active:= 1;
	pAxes[AXIS_X].Input.Configuration.NcMapObjName:= 'gAxisX';
	pAxes[AXIS_X].Input.Configuration.ErrorDatObjName:= 'AcpError';
	pAxes[AXIS_X].Input.Configuration.Label			 := 'X';
	pAxes[AXIS_X].Input.Configuration.UnitPositionFaktor:= 1000;
	pAxes[AXIS_X].Input.Configuration.UnitVelocityFaktor:= 1000;
	pAxes[AXIS_X].Input.Configuration.UnitPositionLabel	:= 'mm';
	
	pAxes[AXIS_Y].Input.Configuration.Active:= 1;
	pAxes[AXIS_Y].Input.Configuration.NcMapObjName:= 'gAxisY';
	pAxes[AXIS_Y].Input.Configuration.ErrorDatObjName:= 'AcpError';
	pAxes[AXIS_Y].Input.Configuration.Label			 := 'Y';
	pAxes[AXIS_Y].Input.Configuration.UnitPositionFaktor:= 1000;
	pAxes[AXIS_Y].Input.Configuration.UnitVelocityFaktor:= 1000;
	pAxes[AXIS_Y].Input.Configuration.UnitPositionLabel	:= 'mm';

	pAxes[AXIS_Z].Input.Configuration.Active:= 1;
	pAxes[AXIS_Z].Input.Configuration.NcMapObjName:= 'gAxisZ';
	pAxes[AXIS_Z].Input.Configuration.ErrorDatObjName:= 'AcpError';
	pAxes[AXIS_Z].Input.Configuration.Label			 := 'Z';
	pAxes[AXIS_Z].Input.Configuration.UnitPositionFaktor:= 1000;
	pAxes[AXIS_Z].Input.Configuration.UnitVelocityFaktor:= 1000;
	pAxes[AXIS_Z].Input.Configuration.UnitPositionLabel	:= 'mm';

	pAxes[AXIS_A].Input.Configuration.Active:= 1;
	pAxes[AXIS_A].Input.Configuration.NcMapObjName:= 'gAxisA';
	pAxes[AXIS_A].Input.Configuration.ErrorDatObjName:= 'AcpError';
	pAxes[AXIS_A].Input.Configuration.Label			 := 'A';
	pAxes[AXIS_A].Input.Configuration.UnitPositionFaktor:= 1000;
	pAxes[AXIS_A].Input.Configuration.UnitVelocityFaktor:= 1000;
	pAxes[AXIS_A].Input.Configuration.UnitPositionLabel	:= 'mm';

	pAxes[AXIS_B].Input.Configuration.Active:= 1;
	pAxes[AXIS_B].Input.Configuration.NcMapObjName:= 'gAxisB';
	pAxes[AXIS_B].Input.Configuration.ErrorDatObjName:= 'AcpError';
	pAxes[AXIS_B].Input.Configuration.Label			 := 'B';
	pAxes[AXIS_B].Input.Configuration.UnitPositionFaktor:= 1000;
	pAxes[AXIS_B].Input.Configuration.UnitVelocityFaktor:= 1000;
	pAxes[AXIS_B].Input.Configuration.UnitPositionLabel	:= 'mm';

	pAxes[AXIS_C].Input.Configuration.Active:= 1;
	pAxes[AXIS_C].Input.Configuration.NcMapObjName:= 'gAxisC';
	pAxes[AXIS_C].Input.Configuration.ErrorDatObjName:= 'AcpError';
	pAxes[AXIS_C].Input.Configuration.Label			 := 'C';
	pAxes[AXIS_C].Input.Configuration.UnitPositionFaktor:= 1000;
	pAxes[AXIS_C].Input.Configuration.UnitVelocityFaktor:= 1000;
	pAxes[AXIS_C].Input.Configuration.UnitPositionLabel	:= 'mm';

	pAxes[AXIS_Q1].Input.Configuration.Active:= 1;
	pAxes[AXIS_Q1].Input.Configuration.NcMapObjName:= 'gAxisQ1';
	pAxes[AXIS_Q1].Input.Configuration.ErrorDatObjName:= 'AcpError';
	pAxes[AXIS_Q1].Input.Configuration.Label			 := 'J1';
	pAxes[AXIS_Q1].Input.Configuration.UnitPositionFaktor:= 1000;
	pAxes[AXIS_Q1].Input.Configuration.UnitVelocityFaktor:= 1000;
	pAxes[AXIS_Q1].Input.Configuration.UnitPositionLabel	:= 'deg';
//	(* Uncomment the 2 lines under for real machine *)	
//	pAxes[AXIS_Q1].Input.Configuration.PDOWriteParID[0] := 247;
//	pAxes[AXIS_Q1].Input.Configuration.PDOWriteParType[0] := 8;
//	pAxes[AXIS_Q1].Input.Configuration.PDOReadParID[0] := 111;
//	pAxes[AXIS_Q1].Input.Configuration.PDOReadParType[0] := ncPAR_TYP_DINT;
//	pAxes[AXIS_Q1].Input.Configuration.PDOReadParID[1] := 113;
//	pAxes[AXIS_Q1].Input.Configuration.PDOReadParType[1] := ncPAR_TYP_DINT;
//	pAxes[AXIS_Q1].Input.Configuration.PDOReadParID[2] := 277;
//	pAxes[AXIS_Q1].Input.Configuration.PDOReadParType[2] := ncPAR_TYP_REAL;
	
	pAxes[AXIS_Q2].Input.Configuration.Active:= 1;
	pAxes[AXIS_Q2].Input.Configuration.NcMapObjName:= 'gAxisQ2';
	pAxes[AXIS_Q2].Input.Configuration.ErrorDatObjName:= 'AcpError';
	pAxes[AXIS_Q2].Input.Configuration.Label			 := 'J2';
	pAxes[AXIS_Q2].Input.Configuration.UnitPositionFaktor:= 1000;
	pAxes[AXIS_Q2].Input.Configuration.UnitVelocityFaktor:= 1000;
	pAxes[AXIS_Q2].Input.Configuration.UnitPositionLabel	:= 'deg';
(* Uncomment the 2 lines under for real machine *)	
//	pAxes[AXIS_Q2].Input.Configuration.PDOWriteParID[0] := 247;	
//	pAxes[AXIS_Q2].Input.Configuration.PDOWriteParType[0] := 8;
//	pAxes[AXIS_Q2].Input.Configuration.PDOReadParID[0] := 111;
//	pAxes[AXIS_Q2].Input.Configuration.PDOReadParType[0] := ncPAR_TYP_DINT;
//	pAxes[AXIS_Q2].Input.Configuration.PDOReadParID[1] := 113;
//	pAxes[AXIS_Q2].Input.Configuration.PDOReadParType[1] := ncPAR_TYP_DINT;
//	pAxes[AXIS_Q2].Input.Configuration.PDOReadParID[2] := 277;
//	pAxes[AXIS_Q2].Input.Configuration.PDOReadParType[2] := ncPAR_TYP_REAL;

	pAxes[AXIS_Q3].Input.Configuration.Active:= 1;
	pAxes[AXIS_Q3].Input.Configuration.NcMapObjName:= 'gAxisQ3';
	pAxes[AXIS_Q3].Input.Configuration.ErrorDatObjName:= 'AcpError';
	pAxes[AXIS_Q3].Input.Configuration.Label			 := 'J3';
	pAxes[AXIS_Q3].Input.Configuration.UnitPositionFaktor:= 1000;
	pAxes[AXIS_Q3].Input.Configuration.UnitVelocityFaktor:= 1000;
	pAxes[AXIS_Q3].Input.Configuration.UnitPositionLabel	:= 'deg';
	(* Uncomment the 2 lines under for real machine *)	
//	pAxes[AXIS_Q3].Input.Configuration.PDOWriteParID[0] := 247;
//	pAxes[AXIS_Q3].Input.Configuration.PDOWriteParType[0] := 8;
//		pAxes[AXIS_Q3].Input.Configuration.PDOReadParID[0] := 111;
//		pAxes[AXIS_Q3].Input.Configuration.PDOReadParType[0] := ncPAR_TYP_DINT;
//		pAxes[AXIS_Q3].Input.Configuration.PDOReadParID[1] := 113;
//		pAxes[AXIS_Q3].Input.Configuration.PDOReadParType[1] := ncPAR_TYP_DINT;
//		pAxes[AXIS_Q3].Input.Configuration.PDOReadParID[2] := 277;
//		pAxes[AXIS_Q3].Input.Configuration.PDOReadParType[2] := ncPAR_TYP_REAL;


	pAxes[AXIS_Q4].Input.Configuration.Active:= 1;
	pAxes[AXIS_Q4].Input.Configuration.NcMapObjName:= 'gAxisQ4';
	pAxes[AXIS_Q4].Input.Configuration.ErrorDatObjName:= 'AcpError';
	pAxes[AXIS_Q4].Input.Configuration.Label			 := 'J4';
	pAxes[AXIS_Q4].Input.Configuration.UnitPositionFaktor:= 1000;
	pAxes[AXIS_Q4].Input.Configuration.UnitVelocityFaktor:= 1000;
	pAxes[AXIS_Q4].Input.Configuration.UnitPositionLabel	:= 'deg';
//	(* Uncomment the 2 lines under for real machine *)	
//	pAxes[AXIS_Q4].Input.Configuration.PDOWriteParID[0] := 247;	
//	pAxes[AXIS_Q4].Input.Configuration.PDOWriteParType[0] := 8;
//		pAxes[AXIS_Q4].Input.Configuration.PDOReadParID[0] := 111;
//		pAxes[AXIS_Q4].Input.Configuration.PDOReadParType[0] := ncPAR_TYP_DINT;
//		pAxes[AXIS_Q4].Input.Configuration.PDOReadParID[1] := 113;
//		pAxes[AXIS_Q4].Input.Configuration.PDOReadParType[1] := ncPAR_TYP_DINT;
//		pAxes[AXIS_Q4].Input.Configuration.PDOReadParID[2] := 277;
//		pAxes[AXIS_Q4].Input.Configuration.PDOReadParType[2] := ncPAR_TYP_REAL;


	pAxes[AXIS_Q5].Input.Configuration.Active:= 1;
	pAxes[AXIS_Q5].Input.Configuration.NcMapObjName:= 'gAxisQ5';
	pAxes[AXIS_Q5].Input.Configuration.ErrorDatObjName:= 'AcpError';
	pAxes[AXIS_Q5].Input.Configuration.Label			 := 'J5';
	pAxes[AXIS_Q5].Input.Configuration.UnitPositionFaktor:= 1000;
	pAxes[AXIS_Q5].Input.Configuration.UnitVelocityFaktor:= 1000;
	pAxes[AXIS_Q5].Input.Configuration.UnitPositionLabel	:= 'deg';
	(* Uncomment the 2 lines under for real machine *)	
//	pAxes[AXIS_Q5].Input.Configuration.PDOWriteParID[0] := 247;
//	pAxes[AXIS_Q5].Input.Configuration.PDOWriteParType[0] := 8;
//		pAxes[AXIS_Q5].Input.Configuration.PDOReadParID[0] := 111;
//		pAxes[AXIS_Q5].Input.Configuration.PDOReadParType[0] := ncPAR_TYP_DINT;
//		pAxes[AXIS_Q5].Input.Configuration.PDOReadParID[1] := 113;
//		pAxes[AXIS_Q5].Input.Configuration.PDOReadParType[1] := ncPAR_TYP_DINT;
//		pAxes[AXIS_Q5].Input.Configuration.PDOReadParID[2] := 277;
//		pAxes[AXIS_Q5].Input.Configuration.PDOReadParType[2] := ncPAR_TYP_REAL;


	pAxes[AXIS_Q6].Input.Configuration.Active:= 1;
	pAxes[AXIS_Q6].Input.Configuration.NcMapObjName:= 'gAxisQ6';
	pAxes[AXIS_Q6].Input.Configuration.ErrorDatObjName:= 'AcpError';
	pAxes[AXIS_Q6].Input.Configuration.Label			 := 'J6';
	pAxes[AXIS_Q6].Input.Configuration.UnitPositionFaktor:= 1000;
	pAxes[AXIS_Q6].Input.Configuration.UnitVelocityFaktor:= 1000;
	pAxes[AXIS_Q6].Input.Configuration.UnitPositionLabel	:= 'deg';
//	(* Uncomment the 2 lines under for real machine *)	
//	pAxes[AXIS_Q6].Input.Configuration.PDOWriteParID[0] := 247;
//	pAxes[AXIS_Q6].Input.Configuration.PDOWriteParType[0] := 8;
//		pAxes[AXIS_Q6].Input.Configuration.PDOReadParID[0] := 111;
//		pAxes[AXIS_Q6].Input.Configuration.PDOReadParType[0] := ncPAR_TYP_DINT;
//		pAxes[AXIS_Q6].Input.Configuration.PDOReadParID[1] := 113;
//		pAxes[AXIS_Q6].Input.Configuration.PDOReadParType[1] := ncPAR_TYP_DINT;
//		pAxes[AXIS_Q6].Input.Configuration.PDOReadParID[2] := 277;
//		pAxes[AXIS_Q6].Input.Configuration.PDOReadParType[2] := ncPAR_TYP_REAL;


	pAxes[AXIS_PS].Input.Configuration.Active:= 1;
	pAxes[AXIS_PS].Input.Configuration.NcMapObjName:= 'gPowerSupply';
	pAxes[AXIS_PS].Input.Configuration.ErrorDatObjName:= 'AcpError';
	pAxes[AXIS_PS].Input.Configuration.Label			 := 'AXIS_PS';
	pAxes[AXIS_PS].Input.Configuration.UnitPositionFaktor:= 1000;
	pAxes[AXIS_PS].Input.Configuration.UnitVelocityFaktor:= 1000;

	//pAxes[AXIS_FRAME_X].Input.Configuration.Active:= 1;
	//pAxes[AXIS_FRAME_X].Input.Configuration.NcMapObjName:= 'gAxisFrameX';
	//pAxes[AXIS_FRAME_X].Input.Configuration.ErrorDatObjName:= 'AcpError';
	//pAxes[AXIS_FRAME_X].Input.Configuration.UnitPositionFaktor:= 1000;
	//pAxes[AXIS_FRAME_X].Input.Configuration.UnitVelocityFaktor:= 1000;

	
	(********************************************************************************************************)

	
END_ACTION

ACTION InitAxesObj:
	gAxisQ1;
	gAxisQ2;
	gAxisQ3;
	gAxisQ4;
	gAxisQ5;
	gAxisQ6;
	gAxisX;
	gAxisY;
	gAxisZ;
	gAxisA;
	gAxisB;
	gAxisC;
END_ACTION

ACTION InitCncObj:
	
	gRobot;
	
END_ACTION