(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Program: HmiKeyControl
 * File: HmiKeyControl.typ
 * Author: B&R, International Applications
 * Created: March 16, 2009
 ********************************************************************
 * Data types of program HmiKeyControl
 ********************************************************************)

TYPE
	MatrixOut_typ : 	STRUCT 
		phi : LREAL;
		theta : LREAL;
		psi : LREAL;
	END_STRUCT;
	MatrixRow_typ : 	STRUCT 
		Line : ARRAY[0..2]OF LREAL;
	END_STRUCT;
	RotationMatrixInput_typ : 	STRUCT 
		M1 : ARRAY[0..2]OF MatrixRow_typ;
		measure : UDINT;
		angles_type : UDINT;
		epsilon : LREAL;
		desired_phi : LREAL;
		desired_theta : LREAL;
		desired_psi : LREAL;
	END_STRUCT;
	HmiKeyControlStateSteps_Typ : 
		(
		HMIKEYCONSTATESTEP_DISABLED,
		HMIKEYCONSTATESTEP_STANDBY,
		HMIKEYCONSTATESTEP_HOME,
		HMIKEYCONSTATESTEP_CHANGEMODE,
		HMIKEYCONSTATESTEP_ACTIVE_JOG,
		HMIKEYCONSTATESTEP_ACTIVE_AUTO,
		HMIKEYCONSTATESTEP_ERROR
		);
	TcpFrameTest_typ : 	STRUCT 
		X : LREAL;
		Y : LREAL;
		Z : LREAL;
		A : LREAL;
		B : LREAL;
		C : LREAL;
	END_STRUCT;
	SumInData_typ : 	STRUCT 
		measure : UDINT;
		reserve_align0 : UDINT;
		P1 : TRF_FRAMEPOS_typ;
		dP : TRF_FRAMEPOS_typ;
		epsilon : LREAL;
		desired_phi : LREAL;
		desired_theta : LREAL;
		desired_psi : LREAL;
		angles_type : UDINT;
		reserve_align1 : UDINT;
	END_STRUCT;
	SumOutData_typ : 	STRUCT 
		P2 : TRF_FRAMEPOS_typ;
	END_STRUCT;
	CreateInData_typ : 	STRUCT 
		phi : LREAL;
		theta : LREAL;
		psi : LREAL;
		measure : UDINT;
		angles_type : UDINT;
		epsilon : LREAL;
	END_STRUCT;
	Angletypout_typ : 	STRUCT 
		phi : LREAL;
		theta : LREAL;
		psi : LREAL;
	END_STRUCT;
	Angletyp2_typ : 	STRUCT 
		phi : LREAL;
		theta : LREAL;
		psi : LREAL;
		measure : UDINT;
		angles_type1 : UDINT;
		angles_type2 : UDINT;
		reserve_align0 : UDINT;
		epsilon : LREAL;
		desired_phi : LREAL;
		desired_theta : LREAL;
		desired_psi : LREAL;
	END_STRUCT;
	HmiKeyCtrlHomeState_Type : 
		(
		HOMESTATESTEP_COMMAND,
		HOMESTATESTEP_HOMING,
		HOMESTATESTEP_W_END
		);
	HmiKeyCtrlInternal_Type : 	STRUCT 
		OldCommand : HmiKeyControlInputCommand_Type;
		HmiKeyControlState : HmiKeyControlStateSteps_Typ;
		HomeState : ARRAY[0..MAX_AX_MINUS_ONE]OF HmiKeyCtrlHomeState_Type;
		OldJogEnable : BOOL;
		OldRun : BOOL;
	END_STRUCT;
	CreateOutData_typ : 	STRUCT 
		m11 : LREAL;
		m12 : LREAL;
		m13 : LREAL;
		m21 : LREAL;
		m22 : LREAL;
		m23 : LREAL;
		m31 : LREAL;
		m32 : LREAL;
		m33 : LREAL;
	END_STRUCT;
END_TYPE
