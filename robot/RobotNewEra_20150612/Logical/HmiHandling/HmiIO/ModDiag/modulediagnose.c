/************************************************************************************************************************/
/* Object name: modulediagnose.c																						*/
/* Author:      Andreas Hager, B&R																						*/
/* Site:        Eggelsberg                                                                                            	*/
/* Created:     20-Dec-2005                                                                                           	*/
/* Restriction: 													      		                                      	*/
/* Description: Function-block for module-diagnose with alarmbits                                                      	*/
/*----------------------------------------------------------------------------------------------------------------------*/
/* Version 1.00			20-Dec-2005		 Andreas Hager			Official release								  		*/
/*----------------------------------------------------------------------------------------------------------------------*/
/* Version 1.01			03-Feb-2006		 Andreas Hager			Changed module name for "module is only configured" 	*/
/*																from empty to "ModuleName"								*/
/*----------------------------------------------------------------------------------------------------------------------*/
/* Version 1.02			21-Apr-2006		 Andreas Hager			Problem with waiting-timer fixed and Buffer-overflow	*/
/*----------------------------------------------------------------------------------------------------------------------*/
/* Version 2.00			16-Jul-2008		 Andreas Hager			AS3 - Changes for GCC 4.1.1								*/
/*----------------------------------------------------------------------------------------------------------------------*/
/* Development tool: B&R Automation Studio V3.0.71.10																  	*/
/*----------------------------------------------------------------------------------------------------------------------*/
/* Comment:                                                                                                           	*/
/************************************************************************************************************************/

#include <ModDiag.h>
#include <bur/plctypes.h>
#include <AsIODiag.h>
#include <string.h>
#include <Standard.h>

#define	CREATE_HW_INFO				0
#define	CHECK_MODULESTATE			1
#define	CHECK_CONNECTED				2
#define	GET_CONFIGUREDMODULE		3
#define	GET_MODULEPATH				4
#define	CHECK_OLD_MODULE_PATH		5
#define	RESET_MODULE_ALARMS1		6
#define	CHECK_OLD_MODULE_ALARMS		7
#define	RESET_MODULE_ALARMS2		8
#define	CHECK_NEW_ALARMMESSAGES		9
#define	SET_ALARMMESSAGES			10
#define	CHECK_NEXT_MODULE			11
#define	CHECK_MODULENUMBER			12
#define	CHECK_NOT_NEEDED_ALARMS		13
#define	RESET_NOT_NEEDED_ALARMS		14
#define	CHECK_RESET_NEXT_MODULE		15
#define	DISPOSE_INFO				16
#define	WAIT						17

#define	MODULE_ONLY_CONFIGURED	1
#define	MODULE_ONLY_INSERTED	2
#define	MODULE_OK				3
#define	VAR_MODULE_PLUGGED		4

#define	OFFSET_MODULE_ONLY_CONFIGURED	0
#define	OFFSET_MODULE_ONLY_INSERTED		100
#define	OFFSET_VARIOUS_MODULE_PLUGGED	200

#define	WRONG_OPTION_SELECTED	50000
#define	FUNCTION_BUSY			65535

static	DiagCreateInfo_typ	CreateHWInfo;
static	DiagGetStrInfo_typ	GetModuleName, GetModulePath;
static	DiagGetNumInfo_typ	GetModuleState;
static	DiagDisposeInfo_typ	DisposeInfo;
/*static	TON_typ				WaitTimer;*/

void ModuleDiagnose(ModuleDiagnose_typ* pModuleInfo)
{	ModuleInformationBuffer_typ	*ModuleInfoBuffer;
	ModuleAlarmInformation_typ	*ModuleAlarmInfo;
	
	USINT	*pUSINT1 = 0, *pUSINT2 = 0;	
	STRING	ModuleName[40], ModulePath[40];
	DINT	PathResult = 0;
	BOOL	AlarmMessage = 0;
	
	memset(&ModuleName, 0, sizeof(ModuleName));
	memset(&ModulePath, 0, sizeof(ModulePath));
	
	*(UDINT*)&ModuleInfoBuffer = pModuleInfo->AdrModuleInformationBuffer;
	*(UDINT*)&ModuleAlarmInfo = pModuleInfo->AdrAlarmInformation;
	
	if(pModuleInfo->Option > 3)
	{	pModuleInfo->status = WRONG_OPTION_SELECTED;
		return;
	}
	
	switch(pModuleInfo->Step)
	{
		/* create the information about configured and plugged hardware */
		case CREATE_HW_INFO:
			pModuleInfo->status = FUNCTION_BUSY;
			
			CreateHWInfo.enable = 1;
			CreateHWInfo.infoKind = asdiagALL;
			
			DiagCreateInfo(&CreateHWInfo);
			
			if(CreateHWInfo.status == 0)
			{	pModuleInfo->NumberNotCheckedModules = 0;
				pModuleInfo->NumberOfTotalModules = CreateHWInfo.nrEntries;
				
				/* check option if panel and if information is requested */
				/* Option 0 ==> All hardware 				*/
				/* Option 1 ==> Without panel and IF		*/
				/* Option 2 ==> Without AC					*/
				/* Option 3 ==> Without panel, IF and AC	*/
				if(pModuleInfo->Option == 0 || pModuleInfo->Option == 2)
				{	pModuleInfo->ModuleIndex = 0;
				}
				else if(pModuleInfo->Option == 1 || pModuleInfo->Option == 3)
				{	pModuleInfo->NumberNotCheckedModules++;
					pModuleInfo->ModuleIndex = 1;
				}
				
				pModuleInfo->Step = CHECK_MODULESTATE;
			}
			else if(CreateHWInfo.status != 65535)
			{	pModuleInfo->status = CreateHWInfo.status;
				return;
			}
		break;
		
		/* check state of module */
		case CHECK_MODULESTATE:
			GetModuleState.enable = 1;
			GetModuleState.ident = CreateHWInfo.ident;
			GetModuleState.index = pModuleInfo->ModuleIndex;
			GetModuleState.infoCode = asdiagMODUL_STATE;
			
			DiagGetNumInfo(&GetModuleState);
			
			if(GetModuleState.status == 0)
			{	pModuleInfo->ActualModuleInformation.ModuleState = GetModuleState.value;
				pModuleInfo->Step = CHECK_CONNECTED;
			}
			else if(GetModuleState.status != 65535)
			{	pModuleInfo->status = GetModuleState.status;
				return;
			}
		break;

		/* get module-name and handle module-data */
		case CHECK_CONNECTED:
			if(GetModuleState.value == MODULE_ONLY_CONFIGURED || GetModuleState.value == MODULE_OK)
			{	GetModuleName.infoCode = asdiagCONFIG_MODULE;
			}
			else if(GetModuleState.value == MODULE_ONLY_INSERTED || GetModuleState.value == VAR_MODULE_PLUGGED)
			{	GetModuleName.infoCode = asdiagPLUGGED_MODULE;
			}
			
			GetModuleName.enable = 1;
			GetModuleName.ident = CreateHWInfo.ident;
			GetModuleName.index = pModuleInfo->ModuleIndex;
			GetModuleName.pBuffer = (UDINT)ModuleName;
			GetModuleName.bufferLen = sizeof(ModuleName);
			
			DiagGetStrInfo(&GetModuleName);
			
			if(GetModuleName.status == 0)
			{	*(UDINT*)&pUSINT1 = (UDINT)(ModuleName + 1);
				*(UDINT*)&pUSINT2 = (UDINT)(ModuleName + 2);
							
				if((*pUSINT1 == 'I' && *pUSINT2 == 'F') && pModuleInfo->Option == 1)
				{	pModuleInfo->NumberNotCheckedModules++;
					pModuleInfo->Step = CHECK_NEXT_MODULE;
				}
				
				else if((*pUSINT1 == 'A' && *pUSINT2 == 'C') && pModuleInfo->Option == 2)
				{	pModuleInfo->NumberNotCheckedModules++;
					pModuleInfo->Step = CHECK_NEXT_MODULE;
				}
				else if(((*pUSINT1 == 'I' && *pUSINT2 == 'F') || (*pUSINT1 == 'A' && *pUSINT2 == 'C')) && pModuleInfo->Option == 3)
				{	pModuleInfo->NumberNotCheckedModules++;
					pModuleInfo->Step = CHECK_NEXT_MODULE;
				}
				else
				{	/* module is only configured --> module is missing */
					if(pModuleInfo->ActualModuleInformation.ModuleState == MODULE_ONLY_CONFIGURED)
					{	/* copy moduledata */
						pModuleInfo->ActualModuleInformation.ModuleState = MODULE_ONLY_CONFIGURED;
						pModuleInfo->ActualModuleInformation.ModuleColor = 51;
						strcpy(pModuleInfo->ActualModuleInformation.ModuleName, ModuleName);
						strcpy(pModuleInfo->ActualModuleInformation.ErrorModuleName, ModuleName);
						
						/* get module-path */
						pModuleInfo->Step = GET_MODULEPATH;
					}
					/* module is only inserted --> module is not configured */
					else if(pModuleInfo->ActualModuleInformation.ModuleState == MODULE_ONLY_INSERTED)
					{	/* copy moduledata */
						pModuleInfo->ActualModuleInformation.ModuleState = MODULE_ONLY_INSERTED;
						pModuleInfo->ActualModuleInformation.ModuleColor = 46;
						strcpy(pModuleInfo->ActualModuleInformation.ModuleName, ModuleName);
						
						/* get module-path */
						pModuleInfo->Step = GET_MODULEPATH;
					}
					/* modulestate is OK */
					else if(pModuleInfo->ActualModuleInformation.ModuleState == MODULE_OK)
					{	/* copy moduledata */
						pModuleInfo->ActualModuleInformation.ModuleState = MODULE_OK;
						pModuleInfo->ActualModuleInformation.ModuleColor = 226;
						strcpy(pModuleInfo->ActualModuleInformation.ModuleName, ModuleName);
						
						/* get module-path */
						pModuleInfo->Step = GET_MODULEPATH;
					}
					/* various module is plugged */
					else if(pModuleInfo->ActualModuleInformation.ModuleState == VAR_MODULE_PLUGGED)
					{	/* copy moduledata */
						pModuleInfo->ActualModuleInformation.ModuleState = VAR_MODULE_PLUGGED;
						pModuleInfo->ActualModuleInformation.ModuleColor = 51;
						strcpy(pModuleInfo->ActualModuleInformation.ModuleName, ModuleName);
					
						/* get information about configured module */
						pModuleInfo->Step = GET_CONFIGUREDMODULE;
					}
				}
			}
			else if(GetModuleName.status != 65535)
			{	pModuleInfo->status = GetModuleName.status;
				return;
			}
		break;
		
		/* if various module is plugged, get information about configured module */
		case GET_CONFIGUREDMODULE:
			GetModuleName.enable = 1;
			GetModuleName.ident = CreateHWInfo.ident;
			GetModuleName.index = pModuleInfo->ModuleIndex;
			GetModuleName.infoCode = asdiagCONFIG_MODULE;
			GetModuleName.pBuffer = (UDINT)ModuleName;
			GetModuleName.bufferLen = sizeof(ModuleName);
			
			DiagGetStrInfo(&GetModuleName);
			
			if(GetModuleName.status == 0)
			{	/* copy moduledata */ 
				strcpy(pModuleInfo->ActualModuleInformation.ErrorModuleName, ModuleName);
				
				/* get module-path */
				pModuleInfo->Step = GET_MODULEPATH;
			}
			else if(GetModuleName.status != 65535)
			{	pModuleInfo->status = GetModuleName.status;
				return;
			}
		break;
		
		/* get module-path */
		case GET_MODULEPATH:
			GetModulePath.enable = 1;
			GetModulePath.ident = CreateHWInfo.ident;
			GetModulePath.index = pModuleInfo->ModuleIndex;
			GetModulePath.infoCode = asdiagPATH;
			GetModulePath.pBuffer = (UDINT)ModulePath;
			GetModulePath.bufferLen = sizeof(ModulePath);
			
			DiagGetStrInfo(&GetModulePath);
			
			if(GetModulePath.status == 0)
			{	strcpy(pModuleInfo->ActualModuleInformation.ModulePath, ModulePath);
				pModuleInfo->Step = CHECK_OLD_MODULE_PATH;
			}
			else if(GetModulePath.status != 65535)
			{	pModuleInfo->status = GetModulePath.status;
				return;
			}
		break;
		
		/* check old module path */
		case CHECK_OLD_MODULE_PATH:
			/* compare actual and old path of module */
			PathResult = strcmp(pModuleInfo->ActualModuleInformation.ModulePath, pModuleInfo->PathBuffer[pModuleInfo->ModuleNumber]);
			
			if(PathResult != 0)
			{	if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_CONFIGURED] == 1)
				{	/* copy information for textsnippets */
					strcpy(ModuleAlarmInfo->ErrorModulePath, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber].ModulePath);
					strcpy(ModuleAlarmInfo->ErrorModuleName, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber].ErrorModuleName);
					AlarmMessage = 1;
				}
				else if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_INSERTED] == 1)
				{	/* copy information for textsnippets */
					strcpy(ModuleAlarmInfo->ErrorModulePath, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber].ModulePath);
					strcpy(ModuleAlarmInfo->ErrorModuleName, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber].ModuleName);
					AlarmMessage = 1;
				}
				else if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_VARIOUS_MODULE_PLUGGED] == 1)
				{	/* copy information for textsnippets */
					strcpy(ModuleAlarmInfo->ErrorModulePath, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber].ModulePath);
					strcpy(ModuleAlarmInfo->ErrorModuleName, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber].ErrorModuleName);
					AlarmMessage = 1;
				}
			}
				
			strcpy(pModuleInfo->PathBuffer[pModuleInfo->ModuleNumber], pModuleInfo->ActualModuleInformation.ModulePath);	
																					
			/* reset other alarmmessages */
			if(AlarmMessage == 0)
			{	pModuleInfo->Step = CHECK_OLD_MODULE_ALARMS;
			}
			else
			{	AlarmMessage = 0;
				pModuleInfo->LastStep = CHECK_OLD_MODULE_PATH;
				pModuleInfo->Step = WAIT;
			}
		break;
		
		/* reset module alarms */
		case RESET_MODULE_ALARMS1:
			if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_CONFIGURED] == 1)
			{	/* reset alarm */
				ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_CONFIGURED] = 0;
			}
			else if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_INSERTED] == 1)
			{	/* reset alarm */
				ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_INSERTED] = 0;
			}
			else if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_VARIOUS_MODULE_PLUGGED] == 1)
			{	/* reset alarm */
				ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_VARIOUS_MODULE_PLUGGED] = 0;
			}
			pModuleInfo->LastStep = RESET_MODULE_ALARMS1;
			pModuleInfo->Step = WAIT;
		break;
		
		/* check old module alarms */
		case CHECK_OLD_MODULE_ALARMS:
								
			if(pModuleInfo->ActualModuleInformation.ModuleState == MODULE_ONLY_CONFIGURED)
			{	/* reset other alarmbits */
				if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_INSERTED] == 1)
				{	/* copy information for textsnippets */
					strcpy(ModuleAlarmInfo->ErrorModulePath, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber].ModulePath);
					strcpy(ModuleAlarmInfo->ErrorModuleName, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber].ModuleName);
					AlarmMessage = 1;
				}
				else if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_VARIOUS_MODULE_PLUGGED] == 1)
				{	/* copy information for textsnippets */
					strcpy(ModuleAlarmInfo->ErrorModulePath, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber].ModulePath);
					strcpy(ModuleAlarmInfo->ErrorModuleName, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber].ErrorModuleName);
					AlarmMessage = 1;
				}
			}
			/* module is only inserted --> module only inserted */
			else if(pModuleInfo->ActualModuleInformation.ModuleState == MODULE_ONLY_INSERTED)
			{	/* reset other alarmbits */
				if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_CONFIGURED] == 1)
				{	/* copy information for textsnippets */
					strcpy(ModuleAlarmInfo->ErrorModulePath, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber].ModulePath);
					strcpy(ModuleAlarmInfo->ErrorModuleName, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber].ErrorModuleName);
					AlarmMessage = 1;
				}
				else if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_VARIOUS_MODULE_PLUGGED] == 1)
				{	/* copy information for textsnippets */
					strcpy(ModuleAlarmInfo->ErrorModulePath, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber].ModulePath);
					strcpy(ModuleAlarmInfo->ErrorModuleName, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber].ErrorModuleName);
					AlarmMessage = 1;
				}
			}
			/* modulestate is OK */
			else if(pModuleInfo->ActualModuleInformation.ModuleState == MODULE_OK)
			{	/* if module-only-configured alarmbit is set --> reset */
				if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_CONFIGURED] == 1)
				{	/* copy information for textsnippets */
					strcpy(ModuleAlarmInfo->ErrorModulePath, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber].ModulePath);
					strcpy(ModuleAlarmInfo->ErrorModuleName, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber].ErrorModuleName);
					AlarmMessage = 1;
				}
				/* if module-only-inserted alarmbit is set --> reset */
				else if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_INSERTED] == 1)
				{	/* copy information for textsnippets */
					strcpy(ModuleAlarmInfo->ErrorModulePath, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber].ModulePath);
					strcpy(ModuleAlarmInfo->ErrorModuleName, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber].ModuleName);
					AlarmMessage = 1;
				}
				/* if various-module-plugged alarmbit is set --> reset */
				else if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_VARIOUS_MODULE_PLUGGED] == 1)
				{	/* copy information for textsnippets */
					strcpy(ModuleAlarmInfo->ErrorModulePath, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber].ModulePath);
					strcpy(ModuleAlarmInfo->ErrorModuleName, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber].ErrorModuleName);
					AlarmMessage = 1;
				}
			}
			/* various module is plugged */
			else if(pModuleInfo->ActualModuleInformation.ModuleState == VAR_MODULE_PLUGGED)
			{	/* reset other alarmbits */
				if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_CONFIGURED] == 1)
				{	/* copy information for textsnippets */
					strcpy(ModuleAlarmInfo->ErrorModulePath, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber].ModulePath);
					strcpy(ModuleAlarmInfo->ErrorModuleName, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber].ErrorModuleName);
					AlarmMessage = 1;
				}
				else if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_INSERTED] == 1)
				{	/* copy information for textsnippets */
					strcpy(ModuleAlarmInfo->ErrorModulePath, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber].ModulePath);
					strcpy(ModuleAlarmInfo->ErrorModuleName, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber].ModuleName);
					AlarmMessage = 1;
				}
			}
			
			if(AlarmMessage == 0)
			{	pModuleInfo->Step = CHECK_NEW_ALARMMESSAGES;
			}
			else
			{	AlarmMessage = 0;
				pModuleInfo->LastStep = CHECK_OLD_MODULE_ALARMS;
				pModuleInfo->Step = WAIT;
			}
		break;
		
		/* reset module alarms */
		case RESET_MODULE_ALARMS2:
			if(pModuleInfo->ActualModuleInformation.ModuleState == MODULE_ONLY_CONFIGURED)
			{	/* reset other alarmbits */
				if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_INSERTED] == 1)
				{	/* reset alarm */
					ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_INSERTED] = 0;
				}
				else if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_VARIOUS_MODULE_PLUGGED] == 1)
				{	/* reset alarm */
					ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_VARIOUS_MODULE_PLUGGED] = 0;
				}
			}
			/* module is only inserted --> module only inserted */
			else if(pModuleInfo->ActualModuleInformation.ModuleState == MODULE_ONLY_INSERTED)
			{	/* reset other alarmbits */
				if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_CONFIGURED] == 1)
				{	/* reset alarm */
					ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_CONFIGURED] = 0;
				}
				else if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_VARIOUS_MODULE_PLUGGED] == 1)
				{	/* reset alarm */
					ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_VARIOUS_MODULE_PLUGGED] = 0;
				}
			}
			/* modulestate is OK */
			else if(pModuleInfo->ActualModuleInformation.ModuleState == MODULE_OK)
			{	/* if module-only-configured alarmbit is set --> reset */
				if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_CONFIGURED] == 1)
				{	/* reset alarm */
					ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_CONFIGURED] = 0;
				}
				/* if module-only-inserted alarmbit is set --> reset */
				else if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_INSERTED] == 1)
				{	/* reset alarm */
					ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_INSERTED] = 0;
				}
				/* if various-module-plugged alarmbit is set --> reset */
				else if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_VARIOUS_MODULE_PLUGGED] == 1)
				{	/* reset alarm */
					ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_VARIOUS_MODULE_PLUGGED] = 0;
				}
			}
			/* various module is plugged */
			else if(pModuleInfo->ActualModuleInformation.ModuleState == VAR_MODULE_PLUGGED)
			{	/* reset other alarmbits */
				if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_CONFIGURED] == 1)
				{	/* reset alarm */
					ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_CONFIGURED] = 0;
				}
				else if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_INSERTED] == 1)
				{	/* reset alarm */
					ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_INSERTED] = 0;
				}
			}
			pModuleInfo->LastStep = RESET_MODULE_ALARMS2;
			pModuleInfo->Step = WAIT;
		break;
		
		/* check new module alarms */
		case CHECK_NEW_ALARMMESSAGES:
			if(pModuleInfo->ActualModuleInformation.ModuleState == MODULE_ONLY_CONFIGURED)
			{	/* check alarmbit */
				if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_CONFIGURED] == 0)
				{	/* copy information for textsnippets */
					strcpy(ModuleAlarmInfo->ErrorModulePath, pModuleInfo->ActualModuleInformation.ModulePath);
					strcpy(ModuleAlarmInfo->ErrorModuleName, pModuleInfo->ActualModuleInformation.ErrorModuleName);
					AlarmMessage = 1;
				}
			}
			/* module is only inserted --> module only inserted */
			else if(pModuleInfo->ActualModuleInformation.ModuleState == MODULE_ONLY_INSERTED)
			{	/* check alarmbit */
				if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_INSERTED] == 0)
				{	/* copy information for textsnippets */
					strcpy(ModuleAlarmInfo->ErrorModulePath, pModuleInfo->ActualModuleInformation.ModulePath);
					strcpy(ModuleAlarmInfo->ErrorModuleName, pModuleInfo->ActualModuleInformation.ModuleName);
					AlarmMessage = 1;
				}
			}
			/* various module is plugged */
			else if(pModuleInfo->ActualModuleInformation.ModuleState == VAR_MODULE_PLUGGED)
			{	/* check alarmbit */
				if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_VARIOUS_MODULE_PLUGGED] == 0)
				{	/* copy information for textsnippets */
					strcpy(ModuleAlarmInfo->ErrorModulePath, pModuleInfo->ActualModuleInformation.ModulePath);
					strcpy(ModuleAlarmInfo->ErrorModuleName, pModuleInfo->ActualModuleInformation.ErrorModuleName);
					AlarmMessage = 1;
				}
			}
			
			if(AlarmMessage == 0)
			{	pModuleInfo->Step = CHECK_NEXT_MODULE;
				/* copy data to module-buffer */
				memcpy(&(ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber]), &(pModuleInfo->ActualModuleInformation), sizeof(pModuleInfo->ActualModuleInformation));
			
				memset(&(pModuleInfo->ActualModuleInformation), 0, sizeof(pModuleInfo->ActualModuleInformation));
						
				/* next module-information */
				pModuleInfo->ModuleNumber++;
			}
			else
			{	AlarmMessage = 0;
				pModuleInfo->LastStep = CHECK_NEW_ALARMMESSAGES;
				pModuleInfo->Step = WAIT;
			}
		break;
		
	
		case SET_ALARMMESSAGES:
			if(pModuleInfo->ActualModuleInformation.ModuleState == MODULE_ONLY_CONFIGURED)
			{	/* set alarm */
				ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_CONFIGURED] = 1;
			}
			/* module is only inserted --> module only inserted */
			else if(pModuleInfo->ActualModuleInformation.ModuleState == MODULE_ONLY_INSERTED)
			{	/* set alarm */
				ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_MODULE_ONLY_INSERTED] = 1;
			}
			/* various module is plugged */
			else if(pModuleInfo->ActualModuleInformation.ModuleState == VAR_MODULE_PLUGGED)
			{	/* copy information for textsnippets */
				ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + OFFSET_VARIOUS_MODULE_PLUGGED] = 1;
			}
			
			/* copy data to module-buffer */
			memcpy(&(ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber]), &(pModuleInfo->ActualModuleInformation), sizeof(pModuleInfo->ActualModuleInformation));
			
			memset(&(pModuleInfo->ActualModuleInformation), 0, sizeof(pModuleInfo->ActualModuleInformation));
						
			/* next module-information */
			pModuleInfo->ModuleNumber++;
		
			pModuleInfo->LastStep = SET_ALARMMESSAGES;
			pModuleInfo->Step = WAIT;
		break;
		
		/* next module, only 100 modules are supported */		
		case CHECK_NEXT_MODULE:
			if(pModuleInfo->ModuleIndex < pModuleInfo->NumberOfTotalModules - 1)
			{	if((pModuleInfo->ModuleIndex - pModuleInfo->NumberNotCheckedModules) == MAX_MODULE_NUMBER - 1)
				{	pModuleInfo->NumberOfTotalModules = MAX_MODULE_NUMBER;
					pModuleInfo->Step = CHECK_MODULENUMBER;
				}
				else
				{	/* next module */
					pModuleInfo->ModuleIndex++;
					pModuleInfo->Step = CHECK_MODULESTATE;
				}
			}
			else
			{	pModuleInfo->Step = CHECK_MODULENUMBER;
			}
		break;
		
		/* check module-number */
		case CHECK_MODULENUMBER:
			if((pModuleInfo->NumberOfTotalModules - pModuleInfo->NumberNotCheckedModules) < pModuleInfo->ModulesLastCheck)
			{	pModuleInfo->ModuleDifference = pModuleInfo->ModulesLastCheck - (pModuleInfo->NumberOfTotalModules - pModuleInfo->NumberNotCheckedModules);
				pModuleInfo->Step = CHECK_NOT_NEEDED_ALARMS;
			}
			else
			{	pModuleInfo->ModulesLastCheck = (pModuleInfo->NumberOfTotalModules - pModuleInfo->NumberNotCheckedModules);
				pModuleInfo->Step = DISPOSE_INFO;
			}
		break;
		
		/* check not needed alarms */
		case CHECK_NOT_NEEDED_ALARMS:
			/* reset alarmbit and moduleinformationbuffer */
			if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + pModuleInfo->ResetModuleAlarms + OFFSET_MODULE_ONLY_CONFIGURED] == 1)
			{	/* copy information for textsnippets */
				strcpy(ModuleAlarmInfo->ErrorModulePath, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber + pModuleInfo->ResetModuleAlarms].ModulePath);
				strcpy(ModuleAlarmInfo->ErrorModuleName, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber + pModuleInfo->ResetModuleAlarms].ErrorModuleName);
			}
			else if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + pModuleInfo->ResetModuleAlarms + OFFSET_MODULE_ONLY_INSERTED] == 1)
			{	/* copy information for textsnippets */
				strcpy(ModuleAlarmInfo->ErrorModulePath, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber + pModuleInfo->ResetModuleAlarms].ModulePath);
				strcpy(ModuleAlarmInfo->ErrorModuleName, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber + pModuleInfo->ResetModuleAlarms].ModuleName);
			}
			else if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + pModuleInfo->ResetModuleAlarms + OFFSET_VARIOUS_MODULE_PLUGGED] == 1)
			{	/* copy information for textsnippets */
				strcpy(ModuleAlarmInfo->ErrorModulePath, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber + pModuleInfo->ResetModuleAlarms].ModulePath);
				strcpy(ModuleAlarmInfo->ErrorModuleName, ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber + pModuleInfo->ResetModuleAlarms].ErrorModuleName);
			}
			
			pModuleInfo->LastStep = CHECK_NOT_NEEDED_ALARMS;
			pModuleInfo->Step = WAIT;
		break;
		
		
		/* reset alarms */			
		case RESET_NOT_NEEDED_ALARMS:					
			/* reset alarmbit and moduleinformationbuffer */
			if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + pModuleInfo->ResetModuleAlarms + OFFSET_MODULE_ONLY_CONFIGURED] == 1)
			{	/* reset alarm */
				ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + pModuleInfo->ResetModuleAlarms + OFFSET_MODULE_ONLY_CONFIGURED] = 0;
			}
			else if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + pModuleInfo->ResetModuleAlarms + OFFSET_MODULE_ONLY_INSERTED] == 1)
			{	/* reset alarm */
				ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + pModuleInfo->ResetModuleAlarms + OFFSET_MODULE_ONLY_INSERTED] = 0;
			}
			else if(ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + pModuleInfo->ResetModuleAlarms + OFFSET_VARIOUS_MODULE_PLUGGED] == 1)
			{	/* reset alarm */
				ModuleAlarmInfo->AlarmBitField[pModuleInfo->ModuleNumber + pModuleInfo->ResetModuleAlarms + OFFSET_VARIOUS_MODULE_PLUGGED] = 0;
			}
			
			/* reset module-buffer */
			strcpy(ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber + pModuleInfo->ResetModuleAlarms].ModuleName, "");
			strcpy(ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber + pModuleInfo->ResetModuleAlarms].ModulePath, "");
			strcpy(ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber + pModuleInfo->ResetModuleAlarms].ErrorModuleName, "");
			ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber + pModuleInfo->ResetModuleAlarms].ModuleState = 0;
			ModuleInfoBuffer->ModuleInformation[pModuleInfo->ModuleNumber + pModuleInfo->ResetModuleAlarms].ModuleColor = 0;
			strcpy(pModuleInfo->PathBuffer[pModuleInfo->ModuleNumber + pModuleInfo->ResetModuleAlarms], "");
			
			pModuleInfo->LastStep = RESET_NOT_NEEDED_ALARMS;
			pModuleInfo->Step = WAIT;			
		break;
		
		/* check if other modules can be reset */
		case CHECK_RESET_NEXT_MODULE:
			if(pModuleInfo->ResetModuleAlarms < pModuleInfo->ModuleDifference - 1)
			{	pModuleInfo->ResetModuleAlarms++;
				pModuleInfo->Step = CHECK_NOT_NEEDED_ALARMS;
			}
			else
			{	pModuleInfo->ResetModuleAlarms = 0;
				pModuleInfo->ModuleDifference = 0;
				pModuleInfo->ModulesLastCheck = pModuleInfo->NumberOfTotalModules;
				pModuleInfo->Step = DISPOSE_INFO;	
			}
		break;
			
		/* dispose HW-info */	
		case DISPOSE_INFO:
			DisposeInfo.enable = 1;
			DisposeInfo.ident = CreateHWInfo.ident;
			
			DiagDisposeInfo(&DisposeInfo);
			
			if(DisposeInfo.status == 0)
			{	strcpy(ModuleAlarmInfo->ErrorModulePath, "");
				strcpy(ModuleAlarmInfo->ErrorModuleName , "");
				pModuleInfo->ModuleNumber = 0;
				pModuleInfo->status = 0;
				pModuleInfo->Step = CREATE_HW_INFO;
			}
			else if(DisposeInfo.status != 65535)
			{	pModuleInfo->status = DisposeInfo.status;
			}
		break;
		
		/* wait */
		case WAIT:
			pModuleInfo->WaitTimer.IN = 1;
			pModuleInfo->WaitTimer.PT = 5; /*750*/
			
			TON(&pModuleInfo->WaitTimer);
			
			if(pModuleInfo->WaitTimer.Q == 1)
			{	pModuleInfo->WaitTimer.IN = 0;
				TON(&pModuleInfo->WaitTimer);
				
				if(pModuleInfo->LastStep == CHECK_OLD_MODULE_PATH)
					pModuleInfo->Step = RESET_MODULE_ALARMS1;
				else if(pModuleInfo->LastStep == RESET_MODULE_ALARMS1)
				{	strcpy(ModuleAlarmInfo->ErrorModulePath, "");
					strcpy(ModuleAlarmInfo->ErrorModuleName , "");
					pModuleInfo->Step = CHECK_OLD_MODULE_ALARMS;
				}
				else if(pModuleInfo->LastStep == CHECK_OLD_MODULE_ALARMS)
					pModuleInfo->Step = RESET_MODULE_ALARMS2;
				else if(pModuleInfo->LastStep == RESET_MODULE_ALARMS2)
				{	strcpy(ModuleAlarmInfo->ErrorModulePath, "");
					strcpy(ModuleAlarmInfo->ErrorModuleName , "");
					pModuleInfo->Step = CHECK_NEW_ALARMMESSAGES;
				}
				else if(pModuleInfo->LastStep == CHECK_NEW_ALARMMESSAGES)
					pModuleInfo->Step = SET_ALARMMESSAGES;
				else if(pModuleInfo->LastStep == SET_ALARMMESSAGES)
				{	strcpy(ModuleAlarmInfo->ErrorModulePath, "");
					strcpy(ModuleAlarmInfo->ErrorModuleName , "");
					pModuleInfo->Step = CHECK_NEXT_MODULE;
				}
				else if(pModuleInfo->LastStep == CHECK_NOT_NEEDED_ALARMS)
					pModuleInfo->Step = RESET_NOT_NEEDED_ALARMS;
				else if(pModuleInfo->LastStep == RESET_NOT_NEEDED_ALARMS)
				{	strcpy(ModuleAlarmInfo->ErrorModulePath, "");
					strcpy(ModuleAlarmInfo->ErrorModuleName , "");
					pModuleInfo->Step = CHECK_RESET_NEXT_MODULE;
				}
				
				pModuleInfo->LastStep = 0;
			}
		break;	
	}	
}
