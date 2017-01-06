/********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: HmiSetup
 * File: HmiSetupCtrl.cpp
 * Author: renj
 * Created: January 21, 2015
 ********************************************************************
 * Implementation of program HmiSetup
 ********************************************************************/

#include <bur/plctypes.h>
#include <string.h>

#ifdef _DEFAULT_INCLUDES
	#include <AsDefault.h>
#endif

unsigned long bur_heap_size = 0xFFFFF; 

void _INIT HmiSetupCtrlInit(void)
{
	HmiSetupCtrl.Components.PageCalib.LayerInfo.Layer.StatusDatapoint = 1;
	HmiSetupCtrl.Components.PageKine.LayerInfo.Layer.StatusDatapoint = 1;
	HmiSetupCtrl.Components.PageMain.LayerInfo.Layer.StatusDatapoint = 1;
}

int HomeStep;
int AxisIndex;
UINT OldPage;

void _CYCLIC HmiSetupCtrlCyclic(void)
{
	if (HmiGlobal.Address.AxesAddress != 0 && HmiGlobal.Address.RecipeAddress != 0 && HmiGlobal.Address.SystemAddress)
	{
		pSystem = (System_Type *) HmiGlobal.Address.SystemAddress;
		pAxes = (Axes_Type (*) [13])HmiGlobal.Address.AxesAddress;
		pRecipe = (RECIPE_typ *) HmiGlobal.Address.RecipeAddress;
	} else
		return;
	
	// Page Calibration
	if (HmiGlobal.PageControl.ActPage == PAGE_SETUPCALIB && HmiKeyControl.Output.Status.MoveStatus == LOCK)	// Move Single Axis without SW Limits only allowed in Setup Calib Page when axes is select 
	{
		// Handle the Toggle of Exclusive Checkbox Group
		for (int i = 0; i < 6; ++i)
			{
			if (HmiSetupCtrl.Components.PageCalib.LayerDefault.ButtonAxisToggle[i].Value > HmiSetupCtrl.Components.PageCalib.LayerDefault.ButtonAxisToggle[i].OldValue)
			{
				for (int j = 0; j < 6; ++ j)
					if (j != i)
					HmiSetupCtrl.Components.PageCalib.LayerDefault.ButtonAxisToggle[j].Value = 0;
					
			}
		}
		// SW limit ignore control only when toggled, the Limit is ignored
		for (int i = 0; i < 6; ++i)	
			{
			if (HmiSetupCtrl.Components.PageCalib.LayerDefault.ButtonAxisToggle[i].Value == 1)
			{
				if (!HmiKeyControl.Output.Status.SWLimitsIgnored[i])
				{
					(*pAxes)[i+6].Input.Parameter.WriteParID = ACP10PAR_SGEN_SW_END_IGNORE;
					strcpy((*pAxes)[i+6].Input.Parameter.WriteParIDText,  "1");
					(*pAxes)[i+6].Input.Command.WriteAxisPar = 1;
					HmiKeyControl.Output.Status.SWLimitsIgnored[i] = 1;
				}
			} else
			{
				if (HmiKeyControl.Output.Status.SWLimitsIgnored[i])
				{
					(*pAxes)[i+6].Input.Parameter.WriteParID = ACP10PAR_SGEN_SW_END_IGNORE;
					strcpy((*pAxes)[i+6].Input.Parameter.WriteParIDText,  "0");
					(*pAxes)[i+6].Input.Command.WriteAxisPar = 1;
					HmiKeyControl.Output.Status.SWLimitsIgnored[i] = 0;
				}
			}
		}
			
		// Encoder Value Update
		switch (HomeStep)
		{
			case 0: // Do the Homing with Homeposition 0 to get the REAL Homeposiiton
				for (int i = 0; i < 6; ++i)	
					{
					if (HmiSetupCtrl.Components.PageCalib.LayerDefault.ButtonAxisToggle[i].Value == 1)
					{
						if (HmiSetupCtrl.Components.PageCalib.LayerDefault.ButtonAxisRefresh[i].Value > HmiSetupCtrl.Components.PageCalib.LayerDefault.ButtonAxisRefresh[i].Value
							&& !(*pAxes)[i+6].Output.State.Homing &&  !(*pAxes)[i+6].Output.Status.Busy)
						{
							(*pAxes)[i+6].Input.Parameter.HomePosition = 0;
							(*pAxes)[i+6].Input.Command.Home = 1;
							AxisIndex = i;
							HomeStep = 1;
						} 
					}
				}
				break;
				
			case 1:
				if (!(*pAxes)[AxisIndex+6].Output.State.Homing && !(*pAxes)[AxisIndex+6].Output.Status.Busy)
					HmiSetupCtrl.Components.PageCalib.LayerDefault.NumericEncoderValue[AxisIndex].Value = (*pAxes)[AxisIndex+6].Output.Monitor.Position;
					
				HomeStep = 0;
				break;
		}
						
	} else
	{
		// If in other Page or In other Mode, SW Limits is not Ignored
		for (int i = 0; i < 6; ++i)
		{
			HmiSetupCtrl.Components.PageCalib.LayerDefault.ButtonAxisToggle[i].Value = 0;
				
			if (HmiKeyControl.Output.Status.SWLimitsIgnored[i])
			{
				(*pAxes)[i+6].Input.Parameter.WriteParID = ACP10PAR_SGEN_SW_END_IGNORE;
				strcpy((*pAxes)[i+6].Input.Parameter.WriteParIDText,  "0");
				(*pAxes)[i+6].Input.Command.WriteAxisPar = 1;
				HmiKeyControl.Output.Status.SWLimitsIgnored[i] = 0;
			}
		}
			
		HomeStep = 0;
	}
	
	// But its not mandatory to be in lock mode to "SAVE" the Homeposition
	if (HmiGlobal.PageControl.ActPage == PAGE_SETUPCALIB)
	{
		if (OldPage != PAGE_SETUPCALIB)
			for (int i = 0; i < 6; ++i)
			HmiSetupCtrl.Components.PageCalib.LayerDefault.NumericEncoderValue[i].Value = - pRecipe->Data.System.HomePosition[i];
				
		// Save the HomePosition
		if (HmiSetupCtrl.Components.PageCalib.LayerDefault.ButtonSave.Value > HmiSetupCtrl.Components.PageCalib.LayerDefault.ButtonSave.OldValue)
		{
			for (int i = 0; i < 6; ++i)
				pRecipe->Data.System.HomePosition[i] = -HmiSetupCtrl.Components.PageCalib.LayerDefault.NumericEncoderValue[i].Value;
			pRecipe->Cmd.SysDataWrite = 1;
				
			HmiRetain.HmiKeyControl.MechHomeOK = 1;
				
		}
	}
	
	// Page Kinematics
	if (HmiGlobal.PageControl.ActPage == PAGE_SETUPKINEMATICS)
	{	
		// First Come to the Page Setup Kinematics
		if (OldPage != PAGE_SETUPKINEMATICS)
		{
			//Some Initialization and Loading of Values
			HmiSetupCtrl.Components.PageKine.LayerInfo.Layer.StatusDatapoint = 1;
			
			HmiSetupCtrl.Components.PageKine.LayerDefault.ButtonC45Enable.Value = HmiRetain.HmiRobot.Coupling[0].Enable;
			HmiSetupCtrl.Components.PageKine.LayerDefault.NumericC45Value.Value = HmiRetain.HmiRobot.Coupling[0].Coefficient;
			HmiSetupCtrl.Components.PageKine.LayerDefault.ButtonC56Enable.Value = HmiRetain.HmiRobot.Coupling[1].Enable;
			HmiSetupCtrl.Components.PageKine.LayerDefault.NumericC56Value.Value = HmiRetain.HmiRobot.Coupling[1].Coefficient;
			HmiSetupCtrl.Components.PageKine.LayerDefault.ButtonC46Enable.Value = HmiRetain.HmiRobot.Coupling[2].Enable;
			HmiSetupCtrl.Components.PageKine.LayerDefault.NumericC46Value.Value = HmiRetain.HmiRobot.Coupling[2].Coefficient;
			
			HmiSetupCtrl.Components.PageKine.LayerDefault.DropdownAxisSelect.SelectedIndex = 0;
			
			for (int i = 0; i < 6; ++i)
			{
				KineAxes[i].Mech.Direction = HmiRetain.HmiRobot.Mech[i].Direction;
				
				KineAxes[i].JointLimits.Max = HmiRetain.HmiRobot.JointLimits[i].Max;
				KineAxes[i].JointLimits.Min = HmiRetain.HmiRobot.JointLimits[i].Min;
				KineAxes[i].Mech.OffsetX = HmiRetain.HmiRobot.Mech[i].OffsetX;
				KineAxes[i].Mech.OffsetY = HmiRetain.HmiRobot.Mech[i].OffsetY;
				KineAxes[i].Mech.OffsetZ = HmiRetain.HmiRobot.Mech[i].OffsetZ;
				
			} 
		}	
		// Using Pointer to access the seleted Axis
		pKineAxis = &(KineAxes[HmiSetupCtrl.Components.PageKine.LayerDefault.DropdownAxisSelect.SelectedIndex]);
		
		// Save the Coupling and Geometry
		if (HmiSetupCtrl.Components.PageKine.LayerDefault.ButtonSave.Value > HmiSetupCtrl.Components.PageKine.LayerDefault.ButtonSave.OldValue)
		{
			HmiSetupCtrl.Components.PageKine.LayerInfo.Layer.StatusDatapoint = 0;
			
			HmiRetain.HmiRobot.Coupling[0].Enable = HmiSetupCtrl.Components.PageKine.LayerDefault.ButtonC45Enable.Value;
			HmiRetain.HmiRobot.Coupling[0].Coefficient = HmiSetupCtrl.Components.PageKine.LayerDefault.NumericC45Value.Value;
			HmiRetain.HmiRobot.Coupling[1].Enable = HmiSetupCtrl.Components.PageKine.LayerDefault.ButtonC56Enable.Value;
			HmiRetain.HmiRobot.Coupling[1].Coefficient = HmiSetupCtrl.Components.PageKine.LayerDefault.NumericC56Value.Value;
			HmiRetain.HmiRobot.Coupling[2].Enable = HmiSetupCtrl.Components.PageKine.LayerDefault.ButtonC46Enable.Value;
			HmiRetain.HmiRobot.Coupling[2].Coefficient = HmiSetupCtrl.Components.PageKine.LayerDefault.NumericC46Value.Value;
			
			for (int i = 0; i < 6; ++i)
				{
				HmiRetain.HmiRobot.Mech[i].Direction = KineAxes[i].Mech.Direction;
				
				HmiRetain.HmiRobot.JointLimits[i].Max = KineAxes[i].JointLimits.Max;
				HmiRetain.HmiRobot.JointLimits[i].Min = KineAxes[i].JointLimits.Min;
				HmiRetain.HmiRobot.Mech[i].OffsetX = KineAxes[i].Mech.OffsetX;
				HmiRetain.HmiRobot.Mech[i].OffsetY = KineAxes[i].Mech.OffsetY;
				HmiRetain.HmiRobot.Mech[i].OffsetZ = KineAxes[i].Mech.OffsetZ;
				
			} 
			
		}
		
	} else
	{
		
	}
	
	// Page Setup Main
	if (HmiGlobal.PageControl.ActPage == PAGE_SETUP)
	{
		// Visual Control 
		if (OldPage != PAGE_SETUP)
		{
			HmiSetupCtrl.Components.PageMain.LayerInfo.Layer.StatusDatapoint = 1;
		}
		
		if (HmiSetupCtrl.Components.PageMain.LayerDefault.HotspotRestart.Value > HmiSetupCtrl.Components.PageMain.LayerDefault.HotspotRestart.OldValue)
		{
			HmiSetupCtrl.Components.PageMain.LayerInfo.Layer.StatusDatapoint = 0;
		}		
		
		// Restart Button
		if (HmiSetupCtrl.Components.PageMain.LayerInfo.ButtonRestart.Value > HmiSetupCtrl.Components.PageMain.LayerInfo.ButtonRestart.OldValue)
		{
			SYSreset(1, 1);
		}
	}
	
	// PosEdge Detecting using programming way
	for (int i = 0; i < 6; ++i)
	{
		HmiSetupCtrl.Components.PageCalib.LayerDefault.ButtonAxisRefresh[i].OldValue = HmiSetupCtrl.Components.PageCalib.LayerDefault.ButtonAxisRefresh[i].Value;
		HmiSetupCtrl.Components.PageCalib.LayerDefault.ButtonAxisToggle[i].OldValue = HmiSetupCtrl.Components.PageCalib.LayerDefault.ButtonAxisToggle[i].Value;
	}
	
	HmiSetupCtrl.Components.PageCalib.LayerDefault.ButtonSave.OldValue = HmiSetupCtrl.Components.PageCalib.LayerDefault.ButtonSave.Value;
	
	HmiSetupCtrl.Components.PageKine.LayerDefault.ButtonSave.OldValue = HmiSetupCtrl.Components.PageKine.LayerDefault.ButtonSave.Value;
	
	HmiSetupCtrl.Components.PageMain.LayerDefault.HotspotRestart.OldValue = HmiSetupCtrl.Components.PageMain.LayerDefault.HotspotRestart.Value;
	HmiSetupCtrl.Components.PageMain.LayerInfo.ButtonRestart.OldValue = HmiSetupCtrl.Components.PageMain.LayerInfo.ButtonRestart.Value;
	
	OldPage = HmiGlobal.PageControl.ActPage;

}
