(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Program: System
 * File: System.st
 * Author: radaka
 * Created: February 18, 2009
 ********************************************************************
 * Implementation of program System
 ********************************************************************)

PROGRAM _INIT
	
	StartUpFirst:= 1;

END_PROGRAM


PROGRAM _CYCLIC

	(*************************************************************************************************************)
	(* StartUpFirst routine *)
	IF(StartUpFirst)THEN
	
		(* Loop over all systems *)
		FOR i:= 0 TO MAX_SYS_MINUS_ONE DO
		
			pSystem ACCESS ADR(System[i]);
		
			pSystemPrivate ACCESS ADR(SystemPrivate[i]);
		
			pSystem.Output.Monitor.SystemAddress:= ADR(System[i]);
		
		  (* Initialization of Enum Types *)
			pSystemPrivate.TimeoutStep:= SYSTIMEOUTSTEP_CHECK;
			pSystemPrivate.SystemStateStep:= SYSSTATESTEP_BOOTING;
			pSystemPrivate.ActionRequest:= SYSACTION_NO_ACTION;
			pSystemPrivate.ActionResponse:= SYSACTION_NO_ACTION;
			pSystemPrivate.ActionStep:= SYSACTIONSTEP_COMMAND;
			pSystemPrivate.ModeChangeStep:= SYSMODECHANGE_STOP_CNC;
			pSystem.Output.Monitor.Mode:= NO_MODE_ACTIVE;
		
		(* End Loop over all systems *)	
		END_FOR

		StartUpFirst:= 0;	
		StartUp:= 1;

	(*************************************************************************************************************)
	(* StartUp routine *)
	ELSIF(StartUp = 1)THEN
	
		StartUp:= 0;
		
		(* Loop over all systems *)
		FOR i:= 0 TO MAX_SYS_MINUS_ONE DO
			
			pSystem ACCESS ADR(System[i]);
			
			pSystemPrivate ACCESS ADR(SystemPrivate[i]);
			
			pSystem.Input.Parameter.CommandID:= UDINT_TO_USINT(i + 1);
			
			pSystem.Input.Parameter.AxesAddress:= System[0].Input.Parameter.AxesAddress;
		 	pSystem.Input.Parameter.CncAddress:= System[0].Input.Parameter.CncAddress;
			pSystem.Input.Parameter.ConfigOk:= System[0].Input.Parameter.ConfigOk;
			
			IF	(pSystem.Input.Parameter.AxesAddress <> 0)AND
		 		(pSystem.Input.Parameter.CncAddress <> 0)AND
		  		(pSystem.Input.Parameter.ConfigOk = 1)THEN
		
		 		pAxes ACCESS System[i].Input.Parameter.AxesAddress;
				pCnc ACCESS System[i].Input.Parameter.CncAddress;
		
			ELSE
		
				StartUp:= 1;	 	
				RETURN;
		
		  	END_IF
		
		(* End loop over all Systems *)
		END_FOR
		
	ELSE
	(* End StartUp routine *)
	(*************************************************************************************************************)
	
	(*************************************************************************************************************)
	(* Cyclic routine *)
		
		(* Loop over all systems *)
		FOR i:= 0 TO MAX_SYS_MINUS_ONE DO
		
			pSystem ACCESS ADR(System[i]);
			
			pSystemPrivate ACCESS ADR(SystemPrivate[i]);
		
			IF(pSystem.Input.Configuration.Active = 1)THEN
		
				SystemAccess;
			
				IF(pSystem.Output.Status.AccessOk = 1)THEN
			
					IF(pSystemPrivate.StartupOk = 0)THEN
				
						SystemTimeout;
					
						pSystem.Output.Monitor.Mode:= NO_MODE_ACTIVE;
						pSystem.Output.Monitor.ModeLabel:= 'System booting';
						pSystem.Output.Status.Booting:= 1;
				
					ELSIF(pSystemPrivate.StartupOk = 1)THEN
   				
						SystemStateHandling;
					
						SystemActions;
					
						SystemModechange;
					
						SystemResetCommands;
					
						SystemMonitor;
					
						SystemSpindleHandling;
					
						SystemCoolingHandling;
					
						SystemStatus;

					END_IF
				
				(* End IF(pSystem.Input.Configuration.Active = 1)THEN *)
				END_IF
		
			(* IF(pSystem.Input.Configuration.Active = 1)THEN *)
			END_IF
		
		(* End Loop over all systems *)	
		END_FOR
	
	(* End Cyclic routine *)
	(*************************************************************************************************************)	
	END_IF

END_PROGRAM
