VAR

	Cp : MXPointType;

	Cp1 : MXPointType;

	Jp : MXAxisTargetType;

	Frm : MXFrameType := (Orient:=(Type:=1));

	Frm1 : MXFrameType := (Orient:=(Type:=1));
	
	Vel : MXVelocityType := (Mode := 2);
	
	Tool : MXToolType;

	i : USINT;

END_VAR

VAR {PLC_GLOBAL AT 'HmiJogCtrl'}

	ToolEnableSync : BOOL;
	FrmEnableSync : BOOL;
	JogStepSync : LREAL;

END_VAR

VAR {PLC_GLOBAL AT PLC}

	PointSync : MXPointType;
	FrmSync : MXFrameType;
	JointSync : MXAxisTargetType;
	ToolSync : MXToolType;
	JointTCPSync : BOOL;
	JointLimitsSync : HmiJointLimitType[6];

END_VAR

VAR CONSTANT

	MX_POINT_ZERO : MXPointType := (0);
	MX_TOOL_ZERO : MXToolType := (0);
	MX_FRAME_ZERO : MXFrameType := (0);

END_VAR

PROGRAM _MAIN

	EXEC('JogInit', langId := 1);
	
	FOR i := 0 TO 5 DO
		IF MoveAxis[i] <> 0 THEN
			EXIT;
		END_IF
	END_FOR 

	IF ToolEnableSync THEN
		Tool := ToolSync;
	ELSE
		Tool := MX_TOOL_ZERO;		
	END_IF
	
	IF FrmEnableSync THEN
		Frm := FrmSync;
	ELSE
		Frm := MX_FRAME_ZERO;
	END_IF

	GetAxisTarget(Jp);
	MXJointToPointEx($TRF_DATA_MX, Jp.JointAxis, Cp, MX_CARDAN_XYZ_ANGLES, MX_TRF_TYPE_DIRECT, Tool, MX_FRAME_ZERO, MX_POINT_ZERO);
	
	CASE JogMode OF
		0:
			Vel.v := 60 * JogSpeed;

			WHILE TRUE DO
				Jp.JointAxis[i] := Jp.JointAxis[i] + MoveAxis[i] * 1.0;
							
				IF Jp.JointAxis[i] >= JointLimitsSync[i].Max THEN
					Jp.JointAxis[i] := JointLimitsSync[i].Max - 0.05;
				ELSE IF Jp.JointAxis[i] <= JointLimitsSync[i].Min THEN
					Jp.JointAxis[i] := JointLimitsSync[i].Min + 0.05;
				END_IF

				MoveA(Jp, Vel := Vel);
			END_WHILE

		1: (* Base Mode *)
			MXToFrame(Frm, Cp, Cp1);
			Frm.Pos := Cp.Pos;
			Frm1 := MX_FRAME_ZERO;
			Cp1.Pos := MX_POINT_ZERO.Pos;
		
			Vel.v := 60/JogStepSync * JogSpeed;

			WHILE TRUE DO

				CASE i OF
					0:
						Frm1.Pos.x := Frm1.Pos.x + MoveAxis[i] * JogStepSync;
					1:
						Frm1.Pos.y := Frm1.Pos.y + MoveAxis[i] * JogStepSync;
					2:
						Frm1.Pos.z := Frm1.Pos.z + MoveAxis[i] * JogStepSync;
					3..5:
						Frm1.Orient.Angle[i - 3] := Frm1.Orient.Angle[i - 3] + MoveAxis[i] * JogStepSync;
				END_CASE
				
				MXFrameApply(Frm, Frm1);
				
				MoveJ(Cp1, Frm := Frm, Tool := Tool,  Vel := Vel);
			END_WHILE

		2: (* Tool Mode *)
			Frm.Pos := Cp.Pos;
			Frm.Orient := Cp.Orient;

			Cp := MX_POINT_ZERO;

			Vel.v := 60/JogStepSync * JogSpeed;

			WHILE TRUE DO
				CASE i OF
					0:
						Cp.Pos.x := Cp.Pos.x + MoveAxis[i] * JogStepSync;
					1:
						Cp.Pos.y := Cp.Pos.y + MoveAxis[i] * JogStepSync;
					2:
						Cp.Pos.z := Cp.Pos.z + MoveAxis[i] * JogStepSync;
					3..5:
						Cp.Orient.Angle[i - 3] := Cp.Orient.Angle[i - 3] + MoveAxis[i] * JogStepSync;
				END_CASE
				MoveJ(Cp, Frm := Frm, Tool := Tool, Vel := Vel);
			END_WHILE

		3: (* Direct Mode *)
			IF JointTCPSync THEN
				Vel.v := 60 * JogSpeed;
				MoveA(JointSync, Vel := Vel);
			ELSE
				Vel.v := 60/JogStepSync * JogSpeed;
				MoveJ(PointSync, Frm := Frm, Tool := Tool, Vel := Vel);
			END_IF
	END_CASE

END_PROGRAM