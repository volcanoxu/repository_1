/********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: HmiEdit
 * File: HmiEditCtrl.cpp
 * Author: renj
 * Created: October 21, 2014
 ********************************************************************
 * Implementation of program HmiEdit
 ********************************************************************/

#include <bur/plctypes.h>
#include <fileio.h>
#include <string>
#include "CusLib.hpp"
#include <vector>
#include <iomanip>
#include <algorithm>

#ifdef _DEFAULT_INCLUDES
#include <AsDefault.h>
#endif

#define MAX_VARVIEW 17 // Max Vars to be shown

unsigned long bur_heap_size = 0xFFFFF; 

using namespace std;

// States
STHandler* STHandler_0;
UINT OldPage;
UINT DataStep; // Var state "VAR ... END_VAR"
UINT EditStep; // Edit State "PROGRAM_...END_PROGRAM"
UINT FileStep; // File State (Read/Write File)
UINT NewVarStep; // New Var State
UINT VarStep; // State for Variables (Points/Joints/Paths...)
bool DataLoaded; // Data(Program) Loaded

//VAR STATE
int EntryIndex; 
int SelectedIndex;
string SelectedType;
int Size;
bool IsEmpty;
VarInfoType VarInfoArray[20]; // Store the Vars from the "VAR ... END_VAR"
string VarName;
string TypeName;
int OldIndex;
// Edit Parts
string VarString;
string PrgString;
string TextString;
string InputChars[200];
bool ClearDone;
string Inputs;
string Input;
map<string, int> PromptStrs;
map<string, int> VarStrs;
map<string, int> Keywords;
int KeyLevel;
bool IsInput;
int OldLn;
int OldCol;
int PosCol;
int PosLn;
bool SetCursorRequest;

// Var Parts
MXPointType Point;
MXFrameType Frame;
MXToolType Tool;
MXAxisTargetType Axis;
MXVelocityType Vel;
MXPathDescType Path;
INT Int;
REAL Real;
BOOL Bool;

void _INIT HmiEditCtrlInit(void)
{
	// Create the instance for STHandler
	STHandler_0 = new STHandler(); 
	
	// Layer StatusDatapoint Vars
	HmiEditorCtrl.Components.PageData.LayerNewPopup.Layer.StatusDatapoint = 1;
	HmiEditorCtrl.Components.PageData.LayerPoint.Layer.StatusDatapoint = 1;
	HmiEditorCtrl.Components.PageData.LayerFrame.Layer.StatusDatapoint = 1;
	HmiEditorCtrl.Components.PageData.LayerTool.Layer.StatusDatapoint = 1;
	HmiEditorCtrl.Components.PageData.LayerAxis.Layer.StatusDatapoint = 1;
	HmiEditorCtrl.Components.PageData.LayerVel.Layer.StatusDatapoint = 1;
	HmiEditorCtrl.Components.PageData.LayerPath.Layer.StatusDatapoint = 1;
	HmiEditorCtrl.Components.PageData.LayerINT.Layer.StatusDatapoint = 1;
	HmiEditorCtrl.Components.PageData.LayerREAL.Layer.StatusDatapoint = 1;
	HmiEditorCtrl.Components.PageData.LayerBOOL.Layer.StatusDatapoint = 1;
	
	// Input Chars for Software keyboards
	InputChars[0] = "q";InputChars[1] = "Q";InputChars[2] = "1";InputChars[3] = "[";
	InputChars[4] = "w";InputChars[5] = "W";InputChars[6] = "2";InputChars[7] = "]";
	InputChars[8] = "e";InputChars[9] = "E";InputChars[10] = "3";InputChars[11] = "{";
	InputChars[12] = "r";InputChars[13] = "R";InputChars[14] = "4";InputChars[15] = "}";
	InputChars[16] = "t";InputChars[17] = "T";InputChars[18] = "5";InputChars[19] = "#";
	InputChars[20] = "y";InputChars[21] = "Y";InputChars[22] = "6";InputChars[23] = "%";
	InputChars[24] = "u";InputChars[25] = "U";InputChars[26] = "7";InputChars[27] = "^";
	InputChars[28] = "i";InputChars[29] = "I";InputChars[30] = "8";InputChars[31] = "*";
	InputChars[32] = "o";InputChars[33] = "O";InputChars[34] = "9";InputChars[35] = "+";
	InputChars[36] = "p";InputChars[37] = "P";InputChars[38] = "0";InputChars[39] = "=";
	InputChars[40] = "a";InputChars[41] = "A";InputChars[42] = "_";InputChars[43] = "_";
	InputChars[44] = "s";InputChars[45] = "S";InputChars[46] = "/";InputChars[47] = "\\";
	InputChars[48] = "d";InputChars[49] = "D";InputChars[50] = ":";InputChars[51] = "|";
	InputChars[52] = "f";InputChars[53] = "F";InputChars[54] = ";";InputChars[55] = "~";
	InputChars[56] = "g";InputChars[57] = "G";InputChars[58] = "(";InputChars[59] = "<";
	InputChars[60] = "h";InputChars[61] = "H";InputChars[62] = ")";InputChars[63] = ">";
	InputChars[64] = "j";InputChars[65] = "J";InputChars[66] = "€";InputChars[67] = "$";
	InputChars[68] = "k";InputChars[69] = "K";InputChars[70] = "&";InputChars[71] = "?";
	InputChars[72] = "l";InputChars[73] = "L";InputChars[74] = "@";InputChars[75] = "?";
	InputChars[76] = "z";InputChars[77] = "Z";InputChars[78] = "";InputChars[79] = "";
	InputChars[80] = "x";InputChars[81] = "X";InputChars[82] = ".";InputChars[83] = ".";
	InputChars[84] = "c";InputChars[85] = "C";InputChars[86] = ",";InputChars[87] = ",";
	InputChars[88] = "v";InputChars[89] = "V";InputChars[90] = "?";InputChars[91] = "?";
	InputChars[92] = "b";InputChars[93] = "B";InputChars[94] = "!";InputChars[95] = "!";
	InputChars[96] = "n";InputChars[97] = "N";InputChars[98] = "'";InputChars[99] = "'";
	InputChars[100] = "m";InputChars[101] = "M";InputChars[102] = "\"";InputChars[103] = "\"";
	InputChars[104] = ".";InputChars[105] = ":";InputChars[106] = "";InputChars[107] = "";
	InputChars[108] = ",";InputChars[109] = ";";InputChars[110] = "";InputChars[111] = "";
	InputChars[112] = " ";InputChars[113] = " ";InputChars[114] = " ";InputChars[115] = " ";
	
	// All the Keywords, if u have some words u want , just add here like ("MoveA();", 2), the number means for how many
	// chars the cursor should go backwords after inserting
	Keywords.insert(pair<string, int>("MoveL();", 2));Keywords.insert(pair<string, int>("MoveA();", 2));
	Keywords.insert(pair<string, int>("MoveC();", 2));Keywords.insert(pair<string, int>("MoveJ();", 2));
	Keywords.insert(pair<string, int>("Frm:=", 0));Keywords.insert(pair<string, int>("Vel:=", 0));
	Keywords.insert(pair<string, int>("Tool:=", 0));Keywords.insert(pair<string, int>("Pth:=", 0));
	Keywords.insert(pair<string, int>("MX_VEL_", 0));Keywords.insert(pair<string, int>("SetM();", 2));
	
	Keywords.insert(pair<string, int>(":=", 0));Keywords.insert(pair<string, int>("*)", 0));
	Keywords.insert(pair<string, int>("(*", 0));Keywords.insert(pair<string, int>("(**)", 2));
	Keywords.insert(pair<string, int>("*)", 0));Keywords.insert(pair<string, int>("AND ", 0));
	Keywords.insert(pair<string, int>("OR ", 0));Keywords.insert(pair<string, int>("NOT ", 0));
	Keywords.insert(pair<string, int>("<> ", 0));
	Keywords.insert(pair<string, int>("XOR ", 0));Keywords.insert(pair<string, int>("TRUE", 0));
	Keywords.insert(pair<string, int>("FALSE", 0));Keywords.insert(pair<string, int>("IF  THEN", 5));
	Keywords.insert(pair<string, int>("END_IF", 0));
	Keywords.insert(pair<string, int>("ELSE", 0));Keywords.insert(pair<string, int>("THEN", 0));
	Keywords.insert(pair<string, int>("FOR  TO  DO", 7));Keywords.insert(pair<string, int>("TO ", 0));
	Keywords.insert(pair<string, int>("BY ", 0));Keywords.insert(pair<string, int>("DO", 0));
	Keywords.insert(pair<string, int>("END_FOR", 0));Keywords.insert(pair<string, int>("EXIT", 0));
	Keywords.insert(pair<string, int>("END_WHILE", 0));Keywords.insert(pair<string, int>("ACCESS ", 0));
	Keywords.insert(pair<string, int>("ADR()", 1)); 
	Keywords.insert(pair<string, int>("CASE  OF", 3));Keywords.insert(pair<string, int>("OF", 0));
	Keywords.insert(pair<string, int>("END_CASE", 0));Keywords.insert(pair<string, int>("WHILE  DO", 3));
	Keywords.insert(pair<string, int>("REPEAT  UNTIL ", 8));Keywords.insert(pair<string, int>("UNTIL ", 0));
	Keywords.insert(pair<string, int>("END_REPEAT", 0));Keywords.insert(pair<string, int>("RETURN", 0));

}

void _CYCLIC HmiEditCtrlCyclic(void)
{	
	/** C++ Variables Definition **/
	string StrDevice(HmiRetain.HmiEditor.Device);
	string StrName(HmiRetain.HmiEditor.Name);
	StrName.append(".st");

	//*                          Initialization                              *
	
	if (HmiGlobal.Address.SystemAddress != 0 && HmiGlobal.Address.CncAddress != 0 &&
		HmiGlobal.Address.AxesAddress != 0)
	{
		pSystem = (System_Type*) HmiGlobal.Address.SystemAddress;
		pCnc = (Cnc_Type*) HmiGlobal.Address.CncAddress;
		pAxes = (Axes_Type (*)[13]) HmiGlobal.Address.AxesAddress; 
	} else
		return;
	
	if (HmiGlobal.PageControl.ActPage/100 == 5) // Editor Pages
	{
		if (OldPage/100 != 5)
		{
			FileStep = 0;
		}
		
		int PosPrgStart;
		switch (FileStep)
		{
			case 0: // Read the file .st
				
				if (StrDevice != "" && StrName != ".st") 
				{
					memset(HmiEditorInternal.StringBuffer, 0, sizeof(HmiEditorInternal.StringBuffer));
					HmiFileCtrlVar.Input.Parameter.StringBufferAdr = (UDINT) HmiEditorInternal.StringBuffer;
					HmiFileCtrlVar.Input.Parameter.StringBufferSize = sizeof(HmiEditorInternal.StringBuffer);
					
					strcpy(HmiFileCtrlVar.Input.Parameter.FileName, StrName.c_str());
					strcpy(HmiFileCtrlVar.Input.Parameter.FileDevice, StrDevice.c_str());
					
					HmiFileCtrlVar.Input.Command.Read = 1;
				
					FileStep = 10;
				}
				break;
			
			case 10: // Post Processing the .st
				
				if (HmiFileCtrlVar.Input.Command.Read == 0)
				{
					if (HmiFileCtrlVar.Output.Status.ReadOK)
					{
						VarString.assign(HmiEditorInternal.StringBuffer);
						PrgString.assign(HmiEditorInternal.StringBuffer);
						// Separate the .st into 2 pars, programs and vars
						PosPrgStart = VarString.find("PROGRAM _MAIN");
						
						VarString = VarString.substr(0, PosPrgStart);
						PrgString = PrgString.substr(PosPrgStart);
						// Handle the STs(Variable Parts)
						STHandler_0->SetText(VarString);
						STHandler_0->Parse(); // Do the Analyse
						
						FileStep = 20;
						DataLoaded = 1;
					} else
						FileStep = 99;
				}
				break;
			
			case 20: // Idle State
				if (HmiEditorCtrl.Components.PageData.LayerDefault.ButtonSaveAll.Value > HmiEditorCtrl.Components.PageData.LayerDefault.ButtonSaveAll.OldValue 
					|| HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotKeys[42].Value > HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotKeys[42].OldValue) // Save the Changes into .st
				{
					VarString = STHandler_0->GetText(); // Get the Text from STHandler (Vars)
					PrgString.assign(HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.StringBuffer); // Get the Text from Edit(Progs)
					TextString = VarString + PrgString; // Combine the Text
					strcpy(HmiEditorInternal.StringBuffer, TextString.c_str()); 
					
					HmiFileCtrlVar.Input.Parameter.StringBufferAdr = (UDINT) HmiEditorInternal.StringBuffer;
					HmiFileCtrlVar.Input.Parameter.StringBufferSize = strlen(HmiEditorInternal.StringBuffer);
					
					strcpy(HmiFileCtrlVar.Input.Parameter.FileName, StrName.c_str());
					strcpy(HmiFileCtrlVar.Input.Parameter.FileDevice, StrDevice.c_str());
					
					HmiFileCtrlVar.Input.Command.Write = 1; // Write the Content
					
					FileStep = 30;
				}		
				
				if (HmiEditorCtrl.Components.PageData.LayerDefault.ButtonReload.Value > HmiEditorCtrl.Components.PageData.LayerDefault.ButtonReload.OldValue ) // Redo the Read Process
				{					
					FileStep = 0;
					DataStep = 0;
					DataLoaded = 0;
				}
				break;	
			
			case 30: // Wait Write Finish
				if (HmiFileCtrlVar.Input.Command.Write == 0)
				{
					if (HmiFileCtrlVar.Output.Status.WriteOK)
					{
						FileStep = 20;
					} else
						FileStep = 99;
				}
				break;
		}
		// Edit Page(Program)
		if (HmiGlobal.PageControl.ActPage == PAGE_EDITOR)
		{
			if (OldPage != PAGE_EDITOR)
			{
				EditStep = 0;
				ClearDone = 0;
			}	
			
			int PosStart, PosEnd;
	
			switch (EditStep)
			{
				case 0:
					
					if (DataLoaded) // Wait Data loaded and parsed 
					{
						strcpy(HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.StringBuffer, PrgString.c_str());
						HmiEditorCtrl.Components.PageEdit.LayerDefault.TextFileName.TextIndex = 1; // Show the FileName
						
						if ((HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.StatusDatapoint & (16384)) != 16384) // Make sure the Edit is focused
							HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.StatusDatapoint = (HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.StatusDatapoint | (4));
						
						STHandler_0->GetVarNames(VarStrs); // Get the Varnames for Fast Insert of Variables
						
						EditStep = 10;
						
					} else
					{
						if (!ClearDone) // If no Program available , show No Program Available
						{
							memset(HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.StringBuffer, 0, sizeof(HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.StringBuffer));
							strcpy(HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.StringBuffer, "No Program Available");
							HmiEditorCtrl.Components.PageEdit.LayerDefault.TextFileName.TextIndex = 0;
							ClearDone = 1;
						}
					}
					break;
					
				case 10: // Idle State
					// Handle the Edit, to ensure "Edit" State
						// Make it Focused
					if ((HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.StatusDatapoint & (16384)) != 16384)
						HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.StatusDatapoint = (HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.StatusDatapoint | (4));
					
						// Make it in Edit by using Highlight
					if ((HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.StatusDatapoint & (16384)) == 16384 &&
						(HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.StatusDatapoint & (32768)) == 0 && 
						HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.CommandStatus == 0)
					{
						strcpy(HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.CommandRequest, "highlight line=1");
						HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.CommandStatus = 1;
					}
						
					for (int i = 0; i < 29; ++i) // Handle the Input of Software Keyboards (Single Characters)
						{
						if (HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotKeys[i].Value > HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotKeys[i].OldValue)
						{
							stringstream sstream;
							sstream << "replacemarkedtext text=" << InputChars[i*4 + HmiEditorCtrl.Components.PageEdit.LayerDefault.BmpKeys.BmpIndex];
							strcpy(HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.CommandRequest, sstream.str().data());
							HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.CommandStatus = 1;
							
							PosCol = HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.CursorCol;
							PosLn = HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.CursorLine;
							
							IsInput = 1;
							Input = InputChars[i*4 + HmiEditorCtrl.Components.PageEdit.LayerDefault.BmpKeys.BmpIndex];
							
						}
					}
					
					// Insert Prompts and Relocate the Cursor //Part of "Smart" Edit
					for (int i = 0; i < 5; ++i)
					{
						if (HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotPrompts[i].Value > HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotPrompts[i].OldValue
							&& Inputs != "")
						{
							
							if (PromptStrs.size() >  i + KeyLevel * 5)
							{
								
								map<string, int>::iterator iter = PromptStrs.begin();
								if (KeyLevel * 5 + i > 0 )
									for (int j = 0; j < KeyLevel * 5 + i; ++ j, ++ iter);
								
								if (iter->first.length() >= Inputs.length())
								{
									stringstream sstream;
									sstream << "replacemarkedtext text=" << iter->first.substr(Inputs.length());
									strcpy(HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.CommandRequest, sstream.str().data());
									HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.CommandStatus = 1;
									
									PosCol = HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.CursorCol + iter->first.length() - iter->second - 1;
									PosLn = HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.CursorLine;
									
									SetCursorRequest = 1;
								}
								
								Inputs = "";
								strcpy(HmiEditorCtrl.Components.PageEdit.LayerDefault.StringPrompt.Value, "");
							} 
								
															
						}
					}
					// Set the Cursor after Inserting // Part of "Smart" Edit
					if (HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.CommandStatus == 0 && SetCursorRequest)
					{
						SetCursorRequest = 0;
						
						stringstream sstream;
						sstream << "goto col=" << PosCol << " line=" << PosLn;
						strcpy(HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.CommandRequest, sstream.str().data());
						HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.CommandStatus = 1;
					}
					
					
					
					//Browse through possible prompts: Left				
					if (HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotPromptLeft.Value > HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotPromptLeft.OldValue)
					{
						if (KeyLevel > 0)
						{
							KeyLevel = KeyLevel - 1;
							
							stringstream ss;
								
							map<string, int>::iterator iter = PromptStrs.begin();
							if (KeyLevel > 0)
								for (int i = 0; i < KeyLevel * 5; ++ i, ++ iter);
							
								for (int i = 0; i < 5; ++i, ++iter)
								{
								ss.setf(ios::left);
								ss.width(10);
								if (iter->first.length() > 9)
									ss << (iter->first.substr(0,7) + "...");
								else
									ss << iter->first;
							}
							
							strcpy(HmiEditorCtrl.Components.PageEdit.LayerDefault.StringPrompt.Value, ss.str().c_str());
						}
					}
					//Browse through possible prompts: Right
					if (HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotPromptRight.Value > HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotPromptRight.OldValue)
					{
						if (PromptStrs.size() > (KeyLevel + 1)  * 5)
						{
							KeyLevel = KeyLevel + 1;
							
							stringstream ss;
							
							map<string, int>::iterator iter = PromptStrs.begin();
							for (int i = 0; i < KeyLevel * 5; ++ i, ++ iter);
									
								for (int i = 0 ; i < 5 && iter!=PromptStrs.end(); ++i, ++iter)
								{
								ss.setf(ios::left);
								ss.width(10);
								if (iter->first.length() > 9)
									ss << (iter->first.substr(0,7) + "...");
								else
									ss << (iter->first);
							}
							
							strcpy(HmiEditorCtrl.Components.PageEdit.LayerDefault.StringPrompt.Value, ss.str().c_str());	
						}
					}
					// Clear the Prompts in some case
					if (OldLn != HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.CursorLine ) // Change the Line, clear the Prompts
					{
						Inputs = "";
						strcpy(HmiEditorCtrl.Components.PageEdit.LayerDefault.StringPrompt.Value, "");
					} else // Same Line
					{
						if (OldCol != HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.CursorCol) // Different Col
						{
							if (OldCol == HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.CursorCol - 1 && IsInput == 1) // Col Move 1 chars forward, and IsInput is set
							{
								IsInput = 0;
						
								string Collection = "ABCDEFGHIJKLMNOPQRSTUVWXYZ:)*(<>abcdefghijklmnopqrstuvwxyz_";
								if (Input.find_first_of(Collection) == string::npos) // other characters
								{
									Inputs = "";
									strcpy(HmiEditorCtrl.Components.PageEdit.LayerDefault.StringPrompt.Value, "");
								} else // find normal Characters do the serach for Possible Prompts
								{
									Inputs.append(Input);
									map<string, int>::iterator iter = Keywords.begin();
									PromptStrs.clear();
									
									KeyLevel = 0;
							
									for (; iter != Keywords.end(); ++iter) // Find Keywords
									{
										if ((*iter).first.find(Inputs) == 0)
										{
											PromptStrs.insert(*iter);
										}
								
									}
									
									for (iter = VarStrs.begin() ; iter != VarStrs.end(); ++iter) // Find Vars
									{
										if ((*iter).first.find(Inputs) == 0)
										{
											PromptStrs.insert(*iter);
										}
								
									}
							
									stringstream ss;
								
									iter = PromptStrs.begin();
									int i = 0;
									while(iter != PromptStrs.end() && i < 5) // If the Prompt is too long, do the trunctation
									{
										ss.setf(ios::left);
										ss.width(10);
										if ((*iter).first.length() > 9)
											ss << ((*iter).first.substr(0,7) + "...");
										else
											ss << (*iter).first;
										++iter;
										++i;
									}
							
									strcpy(HmiEditorCtrl.Components.PageEdit.LayerDefault.StringPrompt.Value, ss.str().c_str());
					
								}
							} else
							{
								Inputs = "";
								strcpy(HmiEditorCtrl.Components.PageEdit.LayerDefault.StringPrompt.Value, "");
							}
						}
					}
					
					// Keep track of the Current Col and Line for Prompts
					OldCol = HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.CursorCol;
					OldLn = HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.CursorLine;
					
					//switch abc/ABC 123/!"? for Software keyboards
					if (HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotKeys[34].Value > HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotKeys[34].OldValue ||
						HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotKeys[29].Value > HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotKeys[29].OldValue)
					{
						if (HmiEditorCtrl.Components.PageEdit.LayerDefault.BmpKeys.BmpIndex == 0)
							HmiEditorCtrl.Components.PageEdit.LayerDefault.BmpKeys.BmpIndex = 1;
						else if (HmiEditorCtrl.Components.PageEdit.LayerDefault.BmpKeys.BmpIndex == 1)
							HmiEditorCtrl.Components.PageEdit.LayerDefault.BmpKeys.BmpIndex = 0;
						else if (HmiEditorCtrl.Components.PageEdit.LayerDefault.BmpKeys.BmpIndex == 2)
							HmiEditorCtrl.Components.PageEdit.LayerDefault.BmpKeys.BmpIndex = 3;
						else if (HmiEditorCtrl.Components.PageEdit.LayerDefault.BmpKeys.BmpIndex == 3)
							HmiEditorCtrl.Components.PageEdit.LayerDefault.BmpKeys.BmpIndex = 2;
					}
					
					// Switch abc - > 123 for Software keyboards
					if (HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotKeys[35].Value > HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotKeys[35].OldValue)
					{
						if (HmiEditorCtrl.Components.PageEdit.LayerDefault.BmpKeys.BmpIndex < 2)
							HmiEditorCtrl.Components.PageEdit.LayerDefault.BmpKeys.BmpIndex = 2;
						else if (HmiEditorCtrl.Components.PageEdit.LayerDefault.BmpKeys.BmpIndex > 1)
							HmiEditorCtrl.Components.PageEdit.LayerDefault.BmpKeys.BmpIndex = 0;
					}
					
					// Insert Line
					if (HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotKeys[39].Value > HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotKeys[39].OldValue)
					{
						stringstream sstream;
						sstream << "insert line=" << HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.CursorLine << " text=";
						strcpy(HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.CommandRequest, sstream.str().c_str());
						HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.CommandStatus = 1;
						
						PosCol = 1;
						PosLn = HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.CursorLine;
									
						SetCursorRequest = 1;
					}
					
					// Delete Line
					if (HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotKeys[40].Value > HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotKeys[40].OldValue)
					{
						strcpy(HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.CommandRequest, "delete");
						HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.CommandStatus = 1;
					}
					
					// Reload
					if (HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotKeys[41].Value > HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotKeys[41].OldValue)
					{
						strcpy(HmiEditorCtrl.Components.PageEdit.LayerDefault.EditPrg.StringBuffer, PrgString.c_str());
					}
					
					break;
			}
		}
		
		if (HmiGlobal.PageControl.ActPage == PAGE_EDITOR_DATA)
		{
			if (OldPage != PAGE_EDITOR_DATA)
			{
				DataStep = 0;
				HmiEditorCtrl.Components.PageData.LayerNewPopup.Layer.StatusDatapoint = 1;
				HmiEditorCtrl.Components.PageData.LayerPoint.Layer.StatusDatapoint = 1;
				HmiEditorCtrl.Components.PageData.LayerFrame.Layer.StatusDatapoint = 1;
				HmiEditorCtrl.Components.PageData.LayerTool.Layer.StatusDatapoint = 1;
				HmiEditorCtrl.Components.PageData.LayerAxis.Layer.StatusDatapoint = 1;
				HmiEditorCtrl.Components.PageData.LayerVel.Layer.StatusDatapoint = 1;
				HmiEditorCtrl.Components.PageData.LayerPath.Layer.StatusDatapoint = 1;
				HmiEditorCtrl.Components.PageData.LayerINT.Layer.StatusDatapoint = 1;
				HmiEditorCtrl.Components.PageData.LayerREAL.Layer.StatusDatapoint = 1;
				HmiEditorCtrl.Components.PageData.LayerBOOL.Layer.StatusDatapoint = 1;
			}
			// Show the Program Name
			if (StrName != ".st")
				HmiEditorCtrl.Components.PageData.LayerDefault.TextEditorName.TextIndex = 1;
			else
				HmiEditorCtrl.Components.PageData.LayerDefault.TextEditorName.TextIndex = 0;
			
			VarInfoType VarInfo;
			
			switch (DataStep)
			{
				case 0:
					if (DataLoaded) // Wait Data loaded and parsed
					{
						strcpy(HmiEditorCtrl.Components.PageData.LayerDefault.DropDownTypes.Entries[0], "MXPointType");
						strcpy(HmiEditorCtrl.Components.PageData.LayerDefault.DropDownTypes.Entries[1], "MXAxisTargetType");
						strcpy(HmiEditorCtrl.Components.PageData.LayerDefault.DropDownTypes.Entries[2], "MXFrameType");
						strcpy(HmiEditorCtrl.Components.PageData.LayerDefault.DropDownTypes.Entries[3], "MXToolType");
						strcpy(HmiEditorCtrl.Components.PageData.LayerDefault.DropDownTypes.Entries[4], "MXVelocityType");
						strcpy(HmiEditorCtrl.Components.PageData.LayerDefault.DropDownTypes.Entries[5], "MXPathDescType");
						strcpy(HmiEditorCtrl.Components.PageData.LayerDefault.DropDownTypes.Entries[6], "INT");
						strcpy(HmiEditorCtrl.Components.PageData.LayerDefault.DropDownTypes.Entries[7], "REAL");
						strcpy(HmiEditorCtrl.Components.PageData.LayerDefault.DropDownTypes.Entries[8], "BOOL");
						
						EntryIndex = 0;
						
						DataStep = 20;
						
					}
					break;
				
				case 20: // List Show
					
					memset(&HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables, 0, sizeof(HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables));
					SelectedIndex = (int)HmiEditorCtrl.Components.PageData.LayerDefault.DropDownTypes.SelectedIndex;
					SelectedType.assign(HmiEditorCtrl.Components.PageData.LayerDefault.DropDownTypes.Entries[SelectedIndex]);
					Size = STHandler_0->GetTypeSize(SelectedType); // How many Vars in this Type
					STHandler_0->SetIter(SelectedType, EntryIndex); // Set the Pointer for Vars in this Type
					
					HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.MaxListIndex = 0;
					// Get the Vars according to Type One by One
					while(STHandler_0->GetInfoFromType(SelectedType, VarInfo) > 0 && HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.MaxListIndex < MAX_VARVIEW )
					{	
						// Show the entry with certain format
						stringstream ss;			
						ss.setf(ios::left);
						ss.width(15);
						if (VarInfo.Name.length() > 15) // If the VarName too long, do the trunctation
							ss << (VarInfo.Name.substr(0,12) + "...");
						else
							ss << VarInfo.Name;
									
						ss.setf(ios::right);
						ss.width(7);
						if (VarInfo.Size > 1)
							ss << VarInfo.Size;
						else
							ss << "/";
									
						ss.setf(ios::right);
						ss.width(10);
						if (VarInfo.IsConstant)
							ss << "YES";
						else
							ss << "NO";
						
						strcpy(HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.Entries[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.MaxListIndex], ss.str().c_str()); 
						
						// Save the Vars
						VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.MaxListIndex].IsConstant = VarInfo.IsConstant;
						VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.MaxListIndex].Name = VarInfo.Name;
						VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.MaxListIndex].Size = VarInfo.Size;
						VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.MaxListIndex].Type = VarInfo.Type;
						
						++HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.MaxListIndex; // Show more entries
					}
					
					// If no vars in this type, Show "NONE"
					if (HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.MaxListIndex == 0)
					{
						strcpy(HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.Entries[0], "<NONE>");
						IsEmpty = 1;
					}
					else
					{
						--HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.MaxListIndex;
						IsEmpty = 0;
					}
					
					HmiEditorCtrl.Components.PageData.LayerDefault.DropDownTypes.OldSelectedIndex = HmiEditorCtrl.Components.PageData.LayerDefault.DropDownTypes.SelectedIndex;
					
					DataStep = 10;
					
					break;
				
				case 10: // IDLE State
					// If Select different Types
					if (HmiEditorCtrl.Components.PageData.LayerDefault.DropDownTypes.SelectedIndex != HmiEditorCtrl.Components.PageData.LayerDefault.DropDownTypes.OldSelectedIndex)
					{
						EntryIndex = 0;
						DataStep = 20;
					}
					// If Scrollup Button pressed
					if (HmiEditorCtrl.Components.PageData.LayerDefault.ButtonScrollup.Value > HmiEditorCtrl.Components.PageData.LayerDefault.ButtonScrollup.OldValue 
						&& !IsEmpty && EntryIndex != 0)
					{
						if (EntryIndex - MAX_VARVIEW < 0)
							EntryIndex = 0;
						else
							EntryIndex = EntryIndex - MAX_VARVIEW;
						
						DataStep = 20;
					}
					// If Scrolldown Button pressed
					if (HmiEditorCtrl.Components.PageData.LayerDefault.ButtonScrolldown.Value > HmiEditorCtrl.Components.PageData.LayerDefault.ButtonScrolldown.OldValue
						&& !IsEmpty && (EntryIndex + HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.MaxListIndex + 1) < Size)
					{
						if (EntryIndex + HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.MaxListIndex + MAX_VARVIEW + 1> Size)
							EntryIndex = Size - MAX_VARVIEW;
						else
							EntryIndex = EntryIndex + HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.MaxListIndex + 1;
						
						DataStep = 20;
					}
					// If Delete Button Pressed
					if (HmiEditorCtrl.Components.PageData.LayerDefault.ButtonDelete.Value > HmiEditorCtrl.Components.PageData.LayerDefault.ButtonDelete.OldValue && !IsEmpty)
					{
						STHandler_0->DeleteVariable(VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name);
					
						EntryIndex = 0;
						DataStep = 20;
					}
					// If New Button Pressed
					if (HmiEditorCtrl.Components.PageData.LayerDefault.ButtonNew.Value > HmiEditorCtrl.Components.PageData.LayerDefault.ButtonNew.OldValue)
					{
						NewVarStep = 0;
						DataStep = 11;

					}
					
					// If Show/Modify Button Pressed
					if (HmiEditorCtrl.Components.PageData.LayerDefault.ButtonModify.Value > HmiEditorCtrl.Components.PageData.LayerDefault.ButtonModify.OldValue && 
						!IsEmpty && VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].IsConstant)
					{
						VarStep = 0;
						DataStep = 30 + HmiEditorCtrl.Components.PageData.LayerDefault.DropDownTypes.SelectedIndex; // 30 - Step for Point/etc
					}
								
					// Adjust the scalebar always
					if (IsEmpty)
					{
						HmiEditorCtrl.Components.PageData.LayerDefault.ScaleScrollbar.EndDatapoint = 0;
						HmiEditorCtrl.Components.PageData.LayerDefault.ScaleScrollbar.StartDatapoint = 0;
					}
					else
					{
						HmiEditorCtrl.Components.PageData.LayerDefault.ScaleScrollbar.EndDatapoint = 100 - (EntryIndex * 100.0)/Size;
						HmiEditorCtrl.Components.PageData.LayerDefault.ScaleScrollbar.StartDatapoint = (Size - (EntryIndex + HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.MaxListIndex+1)) * 100.0 / Size;
					}
					
					break;
					
				case 11: // New Variable
					switch (NewVarStep)
					{
						case 0:
							HmiEditorCtrl.Components.PageData.LayerNewPopup.Layer.StatusDatapoint = 0;
							HmiEditorCtrl.Components.PageData.LayerNewPopup.NumInput.Value = 1;
							HmiEditorCtrl.Components.PageData.LayerNewPopup.TextInfo.TextIndex = 0;
							HmiEditorCtrl.Components.PageData.LayerNewPopup.ButtonConstant.Value = 0;
							strcpy(HmiEditorCtrl.Components.PageData.LayerNewPopup.StringInput.Value, "");
							NewVarStep = 10;
							break;
						case 10:
							// confirm the Insert
							if (HmiEditorCtrl.Components.PageData.LayerNewPopup.ButtonConfirm.Value > HmiEditorCtrl.Components.PageData.LayerNewPopup.ButtonConfirm.OldValue)
							{
							
								VarName.assign(HmiEditorCtrl.Components.PageData.LayerNewPopup.StringInput.Value);
								TypeName.assign(HmiEditorCtrl.Components.PageData.LayerDefault.DropDownTypes.Entries[HmiEditorCtrl.Components.PageData.LayerDefault.DropDownTypes.SelectedIndex]);
				
								if (VarName != "")
								{
									if (STHandler_0->GetInfoFromName(VarName, VarInfo)) // Check if there already exist such Var
									{
										VarName = StringHelper::GetVarName(TypeName, "");
										for (;STHandler_0->GetInfoFromName(VarName, VarInfo); VarName = StringHelper::GetVarName(TypeName, VarName));	
										strcpy(HmiEditorCtrl.Components.PageData.LayerNewPopup.StringInput.Value, VarName.c_str());
										HmiEditorCtrl.Components.PageData.LayerNewPopup.TextInfo.TextIndex = 1;
									}
									else // add the Vars directly
									{
										VarInfo.IsConstant = (bool)HmiEditorCtrl.Components.PageData.LayerNewPopup.ButtonConstant.Value;
										VarInfo.Name = VarName;
										VarInfo.Size = (int) HmiEditorCtrl.Components.PageData.LayerNewPopup.NumInput.Value;
										VarInfo.Type = TypeName;
										STHandler_0->AddVariable(VarInfo);
										
										HmiEditorCtrl.Components.PageData.LayerNewPopup.Layer.StatusDatapoint = 1;		
										DataStep = 20; 
									}
										
								} else // Provide default var name
								{ 
									VarName = StringHelper::GetVarName(TypeName, VarName);
									for (;STHandler_0->GetInfoFromName(VarName, VarInfo); VarName = StringHelper::GetVarName(TypeName, VarName));
									strcpy(HmiEditorCtrl.Components.PageData.LayerNewPopup.StringInput.Value, VarName.c_str());
									HmiEditorCtrl.Components.PageData.LayerNewPopup.TextInfo.TextIndex = 1;
								}
									
							}
					
							// Cancel the Add
							if (HmiEditorCtrl.Components.PageData.LayerNewPopup.ButtonCancel.Value > HmiEditorCtrl.Components.PageData.LayerNewPopup.ButtonCancel.OldValue)
							{
								HmiEditorCtrl.Components.PageData.LayerNewPopup.Layer.StatusDatapoint = 1;		
								DataStep = 10;
							}
						
							break;
					}
					break;
				
				case 30: // the Type Point after Modify/Show Button Pressed
					switch (VarStep)
					{
						case 0:
							
							HmiEditorCtrl.Components.PageData.LayerPoint.Layer.StatusDatapoint = 0;
							HmiEditorCtrl.Components.PageData.LayerPoint.NumericIndex.Value = 0;
							VarName = VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name;
							
							if (VarName != "") // Handle the title of Popup Window
							{stringstream ss;
								ss << VarName;
								if (VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size > 1)
									ss << " [" << VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size << "]";
								strcpy(HmiEditorCtrl.Components.PageData.LayerPoint.TextVarInfo.Value, ss.str().c_str());
							}
						
							VarStep = 10;
						
							break;
						
						case 10: // Show Value
							// get the info of the Var
							STHandler_0->ReadVariable(VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name, Point, 
								(int)HmiEditorCtrl.Components.PageData.LayerPoint.NumericIndex.Value);
						
							HmiEditorCtrl.Components.PageData.LayerPoint.NumericPosX.Value = Point.Pos.x;
							HmiEditorCtrl.Components.PageData.LayerPoint.NumericPosY.Value = Point.Pos.y;
							HmiEditorCtrl.Components.PageData.LayerPoint.NumericPosZ.Value = Point.Pos.z;
							HmiEditorCtrl.Components.PageData.LayerPoint.NumericOrientType.Value = Point.Orient.Type;
							HmiEditorCtrl.Components.PageData.LayerPoint.NumericOrientAngle0.Value = Point.Orient.Angle[0];
							HmiEditorCtrl.Components.PageData.LayerPoint.NumericOrientAngle1.Value = Point.Orient.Angle[1];
							HmiEditorCtrl.Components.PageData.LayerPoint.NumericOrientAngle2.Value = Point.Orient.Angle[2];
							HmiEditorCtrl.Components.PageData.LayerPoint.NumericOrientAngle3.Value = Point.Orient.Angle[3];
							HmiEditorCtrl.Components.PageData.LayerPoint.NumericIndex.Min = 0;
							HmiEditorCtrl.Components.PageData.LayerPoint.NumericIndex.Max = (REAL)VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size - 1;
							
							OldIndex = (int)HmiEditorCtrl.Components.PageData.LayerPoint.NumericIndex.Value;
							VarStep = 20;
						
							break;
						
						case 20: // Idle State
							
							if (OldIndex != HmiEditorCtrl.Components.PageData.LayerPoint.NumericIndex.Value) //  If different Index, read the Var again
								VarStep = 10; 
							// Change to different index of the array (Cp[0..xx])
							if (HmiEditorCtrl.Components.PageData.LayerPoint.ButtonIndexUp.Value > HmiEditorCtrl.Components.PageData.LayerPoint.ButtonIndexUp.OldValue)
							{
								if (HmiEditorCtrl.Components.PageData.LayerPoint.NumericIndex.Value < VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size - 1)
								{
									HmiEditorCtrl.Components.PageData.LayerPoint.NumericIndex.Value++;
									VarStep = 10;
								}	
							}
							if (HmiEditorCtrl.Components.PageData.LayerPoint.ButtonIndexDown.Value > HmiEditorCtrl.Components.PageData.LayerPoint.ButtonIndexDown.OldValue)
							{
								if (HmiEditorCtrl.Components.PageData.LayerPoint.NumericIndex.Value > 0)
								{
									HmiEditorCtrl.Components.PageData.LayerPoint.NumericIndex.Value--;
									VarStep = 10;
								}
							}
							// Close the Popup window
							if (HmiEditorCtrl.Components.PageData.LayerPoint.ButtonClose.Value > HmiEditorCtrl.Components.PageData.LayerPoint.ButtonClose.OldValue)
							{
								HmiEditorCtrl.Components.PageData.LayerPoint.Layer.StatusDatapoint = 1;
								DataStep = 10;
							}
							// Save the Value into Structure
							if (HmiEditorCtrl.Components.PageData.LayerPoint.ButtonSave.Value > HmiEditorCtrl.Components.PageData.LayerPoint.ButtonSave.OldValue)
							{
								Point.Pos.x = HmiEditorCtrl.Components.PageData.LayerPoint.NumericPosX.Value;
								Point.Pos.y = HmiEditorCtrl.Components.PageData.LayerPoint.NumericPosY.Value;
								Point.Pos.z = HmiEditorCtrl.Components.PageData.LayerPoint.NumericPosZ.Value;
								Point.Orient.Type = (UDINT)HmiEditorCtrl.Components.PageData.LayerPoint.NumericOrientType.Value;
								Point.Orient.Angle[0] = HmiEditorCtrl.Components.PageData.LayerPoint.NumericOrientAngle0.Value;
								Point.Orient.Angle[1] = HmiEditorCtrl.Components.PageData.LayerPoint.NumericOrientAngle1.Value;
								Point.Orient.Angle[2] = HmiEditorCtrl.Components.PageData.LayerPoint.NumericOrientAngle2.Value;
								Point.Orient.Angle[3] = HmiEditorCtrl.Components.PageData.LayerPoint.NumericOrientAngle3.Value;
								
								STHandler_0->ModifyVariable(VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name, Point, 
									(int)HmiEditorCtrl.Components.PageData.LayerPoint.NumericIndex.Value);
							
							}
							// Clear the Texts
							if (HmiEditorCtrl.Components.PageData.LayerPoint.ButtonClear.Value > HmiEditorCtrl.Components.PageData.LayerPoint.ButtonClear.OldValue)
							{
								HmiEditorCtrl.Components.PageData.LayerPoint.NumericPosX.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerPoint.NumericPosY.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerPoint.NumericPosZ.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerPoint.NumericOrientType.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerPoint.NumericOrientAngle0.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerPoint.NumericOrientAngle1.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerPoint.NumericOrientAngle2.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerPoint.NumericOrientAngle3.Value = 0;
							}
							// Reload the Value
							if (HmiEditorCtrl.Components.PageData.LayerPoint.ButtonReload.Value > HmiEditorCtrl.Components.PageData.LayerPoint.ButtonReload.OldValue)
							{
								VarStep = 10;
							}
							// Teach the Point (Set the Point with PointAct)
							if (HmiEditorCtrl.Components.PageData.LayerPoint.ButtonTeach.Value > HmiEditorCtrl.Components.PageData.LayerPoint.ButtonTeach.OldValue)
							{
								HmiEditorCtrl.Components.PageData.LayerPoint.NumericPosX.Value = PointAct.Pos.x;
								HmiEditorCtrl.Components.PageData.LayerPoint.NumericPosY.Value = PointAct.Pos.y;
								HmiEditorCtrl.Components.PageData.LayerPoint.NumericPosZ.Value = PointAct.Pos.z;
								HmiEditorCtrl.Components.PageData.LayerPoint.NumericOrientAngle0.Value = PointAct.Orient.Angle[0];
								HmiEditorCtrl.Components.PageData.LayerPoint.NumericOrientAngle1.Value = PointAct.Orient.Angle[1];
								HmiEditorCtrl.Components.PageData.LayerPoint.NumericOrientAngle2.Value = PointAct.Orient.Angle[2];
								HmiEditorCtrl.Components.PageData.LayerPoint.NumericOrientAngle3.Value = PointAct.Orient.Angle[3];
								HmiEditorCtrl.Components.PageData.LayerPoint.NumericOrientType.Value = PointAct.Orient.Type;
								
							}
							// Set as Jog Target Point
							if (HmiEditorCtrl.Components.PageData.LayerPoint.ButtonSetJog.Value > HmiEditorCtrl.Components.PageData.LayerPoint.ButtonSetJog.OldValue)
							{
								HmiRetain.HmiJog.Point.Point.Pos.x  = HmiEditorCtrl.Components.PageData.LayerPoint.NumericPosX.Value;
								HmiRetain.HmiJog.Point.Point.Pos.y = HmiEditorCtrl.Components.PageData.LayerPoint.NumericPosY.Value;
								HmiRetain.HmiJog.Point.Point.Pos.z = HmiEditorCtrl.Components.PageData.LayerPoint.NumericPosZ.Value;
								
								HmiRetain.HmiJog.Point.Point.Orient.Angle[0] = HmiEditorCtrl.Components.PageData.LayerPoint.NumericOrientAngle0.Value;
								HmiRetain.HmiJog.Point.Point.Orient.Angle[1] = HmiEditorCtrl.Components.PageData.LayerPoint.NumericOrientAngle1.Value;
								HmiRetain.HmiJog.Point.Point.Orient.Angle[2] = HmiEditorCtrl.Components.PageData.LayerPoint.NumericOrientAngle2.Value;
								HmiRetain.HmiJog.Point.Point.Orient.Angle[3] = HmiEditorCtrl.Components.PageData.LayerPoint.NumericOrientAngle3.Value;
								HmiRetain.HmiJog.Point.Point.Orient.Type = HmiEditorCtrl.Components.PageData.LayerPoint.NumericOrientType.Value;
								
								HmiRetain.HmiJog.Point.Set = 1;
								HmiRetain.HmiJog.Joint.Set = 0;
								string VarName = VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name;
								if (VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size > 1)
									VarName = VarName + "[" + StringHelper::ToString(HmiEditorCtrl.Components.PageData.LayerPoint.NumericIndex.Value) + "]";
								strcpy(HmiRetain.HmiJog.Point.VarName, VarName.c_str());
								
								strcpy(HmiRetain.HmiJog.Device, HmiRetain.HmiEditor.Device);
								strcpy(HmiRetain.HmiJog.Name, HmiRetain.HmiEditor.Name);
								
								HmiGlobal.PageControl.SetPage = PAGE_JOGGING;
							}

								
							break;
							
					}
					break;
				
				case 31: // Axis Popup Window
					switch (VarStep)
					{
						case 0:
							
							HmiEditorCtrl.Components.PageData.LayerAxis.Layer.StatusDatapoint = 0;
							HmiEditorCtrl.Components.PageData.LayerAxis.NumericIndex.Value = 0;
							VarName = VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name;
							
							if (VarName != "")
							{stringstream ss;
								ss << VarName;
								if (VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size > 1)
									ss << " [" << VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size << "]";
								strcpy(HmiEditorCtrl.Components.PageData.LayerAxis.TextVarInfo.Value, ss.str().c_str());
							}
						
							VarStep = 10;
						
							break;
						
						case 10: // Show Value
							
							STHandler_0->ReadVariable(VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name, Axis, 
								(int)HmiEditorCtrl.Components.PageData.LayerAxis.NumericIndex.Value);
						
							HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis0.Value = Axis.JointAxis[0];
							HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis1.Value = Axis.JointAxis[1];
							HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis2.Value = Axis.JointAxis[2];
							HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis3.Value = Axis.JointAxis[3];
							HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis4.Value = Axis.JointAxis[4];
							HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis5.Value = Axis.JointAxis[5];
						
							HmiEditorCtrl.Components.PageData.LayerAxis.NumericIndex.Min = 0;
							HmiEditorCtrl.Components.PageData.LayerAxis.NumericIndex.Max = (REAL)VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size - 1;
							
							OldIndex = (int)HmiEditorCtrl.Components.PageData.LayerAxis.NumericIndex.Value;
							VarStep = 20;
						
							break;
						
						case 20: // Idle State
							
							if (OldIndex != HmiEditorCtrl.Components.PageData.LayerAxis.NumericIndex.Value) // Reload Value
								VarStep = 10;
							// Index Up
							if (HmiEditorCtrl.Components.PageData.LayerAxis.ButtonIndexUp.Value > HmiEditorCtrl.Components.PageData.LayerAxis.ButtonIndexUp.OldValue)
							{
								if (HmiEditorCtrl.Components.PageData.LayerAxis.NumericIndex.Value < VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size - 1)
								{
									HmiEditorCtrl.Components.PageData.LayerAxis.NumericIndex.Value++;
									VarStep = 10;
								}	
							}
							// Index Down
							if (HmiEditorCtrl.Components.PageData.LayerAxis.ButtonIndexDown.Value > HmiEditorCtrl.Components.PageData.LayerAxis.ButtonIndexDown.OldValue)
							{
								if (HmiEditorCtrl.Components.PageData.LayerAxis.NumericIndex.Value > 0)
								{
									HmiEditorCtrl.Components.PageData.LayerAxis.NumericIndex.Value--;
									VarStep = 10;
								}
							}
							// CLose the Popup Window
							if (HmiEditorCtrl.Components.PageData.LayerAxis.ButtonClose.Value > HmiEditorCtrl.Components.PageData.LayerAxis.ButtonClose.OldValue)
							{
								HmiEditorCtrl.Components.PageData.LayerAxis.Layer.StatusDatapoint = 1;
								DataStep = 10;
							}
							// Save the Value
							if (HmiEditorCtrl.Components.PageData.LayerAxis.ButtonSave.Value > HmiEditorCtrl.Components.PageData.LayerAxis.ButtonSave.OldValue)
							{
								Axis.JointAxis[0] = HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis0.Value;
								Axis.JointAxis[1] = HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis1.Value;
								Axis.JointAxis[2] = HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis2.Value;
								Axis.JointAxis[3] = HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis3.Value;
								Axis.JointAxis[4] = HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis4.Value;
								Axis.JointAxis[5] = HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis5.Value;
								
								STHandler_0->ModifyVariable(VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name, Axis, 
									(int)HmiEditorCtrl.Components.PageData.LayerAxis.NumericIndex.Value);
							
							}
							// Clear the text boxes
							if (HmiEditorCtrl.Components.PageData.LayerAxis.ButtonClear.Value > HmiEditorCtrl.Components.PageData.LayerAxis.ButtonClear.OldValue)
							{
								HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis0.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis1.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis2.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis3.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis4.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis5.Value = 0;						
							}
							
							// Reload Value
							if (HmiEditorCtrl.Components.PageData.LayerAxis.ButtonReload.Value > HmiEditorCtrl.Components.PageData.LayerAxis.ButtonReload.OldValue)
							{
								VarStep = 10;
							}
							// Teach the Axis Point
							if (HmiEditorCtrl.Components.PageData.LayerAxis.ButtonTeach.Value > HmiEditorCtrl.Components.PageData.LayerAxis.ButtonTeach.OldValue)
							{
								HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis0.Value = JointAct[0];
								HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis1.Value = JointAct[1];
								HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis2.Value = JointAct[2];
								HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis3.Value = JointAct[3];
								HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis4.Value = JointAct[4];
								HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis5.Value = JointAct[5];
								
							}
							// Set as Jog Target Point
							if (HmiEditorCtrl.Components.PageData.LayerAxis.ButtonSetJog.Value > HmiEditorCtrl.Components.PageData.LayerAxis.ButtonSetJog.OldValue)
							{
								HmiRetain.HmiJog.Joint.Joint.JointAxis[0] = HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis0.Value;
								HmiRetain.HmiJog.Joint.Joint.JointAxis[1] = HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis1.Value;
								HmiRetain.HmiJog.Joint.Joint.JointAxis[2] = HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis2.Value;
								HmiRetain.HmiJog.Joint.Joint.JointAxis[3] = HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis3.Value;
								HmiRetain.HmiJog.Joint.Joint.JointAxis[4] = HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis4.Value;
								HmiRetain.HmiJog.Joint.Joint.JointAxis[5] = HmiEditorCtrl.Components.PageData.LayerAxis.NumericJointAxis5.Value;
								
								HmiRetain.HmiJog.Point.Set = 0;
								HmiRetain.HmiJog.Joint.Set = 1;
								string VarName = VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name;
								if (VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size > 1)
									VarName = VarName + "[" + StringHelper::ToString(HmiEditorCtrl.Components.PageData.LayerAxis.NumericIndex.Value) + "]";
								strcpy(HmiRetain.HmiJog.Joint.VarName, VarName.c_str());
								
								strcpy(HmiRetain.HmiJog.Device, HmiRetain.HmiEditor.Device);
								strcpy(HmiRetain.HmiJog.Name, HmiRetain.HmiEditor.Name);
								
								HmiGlobal.PageControl.SetPage = PAGE_JOGGING;
							}
						
							break;
							
					}
					break;
				
				case 32: // Frame Popup Window(Similar to Other PopuWindow)
					switch (VarStep)
					{
						case 0:
							
							HmiEditorCtrl.Components.PageData.LayerFrame.Layer.StatusDatapoint = 0;
							HmiEditorCtrl.Components.PageData.LayerFrame.NumericIndex.Value = 0;
							VarName = VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name;
							
							if (VarName != "")
							{stringstream ss;
								ss << VarName;
								if (VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size > 1)
									ss << " [" << VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size << "]";
								strcpy(HmiEditorCtrl.Components.PageData.LayerFrame.TextVarInfo.Value, ss.str().c_str());
							}
						
							VarStep = 10;
						
							break;
						
						case 10: // Show Value
							
							STHandler_0->ReadVariable(VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name, Frame, 
								(int)HmiEditorCtrl.Components.PageData.LayerFrame.NumericIndex.Value);
						
							HmiEditorCtrl.Components.PageData.LayerFrame.NumericPosX.Value = Frame.Pos.x;
							HmiEditorCtrl.Components.PageData.LayerFrame.NumericPosY.Value = Frame.Pos.y;
							HmiEditorCtrl.Components.PageData.LayerFrame.NumericPosZ.Value = Frame.Pos.z;
							HmiEditorCtrl.Components.PageData.LayerFrame.NumericOrientType.Value = Frame.Orient.Type;
							HmiEditorCtrl.Components.PageData.LayerFrame.NumericOrientAngle0.Value = Frame.Orient.Angle[0];
							HmiEditorCtrl.Components.PageData.LayerFrame.NumericOrientAngle1.Value = Frame.Orient.Angle[1];
							HmiEditorCtrl.Components.PageData.LayerFrame.NumericOrientAngle2.Value = Frame.Orient.Angle[2];
							HmiEditorCtrl.Components.PageData.LayerFrame.NumericOrientAngle3.Value = Frame.Orient.Angle[3];
							HmiEditorCtrl.Components.PageData.LayerFrame.NumericIndex.Min = 0;
							HmiEditorCtrl.Components.PageData.LayerFrame.NumericIndex.Max = (REAL)VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size - 1;
							
							OldIndex = (int)HmiEditorCtrl.Components.PageData.LayerFrame.NumericIndex.Value;
							VarStep = 20;
						
							break;
						
						case 20: // Idle State
							
							if (OldIndex != HmiEditorCtrl.Components.PageData.LayerFrame.NumericIndex.Value) // 
								VarStep = 10;
							
							if (HmiEditorCtrl.Components.PageData.LayerFrame.ButtonIndexUp.Value > HmiEditorCtrl.Components.PageData.LayerFrame.ButtonIndexUp.OldValue)
							{
								if (HmiEditorCtrl.Components.PageData.LayerFrame.NumericIndex.Value < VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size - 1)
								{
									HmiEditorCtrl.Components.PageData.LayerFrame.NumericIndex.Value++;
									VarStep = 10;
								}	
							}
							if (HmiEditorCtrl.Components.PageData.LayerFrame.ButtonIndexDown.Value > HmiEditorCtrl.Components.PageData.LayerFrame.ButtonIndexDown.OldValue)
							{
								if (HmiEditorCtrl.Components.PageData.LayerFrame.NumericIndex.Value > 0)
								{
									HmiEditorCtrl.Components.PageData.LayerFrame.NumericIndex.Value--;
									VarStep = 10;
								}
							}
						
							if (HmiEditorCtrl.Components.PageData.LayerFrame.ButtonClose.Value > HmiEditorCtrl.Components.PageData.LayerFrame.ButtonClose.OldValue)
							{
								HmiEditorCtrl.Components.PageData.LayerFrame.Layer.StatusDatapoint = 1;
								DataStep = 10;
							}
						
							if (HmiEditorCtrl.Components.PageData.LayerFrame.ButtonSave.Value > HmiEditorCtrl.Components.PageData.LayerFrame.ButtonSave.OldValue)
							{
								Frame.Pos.x = HmiEditorCtrl.Components.PageData.LayerFrame.NumericPosX.Value;
								Frame.Pos.y = HmiEditorCtrl.Components.PageData.LayerFrame.NumericPosY.Value;
								Frame.Pos.z = HmiEditorCtrl.Components.PageData.LayerFrame.NumericPosZ.Value;
								Frame.Orient.Type = (UDINT)HmiEditorCtrl.Components.PageData.LayerFrame.NumericOrientType.Value;
								Frame.Orient.Angle[0] = HmiEditorCtrl.Components.PageData.LayerFrame.NumericOrientAngle0.Value;
								Frame.Orient.Angle[1] = HmiEditorCtrl.Components.PageData.LayerFrame.NumericOrientAngle1.Value;
								Frame.Orient.Angle[2] = HmiEditorCtrl.Components.PageData.LayerFrame.NumericOrientAngle2.Value;
								Frame.Orient.Angle[3] = HmiEditorCtrl.Components.PageData.LayerFrame.NumericOrientAngle3.Value;
								
								STHandler_0->ModifyVariable(VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name, Frame, 
									(int)HmiEditorCtrl.Components.PageData.LayerFrame.NumericIndex.Value);
							
							}
						
							if (HmiEditorCtrl.Components.PageData.LayerFrame.ButtonClear.Value > HmiEditorCtrl.Components.PageData.LayerFrame.ButtonClear.OldValue)
							{
								HmiEditorCtrl.Components.PageData.LayerFrame.NumericPosX.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerFrame.NumericPosY.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerFrame.NumericPosZ.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerFrame.NumericOrientType.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerFrame.NumericOrientAngle0.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerFrame.NumericOrientAngle1.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerFrame.NumericOrientAngle2.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerFrame.NumericOrientAngle3.Value = 0;
							}
						
							if (HmiEditorCtrl.Components.PageData.LayerFrame.ButtonReload.Value > HmiEditorCtrl.Components.PageData.LayerFrame.ButtonReload.OldValue)
							{
								VarStep = 10;
							}
						
							if (HmiEditorCtrl.Components.PageData.LayerFrame.ButtonSetJog.Value > HmiEditorCtrl.Components.PageData.LayerFrame.ButtonSetJog.OldValue)
							{
								HmiRetain.HmiJog.Frame.Frame.Pos.x = HmiEditorCtrl.Components.PageData.LayerFrame.NumericPosX.Value;
								HmiRetain.HmiJog.Frame.Frame.Pos.y = HmiEditorCtrl.Components.PageData.LayerFrame.NumericPosY.Value;
								HmiRetain.HmiJog.Frame.Frame.Pos.z = HmiEditorCtrl.Components.PageData.LayerFrame.NumericPosZ.Value;
								HmiRetain.HmiJog.Frame.Frame.Orient.Angle[0] = HmiEditorCtrl.Components.PageData.LayerFrame.NumericOrientAngle0.Value;
								HmiRetain.HmiJog.Frame.Frame.Orient.Angle[1] = HmiEditorCtrl.Components.PageData.LayerFrame.NumericOrientAngle1.Value;
								HmiRetain.HmiJog.Frame.Frame.Orient.Angle[2] = HmiEditorCtrl.Components.PageData.LayerFrame.NumericOrientAngle2.Value;
								HmiRetain.HmiJog.Frame.Frame.Orient.Angle[3] = HmiEditorCtrl.Components.PageData.LayerFrame.NumericOrientAngle3.Value;
								HmiRetain.HmiJog.Frame.Frame.Orient.Type = HmiEditorCtrl.Components.PageData.LayerFrame.NumericOrientType.Value;
							
								string VarName = VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name;
								if (VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size > 1)
									VarName = VarName + "[" + StringHelper::ToString(HmiEditorCtrl.Components.PageData.LayerFrame.NumericIndex.Value) + "]";
								strcpy(HmiRetain.HmiJog.Frame.VarName, VarName.c_str());
								strcpy(HmiRetain.HmiJog.Device, HmiRetain.HmiEditor.Device);
								strcpy(HmiRetain.HmiJog.Name, HmiRetain.HmiEditor.Name);
								
								HmiGlobal.PageControl.SetPage = PAGE_JOGGING;
								
							}
						
							break;
							
					}
					break;
				
				case 33: // Tool Popup Window
					switch (VarStep)
					{
						case 0:
							
							HmiEditorCtrl.Components.PageData.LayerTool.Layer.StatusDatapoint = 0;
							HmiEditorCtrl.Components.PageData.LayerTool.NumericIndex.Value = 0;
							VarName = VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name;
							
							if (VarName != "")
							{stringstream ss;
								ss << VarName;
								if (VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size > 1)
									ss << " [" << VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size << "]";
								strcpy(HmiEditorCtrl.Components.PageData.LayerTool.TextVarInfo.Value, ss.str().c_str());
							}
						
							VarStep = 10;
						
							break;
						
						case 10: // Show Value
							
							STHandler_0->ReadVariable(VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name, Tool, 
								(int)HmiEditorCtrl.Components.PageData.LayerTool.NumericIndex.Value);
						
							HmiEditorCtrl.Components.PageData.LayerTool.NumericPosX.Value = Tool.Frame.Pos.x;
							HmiEditorCtrl.Components.PageData.LayerTool.NumericPosY.Value = Tool.Frame.Pos.y;
							HmiEditorCtrl.Components.PageData.LayerTool.NumericPosZ.Value = Tool.Frame.Pos.z;
							HmiEditorCtrl.Components.PageData.LayerTool.NumericOrientType.Value = Tool.Frame.Orient.Type;
							HmiEditorCtrl.Components.PageData.LayerTool.NumericOrientAngle0.Value = Tool.Frame.Orient.Angle[0];
							HmiEditorCtrl.Components.PageData.LayerTool.NumericOrientAngle1.Value = Tool.Frame.Orient.Angle[1];
							HmiEditorCtrl.Components.PageData.LayerTool.NumericOrientAngle2.Value = Tool.Frame.Orient.Angle[2];
							HmiEditorCtrl.Components.PageData.LayerTool.NumericOrientAngle3.Value = Tool.Frame.Orient.Angle[3];
							HmiEditorCtrl.Components.PageData.LayerTool.NumericRadius.Value = Tool.Radius;
							HmiEditorCtrl.Components.PageData.LayerTool.NumericIndex.Min = 0;
							HmiEditorCtrl.Components.PageData.LayerTool.NumericIndex.Max = (REAL)VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size - 1;
							
							OldIndex = (int)HmiEditorCtrl.Components.PageData.LayerTool.NumericIndex.Value;
							VarStep = 20;
						
							break;
						
						case 20: // Idle State
							
							if (OldIndex != HmiEditorCtrl.Components.PageData.LayerTool.NumericIndex.Value) // 
								VarStep = 10;
							
							if (HmiEditorCtrl.Components.PageData.LayerTool.ButtonIndexUp.Value > HmiEditorCtrl.Components.PageData.LayerTool.ButtonIndexUp.OldValue)
							{
								if (HmiEditorCtrl.Components.PageData.LayerTool.NumericIndex.Value < VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size - 1)
								{
									HmiEditorCtrl.Components.PageData.LayerTool.NumericIndex.Value++;
									VarStep = 10;
								}	
							}
							if (HmiEditorCtrl.Components.PageData.LayerTool.ButtonIndexDown.Value > HmiEditorCtrl.Components.PageData.LayerTool.ButtonIndexDown.OldValue)
							{
								if (HmiEditorCtrl.Components.PageData.LayerTool.NumericIndex.Value > 0)
								{
									HmiEditorCtrl.Components.PageData.LayerTool.NumericIndex.Value--;
									VarStep = 10;
								}
							}
						
							if (HmiEditorCtrl.Components.PageData.LayerTool.ButtonClose.Value > HmiEditorCtrl.Components.PageData.LayerTool.ButtonClose.OldValue)
							{
								HmiEditorCtrl.Components.PageData.LayerTool.Layer.StatusDatapoint = 1;
								DataStep = 10;
							}
						
							if (HmiEditorCtrl.Components.PageData.LayerTool.ButtonSave.Value > HmiEditorCtrl.Components.PageData.LayerTool.ButtonSave.OldValue)
							{
								Tool.Frame.Pos.x = HmiEditorCtrl.Components.PageData.LayerTool.NumericPosX.Value;
								Tool.Frame.Pos.y = HmiEditorCtrl.Components.PageData.LayerTool.NumericPosY.Value;
								Tool.Frame.Pos.z = HmiEditorCtrl.Components.PageData.LayerTool.NumericPosZ.Value;
								Tool.Frame.Orient.Type = (UDINT)HmiEditorCtrl.Components.PageData.LayerTool.NumericOrientType.Value;
								Tool.Frame.Orient.Angle[0] = HmiEditorCtrl.Components.PageData.LayerTool.NumericOrientAngle0.Value;
								Tool.Frame.Orient.Angle[1] = HmiEditorCtrl.Components.PageData.LayerTool.NumericOrientAngle1.Value;
								Tool.Frame.Orient.Angle[2] = HmiEditorCtrl.Components.PageData.LayerTool.NumericOrientAngle2.Value;
								Tool.Frame.Orient.Angle[3] = HmiEditorCtrl.Components.PageData.LayerTool.NumericOrientAngle3.Value;
								Tool.Radius = HmiEditorCtrl.Components.PageData.LayerTool.NumericRadius.Value;
								
								STHandler_0->ModifyVariable(VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name, Tool, 
									(int)HmiEditorCtrl.Components.PageData.LayerTool.NumericIndex.Value);
							
							}
						
							if (HmiEditorCtrl.Components.PageData.LayerTool.ButtonClear.Value > HmiEditorCtrl.Components.PageData.LayerTool.ButtonClear.OldValue)
							{
								HmiEditorCtrl.Components.PageData.LayerTool.NumericPosX.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerTool.NumericPosY.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerTool.NumericPosZ.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerTool.NumericOrientType.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerTool.NumericOrientAngle0.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerTool.NumericOrientAngle1.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerTool.NumericOrientAngle2.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerTool.NumericOrientAngle3.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerTool.NumericRadius.Value = 0;
							}
							
							if (HmiEditorCtrl.Components.PageData.LayerTool.ButtonReload.Value > HmiEditorCtrl.Components.PageData.LayerTool.ButtonReload.OldValue)
							{
								VarStep = 10;
							}
						
							if (HmiEditorCtrl.Components.PageData.LayerTool.ButtonSetJog.Value > HmiEditorCtrl.Components.PageData.LayerTool.ButtonSetJog.OldValue)
							{
								
								if (HmiEditorCtrl.Components.PageData.LayerFrame.NumericOrientType.Value == MX_QUATERNION)
									HmiJog.Components.LayerDefault.DropdownEulerQuan.SelectedIndex = 1;
								else
									HmiJog.Components.LayerDefault.DropdownEulerQuan.SelectedIndex = 0;
								
								
								HmiRetain.HmiJog.Tool.Tool.Frame.Pos.x = HmiEditorCtrl.Components.PageData.LayerTool.NumericPosX.Value;
								HmiRetain.HmiJog.Tool.Tool.Frame.Pos.y = HmiEditorCtrl.Components.PageData.LayerTool.NumericPosY.Value;
								HmiRetain.HmiJog.Tool.Tool.Frame.Pos.z = HmiEditorCtrl.Components.PageData.LayerTool.NumericPosZ.Value;
								HmiRetain.HmiJog.Tool.Tool.Frame.Orient.Angle[0] = HmiEditorCtrl.Components.PageData.LayerTool.NumericOrientAngle0.Value;
								HmiRetain.HmiJog.Tool.Tool.Frame.Orient.Angle[1] = HmiEditorCtrl.Components.PageData.LayerTool.NumericOrientAngle1.Value;
								HmiRetain.HmiJog.Tool.Tool.Frame.Orient.Angle[2] = HmiEditorCtrl.Components.PageData.LayerTool.NumericOrientAngle2.Value;
								HmiRetain.HmiJog.Tool.Tool.Frame.Orient.Angle[3] = HmiEditorCtrl.Components.PageData.LayerTool.NumericOrientAngle3.Value;
								HmiRetain.HmiJog.Tool.Tool.Frame.Orient.Type = HmiEditorCtrl.Components.PageData.LayerFrame.NumericOrientType.Value;
								HmiRetain.HmiJog.Tool.Tool.Radius = HmiEditorCtrl.Components.PageData.LayerTool.NumericRadius.Value;
								
								string VarName = VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name;
								if (VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size > 1)
									VarName = VarName + "[" + StringHelper::ToString(HmiEditorCtrl.Components.PageData.LayerTool.NumericIndex.Value) + "]";
								strcpy(HmiRetain.HmiJog.Tool.VarName, VarName.c_str());
								strcpy(HmiRetain.HmiJog.Device, HmiRetain.HmiEditor.Device);
								strcpy(HmiRetain.HmiJog.Name, HmiRetain.HmiEditor.Name);		
								HmiGlobal.PageControl.SetPage = PAGE_JOGGING;
								
							}
						
							break;
									
					}
					break;
				
				case 34: // Velocity popup window
					switch (VarStep)
					{
						case 0:
							
							HmiEditorCtrl.Components.PageData.LayerVel.Layer.StatusDatapoint = 0;
							HmiEditorCtrl.Components.PageData.LayerVel.NumericIndex.Value = 0;
							VarName = VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name;
							
							if (VarName != "")
							{stringstream ss;
								ss << VarName;
								if (VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size > 1)
									ss << " [" << VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size << "]";
								strcpy(HmiEditorCtrl.Components.PageData.LayerVel.TextVarInfo.Value, ss.str().c_str());
							}
						
							VarStep = 10;
						
							break;
						
						case 10: // Show Value
							
							STHandler_0->ReadVariable(VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name, Vel, 
								(int)HmiEditorCtrl.Components.PageData.LayerVel.NumericIndex.Value);
						
							HmiEditorCtrl.Components.PageData.LayerVel.Numericv.Value = Vel.v;
							HmiEditorCtrl.Components.PageData.LayerVel.NumericMode.Value = Vel.Mode;
							
							HmiEditorCtrl.Components.PageData.LayerVel.NumericIndex.Min = 0;
							HmiEditorCtrl.Components.PageData.LayerVel.NumericIndex.Max = (REAL)VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size - 1;
							
							OldIndex = (int)HmiEditorCtrl.Components.PageData.LayerVel.NumericIndex.Value;
							VarStep = 20;
						
							break;
						
						case 20: // Idle State
							
							if (OldIndex != HmiEditorCtrl.Components.PageData.LayerVel.NumericIndex.Value) // 
								VarStep = 10;
							
							if (HmiEditorCtrl.Components.PageData.LayerVel.ButtonIndexUp.Value > HmiEditorCtrl.Components.PageData.LayerVel.ButtonIndexUp.OldValue)
							{
								if (HmiEditorCtrl.Components.PageData.LayerVel.NumericIndex.Value < VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size - 1)
								{
									HmiEditorCtrl.Components.PageData.LayerVel.NumericIndex.Value++;
									VarStep = 10;
								}	
							}
							if (HmiEditorCtrl.Components.PageData.LayerVel.ButtonIndexDown.Value > HmiEditorCtrl.Components.PageData.LayerVel.ButtonIndexDown.OldValue)
							{
								if (HmiEditorCtrl.Components.PageData.LayerVel.NumericIndex.Value > 0)
								{
									HmiEditorCtrl.Components.PageData.LayerVel.NumericIndex.Value--;
									VarStep = 10;
								}
							}
						
							if (HmiEditorCtrl.Components.PageData.LayerVel.ButtonClose.Value > HmiEditorCtrl.Components.PageData.LayerVel.ButtonClose.OldValue)
							{
								HmiEditorCtrl.Components.PageData.LayerVel.Layer.StatusDatapoint = 1;
								DataStep = 10;
							}
							
							if (HmiEditorCtrl.Components.PageData.LayerVel.ButtonSave.Value > HmiEditorCtrl.Components.PageData.LayerVel.ButtonSave.OldValue)
							{
								Vel.v = HmiEditorCtrl.Components.PageData.LayerVel.Numericv.Value;
								Vel.Mode = (UDINT)HmiEditorCtrl.Components.PageData.LayerVel.NumericMode.Value;
								
								STHandler_0->ModifyVariable(VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name, Vel, 
									(int)HmiEditorCtrl.Components.PageData.LayerVel.NumericIndex.Value);
							
							}
						
							if (HmiEditorCtrl.Components.PageData.LayerVel.ButtonClear.Value > HmiEditorCtrl.Components.PageData.LayerVel.ButtonClear.OldValue)
							{
								HmiEditorCtrl.Components.PageData.LayerVel.Numericv.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerVel.NumericMode.Value = 0;
							}
						
							if (HmiEditorCtrl.Components.PageData.LayerVel.ButtonReload.Value > HmiEditorCtrl.Components.PageData.LayerVel.ButtonReload.OldValue)
							{
								VarStep = 10;
							}
						
							break;
							
					}
					break;
				
				case 35: // Path Popup Window
					switch (VarStep)
					{
						case 0:
							
							HmiEditorCtrl.Components.PageData.LayerPath.Layer.StatusDatapoint = 0;
							HmiEditorCtrl.Components.PageData.LayerPath.NumericIndex.Value = 0;
							VarName = VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name;
							
							if (VarName != "")
							{stringstream ss;
								ss << VarName;
								if (VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size > 1)
									ss << " [" << VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size << "]";
								strcpy(HmiEditorCtrl.Components.PageData.LayerPath.TextVarInfo.Value, ss.str().c_str());
							}
						
							VarStep = 10;
						
							break;
						
						case 10: // Show Value
							
							STHandler_0->ReadVariable(VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name, Path, 
								(int)HmiEditorCtrl.Components.PageData.LayerPath.NumericIndex.Value);
						
							HmiEditorCtrl.Components.PageData.LayerPath.NumericRadius.Value = Path.Trans.Radius;
							HmiEditorCtrl.Components.PageData.LayerPath.NumericType.Value   = Path.Trans.Type;
			
							HmiEditorCtrl.Components.PageData.LayerPath.NumericIndex.Min = 0;
							HmiEditorCtrl.Components.PageData.LayerPath.NumericIndex.Max = (REAL)VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size - 1;
							
							OldIndex = (int)HmiEditorCtrl.Components.PageData.LayerPath.NumericIndex.Value;
							VarStep = 20;
						
							break;
						
						case 20: // Idle State
							
							if (OldIndex != HmiEditorCtrl.Components.PageData.LayerPath.NumericIndex.Value) // 
								VarStep = 10;
							
							if (HmiEditorCtrl.Components.PageData.LayerPath.ButtonIndexUp.Value > HmiEditorCtrl.Components.PageData.LayerPath.ButtonIndexUp.OldValue)
							{
								if (HmiEditorCtrl.Components.PageData.LayerPath.NumericIndex.Value < VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size - 1)
								{
									HmiEditorCtrl.Components.PageData.LayerPath.NumericIndex.Value++;
									VarStep = 10;
								}	
							}
							if (HmiEditorCtrl.Components.PageData.LayerPath.ButtonIndexDown.Value > HmiEditorCtrl.Components.PageData.LayerPath.ButtonIndexDown.OldValue)
							{
								if (HmiEditorCtrl.Components.PageData.LayerPath.NumericIndex.Value > 0)
								{
									HmiEditorCtrl.Components.PageData.LayerPath.NumericIndex.Value--;
									VarStep = 10;
								}
							}
						
							if (HmiEditorCtrl.Components.PageData.LayerPath.ButtonClose.Value > HmiEditorCtrl.Components.PageData.LayerPath.ButtonClose.OldValue)
							{
								HmiEditorCtrl.Components.PageData.LayerPath.Layer.StatusDatapoint = 1;
								DataStep = 10;
							}
							
							if (HmiEditorCtrl.Components.PageData.LayerPath.ButtonSave.Value > HmiEditorCtrl.Components.PageData.LayerPath.ButtonSave.OldValue)
							{
								Path.Trans.Radius = HmiEditorCtrl.Components.PageData.LayerPath.NumericRadius.Value;
								Path.Trans.Type = (UDINT)HmiEditorCtrl.Components.PageData.LayerPath.NumericType.Value;
								
								STHandler_0->ModifyVariable(VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name, Path, 
									(int)HmiEditorCtrl.Components.PageData.LayerPath.NumericIndex.Value);
							
							}
						
							if (HmiEditorCtrl.Components.PageData.LayerPath.ButtonClear.Value > HmiEditorCtrl.Components.PageData.LayerPath.ButtonClear.OldValue)
							{
								HmiEditorCtrl.Components.PageData.LayerPath.NumericRadius.Value = 0;
								HmiEditorCtrl.Components.PageData.LayerPath.NumericType.Value = 0;
							}
							
							if (HmiEditorCtrl.Components.PageData.LayerPath.ButtonReload.Value > HmiEditorCtrl.Components.PageData.LayerPath.ButtonReload.OldValue)
							{
								VarStep = 10;
							}
						
							break;
							
					}
					break;
			
				case 36: // INT Popup Window
					switch (VarStep)
					{
						case 0:
							
							HmiEditorCtrl.Components.PageData.LayerINT.Layer.StatusDatapoint = 0;
							HmiEditorCtrl.Components.PageData.LayerINT.NumericIndex.Value = 0;
							VarName = VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name;
							
							if (VarName != "")
							{stringstream ss;
								ss << VarName;
								if (VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size > 1)
									ss << " [" << VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size << "]";
								strcpy(HmiEditorCtrl.Components.PageData.LayerINT.TextVarInfo.Value, ss.str().c_str());
							}
						
							VarStep = 10;
						
							break;
						
						case 10: // Show Value
							
							STHandler_0->ReadVariable(VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name, Int, 
								(int)HmiEditorCtrl.Components.PageData.LayerINT.NumericIndex.Value);
						
							HmiEditorCtrl.Components.PageData.LayerINT.NumericValue.Value = Int;
			
							HmiEditorCtrl.Components.PageData.LayerINT.NumericIndex.Min = 0;
							HmiEditorCtrl.Components.PageData.LayerINT.NumericIndex.Max = (REAL)VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size - 1;
							
							OldIndex = (int)HmiEditorCtrl.Components.PageData.LayerINT.NumericIndex.Value;
							VarStep = 20;
						
							break;
						
						case 20: // Idle State
							
							if (OldIndex != HmiEditorCtrl.Components.PageData.LayerINT.NumericIndex.Value) // 
								VarStep = 10;
							
							if (HmiEditorCtrl.Components.PageData.LayerINT.ButtonIndexUp.Value > HmiEditorCtrl.Components.PageData.LayerINT.ButtonIndexUp.OldValue)
							{
								if (HmiEditorCtrl.Components.PageData.LayerINT.NumericIndex.Value < VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size - 1)
								{
									HmiEditorCtrl.Components.PageData.LayerINT.NumericIndex.Value++;
									VarStep = 10;
								}	
							}
							if (HmiEditorCtrl.Components.PageData.LayerINT.ButtonIndexDown.Value > HmiEditorCtrl.Components.PageData.LayerINT.ButtonIndexDown.OldValue)
							{
								if (HmiEditorCtrl.Components.PageData.LayerINT.NumericIndex.Value > 0)
								{
									HmiEditorCtrl.Components.PageData.LayerINT.NumericIndex.Value--;
									VarStep = 10;
								}
							}
						
							if (HmiEditorCtrl.Components.PageData.LayerINT.ButtonClose.Value > HmiEditorCtrl.Components.PageData.LayerINT.ButtonClose.OldValue)
							{
								HmiEditorCtrl.Components.PageData.LayerINT.Layer.StatusDatapoint = 1;
								DataStep = 10;
							}
						
							if (HmiEditorCtrl.Components.PageData.LayerINT.ButtonSave.Value > HmiEditorCtrl.Components.PageData.LayerINT.ButtonSave.OldValue)
							{
								Int = (INT)HmiEditorCtrl.Components.PageData.LayerINT.NumericValue.Value;
								
								STHandler_0->ModifyVariable(VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name, Int, 
									(int)HmiEditorCtrl.Components.PageData.LayerINT.NumericIndex.Value);
							
							}
						
							if (HmiEditorCtrl.Components.PageData.LayerINT.ButtonClear.Value > HmiEditorCtrl.Components.PageData.LayerINT.ButtonClear.OldValue)
							{
								HmiEditorCtrl.Components.PageData.LayerINT.NumericValue.Value = 0;
							}
						
							if (HmiEditorCtrl.Components.PageData.LayerINT.ButtonReload.Value > HmiEditorCtrl.Components.PageData.LayerINT.ButtonReload.OldValue)
							{
								VarStep = 10;
							}
							
							break;
							
					}
					break;
				
				case 37: // REAL Popup Window
					switch (VarStep)
					{
						case 0:
							
							HmiEditorCtrl.Components.PageData.LayerREAL.Layer.StatusDatapoint = 0;
							HmiEditorCtrl.Components.PageData.LayerREAL.NumericIndex.Value = 0;
							VarName = VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name;
							
							if (VarName != "")
							{stringstream ss;
								ss << VarName;
								if (VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size > 1)
									ss << " [" << VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size << "]";
								strcpy(HmiEditorCtrl.Components.PageData.LayerREAL.TextVarInfo.Value, ss.str().c_str());
							}
						
							VarStep = 10;
						
							break;
						
						case 10: // Show Value
							
							STHandler_0->ReadVariable(VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name, Real, 
								(int)HmiEditorCtrl.Components.PageData.LayerREAL.NumericIndex.Value);
						
							HmiEditorCtrl.Components.PageData.LayerREAL.NumericValue.Value = Real;
			
							HmiEditorCtrl.Components.PageData.LayerREAL.NumericIndex.Min = 0;
							HmiEditorCtrl.Components.PageData.LayerREAL.NumericIndex.Max = (REAL)VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size - 1;
							
							OldIndex = (int)HmiEditorCtrl.Components.PageData.LayerREAL.NumericIndex.Value;
							VarStep = 20;
						
							break;
						
						case 20: // Idle State
							
							if (OldIndex != HmiEditorCtrl.Components.PageData.LayerREAL.NumericIndex.Value) // 
								VarStep = 10;
							
							if (HmiEditorCtrl.Components.PageData.LayerREAL.ButtonIndexUp.Value > HmiEditorCtrl.Components.PageData.LayerREAL.ButtonIndexUp.OldValue)
							{
								if (HmiEditorCtrl.Components.PageData.LayerREAL.NumericIndex.Value < VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size - 1)
								{
									HmiEditorCtrl.Components.PageData.LayerREAL.NumericIndex.Value++;
									VarStep = 10;
								}	
							}
							if (HmiEditorCtrl.Components.PageData.LayerREAL.ButtonIndexDown.Value > HmiEditorCtrl.Components.PageData.LayerREAL.ButtonIndexDown.OldValue)
							{
								if (HmiEditorCtrl.Components.PageData.LayerREAL.NumericIndex.Value > 0)
								{
									HmiEditorCtrl.Components.PageData.LayerREAL.NumericIndex.Value--;
									VarStep = 10;
								}
							}
						
							if (HmiEditorCtrl.Components.PageData.LayerREAL.ButtonClose.Value > HmiEditorCtrl.Components.PageData.LayerREAL.ButtonClose.OldValue)
							{
								HmiEditorCtrl.Components.PageData.LayerREAL.Layer.StatusDatapoint = 1;
								DataStep = 10;
							}
						
							if (HmiEditorCtrl.Components.PageData.LayerREAL.ButtonSave.Value > HmiEditorCtrl.Components.PageData.LayerREAL.ButtonSave.OldValue)
							{
								Real = HmiEditorCtrl.Components.PageData.LayerREAL.NumericValue.Value;
								
								STHandler_0->ModifyVariable(VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name, Real, 
									(int)HmiEditorCtrl.Components.PageData.LayerREAL.NumericIndex.Value);
							
							}
						
							if (HmiEditorCtrl.Components.PageData.LayerREAL.ButtonClear.Value > HmiEditorCtrl.Components.PageData.LayerREAL.ButtonClear.OldValue)
							{
								HmiEditorCtrl.Components.PageData.LayerREAL.NumericValue.Value = 0;
							}
						
							if (HmiEditorCtrl.Components.PageData.LayerREAL.ButtonReload.Value > HmiEditorCtrl.Components.PageData.LayerREAL.ButtonReload.OldValue)
							{
								VarStep = 10;
							}
						
							break;
							
					}
					break;
				
				case 38: // BOOL Popup Window
					switch (VarStep)
					{
						case 0:
							
							HmiEditorCtrl.Components.PageData.LayerBOOL.Layer.StatusDatapoint = 0;
							HmiEditorCtrl.Components.PageData.LayerBOOL.NumericIndex.Value = 0;
							VarName = VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name;
							
							if (VarName != "")
							{
								stringstream ss;
								ss << VarName;
								if (VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size > 1)
									ss << " [" << VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size << "]";
								strcpy(HmiEditorCtrl.Components.PageData.LayerBOOL.TextVarInfo.Value, ss.str().c_str());
							}
						
							VarStep = 10;
						
							break;
						
						case 10: // Show Value
							
							STHandler_0->ReadVariable(VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name, Bool, 
								(int)HmiEditorCtrl.Components.PageData.LayerBOOL.NumericIndex.Value);
						
							HmiEditorCtrl.Components.PageData.LayerBOOL.NumericValue.Value = Bool;
			
							HmiEditorCtrl.Components.PageData.LayerBOOL.NumericIndex.Min = 0;
							HmiEditorCtrl.Components.PageData.LayerBOOL.NumericIndex.Max = (REAL)VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size - 1;
							
							OldIndex = (int)HmiEditorCtrl.Components.PageData.LayerBOOL.NumericIndex.Value;
							VarStep = 20;
						
							break;
						
						case 20: // Idle State
							
							if (OldIndex != HmiEditorCtrl.Components.PageData.LayerBOOL.NumericIndex.Value) // 
								VarStep = 10;
							
							if (HmiEditorCtrl.Components.PageData.LayerBOOL.ButtonIndexUp.Value > HmiEditorCtrl.Components.PageData.LayerBOOL.ButtonIndexUp.OldValue)
							{
								if (HmiEditorCtrl.Components.PageData.LayerBOOL.NumericIndex.Value < VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Size - 1)
								{
									HmiEditorCtrl.Components.PageData.LayerBOOL.NumericIndex.Value++;
									VarStep = 10;
								}	
							}
							if (HmiEditorCtrl.Components.PageData.LayerBOOL.ButtonIndexDown.Value > HmiEditorCtrl.Components.PageData.LayerBOOL.ButtonIndexDown.OldValue)
							{
								if (HmiEditorCtrl.Components.PageData.LayerBOOL.NumericIndex.Value > 0)
								{
									HmiEditorCtrl.Components.PageData.LayerBOOL.NumericIndex.Value--;
									VarStep = 10;
								}
							}
						
							if (HmiEditorCtrl.Components.PageData.LayerBOOL.ButtonClose.Value > HmiEditorCtrl.Components.PageData.LayerBOOL.ButtonClose.OldValue)
							{
								HmiEditorCtrl.Components.PageData.LayerBOOL.Layer.StatusDatapoint = 1;
								DataStep = 10;
							}
						
							if (HmiEditorCtrl.Components.PageData.LayerBOOL.ButtonSave.Value > HmiEditorCtrl.Components.PageData.LayerBOOL.ButtonSave.OldValue)
							{
								Bool = (BOOL)HmiEditorCtrl.Components.PageData.LayerBOOL.NumericValue.Value;
								
								STHandler_0->ModifyVariable(VarInfoArray[HmiEditorCtrl.Components.PageData.LayerDefault.ListboxVariables.SelectedIndex].Name, Bool, 
									(int)HmiEditorCtrl.Components.PageData.LayerBOOL.NumericIndex.Value);
							
							}
						
							if (HmiEditorCtrl.Components.PageData.LayerBOOL.ButtonClear.Value > HmiEditorCtrl.Components.PageData.LayerBOOL.ButtonClear.OldValue)
							{
								HmiEditorCtrl.Components.PageData.LayerBOOL.NumericValue.Value = 0;
							}
							
							if (HmiEditorCtrl.Components.PageData.LayerBOOL.ButtonReload.Value > HmiEditorCtrl.Components.PageData.LayerBOOL.ButtonReload.OldValue)
							{
								VarStep = 10;
							}
						
							break;
							
					}
					break;
				
			}
		}
	}
	
	
	// PosEdge Detection
	// Page Editor
	for (int i = 0; i < 50; ++i )
		HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotKeys[i].OldValue = HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotKeys[i].Value;
	
	for (int i = 0; i < 5; ++i)
		HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotPrompts[i].OldValue = HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotPrompts[i].Value;
	
	HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotPromptLeft.OldValue = HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotPromptLeft.Value; 
	HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotPromptRight.OldValue = HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotPromptRight.Value; 
	HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotVarSelect.OldValue = HmiEditorCtrl.Components.PageEdit.LayerDefault.HotSpotVarSelect.Value;
	
	// Page Editor Data
	HmiEditorCtrl.Components.PageData.LayerDefault.ButtonScrollup.OldValue = HmiEditorCtrl.Components.PageData.LayerDefault.ButtonScrollup.Value;
	HmiEditorCtrl.Components.PageData.LayerDefault.ButtonScrolldown.OldValue = HmiEditorCtrl.Components.PageData.LayerDefault.ButtonScrolldown.Value;
	HmiEditorCtrl.Components.PageData.LayerDefault.ButtonNew.OldValue = HmiEditorCtrl.Components.PageData.LayerDefault.ButtonNew.Value;
	HmiEditorCtrl.Components.PageData.LayerDefault.ButtonDelete.OldValue = HmiEditorCtrl.Components.PageData.LayerDefault.ButtonDelete.Value;
	HmiEditorCtrl.Components.PageData.LayerDefault.ButtonModify.OldValue = HmiEditorCtrl.Components.PageData.LayerDefault.ButtonModify.Value;
	HmiEditorCtrl.Components.PageData.LayerDefault.ButtonSaveAll.OldValue = HmiEditorCtrl.Components.PageData.LayerDefault.ButtonSaveAll.Value;
	HmiEditorCtrl.Components.PageData.LayerDefault.ButtonReload.OldValue = HmiEditorCtrl.Components.PageData.LayerDefault.ButtonReload.Value;
	HmiEditorCtrl.Components.PageData.LayerDefault.ButtonInsert.OldValue = HmiEditorCtrl.Components.PageData.LayerDefault.ButtonInsert.Value;
	
	HmiEditorCtrl.Components.PageData.LayerNewPopup.ButtonConfirm.OldValue = HmiEditorCtrl.Components.PageData.LayerNewPopup.ButtonConfirm.Value;
	HmiEditorCtrl.Components.PageData.LayerNewPopup.ButtonCancel.OldValue = HmiEditorCtrl.Components.PageData.LayerNewPopup.ButtonCancel.Value;
	
	HmiEditorCtrl.Components.PageData.LayerPoint.ButtonClose.OldValue = HmiEditorCtrl.Components.PageData.LayerPoint.ButtonClose.Value;
	HmiEditorCtrl.Components.PageData.LayerPoint.ButtonIndexUp.OldValue = HmiEditorCtrl.Components.PageData.LayerPoint.ButtonIndexUp.Value;
	HmiEditorCtrl.Components.PageData.LayerPoint.ButtonIndexDown.OldValue = HmiEditorCtrl.Components.PageData.LayerPoint.ButtonIndexDown.Value;
	HmiEditorCtrl.Components.PageData.LayerPoint.ButtonSave.OldValue = HmiEditorCtrl.Components.PageData.LayerPoint.ButtonSave.Value;
	HmiEditorCtrl.Components.PageData.LayerPoint.ButtonReload.OldValue = HmiEditorCtrl.Components.PageData.LayerPoint.ButtonReload.Value;
	HmiEditorCtrl.Components.PageData.LayerPoint.ButtonClear.OldValue = HmiEditorCtrl.Components.PageData.LayerPoint.ButtonClear.Value;
	HmiEditorCtrl.Components.PageData.LayerPoint.ButtonTeach.OldValue = HmiEditorCtrl.Components.PageData.LayerPoint.ButtonTeach.Value;
	HmiEditorCtrl.Components.PageData.LayerPoint.ButtonSetJog.OldValue = HmiEditorCtrl.Components.PageData.LayerPoint.ButtonSetJog.Value;
	
	HmiEditorCtrl.Components.PageData.LayerFrame.ButtonClose.OldValue = HmiEditorCtrl.Components.PageData.LayerFrame.ButtonClose.Value;
	HmiEditorCtrl.Components.PageData.LayerFrame.ButtonIndexUp.OldValue = HmiEditorCtrl.Components.PageData.LayerFrame.ButtonIndexUp.Value;
	HmiEditorCtrl.Components.PageData.LayerFrame.ButtonIndexDown.OldValue = HmiEditorCtrl.Components.PageData.LayerFrame.ButtonIndexDown.Value;
	HmiEditorCtrl.Components.PageData.LayerFrame.ButtonSave.OldValue = HmiEditorCtrl.Components.PageData.LayerFrame.ButtonSave.Value;
	HmiEditorCtrl.Components.PageData.LayerFrame.ButtonReload.OldValue = HmiEditorCtrl.Components.PageData.LayerFrame.ButtonReload.Value;
	HmiEditorCtrl.Components.PageData.LayerFrame.ButtonClear.OldValue = HmiEditorCtrl.Components.PageData.LayerFrame.ButtonClear.Value;
	HmiEditorCtrl.Components.PageData.LayerFrame.ButtonSetJog.OldValue = HmiEditorCtrl.Components.PageData.LayerFrame.ButtonSetJog.Value;
	
	HmiEditorCtrl.Components.PageData.LayerTool.ButtonClose.OldValue = HmiEditorCtrl.Components.PageData.LayerTool.ButtonClose.Value;
	HmiEditorCtrl.Components.PageData.LayerTool.ButtonIndexUp.OldValue = HmiEditorCtrl.Components.PageData.LayerTool.ButtonIndexUp.Value;
	HmiEditorCtrl.Components.PageData.LayerTool.ButtonIndexDown.OldValue = HmiEditorCtrl.Components.PageData.LayerTool.ButtonIndexDown.Value;
	HmiEditorCtrl.Components.PageData.LayerTool.ButtonSave.OldValue = HmiEditorCtrl.Components.PageData.LayerTool.ButtonSave.Value;
	HmiEditorCtrl.Components.PageData.LayerTool.ButtonReload.OldValue = HmiEditorCtrl.Components.PageData.LayerTool.ButtonReload.Value;
	HmiEditorCtrl.Components.PageData.LayerTool.ButtonClear.OldValue = HmiEditorCtrl.Components.PageData.LayerTool.ButtonClear.Value;
	HmiEditorCtrl.Components.PageData.LayerTool.ButtonSetJog.OldValue = HmiEditorCtrl.Components.PageData.LayerTool.ButtonSetJog.Value;
	
	HmiEditorCtrl.Components.PageData.LayerAxis.ButtonClose.OldValue = HmiEditorCtrl.Components.PageData.LayerAxis.ButtonClose.Value;
	HmiEditorCtrl.Components.PageData.LayerAxis.ButtonIndexUp.OldValue = HmiEditorCtrl.Components.PageData.LayerAxis.ButtonIndexUp.Value;
	HmiEditorCtrl.Components.PageData.LayerAxis.ButtonIndexDown.OldValue = HmiEditorCtrl.Components.PageData.LayerAxis.ButtonIndexDown.Value;
	HmiEditorCtrl.Components.PageData.LayerAxis.ButtonSave.OldValue = HmiEditorCtrl.Components.PageData.LayerAxis.ButtonSave.Value;
	HmiEditorCtrl.Components.PageData.LayerAxis.ButtonReload.OldValue = HmiEditorCtrl.Components.PageData.LayerAxis.ButtonReload.Value;
	HmiEditorCtrl.Components.PageData.LayerAxis.ButtonClear.OldValue = HmiEditorCtrl.Components.PageData.LayerAxis.ButtonClear.Value;
	HmiEditorCtrl.Components.PageData.LayerAxis.ButtonTeach.OldValue = HmiEditorCtrl.Components.PageData.LayerAxis.ButtonTeach.Value;
	HmiEditorCtrl.Components.PageData.LayerAxis.ButtonSetJog.OldValue = HmiEditorCtrl.Components.PageData.LayerAxis.ButtonSetJog.Value;
	
	HmiEditorCtrl.Components.PageData.LayerVel.ButtonClose.OldValue = HmiEditorCtrl.Components.PageData.LayerVel.ButtonClose.Value;
	HmiEditorCtrl.Components.PageData.LayerVel.ButtonIndexUp.OldValue = HmiEditorCtrl.Components.PageData.LayerVel.ButtonIndexUp.Value;
	HmiEditorCtrl.Components.PageData.LayerVel.ButtonIndexDown.OldValue = HmiEditorCtrl.Components.PageData.LayerVel.ButtonIndexDown.Value;
	HmiEditorCtrl.Components.PageData.LayerVel.ButtonSave.OldValue = HmiEditorCtrl.Components.PageData.LayerVel.ButtonSave.Value;
	HmiEditorCtrl.Components.PageData.LayerVel.ButtonReload.OldValue = HmiEditorCtrl.Components.PageData.LayerVel.ButtonReload.Value;
	HmiEditorCtrl.Components.PageData.LayerVel.ButtonClear.OldValue = HmiEditorCtrl.Components.PageData.LayerVel.ButtonClear.Value;
	
	HmiEditorCtrl.Components.PageData.LayerPath.ButtonClose.OldValue = HmiEditorCtrl.Components.PageData.LayerPath.ButtonClose.Value;
	HmiEditorCtrl.Components.PageData.LayerPath.ButtonIndexUp.OldValue = HmiEditorCtrl.Components.PageData.LayerPath.ButtonIndexUp.Value;
	HmiEditorCtrl.Components.PageData.LayerPath.ButtonIndexDown.OldValue = HmiEditorCtrl.Components.PageData.LayerPath.ButtonIndexDown.Value;
	HmiEditorCtrl.Components.PageData.LayerPath.ButtonSave.OldValue = HmiEditorCtrl.Components.PageData.LayerPath.ButtonSave.Value;
	HmiEditorCtrl.Components.PageData.LayerPath.ButtonReload.OldValue = HmiEditorCtrl.Components.PageData.LayerPath.ButtonReload.Value;
	HmiEditorCtrl.Components.PageData.LayerPath.ButtonClear.OldValue = HmiEditorCtrl.Components.PageData.LayerPath.ButtonClear.Value;
	
	HmiEditorCtrl.Components.PageData.LayerINT.ButtonClose.OldValue = HmiEditorCtrl.Components.PageData.LayerINT.ButtonClose.Value;
	HmiEditorCtrl.Components.PageData.LayerINT.ButtonIndexUp.OldValue = HmiEditorCtrl.Components.PageData.LayerINT.ButtonIndexUp.Value;
	HmiEditorCtrl.Components.PageData.LayerINT.ButtonIndexDown.OldValue = HmiEditorCtrl.Components.PageData.LayerINT.ButtonIndexDown.Value;
	HmiEditorCtrl.Components.PageData.LayerINT.ButtonSave.OldValue = HmiEditorCtrl.Components.PageData.LayerINT.ButtonSave.Value;
	HmiEditorCtrl.Components.PageData.LayerINT.ButtonReload.OldValue = HmiEditorCtrl.Components.PageData.LayerINT.ButtonReload.Value;
	HmiEditorCtrl.Components.PageData.LayerINT.ButtonClear.OldValue = HmiEditorCtrl.Components.PageData.LayerINT.ButtonClear.Value;
	
	HmiEditorCtrl.Components.PageData.LayerREAL.ButtonClose.OldValue = HmiEditorCtrl.Components.PageData.LayerREAL.ButtonClose.Value;
	HmiEditorCtrl.Components.PageData.LayerREAL.ButtonIndexUp.OldValue = HmiEditorCtrl.Components.PageData.LayerREAL.ButtonIndexUp.Value;
	HmiEditorCtrl.Components.PageData.LayerREAL.ButtonIndexDown.OldValue = HmiEditorCtrl.Components.PageData.LayerREAL.ButtonIndexDown.Value;
	HmiEditorCtrl.Components.PageData.LayerREAL.ButtonSave.OldValue = HmiEditorCtrl.Components.PageData.LayerREAL.ButtonSave.Value;
	HmiEditorCtrl.Components.PageData.LayerREAL.ButtonReload.OldValue = HmiEditorCtrl.Components.PageData.LayerREAL.ButtonReload.Value;
	HmiEditorCtrl.Components.PageData.LayerREAL.ButtonClear.OldValue = HmiEditorCtrl.Components.PageData.LayerREAL.ButtonClear.Value;
	
	HmiEditorCtrl.Components.PageData.LayerBOOL.ButtonClose.OldValue = HmiEditorCtrl.Components.PageData.LayerBOOL.ButtonClose.Value;
	HmiEditorCtrl.Components.PageData.LayerBOOL.ButtonIndexUp.OldValue = HmiEditorCtrl.Components.PageData.LayerBOOL.ButtonIndexUp.Value;
	HmiEditorCtrl.Components.PageData.LayerBOOL.ButtonIndexDown.OldValue = HmiEditorCtrl.Components.PageData.LayerBOOL.ButtonIndexDown.Value;
	HmiEditorCtrl.Components.PageData.LayerBOOL.ButtonSave.OldValue = HmiEditorCtrl.Components.PageData.LayerBOOL.ButtonSave.Value;
	HmiEditorCtrl.Components.PageData.LayerBOOL.ButtonReload.OldValue = HmiEditorCtrl.Components.PageData.LayerBOOL.ButtonReload.Value;
	HmiEditorCtrl.Components.PageData.LayerBOOL.ButtonClear.OldValue = HmiEditorCtrl.Components.PageData.LayerBOOL.ButtonClear.Value;

	OldPage = HmiGlobal.PageControl.ActPage;
	
}
