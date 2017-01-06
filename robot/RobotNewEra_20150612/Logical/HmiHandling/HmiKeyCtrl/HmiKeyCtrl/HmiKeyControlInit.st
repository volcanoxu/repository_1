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
PROGRAM _INIT
	
	TrfDataAdd := ADR(Robot_TRF);
	
	HmiKeyControl.Components.LayerLogin.Layer.StatusDatapoint := 0;
	HmiKeyControl.Components.LayerButtons.SliderV.Value := 5;
	FOR i:= 0 TO 4 DO
		HmiKeyControl.Components.LayerButtons.Tabs.ButtonsTab[i].StatusDatapoint := 1;
	END_FOR
	HmiKeyControl.Components.LayerButtons.Tabs.TabMaxIndex := 2;
		
	
	HmiKeyControl.Output.Monitor.PosSelect := 0;
	
	HWInfo_01.enable := 1;     (* Function block only executed if ENABLE <> 0 *)
	HWInfo_01.first := 1;     (* Determines the hardware module that the FUNCTION should be applied TO *)
	HWInfo_01.pName := ADR(HWInfo_01_String);
	HWInfo_01();
	HmiKeyControl.Output.Monitor.ModuleType	:= HWInfo_01.module_typ;
	(* To Delete *)
	//	HmiKeyControl.Output.Monitor.ModuleType := ARSIM_PC;
	
END_PROGRAM