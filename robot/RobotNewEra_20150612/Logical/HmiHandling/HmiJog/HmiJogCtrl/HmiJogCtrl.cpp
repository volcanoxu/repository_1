/********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: HmiJogCtrl
 * File: HmiJogCtrl.cpp
 * Author: renj
 * Created: January 06, 2015
 ********************************************************************
 * Implementation of program HmiJogCtrl
 ********************************************************************/

#include <bur/plctypes.h>
#include <Arnc0mx.h>
#include <string>

#ifdef _DEFAULT_INCLUDES
#include <AsDefault.h>
#endif

unsigned long bur_heap_size = 0xFFFFF; 

using namespace std;

#define PI 3.1415926535897932384626433832795028841971

void _INIT HmiJogCtrlInit(void)
{	
	// Initialization
	HmiJog.Components.LayerDefault.NumericJogStep.Value = 2.0;
	for (int i = 0; i < 7; ++i)
		HmiJog.Components.LayerDefault.NumericPosSet[i].StatusDatapoint = 1; 
	
	HmiJog.Components.LayerDefault.TextSetVar.StatusDatapoint = 1;
	HmiJog.Components.LayerDefault.ButtonCheckVar.StatusDatapoint = 1;
	
	JointSync.JointAxis[0] = JointSync.JointAxis[0];
	PointSync.Pos = PointSync.Pos;
	FrmSync.Pos = FrmSync.Pos;
	ToolSync.Frame = ToolSync.Frame;

}

void _CYCLIC HmiJogCtrlCyclic(void)
{
	
	string EditorFileName(HmiRetain.HmiEditor.Name);
	string EditorDevice(HmiRetain.HmiEditor.Device);
	
	string JogFileName(HmiRetain.HmiJog.Name);
	string JogDevice(HmiRetain.HmiJog.Device);
	
	if ((HmiGlobal.Address.CncAddress != 0) &&	(HmiGlobal.Address.SystemAddress != 0) && (HmiGlobal.Address.AxesAddress != 0))
	{
		pCnc = (Cnc_Type*) HmiGlobal.Address.CncAddress;
		pSystem = (System_Type*) HmiGlobal.Address.SystemAddress;
		pAxes = (Axes_Type (*)[13]) HmiGlobal.Address.AxesAddress; 
	} else
	{
		return;		
	}
		
	// If Robot not homed and Axis not homed and Actual Posiition shouldnt be shown("NOT AVAILABLE")
	if ((HmiRetain.HmiKeyControl.MechHomeOK && pSystem->Output.Status.HomingOk) || HmiJog.Components.LayerDefault.TextActSet.TextIndex == 1)
	{
		HmiJog.Components.LayerDefault.TextNotAvailable.StatusDatapoint = 1;		
	}
	else
		HmiJog.Components.LayerDefault.TextNotAvailable.StatusDatapoint = 0;
	
	FrmSync = HmiRetain.HmiJog.Frame.Frame;
	ToolSync = HmiRetain.HmiJog.Tool.Tool;
	
	for (int i = 0; i < 6; ++ i) 
	JointLimitsSync[i] = HmiRetain.HmiRobot.JointLimits[i];
	
	// Joint Act is Decoupled Position
	for (int i = 0; i < 6; ++ i) 
		JointAct[i] = (*pAxes)[6+i].Output.Monitor.DecoupledPosition;
	
	// Calculate the TCP using the MXFunctions (Check if there are tools or Frames)
	if (ToolEnableSync)
		MXJointToPointEx((UDINT)&Robot_TRF, (double *)&JointAct, &Point, MX_CARDAN_XYZ_ANGLES, MX_TRF_TYPE_DIRECT, &ToolSync, &MX_FRAME_ZERO, &MX_POINT_ZERO);
	else
		MXJointToPointEx((UDINT)&Robot_TRF, (double *)&JointAct, &Point, MX_CARDAN_XYZ_ANGLES, MX_TRF_TYPE_DIRECT, &MX_TOOL_ZERO, &MX_FRAME_ZERO, &MX_POINT_ZERO);
	
	if (FrmEnableSync)
		MXToFrame(&FrmSync, &Point, &PointAct);
	else
		PointAct = Point;
	
	// Joint or TCP
	if (HmiJog.Components.LayerDefault.DropdownJointTCP.SelectedIndex == 0) // If Joint
	{
		// Do Once
		if (HmiJog.Components.LayerDefault.DropdownJointTCP.OldIndex == 1)
		{
			for (int i = 0; i < 6; ++i)
			{
				if (HmiJog.Components.LayerDefault.TextActSet.TextIndex == 1)
					HmiJog.Components.LayerDefault.NumericPosSet[i].Value = 0;
			}
		
		}
			
		for (int i = 0; i < 6; ++i)
		{
			HmiJog.Components.LayerDefault.TextPos[i].TextIndex = 0;
		}

		HmiJog.Components.LayerDefault.TextPos[6].StatusDatapoint = 1;
		HmiJog.Components.LayerDefault.NumericPos[6].StatusDatapoint = 1;
		HmiJog.Components.LayerDefault.NumericPosSet[6].StatusDatapoint = 1;
			
		if (HmiJog.Components.LayerDefault.DropdownDegreeRad.SelectedIndex == 0) // If Degree
		{
			// Do Once 
			if (HmiJog.Components.LayerDefault.DropdownDegreeRad.OldIndex == 1)
			{
				for (int i = 0; i < 6; ++i)
				{
					if (HmiJog.Components.LayerDefault.TextActSet.TextIndex == 1)
						HmiJog.Components.LayerDefault.NumericPosSet[i].Value = 0;
				}	
			} 
				
			for (int i = 0; i < 6; ++i)
			{
				HmiJog.Components.LayerDefault.TextPosUnit[i].TextIndex = 2;
				HmiJog.Components.LayerDefault.NumericPosSet[i].Min = HmiRetain.HmiRobot.JointLimits[i].Min;
				HmiJog.Components.LayerDefault.NumericPosSet[i].Max = HmiRetain.HmiRobot.JointLimits[i].Max;
			}	
				
			for (int i = 0; i < 6; ++i)
				HmiJog.Components.LayerDefault.NumericPos[i].Value = JointAct[i];
				
		} else //If Radian
		{
			// Do Once
			if (HmiJog.Components.LayerDefault.DropdownDegreeRad.OldIndex == 0)
			{
										
				if (HmiJog.Components.LayerDefault.TextActSet.TextIndex == 1)
				{
					for (int i = 0; i < 6; ++i)
						HmiJog.Components.LayerDefault.NumericPosSet[i].Value = 0;
				}
			} 
				
			for (int i = 0; i < 6; ++i)
				{
				HmiJog.Components.LayerDefault.TextPosUnit[i].TextIndex = 3;
				HmiJog.Components.LayerDefault.NumericPosSet[i].Min = HmiRetain.HmiRobot.JointLimits[i].Min/180*PI;
				HmiJog.Components.LayerDefault.NumericPosSet[i].Max = HmiRetain.HmiRobot.JointLimits[i].Max/180*PI;
			}

				
			for (int i = 0; i < 6; ++i)
				HmiJog.Components.LayerDefault.NumericPos[i].Value = JointAct[i]/180 * PI;	
		}
			
	} else // If TCP
	{
		// Do Once
		if (HmiJog.Components.LayerDefault.DropdownJointTCP.OldIndex == 0)
		{	
			if (HmiJog.Components.LayerDefault.TextActSet.TextIndex == 1)
			{
				HmiJog.Components.LayerDefault.NumericPosSet[0].Value = HmiRetain.HmiRobot.HomePos.Pos.x;
				HmiJog.Components.LayerDefault.NumericPosSet[1].Value = HmiRetain.HmiRobot.HomePos.Pos.y;
				HmiJog.Components.LayerDefault.NumericPosSet[2].Value = HmiRetain.HmiRobot.HomePos.Pos.z;
					
				if (HmiJog.Components.LayerDefault.DropdownEulerQuan.SelectedIndex == 0)
				{
					for (int i = 0; i < 3; ++i)
						HmiJog.Components.LayerDefault.NumericPosSet[i + 3].Value = 0;
				} else
				{
					HmiJog.Components.LayerDefault.NumericPosSet[3].Value = 1; 
					for (int i = 4; i < 7; ++i)
						HmiJog.Components.LayerDefault.NumericPosSet[i].Value = 0;
				}
			}
					
		}
			
		for (int i = 0; i < 3; ++i)
		{
			HmiJog.Components.LayerDefault.TextPos[i].TextIndex = 1;
			HmiJog.Components.LayerDefault.TextPosUnit[i].TextIndex = 1;
		}
		// Set the Limit for the Inputs
		HmiJog.Components.LayerDefault.NumericPosSet[0].Min = HmiRetain.HmiRobot.CartesianLimits[0].Min;
		HmiJog.Components.LayerDefault.NumericPosSet[1].Min = HmiRetain.HmiRobot.CartesianLimits[1].Min;
		HmiJog.Components.LayerDefault.NumericPosSet[2].Min = HmiRetain.HmiRobot.CartesianLimits[2].Min;
			
		HmiJog.Components.LayerDefault.NumericPosSet[0].Max = HmiRetain.HmiRobot.CartesianLimits[0].Max;
		HmiJog.Components.LayerDefault.NumericPosSet[1].Max = HmiRetain.HmiRobot.CartesianLimits[1].Max;
		HmiJog.Components.LayerDefault.NumericPosSet[2].Max = HmiRetain.HmiRobot.CartesianLimits[2].Max;
			
		HmiJog.Components.LayerDefault.NumericPos[0].Value = PointAct.Pos.x;
		HmiJog.Components.LayerDefault.NumericPos[1].Value = PointAct.Pos.y;
		HmiJog.Components.LayerDefault.NumericPos[2].Value = PointAct.Pos.z;
			
		if (HmiJog.Components.LayerDefault.DropdownEulerQuan.SelectedIndex == 0) // If Euler
		{
			// Do Once
			if (HmiJog.Components.LayerDefault.DropdownEulerQuan.OldIndex == 1)
			{				
				for (int i = 3; i < 6; ++i)
				{
					if (HmiJog.Components.LayerDefault.TextActSet.TextIndex == 1)
						HmiJog.Components.LayerDefault.NumericPosSet[i].Value = 0;
				}
			}
				
			for (int i = 3; i < 6; ++i)
			{
				HmiJog.Components.LayerDefault.TextPos[i].TextIndex = 1;
			}
				
			HmiJog.Components.LayerDefault.TextPos[6].StatusDatapoint = 1;
			HmiJog.Components.LayerDefault.NumericPos[6].StatusDatapoint = 1;
			HmiJog.Components.LayerDefault.NumericPosSet[6].StatusDatapoint = 1;
				
			if (HmiJog.Components.LayerDefault.DropdownDegreeRad.SelectedIndex == 0) // If Degree
			{
				// Do Once
				if (HmiJog.Components.LayerDefault.DropdownDegreeRad.OldIndex == 1)
				{
					for (int i = 3; i < 6; ++i)
						{		
						if (HmiJog.Components.LayerDefault.TextActSet.TextIndex == 1)
							HmiJog.Components.LayerDefault.NumericPosSet[i].Value = 0;
					}

				}
					
				for (int i = 3; i < 6; ++i)
					{
					HmiJog.Components.LayerDefault.TextPosUnit[i].TextIndex = 2;
					HmiJog.Components.LayerDefault.NumericPosSet[i].Min = -360;
					HmiJog.Components.LayerDefault.NumericPosSet[i].Max = 360;
				}
					
				for (int i = 3; i < 6; ++i)
					HmiJog.Components.LayerDefault.NumericPos[i].Value = PointAct.Orient.Angle[i - 3];

			} else // If Radian
			{
				// Do Once
				if (HmiJog.Components.LayerDefault.DropdownDegreeRad.OldIndex == 0)
				{
					for (int i = 3; i < 6; ++i)
						{
							
						if (HmiJog.Components.LayerDefault.TextActSet.TextIndex == 1)
							HmiJog.Components.LayerDefault.NumericPosSet[i].Value = 0;
					}
				}
							
				for (int i = 3; i < 6; ++i)
					{
					HmiJog.Components.LayerDefault.TextPosUnit[i].TextIndex = 3;
					HmiJog.Components.LayerDefault.NumericPosSet[i].Min = - 2 * PI;
					HmiJog.Components.LayerDefault.NumericPosSet[i].Max = 2 * PI;
					
					HmiJog.Components.LayerDefault.NumericPos[i].Value = PointAct.Orient.Angle[i - 3]/180*PI;
				}
			}
				
		} else // If Quanternion
		{
			// Do Once
			if (HmiJog.Components.LayerDefault.DropdownEulerQuan.OldIndex == 0)
			{	
				if (HmiJog.Components.LayerDefault.TextActSet.TextIndex == 1)
				{
					HmiJog.Components.LayerDefault.NumericPosSet[3].Value = 1;
					for (int i = 4; i < 7; ++ i)
						HmiJog.Components.LayerDefault.NumericPosSet[i].Value = 0;
				}
			}
				
			HmiJog.Components.LayerDefault.TextPos[6].StatusDatapoint = 0;
				
			if (HmiJog.Components.LayerDefault.TextActSet.TextIndex == 0)
				HmiJog.Components.LayerDefault.NumericPos[6].StatusDatapoint = 0;
			else
				HmiJog.Components.LayerDefault.NumericPosSet[6].StatusDatapoint = 0;
					
			for (int i = 3; i < 6; ++i)
				{
				HmiJog.Components.LayerDefault.TextPos[i].TextIndex = 2;
				HmiJog.Components.LayerDefault.TextPosUnit[i].TextIndex = 0;
			}
					
			for (int i = 3; i < 7; ++i)
				{
				HmiJog.Components.LayerDefault.NumericPosSet[i].Min = -1;
				HmiJog.Components.LayerDefault.NumericPosSet[i].Max = 1;
			}
					
				
			LREAL RefAngle[3] = {0};
			MXConvertOrient(&PointAct.Orient, MX_QUATERNION, &Point.Orient, RefAngle); // Redo the Caculation for Quaternion
			PointAct.Orient = Point.Orient;
				
			for (int i = 3; i < 7; ++i)
				HmiJog.Components.LayerDefault.NumericPos[i].Value = PointAct.Orient.Angle[i - 3];
					
		}
			
	}
	
	// CNC Sync Variable For Jog Prog
	ToolEnableSync = HmiJog.Components.LayerDefault.ButtoToolCheck.Value == 1;
	FrmEnableSync = HmiJog.Components.LayerDefault.ButtonWorkObjectCheck.Value == 1;
	JogStepSync = HmiJog.Components.LayerDefault.NumericJogStep.Value;
	
	if (EditorFileName == "" || EditorDevice == "") // No Program/ Not Selected / Variable Name
	{
		HmiJog.Components.LayerDefault.TextToolName.TextIndex = 1; // No Prg
		HmiJog.Components.LayerDefault.TextWorkObjectName.TextIndex = 1; // No Prg
		HmiJog.Components.LayerDefault.ButtoToolCheck.Value = 0;
		HmiJog.Components.LayerDefault.ButtonWorkObjectCheck.Value = 0;
	} else
	{
		// Browse the Vars from the Editor Data Page
		if (HmiJog.Components.LayerDefault.HotSpotFrameBrowse.Value > HmiJog.Components.LayerDefault.HotSpotFrameBrowse.OldValue)
		{
			HmiGlobal.PageControl.SetPage = PAGE_EDITOR_DATA;
			HmiEditorCtrl.Components.PageData.LayerDefault.DropDownTypes.SelectedIndex = 2;
		}
		
		if (HmiJog.Components.LayerDefault.HotSpotToolBrowse.Value > HmiJog.Components.LayerDefault.HotSpotToolBrowse.OldValue)
		{
			HmiGlobal.PageControl.SetPage = PAGE_EDITOR_DATA;
			HmiEditorCtrl.Components.PageData.LayerDefault.DropDownTypes.SelectedIndex = 3;
		}
		
		if (JogFileName == "" || JogDevice == "")
		{
			HmiJog.Components.LayerDefault.TextToolName.TextIndex = 0; // Not Selected
			HmiJog.Components.LayerDefault.TextWorkObjectName.TextIndex = 0; // Not Selected
			HmiJog.Components.LayerDefault.ButtoToolCheck.Value = 0;
			HmiJog.Components.LayerDefault.ButtonWorkObjectCheck.Value = 0;
		} else
		{
			if (JogFileName != EditorFileName || JogDevice != EditorDevice)
			{
				HmiJog.Components.LayerDefault.TextToolName.TextIndex = 0; // Not Selected
				HmiJog.Components.LayerDefault.TextWorkObjectName.TextIndex = 0; // Not Selected
				HmiJog.Components.LayerDefault.ButtoToolCheck.Value = 0;
				HmiJog.Components.LayerDefault.ButtonWorkObjectCheck.Value = 0;
			} else
			{
				if (strcmp(HmiRetain.HmiJog.Tool.VarName, "") != 0)
					HmiJog.Components.LayerDefault.TextToolName.TextIndex = 2; // Tool
				else
					HmiJog.Components.LayerDefault.ButtoToolCheck.Value = 0;
				
				if (strcmp(HmiRetain.HmiJog.Frame.VarName, "") != 0)
					HmiJog.Components.LayerDefault.TextWorkObjectName.TextIndex = 2; // Frame
				else 
					HmiJog.Components.LayerDefault.ButtonWorkObjectCheck.Value = 0;
			}
		}
	}
	
	// Set/Act Point for Jog to Certain Point/Joint
	if (HmiJog.Components.LayerDefault.ButtonActSet.Value > HmiJog.Components.LayerDefault.ButtonActSet.OldValue)
	{
		HmiJog.Components.LayerDefault.TextActSet.TextIndex = 1 - HmiJog.Components.LayerDefault.TextActSet.TextIndex;
		if (HmiJog.Components.LayerDefault.TextActSet.TextIndex == 0) // Act Position
		{
			for (int i = 0; i < 7; ++i)
			{
				HmiJog.Components.LayerDefault.NumericPosSet[i].StatusDatapoint = 1;
			}
			HmiJog.Components.LayerDefault.TextSetVar.StatusDatapoint = 1;
			HmiJog.Components.LayerDefault.ButtonCheckVar.StatusDatapoint = 1;
					
		} else // Set Position
		{
			
			HmiJog.Components.LayerDefault.TextSetVar.StatusDatapoint = 0;
			HmiJog.Components.LayerDefault.ButtonCheckVar.StatusDatapoint = 0;
			
			for (int i = 0; i < 7; ++i)
			{
				HmiJog.Components.LayerDefault.NumericPosSet[i].StatusDatapoint = 0;
			}
		
		}
	}
	
	if (HmiJog.Components.LayerDefault.TextActSet.TextIndex == 1) // Set Position Control
	{
		if (HmiJog.Components.LayerDefault.HotSpotSetBrowse.Value > HmiJog.Components.LayerDefault.HotSpotSetBrowse.OldValue && 
			(EditorFileName != "" && EditorDevice != ""))
		{
			HmiGlobal.PageControl.SetPage = PAGE_EDITOR_DATA;
			if (HmiJog.Components.LayerDefault.DropdownJointTCP.SelectedIndex == 0)
				HmiEditorCtrl.Components.PageData.LayerDefault.DropDownTypes.SelectedIndex = 1;
			else
				HmiEditorCtrl.Components.PageData.LayerDefault.DropDownTypes.SelectedIndex = 0;
		}
			
		if (EditorFileName == "" || EditorDevice == "")
		{
			HmiJog.Components.LayerDefault.ButtonCheckVar.Value = 0;
			HmiJog.Components.LayerDefault.TextSetVar.TextIndex = 1; // No Prg
			
		} else
		{
			if (JogFileName == "" || JogDevice == "")
			{
				HmiJog.Components.LayerDefault.ButtonCheckVar.Value = 0;
				HmiJog.Components.LayerDefault.TextSetVar.TextIndex = 0; // Not Selected
			} else
			{
				if (JogFileName != EditorFileName || JogDevice != EditorDevice)
				{
					HmiJog.Components.LayerDefault.ButtonCheckVar.Value = 0;
					HmiJog.Components.LayerDefault.TextSetVar.TextIndex = 0; // Not Selected
				} else
				{
					if (HmiRetain.HmiJog.Point.Set)
						HmiJog.Components.LayerDefault.TextSetVar.TextIndex = 2; // Point
					else if (HmiRetain.HmiJog.Joint.Set)
						HmiJog.Components.LayerDefault.TextSetVar.TextIndex = 3; // Joint
					else
					{
						HmiJog.Components.LayerDefault.TextSetVar.TextIndex = 0;
						HmiJog.Components.LayerDefault.ButtonCheckVar.Value = 0;
					}
				}
			}
		}

	}
		
	// Edge Detection
	HmiJog.Components.LayerDefault.ButtonActSet.OldValue = HmiJog.Components.LayerDefault.ButtonActSet.Value;
	HmiJog.Components.LayerDefault.HotSpotSetBrowse.OldValue = HmiJog.Components.LayerDefault.HotSpotSetBrowse.Value;
	HmiJog.Components.LayerDefault.HotSpotFrameBrowse.OldValue = HmiJog.Components.LayerDefault.HotSpotFrameBrowse.Value;
	HmiJog.Components.LayerDefault.HotSpotToolBrowse.OldValue = HmiJog.Components.LayerDefault.HotSpotToolBrowse.Value;
	HmiJog.Components.LayerDefault.DropdownDegreeRad.OldIndex = HmiJog.Components.LayerDefault.DropdownDegreeRad.SelectedIndex;
	HmiJog.Components.LayerDefault.DropdownEulerQuan.OldIndex = HmiJog.Components.LayerDefault.DropdownEulerQuan.SelectedIndex;
	HmiJog.Components.LayerDefault.DropdownJointTCP.OldIndex = HmiJog.Components.LayerDefault.DropdownJointTCP.SelectedIndex;
	
	
}
