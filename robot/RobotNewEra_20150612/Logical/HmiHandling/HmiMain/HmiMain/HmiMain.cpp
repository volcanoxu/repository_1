/********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: HmiMain
 * File: HmiMain.cpp
 * Author: renj
 * Created: November 17, 2014
 ********************************************************************
 * Implementation of program HmiMain
 ********************************************************************/

#include <bur/plctypes.h>
#include <string>
#include <fileio.h>
#include "CusLib.hpp"


#ifdef _DEFAULT_INCLUDES
#include <AsDefault.h>
#endif

using namespace std;

unsigned long bur_heap_size = 0xFFFFF; 

string ConvBuf; // the Buffer for the Programs to be shown(including the Line No)
bool ClearDone; 

void _INIT HmiMainInit(void)
{

}

void _CYCLIC HmiMainCyclic(void)
{
	/**                          Initialization                              **/	
	if (HmiGlobal.PageControl.ActPage == PAGE_MAIN)
	{
		if ((HmiGlobal.Address.CncAddress != 0) && (HmiGlobal.Address.SystemAddress != 0))
		{
			pCnc = (Cnc_Type *)(HmiGlobal.Address.CncAddress);
			pSystem = (System_Type *)(HmiGlobal.Address.SystemAddress);

		} else
		{		
			Internal.MainEditCtrlState = HMIMAIN_WAIT;
			return;		
		}
		
		// Highlight line calc
		UINT ActCNCLine;
		if (atoi(pCnc->Output.Monitor.NcBlock.TextActual) > 0)
			ActCNCLine = (UINT)(atoi(pCnc->Output.Monitor.NcBlock.TextActual));

		size_t LineNo, Pos;
	
		string FileName;
		
		switch (Internal.MainEditCtrlState)
		{
			case HMIMAIN_WAIT:
				// Read the Program into Buffer
				if (strcmp(HmiRetain.HmiProgram.Name, "") != 0 && strcmp(HmiRetain.HmiProgram.Device, "") != 0)
				{
					memset(HmiMainCtrl.Components.EditPrgRun.StringBuffer, 0, sizeof(HmiMainCtrl.Components.EditPrgRun.StringBuffer));
					strcpy(HmiFileCtrl.Input.Parameter.FileDevice, HmiRetain.HmiProgram.Device);
					FileName.assign(HmiRetain.HmiProgram.Name);
					strcpy(HmiFileCtrl.Input.Parameter.FileName, FileName.append(".st").c_str());
					
					HmiFileCtrl.Input.Parameter.StringBufferAdr = (UDINT)Internal.StringBuffer;
					HmiFileCtrl.Input.Parameter.StringBufferSize = sizeof(Internal.StringBuffer);
					
					memset(Internal.StringBuffer, 0, sizeof(Internal.StringBuffer));
					HmiFileCtrl.Input.Command.Read = 1;
					
					HmiMainCtrl.Components.TextFileName.TextIndex = 1;
					
					Internal.MainEditCtrlState = HMIMAIN_READWAIT;
				
				} else // No Program Available and the Text is gonna be shown. Do ONLY ONCE!!! ClearDone is reset when leaving the Main Page
				{ 
					if (!ClearDone)
					{
						memset(HmiMainCtrl.Components.EditPrgRun.StringBuffer, 0, sizeof(HmiMainCtrl.Components.EditPrgRun.StringBuffer));
						strcpy(HmiMainCtrl.Components.EditPrgRun.StringBuffer, "No Program Available");
						HmiMainCtrl.Components.TextFileName.TextIndex = 0;
						ClearDone = 1;
					}
				}
	
				break;
		
			case HMIMAIN_READWAIT:
				// File Read is done by separate task HmiFile
				if (HmiFileCtrl.Input.Command.Read == 0)
				{
					if (HmiFileCtrl.Output.Status.ReadOK)
					{
						ConvBuf.assign(Internal.StringBuffer);
						Internal.MainEditCtrlState = HMIMAIN_READPROCESS;
					
					} else 
						Internal.MainEditCtrlState = HMIMAIN_ERROR;
				}
				break;
		
			case HMIMAIN_READPROCESS: // After Reading the File, add the Line No.
			
				ConvBuf.insert(0, StringHelper::GetLineNoStr(1));
			
				Pos = 0;
				LineNo = 2;
			
				while(true)
				{
					// Find "\r\n" and add Line No
					Pos = ConvBuf.find("\r\n", Pos);
				
					if (Pos == string::npos)
					{
						break;
				
					} else
					{
						Pos = Pos + 2;
						ConvBuf.insert(Pos, StringHelper::GetLineNoStr(LineNo)); // Generate teh Line No in this style "0008"
						LineNo++;
					}
				}
				// Set the Value of StringBuffer
				memcpy(HmiMainCtrl.Components.EditPrgRun.StringBuffer, ConvBuf.data(), ConvBuf.size());
			
				Internal.MainEditCtrlState = HMIMAIN_LOADED;
			
				break;
		
			case HMIMAIN_LOADED:
				// To Make sure the cursor is always set on the first col
				if (HmiMainCtrl.Components.EditPrgRun.CursorCol != 1 && HmiMainCtrl.Components.EditPrgRun.CommandStatus == 0)
				{
					stringstream ss;
					ss << "goto col=1 line=" << HmiMainCtrl.Components.EditPrgRun.CursorLine;
					strcpy(HmiMainCtrl.Components.EditPrgRun.CommandRequest, ss.str().c_str());
				
					HmiMainCtrl.Components.EditPrgRun.CommandStatus = 1;
					
				}
					
				if (pCnc->Output.State.Moving == 1) // If Program is running, the Highlight cannot be set
				{
					if (ActCNCLine != 0 
						&& HmiMainCtrl.Components.EditPrgRun.CursorLine != ActCNCLine ) // Always Point to the Actual CNC Line
					{	
						stringstream ss;
						ss << "highlight line=" << ActCNCLine;
						strcpy(HmiMainCtrl.Components.EditPrgRun.CommandRequest, ss.str().c_str());
				
						HmiMainCtrl.Components.EditPrgRun.CommandStatus = 1;
					
						Internal.MainEditCtrlState = HMIMAIN_HIGHLIGHT_WAIT;			
					} 
					
					HmiMainCtrl.Components.HotSpotPrgRun.StatusDatapoint = 0;
					
				} else
				{
					// Make the Hotspot Disappear to allow the User to change the Highlight line
					HmiMainCtrl.Components.HotSpotPrgRun.StatusDatapoint = 1;
					
					// Make sure the Edit Components in Edit Mode so the User can change the Highlight Line
					if ((HmiMainCtrl.Components.EditPrgRun.StatusDatapoint & (16384)) == 16384 && // 16384 means focused
						(HmiMainCtrl.Components.EditPrgRun.StatusDatapoint & (32768)) == 0 &&  // 32768 means in Edit Mode
						HmiMainCtrl.Components.EditPrgRun.CommandStatus == 0) // When its not busy
					{
						stringstream ss; // Highlight the LINE "PROGRAM _MAIN " at very beginning
						ss << "highlight line=" << StringHelper::StringTo<int>(ConvBuf.substr(ConvBuf.find("PROGRAM _MAIN") - 5, 4));
						
						strcpy(HmiMainCtrl.Components.EditPrgRun.CommandRequest, ss.str().c_str());
						HmiMainCtrl.Components.EditPrgRun.CommandStatus = 1;
						
					}
					// When Jump to Main is pressed, highlight the Line "PROGRAM _MAIN"
					if (HmiMainCtrl.Components.ButtonJumpToMain.Value > HmiMainCtrl.Components.ButtonJumpToMain.OldValue)
					{
						stringstream ss;
						ss << "highlight line=" << StringHelper::StringTo<int>(ConvBuf.substr(ConvBuf.find("PROGRAM _MAIN") - 5, 4));
	
						strcpy(HmiMainCtrl.Components.EditPrgRun.CommandRequest, ss.str().c_str());
				
						HmiMainCtrl.Components.EditPrgRun.CommandStatus = 1;
					
						Internal.MainEditCtrlState = HMIMAIN_HIGHLIGHT_WAIT;	
						
					}
					
					
					// WHEN current Cursor is between "PROGRAM _MAIN" and "END_PROGRAM", the Ptr can be set in this case
					if (HmiMainCtrl.Components.EditPrgRun.CursorLine > StringHelper::StringTo<int>(ConvBuf.substr(ConvBuf.find("PROGRAM _MAIN") - 5, 4)) && 
						HmiMainCtrl.Components.EditPrgRun.CursorLine < StringHelper::StringTo<int>(ConvBuf.substr(ConvBuf.find("END_PROGRAM") - 5, 4)))
					{	// Set the Program Ptr
						if (HmiMainCtrl.Components.ButtonSetPtr.Value > HmiMainCtrl.Components.ButtonSetPtr.OldValue)
						{
							HmiRetain.HmiProgram.Ptr = HmiMainCtrl.Components.EditPrgRun.CursorLine;
						}
					}
					
				}
				
				break;
			
			case HMIMAIN_HIGHLIGHT_WAIT: // Acutally the State is not Necessary but kept anyway
				
				if (HmiMainCtrl.Components.EditPrgRun.CommandStatus == 0)
				{
					Internal.MainEditCtrlState = HMIMAIN_LOADED;
				} else if (HmiMainCtrl.Components.EditPrgRun.CommandStatus == 65533 || HmiMainCtrl.Components.EditPrgRun.CommandStatus == 65534)
				{
					Internal.MainEditCtrlState = HMIMAIN_ERROR;
				}
				break;
		
			case HMIMAIN_ERROR:
				break;
			
		}
	
	} else
	{		
		Internal.MainEditCtrlState = HMIMAIN_WAIT;	
		ClearDone = 0; // Everytime leave the Page the ClearDone is reset
	}
	
	// Button Edge Detection
	HmiMainCtrl.Components.ButtonJumpToMain.OldValue = HmiMainCtrl.Components.ButtonJumpToMain.Value;
	HmiMainCtrl.Components.ButtonSetPtr.OldValue = HmiMainCtrl.Components.ButtonSetPtr.Value;
		
}
