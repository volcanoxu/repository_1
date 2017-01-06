(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Program: Configuration
 * File: Config.st
 * Author: radaka
 * Created: February 18, 2009
 ********************************************************************
 * Implementation of program Configuration
 ********************************************************************)

PROGRAM _INIT

	Config.Output.Monitor.ConfigOk:= 0;
	InitAxesObj;
	InitCncObj;
END_PROGRAM



PROGRAM _CYCLIC
	
	Config.Input.Parameter.AxesAddress := HmiGlobal.Address.AxesAddress;
	Config.Input.Parameter.CncAddress := HmiGlobal.Address.CncAddress;
	Config.Input.Parameter.SystemAddress := HmiGlobal.Address.SystemAddress;
	
	IF	(Config.Input.Parameter.AxesAddress <> 0) AND
 		(Config.Input.Parameter.CncAddress <> 0)AND
  		(Config.Input.Parameter.SystemAddress <> 0) THEN

		pAxes ACCESS Config.Input.Parameter.AxesAddress;
		pCnc ACCESS Config.Input.Parameter.CncAddress;
  		pSystem ACCESS Config.Input.Parameter.SystemAddress;


  		IF(Config.Output.Monitor.ConfigOk = 0)THEN
		
			(********************************************************************************************************)
			(* Preparation of the configuration *)
			Configuration_Prepare;
			(********************************************************************************************************)
			
			CNCConfig;
														
			(********************************************************************************************************)
			Config.Output.Monitor.ConfigOk:= TRUE;
			(********************************************************************************************************)
		END_IF


	END_IF

END_PROGRAM

