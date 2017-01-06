(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Program: Cnc
 * File: Cnc.st
 * Author: radaka
 * Created: February 16, 2009
 ********************************************************************
 * Implementation of program Cnc
 ********************************************************************)
PROGRAM _INIT
	
	StartUpFirst:= 1;
	
END_PROGRAM


PROGRAM _CYCLIC
	
	(*************************************************************************************************************)
	(* StartUpFirst routine *)
	IF(StartUpFirst = 1)THEN
	
		(* Loop over all cnc *)
		FOR i:= 0 TO MAX_CNC_MINUS_ONE DO
		
			pCnc ACCESS ADR(Cnc[i]);
		
			pCncPrivate ACCESS ADR(CncPrivate[i]);

			pCnc.Input.Parameter.CommandID:= (i + 1);
		
			pCnc.Output.Monitor.CncAddress:= ADR(Cnc[i]);
		
			(* Initialization of Enum Types *)
			pCncPrivate.StateStep:= CNCSTATESTEP_DISABLED;
			pCncPrivate.ActionRequest:= CNCACTION_NO_ACTION;
			pCncPrivate.ActionResponse:= CNCACTION_NO_ACTION;
			pCncPrivate.ActionStep:= CNCACTIONSTEP_COMMAND;
		
		(* End FOR i:= 0 TO MAX_CNC_MINUS_ONE DO *)
		END_FOR
	
		StartUpFirst:= 0;
		StartUp:= 1;
	
	(*************************************************************************************************************)
	(* StartUp routine *)
	ELSIF(StartUp = 1)THEN
	
		StartUp:= 0;
	
		(* Loop over all cnc *)
		FOR i:= 0 TO MAX_CNC_MINUS_ONE DO
			
			pCnc ACCESS ADR(Cnc[i]);
			
			pCncPrivate ACCESS ADR(CncPrivate[i]);
			
			pCnc.Input.Parameter.ConfigOk:= Cnc[0].Input.Parameter.ConfigOk;  
		
			IF(pCnc.Input.Parameter.ConfigOk = 1)THEN
			
				IF(pCnc.Input.Configuration.Active = 1)THEN
  			
					CncAccess;
					
					CncInitParameter;
			
				END_IF
				
			ELSE
				
				StartUp:= 1;
				RETURN;
			
			(* End IF(pCnc.Input.Parameter.ConfigOk = 1)THEN *)	
			END_IF
	
		(* End FOR i:= 0 TO MAX_CNC_MINUS_ONE DO *)
		END_FOR
	
	ELSE
	(* End StartUp routine *)
	(*************************************************************************************************************)
	
	(*************************************************************************************************************)
	(* Cyclic routine *)
	
		(* Loop over all cnc *)
		FOR i:= 0 TO MAX_CNC_MINUS_ONE DO
		
			pCnc ACCESS ADR(Cnc[i]);
			
			pCncPrivate ACCESS ADR(CncPrivate[i]);
		
			IF(pCnc.Input.Configuration.Active = 1)THEN
			
				IF(pCnc.Output.Status.AccessOk = 1)THEN
			
					CncNcCncComCall;
   	
					CncStateHandling;
				
					CncSetParameter;
				
					CncActions;
					
					CncDryRun;
				
					CncResetCommands;
				
					CncReadStatus;
				
					CncMonitor;
				
				(* End IF(pCnc.Output.Status.AccessOk = 1)THEN *)	
				END_IF
			
			(* End IF(pCnc.Input.Configuration.Active = 1)THEN *)	
			END_IF
		
		(* End FOR i:= 0 TO MAX_CNC_MINUS_ONE DO *)
		END_FOR
	
	END_IF
	
	(* End Cyclic routine *)
	(*************************************************************************************************************)

END_PROGRAM
