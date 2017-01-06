(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * PROGRAM: HmiIOCtrl
 * File: HmiIOCtrl.st
 * Author: renj
 * Created: October 15, 2014
 ********************************************************************
 * Implementation OF PROGRAM HmiIOCtrl
 ********************************************************************)

PROGRAM _INIT

(* init program *)

	StatusIOList := IOList(ADR(pIOInformation));
	IOReadIndex := 0;
	MAX_IO_LINES_MINUS_ONE;
	MAX_LINES_MINUS_ONE;

	DI1;
	DI2;
	DI3;
	DI4;
	DI5;
	
	DO1;
	DO2;
	DO3;
	DO4;
	DO5;
	
END_PROGRAM


PROGRAM _CYCLIC
	
	ModuleDiagnose_1.AdrModuleInformationBuffer := ADR(ModuleInformation);
	ModuleDiagnose_1.Option := DiagnoseOption;
	ModuleDiagnose_1.AdrAlarmInformation := ADR(AlarmInformation);
	ModuleDiagnose_1();

	IF ModuleDiagnose_1.status = 0 THEN
		NumberOfTotalModules := ModuleDiagnose_1.NumberOfTotalModules - ModuleDiagnose_1.NumberNotCheckedModules;
		HmiIOCtrl.Output.Status.DiagnosticsInitDone := TRUE;
	END_IF

	Status := IOStatus(pIOInformation.StartAdrBuffer, ADR(pStatusBuffer), Elements, ADR(pEnableForce), ADR(pForceValue));

	pIOData ACCESS pIOInformation.StartAdrBuffer + (IOReadIndex * SIZEOF(pIOData));
	Elements := pIOInformation.TotalIONumber;

	IF  (ModuleInformation[0].ModuleName = '1A4600.10') OR
		(ModuleInformation[0].ModuleName = '1A4600.10-2') OR
		(ModuleInformation[0].ModuleName = '5PC810.SX01-00-AR010') OR
		(ModuleInformation[0].ModuleName = '5PC810.SX02-00-AR010') OR
		(ModuleInformation[0].ModuleName = '5PC810.SX05-00-AR010') OR
		(ModuleInformation[0].ModuleName = '5PC820.SX01-00-AR010') OR
		(ModuleInformation[0].ModuleName = '5PC820.SX01-01-AR010') OR 
		(ModuleInformation[0].ModuleName = '1A4000.00') (*OR
		(ModuleInformation[0].ModuleName = 'X20CP1484-1') *)THEN
	
		HmiIOCtrl.Output.Status.SimulationActive := TRUE;
	
	ELSE

		HmiIOCtrl.Output.Status.SimulationActive := FALSE;

	END_IF
	
	IF HmiGlobal.PageControl.ActPage = PAGE_SERVICE_DIAGNOSTICS THEN
		
		DiagRTInfo.enable := 1;
		DiagRTInfo();
		
		cycT := DiagRTInfo.cycle_time / 1000;
		
		CASE Step OF

			INIT:

				(* Initialize the list of modules *)
				HmiIOCtrl.Output.Status.ModuleInfoLayerStatus := 0;
				HmiIOCtrl.Output.Status.IOInfoLayerStatus := 1;
			
				brsmemset(ADR(HmiIOCtrl.Output.ModuleInfo), 0, SIZEOF(HmiIOCtrl.Output.ModuleInfo));
				
				IF NumberOfTotalModules > MAX_LINES THEN
					EndIndex := MAX_LINES-1;
				ELSIF NumberOfTotalModules <= MAX_LINES AND NumberOfTotalModules > 0 THEN
					EndIndex := NumberOfTotalModules-1;
				ELSIF NumberOfTotalModules = 0 THEN
					EndIndex := 0;
				END_IF

				FOR Index := 0 TO EndIndex DO
					
					brsmemcpy(ADR(HmiIOCtrl.Output.ModuleInfo.ModuleName[Index]), ADR(ModuleInformation[Index].ModuleName), SIZEOF(HmiIOCtrl.Output.ModuleInfo.ModuleName[Index]));
					brsmemcpy(ADR(HmiIOCtrl.Output.ModuleInfo.ModulePath[Index]), ADR(ModuleInformation[Index].ModulePath), SIZEOF(HmiIOCtrl.Output.ModuleInfo.ModulePath[Index]));
					brsmemcpy(ADR(HmiIOCtrl.Output.ModuleInfo.ErrorModuleName[Index]), ADR(ModuleInformation[Index].ErrorModuleName), SIZEOF(HmiIOCtrl.Output.ModuleInfo.ErrorModuleName[Index]));
					
					HmiIOCtrl.Output.ModuleInfo.ModuleState[Index] := ModuleInformation[Index].ModuleState;
					
					IF (HmiIOCtrl.Output.ModuleInfo.ModuleState[Index] = 4) THEN
						HmiIOCtrl.Output.ModuleInfo.WrongModulStatus[Index] := 0;
					ELSE
						HmiIOCtrl.Output.ModuleInfo.WrongModulStatus[Index] := 1;
					END_IF
					
				END_FOR

				(* Color data point for the cursor of the module list*)
				ColorOld := WHITE;
				HmiIOCtrl.Output.ModuleInfo.Color[0] := ORANGE;
				
				SelectedIndex := 0;
				SelectedModuleIndex := 0;
				
				FOR Index:= 2 TO (MAX_LINES-1) BY 2 DO
					HmiIOCtrl.Output.ModuleInfo.Color[Index] := WHITE;
				END_FOR

				FOR Index := 1 TO (MAX_LINES-1) BY 2 DO
					HmiIOCtrl.Output.ModuleInfo.Color[Index] := GREY;
				END_FOR

				StartIndex:= 0;
				(* I/O layer invisible at startup*)
				HmiIOCtrl.Output.Status.StatusLayerMessage := 1;
		
				Step:= COMMAND;

			COMMAND:

				(** Wait for commands set from the visualization ****)
				IF NumberOfTotalModules <> NumberOfTotalModulesOld THEN
					NumberOfTotalModulesOld := NumberOfTotalModules;
					Step := INIT;
				END_IF
			
				HmiIOCtrl.Output.Status.PageFocusColor := BLACK_WHITE;

				IF HmiIOCtrl.Input.Command.InfoLineDown > Internal.OldCommand.InfoLineDown THEN
					IF (SelectedIndex < (MAX_LINES-1)) AND (SelectedIndex < (NumberOfTotalModules-1)) AND (NumberOfTotalModules > 0) THEN
				
						HmiIOCtrl.Output.ModuleInfo.Color[SelectedIndex] := ColorOld;
						SelectedIndex := SelectedIndex +1;
						SelectedModuleIndex := SelectedModuleIndex + 1;
						ColorOld := HmiIOCtrl.Output.ModuleInfo.Color[SelectedIndex];
						HmiIOCtrl.Output.ModuleInfo.Color[SelectedIndex] := ORANGE;
				
					ELSIF (SelectedModuleIndex < (NumberOfTotalModules-1)) AND (SelectedIndex >= (MAX_LINES-1)) THEN
						
						SelectedModuleIndex := SelectedModuleIndex + 1;
						StartIndex := SelectedModuleIndex-MAX_LINES+1;
						EndIndex := StartIndex+MAX_LINES-1;
						IF (EndIndex > (NumberOfTotalModules-1)) THEN
							EndIndex := NumberOfTotalModules-1;
						END_IF
						
						Step := UPDATE_LIST;
				
					END_IF

				ELSIF HmiIOCtrl.Input.Command.InfoLineUp > Internal.OldCommand.InfoLineUp THEN
			
					IF (SelectedIndex = 0) AND (SelectedModuleIndex > 0) THEN
			
						SelectedModuleIndex := SelectedModuleIndex - 1;
						StartIndex := SelectedModuleIndex;
						EndIndex := SelectedModuleIndex+MAX_LINES-1;
						Step := UPDATE_LIST;
			
					ELSIF (SelectedIndex > 0) THEN
			
						HmiIOCtrl.Output.ModuleInfo.Color[SelectedIndex] := ColorOld;
						SelectedIndex := SelectedIndex - 1;
						SelectedModuleIndex := SelectedModuleIndex - 1;
						ColorOld := HmiIOCtrl.Output.ModuleInfo.Color[SelectedIndex];
						HmiIOCtrl.Output.ModuleInfo.Color[SelectedIndex] := ORANGE;
			
					END_IF
					(* Update all lists after 1s*)
				ELSIF (UpdateCounter <= 1000) THEN
					UpdateCounter := UpdateCounter + cycT;
				ELSIF (UpdateCounter > 1000) THEN
					UpdateCounter := 0;
					Step := UPDATE_LIST;
				END_IF


				(* The I/O layer is displayed if I/Os are configured on this module, otherwise a warning will be displayed*)
				IF HmiIOCtrl.Input.Command.Enter > Internal.OldCommand.Enter THEN
					DetailsAvailable := 0;
					IF (pIOInformation.StartAdrBuffer <> 0) THEN
						EndValue := UINT_TO_USINT(pIOInformation.TotalIONumber)-1;
						FOR IOStartIndex := 0 TO EndValue DO
							IOReadIndex := IOStartIndex;
							pIOData ACCESS pIOInformation.StartAdrBuffer + (IOReadIndex * SIZEOF(pIOData));
							Equal := brsstrcmp(ADR(ModuleInformation[SelectedModuleIndex].ModulePath), ADR(pIOData.Device));
							IF (Equal = 0) THEN
								DetailsAvailable := 1;
								HmiIOCtrl.Output.Status.ModuleInfoLayerStatus := 1;
								HmiIOCtrl.Output.Status.IOInfoLayerStatus := 0;
						
								EXIT;
							
							END_IF
						END_FOR
						Step := IO_INIT;
				
					ELSE
						HmiIOCtrl.Output.Status.StatusLayerMessage := 0;
						Step:= WAIT_FOR_ACKNOWLEDGE;
					END_IF
				END_IF

			WAIT_FOR_ACKNOWLEDGE:
			
				IF HmiIOCtrl.Input.Command.DiscardChange > Internal.OldCommand.DiscardChange THEN
					
					HmiIOCtrl.Output.Status.StatusLayerMessage := 1;
					Step := COMMAND;
				
				END_IF

			UPDATE_LIST:

				(* Update the list of modules*)
				LineIndex:= 0;
				
				FOR Index:= StartIndex TO EndIndex DO
					brsmemcpy(ADR(HmiIOCtrl.Output.ModuleInfo.ModuleName[LineIndex]), ADR(ModuleInformation[Index].ModuleName), SIZEOF(HmiIOCtrl.Output.ModuleInfo.ModuleName[LineIndex]));
					brsmemcpy(ADR(HmiIOCtrl.Output.ModuleInfo.ModulePath[LineIndex]), ADR(ModuleInformation[Index].ModulePath), SIZEOF(HmiIOCtrl.Output.ModuleInfo.ModulePath[LineIndex]));
					brsmemcpy(ADR(HmiIOCtrl.Output.ModuleInfo.ErrorModuleName[LineIndex]), ADR(ModuleInformation[Index].ErrorModuleName), SIZEOF(HmiIOCtrl.Output.ModuleInfo.ErrorModuleName[LineIndex]));
					HmiIOCtrl.Output.ModuleInfo.ModuleState[LineIndex] := ModuleInformation[Index].ModuleState;
					IF (HmiIOCtrl.Output.ModuleInfo.ModuleState[LineIndex] = 4) THEN
						HmiIOCtrl.Output.ModuleInfo.WrongModulStatus[LineIndex] := 0;
					ELSE
						HmiIOCtrl.Output.ModuleInfo.WrongModulStatus[LineIndex] := 1;
					END_IF
					LineIndex := LineIndex + 1;
				END_FOR
				
				
				Step := COMMAND;


			(********************************************************************************************************************************************************)
			(*							IO Handling Layer																											*)
			(********************************************************************************************************************************************************)

			IO_INIT:

				(*Initialize the I/O list*)
				brsmemset(ADR(HmiIOCtrl.Output.IOInfo), 0, SIZEOF(HmiIOCtrl.Output.IOInfo));
				brsmemset(ADR(IOIndexArray), 0, SIZEOF(IOIndexArray));
				NumberIO := 0;
				EndValue := UINT_TO_USINT(pIOInformation.TotalIONumber)-1;

				LineIndex := 0;
				FOR Index := IOStartIndex TO EndValue DO
					IOReadIndex := Index;
					pIOData ACCESS pIOInformation.StartAdrBuffer + (IOReadIndex * SIZEOF(pIOData));
					Equal := brsstrcmp(ADR(ModuleInformation[SelectedModuleIndex].ModulePath), ADR(pIOData.Device));
					IF (Equal = 0) THEN
						IF (LineIndex < MAX_IO_LINES) THEN
							brsmemcpy(ADR(HmiIOCtrl.Output.IOInfo.PVName[LineIndex]), ADR(pIOData.PVName), SIZEOF(HmiIOCtrl.Output.IOInfo.PVName[LineIndex]));
							brsmemcpy(ADR(HmiIOCtrl.Output.IOInfo.LogicalName[LineIndex]), ADR(pIOData.LogicalName), SIZEOF(HmiIOCtrl.Output.IOInfo.LogicalName[LineIndex]));
							HmiIOCtrl.Output.IOInfo.DiagnosicsType[LineIndex] := pStatusBuffer[Index].DataType;
							HmiIOCtrl.Output.IOInfo.ActValue[LineIndex] := pStatusBuffer[Index].ActValue;
							HmiIOCtrl.Output.IOInfo.ForceValue[LineIndex] := pForceValue[Index];
							HmiIOCtrl.Output.IOInfo.EnableForcing[LineIndex] := pEnableForce[Index];
							HmiIOCtrl.Output.IOInfo.InivisibleLines[LineIndex] := 0;
							IOIndexArray[LineIndex] := Index;
							(* Set min and max value of the numeric input fields *)
							CASE HmiIOCtrl.Output.IOInfo.DiagnosicsType[LineIndex] OF

								1:(*BOOL*)
									HmiIOCtrl.Output.IOInfo.MinValue[LineIndex] := MIN_VALUE_BOOL;
									HmiIOCtrl.Output.IOInfo.MaxValue[LineIndex] := MAX_VALUE_BOOL;

								2:(*SINT*)
									HmiIOCtrl.Output.IOInfo.MinValue[LineIndex] := MIN_VALUE_SINT;
									HmiIOCtrl.Output.IOInfo.MaxValue[LineIndex] := MAX_VALUE_SINT;

								3:(*INT*)
									HmiIOCtrl.Output.IOInfo.MinValue[LineIndex] := MIN_VALUE_INT;
									HmiIOCtrl.Output.IOInfo.MaxValue[LineIndex] := MAX_VALUE_INT;

								4:(*DINT*)
									HmiIOCtrl.Output.IOInfo.MinValue[LineIndex] := MIN_VALUE_DINT;
									HmiIOCtrl.Output.IOInfo.MaxValue[LineIndex] := MAX_VALUE_DINT;

								5:(*USINT*)
									HmiIOCtrl.Output.IOInfo.MinValue[LineIndex] := MIN_VALUE_USINT;
									HmiIOCtrl.Output.IOInfo.MaxValue[LineIndex] := MAX_VALUE_USINT;

								6:(*UINT*)
									HmiIOCtrl.Output.IOInfo.MinValue[LineIndex] := MIN_VALUE_UINT;
									HmiIOCtrl.Output.IOInfo.MaxValue[LineIndex] := MAX_VALUE_UINT;

								7:(*UDINT*)
									HmiIOCtrl.Output.IOInfo.MinValue[LineIndex] := MIN_VALUE_UDINT;
									HmiIOCtrl.Output.IOInfo.MaxValue[LineIndex] := MAX_VALUE_UDINT;

							END_CASE

							LineIndex := LineIndex+1;

						END_IF

						NumberIO := NumberIO+1;

					ELSE
						EXIT;
					END_IF
				END_FOR


				brsmemcpy(ADR(HmiIOCtrl.Output.IOInfo.ModuleName), ADR(ModuleInformation[SelectedModuleIndex].ModuleName), SIZEOF(HmiIOCtrl.Output.IOInfo.ModuleName));
				brsmemcpy(ADR(HmiIOCtrl.Output.IOInfo.ModulePath), ADR(ModuleInformation[SelectedModuleIndex].ModulePath), SIZEOF(HmiIOCtrl.Output.IOInfo.ModulePath));
				HmiIOCtrl.Output.IOInfo.ModuleStatus := ModuleInformation[SelectedModuleIndex].ModuleState;

				IF (LineIndex < (MAX_IO_LINES-1)) THEN
					FOR InvisibleIndex := LineIndex TO (MAX_IO_LINES-1) DO
						HmiIOCtrl.Output.IOInfo.InivisibleLines[InvisibleIndex]:= 1;
					END_FOR
				END_IF

				(*Color of the cursor of the I/O list*)
				ColorOld := WHITE;
				ColorNumericOld := NUMERIC_WHITE;
				HmiIOCtrl.Output.IOInfo.Color[0] := ORANGE;
				HmiIOCtrl.Output.IOInfo.NumericColor[0] := NUMERIC_ORANGE;
				SelectedLineIndex := 0;
				SelectedIOIndex := IOStartIndex;
				FOR Index:= 2 TO (MAX_IO_LINES-1) BY 2 DO
					HmiIOCtrl.Output.IOInfo.Color[Index] := WHITE;
					HmiIOCtrl.Output.IOInfo.NumericColor[Index] := NUMERIC_WHITE;
				END_FOR

				FOR Index:= 1 TO (MAX_IO_LINES-1) BY 2 DO
					HmiIOCtrl.Output.IOInfo.Color[Index] := GREY;
					HmiIOCtrl.Output.IOInfo.NumericColor[Index] := NUMERIC_GREY;
				END_FOR

				HmiIOCtrl.Output.Status.IOInfoLayerStatus := 0;
				HmiIOCtrl.Output.Status.ModuleInfoLayerStatus := 1;
				StartIndex := IOStartIndex;
				IF (NumberIO = 1) THEN
					EndIndex := StartIndex;			
				ELSIF (NumberIO < MAX_IO_LINES-1) THEN
					EndIndex:= IOStartIndex+NumberIO-1;
				ELSE
					EndIndex:= StartIndex+MAX_IO_LINES-1;
				END_IF

				HmiIOCtrl.Output.Status.StatusLayerMessage := 1;

				pv_adr := 0;	
				Step := IO_GETADDR;
			
			IO_GETADDR:
				
				IF (EndIndex>StartIndex) AND (StartIndex<pIOInformation.TotalIONumber) THEN
					
					status_adr := PV_xgetadr(ADR(HmiIOCtrl.Output.IOInfo.PVName[0]), ADR(pv_adr), ADR(data_len));
					
					IF 	status_adr = 0 AND pv_adr <> 0 THEN
					 
						HmiIOCtrl.Output.IOInfo.SelectedIO.ForceValue := HmiIOCtrl.Output.IOInfo.ForceValue[0];
						brsmemcpy(ADR(HmiIOCtrl.Output.IOInfo.SelectedIO.LogicalName), ADR(HmiIOCtrl.Output.IOInfo.LogicalName[0]), SIZEOF(HmiIOCtrl.Output.IOInfo.SelectedIO.LogicalName));
						brsmemcpy(ADR(HmiIOCtrl.Output.IOInfo.SelectedIO.PVName), ADR(HmiIOCtrl.Output.IOInfo.PVName[0]), SIZEOF(HmiIOCtrl.Output.IOInfo.SelectedIO.PVName));
						HmiIOCtrl.Output.IOInfo.SelectedIO.MinValue := HmiIOCtrl.Output.IOInfo.MinValue[0];
						HmiIOCtrl.Output.IOInfo.SelectedIO.MaxValue := HmiIOCtrl.Output.IOInfo.MaxValue[0];
						
						Step := IO_COMMAND;
						
					END_IF
					
				ELSE
				
					HmiIOCtrl.Output.IOInfo.SelectedIO.ForceValue := HmiIOCtrl.Output.IOInfo.ForceValue[0];
					brsmemcpy(ADR(HmiIOCtrl.Output.IOInfo.SelectedIO.LogicalName), ADR(HmiIOCtrl.Output.IOInfo.LogicalName[0]), SIZEOF(HmiIOCtrl.Output.IOInfo.SelectedIO.LogicalName));
					brsmemcpy(ADR(HmiIOCtrl.Output.IOInfo.SelectedIO.PVName), ADR(HmiIOCtrl.Output.IOInfo.PVName[0]), SIZEOF(HmiIOCtrl.Output.IOInfo.SelectedIO.PVName));
					HmiIOCtrl.Output.IOInfo.SelectedIO.MinValue := HmiIOCtrl.Output.IOInfo.MinValue[0];
					HmiIOCtrl.Output.IOInfo.SelectedIO.MaxValue := HmiIOCtrl.Output.IOInfo.MaxValue[0];
					
					Step := IO_COMMAND;
					
				END_IF
			
			IO_COMMAND:

				IF HmiIOCtrl.Input.Command.DiscardChange > Internal.OldCommand.DiscardChange THEN
					
					HmiIOCtrl.Output.Status.ModuleInfoLayerStatus := 0;
					HmiIOCtrl.Output.Status.IOInfoLayerStatus := 1;
					Step := INIT;
					
				ELSIF HmiIOCtrl.Input.Command.ForcingOn > Internal.OldCommand.ForcingOn THEN
					
					HmiIOCtrl.Output.IOInfo.EnableForcing[SelectedLineIndex] := 1;
					pEnableForce[SelectedIOIndex] := 1;
					HmiIOCtrl.Output.Status.IOForced := 0;
					
					FOR ResetIndex:= 0 TO (UINT_TO_USINT(Elements)-1) DO
						IF (pEnableForce[ResetIndex] = 1)THEN
							HmiIOCtrl.Output.Status.IOForced := 1;	
						END_IF
					END_FOR
					
					Step := ENABLE_FORCE;
					
				ELSIF HmiIOCtrl.Input.Command.ForcingOff > Internal.OldCommand.ForcingOff THEN
					
					HmiIOCtrl.Output.IOInfo.EnableForcing[SelectedLineIndex] := 0;
					pEnableForce[SelectedIOIndex] := 0;
					HmiIOCtrl.Output.Status.IOForced := 0;
					
					FOR ResetIndex:= 0 TO (UINT_TO_USINT(Elements)-1) DO
						IF (pEnableForce[ResetIndex] = 1)THEN
							HmiIOCtrl.Output.Status.IOForced := 1;	
						END_IF
					END_FOR
					
					Step:= DISABLE_FORCE;
					
				ELSIF HmiIOCtrl.Input.Command.ForcingAllOff > Internal.OldCommand.ForcingAllOff THEN
					
					FOR ResetIndex := 0 TO (UINT_TO_USINT(Elements)-1) DO
						pEnableForce[ResetIndex]:= 0;
					END_FOR
					HmiIOCtrl.Output.Status.IOForced := 0;
					Step := UPDATE_IO_LIST;
					
				ELSIF HmiIOCtrl.Input.Command.InfoLineDown > Internal.OldCommand.InfoLineDown THEN
				
					IF (SelectedLineIndex < (MAX_IO_LINES-1)) AND (SelectedLineIndex < (NumberIO-1)) AND (NumberIO > 0) THEN
				
						HmiIOCtrl.Output.IOInfo.Color[SelectedLineIndex] := ColorOld;
						HmiIOCtrl.Output.IOInfo.NumericColor[SelectedLineIndex] := ColorNumericOld;
						SelectedLineIndex := SelectedLineIndex +1;
						SelectedIOIndex := SelectedIOIndex + 1;
						ColorOld := HmiIOCtrl.Output.IOInfo.Color[SelectedLineIndex];
						HmiIOCtrl.Output.IOInfo.Color[SelectedLineIndex] := ORANGE;
						ColorNumericOld := HmiIOCtrl.Output.IOInfo.NumericColor[SelectedLineIndex];
						HmiIOCtrl.Output.IOInfo.NumericColor[SelectedLineIndex] := NUMERIC_ORANGE;
					
					ELSIF ((SelectedIOIndex-StartIndex) < (NumberIO-1)) AND (SelectedLineIndex >= (MAX_IO_LINES-1)) THEN
						
						IF ((SelectedIOIndex-IOStartIndex) < (NumberIO-1)) THEN
							SelectedIOIndex := SelectedIOIndex + 1;
							StartIndex := SelectedIOIndex-MAX_IO_LINES+1;
							EndIndex := StartIndex+MAX_IO_LINES-1;
							IF (EndIndex > (NumberIO-1+IOStartIndex)) THEN
								EndIndex := NumberIO-1;
							END_IF
						
							Step := UPDATE_IO_LIST;
							
						END_IF
						
					END_IF
					
					HmiIOCtrl.Output.IOInfo.SelectedIO.ForceValue := HmiIOCtrl.Output.IOInfo.ForceValue[SelectedLineIndex];
					brsmemcpy(ADR(HmiIOCtrl.Output.IOInfo.SelectedIO.LogicalName), ADR(HmiIOCtrl.Output.IOInfo.LogicalName[SelectedLineIndex]), SIZEOF(HmiIOCtrl.Output.IOInfo.SelectedIO.LogicalName));
					brsmemcpy(ADR(HmiIOCtrl.Output.IOInfo.SelectedIO.PVName), ADR(HmiIOCtrl.Output.IOInfo.PVName[SelectedLineIndex]), SIZEOF(HmiIOCtrl.Output.IOInfo.SelectedIO.PVName));
					HmiIOCtrl.Output.IOInfo.SelectedIO.MinValue := HmiIOCtrl.Output.IOInfo.MinValue[SelectedLineIndex];
					HmiIOCtrl.Output.IOInfo.SelectedIO.MaxValue := HmiIOCtrl.Output.IOInfo.MaxValue[SelectedLineIndex];

				ELSIF HmiIOCtrl.Input.Command.InfoLineUp > Internal.OldCommand.InfoLineUp THEN
				
					IF (SelectedLineIndex = 0) AND (SelectedIOIndex > IOStartIndex) THEN
					
						SelectedIOIndex := SelectedIOIndex - 1;
						StartIndex := SelectedIOIndex;
						EndIndex := SelectedIOIndex+MAX_IO_LINES-1;
						Step:= UPDATE_IO_LIST;
					
					ELSIF (SelectedLineIndex > 0) THEN
						
						HmiIOCtrl.Output.IOInfo.Color[SelectedLineIndex] := ColorOld;
						HmiIOCtrl.Output.IOInfo.NumericColor[SelectedLineIndex] := ColorNumericOld;
						SelectedLineIndex := SelectedLineIndex - 1;
						SelectedIOIndex := SelectedIOIndex - 1;
						ColorOld := HmiIOCtrl.Output.IOInfo.Color[SelectedLineIndex];
						HmiIOCtrl.Output.IOInfo.Color[SelectedLineIndex] := ORANGE;
						ColorNumericOld := HmiIOCtrl.Output.IOInfo.NumericColor[SelectedLineIndex];
						HmiIOCtrl.Output.IOInfo.NumericColor[SelectedLineIndex] := NUMERIC_ORANGE;
						
					END_IF
					
					HmiIOCtrl.Output.IOInfo.SelectedIO.ForceValue := HmiIOCtrl.Output.IOInfo.ForceValue[SelectedLineIndex];
					brsmemcpy(ADR(HmiIOCtrl.Output.IOInfo.SelectedIO.LogicalName), ADR(HmiIOCtrl.Output.IOInfo.LogicalName[SelectedLineIndex]), SIZEOF(HmiIOCtrl.Output.IOInfo.SelectedIO.LogicalName));
					brsmemcpy(ADR(HmiIOCtrl.Output.IOInfo.SelectedIO.PVName), ADR(HmiIOCtrl.Output.IOInfo.PVName[SelectedLineIndex]), SIZEOF(HmiIOCtrl.Output.IOInfo.SelectedIO.PVName));
					HmiIOCtrl.Output.IOInfo.SelectedIO.MinValue := HmiIOCtrl.Output.IOInfo.MinValue[SelectedLineIndex];
					HmiIOCtrl.Output.IOInfo.SelectedIO.MaxValue := HmiIOCtrl.Output.IOInfo.MaxValue[SelectedLineIndex];
			
				ELSIF HmiIOCtrl.Input.Command.PageDown > Internal.OldCommand.PageDown THEN
					
					FOR Index := SelectedModuleIndex+1 TO NumberOfTotalModules-1 DO
						
						IF (brsstrcmp(ADR(ModuleInformation[Index].ModuleName), ADR('X20DI9371')) = 0) OR
							(brsstrcmp(ADR(ModuleInformation[Index].ModuleName), ADR('X20DO9322')) = 0) THEN
							
							SelectedModuleIndex :=Index;
							Step := PAGE_CHANGE;
							
							EXIT;
						END_IF
						
					END_FOR
					
				ELSIF HmiIOCtrl.Input.Command.PageUp > Internal.OldCommand.PageUp THEN
				
					FOR Index := SelectedModuleIndex-1 TO 1 BY -1 DO
					
						IF (brsstrcmp(ADR(ModuleInformation[Index].ModuleName), ADR('X20DI9371')) = 0) OR
							(brsstrcmp(ADR(ModuleInformation[Index].ModuleName), ADR('X20DO9322')) = 0) THEN
							
							SelectedModuleIndex := Index;
							Step := PAGE_CHANGE;
							
							EXIT;
						END_IF
					END_FOR

				ELSIF HmiIOCtrl.Input.Command.SetValue THEN
				
					HmiIOCtrl.Input.Command.SetValue := 0;
					
					HmiIOCtrl.Output.IOInfo.ForceValue[SelectedLineIndex] := HmiIOCtrl.Output.IOInfo.SelectedIO.ForceValue;
					pForceValue[SelectedIOIndex] := HmiIOCtrl.Output.IOInfo.SelectedIO.ForceValue;
				
					IF (HmiIOCtrl.Output.IOInfo.EnableForcing[SelectedLineIndex] = 1) THEN
						Step := UPDATE_FORCE_VALUE;
					END_IF
			
				ELSIF (UpdateIOCounter <= 1000) THEN
					UpdateIOCounter := UpdateIOCounter + cycT;
				ELSIF (UpdateIOCounter > 1000) THEN
					UpdateIOCounter := 0;
					Step := UPDATE_IO_LIST;
				END_IF
	
				HmiIOCtrl.Output.IOInfo.ModuleStatus := ModuleInformation[SelectedModuleIndex].ModuleState;	
		
			ENABLE_FORCE:
				
				IF (HmiIOCtrl.Output.IOInfo.EnableForcing[SelectedLineIndex] = 1) THEN
				
					IF (brsstrcmp(ADR(ModuleInformation[SelectedModuleIndex].ModuleName), ADR('X20DI9371')) = 0) THEN
						brsstrcpy(ADR(PointData),ADR('%IX.'));
					ELSIF (brsstrcmp(ADR(ModuleInformation[SelectedModuleIndex].ModuleName), ADR('X20DO9322')) = 0) THEN
						brsstrcpy(ADR(PointData),ADR('%QX.'));
					END_IF
				
					brsstrcat(ADR(PointData), ADR(HmiIOCtrl.Output.IOInfo.ModulePath));
					brsstrcat(ADR(PointData), ADR('.'));
					brsstrcat(ADR(PointData), ADR(HmiIOCtrl.Output.IOInfo.LogicalName[SelectedLineIndex]));
					
						
					IODPEnableForce.enable := 1;
					IODPEnableForce.pDatapoint := ADR(PointData);
				
					IODPEnableForce();
													
					IF(IODPEnableForce.status = 0)THEN
						Step := UPDATE_FORCE_VALUE;
					ELSIF(IODPEnableForce.status <> 65535) THEN
						Step := IO_COMMAND;
					END_IF
				ELSE
					Step := IO_COMMAND;
				END_IF
						
			DISABLE_FORCE:
				
				IF (brsstrcmp(ADR(ModuleInformation[SelectedModuleIndex].ModuleName), ADR('X20DI9371')) = 0)THEN
					brsstrcpy(ADR(PointData), ADR('%IX.'));
				ELSIF (brsstrcmp(ADR(ModuleInformation[SelectedModuleIndex].ModuleName),ADR('X20DO9322')) = 0)THEN
					brsstrcpy(ADR(PointData), ADR('%QX.'));
				END_IF
				
				brsstrcat(ADR(PointData), ADR(HmiIOCtrl.Output.IOInfo.ModulePath));
				brsstrcat(ADR(PointData), ADR('.'));
				brsstrcat(ADR(PointData), ADR(HmiIOCtrl.Output.IOInfo.LogicalName[SelectedLineIndex]));
				
				IODPDisableForce.enable := 1;
			
				IODPDisableForce.pDatapoint :=  ADR(PointData);
			
				IODPDisableForce();
			
				IF(IODPDisableForce.status = 0)	THEN	
					Step := IO_COMMAND;
				ELSIF (IODPDisableForce.status <> 65535)THEN
					Step := IO_COMMAND;
				END_IF
			
			UPDATE_FORCE_VALUE:
				
				IF (HmiIOCtrl.Output.IOInfo.EnableForcing[SelectedLineIndex]=1)THEN
				
					IF (brsstrcmp(ADR(ModuleInformation[SelectedModuleIndex].ModuleName), ADR('X20DI9371')) = 0) THEN
						brsstrcpy(ADR(PointData), ADR('%IX.'));
					ELSIF (brsstrcmp(ADR(ModuleInformation[SelectedModuleIndex].ModuleName),ADR('X20DO9322')) = 0) THEN
						brsstrcpy(ADR(PointData), ADR('%QX.'));
					END_IF
					
					brsstrcat(ADR(PointData), ADR(HmiIOCtrl.Output.IOInfo.ModulePath));
					brsstrcat(ADR(PointData), ADR('.'));
					brsstrcat(ADR(PointData), ADR(HmiIOCtrl.Output.IOInfo.LogicalName[SelectedLineIndex]));
					
						
					IODPSetForceValue.enable := 1;
										
					IODPSetForceValue.pDatapoint :=  ADR(PointData);
	
					IODPSetForceValue.value := pForceValue[SelectedIOIndex];
			
					IODPSetForceValue();
				
					IF(IODPSetForceValue.status = 0)THEN
						Step := IO_COMMAND;
					ELSIF(IODPSetForceValue.status <> 65535) THEN
						Step := IO_COMMAND;
					END_IF
				ELSE
					Step := IO_COMMAND;
				END_IF
			
			PAGE_CHANGE:
				
				DetailsAvailable := 0;
				
				IF (pIOInformation.StartAdrBuffer <> 0) THEN
					
					EndValue := UINT_TO_USINT(pIOInformation.TotalIONumber)-1;
					
					FOR IOStartIndex := 0 TO EndValue DO
						
						IOReadIndex := IOStartIndex;
						pIOData ACCESS pIOInformation.StartAdrBuffer + (IOReadIndex * SIZEOF(pIOData));
						Equal := brsstrcmp(ADR(ModuleInformation[SelectedModuleIndex].ModulePath), ADR(pIOData.Device));
						
						IF (Equal = 0) THEN
						
							DetailsAvailable := 1;
							HmiIOCtrl.Output.Status.ModuleInfoLayerStatus := 1;
							HmiIOCtrl.Output.Status.IOInfoLayerStatus := 0;
							Step := IO_INIT;
							EXIT;
						
						ELSE
						
							Step := IO_INIT;
						
						END_IF
						
					END_FOR
					
				ELSE
					
					Step := IO_INIT;
				
				END_IF
			
			CHANGE_FORCE_VALUE:
			
				HmiIOCtrl.Output.IOInfo.SelectedIO.Status := 0;
			
				HmiIOCtrl.Output.Status.PageFocusColor := WHITE_ORANGE;;
			
				IF HmiIOCtrl.Input.Command.SetValue THEN
				
					HmiIOCtrl.Input.Command.SetValue := 0;
				
					HmiIOCtrl.Output.IOInfo.ForceValue[SelectedLineIndex] := HmiIOCtrl.Output.IOInfo.SelectedIO.ForceValue;
					HmiIOCtrl.Output.IOInfo.SelectedIO.Status := 2;
					pForceValue[SelectedIOIndex] := HmiIOCtrl.Output.IOInfo.SelectedIO.ForceValue;
			
					Step := IO_COMMAND;
				
				ELSIF HmiIOCtrl.Input.Command.DiscardChange > Internal.OldCommand.DiscardChange THEN
					
					HmiIOCtrl.Output.IOInfo.SelectedIO.Status := 2;
					
					Step:= IO_COMMAND;
					
				END_IF
		
		
			UPDATE_IO_LIST:

				(*Update the I/O list entries*)
				LineIndex := 0;
			
				FOR Index := StartIndex TO EndIndex DO
					
					IOReadIndex := Index;
					pIOData ACCESS pIOInformation.StartAdrBuffer + (IOReadIndex * SIZEOF(pIOData));
					brsmemcpy(ADR(HmiIOCtrl.Output.IOInfo.PVName[LineIndex]), ADR(pIOData.PVName), SIZEOF(HmiIOCtrl.Output.IOInfo.PVName[LineIndex]));
					brsmemcpy(ADR(HmiIOCtrl.Output.IOInfo.LogicalName[LineIndex]), ADR(pIOData.LogicalName), SIZEOF(HmiIOCtrl.Output.IOInfo.LogicalName[LineIndex]));
					
					HmiIOCtrl.Output.IOInfo.DiagnosicsType[LineIndex] := pStatusBuffer[Index].DataType;
					HmiIOCtrl.Output.IOInfo.ActValue[LineIndex] := pStatusBuffer[Index].ActValue;
					HmiIOCtrl.Output.IOInfo.ForceValue[LineIndex] := pForceValue[Index];
					HmiIOCtrl.Output.IOInfo.EnableForcing[LineIndex] := pEnableForce[Index];
					HmiIOCtrl.Output.IOInfo.InivisibleLines[LineIndex] := 0;
					IOIndexArray[LineIndex] := Index;
					
					CASE HmiIOCtrl.Output.IOInfo.DiagnosicsType[LineIndex] OF

						1:(*BOOL*)
							HmiIOCtrl.Output.IOInfo.MinValue[LineIndex] := MIN_VALUE_BOOL;
							HmiIOCtrl.Output.IOInfo.MaxValue[LineIndex] := MAX_VALUE_BOOL;

						2:(*SINT*)
							HmiIOCtrl.Output.IOInfo.MinValue[LineIndex] := MIN_VALUE_SINT;
							HmiIOCtrl.Output.IOInfo.MaxValue[LineIndex] := MAX_VALUE_SINT;

						3:(*INT*)
							HmiIOCtrl.Output.IOInfo.MinValue[LineIndex] := MIN_VALUE_INT;
							HmiIOCtrl.Output.IOInfo.MaxValue[LineIndex] := MAX_VALUE_INT;

						4:(*DINT*)
							HmiIOCtrl.Output.IOInfo.MinValue[LineIndex] := MIN_VALUE_DINT;
							HmiIOCtrl.Output.IOInfo.MaxValue[LineIndex] := MAX_VALUE_DINT;

						5:(*USINT*)
							HmiIOCtrl.Output.IOInfo.MinValue[LineIndex] := MIN_VALUE_USINT;
							HmiIOCtrl.Output.IOInfo.MaxValue[LineIndex] := MAX_VALUE_USINT;

						6:(*UINT*)
							HmiIOCtrl.Output.IOInfo.MinValue[LineIndex] := MIN_VALUE_UINT;
							HmiIOCtrl.Output.IOInfo.MaxValue[LineIndex] := MAX_VALUE_UINT;

						7:(*UDINT*)
							HmiIOCtrl.Output.IOInfo.MinValue[LineIndex] := MIN_VALUE_UDINT;
							HmiIOCtrl.Output.IOInfo.MaxValue[LineIndex] := MAX_VALUE_UDINT;

					END_CASE
					
					LineIndex := LineIndex + 1;
					
				END_FOR
				
				HmiIOCtrl.Output.IOInfo.SelectedIO.ForceValue := HmiIOCtrl.Output.IOInfo.ForceValue[SelectedLineIndex];
				brsmemcpy(ADR(HmiIOCtrl.Output.IOInfo.SelectedIO.LogicalName), ADR(HmiIOCtrl.Output.IOInfo.LogicalName[SelectedLineIndex]), SIZEOF(HmiIOCtrl.Output.IOInfo.SelectedIO.LogicalName));
				brsmemcpy(ADR(HmiIOCtrl.Output.IOInfo.SelectedIO.PVName), ADR(HmiIOCtrl.Output.IOInfo.PVName[SelectedLineIndex]), SIZEOF(HmiIOCtrl.Output.IOInfo.SelectedIO.PVName));
				HmiIOCtrl.Output.IOInfo.SelectedIO.MinValue := HmiIOCtrl.Output.IOInfo.MinValue[SelectedLineIndex];
				HmiIOCtrl.Output.IOInfo.SelectedIO.MaxValue := HmiIOCtrl.Output.IOInfo.MaxValue[SelectedLineIndex];
				
				Step := IO_COMMAND;
			
		END_CASE
	
		IF (HmiIOCtrl.Output.Status.IOInfoLayerStatus = 0) THEN
			HmiIOCtrl.Output.Status.IOInformationStatus := 1;
		ELSE
			HmiIOCtrl.Output.Status.IOInformationStatus := 0;
		END_IF

	ELSE	(*Other page*)

		Step := INIT;

	END_IF
	
	Internal.OldCommand := HmiIOCtrl.Input.Command;

END_PROGRAM
