(*Copy all inputs for this program*)
ACTION HmiKeyControlInputs: //Control all the Inputs
	
	(* Checks if the Simulation key is active and assignes the commands *)
	IF (HmiKeyControl.Output.Monitor.ModuleType = ARSIM_PC)THEN
		
		FOR i := 0 TO MAX_FUNCTION_KEY_MINUS_ONE DO
			HmiKeyControl.Input.Command.FunctionKey[i]	:= HmiHardKey.Input.MP50_SimKey[22+i];
		END_FOR
			
		FOR i := 0 TO MAX_PLUS_MINUS_KEY_MINUS_ONE DO
			HmiKeyControl.Input.Command.PlusKey[i]	:= HmiHardKey.Input.MP50_SimKey[16+i];
		END_FOR
			
		FOR i := 0 TO MAX_PLUS_MINUS_KEY_MINUS_ONE DO
			HmiKeyControl.Input.Command.MinusKey[i]	:= HmiHardKey.Input.MP50_SimKey[8+i];
		END_FOR
			
		FOR i := 0 TO MAX_PAGE_KEY_MINUS_ONE DO
			HmiKeyControl.Input.Command.PageKey[i]	:= HmiHardKey.Input.MP50_SimKey[i];
		END_FOR
		HmiKeyControl.Input.Command.PageKey[3] := HmiHardKey.Input.MP50_SimKey[3] OR HmiKeyControl.Input.Command.FileSelect;
		
		HmiKeyControl.Input.Command.StartKey			:= HmiHardKey.Input.MP50_SimKey[7];
		HmiKeyControl.Input.Command.StopKey 			:= HmiHardKey.Input.MP50_SimKey[15];
		HmiKeyControl.Input.Command.EmergencyStopKey 	:= DI1.I3;
		HmiKeyControl.Input.Command.Key2nd 				:= HmiHardKey.Input.MP50_SimKey[14];
		HmiKeyControl.Input.Command.KeySwitch[JOG] 		:= HmiHardKey.Input.MP50_SimKey[35];
		HmiKeyControl.Input.Command.KeySwitch[AUTO] 	:= HmiHardKey.Input.MP50_SimKey[36];
			
		HmiKeyControl.Input.Command.SaftyKeyLeft	;
		HmiKeyControl.Input.Command.SaftyKeyRight	;
		
		HmiKeyControl.Input.Command.SaftyKeyLeft		:= TRUE;
		HmiKeyControl.Input.Command.SaftyKeyRight		:= TRUE;
		
		HmiHardKey.Input.Joystick_XValue	:= 500;
		HmiHardKey.Input.Joystick_YValue	:= 500;
		HmiHardKey.Input.Joystick_ZValue	:= 500;
	ELSE
		FOR i := 0 TO MAX_FUNCTION_KEY_MINUS_ONE DO
			HmiKeyControl.Input.Command.FunctionKey[i]	:= HmiHardKey.Input.MP50_Key[22+i];
		END_FOR
			
		FOR i := 0 TO MAX_PLUS_MINUS_KEY_MINUS_ONE DO
			HmiKeyControl.Input.Command.PlusKey[i]	:= HmiHardKey.Input.MP50_Key[16+i];
		END_FOR
			
		FOR i := 0 TO MAX_PLUS_MINUS_KEY_MINUS_ONE DO
			HmiKeyControl.Input.Command.MinusKey[i]	:= HmiHardKey.Input.MP50_Key[8+i];
		END_FOR
			
		FOR i := 0 TO MAX_PAGE_KEY_MINUS_ONE DO
			HmiKeyControl.Input.Command.PageKey[i]	:= HmiHardKey.Input.MP50_Key[i];
		END_FOR
		HmiKeyControl.Input.Command.PageKey[3] := HmiHardKey.Input.MP50_Key[3] OR HmiKeyControl.Input.Command.FileSelect;
	
		HmiKeyControl.Input.Command.StartKey			:= HmiHardKey.Input.MP50_Key[7];
		HmiKeyControl.Input.Command.StopKey 			:= HmiHardKey.Input.MP50_Key[15];
		HmiKeyControl.Input.Command.EmergencyStopKey 	:= DI1.I3;
		HmiKeyControl.Input.Command.Key2nd 				:= HmiHardKey.Input.MP50_Key[14];
		HmiKeyControl.Input.Command.KeySwitch[JOG] 		:= HmiHardKey.Input.MP50_Key[35];
		HmiKeyControl.Input.Command.KeySwitch[AUTO] 	:= HmiHardKey.Input.MP50_Key[36];
			
		HmiKeyControl.Input.Command.SaftyKeyLeft		:= DI1.I1;
		HmiKeyControl.Input.Command.SaftyKeyRight		:= DI1.I2;
		
		HmiKeyControl.Input.Command.SaftyKeyLeft		:= TRUE;
		HmiKeyControl.Input.Command.SaftyKeyRight		:= TRUE;
	END_IF
	
	HmiKeyControl.Input.Parameter.JoystickXValue	:= HmiHardKey.Input.Joystick_XValue;
	HmiKeyControl.Input.Parameter.JoystickYValue	:= HmiHardKey.Input.Joystick_YValue;
	HmiKeyControl.Input.Parameter.JoystickZValue	:= HmiHardKey.Input.Joystick_ZValue;

	//LEDs
	HmiHardKey.Output.Motion_Led 		:= pSystem[0].Output.Status.ControllerStatus <> 0;
	HmiHardKey.Output.Run_Led 			:= 1;
	HmiHardKey.Output.Error_Led 		:= HmiKeyControl.Output.Status.Error;
	HmiHardKey.Output.Process_Led 		:= pCnc[0].Output.State.Moving;
							
END_ACTION

ACTION HmiKeyControlStateHandling: // Main State Machine 
	
	// Emegency Stop 
	IF pSystem[0].Output.State.Errorstop THEN
		Internal.HmiKeyControlState := HMIKEYCONSTATESTEP_ERROR;
	END_IF
	
	// Switch On/Off Control
	IF HmiKeyControl.Components.LayerButtons.ButtonSwitchOn.Value > HmiKeyControl.Components.LayerButtons.ButtonSwitchOn.OldValue THEN
		IF 	pSystem[0].Output.State.Disabled THEN
			pSystem[0].Input.Command.Enable := 1;
			Internal.HmiKeyControlState := HMIKEYCONSTATESTEP_DISABLED;
		ELSIF pCnc[0].Output.State.Standby THEN
			pSystem[0].Input.Command.Enable := 0;
		END_IF	
	END_IF
	
	CASE Internal.HmiKeyControlState OF
		
		HMIKEYCONSTATESTEP_DISABLED:
			
			IF HmiKeyControl.Components.LayerButtons.ButtonSwitchOn.Value > HmiKeyControl.Components.LayerButtons.ButtonSwitchOn.OldValue AND NOT pSystem[0].Output.Status.Busy THEN
				
				IF 	pSystem[0].Output.State.Disabled THEN
					pSystem[0].Input.Command.Enable := 1;
					Internal.HmiKeyControlState := HMIKEYCONSTATESTEP_HOME;
				ELSIF pCnc[0].Output.State.Standby THEN
					pSystem[0].Input.Command.Enable := 0;
				END_IF	
			
			END_IF
			
			
			// If Press Start when disabled, show the warning
			IF (HmiKeyControl.Input.Command.StartKey > Internal.OldCommand.StartKey) THEN 
				
				WarnMessage[0] := 1;
				
			END_IF
		
		HMIKEYCONSTATESTEP_HOME: (* Homing Axes *)
			
			// Do the homing, homing position is stored in the Recipe
			IF NOT pSystem[0].Output.Status.Busy AND pSystem[0].Output.Status.ControllerStatus <> 0 THEN
				
				FOR i := 6 TO MAX_AX_MINUS_TWO DO
					pAxes[i].Input.Parameter.HomePosition := pRecipe.Data.System.HomePosition[i];
				END_FOR
				
				pSystem[0].Input.Command.Home := 1;
				
				Internal.HmiKeyControlState := HMIKEYCONSTATESTEP_CHANGEMODE;		
			
			END_IF
		
		HMIKEYCONSTATESTEP_CHANGEMODE: (* Actual Standby State(After Homing) *)
			
			IF NOT pSystem[0].Output.Status.Busy AND pSystem[0].Input.Command.Home = 0 THEN
				
				// Just to avoid the sw limits being ignored
				FOR i := 6 TO MAX_AX_MINUS_TWO DO 
					
					IF HmiKeyControl.Output.Status.SWLimitsIgnored[i - 6] THEN
						pAxes[i].Input.Parameter.WriteParID := ACP10PAR_SGEN_SW_END_IGNORE;
						pAxes[i].Input.Parameter.WriteParIDText := '0';
						pAxes[i].Input.Command.WriteAxisPar := 1;
					END_IF
						
					HmiKeyControl.Output.Status.SWLimitsIgnored[i - 6] := FALSE;
			
				END_FOR	
					
				// Make Sure the robot is homed before mode switch to CNC
				IF HmiRetain.HmiKeyControl.MechHomeOK THEN
				
					IF HmiKeyControl.Output.Status.SwitchMode = LOCK THEN
					
						pSystem[0].Input.Parameter.Mode := 1;
						Internal.HmiKeyControlState := HMIKEYCONSTATESTEP_ACTIVE_JOG; // JOG MEANS NO CNC, not the Jog Mode for Robot (This mode is for Setting home position)
						
					ELSE
					
						pSystem[0].Input.Parameter.Mode := 0;
						Internal.HmiKeyControlState := HMIKEYCONSTATESTEP_ACTIVE_AUTO; // AUTO MEANS CNC, including Jog Mode and Auto Mode
						
					END_IF
								
				ELSE
					
					pSystem[0].Input.Parameter.Mode := 1;
					Internal.HmiKeyControlState := HMIKEYCONSTATESTEP_ACTIVE_JOG;
					
				END_IF
				
				pSystem[0].Input.Command.ChangeMode := 1;
				
			END_IF
			
		HMIKEYCONSTATESTEP_ACTIVE_JOG:
		
			IF pSystem[0].Output.Monitor.Mode = 1 THEN (* 1 for No CNC and 0 for CNC *)
				
				IF HmiKeyControl.Output.Status.SwitchMode <> LOCK THEN
				
					IF HmiRetain.HmiKeyControl.MechHomeOK THEN
					
						pSystem[0].Input.Parameter.Mode := 0;
						pSystem[0].Input.Command.ChangeMode := 1;
						
						StartState := 0;
						
						Internal.HmiKeyControlState := HMIKEYCONSTATESTEP_ACTIVE_AUTO;
						
					END_IF
					
				END_IF
				
				
				// The Moving Of Axis in NON-CNC Mode is only allowed in PAGE_SETUPCALIB 
				IF HmiGlobal.PageControl.ActPage = PAGE_SETUPCALIB AND pSystem[0].Output.State.Active THEN 
				
					FOR i := 0 TO 5 DO
						(* For MP50-4*)
						IF HmiSetupCtrl.Components.PageCalib.LayerDefault.ButtonAxisToggle[i].Value = 1 THEN // Only when certain Axis is toggled(only one axis will be toggled at one time)
							// Using MCMoveVelocity(Axis Controlling) for Calibration
							IF EDGEPOS((HmiKeyControl.Input.Command.SaftyKeyLeft OR HmiKeyControl.Input.Command.SaftyKeyRight) AND (HmiKeyControl.Input.Command.PlusKey[i] <> 0)
								) THEN 
								pAxes[i+6].Input.Parameter.Velocity := HmiKeyControl.Components.LayerButtons.SliderV.Value /100.0 * pRecipe.Data.System.JointJogSpeed;
								pAxes[i+6].Input.Parameter.Direction := mcPOSITIVE_DIR;
								pAxes[i+6].Input.Command.MoveVelocity := 1;
							ELSIF EDGENEG((HmiKeyControl.Input.Command.SaftyKeyLeft OR HmiKeyControl.Input.Command.SaftyKeyRight) AND (HmiKeyControl.Input.Command.PlusKey[i] <> 0) 
								) THEN 
								pAxes[i+6].Input.Command.Stop := 1;
							ELSIF EDGEPOS((HmiKeyControl.Input.Command.SaftyKeyLeft OR HmiKeyControl.Input.Command.SaftyKeyRight) AND (HmiKeyControl.Input.Command.MinusKey[i] <> 0)
								) THEN 
								pAxes[i+6].Input.Parameter.Velocity := HmiKeyControl.Components.LayerButtons.SliderV.Value /100.0 * pRecipe.Data.System.JointJogSpeed;
								pAxes[i+6].Input.Parameter.Direction := mcNEGATIVE_DIR;
								pAxes[i+6].Input.Command.MoveVelocity := 1;
							ELSIF EDGENEG((HmiKeyControl.Input.Command.SaftyKeyLeft OR HmiKeyControl.Input.Command.SaftyKeyRight) AND (HmiKeyControl.Input.Command.MinusKey[i] <> 0)
								) THEN 
								pAxes[i+6].Input.Command.Stop := 1;
				
							END_IF
						ELSE
							
							// Otherweise stop the Movement
							IF pAxes[i+6].Output.State.ContinuousMotion THEN
								
								pAxes[i+6].Input.Command.Stop := 1;
									
							END_IF
						END_IF	
							
					END_FOR
					
				ELSE
					// In other Page stop the Axis Any Way
					FOR i := 0 TO 5 DO
						IF pAxes[i+6].Output.State.ContinuousMotion THEN
								
							pAxes[i+6].Input.Command.Stop := 1;
									
						END_IF
					END_FOR
				END_IF
						
			END_IF
		
		HMIKEYCONSTATESTEP_ACTIVE_AUTO:  // CNC Mode
			
			IF pSystem[0].Output.Monitor.Mode = 0 THEN
				// Change to Non-CNC Mode
				IF HmiKeyControl.Output.Status.SwitchMode = LOCK THEN
			
					pSystem[0].Input.Parameter.Mode := 1;
					pSystem[0].Input.Command.ChangeMode := 1;
						
					Internal.HmiKeyControlState := HMIKEYCONSTATESTEP_ACTIVE_JOG;
					
				END_IF
				
				(* UserLevel higher than 0 and Mode is Auto then Start OR Stop is allowed *)
				IF pSystem[0].Output.State.Active AND gUserLevel > 0 AND HmiKeyControl.Output.Status.MoveStatus = AUTO THEN
				
					pCnc[0].Input.Parameter.NcInitProgramName := '';
					
					(* Stop the Program: Once for Halt, Twice for Stop *)
					IF HmiKeyControl.Input.Command.StopKey > Internal.OldCommand.StopKey THEN
						
						IF pCnc[0].Output.State.Moving AND NOT pCnc[0].Output.Status.Halted THEN
							pCnc[0].Input.Command.Halt := 1;
						ELSE
							pCnc[0].Input.Command.Stop := 1;
						END_IF	
							
					END_IF
					
					// Start the program
					IF (HmiKeyControl.Input.Command.StartKey > Internal.OldCommand.StartKey) THEN
						
						(* if halted continue else start *)							
						IF pCnc[0].Output.Status.Halted THEN
							pCnc[0].Input.Command.Continue := 1;
						ELSE
							
							IF HmiRetain.HmiProgram.Name <> ''  THEN
								IF HmiRetain.HmiProgram.Ptr <> 0 THEN // Start the Program from some line (Not working right now)
									brsitoa(HmiRetain.HmiProgram.Ptr, ADR(TempStr));
									pCnc[0].Input.Parameter.NcProgramName := CONCAT(CONCAT(CONCAT(HmiRetain.HmiProgram.Name, '.st'), '::'), TempStr);		
								ELSE
									pCnc[0].Input.Parameter.NcProgramName := CONCAT(HmiRetain.HmiProgram.Name, '.st');
								END_IF
								
								pCnc[0].Input.Parameter.NcProgramStartPos := -1;
								pCnc[0].Input.Parameter.NcProgramStartMode := ncFILE;
								pCnc[0].Input.Command.StartNcProgram := 1;	
								
							END_IF
						END_IF
						
					END_IF
					
					//If Program is stopped, reset the Pointer
					IF EDGENEG(pCnc[0].Output.State.Moving) THEN
						
						HmiRetain.HmiProgram.Ptr := 0;
						
					END_IF
					
								
				END_IF
					
			ELSIF pSystem[0].Output.State.Standby AND pSystem[0].Output.Status.HomingOk THEN
				
				Internal.HmiKeyControlState := HMIKEYCONSTATESTEP_CHANGEMODE;
				
			END_IF
					
		HMIKEYCONSTATESTEP_ERROR:
			// Press the Stop key in Error state means reset the error
			IF (HmiKeyControl.Input.Command.StopKey > Internal.OldCommand.StopKey) THEN
				pSystem[0].Input.Command.Reset := 1;
			END_IF
			
			pCncDat ACCESS pCnc[0].Output.Monitor.CncAddress;
			
			(* In Case Cnc Still Runing even in Errorstop State *)
			IF (pCncDat.move.status.cnt_ncprog <> 0) THEN 
				ncaction(ADR(pCncDat), ncMOVE, ncSTOP);
			END_IF
				
			IF NOT pSystem[0].Output.State.Errorstop THEN
				IF pSystem[0].Output.Status.HomingOk THEN
					Internal.HmiKeyControlState := HMIKEYCONSTATESTEP_CHANGEMODE; 
				ELSE 
					Internal.HmiKeyControlState := HMIKEYCONSTATESTEP_HOME;
				END_IF
					
			END_IF
		
	END_CASE
	
	// SingleStep Control
	IF pCnc[0].Output.State.Standby THEN		
		(* Switch between Modes: *)
		IF (HmiKeyControl.Components.LayerButtons.ButtonSingle.Value > HmiKeyControl.Components.LayerButtons.ButtonSingle.OldValue) THEN
			IF NOT pCnc[0].Output.Status.SingleStep THEN
				pCnc[0].Input.Command.StartSingleStep := 1;
			END_IF
		END_IF
						
		IF (HmiKeyControl.Components.LayerButtons.ButtonCont.Value > HmiKeyControl.Components.LayerButtons.ButtonCont.OldValue) THEN
			IF pCnc[0].Output.Status.SingleStep THEN
				pCnc[0].Input.Command.StopSingleStep := 1;
			END_IF
		END_IF
		
		// Switch off Single Step for Jog 
		IF HmiKeyControl.Output.Status.MoveStatus = JOG AND pCnc[0].Output.Status.SingleStep THEN
			pCnc[0].Input.Command.StopSingleStep := 1;
		END_IF
		
	END_IF
	// Show different Pics
	HmiKeyControl.Components.LayerButtons.Tabs.ButtonsTab[0].BmpIdx := pCnc[0].Output.Status.SingleStep;
	
END_ACTION

ACTION HmiKeyControlJog: // Jog Control
	
	IF gUserLevel = 0 THEN
		
		pJog.Run 	:= 0;

	ELSE
		// Four Modes Available: TOOL; BASE; JOINT; DIRECT
		IF pCnc[0].Output.State.Standby THEN		
			(* Switch between Modes *)
			IF HmiKeyControl.Components.LayerButtons.ButtonJogTool.Value > HmiKeyControl.Components.LayerButtons.ButtonJogTool.OldValue THEN
				HmiKeyControl.Input.Parameter.JogMode := JOG_MODE_TOOL;
			END_IF
		
			IF HmiKeyControl.Components.LayerButtons.ButtonJogBase.Value > HmiKeyControl.Components.LayerButtons.ButtonJogBase.OldValue THEN
				HmiKeyControl.Input.Parameter.JogMode := JOG_MODE_BASE;
			END_IF

			IF HmiKeyControl.Components.LayerButtons.ButtonJogJoint.Value > HmiKeyControl.Components.LayerButtons.ButtonJogJoint.OldValue THEN
				HmiKeyControl.Input.Parameter.JogMode := JOG_MODE_JOINT;
			END_IF
			
			IF HmiKeyControl.Components.LayerButtons.ButtonJogDirect.Value > HmiKeyControl.Components.LayerButtons.ButtonJogDirect.OldValue THEN
				HmiKeyControl.Input.Parameter.JogMode := JOG_MODE_DIRECT;
			END_IF
	
		END_IF
		// Show Different Pics
		HmiKeyControl.Components.LayerButtons.Tabs.ButtonsTab[2].BmpIdx := HmiKeyControl.Input.Parameter.JogMode;
		
		// Buttons Control (+/- Buttons) Plus/Minuskey -> MoveAxis
		IF HmiKeyControl.Output.Status.MoveStatus = JOG THEN 
				
			FOR i := 0 TO 5 DO
				(* For MP50-4*)
				IF (HmiKeyControl.Input.Command.PlusKey[i] <> 0)  THEN 
					HmiKeyControl.Output.Status.MoveAxis[i] := 1;
				ELSIF (HmiKeyControl.Input.Command.MinusKey[i] <> 0) THEN 
					HmiKeyControl.Output.Status.MoveAxis[i] := -1;
				ELSE
					HmiKeyControl.Output.Status.MoveAxis[i] := 0;
				END_IF
				
			END_FOR
		
			IF (HmiKeyControl.Input.Command.SaftyKeyLeft = 0) 
				AND (HmiKeyControl.Input.Command.SaftyKeyRight = 0) THEN

				HmiKeyControl.Output.Status.MoveAxis[0] := 0;
				HmiKeyControl.Output.Status.MoveAxis[1] := 0;
				HmiKeyControl.Output.Status.MoveAxis[2] := 0;
				HmiKeyControl.Output.Status.MoveAxis[3] := 0;
				HmiKeyControl.Output.Status.MoveAxis[4] := 0;
				HmiKeyControl.Output.Status.MoveAxis[5] := 0;
			END_IF
						
			IF (HmiKeyControl.Output.Status.MoveAxis[0] <> 0) OR
				(HmiKeyControl.Output.Status.MoveAxis[1] <> 0) OR
				(HmiKeyControl.Output.Status.MoveAxis[2] <> 0) OR 
				(HmiKeyControl.Output.Status.MoveAxis[3] <> 0) OR
				(HmiKeyControl.Output.Status.MoveAxis[4] <> 0) OR 
				(HmiKeyControl.Output.Status.MoveAxis[5] <> 0) THEN
				
				IF (pRecipe.Data.System.JointJogSpeed <> 0) THEN
				
					IF (HmiKeyControl.Input.Parameter.JogMode = JOG_MODE_BASE) THEN
						pJog.Speed 	:= pRecipe.Data.System.PathJogSpeed;
		
					ELSIF (HmiKeyControl.Input.Parameter.JogMode = JOG_MODE_TOOL) THEN
						pJog.Speed 	:= pRecipe.Data.System.PathJogSpeed;
		
					ELSIF (HmiKeyControl.Input.Parameter.JogMode = JOG_MODE_JOINT) THEN
						pJog.Speed 	:= pRecipe.Data.System.JointJogSpeed;
					END_IF
				
					pJog.Mode	:= HmiKeyControl.Input.Parameter.JogMode;
					pJog.Run 	:= 1;
				
				END_IF
			
			ELSE
				
				// Special Control For Direct Mode
				IF (HmiKeyControl.Input.Command.SaftyKeyLeft = 1 OR HmiKeyControl.Input.Command.SaftyKeyRight = 1) AND
					HmiKeyControl.Input.Parameter.JogMode = JOG_MODE_DIRECT AND HmiGlobal.PageControl.ActPage = PAGE_JOGGING AND
					HmiJog.Components.LayerDefault.TextActSet.TextIndex = 1 THEN // The use of this mode is restricted to certain page and certain status
					
					IF HmiJog.Components.LayerDefault.ButtonCheckVar.Value = 0 THEN // Use the point from numeric inputs.
						IF HmiJog.Components.LayerDefault.DropdownJointTCP.SelectedIndex = 0 THEN
						
							pJog.Speed := pRecipe.Data.System.JointJogSpeed;
						
							JointSync.JointAxis[0] := HmiJog.Components.LayerDefault.NumericPosSet[0].Value;
							JointSync.JointAxis[1] := HmiJog.Components.LayerDefault.NumericPosSet[1].Value;
							JointSync.JointAxis[2] := HmiJog.Components.LayerDefault.NumericPosSet[2].Value;
							JointSync.JointAxis[3] := HmiJog.Components.LayerDefault.NumericPosSet[3].Value;
							JointSync.JointAxis[4] := HmiJog.Components.LayerDefault.NumericPosSet[4].Value;
							JointSync.JointAxis[5] := HmiJog.Components.LayerDefault.NumericPosSet[5].Value;
							
							JointTCPSync := 1;
						
						ELSE
							pJog.Speed := pRecipe.Data.System.PathJogSpeed;
						
							PointSync.Pos.x := HmiJog.Components.LayerDefault.NumericPosSet[0].Value;
							PointSync.Pos.y := HmiJog.Components.LayerDefault.NumericPosSet[1].Value;
							PointSync.Pos.z := HmiJog.Components.LayerDefault.NumericPosSet[2].Value;
							PointSync.Orient.Angle[0] := HmiJog.Components.LayerDefault.NumericPosSet[3].Value;
							PointSync.Orient.Angle[1] := HmiJog.Components.LayerDefault.NumericPosSet[4].Value;
							PointSync.Orient.Angle[2] := HmiJog.Components.LayerDefault.NumericPosSet[5].Value;
							PointSync.Orient.Angle[3] := HmiJog.Components.LayerDefault.NumericPosSet[6].Value;
				
							IF HmiJog.Components.LayerDefault.DropdownEulerQuan.SelectedIndex = 1 THEN
								PointSync.Orient.Type := MX_QUATERNION;
							ELSE
								PointSync.Orient.Type := 1;
							END_IF
							
							JointTCPSync := 0;
						END_IF
					ELSE
						// Else use the Point from the File
						IF HmiRetain.HmiJog.Device = HmiRetain.HmiEditor.Device AND HmiRetain.HmiJog.Name = HmiRetain.HmiEditor.Name THEN
						
							IF HmiRetain.HmiJog.Joint.Set THEN
								
								pJog.Speed := pRecipe.Data.System.JointJogSpeed;
								
								JointSync := HmiRetain.HmiJog.Joint.Joint;
								
								JointTCPSync := 1;
								
							END_IF
							
							IF HmiRetain.HmiJog.Point.Set THEN
								
								pJog.Speed := pRecipe.Data.System.PathJogSpeed;
						
								PointSync := HmiRetain.HmiJog.Point.Point;
								
								JointTCPSync := 0;
								
							END_IF
						
						END_IF
						
					END_IF
					
					
					pJog.Mode	:= HmiKeyControl.Input.Parameter.JogMode;
					
					pJog.Run 	:= 1;
						
				ELSE
				
					pJog.Run	:= 0;
				
				END_IF
				
			END_IF
			
		END_IF
		
	END_IF
	
END_ACTION

ACTION HmiKeyControlStatus:
	
	// Control all the status, altogether 4  stats(Disabled/LOCK/JOG/AUTO)
	IF HmiKeyControl.Input.Command.KeySwitch[JOG] THEN
		HmiKeyControl.Output.Status.SwitchMode := JOG;
	ELSIF HmiKeyControl.Input.Command.KeySwitch[AUTO] THEN
		HmiKeyControl.Output.Status.SwitchMode := AUTO;
	ELSE
		HmiKeyControl.Output.Status.SwitchMode := LOCK;
	END_IF	
	
	IF pSystem[0].Output.State.Disabled THEN // Not Enabled = DISABLED
		HmiKeyControl.Output.Status.MoveStatus := DISABLED;
	ELSE
		IF pSystem[0].Output.Monitor.Mode = 1 THEN // If in the middle, Lock
			HmiKeyControl.Output.Status.MoveStatus := LOCK;
		ELSIF pSystem[0].Output.Monitor.Mode = 0 THEN // Left Jog
			IF HmiKeyControl.Output.Status.SwitchMode = AUTO THEN
				HmiKeyControl.Output.Status.MoveStatus := AUTO;
			ELSE // Right Auto
				HmiKeyControl.Output.Status.MoveStatus := JOG;
			END_IF
			
		END_IF
			
	END_IF
	// In AutoMode 3 Status(RUN/PAUSE/STOP)
	IF (HmiKeyControl.Output.Status.MoveStatus = AUTO) THEN
		IF (pCnc[0].Output.State.Moving = 1) AND (pCnc[0].Output.Status.Halted  = 0) THEN
			HmiKeyControl.Output.Status.AutoStatus := RUN;
		ELSIF (pCnc[0].Output.State.Moving = 1) AND (pCnc[0].Output.Status.Halted  = 1) THEN
			HmiKeyControl.Output.Status.AutoStatus := PAUSE;
		ELSE
			HmiKeyControl.Output.Status.AutoStatus := STOP;
		END_IF
	ELSE
		HmiKeyControl.Output.Status.AutoStatus := STOP;
	END_IF
			
END_ACTION

ACTION HmiKeyControlPage:
	// Turn the Pages
	IF (HmiKeyControl.Input.Command.PageKey[0] > Internal.OldCommand.PageKey[0]) THEN
		HmiGlobal.PageControl.SetPage := PAGE_MAIN;
	END_IF
	
	IF (HmiKeyControl.Input.Command.PageKey[1] > Internal.OldCommand.PageKey[1]) AND (gUserLevel >= 1) THEN
		HmiGlobal.PageControl.SetPage := PAGE_SETUP;
	END_IF
	
	IF (HmiKeyControl.Input.Command.PageKey[2] > Internal.OldCommand.PageKey[2]) AND (gUserLevel >= 1) THEN
		HmiGlobal.PageControl.SetPage := PAGE_IO;
	END_IF
	
	IF (HmiKeyControl.Input.Command.PageKey[3] > Internal.OldCommand.PageKey[3]) AND (gUserLevel >= 1) THEN
		HmiGlobal.PageControl.SetPage := PAGE_PROGRAM;
	END_IF
	
	// Edit Page cannot be entered if no Program available
	IF (HmiKeyControl.Input.Command.PageKey[4] > Internal.OldCommand.PageKey[4]) AND (gUserLevel >= 1) AND 
		HmiRetain.HmiEditor.Device <> '' AND HmiRetain.HmiEditor.Name <> ''  THEN
		HmiGlobal.PageControl.SetPage := PAGE_EDITOR;
	END_IF
	
	IF (HmiKeyControl.Input.Command.PageKey[5] > Internal.OldCommand.PageKey[5]) AND (gUserLevel >= 1) THEN
		HmiGlobal.PageControl.SetPage := PAGE_JOGGING;
	END_IF
	
	IF (HmiKeyControl.Input.Command.PageKey[6] > Internal.OldCommand.PageKey[6]) AND (gUserLevel >= 1) THEN
		HmiGlobal.PageControl.SetPage := PAGE_ALARM;
	END_IF
	
	// If userlevel < 1, robot is disabled
	IF (gUserLevel < 1) THEN
	
		HmiKeyControl.Components.LayerButtons.ButtonSwitchOn.Value := 0;
		
	END_IF
	
	IF HmiKeyControl.Components.LayerButtons.ButtonLogin.Value > HmiKeyControl.Components.LayerButtons.ButtonLogin.OldValue THEN
			
		HmiKeyControl.Components.LayerLogin.Layer.StatusDatapoint := 0;
			
	END_IF
	
END_ACTION

ACTION HmiKeyControlFeedOverride:
	
	// Using 1st Order Filter to smoothe the Feedrate to avoid rash change.
	LCRPT1_0(enable := 1 , x := HmiKeyControl.Components.LayerButtons.SliderV.Value / 100.0, t := 1); // Time constant 1 second
	pCnc[0].Input.Parameter.FeedrateOverride := LCRPT1_0.y;
	pCnc[0].Input.Parameter.RapidOverride		:= pCnc[0].Input.Parameter.FeedrateOverride;
			
	// Visual Effect of Slider of Feedrate
	IF NOT pCnc[0].Output.State.Moving OR pCnc[0].Output.Status.Halted THEN
		HmiKeyControl.Components.LayerButtons.SliderV.StatusDatapoint := BIT_SET(HmiKeyControl.Components.LayerButtons.SliderV.StatusDatapoint, 1);
	ELSE
		HmiKeyControl.Components.LayerButtons.SliderV.StatusDatapoint := BIT_CLR(HmiKeyControl.Components.LayerButtons.SliderV.StatusDatapoint, 1);
	END_IF
	
	(* Delicate control of Plus/Minus Button --- Done by Others(MB Kai YH) *)
	IF (HmiKeyControl.Components.LayerButtons.ButtonVPlus.Value > HmiKeyControl.Components.LayerButtons.ButtonVPlus.OldValue) THEN
		HmiKeyControl.Components.LayerButtons.SliderV.Value := HmiKeyControl.Components.LayerButtons.SliderV.Value + 1;
		VPlus1T := VPlus1T + cycT;
		VPlus10T := VPlus10T + cycT;
	ELSIF (HmiKeyControl.Components.LayerButtons.ButtonVPlus.Value <> 0)
		AND (HmiKeyControl.Components.LayerButtons.ButtonVPlus.OldValue <> 0) THEN
		VPlus1T := VPlus1T + cycT;
		VPlus10T := VPlus10T + cycT;
		
		IF (VPlus10T > (10*CalculateInterval)) 
			AND (VPlus1T > CalculateInterval / 3) THEN
			HmiKeyControl.Components.LayerButtons.SliderV.Value := HmiKeyControl.Components.LayerButtons.SliderV.Value + 1;
			VPlus1T := 0;
		ELSIF (VPlus1T > CalculateInterval)THEN
			HmiKeyControl.Components.LayerButtons.SliderV.Value := HmiKeyControl.Components.LayerButtons.SliderV.Value + 1;
			VPlus1T := 0;
		END_IF	
	ELSIF (HmiKeyControl.Components.LayerButtons.ButtonVMinus.Value > HmiKeyControl.Components.LayerButtons.ButtonVMinus.OldValue) THEN
		HmiKeyControl.Components.LayerButtons.SliderV.Value := HmiKeyControl.Components.LayerButtons.SliderV.Value - 1;
		VPlus1T := VPlus1T + cycT;
		VPlus10T := VPlus10T + cycT;
	ELSIF (HmiKeyControl.Components.LayerButtons.ButtonVMinus.Value <> 0)
		AND (HmiKeyControl.Components.LayerButtons.ButtonVMinus.OldValue <> 0) THEN
		VPlus1T := VPlus1T + cycT;
		VPlus10T := VPlus10T + cycT;
		IF (VPlus10T > (10*CalculateInterval)) 
			AND (VPlus1T > CalculateInterval / 3) THEN
			HmiKeyControl.Components.LayerButtons.SliderV.Value := HmiKeyControl.Components.LayerButtons.SliderV.Value - 1;
			VPlus1T := 0;
		ELSIF (VPlus1T > CalculateInterval)THEN
			HmiKeyControl.Components.LayerButtons.SliderV.Value := HmiKeyControl.Components.LayerButtons.SliderV.Value - 1;
			VPlus1T := 0;
		END_IF
	ELSE
		CalculateInterval := 500;
		VPlus1T := 0;
		VPlus10T:= 0;
	END_IF
	
	
	// Set the Limit of SliderV (Feedrate)
	IF (HmiKeyControl.Components.LayerButtons.SliderV.Value > 100) THEN
		HmiKeyControl.Components.LayerButtons.SliderV.Value := 100;
	ELSIF (HmiKeyControl.Components.LayerButtons.SliderV.Value < 1) THEN
		HmiKeyControl.Components.LayerButtons.SliderV.Value := 1;
	END_IF
	
END_ACTION

ACTION HmiKeyControlVisuHandling:
	
	// Visu Handling for Common Layer including Tabs (Cont/Singlestep Feedrate JogMode etc)
	FOR i := 0 TO HmiKeyControl.Components.LayerButtons.Tabs.TabMaxIndex DO
		IF HmiKeyControl.Components.LayerButtons.Tabs.ButtonsTab[i].Value > HmiKeyControl.Components.LayerButtons.Tabs.ButtonsTab[i].OldValue THEN
			FOR j := 0 TO HmiKeyControl.Components.LayerButtons.Tabs.TabMaxIndex DO
				IF j <> i THEN
					HmiKeyControl.Components.LayerButtons.Tabs.ButtonsTab[j].Value := 0;
				END_IF
			END_FOR
		END_IF
	END_FOR
	
	HmiKeyControl.Components.LayerButtons.Tabs.TabBg.StatusDatapoint := 1;
	
	FOR i := 0 TO HmiKeyControl.Components.LayerButtons.Tabs.TabMaxIndex DO
		IF HmiKeyControl.Components.LayerButtons.Tabs.ButtonsTab[i].Value = 1 THEN
			HmiKeyControl.Components.LayerButtons.Tabs.ButtonsTab[i].StatusDatapoint := BIT_CLR(HmiKeyControl.Components.LayerButtons.Tabs.ButtonsTab[i].StatusDatapoint, 0);
			HmiKeyControl.Components.LayerButtons.Tabs.TabSelectedIndex := i;
			HmiKeyControl.Components.LayerButtons.Tabs.TabBg.StatusDatapoint := 0;
		ELSE
			HmiKeyControl.Components.LayerButtons.Tabs.ButtonsTab[i].StatusDatapoint := BIT_SET(HmiKeyControl.Components.LayerButtons.Tabs.ButtonsTab[i].StatusDatapoint, 0);
		END_IF
	END_FOR
	
	IF HmiKeyControl.Output.Status.MoveStatus = AUTO THEN
		HmiKeyControl.Components.LayerButtons.Tabs.ButtonsTab[0].StatusDatapoint := BIT_CLR(HmiKeyControl.Components.LayerButtons.Tabs.ButtonsTab[0].StatusDatapoint, 1);
	ELSE
		HmiKeyControl.Components.LayerButtons.Tabs.ButtonsTab[0].StatusDatapoint := BIT_SET(HmiKeyControl.Components.LayerButtons.Tabs.ButtonsTab[0].StatusDatapoint, 1);
	END_IF
	
	IF HmiKeyControl.Output.Status.MoveStatus = JOG THEN
		HmiKeyControl.Components.LayerButtons.Tabs.ButtonsTab[2].StatusDatapoint := BIT_CLR(HmiKeyControl.Components.LayerButtons.Tabs.ButtonsTab[2].StatusDatapoint, 1);
	ELSE
		HmiKeyControl.Components.LayerButtons.Tabs.ButtonsTab[2].StatusDatapoint := BIT_SET(HmiKeyControl.Components.LayerButtons.Tabs.ButtonsTab[2].StatusDatapoint, 1);
	END_IF
	
	// Login Popu automatically
	IF gUserLevel < 1 THEN
		HmiKeyControl.Components.LayerLogin.Layer.StatusDatapoint := 0;
	END_IF
	
	
	// Buttons PosEdge Detection
	HmiKeyControl.Components.LayerButtons.ButtonCont.OldValue := HmiKeyControl.Components.LayerButtons.ButtonCont.Value;
	HmiKeyControl.Components.LayerButtons.ButtonSingle.OldValue := HmiKeyControl.Components.LayerButtons.ButtonSingle.Value;
	HmiKeyControl.Components.LayerButtons.ButtonJogBase.OldValue := HmiKeyControl.Components.LayerButtons.ButtonJogBase.Value;
	HmiKeyControl.Components.LayerButtons.ButtonJogTool.OldValue := HmiKeyControl.Components.LayerButtons.ButtonJogTool.Value;
	HmiKeyControl.Components.LayerButtons.ButtonJogJoint.OldValue := HmiKeyControl.Components.LayerButtons.ButtonJogJoint.Value;
	HmiKeyControl.Components.LayerButtons.ButtonJogDirect.OldValue := HmiKeyControl.Components.LayerButtons.ButtonJogDirect.Value;
	
	FOR i:= 0 TO HmiKeyControl.Components.LayerButtons.Tabs.TabMaxIndex DO
		HmiKeyControl.Components.LayerButtons.Tabs.ButtonsTab[i].OldValue := HmiKeyControl.Components.LayerButtons.Tabs.ButtonsTab[i].Value;
	END_FOR
	
	HmiKeyControl.Components.LayerButtons.ButtonLogin.OldValue :=  HmiKeyControl.Components.LayerButtons.ButtonLogin.Value;
	HmiKeyControl.Components.LayerButtons.ButtonSwitchOn.OldValue :=  HmiKeyControl.Components.LayerButtons.ButtonSwitchOn.Value;
	HmiKeyControl.Components.LayerButtons.ButtonVPlus.OldValue :=  HmiKeyControl.Components.LayerButtons.ButtonVPlus.Value;
	HmiKeyControl.Components.LayerButtons.ButtonVMinus.OldValue :=  HmiKeyControl.Components.LayerButtons.ButtonVMinus.Value;
	
END_ACTION
