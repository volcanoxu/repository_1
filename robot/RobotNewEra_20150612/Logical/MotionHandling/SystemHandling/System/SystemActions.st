(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Program: System
 * File: SystemActions.st
 * Author: radaka
 * Created: February 18, 2009
 ********************************************************************
 * Implementation of program System
 ********************************************************************) 

ACTION SystemAccess:
	
	pSystemPrivate.AccessOk:= 1;
	pSystem.Output.Status.AccessOk:= 1;
	FOR j:= 0 TO MAX_AX_MINUS_ONE DO
		TempIndex:= pSystem.Input.Configuration.SystemAxes[j].Index;
		IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
			IF	(pAxes[TempIndex].Output.Status.AccessOk = 0)AND
				(pAxes[TempIndex].Input.Configuration.Active = 1)THEN
				pSystem.Output.Status.AccessOk:= 0;
				pSystemPrivate.AccessOk:= 0;			
			END_IF
		END_IF
	END_FOR
	FOR j:= 0 TO MAX_CNC_MINUS_ONE DO
		TempIndex:= pSystem.Input.Configuration.SystemCncIndex[j];
		IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
			IF	(pCnc[TempIndex].Output.Status.AccessOk = 0)AND
				(pCnc[TempIndex].Input.Configuration.Active = 1)THEN
				pSystem.Output.Status.AccessOk:= 0;
				pSystemPrivate.AccessOk:= 0;
			END_IF
		END_IF
	END_FOR	
	
END_ACTION

ACTION SystemStateHandling:
	
	(* StartService Handling *)
	IF(pSystem.Output.State.Service = 0)THEN
 		
		IF(pSystem.Input.Command.StartService <> 0)THEN
			pSystemPrivate.SystemStateStep:= SYSSTATESTEP_SERVICE;
			pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND;
			pSystemPrivate.ActionRequest:= SYSACTION_NO_ACTION;
			pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
			pSystem.Input.Command.StartService:= 0;
			pSystem.Output.State.Service:= 1;
			pSystem.Output.Status.Busy:= 1;
			pSystem.Output.Monitor.Mode:= NO_MODE_ACTIVE;
		END_IF

	END_IF
	
	IF(pSystem.Output.State.Service = 0)THEN
	
		(* Enable Handling *)
		IF(pSystem.Input.Command.Enable = 0)THEN
			IF(pSystemPrivate.SystemStateStep <> SYSSTATESTEP_BOOTING)THEN
	  			pSystemPrivate.SystemStateStep:= SYSSTATESTEP_DISABLED;
			END_IF
			IF(pSystemPrivate.WasEnable = 1)THEN
				pSystemPrivate.WasEnable:= 0;
				pSystemPrivate.Disabeling:= 1;
				pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
	  			pSystemPrivate.ActionRequest:= SYSACTION_EMERGENCYSTOP;
				pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND;	 (* Forced Command *) 
				pSystemPrivate.ModeChanging:= 0;
				pSystem.Output.Status.Busy:= 1;
			END_IF
			IF(pSystemPrivate.ActionResponse = SYSACTION_EMERGENCYSTOP)THEN
	  			pSystem.Output.Status.Busy:= 0;
	  		END_IF
			pSystem.Output.Monitor.Mode:= NO_MODE_ACTIVE;
		END_IF
		IF	(pSystem.Input.Command.Enable <> 0)AND
				(pSystemPrivate.SystemStateStep <> SYSSTATESTEP_DISABLED)AND
				(pSystemPrivate.SystemStateStep <> SYSSTATESTEP_BOOTING)THEN
			pSystemPrivate.WasEnable:= 1;
		END_IF
		(* End Enable Handling *)
		
		(* Error Handling *)
		IF(pSystem.Output.Error.Count > 0) AND (pSystem.Input.Command.Enable <> 0)THEN
			pSystemPrivate.SystemStateStep:= SYSSTATESTEP_ERRORSTOP;
			pSystemPrivate.Enabeling:= 0;
			IF(pSystemPrivate.ErrorStopping = 0)THEN
				pSystemPrivate.ErrorStopping:= 1;
				pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
	  			pSystemPrivate.ActionRequest:= SYSACTION_EMERGENCYSTOP;
				pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND;	 (* Forced Command *) 
				pSystemPrivate.ModeChanging:= 0;
				pSystem.Output.Status.Busy:= 1;
			END_IF
			pSystem.Output.Monitor.Mode:= NO_MODE_ACTIVE;
		ELSIF (pSystem.Input.Command.Enable <> 0)THEN
			// going to errorstop when axis in errorstop while enabling system
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemAxes[j].Index;
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pAxes[TempIndex].Output.State.Errorstop <> 0)THEN
						pSystemPrivate.SystemStateStep:= SYSSTATESTEP_ERRORSTOP;
						//pSystemPrivate.Enabeling:= 0;
//						IF(pSystemPrivate.ErrorStopping = 0)THEN
//							pSystemPrivate.ErrorStopping:= 1;
//							pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
//				  			pSystemPrivate.ActionRequest:= SYSACTION_EMERGENCYSTOP;
//							pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND;	 (* Forced Command *) 
//							pSystemPrivate.ModeChanging:= 0;
//							pSystem.Output.Status.Busy:= 1;
//						END_IF
					pSystem.Output.Monitor.Mode:= NO_MODE_ACTIVE;				
					END_IF
				END_IF
			END_FOR	
			// going to errorstop when cnc in errorstop while enabling system
			FOR j:= 0 TO MAX_CNC_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemCncIndex[j];
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pCnc[TempIndex].Output.State.Errorstop <> 0)AND(pSystem.Input.Command.Enable <> 0)THEN
						pSystemPrivate.SystemStateStep:= SYSSTATESTEP_ERRORSTOP;
						pSystemPrivate.Enabeling:= 0;
						IF(pSystemPrivate.ErrorStopping = 0)THEN
							pSystemPrivate.ErrorStopping:= 1;
							pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
				  			pSystemPrivate.ActionRequest:= SYSACTION_EMERGENCYSTOP;
							pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND;	 (* Forced Command *) 
							pSystemPrivate.ModeChanging:= 0;
							pSystem.Output.Status.Busy:= 1;
						END_IF
					pSystem.Output.Monitor.Mode:= NO_MODE_ACTIVE;				
					END_IF
				END_IF
			END_FOR
		END_IF
		
			
		
		IF(pSystemPrivate.SystemStateStep <> SYSSTATESTEP_ERRORSTOP)AND(pSystem.Output.Error.Count = 0)THEN
  			pSystemPrivate.ErrorStopping:= 0;
		END_IF		
		(* End Error Handling *)
	
	(* End IF(pSystem.Output.State.Service = 0)THEN *)
	END_IF
	
	brsmemset(ADR(pSystem.Output.State), 0, SIZEOF(pSystem.Output.State));
	
	CASE pSystemPrivate.SystemStateStep OF
		
		SYSSTATESTEP_BOOTING:
		
			IF(pSystemPrivate.StartupOk = 1)THEN
				pSystemPrivate.SystemStateStep:= SYSSTATESTEP_DISABLED;
			END_IF
			(* End case SYSSTATESTEP_BOOTING *)
 	
		SYSSTATESTEP_DISABLED:
		
			pSystem.Output.State.Disabled:= 1;
			
			IF	(pSystem.Input.Command.Enable <> 0)AND
				(pSystem.Output.Status.Busy = 0)AND
				(pSystemPrivate.Enabeling = 0)THEN
				pSystemPrivate.Enabeling:= 1;
   				pSystemPrivate.ActionRequest:= SYSACTION_ENABLE;
				pSystem.Output.Status.Busy:= 1;
			ELSIF	(pSystemPrivate.ActionResponse = SYSACTION_ENABLE)THEN
				pSystemPrivate.Enabeling:= 0;
				pSystemPrivate.SystemStateStep:= SYSSTATESTEP_STANDBY;
			ELSIF(pSystem.Output.Status.Busy = 0)THEN
				IF(pSystem.Input.Command.Init <> 0)THEN
					pSystem.Input.Command.Init:= 0;		
	   				pSystemPrivate.ActionRequest:= SYSACTION_INIT;
					pSystem.Output.Status.Busy:= 1;
				ELSIF(pSystem.Input.Command.StopSimulation <> 0)THEN
			   		pSystem.Input.Command.StopSimulation:= 0;
					pSystemPrivate.ActionRequest:= SYSACTION_STOP_SIMULATION;
					pSystem.Output.Status.Busy:= 1;
				ELSIF(pSystem.Input.Command.StartSimulation <> 0)THEN
			   		pSystem.Input.Command.StartSimulation:= 0;
					pSystemPrivate.ActionRequest:= SYSACTION_START_SIMULATION;
					pSystem.Output.Status.Busy:= 1;
				END_IF
			END_IF
			(* End case SYSSTATESTEP_DISABLED *)
		
		SYSSTATESTEP_STANDBY:
			
			pSystem.Output.State.Standby:= 1;
			
			IF(pSystem.Input.Command.Stop <> 0)THEN
   				pSystemPrivate.SystemStateStep:= SYSSTATESTEP_STOPPING;
				pSystemPrivate.ActionRequest:= SYSACTION_STOP;
				pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND; (* forced command *)
				pSystem.Input.Command.Stop:= 0;
				pSystem.Output.Status.Busy:= 1;
			ELSIF(pSystem.Input.Command.EmergencyStop <> 0)THEN
   				pSystemPrivate.SystemStateStep:= SYSSTATESTEP_STOPPING;
				pSystemPrivate.ActionRequest:= SYSACTION_EMERGENCYSTOP;
				pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND; (* forced command *)
				pSystem.Input.Command.EmergencyStop:= 0;
				pSystem.Output.Status.Busy:= 1;
			ELSIF(pSystem.Input.Command.Home <> 0)AND
				(pSystem.Output.Status.Busy = 0)THEN
   				pSystemPrivate.ActionRequest:= SYSACTION_HOME;
				pSystemPrivate.SystemStateStep:= SYSSTATESTEP_HOMING;
				pSystemPrivate.HomeFromActive:= 0;
				pSystem.Input.Command.Home:= 0;
				pSystem.Output.Status.Busy:= 1;
			ELSIF(pSystem.Input.Command.ChangeMode <> 0)AND
				(pSystem.Output.Status.Busy = 0)THEN
   				pSystemPrivate.ModeChanging:= 1;	
				pSystemPrivate.SystemStateStep:= SYSSTATESTEP_ACTIVE;
				pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_STOP_CNC;
				pSystem.Input.Command.ChangeMode:= 0;
				pSystem.Output.Monitor.Mode:= NO_MODE_ACTIVE;
				pSystem.Output.Status.Busy:= 1;
			END_IF
			
			(* End case SYSSTATESTEP_STANDBY *)
		
		SYSSTATESTEP_HOMING:
			
			pSystem.Output.State.Homing:= 1;
			
			IF(pSystemPrivate.HomeFromActive = 1)THEN
				IF(pSystemPrivate.ActionResponse = SYSACTION_STOP)THEN
					pSystemPrivate.ActionRequest:= SYSACTION_HOME;
				ELSIF(pSystemPrivate.ActionResponse = SYSACTION_HOME)THEN
	   				pSystemPrivate.ModeChanging:= 1;	
					pSystemPrivate.SystemStateStep:= SYSSTATESTEP_ACTIVE;
					pSystem.Input.Parameter.Mode:= pSystemPrivate.OldMode;
					pSystem.Output.Monitor.Mode:= NO_MODE_ACTIVE;
					pSystem.Output.Status.Busy:= 1;
					pSystemPrivate.HomeFromActive:= 0;
				END_IF
			ELSE
				IF(pSystemPrivate.ActionResponse = SYSACTION_HOME)THEN
					pSystemPrivate.SystemStateStep:= SYSSTATESTEP_STANDBY;
					pSystem.Output.Status.Busy:= 0;
				END_IF
			END_IF
			IF(pSystem.Input.Command.Stop <> 0)THEN
   				pSystemPrivate.SystemStateStep:= SYSSTATESTEP_STOPPING;
				pSystemPrivate.ActionRequest:= SYSACTION_STOP;
				pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND; (* forced command *)
				pSystem.Input.Command.Stop:= 0;
				pSystem.Output.Status.Busy:= 1;
			ELSIF(pSystem.Input.Command.EmergencyStop <> 0)THEN
   				pSystemPrivate.SystemStateStep:= SYSSTATESTEP_STOPPING;
				pSystemPrivate.ActionRequest:= SYSACTION_EMERGENCYSTOP;
				pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND; (* forced command *)
				pSystem.Input.Command.EmergencyStop:= 0;
				pSystem.Output.Status.Busy:= 1;
			END_IF
			
			(* End case SYSSTATESTEP_HOMING *)
		
		SYSSTATESTEP_ACTIVE:
			
			pSystem.Output.State.Active:= 1;
			
			IF(pSystem.Input.Command.Stop <> 0)THEN
				pSystemPrivate.SystemStateStep:= SYSSTATESTEP_STOPPING;
				pSystemPrivate.ActionRequest:= SYSACTION_STOP;
				pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND; (* forced command *)
				pSystem.Input.Command.Stop:= 0;
				pSystem.Output.Monitor.Mode:= NO_MODE_ACTIVE;
				pSystem.Output.Status.Busy:= 1;
				pSystemPrivate.ModeChanging:= 0;
			ELSIF(pSystem.Input.Command.EmergencyStop <> 0)THEN
				pSystemPrivate.SystemStateStep:= SYSSTATESTEP_STOPPING;
				pSystemPrivate.ActionRequest:= SYSACTION_EMERGENCYSTOP;
				pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND; (* forced command *)
				pSystem.Input.Command.EmergencyStop:= 0;
				pSystem.Output.Monitor.Mode:= NO_MODE_ACTIVE;
				pSystem.Output.Status.Busy:= 1;
				pSystemPrivate.ModeChanging:= 0;
			ELSIF(pSystem.Input.Command.ChangeMode <> 0)AND
				(pSystem.Output.Status.Busy = 0)THEN
				pSystemPrivate.ModeChanging:= 1;	
				pSystemPrivate.SystemStateStep:= SYSSTATESTEP_ACTIVE;
				pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_STOP_CNC;
				pSystem.Input.Command.ChangeMode:= 0;
				pSystem.Output.Monitor.Mode:= NO_MODE_ACTIVE;
				pSystem.Output.Status.Busy:= 1;
			ELSIF(pSystem.Input.Command.Home <> 0)AND
				(pSystem.Output.Status.Busy = 0)THEN
				pSystemPrivate.ActionRequest:= SYSACTION_STOP;
				pSystemPrivate.SystemStateStep:= SYSSTATESTEP_HOMING;
				pSystemPrivate.HomeFromActive:= 1;
				pSystemPrivate.OldMode:= pSystem.Output.Monitor.Mode;
				pSystem.Input.Command.Home:= 0;
				pSystem.Output.Status.Busy:= 1;
				pSystem.Output.Monitor.Mode:= NO_MODE_ACTIVE;
			END_IF
			
			(* End case SYSSTATESTEP_ACTIVE *)
		
		SYSSTATESTEP_STOPPING:
			
			pSystem.Output.State.Stopping:= 1;
			
			IF	(pSystemPrivate.ActionResponse = SYSACTION_STOP)OR
   				(pSystemPrivate.ActionResponse = SYSACTION_EMERGENCYSTOP)THEN
				pSystemPrivate.SystemStateStep:= SYSSTATESTEP_STANDBY;
				pSystem.Output.Status.Busy:= 0;
			ELSIF(pSystem.Input.Command.EmergencyStop <> 0)THEN
   				pSystemPrivate.SystemStateStep:= SYSSTATESTEP_STOPPING;
				pSystemPrivate.ActionRequest:= SYSACTION_EMERGENCYSTOP;
				pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND; (* forced command *)
				pSystem.Input.Command.EmergencyStop:= 0;
				pSystem.Output.Status.Busy:= 1;
			END_IF
			
			(* End case SYSSTATESTEP_STOPPING *)
		
		SYSSTATESTEP_ERRORSTOP:
			
			pSystem.Output.State.Errorstop:= 1;
			
			IF(pSystem.Input.Command.Reset <> 0)THEN
   				pSystemPrivate.ActionRequest:= SYSACTION_RESET;
				pSystemPrivate.Resetting:= 1;
				pSystem.Input.Command.Reset:= 0;
				pSystem.Output.Status.Busy:= 1;
			END_IF
			IF(pSystemPrivate.ActionResponse = SYSACTION_RESET)THEN
   				pSystemPrivate.SystemStateStep:= SYSSTATESTEP_STANDBY;
				IF pSystemPrivate.WasEnable <> 0 THEN
					pSystemPrivate.ActionRequest := SYSACTION_ENABLE;
				END_IF;	
				pSystemPrivate.Resetting:= 0;
				pSystem.Output.Status.Busy:= 0;
			END_IF		
			IF	(pSystem.Input.Command.Acknowledge <> 0)AND
   				(pSystemPrivate.Resetting = 1)THEN
				pSystem.Input.Command.Acknowledge:= 0;
				pSystem.Output.Status.Busy:= 0;
				pSystemPrivate.Resetting:= 0;
				pSystemPrivate.ActionRequest:= SYSACTION_NO_ACTION;
				pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
				pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND; (* forced command *)	
			END_IF
			
			(* End case SYSSTATESTEP_ERRORSTOP *)
			
		SYSSTATESTEP_SERVICE:
			
			pSystem.Output.State.Service:= 1;
			
			IF(pSystem.Input.Command.StopService <> 0)THEN
   				pSystemPrivate.WasEnable:= 1;
				pSystemPrivate.SystemStateStep:= SYSSTATESTEP_DISABLED;
				pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND;
				pSystemPrivate.ActionRequest:= SYSACTION_NO_ACTION;
				pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
				pSystem.Input.Command.StopService:= 0;
				pSystem.Output.State.Service:= 0;
				pSystem.Output.Status.Busy:= 0;
				pSystem.Output.Monitor.Mode:= NO_MODE_ACTIVE;
			END_IF
			(* End case SYSSTATESTEP_SERVICE *)
		
	END_CASE
	
	IF(pSystem.Output.Status.Busy = 0)THEN
		IF(pSystem.Input.Command.Acknowledge <> 0)THEN
	   		pSystem.Input.Command.Acknowledge:= 0;
			pSystemPrivate.ActionRequest:= SYSACTION_ACKNOWLEDGE;
			pSystem.Output.Status.Busy:= 1;
		END_IF
	END_IF
	
END_ACTION

ACTION SystemTimeout:
	
	RTInfo_0.enable:= 1;
	
	CASE pSystemPrivate.TimeoutStep OF
 	
		SYSTIMEOUTSTEP_CHECK:
			IF(RTInfo_0.cycle_time > 0)THEN
   				
				pSystemPrivate.TimeoutTimer:= REAL_TO_UDINT(pSystemPrivate.TimeoutTimer + RTInfo_0.cycle_time / 1000.0);
				
				pSystemPrivate.StartupOk:= 1;
				
				FOR j:= 0 TO MAX_AX_MINUS_ONE DO
					TempIndex:= pSystem.Input.Configuration.SystemAxes[j].Index;
					IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
						IF	(pAxes[TempIndex].Output.State.Disabled = 0)AND
							(pAxes[TempIndex].Input.Configuration.Active = 1)THEN
							pSystemPrivate.StartupOk:= 0;				
						END_IF
					END_IF
				END_FOR
				
				FOR j:= 0 TO MAX_AX_MINUS_ONE DO
					TempIndex:= pSystem.Input.Configuration.SystemPowerAxesIndex[j];
					IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
						IF	(pAxes[TempIndex].Output.State.Disabled = 0)AND
							(pAxes[TempIndex].Input.Configuration.Active = 1)THEN
							pSystemPrivate.StartupOk:= 0;				
						END_IF
					END_IF
				END_FOR
				
				FOR j:= 0 TO MAX_CNC_MINUS_ONE DO
					TempIndex:= pSystem.Input.Configuration.SystemCncIndex[j];
					IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
						IF	(pCnc[TempIndex].Output.State.Disabled = 0)AND
							(pCnc[TempIndex].Input.Configuration.Active = 1)THEN
							pSystemPrivate.StartupOk:= 0;
						END_IF
					END_IF
				END_FOR
				
				IF(pSystemPrivate.StartupOk = 1)THEN
					pSystemPrivate.TimeoutStep:= SYSTIMEOUTSTEP_FINISHED;
				ELSIF(pSystemPrivate.TimeoutTimer > SYSTEM_TIMEOUT)THEN
					pSystemPrivate.TimeoutStep:= SYSTIMEOUTSTEP_ERROR;
				END_IF
   			END_IF
			(* End case SYSTIMEOUTSTEP_CHECK: *)
		
		SYSTIMEOUTSTEP_ERROR:
		
			pSystem.Output.Error.Count:= 1;
			pSystem.Output.Error.Text.Line1:= 'Timeout error during startup';
			(* End case SYSTIMEOUTSTEP_ERROR: *)
			
		SYSTIMEOUTSTEP_FINISHED:
		
			(* no action *)
			
			(* End case SYSTIMEOUTSTEP_FINISHED: *)
	
	END_CASE	
	
	RTInfo_0();
	
END_ACTION

ACTION SystemActions:
	
	CASE pSystemPrivate.ActionStep OF
	
		SYSACTIONSTEP_COMMAND:
			IF(pSystemPrivate.ActionRequest = SYSACTION_ENABLE)THEN
				pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
				pSystemPrivate.ActionStep:= SYSACTIONSTEP_ENABLE_PWR_AXES;
			END_IF
			
			IF(pSystemPrivate.ActionRequest = SYSACTION_EMERGENCYSTOP)THEN
				pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
				pSystemPrivate.ActionStep:= SYSACTIONSTEP_ESTOP_CNC;
			END_IF
			
			IF(pSystemPrivate.ActionRequest = SYSACTION_HOME)THEN
				pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
				pSystemPrivate.ActionStep:= SYSACTIONSTEP_HOMING;
				pSystemPrivate.HomeOrderIndex:= 0;
			END_IF
			
			IF(pSystemPrivate.ActionRequest = SYSACTION_CHANGEMODE)THEN
				pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
				pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND;
			END_IF
			
			IF(pSystemPrivate.ActionRequest = SYSACTION_STOP)THEN
				pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
				pSystemPrivate.ActionStep:= SYSACTIONSTEP_STOPPING_CNC;
			END_IF
			
			IF(pSystemPrivate.ActionRequest = SYSACTION_RESET)THEN
				pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
				pSystemPrivate.ActionStep:= SYSACTIONSTEP_RESET;
			END_IF
			
			IF(pSystemPrivate.ActionRequest = SYSACTION_ACKNOWLEDGE)THEN
				pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
				pSystemPrivate.ActionStep:= SYSACTIONSTEP_ACKNOWLEDGE;
			END_IF
			
			IF(pSystemPrivate.ActionRequest = SYSACTION_INIT)THEN
				pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
				pSystemPrivate.ActionStep:= SYSACTIONSTEP_INIT;
			END_IF
			
			IF(pSystemPrivate.ActionRequest = SYSACTION_START_SIMULATION)THEN
				pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
				pSystemPrivate.ActionStep:= SYSACTIONSTEP_START_SIMULATION;
			END_IF
			
			IF(pSystemPrivate.ActionRequest = SYSACTION_STOP_SIMULATION)THEN
				pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
				pSystemPrivate.ActionStep:= SYSACTIONSTEP_STOP_SIMULATION;
			END_IF
			
			(* End case SYSACTIONSTEP_COMMAND *)
			
		SYSACTIONSTEP_ENABLE_PWR_AXES:
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemPowerAxesIndex[j];
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF(pAxes[TempIndex].Input.Configuration.Active = 1)THEN
						pAxes[TempIndex].Input.Command.Enable:= pSystem.Input.Parameter.CommandID;				
					END_IF
				END_IF
			END_FOR
			pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_ENABLE_PWR_AXES;
			(* End case SYSACTIONSTEP_ENABLE_PWR_AXES *)
			
		SYSACTIONSTEP_W_ENABLE_PWR_AXES:
			pSystemPrivate.ActionStep:= SYSACTIONSTEP_ENABLE_AXES;
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemPowerAxesIndex[j];
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pAxes[TempIndex].Input.Configuration.Active = 1)AND
	 					(pAxes[TempIndex].Output.State.Standstill = 0)THEN
						pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_ENABLE_PWR_AXES;				
					END_IF
				END_IF
			END_FOR
			(* End case SYSACTIONSTEP_W_ENABLE_PWR_AXES *)
			
		SYSACTIONSTEP_ENABLE_AXES:
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemAxes[j].Index;
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF((pAxes[TempIndex].Input.Configuration.Active = 1) AND NOT(pSystem.Input.Configuration.SystemAxes[j].IsEncoder))THEN
						pAxes[TempIndex].Input.Command.Enable:= pSystem.Input.Parameter.CommandID;				
					END_IF
				END_IF
			END_FOR
			pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_ENABLE_AXES;
			(* End case SYSACTIONSTEP_ENABLE_AXES *)
			
		SYSACTIONSTEP_W_ENABLE_AXES:
			pSystemPrivate.ActionStep:= SYSACTIONSTEP_ENABLE_CNC;
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemAxes[j].Index;
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	((pAxes[TempIndex].Input.Configuration.Active = 1) AND
	 					(pAxes[TempIndex].Output.State.Standstill = 0) AND 
						(pSystem.Input.Configuration.SystemAxes[j].IsEncoder = 0))THEN
						pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_ENABLE_AXES;				
					END_IF
				END_IF
			END_FOR
			(* End case SYSACTIONSTEP_W_ENABLE_AXES *)
			
		SYSACTIONSTEP_ENABLE_CNC:
			FOR j:= 0 TO MAX_CNC_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemCncIndex[j];
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF(pCnc[TempIndex].Input.Configuration.Active = 1)THEN
						pCnc[TempIndex].Input.Command.Enable:= pSystem.Input.Parameter.CommandID;				
					END_IF
				END_IF
			END_FOR
			pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_ENABLE_CNC;
			(* End case SYSACTIONSTEP_ENABLE_CNC *)
			
		SYSACTIONSTEP_W_ENABLE_CNC:
			pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND;
			pSystemPrivate.ActionRequest:= SYSACTION_NO_ACTION;
			pSystemPrivate.ActionResponse:= SYSACTION_ENABLE;
			pSystem.Output.Status.Busy:= 0;
			FOR j:= 0 TO MAX_CNC_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemCncIndex[j];
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pCnc[TempIndex].Input.Configuration.Active = 1)AND
	 					(pCnc[TempIndex].Output.State.Standby = 0)THEN
						pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_ENABLE_CNC;
						pSystemPrivate.ActionRequest:= SYSACTION_ENABLE;
						pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
						pSystem.Output.Status.Busy:= 1;
					END_IF
				END_IF
			END_FOR
			(* End case SYSACTIONSTEP_W_ENABLE_CNC *)
		
		
		 SYSACTIONSTEP_ESTOP_CNC:
			FOR j:= 0 TO MAX_CNC_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemCncIndex[j];
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pCnc[TempIndex].Input.Configuration.Active = 1)THEN
						pCnc[TempIndex].Input.Command.EmergencyStop:= pSystem.Input.Parameter.CommandID;
					END_IF
				END_IF
			END_FOR
			pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_ESTOP_CNC;
		 	(* End Case SYSACTIONSTEP_ESTOP_CNC *)

		 SYSACTIONSTEP_W_ESTOP_CNC:
		 	pSystemPrivate.ActionStep:= SYSACTIONSTEP_ESTOP_AXES;
			FOR j:= 0 TO MAX_CNC_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemCncIndex[j];
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pCnc[TempIndex].Input.Configuration.Active = 1)AND
  						((pCnc[TempIndex].Output.State.Moving = 1)OR
   						(pCnc[TempIndex].Output.State.Stopping = 1))THEN
						pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_ESTOP_CNC;
					END_IF
				END_IF
			END_FOR
		 	(* End Case SYSACTIONSTEP_W_ESTOP_CNC *)

		 SYSACTIONSTEP_ESTOP_AXES:
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemAxes[j].Index;
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	((pAxes[TempIndex].Input.Configuration.Active = 1) AND NOT(pSystem.Input.Configuration.SystemAxes[j].IsEncoder))THEN
						pAxes[TempIndex].Input.Command.EmergencyStop:= pSystem.Input.Parameter.CommandID;				
					END_IF
				END_IF
			END_FOR
			pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_ESTOP_AXES;
		 	(* End Case SYSACTIONSTEP_ESTOP_AXES *)

		 SYSACTIONSTEP_W_ESTOP_AXES:
		 	IF(pSystemPrivate.Disabeling = 1)THEN
					pSystemPrivate.ActionStep:= SYSACTIONSTEP_DISABLE_AXES_CNC;
			ELSE
				pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND;
				pSystemPrivate.ActionRequest:= SYSACTION_NO_ACTION;
				pSystemPrivate.ActionResponse:= SYSACTION_EMERGENCYSTOP;
				pSystem.Output.Status.Busy:= 0;
			END_IF
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemAxes[j].Index;
				IF(pSystem.Input.Configuration.SystemAxes[j].Index <> NO_PART_OF_SYSTEM)THEN
					IF	(pAxes[TempIndex].Input.Configuration.Active = 1)AND
  						((pAxes[TempIndex].Output.State.Homing = 1)OR
						(pAxes[TempIndex].Output.State.DiscreteMotion = 1)OR
						(pAxes[TempIndex].Output.State.ContinuousMotion = 1)OR
						(pAxes[TempIndex].Output.State.SyncronizedMotion = 1)OR
   						(pAxes[TempIndex].Output.State.Stopping = 1))THEN
						pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_ESTOP_AXES;
						pSystem.Output.Status.Busy:= 1;			
					END_IF
				END_IF
			END_FOR
		 	(* End Case SYSACTIONSTEP_W_ESTOP_AXES *)

		 SYSACTIONSTEP_DISABLE_AXES_CNC:
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemAxes[j].Index;
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pAxes[TempIndex].Input.Configuration.Active = 1)THEN
						pAxes[TempIndex].Input.Command.Enable:= 0;				
					END_IF
				END_IF
			END_FOR
			FOR j:= 0 TO MAX_CNC_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemCncIndex[j];
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pCnc[TempIndex].Input.Configuration.Active = 1)THEN
						pCnc[TempIndex].Input.Command.Enable:= 0;
					END_IF
				END_IF
			END_FOR
			pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_DISABLE_AXES_CNC;
		 	(* End Case SYSACTIONSTEP_DISABLE_AXES_CNC *)

		 SYSACTIONSTEP_W_DISABLE_AXES_CNC:
		 	pSystemPrivate.ActionStep:= SYSACTIONSTEP_DISABLE_PWR_AXES;
			FOR j:= 0 TO MAX_CNC_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemCncIndex[j];
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pCnc[TempIndex].Input.Configuration.Active = 1)AND
  						(pCnc[TempIndex].Output.State.Disabled <> 1)THEN
						pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_DISABLE_AXES_CNC;
					END_IF
				END_IF
			END_FOR
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemAxes[j].Index;
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pAxes[TempIndex].Input.Configuration.Active = 1)AND
  						((pAxes[TempIndex].Output.State.Disabled <> 1) AND (pAxes[TempIndex].Output.State.Errorstop <> 1)  )THEN
						pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_DISABLE_AXES_CNC;			
					END_IF
				END_IF
			END_FOR
		 	(* End Case SYSACTIONSTEP_W_DISABLE_AXES_CNC *)

		 SYSACTIONSTEP_DISABLE_PWR_AXES:
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemPowerAxesIndex[j];
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF(pAxes[TempIndex].Input.Configuration.Active = 1)THEN
						pAxes[TempIndex].Input.Command.Enable:= 0;				
					END_IF
				END_IF
			END_FOR
		 	pSystemPrivate.Disabeling:= 0;
			pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND;
			pSystemPrivate.ActionRequest:= SYSACTION_NO_ACTION;
			pSystemPrivate.ActionResponse:= SYSACTION_EMERGENCYSTOP;
			pSystem.Output.Status.Busy:= 0;
		 	(* End Case SYSACTIONSTEP_DISABLE_PWR_AXES *)

		 SYSACTIONSTEP_HOMING:
		 	pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND;
			pSystemPrivate.ActionRequest:= SYSACTION_NO_ACTION;
			pSystemPrivate.ActionResponse:= SYSACTION_HOME;
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemAxes[j].Index;
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pAxes[TempIndex].Input.Configuration.Active = 1) AND NOT(pSystem.Input.Configuration.SystemAxes[j].IsEncoder) AND
	 					(pSystem.Input.Configuration.SystemAxes[j].HomeOrder = pSystemPrivate.HomeOrderIndex)THEN
						pAxes[TempIndex].Input.Command.Home:= pSystem.Input.Parameter.CommandID;
						pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_HOMING;
						pSystemPrivate.ActionRequest:= SYSACTION_HOME;
						pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
					END_IF
				END_IF
			END_FOR
		 	(* End Case SYSACTIONSTEP_DISABLE_PWR_AXES *)
			
		 SYSACTIONSTEP_W_HOMING:
		 	pSystemPrivate.ActionStep:= SYSACTIONSTEP_HOMING;
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemAxes[j].Index;
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pAxes[TempIndex].Input.Configuration.Active = 1)AND
	 					(pSystem.Input.Configuration.SystemAxes[j].HomeOrder = pSystemPrivate.HomeOrderIndex)AND
	  					((pAxes[TempIndex].Input.Command.Home <> 0)OR
						(pAxes[TempIndex].Output.State.Homing = 1)) THEN
						pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_HOMING;
					END_IF
				END_IF
			END_FOR
			IF(pSystemPrivate.ActionStep = SYSACTIONSTEP_HOMING)THEN
   				pSystemPrivate.HomeOrderIndex:= pSystemPrivate.HomeOrderIndex+1;
			END_IF			
		 	(* End Case SYSACTIONSTEP_DISABLE_PWR_AXES *)

		 SYSACTIONSTEP_STOPPING_CNC:
			FOR j:= 0 TO MAX_CNC_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemCncIndex[j];
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pCnc[TempIndex].Input.Configuration.Active = 1)THEN
						pCnc[TempIndex].Input.Command.Stop:= pSystem.Input.Parameter.CommandID;
					END_IF
				END_IF
			END_FOR
			pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_STOPPING_CNC;
		 	(* End Case SYSACTIONSTEP_STOPPING_CNC *)

		 SYSACTIONSTEP_W_STOPPING_CNC:
		 	pSystemPrivate.ActionStep:= SYSACTIONSTEP_STOPPING_AXES;
			FOR j:= 0 TO MAX_CNC_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemCncIndex[j];
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pCnc[TempIndex].Input.Configuration.Active = 1)AND
  						((pCnc[TempIndex].Output.State.Moving = 1)OR
   						(pCnc[TempIndex].Output.State.Stopping = 1))THEN
						pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_STOPPING_CNC;
					END_IF
				END_IF
			END_FOR
		 	(* End Case SYSACTIONSTEP_W_STOPPING_CNC *)

		 SYSACTIONSTEP_STOPPING_AXES:
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemAxes[j].Index;
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	((pAxes[TempIndex].Input.Configuration.Active = 1) AND NOT(pSystem.Input.Configuration.SystemAxes[j].IsEncoder))THEN
						pAxes[TempIndex].Input.Command.Stop:= pSystem.Input.Parameter.CommandID;				
					END_IF
				END_IF
			END_FOR
			pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_STOPPING_AXES;
		 	(* End Case SYSACTIONSTEP_STOPPING_AXES *)

		 SYSACTIONSTEP_W_STOPPING_AXES:
			pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND;
			pSystemPrivate.ActionRequest:= SYSACTION_NO_ACTION;
			pSystemPrivate.ActionResponse:= SYSACTION_STOP;
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemAxes[j].Index;
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pAxes[TempIndex].Input.Configuration.Active = 1)AND
  						((pAxes[TempIndex].Output.State.Homing = 1)OR
						(pAxes[TempIndex].Output.State.DiscreteMotion = 1)OR
						(pAxes[TempIndex].Output.State.ContinuousMotion = 1)OR
						(pAxes[TempIndex].Output.State.SyncronizedMotion = 1)OR
   						(pAxes[TempIndex].Output.State.Stopping = 1))THEN
						pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_STOPPING_AXES;		
					END_IF
				END_IF
			END_FOR
		 	(* End Case SYSACTIONSTEP_W_STOPPING_AXES *)
			
		SYSACTIONSTEP_RESET:
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemPowerAxesIndex[j];
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pAxes[TempIndex].Input.Configuration.Active = 1)AND
	 					(pAxes[TempIndex].Output.Error.Count <> 0)THEN			//_liug_130314Replace_(pAxes[TempIndex].Output.State.Errorstop = 1)
						pAxes[TempIndex].Input.Command.Reset:= pSystem.Input.Parameter.CommandID;	
					END_IF
				END_IF
			END_FOR
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemAxes[j].Index;
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pAxes[TempIndex].Input.Configuration.Active = 1)AND
  						((pAxes[TempIndex].Output.State.Errorstop <> 0) OR (pAxes[TempIndex].Output.Error.Count <> 0))THEN		
						pAxes[TempIndex].Input.Command.Reset:= pSystem.Input.Parameter.CommandID;
					END_IF
				END_IF
			END_FOR
			FOR j:= 0 TO MAX_CNC_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemCncIndex[j];
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pCnc[TempIndex].Input.Configuration.Active = 1)AND
  						((pCnc[TempIndex].Output.State.Errorstop  <> 0) OR (pCnc[TempIndex].Output.Error.Count <> 0))THEN			
						pCnc[TempIndex].Input.Command.Reset:= pSystem.Input.Parameter.CommandID;
					END_IF
				END_IF
			END_FOR
			pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_RESET;
			(* End case SYSACTIONSTEP_RESET *)
			
		SYSACTIONSTEP_W_RESET:
			pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND;
			pSystemPrivate.ActionRequest:= SYSACTION_NO_ACTION;
			pSystemPrivate.ActionResponse:= SYSACTION_RESET;
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemPowerAxesIndex[j];
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pAxes[TempIndex].Input.Configuration.Active = 1)AND
	 					((pAxes[TempIndex].Output.State.Errorstop = 1)OR
	  					(pAxes[TempIndex].Output.Status.Busy = 1))THEN
						pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_RESET;
						pSystemPrivate.ActionRequest:= SYSACTION_RESET;
						pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
					END_IF
				END_IF
			END_FOR
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemAxes[j].Index;
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pAxes[TempIndex].Input.Configuration.Active = 1)AND
  						((pAxes[TempIndex].Output.State.Errorstop = 1)OR
	  					(pAxes[TempIndex].Output.Status.Busy = 1))THEN
						pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_RESET;
						pSystemPrivate.ActionRequest:= SYSACTION_RESET;
						pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
					END_IF
				END_IF
			END_FOR
			FOR j:= 0 TO MAX_CNC_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemCncIndex[j];
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pCnc[TempIndex].Input.Configuration.Active = 1)AND
  						((pCnc[TempIndex].Output.State.Errorstop = 1)OR
	  					(pCnc[TempIndex].Output.Status.Busy = 1))THEN
						pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_RESET;
						pSystemPrivate.ActionRequest:= SYSACTION_RESET;
						pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
					END_IF
				END_IF
			END_FOR
			(* End case SYSACTIONSTEP_W_RESET *)
			
		SYSACTIONSTEP_ACKNOWLEDGE:
		 
		 	pSystem.Output.Status.CommandError:= 0;
			
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemPowerAxesIndex[j];
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pAxes[TempIndex].Input.Configuration.Active = 1)THEN
						pAxes[TempIndex].Input.Command.ErrorAcknowledge:= pSystem.Input.Parameter.CommandID;	
					END_IF
				END_IF
			END_FOR
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemAxes[j].Index;
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pAxes[TempIndex].Input.Configuration.Active = 1)THEN
						pAxes[TempIndex].Input.Command.ErrorAcknowledge:= pSystem.Input.Parameter.CommandID;
					END_IF
				END_IF
			END_FOR
			FOR j:= 0 TO MAX_CNC_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemCncIndex[j];
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pCnc[TempIndex].Input.Configuration.Active = 1)THEN
						pCnc[TempIndex].Input.Command.Acknowledge:= pSystem.Input.Parameter.CommandID;
					END_IF
				END_IF
			END_FOR
			pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND;
			pSystemPrivate.ActionRequest:= SYSACTION_NO_ACTION;
			pSystemPrivate.ActionResponse:= SYSACTION_ACKNOWLEDGE;
			pSystem.Output.Status.Busy:= 0;
		 	(* End Case SYSACTIONSTEP_ACKNOWLEDGE *)

		SYSACTIONSTEP_INIT:
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemPowerAxesIndex[j];
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pAxes[TempIndex].Input.Configuration.Active = 1)THEN
						pAxes[TempIndex].Input.Command.InitAxisPar:= pSystem.Input.Parameter.CommandID;	
					END_IF
				END_IF
			END_FOR
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemAxes[j].Index;
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pAxes[TempIndex].Input.Configuration.Active = 1)THEN
						pAxes[TempIndex].Input.Command.InitAxisPar:= pSystem.Input.Parameter.CommandID;
					END_IF
				END_IF
			END_FOR
			FOR j:= 0 TO MAX_CNC_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemCncIndex[j];
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pCnc[TempIndex].Input.Configuration.Active = 1)THEN
						pCnc[TempIndex].Input.Command.InitCncPar:= pSystem.Input.Parameter.CommandID;
					END_IF
				END_IF
			END_FOR
			pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_INIT;
			(* End case SYSACTIONSTEP_INIT *)
			
		SYSACTIONSTEP_W_INIT:
			pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND;
			pSystemPrivate.ActionRequest:= SYSACTION_NO_ACTION;
			pSystemPrivate.ActionResponse:= SYSACTION_INIT;
			pSystem.Output.Status.Busy:= 0;
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemPowerAxesIndex[j];
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pAxes[TempIndex].Input.Configuration.Active = 1)AND
	 					(pAxes[TempIndex].Output.Status.ControllerReady <> 1)THEN
						pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_INIT;
						pSystemPrivate.ActionRequest:= SYSACTION_INIT;
						pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
						pSystem.Output.Status.Busy:= 1;
					END_IF
				END_IF
			END_FOR
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemAxes[j].Index;
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pAxes[TempIndex].Input.Configuration.Active = 1)AND
	 					(pAxes[TempIndex].Output.Status.ControllerReady <> 1)THEN
						pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_INIT;
						pSystemPrivate.ActionRequest:= SYSACTION_INIT;
						pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
						pSystem.Output.Status.Busy:= 1;
					END_IF
				END_IF
			END_FOR
			FOR j:= 0 TO MAX_CNC_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemCncIndex[j];
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pCnc[TempIndex].Input.Configuration.Active = 1)AND
	 					(pCnc[TempIndex].Output.Status.Busy = 1)AND
	  					(pCnc[TempIndex].Output.Status.Ready <> 0)THEN
						pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_INIT;
						pSystemPrivate.ActionRequest:= SYSACTION_INIT;
						pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
						pSystem.Output.Status.Busy:= 1;
					END_IF
				END_IF
			END_FOR
			(* End case SYSACTIONSTEP_W_INIT *)
			
		SYSACTIONSTEP_START_SIMULATION:
			pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_START_SIMULATION;
			IF(pSystem.Input.Parameter.SimulationMode = SIMULATE_CNC)THEN
				FOR j:= 0 TO MAX_CNC_MINUS_ONE DO
					TempIndex:= pSystem.Input.Configuration.SystemCncIndex[j];
					IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
						IF(pCnc[TempIndex].Input.Configuration.Active = 1)THEN
							pCnc[TempIndex].Input.Command.CncSimulationOn:= pSystem.Input.Parameter.CommandID;
						END_IF
					END_IF
				END_FOR
   			ELSIF(pSystem.Input.Parameter.SimulationMode = SIMULATE_MOTOR)THEN
				FOR j:= 0 TO MAX_AX_MINUS_ONE DO
					TempIndex:= pSystem.Input.Configuration.SystemAxes[j].Index;
					IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
						IF(pAxes[TempIndex].Input.Configuration.Active = 1)THEN
							pAxes[TempIndex].Input.Parameter.SimulationCommand:= mcMOTOR;
							pAxes[TempIndex].Input.Command.Simulation:= pSystem.Input.Parameter.CommandID;
						END_IF
					END_IF
				END_FOR
   			ELSE
				pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND;
				pSystemPrivate.ActionRequest:= SYSACTION_NO_ACTION;
			END_IF
			(* End case SYSACTIONSTEP_START_SIMULATION *)
			
		SYSACTIONSTEP_W_START_SIMULATION:
			pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND;
			pSystemPrivate.ActionRequest:= SYSACTION_NO_ACTION;
			pSystemPrivate.ActionResponse:= SYSACTION_START_SIMULATION;
			pSystem.Output.Status.Busy:= 0;
			IF(pSystem.Input.Parameter.SimulationMode = SIMULATE_CNC)THEN
				FOR j:= 0 TO MAX_CNC_MINUS_ONE DO
					TempIndex:= pSystem.Input.Configuration.SystemCncIndex[j];
					IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
						IF	(pCnc[TempIndex].Input.Configuration.Active = 1)AND
	  						(pCnc[TempIndex].Output.Status.Simulation <> 1)THEN
							pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_START_SIMULATION;
							pSystemPrivate.ActionRequest:= SYSACTION_START_SIMULATION;
							pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
							pSystem.Output.Status.Busy:= 1;
						END_IF
					END_IF
				END_FOR
   			ELSIF(pSystem.Input.Parameter.SimulationMode = SIMULATE_MOTOR)THEN
				FOR j:= 0 TO MAX_AX_MINUS_ONE DO
					TempIndex:= pSystem.Input.Configuration.SystemAxes[j].Index;
					IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
						IF	(pAxes[TempIndex].Input.Configuration.Active = 1)AND
	  						(pAxes[TempIndex].Output.Status.Simulation <> 1)THEN
							pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_START_SIMULATION;
							pSystemPrivate.ActionRequest:= SYSACTION_START_SIMULATION;
							pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
							pSystem.Output.Status.Busy:= 1;
						END_IF
					END_IF
				END_FOR
			END_IF
			(* End case SYSACTIONSTEP_W_START_SIMULATION *)
			
		SYSACTIONSTEP_STOP_SIMULATION:
			pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_STOP_SIMULATION;
			FOR j:= 0 TO MAX_CNC_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemCncIndex[j];
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pCnc[TempIndex].Input.Configuration.Active = 1)AND
	 					(pCnc[TempIndex].Output.Status.Simulation = 1)THEN
						pCnc[TempIndex].Input.Command.CncSimulationOff:= pSystem.Input.Parameter.CommandID;
					END_IF
				END_IF
			END_FOR
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemAxes[j].Index;
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pAxes[TempIndex].Input.Configuration.Active = 1)AND
	 					(pAxes[TempIndex].Output.Status.Simulation = 1)THEN
						pAxes[TempIndex].Input.Parameter.SimulationCommand:= mcSIMULATION_OFF;
						pAxes[TempIndex].Input.Command.Simulation:= pSystem.Input.Parameter.CommandID;
					END_IF
				END_IF
			END_FOR
			(* End case SYSACTIONSTEP_STOP_SIMULATION *)
			
		SYSACTIONSTEP_W_STOP_SIMULATION:
			pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND;
			pSystemPrivate.ActionRequest:= SYSACTION_NO_ACTION;
			pSystemPrivate.ActionResponse:= SYSACTION_STOP_SIMULATION;
			pSystem.Output.Status.Busy:= 0;
			FOR j:= 0 TO MAX_CNC_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemCncIndex[j];
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pCnc[TempIndex].Input.Configuration.Active = 1)AND
  						(pCnc[TempIndex].Output.Status.Simulation <> 0)THEN
						pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_STOP_SIMULATION;
						pSystemPrivate.ActionRequest:= SYSACTION_STOP_SIMULATION;
						pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
						pSystem.Output.Status.Busy:= 1;
					END_IF
				END_IF
			END_FOR
			FOR j:= 0 TO MAX_AX_MINUS_ONE DO
				TempIndex:= pSystem.Input.Configuration.SystemAxes[j].Index;
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
					IF	(pAxes[TempIndex].Input.Configuration.Active = 1)AND
  						(pAxes[TempIndex].Output.Status.Simulation <> 0)THEN
						pSystemPrivate.ActionStep:= SYSACTIONSTEP_W_STOP_SIMULATION;
						pSystemPrivate.ActionRequest:= SYSACTION_STOP_SIMULATION;
						pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
						pSystem.Output.Status.Busy:= 1;
					END_IF
				END_IF
			END_FOR
			(* End case SYSACTIONSTEP_W_STOP_SIMULATION *)



	(* End CASE pSystemPrivate.ActionStep OF *)
	END_CASE	
	
END_ACTION

ACTION SystemResetCommands:
	
	(*pSystem.Input.Command.Enable:= 0;*)
	(*pSystem.Input.Command.Home:= 0;*)
	pSystem.Input.Command.Stop:= 0;
	pSystem.Input.Command.EmergencyStop:= 0;
	pSystem.Input.Command.Init:= 0;
	(*pSystem.Input.Command.ChangeMode:= 0;*)
	pSystem.Input.Command.Acknowledge:= 0;
	pSystem.Input.Command.Reset:= 0;
	pSystem.Input.Command.StartService:= 0;
	pSystem.Input.Command.StopService:= 0;
	pSystem.Input.Command.StartSimulation:= 0;
	pSystem.Input.Command.StopSimulation:= 0;
	
END_ACTION

ACTION SystemStatus:
	
	(* Error and Mode independed Status *)
	
	pSystem.Output.Error.Count:= 0;
	pSystem.Output.Status.Ready:= 1;
	pSystem.Output.Status.NetworkInit:= 1;
	pSystem.Output.Status.HomingOk:= 1;
	
	pSystem.Output.Status.ControllerStatus:= 1;
	pSystemPrivate.TempControllerOnStatus:= 0;
	
	brsmemset(ADR(pSystem.Output.Error.Text), 0 ,SIZEOF(pSystem.Output.Error.Text));
	
	AxesErrorIndex:= '[';
	
	FOR j:= 0 TO MAX_AX_MINUS_ONE DO
		TempIndex:= pSystem.Input.Configuration.SystemAxes[j].Index;
		IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
			IF(pAxes[TempIndex].Input.Configuration.Active = 1)THEN
				
				IF(pAxes[TempIndex].Output.Error.Count > 0)THEN
					pSystem.Output.Error.Count:= pSystem.Output.Error.Count + pAxes[TempIndex].Output.Error.Count;
					
					IF(brsstrlen(ADR(AxesErrorIndex)) < SIZEOF(AxesErrorIndex) - 4 )THEN
						IF(brsstrlen(ADR(AxesErrorIndex)) > 1)THEN
							brsstrcat(ADR(AxesErrorIndex),ADR(','));
						END_IF	
						brsitoa(USINT_TO_DINT(TempIndex),ADR(TempIndexString));
						brsstrcat(ADR(AxesErrorIndex), ADR(TempIndexString));
					END_IF
				END_IF			
				
				IF(pAxes[TempIndex].Output.Status.NetworkInit = 0)THEN
					pSystem.Output.Status.NetworkInit:= 0;
				END_IF	
				
				IF((pAxes[TempIndex].Output.Status.ControllerReady = 0) AND (pSystem.Input.Configuration.SystemAxes[j].IsEncoder = 0))THEN
					pSystem.Output.Status.Ready:= 0;
				END_IF
				
				IF((pAxes[TempIndex].Output.Status.HomingOk = 0) AND (pSystem.Input.Configuration.SystemAxes[j].IsEncoder = 0))THEN
					pSystem.Output.Status.HomingOk:= 0;
				END_IF
				
				IF((pAxes[TempIndex].Output.Status.ControllerStatus = 0) AND (pSystem.Input.Configuration.SystemAxes[j].IsEncoder = 0))THEN
					pSystem.Output.Status.ControllerStatus:= 0;
				ELSE
					pSystemPrivate.TempControllerOnStatus:= 1;
				END_IF
				
			END_IF
		END_IF
	END_FOR
	
	FOR j:= 0 TO MAX_AX_MINUS_ONE DO
		TempIndex:= pSystem.Input.Configuration.SystemPowerAxesIndex[j];
		IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
			IF(pAxes[TempIndex].Input.Configuration.Active = 1)THEN

				IF(pAxes[TempIndex].Output.Error.Count > 0)THEN
					pSystem.Output.Error.Count:= pSystem.Output.Error.Count + pAxes[TempIndex].Output.Error.Count;
					
					IF(brsstrlen(ADR(AxesErrorIndex)) < SIZEOF(AxesErrorIndex) - 4 )THEN
						IF(brsstrlen(ADR(AxesErrorIndex)) > 1)THEN
							brsstrcat(ADR(AxesErrorIndex),ADR(','));
						END_IF	
						brsitoa(USINT_TO_DINT(TempIndex),ADR(TempIndexString));
						brsstrcat(ADR(AxesErrorIndex), ADR(TempIndexString));
					END_IF
					
				END_IF				

				IF(pAxes[TempIndex].Output.Status.ControllerStatus = 0)THEN
					pSystem.Output.Status.ControllerStatus:= 0;
				ELSE
					pSystemPrivate.TempControllerOnStatus:= 1;
				END_IF
				
			END_IF
		END_IF
	END_FOR
	
	brsstrcat(ADR(AxesErrorIndex),ADR(']'));
	
	IF(brsstrlen(ADR(AxesErrorIndex)) > 2)THEN
		pSystem.Output.Error.Text.Line2:= 'Axes Error Index: ';
		brsstrcat(ADR(pSystem.Output.Error.Text.Line2),ADR(AxesErrorIndex));
	END_IF
	
	CncErrorIndex:= '[';
	
	FOR j:= 0 TO MAX_CNC_MINUS_ONE DO
		TempIndex:= pSystem.Input.Configuration.SystemCncIndex[j];
		IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
			IF(pCnc[TempIndex].Input.Configuration.Active = 1)THEN

				IF(pCnc[TempIndex].Output.Error.Count > 0)THEN
					pSystem.Output.Error.Count:= pSystem.Output.Error.Count + pCnc[TempIndex].Output.Error.Count;
					
					IF(brsstrlen(ADR(CncErrorIndex)) < SIZEOF(CncErrorIndex) - 4 )THEN
						IF(brsstrlen(ADR(CncErrorIndex)) > 1)THEN
							brsstrcat(ADR(CncErrorIndex),ADR(','));
						END_IF	
						brsitoa(USINT_TO_DINT(TempIndex),ADR(TempIndexString));
						brsstrcat(ADR(CncErrorIndex), ADR(TempIndexString));
					END_IF
					
				END_IF				

				IF(pCnc[TempIndex].Output.Status.Ready = 0)THEN
					pSystem.Output.Status.Ready:= 0;
				END_IF
				
			END_IF
		END_IF
	END_FOR
	
	brsstrcat(ADR(CncErrorIndex),ADR(']'));
	
	IF(brsstrlen(ADR(CncErrorIndex)) > 2)THEN
		pSystem.Output.Error.Text.Line3:= 'Cnc Error Index: ';
		brsstrcat(ADR(pSystem.Output.Error.Text.Line3),ADR(CncErrorIndex));
	END_IF
	
	IF(pSystem.Output.Error.Count > 0)THEN
 		pSystem.Output.Error.Text.Line1:= 'System Object Error';
	END_IF

 	IF	(pSystemPrivate.TempControllerOnStatus = 1)AND
 		(pSystem.Output.Status.ControllerStatus = 0)THEN
 		pSystem.Output.Status.ControllerStatus:= 2;
	ELSIF 	(pSystemPrivate.TempControllerOnStatus = 1)AND
 			(pSystem.Output.Status.ControllerStatus = 1)THEN
 		pSystem.Output.Status.ControllerStatus:= 1;
 	ELSE
	 	pSystem.Output.Status.ControllerStatus:= 0;
	END_IF
	 
	pSystem.Output.Error.HmiCount:= pSystem.Output.Error.Count;
	
	(* End Error and Mode independed Monitoring*)
	
	IF(pSystemPrivate.SystemStateStep = SYSSTATESTEP_BOOTING)THEN
		pSystem.Output.Status.Booting:= 1;
	ELSE
		pSystem.Output.Status.Booting:= 0;
	END_IF
	
	
END_ACTION
	
	
ACTION SystemMonitor:
	
	(* Axes and Cnc Monitor *)
	brsmemset(ADR(pSystem.Output.Monitor.Axes), 0, SIZEOF(pSystem.Output.Monitor.Axes));
	brsmemset(ADR(pSystem.Output.Monitor.Cnc), 0, SIZEOF(pSystem.Output.Monitor.Cnc));
	brsmemset(ADR(pSystem.Output.Monitor.SpindleMoving), 0, SIZEOF(pSystem.Output.Monitor.SpindleMoving));
	
	IF(pSystem.Output.Monitor.Mode <> NO_MODE_ACTIVE)AND(pSystem.Output.Monitor.Mode <= MAX_MODE_MINUS_ONE)THEN
	
		TempMode:= pSystem.Output.Monitor.Mode;
		pSystem.Output.Monitor.ModeLabel:= pSystem.Input.Configuration.Mode[TempMode].Label;
	
		(* Cnc Monitoring *)
		n:= 0;
		FOR j:= 0 TO MAX_CNC_MINUS_ONE DO
			TempMode:= pSystem.Output.Monitor.Mode;
			TempIndex:= pSystem.Input.Configuration.Mode[TempMode].Cnc[j].Index;
			pSystem.Output.Monitor.Cnc[j].Index:= NO_PART_OF_SYSTEM;
			IF	(TempIndex <> NO_PART_OF_SYSTEM)THEN
				IF	(n <= MAX_CNC_MINUS_ONE)AND
   					(pSystem.Input.Configuration.Mode[TempMode].Cnc[j].Visible = 1)AND
	 				(pCnc[TempIndex].Input.Configuration.Active = 1)THEN
					
					pSystem.Output.Monitor.Cnc[n].Active:= 1;
					pSystem.Output.Monitor.Cnc[n].Index:= TempIndex;
					brsstrcpy(ADR(pSystem.Output.Monitor.Cnc[n].Label),ADR(pCnc[TempIndex].Input.Configuration.Label));
					pSystem.Output.Monitor.Cnc[n].CncDatAddress:= pCnc[TempIndex].Output.Status.CncDatAddress;
					
					n:= n + 1;		
					
				END_IF
			END_IF
		END_FOR
	
		(* Axes Monitoring *)
		n:= 0;
		pSystem.Output.Monitor.SpindleMoving:= 0;
		
		FOR j:= 0 TO MAX_AX_MINUS_ONE DO
			TempMode:= pSystem.Output.Monitor.Mode;
			TempIndex:= pSystem.Input.Configuration.Mode[TempMode].Axes[j].Index;
			pSystem.Output.Monitor.Axes[j].Index:= NO_PART_OF_SYSTEM;
			IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
				IF	(n <= MAX_AX_MINUS_ONE)AND
					(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Visible = 1)AND
					(pAxes[TempIndex].Input.Configuration.Active = 1)THEN
					
					pSystem.Output.Monitor.Axes[n].Index:= pSystem.Input.Configuration.Mode[TempMode].Axes[j].Index;
					brsstrcpy(ADR(pSystem.Output.Monitor.Axes[n].Label),ADR(pAxes[TempIndex].Input.Configuration.Label));
					pSystem.Output.Monitor.Axes[n].AxesDatAddress:= pAxes[TempIndex].Output.Status.AxesDatAddress;
					pSystem.Output.Monitor.Axes[n].Type:= pSystem.Input.Configuration.Mode[TempMode].Axes[j].Type;
					FOR k:= 0 TO MAX_AX_MINUS_ONE DO
						IF(TempIndex = pSystem.Input.Configuration.SystemAxes[k].Index)THEN
	  						pSystem.Output.Monitor.Axes[n].IsSpindle:= pSystem.Input.Configuration.SystemAxes[k].IsSpindle;
							EXIT;
						END_IF						
					END_FOR
					pSystem.Output.Monitor.Axes[n].ActualPostion:= pAxes[TempIndex].Output.Monitor.Position;
					brsstrcpy(ADR(pSystem.Output.Monitor.Axes[n].UnitPositionLabel),ADR(pAxes[TempIndex].Input.Configuration.UnitPositionLabel));
					pSystem.Output.Monitor.Axes[n].ActualVelocity:= pAxes[TempIndex].Output.Monitor.Velocity;
					brsstrcpy(ADR(pSystem.Output.Monitor.Axes[n].UnitVelocityLabel),ADR(pAxes[TempIndex].Input.Configuration.UnitVelocityLabel));
			
					IF((pSystem.Input.Configuration.Mode[TempMode].Axes[j].Type = SPINDLE_0_AXES)OR
						(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Type = SPINDLE_1_AXES)OR
						(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Type = SPINDLE_2_AXES)OR
						(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Type = SPINDLE_3_AXES))THEN
	  					pSystem.Output.Monitor.SpindleMaximalVelocity:= pAxes[TempIndex].Output.Monitor.MaximalVelocity;
		 				IF(pAxes[TempIndex].Output.State.ContinuousMotion = 1)THEN
							pSystem.Output.Monitor.SpindleMoving:= 1;
						END_IF
					ELSIF(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Type = CNC_AXES)THEN
					
						FOR k:= 0 TO MAX_CNC_MINUS_ONE DO
								FOR m:= 0 TO REAL_TO_USINT(SIZEOF(pCnc[0].Output.Monitor.Axes)/SIZEOF(pCnc[0].Output.Monitor.Axes[0])-1) DO
								IF(pAxes[TempIndex].Output.Status.AxesDatAddress = pCnc[k].Output.Monitor.Axes[m].AxesDatAddress)THEN
									pSystem.Output.Monitor.Axes[n].ActualPostion:= pCnc[k].Output.Monitor.Axes[m].Position;
									brsstrcpy(ADR(pSystem.Output.Monitor.Axes[n].UnitPositionLabel),ADR(pCnc[k].Input.Configuration.Axes[m].UnitPositionLabel));
									EXIT;
								END_IF
							END_FOR
						END_FOR
						
					END_IF
					
					n:= n + 1;
					
				END_IF	
			END_IF
		END_FOR
		(* End Axes Monitoring *)
	ELSE
		(* No Mode Monitoring System default configuration *)
		IF(pSystem.Output.Monitor.Mode = CHANGING_MODE)THEN
			pSystem.Output.Monitor.ModeLabel:= 'Changing Mode';
		ELSE
			pSystem.Output.Monitor.ModeLabel:= 'No active Mode';
		END_IF
		
		n:= 0;
		FOR j:= 0 TO MAX_AX_MINUS_ONE DO
			TempIndex:= pSystem.Input.Configuration.SystemAxes[j].Index;
			pSystem.Output.Monitor.Axes[j].Index:= NO_PART_OF_SYSTEM;
			IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
				IF(pAxes[TempIndex].Input.Configuration.Active = 1)THEN
					pSystem.Output.Monitor.Axes[n].Index:= TempIndex;
					brsstrcpy(ADR(pSystem.Output.Monitor.Axes[n].Label),ADR(pAxes[TempIndex].Input.Configuration.Label));
					pSystem.Output.Monitor.Axes[n].AxesDatAddress:= pAxes[TempIndex].Output.Status.AxesDatAddress;
					pSystem.Output.Monitor.Axes[n].Type:= NO_TYPE;
	  				pSystem.Output.Monitor.Axes[n].IsSpindle:= pSystem.Input.Configuration.SystemAxes[j].IsSpindle;
					pSystem.Output.Monitor.Axes[n].ActualPostion:= pAxes[TempIndex].Output.Monitor.Position;
					brsstrcpy(ADR(pSystem.Output.Monitor.Axes[n].UnitPositionLabel),ADR(pAxes[TempIndex].Input.Configuration.UnitPositionLabel));
					pSystem.Output.Monitor.Axes[n].ActualVelocity:= pAxes[TempIndex].Output.Monitor.Velocity;
					brsstrcpy(ADR(pSystem.Output.Monitor.Axes[n].UnitVelocityLabel),ADR(pAxes[TempIndex].Input.Configuration.UnitVelocityLabel));			
					n:= n + 1;
				END_IF	
			END_IF
		END_FOR
	END_IF
	
	
END_ACTION


ACTION SystemModechange:
	
	IF	(pSystemPrivate.ModeChanging = 1)AND
		(pSystemPrivate.ActionRequest = SYSACTION_NO_ACTION)THEN
  		
		IF(pSystem.Input.Parameter.Mode <= MAX_MODE_MINUS_ONE)THEN
 		
			pSystem.Output.Monitor.Mode:= CHANGING_MODE;
		
			TempMode:= pSystem.Input.Parameter.Mode;
		
	 		CASE pSystemPrivate.ModeChangeStep OF
  	
				 SYSMODECHANGE_STOP_CNC:
					FOR j:= 0 TO MAX_CNC_MINUS_ONE DO
						TempIndex:= pSystem.Input.Configuration.Mode[TempMode].Cnc[j].Index;
						IF	(TempIndex <> NO_PART_OF_SYSTEM)AND
	  						(pSystem.Input.Configuration.Mode[TempMode].Cnc[j].Behavior = STOP_CNC)THEN
								pCnc[TempIndex].Input.Command.Stop:= pSystem.Input.Parameter.CommandID;
						END_IF
					END_FOR
					pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_W_STOP_CNC;
					(* End case SYSMODECHANGE_STOP_CNC *)
	
				 SYSMODECHANGE_W_STOP_CNC:
				 	pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_STOP_AXES;
					FOR j:= 0 TO MAX_CNC_MINUS_ONE DO
						TempIndex:= pSystem.Input.Configuration.Mode[TempMode].Cnc[j].Index;
						IF	(TempIndex <> NO_PART_OF_SYSTEM)AND
	  						(pSystem.Input.Configuration.Mode[TempMode].Cnc[j].Behavior = STOP_CNC)THEN
							IF	(pCnc[TempIndex].Output.State.Standby = 0)OR
		  						(pCnc[TempIndex].Input.Command.Stop <> 0)THEN
								pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_W_STOP_CNC;
							// else condition to go out of state if axis error and machine is stucked
							ELSIF (pCnc[TempIndex].Output.State.Standby = 0)AND(pCnc[TempIndex].Input.Command.Stop = 0)THEN
								pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_STOP_CNC;
								pSystemPrivate.ModeChanging:= 0;
								pSystem.Output.Error.Count := pSystem.Output.Error.Count + 1;
								pSystem.Output.Error.Text.Line1 := 'Error during change mode, while stopping cnc';	
							END_IF								
						END_IF
					END_FOR
					(* End case SYSMODECHANGE_W_STOP_CNC *)
	
				 SYSMODECHANGE_STOP_AXES:
					FOR j:= 0 TO MAX_AX_MINUS_ONE DO
						TempIndex:= pSystem.Input.Configuration.Mode[TempMode].Axes[j].Index;
						IF	(TempIndex <> NO_PART_OF_SYSTEM)THEN
	  						IF(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior <> IGNORE_AXES)THEN
								pAxes[TempIndex].Input.Command.Stop:= pSystem.Input.Parameter.CommandID;
							END_IF
						END_IF
					END_FOR
					pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_W_STOP_AXES;
					(* End case SYSMODECHANGE_STOP_AXES *)
	
				 SYSMODECHANGE_W_STOP_AXES:
				 	pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_MOVE_AUTOPOS;
					FOR j:= 0 TO MAX_AX_MINUS_ONE DO
						TempIndex:= pSystem.Input.Configuration.Mode[TempMode].Axes[j].Index;
						IF	(TempIndex <> NO_PART_OF_SYSTEM)THEN
							IF	(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = HOMEAUTO_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = HOMEAUTO_CYCLICPOS_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = HOMEAUTO_MOVE_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = HOMEAUTO_MOVE_CYCLICPOS_AXES)THEN
								pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_HOME_AUTOPOS;
							END_IF
							
							IF	(pAxes[TempIndex].Output.State.Standstill = 0)OR
			  					(pAxes[TempIndex].Input.Command.Stop <> 0)THEN
								pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_W_STOP_AXES;
							// else condition to go out of state if axis error and machine is stucked
							ELSIF (pAxes[TempIndex].Output.State.Standstill = 0)AND (pAxes[TempIndex].Input.Command.Stop = 0)THEN
								pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_STOP_CNC;
								pSystemPrivate.ModeChanging:= 0;
								pSystem.Output.Error.Count := pSystem.Output.Error.Count + 1;
								pSystem.Output.Error.Text.Line1 := 'Error during change mode, while stopping axes';
							END_IF
						END_IF
					END_FOR
					(* End case SYSMODECHANGE_W_STOP_AXES *)
					
				 SYSMODECHANGE_HOME_AUTOPOS:
					FOR j:= 0 TO MAX_AX_MINUS_ONE DO
						TempIndex:= pSystem.Input.Configuration.Mode[TempMode].Axes[j].Index;
						IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
							IF	(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = HOMEAUTO_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = HOMEAUTO_CYCLICPOS_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = HOMEAUTO_MOVE_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = HOMEAUTO_MOVE_CYCLICPOS_AXES)THEN
								pAxes[TempIndex].Input.Command.HomeAutoPosition:= pSystem.Input.Parameter.CommandID; 
							END_IF
						END_IF
					END_FOR
					pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_W_HOME_AUTOPOS;
					(* End case SYSMODECHANGE_HOME_AUTOPOS *)
	
				 SYSMODECHANGE_W_HOME_AUTOPOS:
				 	pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_MOVE_AUTOPOS;
					FOR j:= 0 TO MAX_AX_MINUS_ONE DO
						TempIndex:= pSystem.Input.Configuration.Mode[TempMode].Axes[j].Index;
						IF	(TempIndex <> NO_PART_OF_SYSTEM)THEN
							IF	(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = HOMEAUTO_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = HOMEAUTO_CYCLICPOS_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = HOMEAUTO_MOVE_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = HOMEAUTO_MOVE_CYCLICPOS_AXES)THEN
								IF	(pAxes[TempIndex].Output.State.Standstill = 0)OR
			  						(pAxes[TempIndex].Input.Command.HomeAutoPosition <> 0)OR
			   						(pAxes[TempIndex].Output.Status.HomingOk <> 1)THEN
									pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_W_HOME_AUTOPOS;
								// else condition to go out of state if axis error and machine is stucked
								ELSIF (pAxes[TempIndex].Output.State.Standstill = 0)AND (pAxes[TempIndex].Input.Command.HomeAutoPosition = 0)THEN
									pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_STOP_CNC;
									pSystemPrivate.ModeChanging:= 0;
									pSystem.Output.Error.Count := pSystem.Output.Error.Count + 1;
									pSystem.Output.Error.Text.Line1 := 'Error during change mode, while homing with autoposition';	
								END_IF							   
							END_IF
						END_IF
					END_FOR
					(* End case SYSMODECHANGE_W_HOME_AUTOPOS *)
					
				 SYSMODECHANGE_MOVE_AUTOPOS:
				 	pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_MOVEHOME_AUTOPOS;
					FOR j:= 0 TO MAX_AX_MINUS_ONE DO
						TempIndex:= pSystem.Input.Configuration.Mode[TempMode].Axes[j].Index;
						IF	(TempIndex <> NO_PART_OF_SYSTEM)THEN
							IF	(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = MOVE_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = MOVE_CYCLICPOS_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = MOVE_HOMEAUTO_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = MOVE_HOMEAUTO_CYCLICPOS_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = HOMEAUTO_MOVE_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = HOMEAUTO_MOVE_CYCLICPOS_AXES)THEN
								pAxes[TempIndex].Input.Parameter.Position:= pAxes[TempIndex].Input.Parameter.Position;
								pAxes[TempIndex].Input.Command.MoveAbsolute:= pSystem.Input.Parameter.CommandID;
							END_IF
						END_IF
					END_FOR
					pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_W_MOVE_AUTOPOS;
					(* End case SYSMODECHANGE_MOVE_AUTOPOS *)
					
				 SYSMODECHANGE_W_MOVE_AUTOPOS:
				 	pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_MOVEHOME_AUTOPOS;
					FOR j:= 0 TO MAX_AX_MINUS_ONE DO
						TempIndex:= pSystem.Input.Configuration.Mode[TempMode].Axes[j].Index;
						IF	(TempIndex <> NO_PART_OF_SYSTEM)THEN
							IF	(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = MOVE_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = MOVE_CYCLICPOS_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = MOVE_HOMEAUTO_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = MOVE_HOMEAUTO_CYCLICPOS_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = HOMEAUTO_MOVE_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = HOMEAUTO_MOVE_CYCLICPOS_AXES)THEN
								IF(pAxes[TempIndex].Output.Monitor.InPosition = 0)THEN
									pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_W_MOVE_AUTOPOS;
								// else condition to go out of state if axis error and machine is stucked
								ELSIF (pAxes[TempIndex].Output.State.DiscreteMotion = 0)AND(pAxes[TempIndex].Output.Monitor.InPosition = 0)THEN
									pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_STOP_CNC;
									pSystemPrivate.ModeChanging:= 0;
									pSystem.Output.Error.Count := pSystem.Output.Error.Count + 1;
									pSystem.Output.Error.Text.Line1 := 'Error during change mode, while moving to autoposition';	
								END_IF
							END_IF
						END_IF
					END_FOR
				 	(* End case SYSMODECHANGE_W_MOVE_AUTOPOS *)
					
				 SYSMODECHANGE_MOVEHOME_AUTOPOS:
					FOR j:= 0 TO MAX_AX_MINUS_ONE DO
						TempIndex:= pSystem.Input.Configuration.Mode[TempMode].Axes[j].Index;
						IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
							IF	(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = MOVE_HOMEAUTO_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = MOVE_HOMEAUTO_CYCLICPOS_AXES)THEN
								pAxes[TempIndex].Input.Command.HomeAutoPosition:= pSystem.Input.Parameter.CommandID; 
							END_IF
						END_IF
					END_FOR
					pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_W_MOVEHOME_AUTOPOS;
					(* End case SYSMODECHANGE_MOVEHOME_AUTOPOS *)
	
				 SYSMODECHANGE_W_MOVEHOME_AUTOPOS:
				 	pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_CYCLIC_POSITION;
					FOR j:= 0 TO MAX_AX_MINUS_ONE DO
						TempIndex:= pSystem.Input.Configuration.Mode[TempMode].Axes[j].Index;
						IF	(TempIndex <> NO_PART_OF_SYSTEM)THEN
							IF	(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = MOVE_HOMEAUTO_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = MOVE_HOMEAUTO_CYCLICPOS_AXES)THEN
								IF	(pAxes[TempIndex].Output.State.Standstill = 0)OR
			  						(pAxes[TempIndex].Input.Command.HomeAutoPosition <> 0)OR
			   						(pAxes[TempIndex].Output.Status.HomingOk <> 1)THEN
									pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_W_MOVEHOME_AUTOPOS;
								// else condition to go out of state if axis error and machine is stucked
								ELSIF (pAxes[TempIndex].Output.State.Standstill = 0)AND (pAxes[TempIndex].Input.Command.HomeAutoPosition = 0)THEN
									pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_STOP_CNC;
									pSystemPrivate.ModeChanging:= 0;
									pSystem.Output.Error.Count := pSystem.Output.Error.Count + 1;
									pSystem.Output.Error.Text.Line1 := 'Error during change mode, while moving home to autoposition';	
								END_IF
							END_IF
						END_IF
					END_FOR
					(* End case SYSMODECHANGE_W_MOVEHOME_AUTOPOS *)
	
				 SYSMODECHANGE_CYCLIC_POSITION:
	 				pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_W_CYCLIC_POSITION;
					FOR j:= 0 TO MAX_AX_MINUS_ONE DO
						TempIndex:= pSystem.Input.Configuration.Mode[TempMode].Axes[j].Index;
						IF	(TempIndex <> NO_PART_OF_SYSTEM)THEN
							IF	(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = CYCLICPOS_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = HOMEAUTO_CYCLICPOS_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = HOMEAUTO_MOVE_CYCLICPOS_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = MOVE_CYCLICPOS_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = MOVE_HOMEAUTO_CYCLICPOS_AXES)THEN
								pAxes[TempIndex].Input.Parameter.CyclicPosition:= pAxes[TempIndex].Output.Monitor.CyclicPosition;
								pAxes[TempIndex].Input.Command.CyclicPosition:= pSystem.Input.Parameter.CommandID;
							END_IF
						END_IF
					END_FOR
				 	(* End case SYSMODECHANGE_CYCLIC_POSITION *)
	
				 SYSMODECHANGE_W_CYCLIC_POSITION:
				 	pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_RESET_JOLT_TIME;
					FOR j:= 0 TO MAX_AX_MINUS_ONE DO
						TempIndex:= pSystem.Input.Configuration.Mode[TempMode].Axes[j].Index;
						IF	(TempIndex <> NO_PART_OF_SYSTEM)THEN
							IF	(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = CYCLICPOS_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = HOMEAUTO_CYCLICPOS_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = HOMEAUTO_MOVE_CYCLICPOS_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = MOVE_CYCLICPOS_AXES)OR
								(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Behavior = MOVE_HOMEAUTO_CYCLICPOS_AXES)THEN
								IF	(pAxes[TempIndex].Input.Command.CyclicPosition <> 0)OR
			   						(pAxes[TempIndex].Output.State.ContinuousMotion = 0)THEN
									pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_W_CYCLIC_POSITION;
								// else condition to go out of state if axis error and machine is stucked
								ELSIF (pAxes[TempIndex].Output.State.ContinuousMotion = 0)AND (pAxes[TempIndex].Input.Command.CyclicPosition = 0)THEN
									pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_STOP_CNC;
									pSystemPrivate.ModeChanging:= 0;
									pSystem.Output.Error.Count := pSystem.Output.Error.Count + 1;
									pSystem.Output.Error.Text.Line1 := 'Error during change mode, while starting cyclic position';
								END_IF
							END_IF
						END_IF
					END_FOR
				 	(* End case SYSMODECHANGE_W_CYCLIC_POSITION *)
	
				(* section of two next steps added according to CNC_BASIS_issues excel file *)
				 SYSMODECHANGE_RESET_JOLT_TIME:
                    pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_W_RESET_JOLT_TIME;
                    FOR j:= 0 TO MAX_AX_MINUS_ONE DO
                        TempIndex:= pSystem.Input.Configuration.Mode[TempMode].Axes[j].Index;
                        IF (TempIndex <> NO_PART_OF_SYSTEM)THEN
                            IF (pSystem.Input.Configuration.Mode[TempMode].Axes[j].ResetJoltTime = TRUE) THEN
                                pAxisDat ACCESS pAxes[j].Output.Status.AxesDatAddress;
                                //pAxisDat.limit.parameter.t_jolt := 0.0; 
                                pAxes[j].Input.Parameter.InitAxisSubjectPar := ncLIMITS;
                                pAxes[j].Input.Command.InitAxisSubjecPar := TRUE;
                            ELSE
                                pAxisDat ACCESS pAxes[j].Output.Status.AxesDatAddress;
                                //pAxisDat.limit.parameter.t_jolt := pAxes[j].Input.Parameter.JoltTime;
                                pAxes[j].Input.Parameter.InitAxisSubjectPar := ncLIMITS;
                                pAxes[j].Input.Command.InitAxisSubjecPar := TRUE;
                            END_IF
                        END_IF
                    END_FOR
                     (* End case SYSMODECHANGE_CYCLIC_POSITION *)
    
                 SYSMODECHANGE_W_RESET_JOLT_TIME:
                    pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_SET_MODE;
                    FOR j:= 0 TO MAX_AX_MINUS_ONE DO
                        TempIndex:= pSystem.Input.Configuration.Mode[TempMode].Axes[j].Index;
                        IF (TempIndex <> NO_PART_OF_SYSTEM) THEN
                            IF (pAxes[j].Input.Configuration.Active = TRUE) THEN
                                IF (pAxes[j].Input.Command.InitAxisSubjecPar = 1) THEN
                                    pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_W_RESET_JOLT_TIME;
                                END_IF
                            END_IF
                        END_IF
                    END_FOR	
	
	
	
				 SYSMODECHANGE_SET_MODE:
					pSystemPrivate.ModeChanging:= 0;
					pSystem.Output.Status.Busy:= 0;
					pSystem.Output.Monitor.Mode:= TempMode;
				 	(* End case SYSMODECHANGE_SET_MODE *)

			(* End CASE pSystemPrivate.ModeChangeStep OF *)
			END_CASE
		
		(* invalid mode parameter *)	
		ELSE
			pSystem.Output.Status.CommandError:= 1;
			pSystem.Output.Status.Busy:= 0;
			pSystemPrivate.ModeChanging:= 0;
		END_IF
		 
 	ELSE
		pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_STOP_CNC;	
	END_IF
	 
END_ACTION


ACTION SystemSpindleHandling:
	
	IF(pSystem.Output.Monitor.Mode <> NO_MODE_ACTIVE)AND(pSystem.Output.Monitor.Mode <= MAX_MODE_MINUS_ONE)THEN
	
		IF(pSystem.Input.Parameter.Spindle.Mode = PROGRAM_DEPENDED)THEN
		
			TempMode:= pSystem.Output.Monitor.Mode;
			TempIndex:= pSystem.Input.Configuration.Mode[TempMode].Cnc[0].Index;
			
			IF	(TempIndex <> NO_PART_OF_SYSTEM)THEN
				
				IF(pCnc[TempIndex].Output.Monitor.Parameter.MFunctionAccessAddress <> 0)THEN
					
					pCncMFunction ACCESS pCnc[TempIndex].Output.Monitor.Parameter.MFunctionAccessAddress;
					
					IF	(pCncMFunction[5] <> 0)THEN
						pCncMFunction[3]:= 0;
						pCncMFunction[4]:= 0;
						pCncMFunction[5]:= 0;
						FOR k:= 0 TO 3 DO
							pSystemPrivate.SpindleHandling[k].Stop:= 1;
						END_FOR
					ELSIF (EDGEPOS (USINT_TO_BOOL(pCncMFunction[3])))THEN
	 					pCncMFunction[4]:= 0;
						FOR k:= 0 TO 3 DO
							pSystemPrivate.SpindleHandling[k].Stop:= 0;
							pSystemPrivate.SpindleHandling[k].Anticlockwise:= 0;
							pSystemPrivate.SpindleHandling[k].ChangeSpeed:= 1;
						END_FOR
					ELSIF (EDGEPOS (USINT_TO_BOOL(pCncMFunction[4])))THEN
	 					pCncMFunction[3]:= 0;
						FOR k:= 0 TO 3 DO
							pSystemPrivate.SpindleHandling[k].Stop:= 0;
							pSystemPrivate.SpindleHandling[k].Anticlockwise:= 1;
							pSystemPrivate.SpindleHandling[k].ChangeSpeed:= 1;
						END_FOR
					END_IF
					
					FOR k:= 0 TO 3 DO
						IF(pSystemPrivate.SpindleHandling[k].Stop = 0)THEN
				  			IF(pCnc[TempIndex].Output.Monitor.Parameter.SFunctionValue[k] <> REAL_TO_UDINT(pSystemPrivate.SpindleHandling[k].Velocity))THEN
								pSystemPrivate.SpindleHandling[k].ChangeSpeed:= 1;
								pSystemPrivate.SpindleHandling[k].Velocity:= UDINT_TO_REAL(pCnc[TempIndex].Output.Monitor.Parameter.SFunctionValue[k]);
							END_IF
						END_IF
					END_FOR
					
				END_IF

			END_IF
				
		ELSIF(pSystem.Input.Parameter.Spindle.Mode = FORCE_ON)THEN
		
			TempMode:= pSystem.Output.Monitor.Mode;
			TempIndex:= pSystem.Input.Configuration.Mode[TempMode].Cnc[0].Index;
			
			FOR k:= 0 TO 3 DO
				IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
				IF(pCnc[TempIndex].Output.Status.CncDatAddress <> 0)THEN
				IF(pCnc[TempIndex].Output.Monitor.Parameter.MFunctionAccessAddress <> 0)THEN
					
					pCncDat ACCESS pCnc[TempIndex].Output.Status.CncDatAddress;
					pCncMFunction ACCESS pCnc[TempIndex].Output.Monitor.Parameter.MFunctionAccessAddress;
					
					pCncDat.cnc_plc.data.s_funct[0]:= REAL_TO_UDINT(pSystem.Input.Parameter.Spindle.SpindleVelocity[0]);
					
					IF(pSystem.Input.Parameter.Spindle.SpindleVelocity[0] < 0)THEN
						pCncMFunction[3]:= 0;
						pCncMFunction[4]:= 1;
						pCncMFunction[5]:= 0;	
					ELSIF(pSystem.Input.Parameter.Spindle.SpindleVelocity[0] = 0)THEN
						pCncMFunction[3]:= 0;
						pCncMFunction[4]:= 0;
						pCncMFunction[5]:= 0;
	 				ELSIF(pSystem.Input.Parameter.Spindle.SpindleVelocity[0] > 0)THEN
						pCncMFunction[3]:= 1;
						pCncMFunction[4]:= 0;
						pCncMFunction[5]:= 0;
					END_IF	
				END_IF
				END_IF
				END_IF
				IF(pSystem.Input.Parameter.Spindle.SpindleVelocity[k] <> pSystemPrivate.SpindleHandling[k].Velocity)THEN
					pSystemPrivate.SpindleHandling[k].ChangeSpeed:= 1;
					pSystemPrivate.SpindleHandling[k].Velocity:= pSystem.Input.Parameter.Spindle.SpindleVelocity[k];
					IF(pSystem.Input.Parameter.Spindle.SpindleVelocity[k] < 0)THEN
	 					pSystemPrivate.SpindleHandling[k].Anticlockwise:= 1;
					ELSIF(pSystem.Input.Parameter.Spindle.SpindleVelocity[k] = 0)THEN
	 					pSystemPrivate.SpindleHandling[k].Stop:= 1;
						pSystemPrivate.SpindleHandling[k].ChangeSpeed:= 0;
	 				ELSIF(pSystem.Input.Parameter.Spindle.SpindleVelocity[k] > 0)THEN
						pSystemPrivate.SpindleHandling[k].Anticlockwise:= 0;
					END_IF
				END_IF
			END_FOR
		ELSIF(pSystem.Input.Parameter.Spindle.Mode = FORCE_OFF)THEN
		
			TempMode:= pSystem.Output.Monitor.Mode;
			TempIndex:= pSystem.Input.Configuration.Mode[TempMode].Cnc[0].Index;
			
			IF(TempIndex <> NO_PART_OF_SYSTEM)THEN
			IF(pCnc[TempIndex].Output.Status.CncDatAddress <> 0)THEN
			IF(pCnc[TempIndex].Output.Monitor.Parameter.MFunctionAccessAddress <> 0)THEN
				
				pCncDat ACCESS pCnc[TempIndex].Output.Status.CncDatAddress;
				pCncMFunction ACCESS pCnc[TempIndex].Output.Monitor.Parameter.MFunctionAccessAddress;
				
				pCncDat.cnc_plc.data.s_funct[0]:= 0;
				
				pCncMFunction[3]:= 0;
				pCncMFunction[4]:= 0;
				pCncMFunction[5]:= 0;
			END_IF
			END_IF
			END_IF
			FOR k:= 0 TO 3 DO
				pSystemPrivate.SpindleHandling[k].Velocity:= 0;
				pSystemPrivate.SpindleHandling[k].Stop:= 1;
			END_FOR
	 	END_IF	
	
		FOR j:= 0 TO MAX_AX_MINUS_ONE DO
			
			TempMode:= pSystem.Output.Monitor.Mode;
			TempIndex:= pSystem.Input.Configuration.Mode[TempMode].Axes[j].Index;
			
			IF	(TempIndex <> NO_PART_OF_SYSTEM)AND
				(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Type = SPINDLE_0_AXES)THEN
				pAxes[TempIndex].Input.Parameter.Override:= pSystem.Input.Parameter.Spindle.Override;
				IF	(pAxes[TempIndex].Input.Configuration.Active = 1)AND
					(pSystemPrivate.SpindleHandling[0].ChangeSpeed <> 0)THEN
					IF(pSystemPrivate.SpindleHandling[0].Anticlockwise = 1)THEN
						pAxes[TempIndex].Input.Parameter.Direction:= mcNEGATIVE_DIR;
					ELSIF(pSystemPrivate.SpindleHandling[0].Anticlockwise = 0)THEN
						pAxes[TempIndex].Input.Parameter.Direction:= mcPOSITIVE_DIR;
					END_IF	
					pAxes[TempIndex].Input.Parameter.Velocity:= pSystemPrivate.SpindleHandling[0].Velocity;
					pAxes[TempIndex].Input.Command.MoveVelocity:= pSystem.Input.Parameter.CommandID;
				ELSIF	(pAxes[TempIndex].Input.Configuration.Active = 1)AND
						(pAxes[TempIndex].Output.State.Standstill = 0)AND
						(pAxes[TempIndex].Output.State.Stopping = 0)AND
						(pSystemPrivate.SpindleHandling[0].Stop <> 0)THEN							
					pAxes[TempIndex].Input.Command.Stop:= pSystem.Input.Parameter.CommandID;
				END_IF				
			END_IF
	
			IF	(TempIndex <> NO_PART_OF_SYSTEM)AND
				(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Type = SPINDLE_1_AXES)THEN
				pAxes[TempIndex].Input.Parameter.Override:= pSystem.Input.Parameter.Spindle.Override;
				IF	(pAxes[TempIndex].Input.Configuration.Active = 1)AND
					(pSystemPrivate.SpindleHandling[1].ChangeSpeed <> 0)THEN
					IF(pSystemPrivate.SpindleHandling[1].Anticlockwise = 1)THEN
						pAxes[TempIndex].Input.Parameter.Direction:= mcNEGATIVE_DIR;
					ELSIF(pSystemPrivate.SpindleHandling[1].Anticlockwise = 1)THEN
						pAxes[TempIndex].Input.Parameter.Direction:= mcPOSITIVE_DIR;
					END_IF
					pAxes[TempIndex].Input.Parameter.Velocity:= pSystemPrivate.SpindleHandling[1].Velocity;
					pAxes[TempIndex].Input.Command.MoveVelocity:= pSystem.Input.Parameter.CommandID;
				ELSIF	(pAxes[TempIndex].Input.Configuration.Active = 1)AND
						(pAxes[TempIndex].Output.State.Standstill = 0)AND
						(pAxes[TempIndex].Output.State.Stopping = 0)AND
						(pSystemPrivate.SpindleHandling[1].Stop <> 0)THEN	
					pAxes[TempIndex].Input.Command.Stop:= pSystem.Input.Parameter.CommandID;
				END_IF						
			END_IF
	
			IF	(TempIndex <> NO_PART_OF_SYSTEM)AND
				(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Type = SPINDLE_2_AXES)THEN
				pAxes[TempIndex].Input.Parameter.Override:= pSystem.Input.Parameter.Spindle.Override;
				IF	(pAxes[TempIndex].Input.Configuration.Active = 1)AND
					(pSystemPrivate.SpindleHandling[2].ChangeSpeed <> 0)THEN
					IF(pSystemPrivate.SpindleHandling[2].Anticlockwise = 1)THEN
						pAxes[TempIndex].Input.Parameter.Direction:= mcNEGATIVE_DIR;
					ELSIF(pSystemPrivate.SpindleHandling[2].Anticlockwise = 0)THEN
						pAxes[TempIndex].Input.Parameter.Direction:= mcPOSITIVE_DIR;
					END_IF
					pAxes[TempIndex].Input.Parameter.Velocity:= pSystemPrivate.SpindleHandling[2].Velocity;
					pAxes[TempIndex].Input.Command.MoveVelocity:= pSystem.Input.Parameter.CommandID;
				ELSIF	(pAxes[TempIndex].Input.Configuration.Active = 1)AND
						(pAxes[TempIndex].Output.State.Standstill = 0)AND
						(pAxes[TempIndex].Output.State.Stopping = 0)AND
						(pSystemPrivate.SpindleHandling[2].Stop <> 0)THEN	
					pAxes[TempIndex].Input.Command.Stop:= pSystem.Input.Parameter.CommandID;
				END_IF					
			END_IF
	
			IF	(TempIndex <> NO_PART_OF_SYSTEM)AND
				(pSystem.Input.Configuration.Mode[TempMode].Axes[j].Type = SPINDLE_3_AXES)THEN
				pAxes[TempIndex].Input.Parameter.Override:= pSystem.Input.Parameter.Spindle.Override;
				IF	(pAxes[TempIndex].Input.Configuration.Active = 1)AND
					(pSystemPrivate.SpindleHandling[3].ChangeSpeed <> 0)THEN
					IF(pSystemPrivate.SpindleHandling[3].Anticlockwise = 1)THEN
						pAxes[TempIndex].Input.Parameter.Direction:= mcNEGATIVE_DIR;
					ELSIF(pSystemPrivate.SpindleHandling[3].Anticlockwise = 0)THEN
						pAxes[TempIndex].Input.Parameter.Direction:= mcPOSITIVE_DIR;
					END_IF
					pAxes[TempIndex].Input.Parameter.Velocity:= pSystemPrivate.SpindleHandling[3].Velocity;
					pAxes[TempIndex].Input.Command.MoveVelocity:= pSystem.Input.Parameter.CommandID;
				ELSIF	(pAxes[TempIndex].Input.Configuration.Active = 1)AND
						(pAxes[TempIndex].Output.State.Standstill = 0)AND
						(pAxes[TempIndex].Output.State.Stopping = 0)AND
						(pSystemPrivate.SpindleHandling[3].Stop <> 0)THEN	
					pAxes[TempIndex].Input.Command.Stop:= pSystem.Input.Parameter.CommandID;
				END_IF				
			END_IF
		END_FOR
		
		FOR k:= 0 TO 3 DO
			pSystemPrivate.SpindleHandling[k].Stop:= 0;
			pSystemPrivate.SpindleHandling[k].ChangeSpeed:= 0;
		END_FOR
		
	END_IF


	
END_ACTION

ACTION SystemCoolingHandling:
		
	IF	(pSystem.Input.Parameter.Cooling.Mode = PROGRAM_DEPENDED)AND
 		(pSystem.Output.Monitor.Mode <> NO_MODE_ACTIVE)AND
  		(pSystem.Output.Monitor.Mode <= MAX_MODE_MINUS_ONE)THEN
		
		TempMode:= pSystem.Output.Monitor.Mode;
		TempIndex:= pSystem.Input.Configuration.Mode[TempMode].Cnc[0].Index;
		
		IF	(TempIndex <> NO_PART_OF_SYSTEM)THEN
			
			IF(pCnc[TempIndex].Output.Monitor.Parameter.MFunctionAccessAddress <> 0)THEN
				
				pCncMFunction ACCESS pCnc[TempIndex].Output.Monitor.Parameter.MFunctionAccessAddress;
				
				IF(pCncMFunction[9] <> 0)AND(pCncMFunction[8] <> 0)THEN
					pCncMFunction[8]:= 0;
					pCncMFunction[9]:= 0;
				ELSE
					pCncMFunction[9]:= 0;
				END_IF
				
				IF(pCncMFunction[8] <> 0)THEN
					pSystem.Output.Monitor.Cooling:= 1;
				ELSE
					pSystem.Output.Monitor.Cooling:= 0;
				END_IF
			END_IF
			
		END_IF
		
	ELSIF(pSystem.Input.Parameter.Cooling.Mode = FORCE_ON)THEN
		
		pSystem.Output.Monitor.Cooling:= 1;
	
	ELSIF(pSystem.Input.Parameter.Cooling.Mode = FORCE_OFF)THEN
	
		pSystem.Output.Monitor.Cooling:= 0;
	
	END_IF
	
END_ACTION

