(************************************************************************************************************************)
(* COPYRIGHT -- Bernecker + Rainer																						*)
(************************************************************************************************************************)
(* Object name: 		HmiKeyControlCyclic																				*)
(* Author:      		B&R																								*)
(* Site:        		Eggelsberg , International Applications                                                       	*)
(* Created:     		February 25, 2009                                                                              	*)
(* Restriction: 		consider task order;								      		                              	*)
(* Description: 		Implementation of the HmiKeyControl													            *)
(*----------------------------------------------------------------------------------------------------------------------*)
(* Version History:		1.00	February 25, 2009																  		*)
(*----------------------------------------------------------------------------------------------------------------------*)
(* Development tool: 	B&R Automation Studio V3.0.80.19 															  	*)
(*----------------------------------------------------------------------------------------------------------------------*)
(* Dependencies: 											                               						       	*)
(************************************************************************************************************************)	
PROGRAM _CYCLIC

	hmiRTInfo(enable := 1);
	cycT := hmiRTInfo.cycle_time / 1000;
	
	
	IF	(HmiGlobal.Address.AxesAddress <> 0) 
		AND	(HmiGlobal.Address.CncAddress <> 0)
		AND	(HmiGlobal.Address.SystemAddress <> 0) 
		AND (HmiGlobal.Address.JogAddress <> 0) 
		AND	(HmiGlobal.Address.RecipeAddress <> 0)
		AND	(HmiGlobal.Address.ErrorAddress <> 0) THEN
		
		pAxes ACCESS HmiGlobal.Address.AxesAddress;
		pCnc ACCESS HmiGlobal.Address.CncAddress;
		pSystem ACCESS HmiGlobal.Address.SystemAddress;
		pJog ACCESS HmiGlobal.Address.JogAddress;
		pRecipe ACCESS HmiGlobal.Address.RecipeAddress;
		pError ACCESS HmiGlobal.Address.ErrorAddress;
			
	ELSE
		RETURN;	
	END_IF	
		
	NumberOfActiveSys := 0;
	
	FOR i:=0 TO MAX_SYS_MINUS_ONE DO
		IF pSystem[i].Input.Configuration.Active THEN
			NumberOfActiveSys  := NumberOfActiveSys + 1;
		END_IF	
	END_FOR;
	
	IF NumberOfActiveSys < MAX_SYS THEN
		RETURN;
	END_IF	

	HmiKeyControlInputs;
	HmiKeyControlPage;
	HmiKeyControlStatus;
	HmiKeyControlStateHandling;
	HmiKeyControlJog;
	HmiKeyControlFeedOverride;
	HmiKeyControlVisuHandling;

	Internal.OldCommand := HmiKeyControl.Input.Command;
		
END_PROGRAM
	
PROGRAM _EXIT
	
	brsmemset(ADR(HmiKeyControl),0,SIZEOF(HmiKeyControl));
		
END_PROGRAM
