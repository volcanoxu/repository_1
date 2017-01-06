(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Program: Cnc
 * File: Actions.st
 * Author: radaka
 * Created: February 16, 2009
 ********************************************************************
 * Implementation of program Cnc
 ********************************************************************) 

ACTION CncAccess: 

	pCncPrivate.AccessStatus:= ncaccess( ncARNC0MAN, ADR(pCnc.Input.Configuration.NcMapObjName), ADR(pCncPrivate.CncDatAddress));
	IF(pCncPrivate.AccessStatus = ncOK)THEN
 		pCncPrivate.AccessOk:= 1;
		pCnc.Output.Status.AccessOk:= 1;
 	ELSE
		pCncPrivate.AccessOk:= 0;
		pCnc.Output.Status.AccessOk:= 0;
		pCnc.Output.Error.Count:= 1;
		pCnc.Output.Error.Text.Line1:= 'Cnc access error';
	END_IF

END_ACTION



ACTION CncInitParameter: 
	pCnc.Input.Parameter.FeedrateOverride:= 1.0;
	pCnc.Input.Parameter.RapidOverride:= 1.0;
END_ACTION



ACTION CncStateHandling:
	
	pCncDat ACCESS pCncPrivate.CncDatAddress;
	
	(* Enable Handling *)
	IF(pCnc.Input.Command.Enable = 0)THEN
		pCncPrivate.StateStep:= CNCSTATESTEP_DISABLED;
		pCncPrivate.DryrunActive:= 0;
		IF(pCncPrivate.WasEnable = 1)THEN
			pCncPrivate.WasEnable:= 0;
  			pCncPrivate.ActionRequest:= CNCACTION_EMERGENCYSTOP;
			pCncPrivate.StateStep:= CNCSTATESTEP_ERRORSTOP;
			pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;	(* Forced Command *)
			pCnc.Output.Status.Busy:= 1;
		END_IF
		IF(pCncPrivate.ActionResponse = CNCACTION_EMERGENCYSTOP)THEN
  			pCnc.Output.Status.Busy:= 0;
  		END_IF
	END_IF
	IF(pCnc.Input.Command.Enable <> 0)AND(pCncPrivate.StateStep <> CNCSTATESTEP_DISABLED)THEN
		pCncPrivate.WasEnable:= 1;
	END_IF	
	(* End Enable Hndling *)
	
	(* Error Handling *)
	IF(pCncDat.message.count.error > 0)AND(pCnc.Input.Command.Enable <> 0)THEN
		pCncPrivate.StateStep:= CNCSTATESTEP_ERRORSTOP;
		pCncPrivate.DryrunActive:= 0;
		IF( (pCncPrivate.ErrorStopping = 0)AND
			(pCnc.Input.Configuration.StopOnError = 1) )THEN
			pCncPrivate.ErrorStopping:= 1;
  			pCncPrivate.ActionRequest:= CNCACTION_EMERGENCYSTOP;
			pCncPrivate.StateStep:= CNCSTATESTEP_ERRORSTOP;
			pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;	(* Forced Command *)
			pCnc.Output.Status.Busy:= 1;
		ELSIF( (pCncPrivate.ErrorStopping = 0)AND
			(pCnc.Input.Configuration.StopOnError = 0) )THEN
			pCncPrivate.ErrorStopping:= 1;
  			pCncPrivate.ActionRequest:= CNCACTION_ERROR_TEXT;
			pCncPrivate.StateStep:= CNCSTATESTEP_ERRORSTOP;
			pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;	(* Forced Command *)
			pCnc.Output.Status.Busy:= 1;
  		END_IF
	ELSIF(pCncDat.message.count.error > 0)AND(pCncPrivate.ErrorStopping = 0)THEN
		pCncPrivate.ErrorStopping:= 1;
		pCncPrivate.ActionRequest:= CNCACTION_ERROR_TEXT;
		pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;	(* Forced Command *)
		pCnc.Output.Status.Busy:= 1;
	END_IF
	
	IF(pCncPrivate.StateStep <> CNCSTATESTEP_ERRORSTOP)AND(pCncDat.message.count.error = 0)THEN
 		pCncPrivate.ErrorStopping:= 0;
	END_IF
	(* End Error Handling *)
	
	brsmemset(ADR(pCnc.Output.State), 0,SIZEOF(pCnc.Output.State));
	
	CASE pCncPrivate.StateStep OF
 	
		CNCSTATESTEP_DISABLED:
		
			pCnc.Output.State.Disabled:= 1;
			
			IF  (pCnc.Input.Command.Enable <> 0)AND
				(pCncDat.message.count.error = 0)AND
				(pCnc.Output.Status.Busy = 0)AND
				(pCncPrivate.Enabeling = 0)  THEN
				pCncPrivate.Enabeling:= 1;
				pCncPrivate.ActionRequest:= CNCACTION_GLOBAL_INIT;
				pCnc.Output.Status.Busy:= 1;
			ELSIF(pCncPrivate.ActionResponse = CNCACTION_GLOBAL_INIT)AND(pCnc.Input.Command.Enable <> 0)THEN
				pCncPrivate.StateStep:= CNCSTATESTEP_STANDBY;
				pCncPrivate.Enabeling:= 0;
			ELSIF(pCnc.Input.Command.InitCncPar <> 0)THEN
				pCnc.Input.Command.InitCncPar:= 0;
				pCncPrivate.ActionRequest:= CNCACTION_GLOBAL_INIT;
				pCnc.Output.Status.Busy:= 1;
			ELSIF(pCnc.Input.Command.CncSimulationOn <> 0)AND(pCnc.Output.Status.Busy = 0)THEN
				pCnc.Input.Command.CncSimulationOn:= 0;
				pCnc.Output.Status.Busy:= 1;
				pCncPrivate.ActionRequest:= CNCACTION_CNC_SIMULATION_ON;
			ELSIF(pCnc.Input.Command.CncSimulationOff <> 0)AND(pCnc.Output.Status.Busy = 0)THEN
				pCnc.Input.Command.CncSimulationOff:= 0;
				pCnc.Output.Status.Busy:= 1;
				pCncPrivate.ActionRequest:= CNCACTION_CNC_SIMULATION_OFF;
			ELSIF(pCnc.Input.Command.SwitchOnRestart <> 0)AND(pCnc.Output.Status.Busy = 0)THEN
				pCnc.Input.Command.SwitchOnRestart:= 0;
				pCnc.Output.Status.Busy:= 1;
				pCncPrivate.ActionRequest:= CNCACTION_SW_ON_RESTART;			
			ELSIF(pCnc.Input.Command.SwitchOffRestart <> 0)AND(pCnc.Output.Status.Busy = 0)THEN
				pCnc.Input.Command.SwitchOffRestart:= 0;
				pCnc.Output.Status.Busy:= 1;
				pCncPrivate.ActionRequest:= CNCACTION_SW_OFF_RESTART;
			ELSIF(pCnc.Input.Command.RestartInfo <> 0)AND(pCnc.Output.Status.Busy = 0)THEN
				pCnc.Input.Command.RestartInfo:= 0;
				pCnc.Output.Status.Busy:= 1;
				pCncPrivate.ActionRequest:= CNCACTION_RESTART_INFO;
			ELSIF(pCnc.Input.Command.SaveRestart <> 0)AND(pCnc.Output.Status.Busy = 0)THEN
				pCnc.Input.Command.SaveRestart:= 0;
				pCnc.Output.Status.Busy:= 1;
				pCncPrivate.ActionRequest:= CNCACTION_SAVE_RESTART;
			ELSIF(pCnc.Input.Command.SetRestart <> 0)AND(pCnc.Output.Status.Busy = 0)THEN
				pCnc.Input.Command.SetRestart:= 0;
				pCnc.Output.Status.Busy:= 1;
				pCncPrivate.ActionRequest:= CNCACTION_SET_RESTART;
			END_IF
			(* End case CNCSTATESTEP_DISABLED: *)
		
		CNCSTATESTEP_STANDBY:
			
			pCnc.Output.State.Standby:= 1;
			pCncPrivate.DryrunActive:= 0;
				
			IF(pCnc.Input.Command.EmergencyStop <> 0)AND(pCncPrivate.ErrorStopping = 0)THEN
				pCnc.Input.Command.EmergencyStop:= 0;
				pCnc.Output.Status.Busy:= 1;
				pCncPrivate.ActionRequest:= CNCACTION_EMERGENCYSTOP;
				pCncPrivate.StateStep:= CNCSTATESTEP_STOPPING;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;	(* Forced Command *)
			ELSIF(pCnc.Input.Command.Stop <> 0)AND(pCnc.Output.Status.Busy = 0)THEN
				pCnc.Input.Command.Stop:= 0;
				pCnc.Output.Status.Busy:= 1;
				pCncPrivate.ActionRequest:= CNCACTION_STOP;
				pCncPrivate.StateStep:= CNCSTATESTEP_STOPPING;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;	(* Forced Command *)
			ELSIF(pCnc.Input.Command.StartNcProgram <> 0)AND(pCnc.Output.Status.Busy = 0)THEN
				pCnc.Input.Command.StartNcProgram:= 0;
				pCnc.Output.Status.Busy:= 1;
				pCncPrivate.ActionRequest:= CNCACTION_START_NCPROGRAM;
				pCnc.Output.State.Moving:= 1;
				pCncPrivate.StateStep:= CNCSTATESTEP_MOVING;
			ELSIF(pCnc.Input.Command.StartNcBlock <> 0)AND(pCnc.Output.Status.Busy = 0)THEN
				pCnc.Input.Command.StartNcBlock:= 0;
				pCnc.Output.Status.Busy:= 1;
				pCncPrivate.ActionRequest:= CNCACTION_START_NCBLOCK;
				pCnc.Output.State.Moving:= 1;
				pCncPrivate.StateStep:= CNCSTATESTEP_MOVING;
			ELSIF(pCnc.Input.Command.StartDryRun <> 0)AND(pCnc.Output.Status.Busy = 0)THEN
				pCnc.Input.Command.StartDryRun:= 0;
				pCnc.Output.Status.Busy:= 1;
				pCncPrivate.DryrunActive:= 1;	
				pCnc.Output.State.Moving:= 1;
				pCncPrivate.StateStep:= CNCSTATESTEP_MOVING;
			ELSIF(pCnc.Input.Command.CncSimulationOn <> 0)AND(pCnc.Output.Status.Busy = 0)THEN
				pCnc.Input.Command.CncSimulationOn:= 0;
				pCnc.Output.Status.Busy:= 1;
				pCncPrivate.ActionRequest:= CNCACTION_CNC_SIMULATION_ON;
			ELSIF(pCnc.Input.Command.CncSimulationOff <> 0)AND(pCnc.Output.Status.Busy = 0)THEN
				pCnc.Input.Command.CncSimulationOff:= 0;
				pCnc.Output.Status.Busy:= 1;
				pCncPrivate.ActionRequest:= CNCACTION_CNC_SIMULATION_OFF;		
			ELSIF(pCnc.Input.Command.SwitchOnRestart <> 0)AND(pCnc.Output.Status.Busy = 0)THEN
				pCnc.Input.Command.SwitchOnRestart:= 0;
				pCnc.Output.Status.Busy:= 1;
				pCncPrivate.ActionRequest:= CNCACTION_SW_ON_RESTART;			
			ELSIF(pCnc.Input.Command.SwitchOffRestart <> 0)AND(pCnc.Output.Status.Busy = 0)THEN
				pCnc.Input.Command.SwitchOffRestart:= 0;
				pCnc.Output.Status.Busy:= 1;
				pCncPrivate.ActionRequest:= CNCACTION_SW_OFF_RESTART;
			ELSIF(pCnc.Input.Command.RestartInfo <> 0)AND(pCnc.Output.Status.Busy = 0)THEN
				pCnc.Input.Command.RestartInfo:= 0;
				pCnc.Output.Status.Busy:= 1;
				pCncPrivate.ActionRequest:= CNCACTION_RESTART_INFO;
			ELSIF(pCnc.Input.Command.SaveRestart <> 0)AND(pCnc.Output.Status.Busy = 0)THEN
				pCnc.Input.Command.SaveRestart:= 0;
				pCnc.Output.Status.Busy:= 1;
				pCncPrivate.ActionRequest:= CNCACTION_SAVE_RESTART;
			ELSIF(pCnc.Input.Command.SetRestart <> 0)AND(pCnc.Output.Status.Busy = 0)THEN
				pCnc.Input.Command.SetRestart:= 0;
				pCnc.Output.Status.Busy:= 1;
				pCncPrivate.ActionRequest:= CNCACTION_SET_RESTART;
			ELSIF(pCnc.Input.Command.RestartProgram <> 0)AND(pCnc.Output.Status.Busy = 0)THEN
				pCnc.Input.Command.RestartProgram:= 0;
				pCnc.Output.Status.Busy:= 1;
				pCncPrivate.ActionRequest:= CNCACTION_RESTART_PROGRAM;
				pCnc.Output.State.Moving:= 1;
				pCncPrivate.StateStep:= CNCSTATESTEP_MOVING;
			END_IF
			(* End case CNCSTATESTEP_STANDBY: *)
			
		CNCSTATESTEP_MOVING:
		
			pCnc.Output.State.Moving:= 1;
			
			IF(pCnc.Input.Command.EmergencyStop <> 0)AND(pCncPrivate.ErrorStopping = 0)THEN
				pCnc.Input.Command.EmergencyStop:= 0;
				pCnc.Output.Status.Busy:= 1;
				pCncPrivate.ActionRequest:= CNCACTION_EMERGENCYSTOP;
				pCncPrivate.StateStep:= CNCSTATESTEP_STOPPING;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;	(* Forced Comand *)	
			ELSIF(pCnc.Input.Command.Stop <> 0)AND(pCnc.Output.Status.Busy = 0)THEN
				pCnc.Input.Command.Stop:= 0;
				pCnc.Output.Status.Busy:= 1;
				pCncPrivate.ActionRequest:= CNCACTION_STOP;
				pCncPrivate.StateStep:= CNCSTATESTEP_STOPPING;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;	(* Forced Comand *)	
			ELSIF(pCnc.Input.Command.Halt <> 0)AND(pCnc.Output.Status.Busy = 0)THEN
				pCnc.Input.Command.Halt:= 0;
				pCnc.Output.Status.Busy:= 1;
				pCncPrivate.ActionRequest:= CNCACTION_HALT;
			ELSIF(pCnc.Input.Command.Continue <> 0)AND(pCnc.Output.Status.Busy = 0)THEN
				pCnc.Input.Command.Continue:= 0;
				pCnc.Output.Status.Busy:= 1;
				pCncPrivate.ActionRequest:= CNCACTION_CONTINUE;
			ELSIF(pCnc.Input.Command.StartDryRun <> 0)AND(pCncDat.move.status.halt = TRUE)THEN
				pCnc.Input.Command.StartDryRun:= 0;
				pCncPrivate.DryrunActive:= 1;			
			ELSIF(pCnc.Output.Status.Busy = 0)AND(pCncDat.move.status.cnt_ncprog = 0)THEN
   				pCncPrivate.StateStep:= CNCSTATESTEP_STANDBY;
			END_IF
			(* End case CNCSTATESTEP_MOVING: *)
		
		CNCSTATESTEP_STOPPING:
		
			pCnc.Output.State.Stopping:= 1;
			
			IF(pCncPrivate.ActionResponse = CNCACTION_STOP)OR(pCncPrivate.ActionResponse = CNCACTION_EMERGENCYSTOP)THEN
   				pCncPrivate.StateStep:= CNCSTATESTEP_STANDBY;
				pCncPrivate.DryrunActive:= 0;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCSTATESTEP_STOPPING: *)
		
		CNCSTATESTEP_ERRORSTOP:
			
			pCnc.Output.State.Errorstop:= 1;
			
			IF(pCnc.Input.Command.Reset <> 0)AND(pCnc.Output.Status.Busy = 0)THEN
				pCncPrivate.Resetting:= 1;
				pCnc.Input.Command.Reset:= 0;
				pCncPrivate.ActionRequest:= CNCACTION_ACKNOWLEDGE;
			END_IF
			
			IF(pCncPrivate.Resetting = 1)AND(pCnc.Input.Command.Acknowledge = 0)THEN
   				IF(pCncPrivate.ActionResponse = CNCACTION_ERROR_TEXT)AND(pCnc.Output.Status.Busy = 0)THEN
					pCncPrivate.ActionRequest:= CNCACTION_ACKNOWLEDGE;
				ELSIF(pCncPrivate.ActionResponse = CNCACTION_ERROR_CHECK)AND(pCnc.Output.Status.Busy = 0)THEN
	 				pCncPrivate.StateStep:= CNCSTATESTEP_STANDBY;
					pCncPrivate.Resetting:= 0;
				END_IF
			ELSIF(pCnc.Input.Command.Acknowledge <> 0)AND(pCncPrivate.Resetting = 1)THEN
				pCnc.Input.Command.Acknowledge:= 0;
				pCncPrivate.Resetting:= 0;
			END_IF
			(* End case CNCSTATESTEP_ERRORSTOP: *)
 	
	END_CASE
	
	IF(pCnc.Output.Status.Busy = 0)THEN
		IF(pCnc.Input.Command.Acknowledge <> 0)THEN
	   		pCnc.Input.Command.Acknowledge:= 0;
			pCncPrivate.ActionRequest:= CNCACTION_ACKNOWLEDGE;
			pCnc.Output.Status.Busy:= 1;
		END_IF
	END_IF
	
	IF(pCnc.Output.Status.Busy = 0)AND
  		(pCnc.Output.Error.Count = 0)THEN
		IF(pCnc.Input.Command.LoadCncPar <> 0)THEN
	   		pCnc.Input.Command.LoadCncPar:= 0;
			pCncPrivate.ActionRequest:= CNCACTION_LOAD_PARAMETER;
			pCnc.Output.Status.Busy:= 1;
		ELSIF(pCnc.Input.Command.SaveCncPar <> 0)THEN
	   		pCnc.Input.Command.SaveCncPar:= 0;
			pCncPrivate.ActionRequest:= CNCACTION_SAVE_PARAMETER;
			pCnc.Output.Status.Busy:= 1;
		ELSIF(pCnc.Input.Command.StartSingleStep <> 0)THEN
	   		pCnc.Input.Command.StartSingleStep:= 0;
			pCncPrivate.ActionRequest:= CNCACTION_START_SINGLESTEP;
			pCnc.Output.Status.Busy:= 1;
		ELSIF(pCnc.Input.Command.StopSingleStep <> 0)THEN
	   		pCnc.Input.Command.StopSingleStep:= 0;
			pCncPrivate.ActionRequest:= CNCACTION_STOP_SINGLESTEP;
			pCnc.Output.Status.Busy:= 1;
		ELSIF(pCnc.Input.Command.SetZeroTable <> 0)THEN
	   		pCnc.Input.Command.SetZeroTable:= 0;
			pCncPrivate.ActionRequest:= CNCACTION_SET_ZERO_TABLE;
			pCnc.Output.Status.Busy:= 1;
		ELSIF(pCnc.Input.Command.SetToolTable <> 0)THEN
	   		pCnc.Input.Command.SetToolTable:= 0;
			pCncPrivate.ActionRequest:= CNCACTION_SET_TOOL_TABLE;
			pCnc.Output.Status.Busy:= 1;
		ELSIF(pCnc.Input.Command.SetRParTable <> 0)THEN
	   		pCnc.Input.Command.SetRParTable:= 0;
			pCncPrivate.ActionRequest:= CNCACTION_SET_RPAR_TABLE;
			pCnc.Output.Status.Busy:= 1;
		ELSIF(pCnc.Input.Command.InitCncSubjectPar <> 0)THEN
  			pCnc.Input.Command.InitCncSubjectPar:= 0;
			pCncPrivate.ActionRequest:= CNCACTION_INIT_SUBJECT_PAR;
			pCnc.Output.Status.Busy:= 1;
		ELSIF(pCnc.Input.Command.SetPositionMonitorMode <> 0)THEN
  			pCnc.Input.Command.SetPositionMonitorMode:= 0;
			pCncPrivate.ActionRequest:= CNCACTION_SET_POS_MON_MODE;
			pCnc.Output.Status.Busy:= 1;
		ELSIF(pCnc.Input.Command.ContinueDecoder <> 0)THEN
  			pCnc.Input.Command.ContinueDecoder:= 0;
			pCncPrivate.ActionRequest:= CNCACTION_CONTINUE_DECODER;
			pCnc.Output.Status.Busy:= 1;
		ELSIF(pCnc.Input.Command.LoadNcProgram <> 0)THEN
  			pCnc.Input.Command.LoadNcProgram:= 0;
			pCncPrivate.ActionRequest:= CNCACTION_LOAD_NCPROGRAM;
			pCnc.Output.Status.Busy:= 1;
		ELSIF(pCnc.Input.Command.UnloadNcProgram <> 0)THEN
  			pCnc.Input.Command.UnloadNcProgram:= 0;
			pCncPrivate.ActionRequest:= CNCACTION_UNLOAD_NCPROGRAM;
			pCnc.Output.Status.Busy:= 1;
		END_IF
	END_IF

END_ACTION

ACTION CncActions:
	
	pCncDat ACCESS pCncPrivate.CncDatAddress;
 
 	CASE pCncPrivate.ActionStep OF
 	
		CNCACTIONSTEP_COMMAND:
			IF(pCncPrivate.ActionRequest = CNCACTION_GLOBAL_INIT)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_GLOBAL_INIT;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_START_NCPROGRAM)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_START_NCPROGRAM;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_START_NCBLOCK)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_START_NCBLOCK;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_HALT)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_HALT;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_CONTINUE)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_CONTINUE;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_STOP)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_STOP;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_EMERGENCYSTOP)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_EMERGENCYSTOP;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_ACKNOWLEDGE)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_ERROR_ACKNOWLEDGE;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_ERROR_TEXT)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_ERROR_TEXT;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_LOAD_PARAMETER)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_LOAD_PARAMTER;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_SAVE_PARAMETER)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_SAVE_PARAMTER;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_START_SINGLESTEP)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_START_SINGLESTEP;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_STOP_SINGLESTEP)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_STOP_SINGLESTEP;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_SET_ZERO_TABLE)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_SET_ZERO_TABLE;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_SET_TOOL_TABLE)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_SET_TOOL_TABLE;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_SET_RPAR_TABLE)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_SET_RPAR_TABLE;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_INIT_SUBJECT_PAR)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_SELECT_SUBJECT;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_CNC_SIMULATION_ON)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_CNC_SIM_ON;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_CNC_SIMULATION_OFF)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_CNC_SIM_OFF;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_SW_ON_RESTART)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_SW_ON_RESTART;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_SW_OFF_RESTART)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_SW_OFF_RESTART;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_RESTART_INFO)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_RESTART_INFO;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_SAVE_RESTART)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_SAVE_RESTART;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_SET_RESTART)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_SET_RESTART;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_RESTART_PROGRAM)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_RESTART_PROGRAM;
			
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_SET_POS_MON_MODE)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_SET_POS_MON_MODE;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_CONTINUE_DECODER)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_CONTINUE_DECODER;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_LOAD_NCPROGRAM)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_LOAD_NCPROGRAM;
				
			ELSIF(pCncPrivate.ActionRequest = CNCACTION_UNLOAD_NCPROGRAM)THEN
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_UNLOAD_NCPROGRAM;
				
			END_IF
			
			(* End case CNCACTIONSTEP_COMMAND: *)
			
		CNCACTIONSTEP_GLOBAL_INIT:
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncGLOBAL, ncINIT);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_GLOBAL_INIT;
			END_IF
			(* End case CNCACTIONSTEP_GLOBAL_INIT: *)
			
		CNCACTIONSTEP_W_GLOBAL_INIT:
		(* Failbehaviour init always 0 *)
		(*			IF(pCncDat.global.init = 1)THEN
						pCncPrivate.ActionStep:= CNCACTIONSTEP_SET_WARNINGS;
					END_IF*)
			pCncPrivate.ActionStep:= CNCACTIONSTEP_SET_WARNINGS;
			(* End case CNCACTIONSTEP_W_GLOBAL_INIT: *)
		
		CNCACTIONSTEP_SET_WARNINGS:
			IF(pCnc.Input.Configuration.Warnings = ncOFF)THEN
				pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncERR_CL0, ncSWITCH_OFF);
				IF(pCncPrivate.ActionStatus = ncOK)THEN
					pCncPrivate.ActionStep:= CNCACTIONSTEP_W_SET_WARNINGS;
				END_IF
			ELSIF(pCnc.Input.Configuration.Warnings = ncON)THEN
				pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncERR_CL0, ncSWITCH_ON);
				IF(pCncPrivate.ActionStatus = ncOK)THEN
					pCncPrivate.ActionStep:= CNCACTIONSTEP_W_SET_WARNINGS;
				END_IF
			ELSE
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCnc.Output.Status.Busy:= 0;	
			END_IF
			(* End case CNCACTIONSTEP_SET_WARNINGS: *)
		
		CNCACTIONSTEP_W_SET_WARNINGS:
			IF(pCnc.Input.Configuration.Warnings = pCncDat.message.status.err_cl0)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_GLOBAL_INIT;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_W_SET_WARNINGS: *)
   			
	
		CNCACTIONSTEP_START_NCPROGRAM:
			pCncDat.move.ncprogram.start_mode:= pCnc.Input.Parameter.NcProgramStartMode;
			pCncDat.move.ncprogram.start_pos := pCnc.Input.Parameter.NcProgramStartPos;
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncPROGRAM, ncSTART);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_START_NCPROGRAM;
			END_IF
			(* End case CNCACTIONSTEP_START_NCPROG: *)
			
		 CNCACTIONSTEP_W_START_NCPROGRAM:
		 	IF(pCncDat.move.status.cnt_ncprog <> 0)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_START_NCPROGRAM;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_W_START_NCPROG: *)
			
		CNCACTIONSTEP_START_NCBLOCK:
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncBLOCK, ncSTART);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_START_NCBLOCK;
			END_IF
			(* End case CNCACTIONSTEP_START_NCBLOCK: *)
			
		CNCACTIONSTEP_W_START_NCBLOCK:
		 	IF(pCncDat.move.status.cnt_ncprog = 1)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_START_NCBLOCK;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_W_START_NCPROG: *)
			
		CNCACTIONSTEP_HALT:
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncMOVE, ncHALT);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_HALT;
			END_IF
			(* End case CNCACTIONSTEP_HALT: *)
		
		CNCACTIONSTEP_W_HALT:
			IF(pCncDat.move.status.halt = ncTRUE)AND(pCncDat.move.status.halt_info = ncHALT_PLC)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_HALT;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_W_HALT: *)
			
		CNCACTIONSTEP_CONTINUE:
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncMOVE, ncCONTINUE);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_CONTINUE;
			END_IF
			(* End case CNCACTIONSTEP_CONTINUE: *)
		
		CNCACTIONSTEP_W_CONTINUE:
			IF(pCncDat.move.status.halt = ncFALSE)AND(pCncDat.move.status.halt_info = ncOFF)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_CONTINUE;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_W_CONTINUE: *)
			
		CNCACTIONSTEP_STOP:
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncMOVE, ncSTOP);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_STOP;
			END_IF
			(* End case CNCACTIONSTEP_STOP: *)
		
		CNCACTIONSTEP_W_STOP:
			IF(pCncDat.move.status.cnt_ncprog = 0)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_STOP;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_W_STOP: *)
			
		CNCACTIONSTEP_EMERGENCYSTOP:
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncMOVE, ncE_STOP);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_EMERGENCYSTOP;
			END_IF
			(* End case CNCACTIONSTEP_STOP: *)
		
		CNCACTIONSTEP_W_EMERGENCYSTOP:
			IF(pCncDat.move.status.cnt_ncprog = 0)THEN
				IF(pCncPrivate.ErrorStopping = 1)THEN
					pCncPrivate.ActionStep:= CNCACTIONSTEP_ERROR_TEXT;
				ELSE
					pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
					pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
					pCncPrivate.ActionResponse:= CNCACTION_EMERGENCYSTOP;
					pCnc.Output.Status.Busy:= 0;
				END_IF
			END_IF
			(* End case CNCACTIONSTEP_W_STOP: *) 
			
		CNCACTIONSTEP_ERROR_TEXT:
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncMESSAGE, ncTEXT);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCnc.Output.Error.HmiCount:= pCnc.Output.Error.Count;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_ERROR_TEXT;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_ERROR_TEXT: *) 
			
		CNCACTIONSTEP_ERROR_ACKNOWLEDGE:
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncMESSAGE, ncACKNOWLEDGE);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_ERROR_CHECK;
			END_IF
			(* End case CNCACTIONSTEP_ERROR_ACKNOWLEDGE: *) 
			
		CNCACTIONSTEP_ERROR_CHECK:
			IF(pCncDat.message.count.error > 0)THEN
   				pCncPrivate.ActionStep:= CNCACTIONSTEP_ERROR_TEXT;
   			ELSE
				pCnc.Output.Error.HmiCount:= pCnc.Output.Error.Count;
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_ERROR_CHECK;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_ERROR_CHECK: *)
			
		CNCACTIONSTEP_LOAD_PARAMTER:
			brsmemset(ADR(pCncDat.global.init_par.data_modul), 0, SIZEOF(pCncDat.global.init_par.data_modul));
			brsmemcpy(ADR(pCncDat.global.init_par.data_modul), ADR(pCnc.Input.Parameter.LoadCncParDataObjectName), SIZEOF(pCncDat.global.init_par.data_modul));
			
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncGLOBAL, ncLOAD);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_LOAD_PARAMETER;
			END_IF
			(* End case CNCACTIONSTEP_LOAD_PARAMTER: *)
			
		CNCACTIONSTEP_W_LOAD_PARAMETER:
			IF(pCncDat.global.init_par.ok = ncTRUE)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_LOAD_PARAMETER;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_W_LOAD_PARAMETER: *)
			
		CNCACTIONSTEP_SAVE_PARAMTER:
			brsmemset(ADR(pCncDat.global.init_par.data_modul), 0, SIZEOF(pCncDat.global.init_par.data_modul));
			brsmemcpy(ADR(pCncDat.global.init_par.data_modul), ADR(pCnc.Input.Parameter.SaveCncParDataObjectName), SIZEOF(pCncDat.global.init_par.data_modul));
		
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncGLOBAL, ncSAVE);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_SAVE_PARAMETER;
			END_IF
			(* End case CNCACTIONSTEP_SAVE_PARAMTER: *)
			
		CNCACTIONSTEP_W_SAVE_PARAMETER:
			IF(pCncDat.global.init_par.ok = ncTRUE)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_SAVE_PARAMETER;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_W_SAVE_PARAMETER: *)
			
		CNCACTIONSTEP_START_SINGLESTEP:
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncSINGLE, ncSWITCH_ON);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_START_SINGLESTEP;
			END_IF
			(* End case CNCACTIONSTEP_START_SINGLESTEP: *)
			
		CNCACTIONSTEP_W_START_SINGLESTEP:
			IF(pCncDat.move.status.single_s = ncON)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_START_SINGLESTEP;
				pCnc.Output.Status.SingleStep:= 1;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_W_START_SINGLESTEP: *)
			
		CNCACTIONSTEP_STOP_SINGLESTEP:
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncSINGLE, ncSWITCH_OFF);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_STOP_SINGLESTEP;
			END_IF
			(* End case CNCACTIONSTEP_STOP_SINGLESTEP: *)
			
		CNCACTIONSTEP_W_STOP_SINGLESTEP:
//			IF(pCncDat.move.status.single_s = ncOFF)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_STOP_SINGLESTEP;
				pCnc.Output.Status.SingleStep:= 0;
				pCnc.Output.Status.Busy:= 0;
//			END_IF
			(* End case CNCACTIONSTEP_W_STOP_SINGLESTEP: *)
			
			
		CNCACTIONSTEP_SET_ZERO_TABLE:
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncZERO_TAB, ncSET);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_SET_ZERO_TABLE;
			END_IF
			(* End case CNCACTIONSTEP_SET_ZERO_TABLE *)

		CNCACTIONSTEP_W_SET_ZERO_TABLE:
			IF(pCncDat.decoder.data_modul.status.complete = ncTRUE)THEN
				brsmemcpy(ADR(pCnc.Output.Monitor.Table.ZeroTableName), ADR(pCncDat.decoder.data_modul.zero_tab), SIZEOF(pCncDat.decoder.data_modul.zero_tab));
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_SET_ZERO_TABLE;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_W_SET_ZERO_TABLE *)

		CNCACTIONSTEP_SET_TOOL_TABLE:
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncTOOL_TAB, ncSET);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_SET_TOOL_TABLE;
			END_IF
			(* End case CNCACTIONSTEP_SET_TOOL_TABLE *)

		CNCACTIONSTEP_W_SET_TOOL_TABLE:
			IF(pCncDat.decoder.data_modul.status.complete = ncTRUE)THEN
				brsmemcpy(ADR(pCnc.Output.Monitor.Table.ToolTableName), ADR(pCncDat.decoder.data_modul.tool_tab), SIZEOF(pCncDat.decoder.data_modul.tool_tab));
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_SET_TOOL_TABLE;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_W_SET_TOOL_TABLE *)

		CNCACTIONSTEP_SET_RPAR_TABLE:
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncR_PARTAB, ncSET);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_SET_RPAR_TABLE;
			END_IF
			(* End case CNCACTIONSTEP_SET_RPAR_TABLE *)

		CNCACTIONSTEP_W_SET_RPAR_TABLE:
			IF(pCncDat.decoder.data_modul.status.complete = ncTRUE)THEN
				brsmemcpy(ADR(pCnc.Output.Monitor.Table.RParTableName), ADR(pCncDat.decoder.data_modul.rpar_tab), SIZEOF(pCncDat.decoder.data_modul.rpar_tab));
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_SET_RPAR_TABLE;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_W_SET_RPAR_TABLE *)

			
		CNCACTIONSTEP_SELECT_SUBJECT:
			IF(pCnc.Input.Parameter.InitCncSubjectPar = ncGLOBAL)THEN
		 		pCncPrivate.ActionStep:= CNCACTIONSTEP_GLOBAL_INIT;
			ELSIF(pCnc.Input.Parameter.InitCncSubjectPar = ncLIMITS)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_LIMITS_INIT;
			ELSIF(pCnc.Input.Parameter.InitCncSubjectPar = ncDECODER)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_DECODER_INIT;
			ELSIF(pCnc.Input.Parameter.InitCncSubjectPar = ncAXES)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_AXES_INIT;
			ELSIF(pCnc.Input.Parameter.InitCncSubjectPar = ncCNC_PLC)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_CNC_PLC_INIT;
			ELSE
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_SELECT_SUBJECT *)
	
		CNCACTIONSTEP_LIMITS_INIT:
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncLIMITS, ncINIT);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_LIMITS_INIT;
			END_IF
			(* End case CNCACTIONSTEP_LIMITS_INIT *)
	
		CNCACTIONSTEP_W_LIMITS_INIT:
			pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
			pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
			pCncPrivate.ActionResponse:= CNCACTION_LIMITS_INIT;
			pCnc.Output.Status.Busy:= 0;
			(* End case CNCACTIONSTEP_W_LIMITS_INIT *)
	
		CNCACTIONSTEP_DECODER_INIT:
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncDECODER, ncINIT);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_DECODER_INIT;
			END_IF
			(* End case CNCACTIONSTEP_DECODER_INIT *)
	
		CNCACTIONSTEP_W_DECODER_INIT:
			pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
			pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
			pCncPrivate.ActionResponse:= CNCACTION_DECODER_INIT;
			pCnc.Output.Status.Busy:= 0;
			(* End case CNCACTIONSTEP_W_DECODER_INIT *)
	
		CNCACTIONSTEP_AXES_INIT:
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncAXES, ncINIT);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_AXES_INIT;
			END_IF
			(* End case CNCACTIONSTEP_AXES_INIT *)
	
		CNCACTIONSTEP_W_AXES_INIT:
			pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
			pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
			pCncPrivate.ActionResponse:= CNCACTION_AXES_INIT;
			pCnc.Output.Status.Busy:= 0;
			(* End case CNCACTIONSTEP_W_AXES_INIT *)
	
		CNCACTIONSTEP_CNC_PLC_INIT:
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncCNC_PLC, ncINIT);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_CNC_PLC_INIT;
			END_IF
			(* End case CNCACTIONSTEP_CNC_PLC_INIT *)
	
		CNCACTIONSTEP_W_CNC_PLC_INIT:
			pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
			pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
			pCncPrivate.ActionResponse:= CNCACTION_CNC_PLC_INIT;
			pCnc.Output.Status.Busy:= 0;
			(* End case CNCACTIONSTEP_W_CNC_PLC_INIT *)
			
		 CNCACTIONSTEP_CNC_SIM_ON:
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncSIMULATION, ncSWITCH_ON);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_CNC_SIM_ON;
			END_IF
			(* End case CNCACTIONSTEP_CNC_SIM_ON *)
	
		 CNCACTIONSTEP_W_CNC_SIM_ON:
			IF(pCncDat.simulation.status = ncON)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_CNC_SIMULATION_ON;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_W_CNC_SIM_ON *)
	
		 CNCACTIONSTEP_CNC_SIM_OFF:
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncSIMULATION, ncSWITCH_OFF);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_CNC_SIM_OFF;
			END_IF
			(* End case CNCACTIONSTEP_CNC_SIM_OFF *)
	
		 CNCACTIONSTEP_W_CNC_SIM_OFF:
			IF(pCncDat.simulation.status = ncOFF)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_CNC_SIMULATION_OFF;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_W_CNC_SIM_OFF *)
				
		 CNCACTIONSTEP_SW_ON_RESTART:
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncRESTART, ncSW_ON);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_SW_ON_RESTART;
			END_IF
			(* End case CNCACTIONSTEP_SW_ON_RESTART *)
 
		 CNCACTIONSTEP_W_SW_ON_RESTART:
			IF(pCncDat.restart.status.enabled = ncTRUE)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_SW_ON_RESTART;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_W_SW_ON_RESTART *)
 
		 CNCACTIONSTEP_SW_OFF_RESTART:
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncRESTART, ncSW_OFF);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_SW_OFF_RESTART;
			END_IF
			(* End case CNCACTIONSTEP_SW_OFF_RESTART *)
 
		 CNCACTIONSTEP_W_SW_OFF_RESTART:
			IF(pCncDat.restart.status.enabled = ncFALSE)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_SW_OFF_RESTART;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_W_SW_OFF_RESTART *)
 
		 CNCACTIONSTEP_RESTART_INFO:
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncRESTART, ncINFO);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_RESTART_INFO;
			END_IF
			(* End case CNCACTIONSTEP_RESTART_INFO *)
 
		 CNCACTIONSTEP_W_RESTART_INFO:
			IF(pCncDat.restart.info.status.complete = ncTRUE)THEN
				brsmemset(ADR(pCnc.Output.Monitor.Restart.NcInitProgramName), 0, SIZEOF(pCnc.Output.Monitor.Restart.NcInitProgramName));
				brsmemcpy(ADR(pCnc.Output.Monitor.Restart.NcInitProgramName), ADR(pCncDat.restart.info.result.init_prg), SIZEOF(pCnc.Output.Monitor.Restart.NcInitProgramName));
				brsmemset(ADR(pCnc.Output.Monitor.Restart.NcProgramName), 0, SIZEOF(pCnc.Output.Monitor.Restart.NcProgramName));
				brsmemcpy(ADR(pCnc.Output.Monitor.Restart.NcProgramName), ADR(pCncDat.restart.info.result.name), SIZEOF(pCnc.Output.Monitor.Restart.NcProgramName));
				pCnc.Output.Monitor.Restart.NcProgramStartMode		:= pCncDat.restart.info.result.start_mode;
				pCnc.Output.Monitor.Restart.Position				:= pCncDat.restart.info.result.start_pos;
				pCnc.Output.Monitor.Restart.Restart_Type			:= pCncDat.restart.info.result.restart_type;
				pCnc.Output.Monitor.Restart.BlockNumber				:= pCncDat.restart.info.result.block_ncprog;
				pCnc.Output.Monitor.Restart.ByteOffset				:= pCncDat.restart.info.result.offset_ncprog;
				pCnc.Output.Monitor.Restart.S_ncprog 				:= pCncDat.restart.info.result.s_ncprog;
				pCnc.Output.Monitor.Restart.Start_pos_type 			:= pCncDat.restart.info.result.start_pos_type;
				
					
				pCncPrivate.Number:= REAL_TO_USINT(SIZEOF(pCnc.Output.Monitor.Restart.AxPosition)/SIZEOF(pCnc.Output.Monitor.Restart.AxPosition[0])-1);
				FOR j:= 0 TO pCncPrivate.Number DO
					pCnc.Output.Monitor.Restart.AxPosition[j]:= pCncDat.restart.info.result.s_set[j];
				END_FOR
				
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_RESTART_INFO;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_W_RESTART_INFO *)
 
		 CNCACTIONSTEP_SAVE_RESTART:
			brsmemset(ADR(pCncDat.data_modul.name),0,SIZEOF(pCncDat.data_modul.name));
			brsmemcpy(ADR(pCncDat.data_modul.name),ADR(pCnc.Input.Parameter.Restart.RestartModuleName),SIZEOF(pCnc.Input.Parameter.Restart.RestartModuleName));
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncRESTART, ncSAVE);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_SAVE_RESTART;
			END_IF
			(* End case CNCACTIONSTEP_SAVE_RESTART *)
 
		 CNCACTIONSTEP_W_SAVE_RESTART:
			IF(pCncDat.data_modul.status.complete = ncTRUE)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_SAVE_RESTART;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_W_SAVE_RESTART *)
 
		 CNCACTIONSTEP_SET_RESTART:
			brsmemset(ADR(pCncDat.data_modul.name),0,SIZEOF(pCncDat.data_modul.name));
			brsmemcpy(ADR(pCncDat.data_modul.name),ADR(pCnc.Input.Parameter.Restart.RestartModuleName),SIZEOF(pCnc.Input.Parameter.Restart.RestartModuleName));
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncRESTART, ncSET);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_SET_RESTART;
			END_IF
			(* End case CNCACTIONSTEP_SET_RESTART *)
 
		 CNCACTIONSTEP_W_SET_RESTART:
			IF(pCncDat.data_modul.status.complete = ncTRUE)THEN
				
				brsmemset(ADR(pCnc.Output.Monitor.Restart.NcInitProgramName), 0, SIZEOF(pCnc.Output.Monitor.Restart.NcInitProgramName));
				brsmemcpy(ADR(pCnc.Output.Monitor.Restart.NcInitProgramName), ADR(pCncDat.restart.info.result.init_prg), SIZEOF(pCnc.Output.Monitor.Restart.NcInitProgramName));
				brsmemset(ADR(pCnc.Output.Monitor.Restart.NcProgramName), 0, SIZEOF(pCnc.Output.Monitor.Restart.NcProgramName));
				brsmemcpy(ADR(pCnc.Output.Monitor.Restart.NcProgramName), ADR(pCncDat.restart.info.result.name), SIZEOF(pCnc.Output.Monitor.Restart.NcProgramName));
				pCnc.Output.Monitor.Restart.NcProgramStartMode	:= pCncDat.restart.info.result.start_mode;
				pCnc.Output.Monitor.Restart.Position							:= pCncDat.restart.info.result.start_pos;
				pCnc.Output.Monitor.Restart.Restart_Type				:= pCncDat.restart.info.result.restart_type;
				pCnc.Output.Monitor.Restart.BlockNumber				:= pCncDat.restart.info.result.block_ncprog;
				pCnc.Output.Monitor.Restart.ByteOffset						:= pCncDat.restart.info.result.offset_ncprog;
				pCnc.Output.Monitor.Restart.S_ncprog 						:= pCncDat.restart.info.result.s_ncprog;
				pCnc.Output.Monitor.Restart.Start_pos_type 			:= pCncDat.restart.info.result.start_pos_type;
				
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_SET_RESTART;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_W_SET_RESTART *)
 
		 CNCACTIONSTEP_RESTART_PROGRAM:
		 	brsmemset(ADR(pCncDat.move.ncprogram.init_prg), 0, SIZEOF(pCncDat.move.ncprogram.init_prg));
			brsmemcpy(ADR(pCncDat.move.ncprogram.init_prg), ADR(pCnc.Input.Parameter.Restart.NcInitProgramName), SIZEOF(pCncDat.move.ncprogram.init_prg));
		 	brsmemset(ADR(pCncDat.move.ncprogram.name), 0, SIZEOF(pCncDat.move.ncprogram.name));
			brsmemcpy(ADR(pCncDat.move.ncprogram.name), ADR(pCnc.Input.Parameter.Restart.NcProgramName), SIZEOF(pCncDat.move.ncprogram.name));
			pCncDat.move.ncprogram.start_mode		:= pCnc.Input.Parameter.Restart.NcProgramStartMode;
			pCncDat.move.ncprogram.s_ncprog			:= pCnc.Input.Parameter.Restart.Position;
			pCncDat.move.ncprogram.restart_type		:= pCnc.Input.Parameter.Restart.Restart_Type;
			pCncDat.move.ncprogram.block_ncprog	:= pCnc.Input.Parameter.Restart.BlockNumber;
			pCncDat.move.ncprogram.offset_ncprog	:= pCnc.Input.Parameter.Restart.ByteOffset;
		 	pCncDat.move.ncprogram.s_ncprog 			:= pCnc.Input.Parameter.Restart.S_ncprog; 
			pCncDat.move.ncprogram.start_pos_type := pCnc.Input.Parameter.Restart.Start_pos_typ;
		 
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncPROGRAM, ncRESTART);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_RESTART_PROGRAM;
			END_IF
			(* End case CNCACTIONSTEP_RESTART_PROGRAM *)
 
		 CNCACTIONSTEP_W_RESTART_PROGRAM:
			IF	(pCncDat.move.status.halt = ncTRUE)AND
		 		(pCncDat.move.status.halt_info = ncHALT_RST)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_RESTART_PROGRAM;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_W_RESTART_PROGRAM *)			
			
			
		CNCACTIONSTEP_SET_POS_MON_MODE:
			IF(pCnc.Input.Parameter.PositionMonitorMode = ncOFF)THEN
				pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncPOSMON, ncSWITCH_OFF);
				IF(pCncPrivate.ActionStatus = ncOK)THEN
					pCncPrivate.ActionStep:= CNCACTIONSTEP_W_SET_POS_MON_MODE;
				END_IF
			ELSE
				pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncPOSMON, ncSWITCH_ON);
				IF(pCncPrivate.ActionStatus = ncOK)THEN
					pCncPrivate.ActionStep:= CNCACTIONSTEP_W_SET_POS_MON_MODE;
				END_IF
			END_IF
			(* End case CNCACTIONSTEP_SET_POS_MON_MODE *)
			
		CNCACTIONSTEP_W_SET_POS_MON_MODE:
			IF(pCncDat.monitor.status.pos_mode = pCnc.Input.Parameter.PositionMonitorMode)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_SET_POS_MON_MODE;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_W_SET_POS_MON_MODE *)
						
		CNCACTIONSTEP_CONTINUE_DECODER:
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncDECODER, ncSYNC);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_CONTINUE_DECODER;
			END_IF
			(* End case CNCACTIONSTEP_CONTINUE_DECODER *)
			
		CNCACTIONSTEP_W_CONTINUE_DECODER:
			IF(pCncDat.decoder.status.sync = ncFALSE)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_CONTINUE_DECODER;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case  *)
			
		CNCACTIONSTEP_LOAD_NCPROGRAM:
			pCncDat.move.ncprogram.start_mode:= pCnc.Input.Parameter.NcProgramStartMode;
			
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncPROGRAM, ncLOAD);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_LOAD_NCPROGRAM;
			END_IF
			(* End case CNCACTIONSTEP_W_CONTINUE_DECODER *)
			
		CNCACTIONSTEP_W_LOAD_NCPROGRAM:
			IF(pCncDat.decoder.status.program_load = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_LOAD_NCPROGRAM;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_W_LOAD_NCPROGRAM *)
			
		CNCACTIONSTEP_UNLOAD_NCPROGRAM:
			pCncDat.move.ncprogram.delete_mode:= pCnc.Input.Parameter.NcProgramUnloadMode;
			
			pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncPROGRAM, ncDELETE);
			IF(pCncPrivate.ActionStatus = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_W_UNLOAD_NCPROGRAM;
			END_IF
			(* End case CNCACTIONSTEP_UNLOAD_NCPROGRAM *)
			
		CNCACTIONSTEP_W_UNLOAD_NCPROGRAM:
			IF(pCncDat.decoder.status.program_unload = ncOK)THEN
				pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
				pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
				pCncPrivate.ActionResponse:= CNCACTION_UNLOAD_NCPROGRAM;
				pCnc.Output.Status.Busy:= 0;
			END_IF
			(* End case CNCACTIONSTEP_W_UNLOAD_NCPROGRAM *)

			
			

			
	(* End CASE pCncPrivate.ActionStep OF *)
	END_CASE		
	
END_ACTION


ACTION CncSetParameter:
	
	pCncDat ACCESS pCncPrivate.CncDatAddress;

	(* Reference to buffer for error texts *)
	brsmemset(ADR(pCncDat.message.text.parameter.data_modul), 0, SIZEOF(pCncDat.message.text.parameter.data_modul));
 	brsmemcpy(ADR(pCncDat.message.text.parameter.data_modul), ADR(pCnc.Input.Configuration.ErrorTextDataModulName), SIZEOF(pCncDat.message.text.parameter.data_modul));
	pCncDat.message.text.parameter.data_adr:= ADR(pCnc.Output.Error.Text);
 	pCncDat.message.text.parameter.data_len:= SIZEOF(pCnc.Output.Error.Text);
	pCncDat.message.text.parameter.columns:= SIZEOF(pCnc.Output.Error.Text.Line1);
	pCncDat.message.text.parameter.format:= ncBREAK + ncZERO;
	
	brsmemset(ADR(pCncDat.move.ncprogram.init_prg), 0, SIZEOF(pCncDat.move.ncprogram.init_prg));
 	brsmemcpy(ADR(pCncDat.move.ncprogram.init_prg), ADR(pCnc.Input.Parameter.NcInitProgramName), SIZEOF(pCncDat.move.ncprogram.init_prg));
	brsmemset(ADR(pCncDat.move.ncprogram.name), 0, SIZEOF(pCncDat.move.ncprogram.name));
 	brsmemcpy(ADR(pCncDat.move.ncprogram.name), ADR(pCnc.Input.Parameter.NcProgramName), SIZEOF(pCncDat.move.ncprogram.name));	
	
	brsmemset(ADR(pCncDat.move.ncblock), 0, SIZEOF(pCncDat.move.ncblock));
	brsmemcpy(ADR(pCncDat.move.ncblock), ADR(pCnc.Input.Parameter.NcBlock), SIZEOF(pCncDat.move.ncblock));
	
	pCncPrivate.DryRun.ActualDryRunWheelPosition:= pCnc.Input.Parameter.DryRunWheelPosition;
	
	IF(pCncPrivate.DryrunActive = 1)AND(pCnc.Input.Parameter.DryRunMode = 2)THEN
		pCncDat.move.override:= pCncPrivate.DryRun.CalcOverride;
	ELSE
		pCncDat.move.override:= 10000;
 	END_IF	
 	
	pCncDat.move.F_override:= REAL_TO_UDINT(pCnc.Input.Parameter.FeedrateOverride * 10000.0);
	pCncDat.move.R_override:= REAL_TO_UINT(pCnc.Input.Parameter.RapidOverride * 10000.0);
	
	brsmemset(ADR(pCncDat.decoder.data_modul.zero_tab), 0, SIZEOF(pCncDat.decoder.data_modul.zero_tab));
	brsmemcpy(ADR(pCncDat.decoder.data_modul.zero_tab), ADR(pCnc.Input.Parameter.Table.ZeroTableName), SIZEOF(pCncDat.decoder.data_modul.zero_tab));
	brsmemset(ADR(pCncDat.decoder.data_modul.tool_tab), 0, SIZEOF(pCncDat.decoder.data_modul.tool_tab));
	brsmemcpy(ADR(pCncDat.decoder.data_modul.tool_tab), ADR(pCnc.Input.Parameter.Table.ToolTableName), SIZEOF(pCncDat.decoder.data_modul.tool_tab));
	brsmemset(ADR(pCncDat.decoder.data_modul.rpar_tab), 0, SIZEOF(pCncDat.decoder.data_modul.rpar_tab));
	brsmemcpy(ADR(pCncDat.decoder.data_modul.rpar_tab), ADR(pCnc.Input.Parameter.Table.RParTableName), SIZEOF(pCncDat.decoder.data_modul.rpar_tab));	
	
	IF(pCnc.Input.Parameter.PositionMonitorMode <> ncOFF)THEN
 		pCncDat.monitor.parameter.pos_mode:= pCnc.Input.Parameter.PositionMonitorMode;
	END_IF
	

	
END_ACTION
	
ACTION CncResetCommands:
	(*pCnc.Input.Command.Enable*) 
	pCnc.Input.Command.InitCncPar:= 0;
	pCnc.Input.Command.InitCncSubjectPar:= 0;
	pCnc.Input.Command.SaveCncPar:= 0;
	pCnc.Input.Command.LoadCncPar:= 0;
	pCnc.Input.Command.CncSimulationOn:= 0;
	pCnc.Input.Command.CncSimulationOff:= 0;
	pCnc.Input.Command.StartSingleStep:= 0;
	pCnc.Input.Command.StopSingleStep:= 0;
	pCnc.Input.Command.SwitchOnRestart:= 0;
	pCnc.Input.Command.SwitchOffRestart:= 0;
	pCnc.Input.Command.SaveRestart:= 0;
	pCnc.Input.Command.SetRestart:= 0;
	pCnc.Input.Command.StartNcProgram:= 0;
	pCnc.Input.Command.StartNcBlock:= 0;
	pCnc.Input.Command.StartDryRun:= 0;
	pCnc.Input.Command.RestartProgram:= 0;
	pCnc.Input.Command.RestartInfo:= 0;
	pCnc.Input.Command.Halt:= 0;
	pCnc.Input.Command.Continue:= 0;
	pCnc.Input.Command.Stop:= 0;
	pCnc.Input.Command.EmergencyStop:= 0;
	pCnc.Input.Command.Acknowledge:= 0;
	pCnc.Input.Command.Reset:= 0;
	pCnc.Input.Command.SetZeroTable:= 0;
	pCnc.Input.Command.SetToolTable:= 0;
	pCnc.Input.Command.SetRParTable:= 0;

	
END_ACTION

ACTION CncReadStatus:
	
	pCncDat ACCESS pCncPrivate.CncDatAddress;
	
	pCnc.Output.Status.Ready:= 1; //USINT_TO_BOOL(pCncDat.global.init);
	
	IF  (pCncDat.message.count.error > 0)OR
		(pCncPrivate.NcCncComOk = 0)THEN
 		pCnc.Output.Status.Error:= 1;
	ELSE
		pCnc.Output.Status.Error:= 0;
 	END_IF
	
	pCnc.Output.Status.CncDatAddress:= pCncPrivate.CncDatAddress;
	
	IF(pCncDat.simulation.status = ncON)THEN
		pCnc.Output.Status.Simulation:= 1;
	ELSE
		pCnc.Output.Status.Simulation:= 0;
	END_IF
	
	pCnc.Output.Status.PositionMonitorMode:= pCncDat.monitor.status.pos_mode;
	
	IF(pCncDat.move.status.halt = ncON)THEN
		pCnc.Output.Status.Halted:= 1;
	ELSIF(pCncDat.move.status.halt = ncOFF)THEN
		pCnc.Output.Status.Halted:= 0;
	END_IF
		
	pCnc.Output.Status.DecoderStatusSync:= pCncDat.decoder.status.sync;
	
	IF(pCncDat.move.status.single_s = ncON)THEN
		pCnc.Output.Status.SingleStep:= 1;
	ELSE
		pCnc.Output.Status.SingleStep:= 0;
	END_IF
	
END_ACTION

ACTION CncMonitor:
	
	pCncDat ACCESS pCncPrivate.CncDatAddress;
	
	pCncDatBlockMonitor ACCESS pCncDat.monitor.ncblocks.access_adr;
	
	(* Error*)
	IF(pCncDat.message.count.error > 0)THEN
		IF(pCncPrivate.NcCncComOk = 0)THEN
 			pCnc.Output.Error.Count:= pCncDat.message.count.error + 1;
		ELSE
			pCnc.Output.Error.Count:= pCncDat.message.count.error;
		END_IF
		pCnc.Output.Error.Number:= pCncDat.message.record.number;
	ELSIF(pCncPrivate.NcCncComOk = 0)THEN
		brsmemset(ADR(pCnc.Output.Error), 0, SIZEOF(pCnc.Output.Error));
		pCnc.Output.Error.Text.Line1:= 'Cnc-PLC communication error';
		pCnc.Output.Error.Count:= 1;
	ELSE
		brsmemset(ADR(pCnc.Output.Error), 0, SIZEOF(pCnc.Output.Error));
	END_IF
	
	IF	(pCnc.Output.State.Moving = 1)OR
 		(pCnc.Output.State.Stopping = 1)OR
  		(pCnc.Output.State.Errorstop = 1)THEN
		(* Program Monitor *)
		pCnc.Output.Monitor.NcProgram.Number:= pCncDat.monitor.nr_ncprog;
		brsmemset(ADR(pCnc.Output.Monitor.NcProgram.Name), 0, SIZEOF(pCnc.Output.Monitor.NcProgram.Name));
  		brsmemcpy(ADR(pCnc.Output.Monitor.NcProgram.Name), ADR(pCncDat.monitor.name_ncprog), SIZEOF(pCnc.Output.Monitor.NcProgram.Name));
		pCnc.Output.Monitor.NcProgram.Position:= pCncDat.monitor.pos_ncprog;
		pCnc.Output.Monitor.NcProgram.DefinedVelocity:= pCncDat.monitor.v_ncprog;
		pCnc.Output.Monitor.NcProgram.ToolNumber:= pCncDat.monitor.tool_nr;
		pCnc.Output.Monitor.NcProgram.ZeroIndex:= pCncDat.monitor.zero_idx;
	
		(* Block Monitor *)
		brsmemset(ADR(pCnc.Output.Monitor.NcBlock), 0,SIZEOF(pCnc.Output.Monitor.NcBlock));
		pCnc.Output.Monitor.NcBlock.Number:= pCncDat.monitor.block_ncprog;
		pCnc.Output.Monitor.NcBlock.Type:= pCncDat.monitor.type_ncblock;
		brsmemcpy(ADR(pCnc.Output.Monitor.NcBlock.TextLast2), ADR(pCncDatBlockMonitor.ncblock_l2), brsstrlen(ADR(pCncDatBlockMonitor.ncblock_l2)));
		brsmemcpy(ADR(pCnc.Output.Monitor.NcBlock.TextLast1), ADR(pCncDatBlockMonitor.ncblock_l1), brsstrlen(ADR(pCncDatBlockMonitor.ncblock_l1)));
		brsmemcpy(ADR(pCnc.Output.Monitor.NcBlock.TextActual), ADR(pCncDatBlockMonitor.ncblock), brsstrlen(ADR(pCncDatBlockMonitor.ncblock)));
		brsmemcpy(ADR(pCnc.Output.Monitor.NcBlock.TextNext1), ADR(pCncDatBlockMonitor.ncblock_n1), brsstrlen(ADR(pCncDatBlockMonitor.ncblock_n1)));
		brsmemcpy(ADR(pCnc.Output.Monitor.NcBlock.TextNext2), ADR(pCncDatBlockMonitor.ncblock_n2), brsstrlen(ADR(pCncDatBlockMonitor.ncblock_n2)));
		pCnc.Output.Monitor.NcBlock.RemainingPathDistance:= pCncDatBlockMonitor.s_ncblock;
		pCnc.Output.Monitor.NcBlock.PathLengthActual:= pCncDatBlockMonitor.s_ncblock_tot;
		pCnc.Output.Monitor.NcBlock.PathLengthNext1:= pCncDatBlockMonitor.s_ncblock_n1;
		pCncDatBlockMonitor.handshake:= 0;
	
		(* Path *)
		pCnc.Output.Monitor.Path.ActualVelocity:= pCncDat.monitor.v_path;
		pCnc.Output.Monitor.Path.ActualPathLenght:= pCncDat.monitor.s_ncprog;
		pCnc.Output.Monitor.Path.ActualRunTime:= pCncDat.monitor.t_ncprog;
		pCnc.Output.Monitor.Path.MaximalVelocity:= pCncDat.limit.v;
	ELSE
		brsmemset(ADR(pCnc.Output.Monitor.NcProgram), 0,SIZEOF(pCnc.Output.Monitor.NcProgram));
		brsmemset(ADR(pCnc.Output.Monitor.NcBlock), 0,SIZEOF(pCnc.Output.Monitor.NcBlock));
		brsmemset(ADR(pCnc.Output.Monitor.Path), 0,SIZEOF(pCnc.Output.Monitor.Path));
	END_IF
	
	(* Parameter *)
	pCnc.Output.Monitor.Parameter.ExternalParameterAccessAddress:= pCncDat.cnc_plc.ex_param.access_adr;
	pCnc.Output.Monitor.Parameter.MParameterAccessAddress:= pCncDat.cnc_plc.m_param.access_adr;
	pCnc.Output.Monitor.Parameter.MFunctionAccessAddress:= ADR(pCncDat.cnc_plc.data.m_funct);
	pCnc.Output.Monitor.Parameter.TFunctionValue:= pCncDat.cnc_plc.data.t_funct;
	pCnc.Output.Monitor.Parameter.SFunctionValue[0]:= pCncDat.cnc_plc.data.s_funct[0];
	pCnc.Output.Monitor.Parameter.SFunctionValue[1]:= pCncDat.cnc_plc.data.s_funct[1];
	pCnc.Output.Monitor.Parameter.SFunctionValue[2]:= pCncDat.cnc_plc.data.s_funct[2];
	pCnc.Output.Monitor.Parameter.SFunctionValue[3]:= pCncDat.cnc_plc.data.s_funct[3];
	
	pCncPrivate.Number:= REAL_TO_USINT(SIZEOF(pCnc.Output.Monitor.Axes)/SIZEOF(pCnc.Output.Monitor.Axes[0])-1);
	FOR j:= 0 TO pCncPrivate.Number DO
		pCnc.Output.Monitor.Axes[j].Position:= pCncDat.monitor.s_set[j];
		pCnc.Output.Monitor.Axes[j].AxesDatAddress:= pCncDat.axis.axis[j].nc_object;
	END_FOR
	
END_ACTION

ACTION CncNcCncComCall:
	
	pCncPrivate.NcCncComStatus:= nccnccom(pCncPrivate.CncDatAddress);
	IF(pCncPrivate.NcCncComStatus = 0)THEN
		pCncPrivate.NcCncComOk:= 1;
	ELSE
		pCncPrivate.NcCncComOk:= 0;	
	END_IF
	
END_ACTION

ACTION CncDryRun:
	
	pCncDat ACCESS pCncPrivate.CncDatAddress;
	
	pCnc.Output.Status.DryRun:= pCncPrivate.DryrunActive;
	
	pCncPrivate.DryRun.TimeoutTon.PT:= DRYRUN_CNC_STOP_MOVE_TIME_DELAY;
	
	IF(pCncPrivate.DryrunActive = 1)AND(pCnc.Input.Parameter.DryRunWheelFactor > 0)THEN
	
		pCncPrivate.DryRun.ActualPathPosition:= pCnc.Output.Monitor.Path.ActualPathLenght;
	
		CASE pCncPrivate.DryRun.Step OF
 		
			CNCDRYRUN_START:
					IF(pCncDat.move.status.halt = TRUE)THEN
						pCncPrivate.DryRun.WheelStartOffset:= pCncPrivate.DryRun.ActualPathPosition / pCnc.Input.Parameter.DryRunWheelFactor - pCncPrivate.DryRun.ActualDryRunWheelPosition;
						pCncPrivate.DryRun.CalcDryRunWheelPosition:= (pCncPrivate.DryRun.ActualDryRunWheelPosition + pCncPrivate.DryRun.WheelStartOffset) * pCnc.Input.Parameter.DryRunWheelFactor;
						pCncPrivate.DryRun.DryRunWheelFactor:= pCnc.Input.Parameter.DryRunWheelFactor;
						pCncPrivate.DryRun.CalcDryRunWheelPositionOld:= pCncPrivate.DryRun.CalcDryRunWheelPosition;
						IF(pCnc.Input.Parameter.DryRunMode = 1)THEN
							pCncPrivate.DryRun.Step:= CNCDRYRUN_M1_WAIT_WHEEL_CHANGE;
							pCnc.Output.Status.Busy:= 0;
						ELSIF(pCnc.Input.Parameter.DryRunMode = 2)THEN
							pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncMOVE, ncCONTINUE);
							IF(pCncPrivate.ActionStatus = ncOK)THEN
								pCncPrivate.DryRun.Step:= CNCDRYRUN_M2_POSITION_CONTROL;
								pCnc.Output.Status.Busy:= 0;
							END_IF
							pCncPrivate.DryRun.Override_P_Factor:= DRYRUN_P_FACTOR;
							pCncPrivate.DryRun.Override:= (pCncPrivate.DryRun.CalcDryRunWheelPosition - pCncPrivate.DryRun.ActualPathPosition) * pCncPrivate.DryRun.Override_P_Factor;
							IF(pCncPrivate.DryRun.Override > 10000)THEN
								pCncPrivate.DryRun.CalcOverride:= 10000;
							ELSIF(pCncPrivate.DryRun.Override < -10000)THEN
								pCncPrivate.DryRun.CalcOverride:= -10000;
							ELSE
								pCncPrivate.DryRun.CalcOverride:= REAL_TO_INT(pCncPrivate.DryRun.Override);
							END_IF
						END_IF
					ELSE
						pCnc.Output.Status.Busy:= 1;
						pCncPrivate.ActionRequest:= CNCACTION_START_NCPROGRAM;
						pCncPrivate.DryRun.Step:= CNCDRYRUN_WAIT_PROGRAM_START;
						(* P Factor for DryRunMode 2 *)
						pCncPrivate.DryRun.Override_P_Factor:= 0.0;
					END_IF
				(* End case CNCDRYRUN_START *)
	
			CNCDRYRUN_WAIT_PROGRAM_START:
					pCnc.Output.Status.Busy:= 1;
					IF	(pCncPrivate.ActionResponse = CNCACTION_START_NCPROGRAM)AND
						(pCncPrivate.ActionRequest = CNCACTION_NO_ACTION)AND
	  					(pCnc.Output.State.Moving = 1)THEN
	 					pCncPrivate.ActionRequest:= CNCACTION_STOP;
						pCncPrivate.DryRun.Step:= CNCDRYRUN_WAIT_STOP_FOR_RESET;
					END_IF
					(* End case CNCDRYRUN_START *)
					
			CNCDRYRUN_WAIT_STOP_FOR_RESET:
					pCnc.Output.Status.Busy:= 1;
					IF	(pCncPrivate.ActionResponse = CNCACTION_STOP)AND
						(pCncPrivate.ActionRequest = CNCACTION_NO_ACTION)THEN
						pCncPrivate.ActionRequest:= CNCACTION_START_NCPROGRAM;
					ELSIF	(pCncPrivate.ActionResponse = CNCACTION_START_NCPROGRAM)AND
							(pCncPrivate.ActionRequest = CNCACTION_NO_ACTION)AND
	   						(pCnc.Output.State.Moving = 1)THEN
						pCncPrivate.ActionRequest:= CNCACTION_HALT;
					ELSIF	(pCncPrivate.ActionResponse = CNCACTION_HALT)AND
							(pCncPrivate.ActionRequest = CNCACTION_NO_ACTION)AND
							(pCnc.Output.Status.Halted = 1)THEN
						(* P Factor for DryRunMode 2 *)
						pCncPrivate.DryRun.Override_P_Factor:= DRYRUN_P_FACTOR;
						pCncPrivate.DryRun.Step:= CNCDRYRUN_START;
						pCnc.Output.Status.Busy:= 1;
					END_IF
					(* End case CNCDRYRUN_WAIT_STOP_FOR_RESET *)
			
	
			CNCDRYRUN_M1_WAIT_WHEEL_CHANGE:
				IF(pCncPrivate.DryRun.DryRunWheelFactor <> pCnc.Input.Parameter.DryRunWheelFactor)THEN
					pCncPrivate.DryRun.WheelStartOffset:= pCncPrivate.DryRun.ActualPathPosition / pCnc.Input.Parameter.DryRunWheelFactor - pCncPrivate.DryRun.ActualDryRunWheelPosition;
					pCncPrivate.DryRun.CalcDryRunWheelPosition:= (pCncPrivate.DryRun.ActualDryRunWheelPosition + pCncPrivate.DryRun.WheelStartOffset) * pCnc.Input.Parameter.DryRunWheelFactor;
					pCncPrivate.DryRun.DryRunWheelFactor:= pCnc.Input.Parameter.DryRunWheelFactor;
					pCncPrivate.DryRun.CalcDryRunWheelPositionOld:= pCncPrivate.DryRun.CalcDryRunWheelPosition;
				END_IF
				
				IF(pCncPrivate.DryRun.CalcDryRunWheelPositionOld <> pCncPrivate.DryRun.CalcDryRunWheelPosition)THEN
					pCncPrivate.DryRun.CalcDryRunWheelPositionOld:= pCncPrivate.DryRun.CalcDryRunWheelPosition;
					pCncDat.move.ncprogram.s_ncprog:= pCncPrivate.DryRun.CalcDryRunWheelPosition;
					pCncPrivate.ActionStatus:= ncaction(pCncPrivate.CncDatAddress, ncNCPR_POS, ncSTART);
					IF(pCncPrivate.ActionStatus = ncOK)THEN
						pCncPrivate.DryRun.Step:= CNCDRYRUN_M1_WAIT_POSITIONING;
					END_IF
				END_IF
				(* End case CNCDRYRUN_WAIT_WHEEL_CHANGE *)
	
			CNCDRYRUN_M1_WAIT_POSITIONING:
				IF(pCncDat.move.status.halt = TRUE)THEN
	   				pCncPrivate.DryRun.Step:= CNCDRYRUN_M1_WAIT_WHEEL_CHANGE;				
	   			END_IF			
				(* End case CNCDRYRUN_WAIT_POSITIONING *)
				
			CNCDRYRUN_M2_POSITION_CONTROL:
				
				IF	(pCncPrivate.DryRun.DryRunWheelFactor <> pCnc.Input.Parameter.DryRunWheelFactor)OR
					((pCncPrivate.DryRun.TimeoutTon.Q = 1)AND(pCncPrivate.DryRun.OldDryRunWheelPosition = pCncPrivate.DryRun.ActualDryRunWheelPosition))THEN
					pCncPrivate.DryRun.WheelStartOffset:= pCncPrivate.DryRun.ActualPathPosition / pCnc.Input.Parameter.DryRunWheelFactor - pCncPrivate.DryRun.ActualDryRunWheelPosition;
					pCncPrivate.DryRun.CalcDryRunWheelPosition:= (pCncPrivate.DryRun.ActualDryRunWheelPosition + pCncPrivate.DryRun.WheelStartOffset) * pCnc.Input.Parameter.DryRunWheelFactor;
					pCncPrivate.DryRun.DryRunWheelFactor:= pCnc.Input.Parameter.DryRunWheelFactor;
					pCncPrivate.DryRun.CalcDryRunWheelPositionOld:= pCncPrivate.DryRun.CalcDryRunWheelPosition;
					pCncPrivate.DryRun.TimeoutTon.IN:= 0;
				END_IF
			
				pCncPrivate.DryRun.Override:= (pCncPrivate.DryRun.CalcDryRunWheelPosition - pCncPrivate.DryRun.ActualPathPosition) * pCncPrivate.DryRun.Override_P_Factor;
				IF(pCncPrivate.DryRun.Override > 10000)THEN
					pCncPrivate.DryRun.CalcOverride:= 10000;
				ELSIF(pCncPrivate.DryRun.Override < -10000)THEN
					pCncPrivate.DryRun.CalcOverride:= -10000;
				ELSE
					pCncPrivate.DryRun.CalcOverride:= REAL_TO_INT(pCncPrivate.DryRun.Override);
				END_IF
				
				(* Timeout reaction *)
				IF(pCncPrivate.DryRun.OldDryRunWheelPosition = pCncPrivate.DryRun.ActualDryRunWheelPosition)THEN
					pCncPrivate.DryRun.TimeoutTon.IN:= 1;
				ELSE
					pCncPrivate.DryRun.TimeoutTon.IN:= 0;
				END_IF
				
				(* End case CNCDRYRUN_M2_POSITION_CONTROL *)
	
		(* End CASE pCncPrivate.DryRun.Step OF *)
		END_CASE

		pCncPrivate.DryRun.CalcDryRunWheelPosition:= (pCncPrivate.DryRun.ActualDryRunWheelPosition + pCncPrivate.DryRun.WheelStartOffset) * pCncPrivate.DryRun.DryRunWheelFactor;

	ELSE
		pCncPrivate.DryRun.Step:= CNCDRYRUN_START;
		pCncPrivate.DryRun.TimeoutTon.IN:= 0;
	END_IF
	
	pCncPrivate.DryRun.OldDryRunWheelPosition:= pCncPrivate.DryRun.ActualDryRunWheelPosition;
	pCncPrivate.DryRun.TimeoutTon();
	
END_ACTION
	