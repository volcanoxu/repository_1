/********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: HmiPrgNew
 * File: HmiProgram.cpp
 * Author: renj
 * Created: December 02, 2014
 ********************************************************************
 * Implementation of program HmiPrgNew
 ********************************************************************/

#include <bur/plctypes.h>
#include <fileio.h>
#include <string.h>
#include <standard.h> 
#include <string>
#include <vector>
#include <AsTime.h>
#include "CusLib.hpp"
#include <iomanip>
#include <algorithm>

#ifdef _DEFAULT_INCLUDES
#include <AsDefault.h>
#endif

using namespace std;

unsigned long bur_heap_size = 0xFFFFF; 

// Define the File Entry Type
class FileInfoData
{
	public:
	FileInfoData(string FileName, string Date, string FileLength) // Including Name Date and Length
	{
		FileName_ = FileName;
		Date_ = Date;
		FileLength_ = FileLength;
	}

	string GetFileName()
	{
		return FileName_;
	}
	
	string GetDate()
	{
		return Date_;
	}
	
	string GetFileLength()
	{
		return FileLength_;
	}
	
	bool operator < (const FileInfoData & FileInfoDataSelf) const { // Compare method definition: for Sorting 
		
		string str1 = FileName_;
		string str2 = FileInfoDataSelf.FileName_;
		transform(str1.begin(), str1.end(), str1.begin(), ::tolower);
		transform(str2.begin(), str2.end(), str2.begin(), ::tolower);
		
		return str1 < str2; 
	}
	
	bool operator == (const FileInfoData& FileInfoDataSelf) const { // Redundant (Not Used)
	
		string str1 = FileName_;
		string str2 = FileInfoDataSelf.FileName_;
		transform(str1.begin(), str1.end(), str1.begin(), ::tolower);
		transform(str2.begin(), str2.end(), str2.begin(), ::tolower);
		
		return str1 == str2;
	}

	private:
	string FileName_; // Values of the Class FileInfoData
	string Date_;
	string FileLength_;	
};

class DeviceInfoData // Device Info
{
	public:
	DeviceInfoData(string DeviceName)
	{
		DeviceName_ = DeviceName;
	}
	
	string GetDeviceName()
	{
		return DeviceName_;
	}
	
	void SetDeviceID(UDINT DeviceID)
	{
		DeviceID_ = DeviceID;
	}
	
	UDINT GetDeviceID()
	{
		return DeviceID_;
	}
	private:
	
	string DeviceName_;
	UDINT DeviceID_;
	
};

vector<FileInfoData> STFiles; // Store all the Files
vector<FileInfoData>::iterator STFilesIter; // Iterator to go through Files
vector<FileInfoData>::iterator STFilesIterStart; // Mark the StartPos of Iterator
vector<DeviceInfoData> Devices; // Store all the Devices
string FileNameSource, DeviceNameSource, FileNameNew, FileName; // All the Temp Strings
bool FileCopied, FileCut; // To mark copy/cut State

void _INIT HmiProgramInit(void)  
{
	// File Device, no device Link used, only Fixed Filedevice 
	Devices.push_back(DeviceInfoData("CNC_PrgDir"));
	strcpy(HmiProgram.Components.LayerDefault.ListboxDevices.Entries[0], "CF Card");
	HmiProgram.Components.LayerDefault.ListboxDevices.MaxListIndex = (USINT)Devices.size() - 1;
	// Handle all the Layers
	HmiProgram.Components.LayerDeletePopup.Layer.StatusDatapoint = 1;
	HmiProgram.Components.LayerNewPopup.Layer.StatusDatapoint = 1;
	HmiProgram.Components.LayerRenamePopup.Layer.StatusDatapoint = 1;
	HmiProgram.Components.LayerCutPopup.Layer.StatusDatapoint = 1;
	// Sample Program. Every Program should contain following content.
	strcpy(EMPTY_STFILE, "VAR CONSTANT\r\nEND_VAR\r\n\r\nVAR\r\nEND_VAR\r\n\r\nPROGRAM _MAIN\r\n(* Your Code *)\r\nEND_PROGRAM");
}

void _CYCLIC HmiProgramCyclic(void)
{
	/* Waits till the Addresses of the used elements are assigned, in case the page is not active, the execution of the task stops */
	if (HmiGlobal.PageControl.ActPage == PAGE_PROGRAM)
	{
	
		if ((HmiGlobal.Address.CncAddress != 0) &&	(HmiGlobal.Address.SystemAddress != 0))
		{
			pCnc = (Cnc_Type*) HmiGlobal.Address.CncAddress;
			pSystem = (System_Type*) HmiGlobal.Address.SystemAddress;
		} else
		{
			Internal.State = HMIPROGRAM_DIRINITREAD;
			return;		
		}
	
		/* Reset the Internal.SubState when change of the Internal.State */
		if (Internal.State != Internal.OldState)
		{
			Internal.SubState = 0;
			Internal.OldState = Internal.State;
		}
		
		vector<FileInfoData>::iterator iter;

		switch (Internal.State)
		{	
			// Read All the ST-Files into STFiles
			case HMIPROGRAM_DIRINITREAD:
			
				switch (Internal.SubState)
				{
					case 0: // Open the Dir first
						FB_DirOpen.enable = 1;
						FB_DirOpen.pDevice = (UDINT)(Devices[HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex].GetDeviceName().c_str());
						FB_DirOpen.pName = (UDINT)&("");
						
						DirOpen(&FB_DirOpen);
				
						if (FB_DirOpen.status == ERR_OK)
						{
							Devices[HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex].SetDeviceID(FB_DirOpen.ident);
							STFiles.clear();
							Internal.SubState = 2;
						} else if (FB_DirOpen.status != ERR_FUB_BUSY)
						{
							Internal.State = HMIPROGRAM_ERROR;
						}
				
						break;
				
					case 2: // Read the Files
						while (true)
						{
							FB_DirReadEx.enable = 1;
							FB_DirReadEx.ident = Devices[HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex].GetDeviceID();
							FB_DirReadEx.pData = (UDINT)&FileInfoReadDataEx;
							FB_DirReadEx.data_len = sizeof(FileInfoReadDataEx);
						
							DirReadEx(&FB_DirReadEx);
						
							if (FB_DirReadEx.status == ERR_OK)
							{
								string FileName((char*)FileInfoReadDataEx.Filename);
								size_t PosST = FileName.find(".st");
							
								if (FileInfoReadDataEx.Mode == fiFILE && PosST != string::npos) // Only Store the ".st" Files
								{
									DT_TO_DTStructure(FileInfoReadDataEx.Date, (UDINT)&DTStruct);
									// Insert the File Entry into FilesVector
									STFiles.push_back(FileInfoData(FileName.substr(0, PosST), StringHelper::DTStructToString(DTStruct), StringHelper::ToString(FileInfoReadDataEx.Filelength/1024)));
								}
							
							} else if (FB_DirReadEx.status == fiERR_NO_MORE_ENTRIES) // No more files
							{
								Internal.SubState = 3;
								break;
							} else if (FB_DirReadEx.status != ERR_FUB_BUSY)
							{
								Internal.State = HMIPROGRAM_ERROR;
								break;
							}
						}
						break;
				
					case 3: // Close the Dir
					
						FB_DirClose.enable = 1;
						FB_DirClose.ident = Devices[HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex].GetDeviceID();
					
						DirClose(&FB_DirClose);
					
						if (FB_DirClose.status == ERR_OK)
						{
							// Process the Entries to be shown according to Actual Entry Index
							memset(&HmiProgram.Components.LayerDefault.ListboxFiles, 0, sizeof(HmiProgram.Components.LayerDefault.ListboxFiles));
							
							// Handles the ST Files to be shown
							if (STFiles.size() != 0)
							{
								// Sorting Afterwards according to Name
								sort(STFiles.begin(), STFiles.end());
		
								STFilesIter = STFiles.begin(); // Point the Iterator to the beginning of the list
								
							} 
							// Save the FileDevice 
							HmiProgram.Components.LayerDefault.ListboxDevices.OldSelectedIndex = HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex;
							
							Internal.State = HMIPROGRAM_LISTSHOW;
					
						} else if (FB_DirClose.status != ERR_FUB_BUSY)
						{
							Internal.State = HMIPROGRAM_ERROR;
						}
					
						break;
				}
				break;
			
			case HMIPROGRAM_LISTSHOW:
				// Reset the Contents of the Listbox Files
				memset(&HmiProgram.Components.LayerDefault.ListboxFiles, 0, sizeof(HmiProgram.Components.LayerDefault.ListboxFiles));
				
				if (STFiles.size() != 0)
				{
					int EntryIter = 0;
					STFilesIterStart = STFilesIter;
					
					// Generate the String Entry of each Program Line
					for(; STFilesIter != STFiles.end() && EntryIter < MAX_FILESVIEW; ++STFilesIter, ++ EntryIter)
					{
						stringstream ss;
								
						ss.setf(ios::left);
						ss.width(22);
						if ((*STFilesIter).GetFileName().length() > 22)
							ss << ((*STFilesIter).GetFileName().substr(0,19) + "...");
						else
							ss << (*STFilesIter).GetFileName();
									
						ss.setf(ios::right);
						ss.width(11);
						ss << ((*STFilesIter).GetFileLength() + " KB");
									
						ss.setf(ios::right);
						ss.width(17);
						ss << (*STFilesIter).GetDate();
						
						strcpy(HmiProgram.Components.LayerDefault.ListboxFiles.Entries[EntryIter],ss.str().c_str());
					}
									
					HmiProgram.Components.LayerDefault.ListboxFiles.MaxListIndex = EntryIter - 1;
								
				} else
				{
					// If No Programs, show "<NONE>"
					STFilesIterStart = STFilesIter;
					strcpy(HmiProgram.Components.LayerDefault.ListboxFiles.Entries[0], "<None>");
					HmiProgram.Components.LayerDefault.ListboxFiles.MaxListIndex = 0;
				}
				
				Internal.State = HMIPROGRAM_IDLE;
				
				break;
		
			case HMIPROGRAM_IDLE:	// IDLE State
			
				// Waits for a command 	
				//Different Device selected 
				if ( HmiProgram.Components.LayerDefault.ListboxDevices.OldSelectedIndex != HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex)
				{
					Internal.State = HMIPROGRAM_DIRINITREAD; // Reload the FileDevice
				} else if ( HmiProgram.Components.LayerDefault.ButtonPageUp.Value >  HmiProgram.Components.LayerDefault.ButtonPageUp.OldValue && 
					STFiles.size() != 0 && STFilesIterStart!= STFiles.begin()) // Page Up pressed
				{
					if (STFilesIterStart - MAX_FILESVIEW < STFiles.begin())
						STFilesIter = STFiles.begin();
					else
						STFilesIter = STFilesIterStart - MAX_FILESVIEW;
					
					Internal.State = HMIPROGRAM_LISTSHOW;
				} else if (HmiProgram.Components.LayerDefault.ButtonPageDown.Value >  HmiProgram.Components.LayerDefault.ButtonPageDown.OldValue && 
					STFiles.size() != 0 && STFilesIter != STFiles.end()) // Page Down Pressed
				{
					if (STFilesIter + MAX_FILESVIEW > STFiles.end())
						STFilesIter = STFiles.end() - MAX_FILESVIEW;
						
					Internal.State = HMIPROGRAM_LISTSHOW;
				} else if (HmiProgram.Components.LayerDefault.ButtonDelete.Value > HmiProgram.Components.LayerDefault.ButtonDelete.OldValue &&
					STFiles.size() != 0) // Delete Pressed
				{
					Internal.State = HMIPROGRAM_DELETE;
				} else if (HmiProgram.Components.LayerDefault.ButtonNew.Value > HmiProgram.Components.LayerDefault.ButtonNew.OldValue)
				{ // New Pressed
					Internal.State = HMIPROGRAM_NEWFILE;
				} else if (HmiProgram.Components.LayerDefault.ButtonRename.Value > HmiProgram.Components.LayerDefault.ButtonRename.OldValue &&
					STFiles.size() != 0)
				{
					Internal.State = HMIPROGRAM_RENAME;
				} else if (HmiProgram.Components.LayerDefault.ButtonCopy.Value > HmiProgram.Components.LayerDefault.ButtonCopy.OldValue && 
					STFiles.size() != 0)
				{ // Copy Pressed
					FileNameSource = (*(STFilesIterStart+HmiProgram.Components.LayerDefault.ListboxFiles.SelectedIndex)).GetFileName();
					DeviceNameSource = Devices[HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex].GetDeviceName();
					FileCopied = 1;
					FileCut = 0;
								
				} else if (HmiProgram.Components.LayerDefault.ButtonCut.Value > HmiProgram.Components.LayerDefault.ButtonCut.OldValue && 
					STFiles.size() != 0) // Cut Pressed
				{
					FileNameSource = (*(STFilesIterStart+HmiProgram.Components.LayerDefault.ListboxFiles.SelectedIndex)).GetFileName();
					DeviceNameSource = Devices[HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex].GetDeviceName();
					FileCopied = 0;
					FileCut = 1;
				} else if (HmiProgram.Components.LayerDefault.ButtonPaste.Value > HmiProgram.Components.LayerDefault.ButtonPaste.OldValue &&
					(FileCopied == 1 || FileCut == 1)) // Paste Pressed
				{
					Internal.State = HMIPROGRAM_PASTE;
				} else if (HmiProgram.Components.LayerDefault.ButtonLoad.Value > HmiProgram.Components.LayerDefault.ButtonLoad.OldValue && 
					STFiles.size() != 0) // Load Pressed
				{
					Internal.State = HMIPROGRAM_ACTIVATEPROGRAM;
				} else if (HmiProgram.Components.LayerDefault.ButtonEdit.Value > HmiProgram.Components.LayerDefault.ButtonEdit.OldValue && 
					STFiles.size() != 0) // Edit Pressed
				{
					Internal.State = HMIPROGRAM_EDIT;
				}
				// Adjust the scalebar always (Scrollbar)
				if (STFiles.size() != 0)
				{
					HmiProgram.Components.LayerDefault.ScaleScrollbar.EndDatapoint = 100 - (STFilesIterStart - STFiles.begin()) * 100.0 / STFiles.size();
					HmiProgram.Components.LayerDefault.ScaleScrollbar.StartDatapoint = (STFiles.end() - STFilesIter ) * 100.0 / STFiles.size();
				} else
				{
					HmiProgram.Components.LayerDefault.ScaleScrollbar.EndDatapoint = 0;
					HmiProgram.Components.LayerDefault.ScaleScrollbar.StartDatapoint = 0;
				}
			
				break;
			
			case HMIPROGRAM_DELETE:
				// Deletes the selected program *)
				switch (Internal.SubState)
				{
					case 0:
						if ((strcmp(Devices[HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex].GetDeviceName().c_str(), HmiRetain.HmiProgram.Device) == 0 &&
							strcmp((*(STFilesIterStart+HmiProgram.Components.LayerDefault.ListboxFiles.SelectedIndex)).GetFileName().c_str(), HmiRetain.HmiProgram.Name) == 0) ||
							(strcmp(Devices[HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex].GetDeviceName().c_str(), HmiRetain.HmiEditor.Device) == 0 &&
							strcmp((*(STFilesIterStart+HmiProgram.Components.LayerDefault.ListboxFiles.SelectedIndex)).GetFileName().c_str(), HmiRetain.HmiEditor.Name) == 0))
						{ // When the Program is in use (Edit or Run)
							HmiProgram.Components.LayerDeletePopup.Layer.StatusDatapoint = 0;
							Internal.SubState = 5; // Wait for the User to choose from
						} else
						{ // Just Delete it
							FileName = (*(STFilesIterStart+HmiProgram.Components.LayerDefault.ListboxFiles.SelectedIndex)).GetFileName() + ".st";
							Internal.SubState = 10; // Delete step
						}
						break;
					
					case 5:
						// Confirm to delete the File if its in use
						if (HmiProgram.Components.LayerDeletePopup.ButtonConfirm.Value > HmiProgram.Components.LayerDeletePopup.ButtonConfirm.OldValue)
						{
							HmiProgram.Components.LayerDeletePopup.Layer.StatusDatapoint = 1;
							// reset some Variables like HmiRetain.HmiProgram or HmiRetain.HmiEditor
							if (strcmp(Devices[HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex].GetDeviceName().c_str(), HmiRetain.HmiProgram.Device) == 0 &&
								strcmp((*(STFilesIterStart+HmiProgram.Components.LayerDefault.ListboxFiles.SelectedIndex)).GetFileName().c_str(), HmiRetain.HmiProgram.Name) == 0)
								memset(&HmiRetain.HmiProgram, 0, sizeof(HmiRetain.HmiProgram));
							if (strcmp(Devices[HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex].GetDeviceName().c_str(), HmiRetain.HmiEditor.Device) == 0 &&
								strcmp((*(STFilesIterStart+HmiProgram.Components.LayerDefault.ListboxFiles.SelectedIndex)).GetFileName().c_str(), HmiRetain.HmiEditor.Name) == 0)
								memset(&HmiRetain.HmiEditor, 0, sizeof(HmiRetain.HmiEditor));
							
							FileName = (*(STFilesIterStart+HmiProgram.Components.LayerDefault.ListboxFiles.SelectedIndex)).GetFileName() + ".st";
							Internal.SubState = 10;
							
						}
						// Cancel the Delete
						if (HmiProgram.Components.LayerDeletePopup.ButtonCancel.Value > HmiProgram.Components.LayerDeletePopup.ButtonCancel.OldValue)
						{
							HmiProgram.Components.LayerDeletePopup.Layer.StatusDatapoint = 1;
							Internal.State = HMIPROGRAM_IDLE;
						}
					
						break;
					
					case 10: // Delete the File
						//Initializes the values of the function block *)
						FB_ProgramDelete.enable	= 1;
						FB_ProgramDelete.pDevice= (UDINT)(Devices[HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex].GetDeviceName().c_str());	
						FB_ProgramDelete.pName	= (UDINT)FileName.c_str();
					
						FileDelete(&FB_ProgramDelete);
					
						// Waits till the operation is finished and checks if is success or there is any error. *)
						if (FB_ProgramDelete.status == ERR_OK)
						{
							
							Internal.State = HMIPROGRAM_DIRINITREAD;
										
						} else if (FB_ProgramDelete.status != ERR_FUB_BUSY)
						{
							Internal.State = HMIPROGRAM_DIRINITREAD;
						}
						
						break;
				}
				break;
		
			case HMIPROGRAM_NEWFILE:
				//* It creates a new program and then the posibility to edit it *)
				switch(Internal.SubState)
				{
					case 0:
						// Shows the popup to enter the name 
						HmiProgram.Components.LayerNewPopup.Layer.StatusDatapoint = 0;
						strcpy(HmiProgram.Components.LayerNewPopup.StringInput.Value, "");
						Internal.SubState = 5;
						break;
				
					case 5:
						//* Waits till the entered name is confirmed *)
						if (HmiProgram.Components.LayerNewPopup.ButtonConfirm.Value  > HmiProgram.Components.LayerNewPopup.ButtonConfirm.OldValue)
						{	
							// Hides the popup *)
							HmiProgram.Components.LayerNewPopup.Layer.StatusDatapoint = 1;
							// Checks if it was entered a name or not
							if (strcmp(HmiProgram.Components.LayerNewPopup.StringInput.Value, "") == 0)
							{
								strcpy(HmiProgram.Components.LayerNewPopup.StringInput.Value, "NewProgram");
							}
							
							while (true) // To avoid repeated name
							{
															
								iter = find(STFiles.begin(), STFiles.end(), FileInfoData(HmiProgram.Components.LayerNewPopup.StringInput.Value, "", ""));
															
								if (iter == STFiles.end())
									break;
								else
								{
									string str(HmiProgram.Components.LayerNewPopup.StringInput.Value);
									str = StringHelper::GetCopyName(str); 
									strcpy(HmiProgram.Components.LayerNewPopup.StringInput.Value, str.c_str());
								}
							}
							FileName.assign(HmiProgram.Components.LayerNewPopup.StringInput.Value).append(".st");								
							Internal.SubState = 10;
						}
												
						if (HmiProgram.Components.LayerNewPopup.ButtonCancel.Value > HmiProgram.Components.LayerNewPopup.ButtonCancel.OldValue)
						{
							// Hides the popup *)
							HmiProgram.Components.LayerNewPopup.Layer.StatusDatapoint = 1;
							Internal.State = HMIPROGRAM_IDLE;
									
						}
										
						break;
					
					case 10: // Create ST File
						// Initializes the values of the function block *)					
						FB_NewProgramCreate.enable = 1;
						FB_NewProgramCreate.pDevice	= (UDINT)(Devices[HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex].GetDeviceName().c_str());
						FB_NewProgramCreate.pFile 	= (UDINT)(FileName.c_str());
						// Calls the function block 
						FileCreate(&FB_NewProgramCreate);
					
						// Waits till the operation is finished and checks if is success or there is any error. *)
						if (FB_NewProgramCreate.status == ERR_OK)
						{		
							Internal.SubState = 15;
						} else if (FB_NewProgramCreate.status != ERR_FUB_BUSY)
						{
							Internal.State = HMIPROGRAM_DIRINITREAD; 			
						}
										
						break;
										
					case 15: // Write the content into ST Files (Template)
											
						FB_NewProgramWrite.enable 	= 1;
						FB_NewProgramWrite.ident	= FB_NewProgramCreate.ident;
						FB_NewProgramWrite.len 		= strlen(EMPTY_STFILE);
						FB_NewProgramWrite.offset	= 0;
						FB_NewProgramWrite.pSrc 	= (UDINT)&(EMPTY_STFILE);
											
						// Calls the function block 
						FileWrite(&FB_NewProgramWrite);
									
						// Waits till the operation is finished and checks if is success or there is any error. *)
						if ( FB_NewProgramWrite.status == ERR_OK)
							Internal.SubState = 20;
						else if ( FB_NewProgramWrite.status != ERR_FUB_BUSY)
							Internal.State = HMIPROGRAM_ERROR;	
										
						break;
										
					case 20: // Close the ST FIles
						// Closes the file created *)
						FB_CloseFile.enable = 1;
						FB_CloseFile.ident = FB_NewProgramCreate.ident;
										
						FileClose(&FB_CloseFile);
							
						if (FB_CloseFile.status == ERR_OK)
						{
							Internal.State = HMIPROGRAM_DIRINITREAD;				
													
						} else if (FB_CloseFile.status != ERR_FUB_BUSY)
						{
							Internal.State = HMIPROGRAM_ERROR; 				
						}
									
						break;
										
				}
				
				break;
			
			case HMIPROGRAM_RENAME:
				// Renames the file selected with a new name,  in  popup  window*)	
				switch(Internal.SubState)
				{
					case 0:
						// Activate the popup in the screen *)
						HmiProgram.Components.LayerRenamePopup.Layer.StatusDatapoint = 0;
					
						if ((strcmp(Devices[HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex].GetDeviceName().c_str(), HmiRetain.HmiProgram.Device) == 0 &&
							strcmp((*(STFilesIterStart+HmiProgram.Components.LayerDefault.ListboxFiles.SelectedIndex)).GetFileName().c_str(), HmiRetain.HmiProgram.Name) == 0) ||
							(strcmp(Devices[HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex].GetDeviceName().c_str(), HmiRetain.HmiEditor.Device) == 0 &&
							strcmp((*(STFilesIterStart+HmiProgram.Components.LayerDefault.ListboxFiles.SelectedIndex)).GetFileName().c_str(), HmiRetain.HmiEditor.Name) == 0))
						{
							HmiProgram.Components.LayerRenamePopup.StringInput.StatusDatapoint = 1;
							HmiProgram.Components.LayerRenamePopup.TextInfo.TextIndex = 0;
							Internal.SubState = 5; // Wait for the User to choose from
						} else
						{
							HmiProgram.Components.LayerRenamePopup.StringInput.StatusDatapoint = 0;
							HmiProgram.Components.LayerRenamePopup.TextInfo.TextIndex = 1;
							Internal.SubState = 10; // 
						}
					
						break;
					
					case 5:
						// Rename the File
						if (HmiProgram.Components.LayerRenamePopup.ButtonConfirm.Value > HmiProgram.Components.LayerRenamePopup.ButtonConfirm.OldValue)
						{							
							HmiProgram.Components.LayerRenamePopup.StringInput.StatusDatapoint = 0;
							HmiProgram.Components.LayerRenamePopup.TextInfo.TextIndex = 1;	
					
							strcpy(HmiProgram.Components.LayerRenamePopup.StringInput.Value, (*(STFilesIterStart+HmiProgram.Components.LayerDefault.ListboxFiles.SelectedIndex)).GetFileName().c_str());

							Internal.SubState = 10;	
						}
						if (HmiProgram.Components.LayerDeletePopup.ButtonCancel.Value > HmiProgram.Components.LayerDeletePopup.ButtonCancel.OldValue)
						{
							HmiProgram.Components.LayerDeletePopup.Layer.StatusDatapoint = 1;
							Internal.State = HMIPROGRAM_IDLE;
						}
					
						break;
					
					
					case 10:
						// Waits till is confirmed this names*)
						if (HmiProgram.Components.LayerRenamePopup.ButtonConfirm.Value > HmiProgram.Components.LayerRenamePopup.ButtonConfirm.OldValue)
						{
							if (strcmp(HmiProgram.Components.LayerRenamePopup.StringInput.Value, "") != 0 &&
								strcmp((*(STFilesIterStart+HmiProgram.Components.LayerDefault.ListboxFiles.SelectedIndex)).GetFileName().c_str(), HmiProgram.Components.LayerRenamePopup.StringInput.Value) != 0)
							{
											
								iter = find(STFiles.begin(), STFiles.end(), FileInfoData(HmiProgram.Components.LayerRenamePopup.StringInput.Value, "", ""));
								if (iter == STFiles.end()) // if file not exists
								{
									// Hide the popup *)
									HmiProgram.Components.LayerRenamePopup.Layer.StatusDatapoint = 1;
									
									FileName.assign((*(STFilesIterStart+HmiProgram.Components.LayerDefault.ListboxFiles.SelectedIndex)).GetFileName()).append(".st");
									FileNameNew.assign(HmiProgram.Components.LayerRenamePopup.StringInput.Value).append(".st");
									
									Internal.SubState = 15;
											
								} else // if file already exists
								{
									HmiProgram.Components.LayerRenamePopup.TextInfo.TextIndex = 2;
								}
											
							} 
										
						} 
					
						if (HmiProgram.Components.LayerRenamePopup.ButtonCancel.Value > HmiProgram.Components.LayerRenamePopup.ButtonCancel.OldValue)
						{	
							HmiProgram.Components.LayerRenamePopup.Layer.StatusDatapoint = 1;
							Internal.State = HMIPROGRAM_IDLE;
						}
					
						break;
								
					case 15: // rename st file
						// Initializes the values of the function block
						FB_ProgramRename.enable = 1;
						FB_ProgramRename.pDevice = (UDINT)(Devices[HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex].GetDeviceName().c_str());
						FB_ProgramRename.pName = (UDINT)(FileName.c_str());
						FB_ProgramRename.pNewName = (UDINT)(FileNameNew.c_str());
							
						// Calls the function block *)
						FileRename(&FB_ProgramRename);
						
						// Waits till the operation is finished and checks if is success or there is any error. 
						if (FB_ProgramRename.status == ERR_OK) 
						{
							// If the Program is in use
							if (strcmp(Devices[HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex].GetDeviceName().c_str(), HmiRetain.HmiProgram.Device) == 0 &&
								strcmp((*(STFilesIterStart+HmiProgram.Components.LayerDefault.ListboxFiles.SelectedIndex)).GetFileName().c_str(), HmiRetain.HmiProgram.Name) == 0)
								strcpy(HmiRetain.HmiProgram.Name, FileNameNew.substr(0,FileNameNew.length() - 3).c_str());
							if (strcmp(Devices[HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex].GetDeviceName().c_str(), HmiRetain.HmiEditor.Device) == 0 &&
								strcmp((*(STFilesIterStart+HmiProgram.Components.LayerDefault.ListboxFiles.SelectedIndex)).GetFileName().c_str(), HmiRetain.HmiEditor.Name) == 0)
								strcpy(HmiRetain.HmiEditor.Name, FileNameNew.substr(0,FileNameNew.length() - 3).c_str());
							
							Internal.State = HMIPROGRAM_DIRINITREAD;
					
						} else if (FB_ProgramRename.status != ERR_FUB_BUSY)
						{
							Internal.State = HMIPROGRAM_DIRINITREAD; 
						}
								
						break;
				}

				break;

			case HMIPROGRAM_PASTE: // Paste the File (Not Tested in Multi Devices)
			
				switch (Internal.SubState)
				{
					case 0:		
						if (FileCut == 1)
						{
							if (DeviceNameSource == Devices[HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex].GetDeviceName())// if same file device
							{
								FileCut = 0;
								Internal.State = HMIPROGRAM_IDLE;
							} else
							{
								if ((strcmp(Devices[HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex].GetDeviceName().c_str(), HmiRetain.HmiProgram.Device) == 0 &&
									strcmp((*(STFilesIterStart+HmiProgram.Components.LayerDefault.ListboxFiles.SelectedIndex)).GetFileName().c_str(), HmiRetain.HmiProgram.Name) == 0) ||
									(strcmp(Devices[HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex].GetDeviceName().c_str(), HmiRetain.HmiEditor.Device) == 0 &&
									strcmp((*(STFilesIterStart+HmiProgram.Components.LayerDefault.ListboxFiles.SelectedIndex)).GetFileName().c_str(), HmiRetain.HmiEditor.Name) == 0))
								{
									HmiProgram.Components.LayerCutPopup.Layer.StatusDatapoint = 0;
									Internal.SubState = 5; // Wait for the User to choose from
								} else
								{
									Internal.SubState = 10; // 
								}
							}
						} else if (FileCopied == 1)
						{
							Internal.SubState = 10; // 
						}
						break;
					
					case 5: // If the Program is in use
						if (HmiProgram.Components.LayerCutPopup.ButtonConfirm.Value > HmiProgram.Components.LayerCutPopup.ButtonConfirm.OldValue)
						{	
							if (strcmp(Devices[HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex].GetDeviceName().c_str(), HmiRetain.HmiProgram.Device) == 0 &&
								strcmp((*(STFilesIterStart+HmiProgram.Components.LayerDefault.ListboxFiles.SelectedIndex)).GetFileName().c_str(), HmiRetain.HmiProgram.Name) == 0)
								memset(&HmiRetain.HmiProgram, 0, sizeof(HmiRetain.HmiProgram));
							if (strcmp(Devices[HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex].GetDeviceName().c_str(), HmiRetain.HmiEditor.Device) == 0 &&
								strcmp((*(STFilesIterStart+HmiProgram.Components.LayerDefault.ListboxFiles.SelectedIndex)).GetFileName().c_str(), HmiRetain.HmiEditor.Name) == 0)
								memset(&HmiRetain.HmiEditor, 0, sizeof(HmiRetain.HmiEditor));
							HmiProgram.Components.LayerCutPopup.Layer.StatusDatapoint = 1;
							Internal.SubState = 10;	
						}
						if (HmiProgram.Components.LayerCutPopup.ButtonCancel.Value > HmiProgram.Components.LayerCutPopup.ButtonCancel.OldValue)
						{
							HmiProgram.Components.LayerCutPopup.Layer.StatusDatapoint = 1;
							Internal.State = HMIPROGRAM_IDLE;
						}
					
						break;
					
					case 10:
						FileNameNew = FileNameSource;

						while (true)
						{		
							iter = find(STFiles.begin(), STFiles.end(), FileInfoData(FileNameNew, "", ""));
											
							if (iter == STFiles.end())
								break;
							else
							{
								FileNameNew = StringHelper::GetCopyName(FileNameNew);
							}
						}
										
						FileNameNew.append(".st");
						FileName = FileNameSource + ".st";
						Internal.SubState = 20;
							
						break;
								
					case 20: // Copy the ST file
						//* Initializes the values of the Function Block *)
						FB_ProgramCopy.enable = 1;
										
						FB_ProgramCopy.pSrcDev = (UDINT)(DeviceNameSource.c_str());
						FB_ProgramCopy.pSrc = (UDINT)(FileName.c_str());
									
						FB_ProgramCopy.pDestDev = (UDINT)(Devices[HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex].GetDeviceName().c_str());
						FB_ProgramCopy.pDest = (UDINT)(FileNameNew.c_str());
									
						// Calls the function block *)
						FileCopy(&FB_ProgramCopy);
																	
						// Waits till the operation is finished and checks if is success or there is any error. *)
						if (FB_ProgramCopy.status == ERR_OK)
						{	
							if (FileCut)
								Internal.SubState = 30;
							else
								Internal.State = HMIPROGRAM_DIRINITREAD;
										
						} else if (FB_ProgramCopy.status != ERR_FUB_BUSY)
						{
							Internal.State = HMIPROGRAM_DIRINITREAD;
						}
								
						break;
								
			
					case 30: // delete the st file (for Cut Function)	
				
						// Initializes the values of the function block *)
						FB_ProgramDelete.enable	= 1;
						FB_ProgramDelete.pDevice = (UDINT)(DeviceNameSource.c_str());
						FileName = FileNameSource + ".st";
						FB_ProgramDelete.pName	= (UDINT)(FileName.c_str());
											
						// Calls the function block *)
						FileDelete(&FB_ProgramDelete);
										
						// Waits till the operation is finished and checks if is success or there is any error. *)
						if (FB_ProgramDelete.status == ERR_OK) 
						{
							FileCut = 0;		
							Internal.State = HMIPROGRAM_DIRINITREAD;;
									
						} else if (FB_ProgramDelete.status != ERR_FUB_BUSY)
						{
							Internal.State = HMIPROGRAM_DIRINITREAD; 
						}
									
						break;
								
			
				}
				break;
		
			case HMIPROGRAM_ACTIVATEPROGRAM:
				// Activates the program in the channel selected *)
				// Copy the name of the program selected into the Cnc channel, NcProgramName *)
				if (!pCnc->Output.State.Moving) 
				{
												
					strcpy(pCnc->Input.Parameter.NcProgramName,(*(STFilesIterStart+HmiProgram.Components.LayerDefault.ListboxFiles.SelectedIndex)).GetFileName().c_str());
								
					strcpy(HmiRetain.HmiProgram.Name, (*(STFilesIterStart+HmiProgram.Components.LayerDefault.ListboxFiles.SelectedIndex)).GetFileName().c_str());
								
					strcpy(HmiRetain.HmiProgram.Device, Devices[HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex].GetDeviceName().c_str());
								
					HmiRetain.HmiProgram.Mode = ncFILE;
										
					HmiGlobal.PageControl.SetPage = PAGE_MAIN;
						
				} 
	
				Internal.State = HMIPROGRAM_DIRINITREAD;

				break;
		
			case HMIPROGRAM_EDIT:
				// It will be shown the program to be edited 
				// Copy the name of the program selected into the Cnc channel, NcProgramName *)
			
				strcpy(HmiRetain.HmiEditor.Name, (*(STFilesIterStart+HmiProgram.Components.LayerDefault.ListboxFiles.SelectedIndex)).GetFileName().c_str());
								
				strcpy(HmiRetain.HmiEditor.Device, Devices[HmiProgram.Components.LayerDefault.ListboxDevices.SelectedIndex].GetDeviceName().c_str() );
								
				string fd(HmiRetain.HmiEditor.Device);
				string fn(HmiRetain.HmiEditor.Name);
									
				stringstream sstream;
									
				sstream << "file://" << fd << ":/" << fn << ".st";
				strcpy(HmiRetain.HmiEditor.URL, sstream.str().c_str());
								
				HmiGlobal.PageControl.SetPage = PAGE_EDITOR;
								
				Internal.State = HMIPROGRAM_DIRINITREAD;
								
				break;

	
		}
	} else
	{
		Internal.State = HMIPROGRAM_DIRINITREAD;
		Internal.SubState = 0;
	}	
	//For Rising Edge Detection	
	HmiProgram.Components.LayerDefault.ButtonPageUp.OldValue = HmiProgram.Components.LayerDefault.ButtonPageUp.Value;
	HmiProgram.Components.LayerDefault.ButtonPageDown.OldValue = HmiProgram.Components.LayerDefault.ButtonPageDown.Value;
	HmiProgram.Components.LayerDefault.ButtonCut.OldValue = HmiProgram.Components.LayerDefault.ButtonCut.Value;
	HmiProgram.Components.LayerDefault.ButtonCopy.OldValue = HmiProgram.Components.LayerDefault.ButtonCopy.Value;
	HmiProgram.Components.LayerDefault.ButtonPaste.OldValue = HmiProgram.Components.LayerDefault.ButtonPaste.Value;
	HmiProgram.Components.LayerDefault.ButtonDelete.OldValue = HmiProgram.Components.LayerDefault.ButtonDelete.Value;
	HmiProgram.Components.LayerDefault.ButtonNew.OldValue = HmiProgram.Components.LayerDefault.ButtonNew.Value;
	HmiProgram.Components.LayerDefault.ButtonLoad.OldValue = HmiProgram.Components.LayerDefault.ButtonLoad.Value;
	HmiProgram.Components.LayerDefault.ButtonEdit.OldValue = HmiProgram.Components.LayerDefault.ButtonEdit.Value;
	HmiProgram.Components.LayerDefault.ButtonRename.OldValue = HmiProgram.Components.LayerDefault.ButtonRename.Value;
	
	// Layer Delete			
	HmiProgram.Components.LayerDeletePopup.ButtonCancel.OldValue = HmiProgram.Components.LayerDeletePopup.ButtonCancel.Value;
	HmiProgram.Components.LayerDeletePopup.ButtonConfirm.OldValue = HmiProgram.Components.LayerDeletePopup.ButtonConfirm.Value;
	// Layer New
	HmiProgram.Components.LayerNewPopup.ButtonCancel.OldValue = HmiProgram.Components.LayerNewPopup.ButtonCancel.Value;
	HmiProgram.Components.LayerNewPopup.ButtonConfirm.OldValue = HmiProgram.Components.LayerNewPopup.ButtonConfirm.Value;	
	// Layer Rename
	HmiProgram.Components.LayerRenamePopup.ButtonCancel.OldValue = HmiProgram.Components.LayerRenamePopup.ButtonCancel.Value;
	HmiProgram.Components.LayerRenamePopup.ButtonConfirm.OldValue = HmiProgram.Components.LayerRenamePopup.ButtonConfirm.Value;	
	// Layer Paste
	HmiProgram.Components.LayerCutPopup.ButtonCancel.OldValue = HmiProgram.Components.LayerCutPopup.ButtonCancel.Value;
	HmiProgram.Components.LayerCutPopup.ButtonConfirm.OldValue = HmiProgram.Components.LayerCutPopup.ButtonConfirm.Value;	
}
