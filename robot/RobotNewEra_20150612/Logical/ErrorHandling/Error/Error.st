(********************************************************************
 * COPYRIGHT --  Bernecker + Rainer
 ********************************************************************
 * Program: Error
 * File: Error.st
 * Author: haged
 * Created: July 07, 2010
 ********************************************************************
 * Implementation of program Error
 ********************************************************************)

PROGRAM _INIT
	
	WarnMessage;
	
	Error.Output.Monitor.ErrorHandlingAddress := ADR(Error);
	RTInfo_0(enable := 1);
	cycT := RTInfo_0.cycle_time / 1000;
	
END_PROGRAM



PROGRAM _CYCLIC
	
	Error.Input.Parameter.AxesAddress := HmiGlobal.Address.AxesAddress;
	Error.Input.Parameter.CncAddress := HmiGlobal.Address.CncAddress;
	Error.Input.Parameter.SystemAddress := HmiGlobal.Address.SystemAddress;
	
	IF	(Error.Input.Parameter.AxesAddress <> 0) 
		AND	(Error.Input.Parameter.CncAddress <> 0)
		AND	(Error.Input.Parameter.SystemAddress <> 0) THEN
		
		pAxes ACCESS Error.Input.Parameter.AxesAddress;
		pCnc ACCESS Error.Input.Parameter.CncAddress;
		pSystem ACCESS Error.Input.Parameter.SystemAddress;
	
	ELSE
		RETURN;	
	END_IF	
	
	WarnMessage[1] := NOT HmiRetain.HmiKeyControl.MechHomeOK;
	
	//Alarm monitor
	AlarmAcknDelay := AlarmAcknDelay + cycT;
	
	IF (AlarmAcknDelay > 500)THEN
		IF (pCnc[0].Output.State.Errorstop = 1) THEN
			IF (pCnc[0].Output.Error.Count = 0) THEN
				Error.Output.Monitor.AlarmImage[8] := 1;
			ELSE
				Error.Output.Monitor.AlarmImage[0] := 1;
			END_IF
		ELSE
			Error.Output.Monitor.AlarmImage[0] := 0;
			Error.Output.Monitor.AlarmImage[8] := 0;
		END_IF
		
		FOR i:= 6 TO MAX_AX_MINUS_ONE DO
			IF (pAxes[i].Output.State.Errorstop = 1) 
				OR (pAxes[i].Output.Status.AxisError = 1)THEN
				IF (pAxes[i].Output.Error.Count = 0)  THEN
					Error.Output.Monitor.AlarmImage[i+3] := 1;
				ELSE
					Error.Output.Monitor.AlarmImage[i-5] := 1;
				END_IF
			ELSE
				Error.Output.Monitor.AlarmImage[i+3] := 0;	
				Error.Output.Monitor.AlarmImage[i-5] := 0;
			END_IF
		END_FOR
	END_IF 
		
	//HmiKeyControl.Output.Status.Error := 0;
	IF (HmiKeyControl.Output.Status.Error = 1) THEN

		IF (pCnc[0].Output.State.Moving = 1)THEN
			pCnc[0].Input.Command.Stop := 1;
		END_IF
	END_IF
	
	HmiKeyControl.Output.Status.Error := 0;
	
	FOR i:= 0 TO MAX_ALARMS DO					//axes alarm acknowledge
		IF (Error.Output.Monitor.AlarmImage[i] = 1) THEN
			HmiKeyControl.Output.Status.Error := 1;
			EXIT;
		END_IF
	END_FOR
	
	IF ((HmiKeyControl.Input.Command.StopKey <> 0) AND (OldStopKey = 0) 
		AND (pSystem[0].Output.State.Errorstop = 0)) THEN
		Error.Input.Command.Acknowledge := 1;
	END_IF
	OldStopKey := HmiKeyControl.Input.Command.StopKey;
	
	IF (Error.Input.Command.Acknowledge = 1) THEN
		Error.Input.Command.Acknowledge := 0;
		pSystem[0].Input.Command.Acknowledge := 1;
		HmiKeyControl.Output.Status.Error := 0;
		FOR i:= 0 TO MAX_ALARMS DO					//axes alarm acknowledge
			Error.Output.Monitor.AlarmImage[i] := 0;
		END_FOR
		FOR i:= 0 TO WARN_MESSAGE_NUM DO
			WarnMessage[i]:=0;
		END_FOR
		AlarmAcknDelay := 0;
		
	END_IF

END_PROGRAM