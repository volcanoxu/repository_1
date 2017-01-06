(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Program: Axes
 * File: Actions.st
 * Author: B&R
 * Created: February 10, 2009
 ********************************************************************
 * Implementation of program Axes
 ********************************************************************)

ACTION AxACP10Access:

	pAxesPrivate.AccessStatus:= ncaccess( ncACP10MAN, ADR(pAxes.Input.Configuration.NcMapObjName), ADR(pAxesPrivate.AxesDatAddress));

	IF(pAxesPrivate.AccessStatus = ncOK)THEN
 		pAxesPrivate.AccessOk:= 1;
		pAxes.Output.Status.AccessOk:= 1;
 	ELSE
		pAxesPrivate.AccessOk:= 0;
		pAxes.Output.Status.AccessOk:= 0;
		pAxes.Output.Error.Count:= 1;
		pAxes.Output.Error.Text.Line1:= 'Axes access error';
	END_IF
	
END_ACTION

ACTION AxACP10SetCommands:
	
	IF	(pAxes.Input.Command.Enable <> 0)AND
		((pMCAxes.ReadStatus.Errorstop = 1)OR
  		((pAxes.Output.Status.AxisError = 1)AND(pMCAxes.ReadStatus.Disabled = 1)))THEN
 		pMCAxes.Power.Enable:= 0;
	ELSIF(pAxes.Input.Command.Enable <> 0)THEN
		pMCAxes.Power.Enable:= 1;
	ELSE
		pMCAxes.Power.Enable:= 0;
	END_IF
	
	IF(pAxes.Input.Command.InitAxisPar <> 0)THEN
  		pMCAxes.BR_InitAxisPar.Execute:= 1;
 	END_IF
	
	IF(pAxes.Input.Command.InitAxisSubjecPar <> 0)THEN
 		pMCAxes.BR_InitAxisSubjectPar.Execute:= 1;
 	END_IF
	
	IF(pAxes.Input.Command.SaveAxisPar <> 0)THEN
 		pMCAxes.BR_SaveAxisPar.Execute:= 1;
 	END_IF
	
	IF(pAxes.Input.Command.LoadAxisPar <> 0)THEN
 		pMCAxes.BR_LoadAxisPar.Execute:= 1;
 	END_IF
	
	(* Added by RJ *)
	IF (pAxes.Input.Command.WriteAxisPar <> 0) THEN
		pMCAxes.BR_WriteParID.Execute := 1;
	END_IF
			
	IF(pAxes.Input.Command.Home <> 0)THEN
		pAxesPrivate.HomeAutoPosition:= 0;
 		pMCAxes.Home.Execute:= 1;
		pAxes.Output.Status.DryRunActive:= 0;
 	END_IF
	
	IF(pAxes.Input.Command.HomeAutoPosition <> 0)THEN
		pAxesPrivate.HomeAutoPosition:= 1;
		pMCAxes.Home.Execute:= 1;
		pAxes.Output.Status.DryRunActive:= 0;
	END_IF
	
	IF(pAxes.Input.Command.MoveAbsolute <> 0)THEN
		IF(pMCAxes.MoveAbsolute_0.Busy = 1)THEN
 			pMCAxes.MoveAbsolute_1.Execute:= 1;
		ELSE
			pMCAxes.MoveAbsolute_0.Execute:= 1;
		END_IF
		pAxes.Output.Status.DryRunActive:= 0;
 	END_IF
	
	IF(pAxes.Input.Command.MoveAdditive <> 0)THEN
 		IF(pMCAxes.MoveAdditive_0.Busy = 1)THEN
			pMCAxes.MoveAdditive_1.Execute:= 1;
		ELSE
		 	pMCAxes.MoveAdditive_0.Execute:= 1;
		END_IF
		pAxes.Output.Status.DryRunActive:= 0;
 	END_IF
	
	IF(pAxes.Input.Command.MoveVelocity <> 0)THEN
		IF(pMCAxes.MoveVelocity_0.Busy = 1)THEN
 			pMCAxes.MoveVelocity_1.Execute:= 1;
		ELSE
			pMCAxes.MoveVelocity_0.Execute:= 1;
		END_IF
		pAxes.Output.Status.DryRunActive:= 0;
 	END_IF
	
	IF(pAxes.Input.Command.Stop <> 0)THEN
		IF(pAxes.Output.State.Stopping = 0)THEN
	 		pMCAxes.Stop.Execute:= 1;
		ELSE
			pAxes.Input.Command.Stop:= 0;
		END_IF
		pAxes.Output.Status.DryRunActive:= 0;
 	END_IF
	
	IF(pAxes.Input.Command.EmergencyStop <> 0)THEN
		IF(pAxes.Output.State.Stopping = 0)THEN
	 		pMCAxes.Stop.Execute:= 1;
		ELSE
			pAxes.Input.Command.EmergencyStop:= 0;
		END_IF
		pAxes.Output.Status.DryRunActive:= 0;
	END_IF
	
	IF(pAxes.Input.Command.Reset <> 0)THEN
 		pMCAxes.Reset.Execute:= 1;
	END_IF
	
	IF(pAxes.Input.Command.ErrorAcknowledge <> 0)AND(pAxes.Output.Status.AxisError = 1)THEN
 		pMCAxes.ReadAxisError.Acknowledge:= 1;
	END_IF
	
	IF(pAxes.Input.Command.CyclicPosition <> 0)THEN
		pAxes.Input.Parameter.CyclicPosition:= pAxes.Output.Monitor.CyclicPosition;
 		pMCAxes.BR_MoveCyclicPosition.Enable:= 1;
		pAxes.Output.Status.DryRunActive:= 0;
 	END_IF
	
	IF(pAxes.Input.Command.StartDryRun <> 0)AND(pAxes.Output.State.Standstill)THEN
 		pAxes.Output.Status.DryRunActive:= 1;
	END_IF
	
	IF(pAxes.Input.Command.Simulation <> 0)THEN
 		pMCAxes.BR_Simulation.Execute:= 1; 
	END_IF	

END_ACTION

ACTION AxACP10ResetCommands:
	
	pAxesPrivate.CommandError:= 0;
	
	IF(pMCAxes.BR_InitAxisPar.Busy = 1)THEN
 		pMCAxes.BR_InitAxisPar.Execute:= 0;
		pAxes.Input.Command.InitAxisPar:= 0;
	ELSIF(pMCAxes.BR_InitAxisPar.Error)THEN
		pMCAxes.BR_InitAxisPar.Execute:= 0;
		pAxes.Input.Command.InitAxisPar:= 0;
		pAxesPrivate.CommandError:= 1;
		pAxesPrivate.CommandErrorID:= pMCAxes.BR_InitAxisPar.ErrorID;
		pAxesPrivate.CommandErrorName:= 'InitAxisPar';
 	END_IF
	
	IF(pMCAxes.BR_InitAxisSubjectPar.Busy = 1)THEN
 		pMCAxes.BR_InitAxisSubjectPar.Execute:= 0;
		pAxes.Input.Command.InitAxisSubjecPar:= 0;
	ELSIF(pMCAxes.BR_InitAxisSubjectPar.Error = 1)THEN
 		pMCAxes.BR_InitAxisSubjectPar.Execute:= 0;
		pAxes.Input.Command.InitAxisSubjecPar:= 0;
		pAxesPrivate.CommandError:= 1;
		pAxesPrivate.CommandErrorID:= pMCAxes.BR_InitAxisSubjectPar.ErrorID;
		pAxesPrivate.CommandErrorName:= 'InitAxisSubjecPar';
 	END_IF
	
	IF(pMCAxes.BR_SaveAxisPar.Busy = 1)THEN
 		pMCAxes.BR_SaveAxisPar.Execute:= 0;
		pAxes.Input.Command.SaveAxisPar:= 0;
	ELSIF(pMCAxes.BR_SaveAxisPar.Error = 1)THEN
 		pMCAxes.BR_SaveAxisPar.Execute:= 0;
		pAxes.Input.Command.SaveAxisPar:= 0;
		pAxesPrivate.CommandError:= 1;
		pAxesPrivate.CommandErrorID:= pMCAxes.BR_SaveAxisPar.ErrorID;
		pAxesPrivate.CommandErrorName:= 'SaveAxisPar';
 	END_IF
	
	IF(pMCAxes.BR_LoadAxisPar.Busy = 1)THEN
 		pMCAxes.BR_LoadAxisPar.Execute:= 0;
		pAxes.Input.Command.LoadAxisPar:= 0;
	ELSIF(pMCAxes.BR_LoadAxisPar.Error = 1)THEN
 		pMCAxes.BR_LoadAxisPar.Execute:= 0;
		pAxes.Input.Command.LoadAxisPar:= 0;
		pAxesPrivate.CommandError:= 1;
		pAxesPrivate.CommandErrorID:= pMCAxes.BR_LoadAxisPar.ErrorID;
		pAxesPrivate.CommandErrorName:= 'LoadAxisPar';
	END_IF
	(* Added by RJ *)
	IF (pMCAxes.BR_WriteParID.Busy = 1) THEN
		pMCAxes.BR_WriteParID.Execute := 0;
		pAxes.Input.Command.WriteAxisPar := 0;
	ELSIF (pMCAxes.BR_WriteParID.Error = 1) THEN
		pMCAxes.BR_WriteParID.Execute := 0;
		pAxes.Input.Command.WriteAxisPar := 0;
		pAxesPrivate.CommandError := 1;
		pAxesPrivate.CommandErrorID := pMCAxes.BR_WriteParID.ErrorID;
		pAxesPrivate.CommandErrorName := 'WriteParID';
	END_IF
	
	IF(pMCAxes.Home.Busy = 1)THEN
 		pMCAxes.Home.Execute:= 0;
		pAxes.Input.Command.Home:= 0;
		pAxes.Input.Command.HomeAutoPosition:= 0;
	ELSIF(pMCAxes.Home.Error = 1)THEN
 		pMCAxes.Home.Execute:= 0;
		pAxes.Input.Command.Home:= 0;
		pAxes.Input.Command.HomeAutoPosition:= 0;
		pAxesPrivate.CommandError:= 1;
		pAxesPrivate.CommandErrorID:= pMCAxes.Home.ErrorID;
		pAxesPrivate.CommandErrorName:= 'Home';
 	END_IF
	
	IF(pMCAxes.MoveAbsolute_0.Busy = 1)THEN
 		pMCAxes.MoveAbsolute_0.Execute:= 0;
		pAxes.Input.Command.MoveAbsolute:= 0;
	ELSIF(pMCAxes.MoveAbsolute_0.Error = 1)THEN
 		pMCAxes.MoveAbsolute_0.Execute:= 0;
		pAxes.Input.Command.MoveAbsolute:= 0;
		pAxesPrivate.CommandError:= 1;
		pAxesPrivate.CommandErrorID:= pMCAxes.MoveAbsolute_0.ErrorID;
		pAxesPrivate.CommandErrorName:= 'MoveAbsolute_0';	
 	END_IF
	
	IF(pMCAxes.MoveAbsolute_1.Busy = 1)THEN
 		pMCAxes.MoveAbsolute_1.Execute:= 0;
		pAxes.Input.Command.MoveAbsolute:= 0;
	ELSIF(pMCAxes.MoveAbsolute_1.Error = 1)THEN
 		pMCAxes.MoveAbsolute_1.Execute:= 0;
		pAxes.Input.Command.MoveAbsolute:= 0;
		pAxesPrivate.CommandError:= 1;
		pAxesPrivate.CommandErrorID:= pMCAxes.MoveAbsolute_1.ErrorID;
		pAxesPrivate.CommandErrorName:= 'MoveAbsolute_1';	
 	END_IF
	
	IF(pMCAxes.MoveAdditive_0.Busy = 1)THEN
 		pMCAxes.MoveAdditive_0.Execute:= 0;
		pAxes.Input.Command.MoveAdditive:= 0;
	ELSIF(pMCAxes.MoveAdditive_0.Error = 1)THEN
 		pMCAxes.MoveAdditive_0.Execute:= 0;
		pAxes.Input.Command.MoveAdditive:= 0;
		pAxesPrivate.CommandError:= 1;
		pAxesPrivate.CommandErrorID:= pMCAxes.MoveAdditive_0.ErrorID;
		pAxesPrivate.CommandErrorName:= 'MoveAdditive_0';
 	END_IF
	
	IF(pMCAxes.MoveAdditive_1.Busy = 1)THEN
 		pMCAxes.MoveAdditive_1.Execute:= 0;
		pAxes.Input.Command.MoveAdditive:= 0;
	ELSIF(pMCAxes.MoveAdditive_1.Error = 1)THEN
 		pMCAxes.MoveAdditive_1.Execute:= 0;
		pAxes.Input.Command.MoveAdditive:= 0;
		pAxesPrivate.CommandError:= 1;
		pAxesPrivate.CommandErrorID:= pMCAxes.MoveAdditive_1.ErrorID;
		pAxesPrivate.CommandErrorName:= 'MoveAdditive_1';
 	END_IF
	
	IF(pMCAxes.MoveVelocity_0.Busy = 1)THEN
 		pMCAxes.MoveVelocity_0.Execute:= 0;
		pAxes.Input.Command.MoveVelocity:= 0;
	ELSIF(pMCAxes.MoveVelocity_0.Error = 1)THEN
 		pMCAxes.MoveVelocity_0.Execute:= 0;
		pAxes.Input.Command.MoveVelocity:= 0;
		pAxesPrivate.CommandError:= 1;
		pAxesPrivate.CommandErrorID:= pMCAxes.MoveVelocity_0.ErrorID;
		pAxesPrivate.CommandErrorName:= 'MoveVelocity_0';
 	END_IF
	
	IF(pMCAxes.MoveVelocity_1.Busy = 1)THEN
 		pMCAxes.MoveVelocity_1.Execute:= 0;
		pAxes.Input.Command.MoveVelocity:= 0;
	ELSIF(pMCAxes.MoveVelocity_1.Error = 1)THEN
 		pMCAxes.MoveVelocity_1.Execute:= 0;
		pAxes.Input.Command.MoveVelocity:= 0;
		pAxesPrivate.CommandError:= 1;
		pAxesPrivate.CommandErrorID:= pMCAxes.MoveVelocity_1.ErrorID;
		pAxesPrivate.CommandErrorName:= 'MoveVelocity_1';
 	END_IF
	
	IF(pMCAxes.Stop.Done = 1)THEN
 		pMCAxes.Stop.Execute:= 0;
		pAxes.Input.Command.Stop:= 0;
		pAxes.Input.Command.EmergencyStop:= 0;
	ELSIF(pMCAxes.Stop.Error = 1)THEN
 		pMCAxes.Stop.Execute:= 0;
		pAxes.Input.Command.Stop:= 0;
		pAxes.Input.Command.EmergencyStop:= 0;
		pAxesPrivate.CommandError:= 1;
		pAxesPrivate.CommandErrorID:= pMCAxes.Stop.ErrorID;
		pAxesPrivate.CommandErrorName:= 'Stop';
 	END_IF
	
	IF(pMCAxes.Reset.Done = 1)THEN
 		pMCAxes.Reset.Execute:= 0;
		pAxes.Input.Command.Reset:= 0;
	ELSIF(pMCAxes.Reset.Error = 1)THEN
 		pMCAxes.Reset.Execute:= 0;
		pAxes.Input.Command.Reset:= 0;
		pAxesPrivate.CommandError:= 1;
		pAxesPrivate.CommandErrorID:= pMCAxes.Reset.ErrorID;
		pAxesPrivate.CommandErrorName:= 'Reset';
 	END_IF
	
	IF(pMCAxes.ReadAxisError.Valid = 1)THEN
 		pMCAxes.ReadAxisError.Acknowledge:= 0;
		pAxes.Input.Command.ErrorAcknowledge:= 0;
	ELSIF(pMCAxes.ReadAxisError.Busy = 1)THEN
 		pMCAxes.ReadAxisError.Acknowledge:= 0;
		pAxes.Input.Command.ErrorAcknowledge:= 0;
	ELSIF(pMCAxes.ReadAxisError.Error = 1)THEN
 		pMCAxes.ReadAxisError.Acknowledge:= 0;
		pAxes.Input.Command.ErrorAcknowledge:= 0;
		pAxesPrivate.CommandError:= 1;
		pAxesPrivate.CommandErrorID:= pMCAxes.ReadAxisError.ErrorID;
		pAxesPrivate.CommandErrorName:= 'ErrorAcknowledge';
 	END_IF
	
	IF(pMCAxes.BR_MoveCyclicPosition.Busy = 1)THEN
 		pAxes.Input.Command.CyclicPosition:= 0;
	ELSIF(pMCAxes.BR_MoveCyclicPosition.Valid = 1)THEN
		pAxes.Input.Command.CyclicPosition:= 0;
	ELSIF(pMCAxes.BR_MoveCyclicPosition.CommandAborted = 1)THEN
 		pMCAxes.BR_MoveCyclicPosition.Enable:= 0;
	ELSIF(pMCAxes.BR_MoveCyclicPosition.Error = 1)THEN
 		pMCAxes.BR_MoveCyclicPosition.Enable:= 0;
		pAxes.Input.Command.CyclicPosition:= 0;
		pAxesPrivate.CommandError:= 1;
		pAxesPrivate.CommandErrorID:= pMCAxes.BR_MoveCyclicPosition.ErrorID;
		pAxesPrivate.CommandErrorName:= 'CyclicPosition';
	END_IF
	
	IF(pMCAxes.BR_ReadCyclicPosition.Error = 1)THEN
 		pMCAxes.BR_ReadCyclicPosition.Enable:= 0;
		pAxesPrivate.CommandError:= 1;
		pAxesPrivate.CommandErrorID:= pMCAxes.BR_ReadCyclicPosition.ErrorID;
		pAxesPrivate.CommandErrorName:= 'ReadCyclicPosition';
	ELSE
		pMCAxes.BR_ReadCyclicPosition.Enable:= 1;
	END_IF


	IF(pAxes.Input.Command.StartDryRun <> 0)THEN
		pAxes.Input.Command.StartDryRun:= 0;
		IF(pAxes.Output.Error.Count > 0)THEN
			pAxesPrivate.CommandError:= 1;
			pAxesPrivate.CommandErrorID:= 0;
			pAxesPrivate.CommandErrorName:= 'StartDryRun';
		END_IF
	END_IF	
	
	IF(pMCAxes.BR_Simulation.Done = 1)THEN
		pMCAxes.BR_Simulation.Execute:= 0;
 		pAxes.Input.Command.Simulation:= 0;
	ELSIF(pMCAxes.BR_Simulation.Error = 1)THEN
 		pMCAxes.BR_Simulation.Execute:= 0;
		pAxes.Input.Command.Simulation:= 0;
		pAxesPrivate.CommandError:= 1;
		pAxesPrivate.CommandErrorID:= pMCAxes.BR_Simulation.ErrorID;
		pAxesPrivate.CommandErrorName:= 'Simulation';
	END_IF
	
	IF(pMCAxes.BR_InitCyclicRead_0.Done = 1)THEN
		pMCAxes.BR_InitCyclicRead_0.Execute:= 0;
	ELSIF(pMCAxes.BR_InitCyclicRead_0.Error = 1)THEN
 		pMCAxes.BR_InitCyclicRead_0.Execute:= 0;
		pAxesPrivate.CommandError:= 1;
		pAxesPrivate.CommandErrorID:= pMCAxes.BR_InitCyclicRead_0.ErrorID;
		pAxesPrivate.CommandErrorName:= 'InitCyclicRead0';
	END_IF
	IF(pMCAxes.BR_InitCyclicRead_1.Done = 1)THEN
		pMCAxes.BR_InitCyclicRead_1.Execute:= 0;
	ELSIF(pMCAxes.BR_InitCyclicRead_1.Error = 1)THEN
 		pMCAxes.BR_InitCyclicRead_1.Execute:= 0;
		pAxesPrivate.CommandError:= 1;
		pAxesPrivate.CommandErrorID:= pMCAxes.BR_InitCyclicRead_1.ErrorID;
		pAxesPrivate.CommandErrorName:= 'InitCyclicRead1';
	END_IF
	IF(pMCAxes.BR_InitCyclicRead_2.Done = 1)THEN
		pMCAxes.BR_InitCyclicRead_2.Execute:= 0;
	ELSIF(pMCAxes.BR_InitCyclicRead_2.Error = 1)THEN
 		pMCAxes.BR_InitCyclicRead_2.Execute:= 0;
		pAxesPrivate.CommandError:= 1;
		pAxesPrivate.CommandErrorID:= pMCAxes.BR_InitCyclicRead_2.ErrorID;
		pAxesPrivate.CommandErrorName:= 'InitCyclicRead2';
	END_IF
	IF(pMCAxes.BR_InitCyclicRead_3.Done = 1)THEN
		pMCAxes.BR_InitCyclicRead_3.Execute:= 0;
	ELSIF(pMCAxes.BR_InitCyclicRead_3.Error = 1)THEN
 		pMCAxes.BR_InitCyclicRead_3.Execute:= 0;
		pAxesPrivate.CommandError:= 1;
		pAxesPrivate.CommandErrorID:= pMCAxes.BR_InitCyclicRead_3.ErrorID;
		pAxesPrivate.CommandErrorName:= 'InitCyclicRead3';
	END_IF
	
	IF(pMCAxes.BR_InitCyclicWrite_0.Done = 1)THEN
		pMCAxes.BR_InitCyclicWrite_0.Execute:= 0;
	ELSIF(pMCAxes.BR_InitCyclicWrite_0.Error = 1)THEN
 		pMCAxes.BR_InitCyclicWrite_0.Execute:= 0;
		pAxesPrivate.CommandError:= 1;
		pAxesPrivate.CommandErrorID:= pMCAxes.BR_InitCyclicWrite_0.ErrorID;
		pAxesPrivate.CommandErrorName:= 'InitCyclicWrite0';
	END_IF
	IF(pMCAxes.BR_InitCyclicWrite_1.Done = 1)THEN
		pMCAxes.BR_InitCyclicWrite_1.Execute:= 0;
	ELSIF(pMCAxes.BR_InitCyclicWrite_1.Error = 1)THEN
 		pMCAxes.BR_InitCyclicWrite_1.Execute:= 0;
		pAxesPrivate.CommandError:= 1;
		pAxesPrivate.CommandErrorID:= pMCAxes.BR_InitCyclicWrite_1.ErrorID;
		pAxesPrivate.CommandErrorName:= 'InitCyclicWrite1';
	END_IF
	IF(pMCAxes.BR_InitCyclicWrite_2.Done = 1)THEN
		pMCAxes.BR_InitCyclicWrite_2.Execute:= 0;
	ELSIF(pMCAxes.BR_InitCyclicWrite_2.Error = 1)THEN
 		pMCAxes.BR_InitCyclicWrite_2.Execute:= 0;
		pAxesPrivate.CommandError:= 1;
		pAxesPrivate.CommandErrorID:= pMCAxes.BR_InitCyclicWrite_2.ErrorID;
		pAxesPrivate.CommandErrorName:= 'InitCyclicWrite2';
	END_IF
	IF(pMCAxes.BR_InitCyclicWrite_3.Done = 1)THEN
		pMCAxes.BR_InitCyclicWrite_3.Execute:= 0;
	ELSIF(pMCAxes.BR_InitCyclicWrite_3.Error = 1)THEN
 		pMCAxes.BR_InitCyclicWrite_3.Execute:= 0;
		pAxesPrivate.CommandError:= 1;
		pAxesPrivate.CommandErrorID:= pMCAxes.BR_InitCyclicWrite_3.ErrorID;
		pAxesPrivate.CommandErrorName:= 'InitCyclicWrite3';
	END_IF

	CASE pAxesPrivate.CommandErrorStep OF
		
		AXESCOMMANDERROR_CHECK:

			IF(pAxesPrivate.CommandError = 1)THEN
				pAxesPrivate.CommandErrorStep:= AXESCOMMANDERROR_ERROR;
			END_IF		
		
		AXESCOMMANDERROR_ERROR:
			pAxesPrivate.CommandError:= 1;
			IF(pAxes.Input.Command.ErrorAcknowledge = 1)OR(pAxes.Input.Command.Reset = 1)THEN
				pAxes.Input.Command.ErrorAcknowledge:= 0;
				pAxesPrivate.CommandErrorID:= 0;
				pAxesPrivate.CommandErrorName:= '';
				pAxesPrivate.CommandErrorStep:= AXESCOMMANDERROR_CHECK;
 			END_IF
			
	END_CASE
	
	pAxes.Input.Command.ErrorAcknowledge:= 0;
	

	
END_ACTION

ACTION AxACP10ResetParamter:
	
	pAxACP10Dat ACCESS pAxesPrivate.AxesDatAddress;
		
END_ACTION

ACTION AxACP10Monitor:
	
	pAxACP10Dat ACCESS pAxesPrivate.AxesDatAddress;
	
	IF	((pAxes.Input.Configuration.UnitPositionFaktor > 0)AND
 		(pAxes.Input.Configuration.UnitVelocityFaktor > 0))THEN
		pAxesPrivate.UnitfaktorOk:= 1;
		pAxes.Output.Monitor.Position:= pAxACP10Dat.monitor.s / pAxes.Input.Configuration.UnitPositionFaktor;
		pAxes.Output.Monitor.Velocity:= pAxACP10Dat.monitor.v / pAxes.Input.Configuration.UnitVelocityFaktor;
		pAxes.Output.Monitor.MaximalVelocity:= pAxACP10Dat.limit.parameter.v_pos / pAxes.Input.Configuration.UnitVelocityFaktor;
		pAxes.Output.Monitor.CyclicPosition:= pMCAxes.BR_ReadCyclicPosition.CyclicPosition.Real / pAxes.Input.Configuration.UnitVelocityFaktor;
		IF(pAxes.Output.Monitor.MaximalVelocity > (pAxACP10Dat.limit.parameter.v_neg / pAxes.Input.Configuration.UnitVelocityFaktor))THEN
			pAxes.Output.Monitor.MaximalVelocity:= (pAxACP10Dat.limit.parameter.v_neg / pAxes.Input.Configuration.UnitVelocityFaktor);
		END_IF
		
		// MaPa: Added because of increasing axis limits of acp10 Axis		
		pAxes.Output.Monitor.MaximalVelocity:= pAxes.Output.Monitor.MaximalVelocity / 10.0;
	ELSE
		pAxesPrivate.UnitfaktorOk:= 0;
	END_IF
	
	IF(pAxes.Output.State.Standstill = 0)THEN
 		pAxes.Output.Monitor.InPosition:= 0;
	END_IF
	
	IF	(pMCAxes.MoveAbsolute_0.Done = 1)OR
		(pMCAxes.MoveAdditive_0.Done = 1)OR
		(pMCAxes.MoveAbsolute_1.Done = 1)OR
		(pMCAxes.MoveAdditive_1.Done = 1)THEN
		pAxes.Output.Monitor.InPosition:= 1;
	END_IF
		
	IF	(pAxes.Output.State.ContinuousMotion = 0)OR
		(pMCAxes.MoveVelocity_0.CommandAborted = 1)OR
		(pMCAxes.MoveVelocity_1.CommandAborted = 1)OR
  		(pMCAxes.MoveVelocity_0.Execute = 1)OR
		(pMCAxes.MoveVelocity_1.Execute = 1)THEN
 		pAxes.Output.Monitor.InVelocity:= 0;
 	END_IF
	
	IF	(pMCAxes.MoveVelocity_0.InVelocity = 1)OR
 		(pMCAxes.MoveVelocity_1.InVelocity = 1)THEN
 		pAxes.Output.Monitor.InVelocity:= 1;
 	END_IF
		  
	
	
	

		
END_ACTION

ACTION AxACP10NetTimeout:
	
	RTInfo_0.enable:= 1;
	pAxACP10Dat ACCESS pAxesPrivate.AxesDatAddress;
	
	CASE pAxesPrivate.NetTimeoutStep OF
 	
		AXESNETTIMEOUT_CHECK_INIT:
			IF(pAxACP10Dat.network.init = 1)THEN
   				pAxesPrivate.NetInitOk:= 1;
				pAxesPrivate.NetTimeoutStep:= AXESNETTIMEOUT_CHECK_RUNTIME;
			ELSIF(pAxesPrivate.NetTimeoutNetTimer > AXES_NET_TIMEOUT)THEN
				pAxesPrivate.NetInitOk:= 0;
				pAxesPrivate.NetTimeoutStep:= AXESNETTIMEOUT_ERROR_INIT;
			ELSE
				IF(RTInfo_0.cycle_time > 0)THEN
					pAxesPrivate.NetTimeoutNetTimer:= REAL_TO_UDINT(pAxesPrivate.NetTimeoutNetTimer + RTInfo_0.cycle_time / 1000.0);
				END_IF
   			END_IF		
		
		AXESNETTIMEOUT_CHECK_RUNTIME:
			IF(pAxACP10Dat.network.init = 0)THEN
   				pAxesPrivate.NetInitOk:= 0;
				pAxesPrivate.NetTimeoutStep:= AXESNETTIMEOUT_ERROR_RUNTIME;
			END_IF			
		
		AXESNETTIMEOUT_ERROR_INIT:
			IF(pMCAxes.ReadAxisError.AxisErrorCount = 0)THEN
				pAxes.Output.Error.Number:= 0;
				pAxes.Output.Error.Text.Line1:= 'Axes net timeout initialization error';
			END_IF
			IF( ((pAxes.Input.Command.ErrorAcknowledge <> 0)OR(pAxes.Input.Command.Reset <> 0))AND
				(pAxACP10Dat.network.init = 1) AND (pMCAxes.ReadAxisError.AxisErrorCount = 0))THEN
				
				pAxesPrivate.NetInitOk:= 1;
				pAxes.Input.Command.ErrorAcknowledge:= 0;
   				brsmemset(ADR(pAxes.Output.Error), 0,SIZEOF(pAxes.Output.Error));
				pAxesPrivate.NetTimeoutStep:= AXESNETTIMEOUT_CHECK_RUNTIME;
			END_IF		
		
		AXESNETTIMEOUT_ERROR_RUNTIME:
			IF(pMCAxes.ReadAxisError.AxisErrorCount = 0)THEN
				pAxes.Output.Error.Number:= 0;
				pAxes.Output.Error.Text.Line1:= 'Axes net timeout runtime error';
			END_IF
			IF( ((pAxes.Input.Command.ErrorAcknowledge <> 0)OR(pAxes.Input.Command.Reset <> 0))AND
				(pAxACP10Dat.network.init = 1)AND
				(pMCAxes.ReadAxisError.AxisErrorCount = 0))THEN
				
				pAxesPrivate.NetInitOk:= 1;
				pAxes.Input.Command.ErrorAcknowledge:= 0;
   				brsmemset(ADR(pAxes.Output.Error), 0,SIZEOF(pAxes.Output.Error));
				pAxesPrivate.NetTimeoutStep:= AXESNETTIMEOUT_CHECK_RUNTIME;
			END_IF	
	END_CASE
	
	RTInfo_0();
	
END_ACTION

ACTION AxACP10PLCOpenFubInit:
	
		pMCAxes.Power.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.BR_InitAxisPar.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.BR_InitAxisSubjectPar.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.BR_SaveAxisPar.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.BR_LoadAxisPar.Axis:= pAxesPrivate.AxesDatAddress;
		(* Added by RJ *)
		pMCAxes.BR_WriteParID.Axis := pAxesPrivate.AxesDatAddress;
		pMCAxes.Home.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.MoveAbsolute_0.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.MoveAbsolute_1.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.MoveAdditive_0.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.MoveAdditive_1.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.MoveVelocity_0.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.MoveVelocity_1.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.Stop.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.ReadAxisError.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.Reset.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.ReadStatus.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.BR_ReadDriveStatus.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.ReadAxisError.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.SetOverride.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.BR_MoveCyclicPosition.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.BR_ReadCyclicPosition.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.BR_Simulation.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.BR_InitCyclicRead_0.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.BR_InitCyclicRead_1.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.BR_InitCyclicRead_2.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.BR_InitCyclicRead_3.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.BR_InitCyclicWrite_0.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.BR_InitCyclicWrite_1.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.BR_InitCyclicWrite_2.Axis:= pAxesPrivate.AxesDatAddress;
		pMCAxes.BR_InitCyclicWrite_3.Axis:= pAxesPrivate.AxesDatAddress;
		
END_ACTION


ACTION AxACP10PLCOpenFubCall:

		(* Type 0 always executed *)
		pMCAxes.Power();
		
		(* Type 2 *)
		IF(	pMCAxes.BR_InitAxisPar.Execute OR
			pMCAxes.BR_InitAxisPar.Done OR
			pMCAxes.BR_InitAxisPar.Busy OR
			pMCAxes.BR_InitAxisPar.Error ) THEN
			pMCAxes.BR_InitAxisPar();
		END_IF		
		
		(* Type 2 *)
		IF(	pMCAxes.BR_InitAxisSubjectPar.Execute OR
			pMCAxes.BR_InitAxisSubjectPar.Done OR
			pMCAxes.BR_InitAxisSubjectPar.Busy OR
			pMCAxes.BR_InitAxisSubjectPar.Error ) THEN
			pMCAxes.BR_InitAxisSubjectPar();
		END_IF
		
		(* Type 2 *)
		IF(	pMCAxes.BR_SaveAxisPar.Execute OR
			pMCAxes.BR_SaveAxisPar.Done OR
			pMCAxes.BR_SaveAxisPar.Busy OR
			pMCAxes.BR_SaveAxisPar.Error ) THEN
			pMCAxes.BR_SaveAxisPar();
		END_IF
			
		(* Type 2 *)
		IF(	pMCAxes.BR_LoadAxisPar.Execute OR
			pMCAxes.BR_LoadAxisPar.Done OR
			pMCAxes.BR_LoadAxisPar.Busy OR
			pMCAxes.BR_LoadAxisPar.Error ) THEN
			pMCAxes.BR_LoadAxisPar();
		END_IF
			
	(* Added by RJ *)
	IF(	pMCAxes.BR_WriteParID.Execute OR
		pMCAxes.BR_WriteParID.Done OR
		pMCAxes.BR_WriteParID.Busy OR
		pMCAxes.BR_WriteParID.Error ) THEN
		pMCAxes.BR_WriteParID();
	END_IF
	
		(* Type 1 *)
		IF(	pMCAxes.Home.Execute OR
			pMCAxes.Home.Done OR
			pMCAxes.Home.Busy OR
			pMCAxes.Home.CommandAborted OR
			pMCAxes.Home.Error ) THEN
  			pMCAxes.Home();
  		END_IF
			
		(* Type 1 *)
		IF(	pMCAxes.MoveAbsolute_0.Execute OR
			pMCAxes.MoveAbsolute_0.Done OR
			pMCAxes.MoveAbsolute_0.Busy OR
			pMCAxes.MoveAbsolute_0.CommandAborted OR
			pMCAxes.MoveAbsolute_0.Error ) THEN
  			pMCAxes.MoveAbsolute_0();
  		END_IF
			
		(* Type 1 *)
		IF(	pMCAxes.MoveAbsolute_1.Execute OR
			pMCAxes.MoveAbsolute_1.Done OR
			pMCAxes.MoveAbsolute_1.Busy OR
			pMCAxes.MoveAbsolute_1.CommandAborted OR
			pMCAxes.MoveAbsolute_1.Error ) THEN
  			pMCAxes.MoveAbsolute_1();
  		END_IF

		(* Type 1 *)
		IF(	pMCAxes.MoveAdditive_0.Execute OR
			pMCAxes.MoveAdditive_0.Done OR
			pMCAxes.MoveAdditive_0.Busy OR
			pMCAxes.MoveAdditive_0.CommandAborted OR
			pMCAxes.MoveAdditive_0.Error ) THEN
  			pMCAxes.MoveAdditive_0();
  		END_IF
			
		(* Type 1 *)
		IF(	pMCAxes.MoveAdditive_1.Execute OR
			pMCAxes.MoveAdditive_1.Done OR
			pMCAxes.MoveAdditive_1.Busy OR
			pMCAxes.MoveAdditive_1.CommandAborted OR
			pMCAxes.MoveAdditive_1.Error ) THEN
  			pMCAxes.MoveAdditive_1();
  		END_IF

		(* Type 6 *)
		IF(	pMCAxes.MoveVelocity_0.Execute OR
			pMCAxes.MoveVelocity_0.InVelocity OR
			pMCAxes.MoveVelocity_0.Busy OR
			pMCAxes.MoveVelocity_0.CommandAborted OR
			pMCAxes.MoveVelocity_0.Error ) THEN
  			pMCAxes.MoveVelocity_0();
  		END_IF
			
		(* Type 6 *)
		IF(	pMCAxes.MoveVelocity_1.Execute OR
			pMCAxes.MoveVelocity_1.InVelocity OR
			pMCAxes.MoveVelocity_1.Busy OR
			pMCAxes.MoveVelocity_1.CommandAborted OR
			pMCAxes.MoveVelocity_1.Error ) THEN
  			pMCAxes.MoveVelocity_1();
  		END_IF
		
		(* Type *)
		IF(	pMCAxes.BR_MoveCyclicPosition.Enable OR
  			pMCAxes.BR_MoveCyclicPosition.Valid OR
   			pMCAxes.BR_MoveCyclicPosition.Busy OR
   			pMCAxes.BR_MoveCyclicPosition.CommandAborted OR
   			pMCAxes.BR_MoveCyclicPosition.Error ) THEN
   			pMCAxes.BR_MoveCyclicPosition();
		END_IF
			
		(* Type 1 *)
		IF(	pMCAxes.Stop.Execute OR
			pMCAxes.Stop.Done OR
			pMCAxes.Stop.Busy OR
			pMCAxes.Stop.CommandAborted OR
			pMCAxes.Stop.Error ) THEN
  			pMCAxes.Stop();
  		END_IF				

		(* Type 2 *)
		IF(	pMCAxes.Reset.Execute OR
			pMCAxes.Reset.Done OR
			pMCAxes.Reset.Busy OR
			pMCAxes.Reset.Error ) THEN
			pMCAxes.Reset();
		END_IF
		
		(* Type 4 *)
		pMCAxes.ReadAxisError.Enable:= 1;				(* always enabled *)
		IF(	pMCAxes.ReadAxisError.Enable OR
			pMCAxes.ReadAxisError.Valid OR
			pMCAxes.ReadAxisError.Busy OR
			pMCAxes.ReadAxisError.Error ) THEN
  			pMCAxes.ReadAxisError();
  		END_IF			
		
		(* Type 0 *)
		pMCAxes.ReadStatus.Enable:= 1;				(* always enabled *)
		pMCAxes.ReadStatus();
		
		(* Type 4 *)
		pMCAxes.BR_ReadDriveStatus.Enable:= 1;		(* always enabled *)
		IF(	pMCAxes.BR_ReadDriveStatus.Enable OR
			pMCAxes.BR_ReadDriveStatus.Valid OR
			pMCAxes.BR_ReadDriveStatus.Busy OR
			pMCAxes.BR_ReadDriveStatus.Error ) THEN
  			pMCAxes.BR_ReadDriveStatus();
  		END_IF
			
		(* Type 2 *)
		IF(	pMCAxes.BR_Simulation.Execute OR
			pMCAxes.BR_Simulation.Done OR
			pMCAxes.BR_Simulation.Busy OR
			pMCAxes.BR_Simulation.Error ) THEN
			pMCAxes.BR_Simulation();
		END_IF

		IF(	pMCAxes.BR_InitCyclicRead_0.Execute OR
			pMCAxes.BR_InitCyclicRead_0.Done OR
			pMCAxes.BR_InitCyclicRead_0.Busy OR
			pMCAxes.BR_InitCyclicRead_0.Error ) THEN
			pMCAxes.BR_InitCyclicRead_0();
		END_IF
		IF(	pMCAxes.BR_InitCyclicRead_1.Execute OR
			pMCAxes.BR_InitCyclicRead_1.Done OR
			pMCAxes.BR_InitCyclicRead_1.Busy OR
			pMCAxes.BR_InitCyclicRead_1.Error ) THEN
			pMCAxes.BR_InitCyclicRead_1();
		END_IF
		IF(	pMCAxes.BR_InitCyclicRead_2.Execute OR
			pMCAxes.BR_InitCyclicRead_2.Done OR
			pMCAxes.BR_InitCyclicRead_2.Busy OR
			pMCAxes.BR_InitCyclicRead_2.Error ) THEN
			pMCAxes.BR_InitCyclicRead_2();
		END_IF
		IF(	pMCAxes.BR_InitCyclicRead_3.Execute OR
			pMCAxes.BR_InitCyclicRead_3.Done OR
			pMCAxes.BR_InitCyclicRead_3.Busy OR
			pMCAxes.BR_InitCyclicRead_3.Error ) THEN
			pMCAxes.BR_InitCyclicRead_3();
		END_IF

		IF(	pMCAxes.BR_InitCyclicWrite_0.Execute OR
			pMCAxes.BR_InitCyclicWrite_0.Done OR
			pMCAxes.BR_InitCyclicWrite_0.Busy OR
			pMCAxes.BR_InitCyclicWrite_0.Error ) THEN
			pMCAxes.BR_InitCyclicWrite_0();
		END_IF
		IF(	pMCAxes.BR_InitCyclicWrite_1.Execute OR
			pMCAxes.BR_InitCyclicWrite_1.Done OR
			pMCAxes.BR_InitCyclicWrite_1.Busy OR
			pMCAxes.BR_InitCyclicWrite_1.Error ) THEN
			pMCAxes.BR_InitCyclicWrite_1();
		END_IF
		IF(	pMCAxes.BR_InitCyclicWrite_2.Execute OR
			pMCAxes.BR_InitCyclicWrite_2.Done OR
			pMCAxes.BR_InitCyclicWrite_2.Busy OR
			pMCAxes.BR_InitCyclicWrite_2.Error ) THEN
			pMCAxes.BR_InitCyclicWrite_2();
		END_IF
		IF(	pMCAxes.BR_InitCyclicWrite_3.Execute OR
			pMCAxes.BR_InitCyclicWrite_3.Done OR
			pMCAxes.BR_InitCyclicWrite_3.Busy OR
			pMCAxes.BR_InitCyclicWrite_3.Error ) THEN
			pMCAxes.BR_InitCyclicWrite_3();
		END_IF
			
		pMCAxes.SetOverride.Enable:= 1;				(* always enabled *)
		pMCAxes.SetOverride();
		
		pMCAxes.BR_ReadCyclicPosition.Enable:= 1;		(* always enabled *)
		pMCAxes.BR_ReadCyclicPosition();
		
		IF(	pMCAxes.BR_GetErrorText.Execute OR
			pMCAxes.BR_GetErrorText.Done OR
			pMCAxes.BR_GetErrorText.Busy OR
			pMCAxes.BR_GetErrorText.Error ) THEN
			pMCAxes.BR_GetErrorText();
		END_IF
		
END_ACTION

ACTION AxACP10PLCOpenFubSetPar:

	pAxACP10Dat ACCESS pAxesPrivate.AxesDatAddress;
	
	IF	((pAxes.Input.Configuration.UnitPositionFaktor > 0)AND
 		(pAxes.Input.Configuration.UnitVelocityFaktor > 0))THEN
		
		pAxesPrivate.UnitfaktorOk:= 1;
		
		pMCAxes.MoveAbsolute_0.Position:= pAxes.Input.Parameter.Position * pAxes.Input.Configuration.UnitPositionFaktor;
		pMCAxes.MoveAbsolute_0.Velocity:= pAxes.Input.Parameter.Velocity * pAxes.Input.Configuration.UnitVelocityFaktor;
		pMCAxes.MoveAbsolute_0.Acceleration:= pAxes.Input.Parameter.Acceleration * pAxes.Input.Configuration.UnitVelocityFaktor;
		pMCAxes.MoveAbsolute_0.Deceleration:= pAxes.Input.Parameter.Deceleration * pAxes.Input.Configuration.UnitVelocityFaktor;
		pMCAxes.MoveAbsolute_0.Direction:= pAxes.Input.Parameter.Direction;
		
		pMCAxes.MoveAbsolute_1.Position:= pAxes.Input.Parameter.Position * pAxes.Input.Configuration.UnitPositionFaktor;
		pMCAxes.MoveAbsolute_1.Velocity:= pAxes.Input.Parameter.Velocity * pAxes.Input.Configuration.UnitVelocityFaktor;
		pMCAxes.MoveAbsolute_1.Acceleration:= pAxes.Input.Parameter.Acceleration * pAxes.Input.Configuration.UnitVelocityFaktor;
		pMCAxes.MoveAbsolute_1.Deceleration:= pAxes.Input.Parameter.Deceleration * pAxes.Input.Configuration.UnitVelocityFaktor;
		pMCAxes.MoveAbsolute_1.Direction:= pAxes.Input.Parameter.Direction;
	
		pMCAxes.MoveAdditive_0.Distance:= pAxes.Input.Parameter.Distance * pAxes.Input.Configuration.UnitPositionFaktor;
		pMCAxes.MoveAdditive_0.Velocity:= pAxes.Input.Parameter.Velocity * pAxes.Input.Configuration.UnitVelocityFaktor;
		pMCAxes.MoveAdditive_0.Acceleration:= pAxes.Input.Parameter.Acceleration * pAxes.Input.Configuration.UnitVelocityFaktor;
		pMCAxes.MoveAdditive_0.Deceleration:= pAxes.Input.Parameter.Deceleration * pAxes.Input.Configuration.UnitVelocityFaktor;

		pMCAxes.MoveAdditive_1.Distance:= pAxes.Input.Parameter.Distance * pAxes.Input.Configuration.UnitPositionFaktor;
		pMCAxes.MoveAdditive_1.Velocity:= pAxes.Input.Parameter.Velocity * pAxes.Input.Configuration.UnitVelocityFaktor;
		pMCAxes.MoveAdditive_1.Acceleration:= pAxes.Input.Parameter.Acceleration * pAxes.Input.Configuration.UnitVelocityFaktor;
		pMCAxes.MoveAdditive_1.Deceleration:= pAxes.Input.Parameter.Deceleration * pAxes.Input.Configuration.UnitVelocityFaktor;

		pMCAxes.MoveVelocity_0.Velocity:= pAxes.Input.Parameter.Velocity * pAxes.Input.Configuration.UnitVelocityFaktor;
		pMCAxes.MoveVelocity_0.Acceleration:= pAxes.Input.Parameter.Acceleration * pAxes.Input.Configuration.UnitVelocityFaktor;
		pMCAxes.MoveVelocity_0.Deceleration:= pAxes.Input.Parameter.Deceleration * pAxes.Input.Configuration.UnitVelocityFaktor;
		pMCAxes.MoveVelocity_0.Direction:= pAxes.Input.Parameter.Direction;

		pMCAxes.MoveVelocity_1.Velocity:= pAxes.Input.Parameter.Velocity * pAxes.Input.Configuration.UnitVelocityFaktor;
		pMCAxes.MoveVelocity_1.Acceleration:= pAxes.Input.Parameter.Acceleration * pAxes.Input.Configuration.UnitVelocityFaktor;
		pMCAxes.MoveVelocity_1.Deceleration:= pAxes.Input.Parameter.Deceleration * pAxes.Input.Configuration.UnitVelocityFaktor;
		pMCAxes.MoveVelocity_1.Direction:= pAxes.Input.Parameter.Direction;
		
		
		pMCAxes.BR_MoveCyclicPosition.CyclicPosition.Real:= pAxes.Input.Parameter.CyclicPosition * pAxes.Input.Configuration.UnitPositionFaktor;
		pMCAxes.BR_MoveCyclicPosition.Velocity:= pAxACP10Dat.limit.parameter.v_pos * 1.2;
		pMCAxes.BR_MoveCyclicPosition.Acceleration:= pAxACP10Dat.limit.parameter.a1_pos * 1.2;
		pMCAxes.BR_MoveCyclicPosition.Deceleration:= pAxACP10Dat.limit.parameter.a2_pos * 1.2;

		
		pMCAxes.Stop.Deceleration:= pAxes.Input.Parameter.Deceleration * pAxes.Input.Configuration.UnitVelocityFaktor;
		
		IF(pAxesPrivate.HomeAutoPosition = 1)THEN
			pMCAxes.Home.HomingMode:= mcHOME_DIRECT;
			pMCAxes.Home.Position:= pAxes.Input.Parameter.AutoPosition * pAxes.Input.Configuration.UnitPositionFaktor;
		ELSE
			pMCAxes.Home.HomingMode:= mcHOME_DEFAULT;
			pMCAxes.Home.Position:= pAxes.Input.Parameter.HomePosition * pAxes.Input.Configuration.UnitPositionFaktor;
		END_IF
		
	ELSE
		pAxesPrivate.UnitfaktorOk:= 0;
	END_IF

	pMCAxes.ReadAxisError.DataAddress:= ADR(pAxesPrivate.Error1.Text);
	pMCAxes.ReadAxisError.DataLength:= SIZEOF(pAxesPrivate.Error1.Text);
	brsmemset(ADR(pMCAxes.ReadAxisError.DataObjectName), 0,SIZEOF(pMCAxes.ReadAxisError.DataObjectName));
	brsmemcpy(ADR(pMCAxes.ReadAxisError.DataObjectName), ADR(pAxes.Input.Configuration.ErrorDatObjName), SIZEOF(pMCAxes.ReadAxisError.DataObjectName));
	
	IF(pAxesPrivate.MessageCountOld <> pAxACP10Dat.message.count.error)THEN
 		IF(pMCAxes.BR_GetErrorText.Done = 0)THEN
 			pMCAxes.BR_GetErrorText.Execute:= 1;
		ELSIF(pMCAxes.BR_GetErrorText.Error)THEN
  			pMCAxes.BR_GetErrorText.Execute:= 0;
		ELSE
		 	pAxes.Output.Error.HmiCount:= pAxes.Output.Error.Count;
		 	pMCAxes.BR_GetErrorText.Execute:= 0;
			brsmemcpy(ADR(pAxes.Output.Error.Text),ADR(pAxesPrivate.Error.Text),SIZEOF(pAxes.Output.Error.Text));
			pAxesPrivate.MessageCountOld:= pAxACP10Dat.message.count.error;
		END_IF
	END_IF
	IF(pAxACP10Dat.message.count.error = 0)THEN
		pMCAxes.BR_GetErrorText.Execute:= 0;
 		pAxesPrivate.MessageCountOld:= pAxACP10Dat.message.count.error;
		pAxes.Output.Error.HmiCount:= pAxes.Output.Error.Count;
	END_IF	
	
	pMCAxes.ErrorRecord.Info:= pAxACP10Dat.message.record.info;
	pMCAxes.ErrorRecord.Number:= pAxACP10Dat.message.record.number;
	pMCAxes.ErrorRecord.ParID:= pAxACP10Dat.message.record.par_id;
	pMCAxes.BR_GetErrorText.ErrorRecord:= pMCAxes.ErrorRecord;
	pMCAxes.BR_GetErrorText.Configuration.DataAddress:= ADR(pAxesPrivate.Error.Text);
	pMCAxes.BR_GetErrorText.Configuration.DataLength:= SIZEOF(pAxesPrivate.Error.Text);
	pMCAxes.BR_GetErrorText.Configuration.Format:= mcWRAP+mcNULL;
	pMCAxes.BR_GetErrorText.Configuration.LineLength:= SIZEOF(pAxesPrivate.Error.Text.Line1);
	brsmemset(ADR(pMCAxes.BR_GetErrorText.Configuration.DataObjectName), 0,SIZEOF(pMCAxes.BR_GetErrorText.Configuration.DataObjectName));
	brsmemcpy(ADR(pMCAxes.BR_GetErrorText.Configuration.DataObjectName), ADR(pAxes.Input.Configuration.ErrorDatObjName), SIZEOF(pMCAxes.BR_GetErrorText.Configuration.DataObjectName));
	
	pMCAxes.BR_ReadDriveStatus.AdrDriveStatus:= ADR(pMCAxes.Status);
	
	IF(pAxes.Input.Command.EmergencyStop <> 0)THEN
 		pMCAxes.Stop.Deceleration:= pAxACP10Dat.limit.parameter.a1_neg;
	END_IF
	
	pMCAxes.SetOverride.VelFactor:= pAxes.Input.Parameter.Override;
	pMCAxes.SetOverride.AccFactor:= 1;
	
	
	
	
	

	pMCAxes.BR_InitAxisSubjectPar.Subject:= pAxes.Input.Parameter.InitAxisSubjectPar;
	
	brsmemset(ADR(pMCAxes.BR_SaveAxisPar.DataObjectName), 0 ,SIZEOF(pMCAxes.BR_SaveAxisPar.DataObjectName));
	brsmemcpy(ADR(pMCAxes.BR_SaveAxisPar.DataObjectName), ADR(pAxes.Input.Parameter.SaveAxisParDataObjectName), SIZEOF(pMCAxes.BR_SaveAxisPar.DataObjectName));
	brsmemset(ADR(pMCAxes.BR_LoadAxisPar.DataObjectName), 0 ,SIZEOF(pMCAxes.BR_LoadAxisPar.DataObjectName));
	brsmemcpy(ADR(pMCAxes.BR_LoadAxisPar.DataObjectName), ADR(pAxes.Input.Parameter.LoadAxisParDataObjectName), SIZEOF(pMCAxes.BR_LoadAxisPar.DataObjectName));
	
	(* Added by RJ *)
	
	pMCAxes.BR_WriteParID.DataText 	:= pAxes.Input.Parameter.WriteParIDText;
	pMCAxes.BR_WriteParID.ParID    	:= pAxes.Input.Parameter.WriteParID;
	
	pMCAxes.BR_Simulation.SimulationCommand:= pAxes.Input.Parameter.SimulationCommand;

	IF(pAxes.Input.Configuration.PDOReadParID[0]<>0)THEN
		pMCAxes.BR_InitCyclicRead_0.ParID:= pAxes.Input.Configuration.PDOReadParID[0];
		pMCAxes.BR_InitCyclicRead_0.DataType:= pAxes.Input.Configuration.PDOReadParType[0];
		pMCAxes.BR_InitCyclicRead_0.DataAddress:= ADR(pAxes.Output.Monitor.PDOReadValue[0]);
		pMCAxes.BR_InitCyclicRead_0.Execute:= 1;
	END_IF
	IF(pAxes.Input.Configuration.PDOReadParID[1]<>0)THEN
		pMCAxes.BR_InitCyclicRead_1.ParID:= pAxes.Input.Configuration.PDOReadParID[1];
		pMCAxes.BR_InitCyclicRead_1.DataType:= pAxes.Input.Configuration.PDOReadParType[1];
		pMCAxes.BR_InitCyclicRead_1.DataAddress:= ADR(pAxes.Output.Monitor.PDOReadValue[1]);
		pMCAxes.BR_InitCyclicRead_1.Execute:= 1;
	END_IF
	IF(pAxes.Input.Configuration.PDOReadParID[2]<>0)THEN
		pMCAxes.BR_InitCyclicRead_2.ParID:= pAxes.Input.Configuration.PDOReadParID[2];
		pMCAxes.BR_InitCyclicRead_2.DataType:= pAxes.Input.Configuration.PDOReadParType[2];
		pMCAxes.BR_InitCyclicRead_2.DataAddress:= ADR(pAxes.Output.Monitor.PDOReadValue[2]);
		pMCAxes.BR_InitCyclicRead_2.Execute:= 1;
	END_IF
	IF(pAxes.Input.Configuration.PDOReadParID[3]<>0)THEN
		pMCAxes.BR_InitCyclicRead_3.ParID:= pAxes.Input.Configuration.PDOReadParID[3];
		pMCAxes.BR_InitCyclicRead_3.DataType:= pAxes.Input.Configuration.PDOReadParType[3];
		pMCAxes.BR_InitCyclicRead_3.DataAddress:= ADR(pAxes.Output.Monitor.PDOReadValue[3]);
		pMCAxes.BR_InitCyclicRead_3.Execute:= 1;
	END_IF

	IF(pAxes.Input.Configuration.PDOWriteParID[0]<>0)THEN
		pMCAxes.BR_InitCyclicWrite_0.ParID:= pAxes.Input.Configuration.PDOWriteParID[0];
		pMCAxes.BR_InitCyclicWrite_0.DataType:= pAxes.Input.Configuration.PDOWriteParType[0];
		pMCAxes.BR_InitCyclicWrite_0.DataAddress:= ADR(pAxes.Input.Parameter.PDOWriteValue[0]);
		pMCAxes.BR_InitCyclicWrite_0.Execute:= 1;
	END_IF
	IF(pAxes.Input.Configuration.PDOWriteParID[1]<>0)THEN
		pMCAxes.BR_InitCyclicWrite_1.ParID:= pAxes.Input.Configuration.PDOWriteParID[1];
		pMCAxes.BR_InitCyclicWrite_1.DataType:= pAxes.Input.Configuration.PDOWriteParType[1];
		pMCAxes.BR_InitCyclicWrite_1.DataAddress:= ADR(pAxes.Input.Parameter.PDOWriteValue[1]);
		pMCAxes.BR_InitCyclicWrite_1.Execute:= 1;
	END_IF
	IF(pAxes.Input.Configuration.PDOWriteParID[2]<>0)THEN
		pMCAxes.BR_InitCyclicWrite_2.ParID:= pAxes.Input.Configuration.PDOWriteParID[2];
		pMCAxes.BR_InitCyclicWrite_2.DataType:= pAxes.Input.Configuration.PDOWriteParType[2];
		pMCAxes.BR_InitCyclicWrite_2.DataAddress:= ADR(pAxes.Input.Parameter.PDOWriteValue[2]);
		pMCAxes.BR_InitCyclicWrite_2.Execute:= 1;
	END_IF
	IF(pAxes.Input.Configuration.PDOWriteParID[3]<>0)THEN
		pMCAxes.BR_InitCyclicWrite_3.ParID:= pAxes.Input.Configuration.PDOWriteParID[3];
		pMCAxes.BR_InitCyclicWrite_3.DataType:= pAxes.Input.Configuration.PDOWriteParType[3];
		pMCAxes.BR_InitCyclicWrite_3.DataAddress:= ADR(pAxes.Input.Parameter.PDOWriteValue[3]);
		pMCAxes.BR_InitCyclicWrite_3.Execute:= 1;
	END_IF

	IF(pAxACP10Dat.simulation.status <> ncOFF)THEN
		pAxACP10Dat.dig_in.level.reference:= ncACTIV_HI;
		pAxACP10Dat.dig_in.level.pos_hw_end:= ncACTIV_HI;
		pAxACP10Dat.dig_in.level.neg_hw_end:= ncACTIV_HI;
		pAxACP10Dat.dig_in.level.trigger1:= ncACTIV_HI;
		pAxACP10Dat.dig_in.level.trigger2:= ncACTIV_HI;
		
		IF(pAxACP10Dat.controller.mode = (ncPOSITION+ncFF))THEN
			pAxACP10Dat.controller.mode:= ncPOSITION;
  		END_IF
		pAxACP10Dat.controller.ff.torque_load:= 0.0;
		pAxACP10Dat.controller.ff.torque_pos:= 0.0;
		pAxACP10Dat.controller.ff.torque_neg:= 0.0;
		pAxACP10Dat.controller.ff.kv_torque:= 0.0;
		pAxACP10Dat.controller.ff.inertia:= 0.0;
		pAxACP10Dat.controller.ff.t_filter_a:= 0.0;
		
		pAxACP10Dat.controller.speed.isq_filter1.type:= ncOFF;
		pAxACP10Dat.controller.speed.isq_filter1.a0:= 0;
		pAxACP10Dat.controller.speed.isq_filter1.a1:= 0;
		pAxACP10Dat.controller.speed.isq_filter1.b0:= 0;
		pAxACP10Dat.controller.speed.isq_filter1.b1:= 0;
		pAxACP10Dat.controller.speed.isq_filter1.b2:= 0;
		pAxACP10Dat.controller.speed.isq_filter1.c0_par_id:= 0;
		pAxACP10Dat.controller.speed.isq_filter1.c1_par_id:= 0;

		pAxACP10Dat.controller.speed.isq_filter2.type:= ncOFF;
		pAxACP10Dat.controller.speed.isq_filter2.a0:= 0;
		pAxACP10Dat.controller.speed.isq_filter2.a1:= 0;
		pAxACP10Dat.controller.speed.isq_filter2.b0:= 0;
		pAxACP10Dat.controller.speed.isq_filter2.b1:= 0;
		pAxACP10Dat.controller.speed.isq_filter2.b2:= 0;
		pAxACP10Dat.controller.speed.isq_filter2.c0_par_id:= 0;
		pAxACP10Dat.controller.speed.isq_filter2.c1_par_id:= 0;

		pAxACP10Dat.controller.speed.isq_filter2.type:= ncOFF;
		pAxACP10Dat.controller.speed.isq_filter2.a0:= 0;
		pAxACP10Dat.controller.speed.isq_filter2.a1:= 0;
		pAxACP10Dat.controller.speed.isq_filter2.b0:= 0;
		pAxACP10Dat.controller.speed.isq_filter2.b1:= 0;
		pAxACP10Dat.controller.speed.isq_filter2.b2:= 0;
		pAxACP10Dat.controller.speed.isq_filter2.c0_par_id:= 0;
		pAxACP10Dat.controller.speed.isq_filter2.c1_par_id:= 0;
	END_IF
	
END_ACTION

ACTION AxACP10ReadStatus:
	
	pAxes.Output.Status.NetworkInit:= USINT_TO_BOOL(pAxACP10Dat.network.init);  
	pAxes.Output.Status.Simulation:= USINT_TO_BOOL(pAxACP10Dat.simulation.status);
	pAxes.Output.Status.HomeSwitch:= USINT_TO_BOOL(pAxACP10Dat.dig_in.status.reference);
	pAxes.Output.Status.PosHWSwitch:= USINT_TO_BOOL(pAxACP10Dat.dig_in.status.pos_hw_end);
	pAxes.Output.Status.NegHWSwitch:= USINT_TO_BOOL(pAxACP10Dat.dig_in.status.neg_hw_end);
	pAxes.Output.Status.Trigger1:= USINT_TO_BOOL(pAxACP10Dat.dig_in.status.trigger1);
	pAxes.Output.Status.Trigger2:= USINT_TO_BOOL(pAxACP10Dat.dig_in.status.trigger2);
	pAxes.Output.Status.DriveEnable:= USINT_TO_BOOL(pAxACP10Dat.dig_in.status.enable);
	pAxes.Output.Status.ControllerReady:= USINT_TO_BOOL(pAxACP10Dat.controller.ready);
	pAxes.Output.Status.ControllerStatus:= USINT_TO_BOOL(pAxACP10Dat.controller.status);
	pAxes.Output.Status.HomingOk:= USINT_TO_BOOL(pAxACP10Dat.move.homing.status.ok);
	pAxes.Output.Status.LagWarning:= USINT_TO_BOOL(pAxACP10Dat.monitor.status.ds_warning);
	
	pAxes.Output.Status.LagWarning:= pMCAxes.Status.LagWarning;
	
	IF(pAxesPrivate.NetInitOk = 0)AND(pAxesPrivate.NetTimeoutStep <> AXESNETTIMEOUT_CHECK_INIT)THEN
		pAxes.Output.Status.AxisError:= 1;
		pAxes.Output.Error.Count:= pAxACP10Dat.message.count.error + 1;
	ELSE
		pAxes.Output.Error.Count:= pAxACP10Dat.message.count.error;
	END_IF
	
	IF(pAxesPrivate.UnitfaktorOk = 0)THEN
		pAxes.Output.Status.AxisError:= 1;
		pAxes.Output.Error.Number:= pAxACP10Dat.message.record.number;
		IF(pAxesPrivate.NetInitOk = 0)AND(pAxesPrivate.NetTimeoutStep <> AXESNETTIMEOUT_CHECK_INIT)THEN
			pAxes.Output.Error.Count:= pAxACP10Dat.message.count.error + 2;
		ELSE
			pAxes.Output.Error.Count:= pAxACP10Dat.message.count.error + 1;
			IF(pMCAxes.Status.AxisError = 0)THEN
				pAxes.Output.Error.Number:= 0;
				pAxes.Output.Error.Text.Line1:= 'Axes Unitfactor undefined';
			END_IF
		END_IF
	END_IF
	
	IF(pMCAxes.Status.AxisError = 1)THEN
		pAxes.Output.Status.AxisError:= pMCAxes.Status.AxisError;
		pAxes.Output.Error.Number:= pAxACP10Dat.message.record.number;
	END_IF
	
	IF(pAxesPrivate.UnitfaktorOk = 1)AND(pAxesPrivate.NetInitOk = 1)AND(pMCAxes.Status.AxisError = 0)THEN
 		pAxes.Output.Status.AxisError:= 0;
	END_IF
	
	IF(pAxes.Output.Status.AxisError = 0)THEN
 		brsmemset(ADR(pAxes.Output.Error), 0, SIZEOF(pAxes.Output.Error));
 	END_IF	

	pAxes.Output.Status.CommandError:= pAxesPrivate.CommandError;
	
	pAxes.Output.Status.AxesDatAddress:= pAxesPrivate.AxesDatAddress;
	
	IF	(pMCAxes.BR_InitAxisPar.Busy = 1)OR
		(pMCAxes.BR_InitAxisSubjectPar.Busy = 1)OR
		(pMCAxes.BR_LoadAxisPar.Busy = 1)OR
		(* Added by RJ *)
		(pMCAxes.BR_WriteParID.Busy = 1) OR
		(pMCAxes.BR_MoveCyclicPosition.Busy = 1)OR
		(*		(pMCAxes.BR_ReadCyclicPosition.Busy = 1)OR*)
(*		(pMCAxes.BR_ReadDriveStatus.Busy = 1)OR*)
		(pMCAxes.BR_SaveAxisPar.Busy = 1)OR
		(pMCAxes.BR_Simulation.Busy = 1)OR
		(pMCAxes.Halt.Busy = 1)OR
		(pMCAxes.Home.Busy = 1)OR
		(pMCAxes.MoveAbsolute_0.Busy = 1)OR
		(pMCAxes.MoveAbsolute_1.Busy = 1)OR
		(pMCAxes.MoveAdditive_0.Busy = 1)OR
		(pMCAxes.MoveAdditive_1.Busy = 1)OR
		(pMCAxes.MoveVelocity_0.Busy = 1)OR
		(pMCAxes.MoveVelocity_1.Busy = 1)OR
(*		(pMCAxes.Power.Busy = 1)OR*)
(*		(pMCAxes.ReadAxisError.Busy = 1)OR*)
(*		(pMCAxes.ReadStatus.Busy = 1)OR*)
		(pMCAxes.Reset.Busy = 1)OR
(*		(pMCAxes.SetOverride.Busy = 1)OR*)
		(pMCAxes.Stop.Busy = 1)OR
		(pAxes.Output.Status.DryRunActive = 1)THEN
		pAxes.Output.Status.Busy:= 1;
	ELSE
		pAxes.Output.Status.Busy:= 0;
	END_IF
	
	
	
END_ACTION


ACTION AxACP10ReadState:
	
	pAxes.Output.State.Errorstop:= pMCAxes.ReadStatus.Errorstop;
	pAxes.Output.State.Disabled:= pMCAxes.ReadStatus.Disabled;
	pAxes.Output.State.Stopping:= pMCAxes.ReadStatus.Stopping;
	pAxes.Output.State.Standstill:= pMCAxes.ReadStatus.StandStill;
	pAxes.Output.State.DiscreteMotion:= pMCAxes.ReadStatus.DiscreteMotion;
	pAxes.Output.State.ContinuousMotion:= pMCAxes.ReadStatus.ContinuousMotion;
	pAxes.Output.State.SyncronizedMotion:= pMCAxes.ReadStatus.SynchronizedMotion;
	pAxes.Output.State.Homing:= pMCAxes.ReadStatus.Homing;	
		
END_ACTION

ACTION AxACP10ParameterInit:
	
	pAxACP10Dat ACCESS pAxesPrivate.AxesDatAddress;
	
	IF((pAxes.Input.Configuration.UnitPositionFaktor > 0) AND (pAxes.Input.Configuration.UnitVelocityFaktor > 0))THEN
	
		pAxes.Input.Parameter.Override:= 1.0;

		pAxes.Input.Parameter.HomePosition:= pAxACP10Dat.move.homing.parameter.s / pAxes.Input.Configuration.UnitPositionFaktor;
		
		pAxes.Input.Parameter.Velocity:= pAxACP10Dat.move.basis.parameter.v_pos / pAxes.Input.Configuration.UnitVelocityFaktor;
		
		pAxes.Input.Parameter.Acceleration:= pAxACP10Dat.move.basis.parameter.a1_pos / pAxes.Input.Configuration.UnitVelocityFaktor;
		pAxes.Input.Parameter.Deceleration:= pAxACP10Dat.move.basis.parameter.a1_neg / pAxes.Input.Configuration.UnitVelocityFaktor;
		
	END_IF


END_ACTION

ACTION AxACP10DryRun:
	
	pAxACP10Dat ACCESS pAxesPrivate.AxesDatAddress;
	
	pAxesPrivate.DryRun.ActualPosition:= pAxes.Output.Monitor.Position;
	
	IF(pAxes.Input.Parameter.DryRunInvertWheel = 1)THEN
		pAxesPrivate.DryRun.ActualDryRunWheelPosition:= -pAxes.Input.Parameter.DryRunWheelPosition;
	ELSE
		pAxesPrivate.DryRun.ActualDryRunWheelPosition:= pAxes.Input.Parameter.DryRunWheelPosition;
	END_IF
	
	IF	(pAxes.Input.Command.Stop <> 0)OR
 		(pAxes.Input.Command.EmergencyStop <> 0)OR
  		(pMCAxes.MoveAbsolute_0.Error = 1)OR
  		(pMCAxes.MoveAbsolute_1.Error = 1)THEN
 		pAxes.Output.Status.DryRunActive:= 0;
	END_IF
		  
	pAxesPrivate.DryRun.TimeDelayTon.PT:= DRYRUN_STOP_MOVEMENT_TIME_DELAY;
	
	IF(pAxes.Output.Status.DryRunActive = 1)AND(pAxes.Input.Parameter.DryRunWheelFactor > 0)THEN
		
		CASE pAxesPrivate.DryRun.Step OF
  	
			AXESDRYRUN_START:
				pAxesPrivate.DryRun.WheelStartOffset:= pAxesPrivate.DryRun.ActualPosition / pAxes.Input.Parameter.DryRunWheelFactor - pAxesPrivate.DryRun.ActualDryRunWheelPosition;
				pAxesPrivate.DryRun.CalcDryRunWheelPosition:= (pAxesPrivate.DryRun.ActualDryRunWheelPosition + pAxesPrivate.DryRun.WheelStartOffset) * pAxes.Input.Parameter.DryRunWheelFactor;
				pAxesPrivate.DryRun.DryRunWheelFactor:= pAxes.Input.Parameter.DryRunWheelFactor;
				pAxesPrivate.DryRun.CalcDryRunWheelPositionOld:= pAxesPrivate.DryRun.CalcDryRunWheelPosition;
				pAxesPrivate.DryRun.InvertWheelOld:= pAxes.Input.Parameter.DryRunInvertWheel;
				pAxesPrivate.DryRun.Step:= AXESDRYRUN_RUN;
				pAxesPrivate.DryRun.Stopping:= 0;
				(* End case AXESDRYRUN_START *)
				
			AXESDRYRUN_RUN:						
				IF	(pAxesPrivate.DryRun.DryRunWheelFactor <> pAxes.Input.Parameter.DryRunWheelFactor)OR
					(pAxesPrivate.DryRun.InvertWheelOld <> pAxes.Input.Parameter.DryRunInvertWheel)OR
	 				(pAxesPrivate.DryRun.Stopping = 1) OR pAxesPrivate.DryRun.OnLimitPosition THEN
					pAxesPrivate.DryRun.WheelStartOffset:= pAxesPrivate.DryRun.ActualPosition / pAxes.Input.Parameter.DryRunWheelFactor - pAxesPrivate.DryRun.ActualDryRunWheelPosition;
					pAxesPrivate.DryRun.CalcDryRunWheelPosition:= (pAxesPrivate.DryRun.ActualDryRunWheelPosition + pAxesPrivate.DryRun.WheelStartOffset) * pAxes.Input.Parameter.DryRunWheelFactor;
					pAxesPrivate.DryRun.DryRunWheelFactor:= pAxes.Input.Parameter.DryRunWheelFactor;
					pAxesPrivate.DryRun.InvertWheelOld:= pAxes.Input.Parameter.DryRunInvertWheel;	
					pAxesPrivate.DryRun.TimeDelayTon.IN:= 0;
					pAxesPrivate.DryRun.OnLimitPosition := FALSE;
				END_IF
					
				IF(pAxes.Output.State.DiscreteMotion = 1)AND(pAxesPrivate.DryRun.Stopping = 0)THEN
					pAxesPrivate.DryRun.TimeDelayTon.IN:= 1;
					IF(pAxesPrivate.DryRun.TimeDelayTon.Q = 1)THEN
						pAxesPrivate.DryRun.MC_MoveAbsolute_0.Execute:= 0;
						pAxesPrivate.DryRun.MC_MoveAbsolute_1.Execute:= 0;
	 					pMCAxes.Stop.Execute:= 1;
						pAxesPrivate.DryRun.Stopping:= 1;
						
						pAxesPrivate.DryRun.WheelStartOffset:= pAxesPrivate.DryRun.ActualPosition / pAxes.Input.Parameter.DryRunWheelFactor - pAxesPrivate.DryRun.ActualDryRunWheelPosition;
						pAxesPrivate.DryRun.CalcDryRunWheelPosition:= (pAxesPrivate.DryRun.ActualDryRunWheelPosition + pAxesPrivate.DryRun.WheelStartOffset) * pAxes.Input.Parameter.DryRunWheelFactor;
						pAxesPrivate.DryRun.DryRunWheelFactor:= pAxes.Input.Parameter.DryRunWheelFactor;
						pAxesPrivate.DryRun.InvertWheelOld:= pAxes.Input.Parameter.DryRunInvertWheel;	
						pAxesPrivate.DryRun.TimeDelayTon.IN:= 0;
					END_IF
				END_IF
				
				IF(pAxes.Output.State.Standstill = 1)THEN
					pAxesPrivate.DryRun.Stopping:= 0;
				END_IF
				
				
				pAxesPrivate.DryRun.CalcDryRunWheelPosition:= (pAxesPrivate.DryRun.ActualDryRunWheelPosition + pAxesPrivate.DryRun.WheelStartOffset) * pAxes.Input.Parameter.DryRunWheelFactor;
			
				
				IF	(pAxesPrivate.DryRun.CalcDryRunWheelPositionOld <> pAxesPrivate.DryRun.CalcDryRunWheelPosition)AND
					(pAxesPrivate.DryRun.MC_MoveAbsolute_0.Error = 0)AND
					(pAxesPrivate.DryRun.MC_MoveAbsolute_0.Error = 0)AND
	 				(pAxesPrivate.DryRun.Stopping = 0)THEN
					pAxesPrivate.DryRun.CalcDryRunWheelPositionOld:= pAxesPrivate.DryRun.CalcDryRunWheelPosition;
				
					pAxesPrivate.DryRun.MC_MoveAbsolute_0.Position:= pAxesPrivate.DryRun.CalcDryRunWheelPosition * pAxes.Input.Configuration.UnitPositionFaktor;
					pAxesPrivate.DryRun.MC_MoveAbsolute_0.Velocity:= pAxACP10Dat.limit.parameter.v_pos;
					pAxesPrivate.DryRun.MC_MoveAbsolute_0.Acceleration:= pAxACP10Dat.limit.parameter.a1_pos;
					pAxesPrivate.DryRun.MC_MoveAbsolute_0.Deceleration:= pAxACP10Dat.limit.parameter.a1_neg;
					pAxesPrivate.DryRun.MC_MoveAbsolute_0.Direction:= mcSHORTEST_WAY;
					
					pAxesPrivate.DryRun.MC_MoveAbsolute_1.Position:= pAxesPrivate.DryRun.CalcDryRunWheelPosition * pAxes.Input.Configuration.UnitPositionFaktor;
					pAxesPrivate.DryRun.MC_MoveAbsolute_1.Velocity:= pAxACP10Dat.limit.parameter.v_pos;
					pAxesPrivate.DryRun.MC_MoveAbsolute_1.Acceleration:= pAxACP10Dat.limit.parameter.a1_pos;
					pAxesPrivate.DryRun.MC_MoveAbsolute_1.Deceleration:= pAxACP10Dat.limit.parameter.a1_neg;
					pAxesPrivate.DryRun.MC_MoveAbsolute_1.Direction:= mcSHORTEST_WAY;
					
					// added according to CNC_Basis_Issues excel - jog is limited by  STOP_BEFORE_END_LIMIT_DISTANCE
					IF (pAxesPrivate.DryRun.MC_MoveAbsolute_0.Position > (pAxACP10Dat.limit.parameter.pos_sw_end - pAxes.Input.Configuration.DistanceToStopBeforeSW)) THEN
                 		 pAxesPrivate.DryRun.MC_MoveAbsolute_0.Position:= pAxACP10Dat.limit.parameter.pos_sw_end - pAxes.Input.Configuration.DistanceToStopBeforeSW;
						 pAxesPrivate.DryRun.OnLimitPosition:= TRUE;
              		END_IF
          
              		IF (pAxesPrivate.DryRun.MC_MoveAbsolute_0.Position < (pAxACP10Dat.limit.parameter.neg_sw_end + pAxes.Input.Configuration.DistanceToStopBeforeSW)) THEN
                  		pAxesPrivate.DryRun.MC_MoveAbsolute_0.Position:= pAxACP10Dat.limit.parameter.neg_sw_end + pAxes.Input.Configuration.DistanceToStopBeforeSW;
						pAxesPrivate.DryRun.OnLimitPosition:= TRUE;
             		 END_IF
              
     				IF (pAxesPrivate.DryRun.MC_MoveAbsolute_1.Position > (pAxACP10Dat.limit.parameter.pos_sw_end - pAxes.Input.Configuration.DistanceToStopBeforeSW)) THEN
                  		pAxesPrivate.DryRun.MC_MoveAbsolute_1.Position:= pAxACP10Dat.limit.parameter.pos_sw_end - pAxes.Input.Configuration.DistanceToStopBeforeSW;
						pAxesPrivate.DryRun.OnLimitPosition:= TRUE;
             		END_IF
          
              		IF (pAxesPrivate.DryRun.MC_MoveAbsolute_1.Position < (pAxACP10Dat.limit.parameter.neg_sw_end + pAxes.Input.Configuration.DistanceToStopBeforeSW)) THEN
                		 pAxesPrivate.DryRun.MC_MoveAbsolute_1.Position:= pAxACP10Dat.limit.parameter.neg_sw_end + pAxes.Input.Configuration.DistanceToStopBeforeSW;
						 pAxesPrivate.DryRun.OnLimitPosition:= TRUE;
             		END_IF
					
					
					IF	(pAxesPrivate.DryRun.MC_MoveAbsolute_0.Busy)THEN
						IF(pAxesPrivate.DryRun.MC_MoveAbsolute_1.Busy = 0)THEN
							pAxesPrivate.DryRun.MC_MoveAbsolute_1.Execute:= 1;
						END_IF
					ELSIF	(pAxesPrivate.DryRun.MC_MoveAbsolute_1.Busy)THEN
	 					IF(pAxesPrivate.DryRun.MC_MoveAbsolute_0.Busy = 0)THEN
							pAxesPrivate.DryRun.MC_MoveAbsolute_0.Execute:= 1;
						END_IF
					ELSIF	(pAxesPrivate.DryRun.MC_MoveAbsolute_0.Busy = 0) AND (pAxesPrivate.DryRun.MC_MoveAbsolute_1.Busy = 0)THEN
						pAxesPrivate.DryRun.MC_MoveAbsolute_0.Execute:= 1;
					END_IF
					
					pAxesPrivate.DryRun.TimeDelayTon.IN:= 0;
				END_IF	

				(* End case AXESDRYRUN_RUN *)
		END_CASE
		
	ELSE
		pAxesPrivate.DryRun.Step:= AXESDRYRUN_START;	
	END_IF
	
	IF	(pAxesPrivate.DryRun.MC_MoveAbsolute_0.Busy)OR
		(pAxesPrivate.DryRun.MC_MoveAbsolute_0.Error)THEN
		pAxesPrivate.DryRun.MC_MoveAbsolute_0.Execute:= 0;
	END_IF
	IF	(pAxesPrivate.DryRun.MC_MoveAbsolute_1.Busy)OR
		(pAxesPrivate.DryRun.MC_MoveAbsolute_1.Error)THEN
		pAxesPrivate.DryRun.MC_MoveAbsolute_1.Execute:= 0;
	END_IF
		 
	pAxesPrivate.DryRun.TimeDelayTon();
	pAxesPrivate.DryRun.MC_MoveAbsolute_0.Axis:= pAxesPrivate.AxesDatAddress;
	pAxesPrivate.DryRun.MC_MoveAbsolute_1.Axis:= pAxesPrivate.AxesDatAddress;
	
	IF(	pAxesPrivate.DryRun.MC_MoveAbsolute_0.Execute OR
		pAxesPrivate.DryRun.MC_MoveAbsolute_0.Done OR
		pAxesPrivate.DryRun.MC_MoveAbsolute_0.Busy OR
		pAxesPrivate.DryRun.MC_MoveAbsolute_0.CommandAborted OR
		pAxesPrivate.DryRun.MC_MoveAbsolute_0.Error ) THEN
		pAxesPrivate.DryRun.MC_MoveAbsolute_0();
	END_IF
		
	IF(	pAxesPrivate.DryRun.MC_MoveAbsolute_1.Execute OR
		pAxesPrivate.DryRun.MC_MoveAbsolute_1.Done OR
		pAxesPrivate.DryRun.MC_MoveAbsolute_1.Busy OR
		pAxesPrivate.DryRun.MC_MoveAbsolute_1.CommandAborted OR
		pAxesPrivate.DryRun.MC_MoveAbsolute_1.Error ) THEN
		pAxesPrivate.DryRun.MC_MoveAbsolute_1();
	END_IF
			
	
END_ACTION

