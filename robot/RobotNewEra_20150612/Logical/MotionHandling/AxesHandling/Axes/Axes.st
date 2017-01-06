(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Program: Axes
 * File: Axes.st
 * Author: B&R
 * Created: February 09, 2009
 ********************************************************************
 * Implementation of program Axes
 ********************************************************************)
PROGRAM _INIT
	
	// Variable used for the PlcOpen FUB MoveCyclicPosition
	brsmemset(ADR(ACP10_MC_MN_PRES_IF0),0,SIZEOF(ACP10_MC_MN_PRES_IF0));

	StartUpFirst:= 1;

END_PROGRAM


PROGRAM _CYCLIC
	
	
	(*************************************************************************************************************)
	(* StartUpFirst routine *)
	IF(StartUpFirst = 1)THEN
	
		(* Loop over all Axes *)
		FOR i:= 0 TO MAX_AX_MINUS_ONE DO
		
			pAxes ACCESS ADR(Axes[i]);
		
			pAxesPrivate ACCESS ADR(AxesPrivate[i]);

			pAxes.Input.Parameter.CommandID:= (i + 1);
		
			pAxes.Output.Monitor.AxesAddress:= ADR(Axes[i]);
		
  		pAxes.Output.Monitor.MCAxesAddress:= ADR(MCAxes[i]);

			(* Initialization of Enum Types *)
			pAxesPrivate.NetTimeoutStep:= AXESNETTIMEOUT_CHECK_INIT;
			pAxesPrivate.CommandErrorStep:= AXESCOMMANDERROR_CHECK;
	
		(* End FOR i:= 0 TO MAX_AX_MINUS_ONE DO *)	
		END_FOR
	
		StartUpFirst:= 0;
		StartUp:= 1;
	
	(*************************************************************************************************************)
	(* StartUp routine *)
	ELSIF(StartUp = 1)THEN
	
		StartUp:= 0;
	
		(* Loop over all Axes *)
		FOR i:= 0 TO MAX_AX_MINUS_ONE DO
			
			pAxes ACCESS ADR(Axes[i]);
			
			pAxesPrivate ACCESS ADR(AxesPrivate[i]);
			
			pMCAxes ACCESS ADR(MCAxes[i]);
		
			pAxes.Input.Parameter.ConfigOk:= Axes[0].Input.Parameter.ConfigOk;
		
			IF(pAxes.Input.Parameter.ConfigOk = 1)THEN
		
				IF(pAxes.Input.Configuration.Active = 1)THEN

					AxACP10Access;

					IF(pAxes.Output.Status.AccessOk = 1)THEN
		
						AxACP10NetTimeout;

						AxACP10PLCOpenFubInit;
			
						AxACP10ParameterInit;
	
					(* End IF(pAxesPrivate.AccessOk = 1)THEN *)
					END_IF

				(* End IF(pAxes.Input.Configuration.Active = 1)THEN *)
		  		END_IF

			ELSE
				
				StartUp:= 1;
				RETURN;
				
			(* End IF(pAxes.Input.Parameter.ConfigOk = 1)THEN *)
			END_IF
	
		(* End FOR i:= 0 TO MAX_AX_MINUS_ONE DO *)	
		END_FOR
  
  	ELSE
	(* End StartUp routine *)
	(*************************************************************************************************************)
	
	(*************************************************************************************************************)
	(* Cyclic routine *)
	
		FOR i:= 0 TO MAX_AX_MINUS_ONE DO
		
			pAxes ACCESS ADR(Axes[i]);
			
			pAxesPrivate ACCESS ADR(AxesPrivate[i]);
			
			pMCAxes ACCESS ADR(MCAxes[i]);		
		
			IF(pAxes.Input.Configuration.Active = 1)THEN
			

				IF(pAxes.Output.Status.AccessOk = 1)THEN
			
					AxACP10NetTimeout;
		
					AxACP10SetCommands;
		
					AxACP10PLCOpenFubSetPar;
		
					AxACP10DryRun;
		
		  			AxACP10PLCOpenFubCall;
		
					AxACP10Monitor;
		
					AxACP10ResetCommands;
		
					AxACP10ResetParamter;
		
					AxACP10ReadState;
		
					AxACP10ReadStatus;

				(* End IF(pAxes.Output.AccessOk = 1)THEN *)
				END_IF
			
			(* End IF(pAxes.Input.Configuration.Active = 1)THEN *)
	  		END_IF
	
		(* End FOR i:= 0 TO MAX_AX_MINUS_ONE DO *)
		END_FOR
	
	(* End Cyclic routine *)
	(*************************************************************************************************************)
	END_IF	
	
END_PROGRAM
