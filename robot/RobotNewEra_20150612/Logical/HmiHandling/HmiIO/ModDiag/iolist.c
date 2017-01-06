/************************************************************************************************************************/
/* Object name: iolist.c																								*/
/* Author:      Andreas Hager, B&R																						*/
/* Site:        Eggelsberg                                                                                            	*/
/* Created:     24-Feb-2006                                                                                           	*/
/* Restriction: 													      		                                      	*/
/* Description: Function to read out configured IO data points                                                      	*/
/*----------------------------------------------------------------------------------------------------------------------*/
/* Version 1.00			24-Feb-2006		 Andreas Hager			Official release								  		*/
/*----------------------------------------------------------------------------------------------------------------------*/
/* Version 1.01			13-Dec-2006		 Andreas Hager			Comment added									  		*/
/*----------------------------------------------------------------------------------------------------------------------*/
/* Version 2.00			16-Jul-2008		 Andreas Hager			AS3 - Changes for GCC 4.1.1								*/
/*----------------------------------------------------------------------------------------------------------------------*/
/* Version 2.01			16-Sep-2009		 Andreas Hager			Bugfix for memset in StringParser()						*/
/*----------------------------------------------------------------------------------------------------------------------*/
/* Development tool: B&R Automation Studio V3.0.71.31 SP05 																*/
/*----------------------------------------------------------------------------------------------------------------------*/
/* Comment:                                                                                                           	*/
/************************************************************************************************************************/

#include <ModDiag.h>
#include <bur/plctypes.h>
#include <AsIOMMan.h>
#include <DataObj.h>
#include <string.h>
#include <AsIODiag.h>
#include <Sys_lib.h>
#include <Standard.h>
#include "internal_h.h"

#define	CREATE_HW_INFO		0
#define	ALLOC_MEMORY		1
#define	GET_MODULE_NAME		2
#define	GET_MODULE_PATH		3
#define	CHECK_NEXT_MODULE	4
#define	DISPOSE_INFO		5

#define	MAX_LENGTH			512

#define	PV_NAME_OVERFLOW	50001
#define	FUNCTION_BUSY		65535

static	AsIOMMCopy_typ		IOMapCopy;
static	DatObjDelete_typ	DataModuleDelete;	
static	DatObjInfo_typ		DataModuleInfo;

/* Function to get io module information */
unsigned short ModulesInformation(UDINT pModuleInfo);
/* Function to parse iomap data */
unsigned short StringParser(UDINT pBuffer, UDINT pIOData, UDINT pIOCounter, USINT Option);
/* Function to sort io list depending on device */
void SortIOList(UDINT pIOList, UINT IOEntries);

unsigned short IOList(unsigned long pIOInformation)
{	USINT	*Parser = 0, NumberConfiguredModules = 0;
	UINT	xcnt = 0, ycnt  = 0, TotalIOs = 0, OldDigitalInputs = 0, OldDigitalOutputs = 0, OldAnalogInputs = 0, OldAnalogOutputs = 0, DPIndex = 0,
			ModuleStatus = 0, ParserStatus = 0, AllocStatus = 0, StatusFree = 0;
	UDINT	MaxAdr = 0;
	STRING	ParserString[800];
	
	IODPList_typ			*IOList = 0;
	SingleModuleInfo_typ	*SingleModuleInfo = 0;
	SingleIOEntry_typ		*SingleIOEntry = 0;
	IOStringInfo_typ		EntryInfo;
	IOCounter_typ			IOCounter;
	ModuleInfo_typ			ModuleInformation;
	
	memset(&(EntryInfo), 0, sizeof(EntryInfo));
	memset(&(ModuleInformation), 0, sizeof(ModuleInformation));
	memset(&(IOCounter), 0, sizeof(IOCounter));
	
	*(UDINT*)&IOList = pIOInformation;
	
	/* Get module information */
	do
	{	ModuleStatus = ModulesInformation((UDINT)&(ModuleInformation));
	} while(ModuleStatus == 65535);
	
	if(ModuleStatus)
	{	return(ModuleStatus);
	}
	
	/* Number of configured modules */
	NumberConfiguredModules = ModuleInformation.TotalModules - ModuleInformation.IgnoredModules;
	
	/* Pointer to module information buffer */
	*(UDINT*)&SingleModuleInfo = ModuleInformation.StartAdrBuffer;
	
	/* Check if io data module already exists */
	DataModuleInfo.enable = 1;
	DataModuleInfo.pName = (UDINT)"iomap_io";
	DatObjInfo(&DataModuleInfo);
	
	if(DataModuleInfo.status == 0)
	{	DataModuleDelete.enable = 1;
		DataModuleDelete.ident = DataModuleInfo.ident;
		DatObjDelete(&DataModuleDelete);
	}
	
	/* Generate data module of iomap file */
	do
	{	IOMapCopy.enable = 1;
		IOMapCopy.pModuleName = (UDINT)"iomap";
		IOMapCopy.pNewModule = (UDINT)"iomap_io";
		IOMapCopy.memType = 65;
		AsIOMMCopy(&IOMapCopy);
	} while(IOMapCopy.status == 65535);
	
	if(IOMapCopy.status)
	{	return(IOMapCopy.status);
	}
	
	DataModuleInfo.enable = 1;
	DataModuleInfo.pName = (UDINT)"iomap_io";
	DatObjInfo(&DataModuleInfo);
		
	if(DataModuleInfo.status)
	{	return(DataModuleInfo.status);
	}
	
	MaxAdr = DataModuleInfo.pDatObjMem + DataModuleInfo.len;
	
	/* Pointer to the start address of io data module */
	*(UDINT*)&Parser = DataModuleInfo.pDatObjMem;
	
	while((UDINT)Parser < MaxAdr)
	{	
		/* Each line with information starts with <LN */
		if(!memcmp((UDINT*)Parser, "<LN ", 4))
		{	Parser = Parser + 4;	
			
			/* Copy data tiil </LN> */
			for(xcnt = 0; xcnt < 800; xcnt++)
			{	if(!memcmp((UDINT*)Parser, "</LN>", 5))
				{	ParserString[xcnt] = 0;
					Parser = Parser + 5;
					
					/* Check string for information --> Option = 0 - check number of completed entries */
					ParserStatus = StringParser((UDINT)&(ParserString), (UDINT)&(EntryInfo), (UDINT)&(IOCounter), 0);
					
					if(ParserStatus)
						return(ParserStatus);
					
					memset(&(ParserString), 0, sizeof(ParserString));
					break;	
				}
				else
				{	ParserString[xcnt] = *Parser;
					Parser++;
				}
			}
		}
		/* Increase pointer */
		else
		{	Parser++;
		}
	}
	
	TotalIOs = IOCounter.NumberDigitalInputs + IOCounter.NumberDigitalOutputs + IOCounter.NumberAnalogInputs + IOCounter.NumberAnalogOutputs;
	
	if(TotalIOs == 0)
		return(0);
	
	/* Allocate memory */
	do
	{	AllocStatus = TMP_alloc(sizeof(SingleIOEntry_typ)*TotalIOs, (void*)&(IOList->StartAdrBuffer));
	} while(AllocStatus == 65535);
	
	if(AllocStatus)
	{	return(AllocStatus);
	}
	
	/* Pare data module again */
	memset((void*)IOList->StartAdrBuffer, 0, sizeof(SingleIOEntry_typ)*TotalIOs);
	*(UDINT*)&SingleIOEntry = IOList->StartAdrBuffer;
	memset(&(IOCounter), 0, sizeof(IOCounter));
	memset(&(ParserString), 0, sizeof(ParserString));
	
	*(UDINT*)&Parser = DataModuleInfo.pDatObjMem;
	
	while((UDINT)Parser < MaxAdr)
	{	
		/* Each line with information starts with <LN */
		if(!memcmp((UDINT*)Parser, "<LN ", 4))
		{	Parser = Parser + 4;	
			
			/* Copy data tiil </LN> */
			for(xcnt = 0; xcnt < 800; xcnt++)
			{	if(!memcmp((UDINT*)Parser, "</LN>", 5))
				{	ParserString[xcnt] = 0;
					Parser = Parser + 5;
					
					/* Check string for information --> Option = 1 - copy information to EntryInfo */
					ParserStatus = StringParser((UDINT)&(ParserString), (UDINT)&(EntryInfo), (UDINT)&(IOCounter), 1);
					
					if(ParserStatus)
						return(ParserStatus);			
					
					/* Copy information from EntryInfo to allocated buffer */
					if(OldDigitalInputs != IOCounter.NumberDigitalInputs || OldDigitalOutputs != IOCounter.NumberDigitalOutputs ||
						OldAnalogInputs != IOCounter.NumberAnalogInputs || OldAnalogOutputs != IOCounter.NumberAnalogOutputs)
					{	strcpy((SingleIOEntry + DPIndex)->Device, EntryInfo.Device);
						strcpy((SingleIOEntry + DPIndex)->ID, EntryInfo.ID);
						strcpy((SingleIOEntry + DPIndex)->LogicalName, EntryInfo.LogicalName);
						(SingleIOEntry + DPIndex)->Type = EntryInfo.Type;
						strcpy((SingleIOEntry + DPIndex)->PVName, EntryInfo.PVName);
						
						memset(&(EntryInfo), 0, sizeof(EntryInfo));
						
						/* Copy information about io module */
						for(ycnt = 0; ycnt < NumberConfiguredModules; ycnt++)
						{	if(!strcmp((SingleIOEntry + DPIndex)->Device, (SingleModuleInfo + ycnt)->ModulePath))
							{	strcpy((SingleIOEntry + DPIndex)->ModuleName, (SingleModuleInfo + ycnt)->ModuleName);
								break;
							}
						}
						OldDigitalInputs = IOCounter.NumberDigitalInputs;
						OldDigitalOutputs = IOCounter.NumberDigitalOutputs;
						OldAnalogInputs = IOCounter.NumberAnalogInputs;
						OldAnalogOutputs = IOCounter.NumberAnalogOutputs;
						
						DPIndex++;
					}
					memset(&(ParserString), 0, sizeof(ParserString));
					break;	
				}
				else
				{	ParserString[xcnt] = *Parser;
					Parser++;
				}
			}
		}
		else
		{	Parser++;
		}
	}
	
	/* Free memory with io module information */
	StatusFree = TMP_free(sizeof(SingleModuleInfo_typ)*ModuleInformation.TotalModules, (void*)ModuleInformation.StartAdrBuffer);
	
	if(StatusFree)
	{	return(StatusFree);
	}
	
	/* Sort io list */
	SortIOList(IOList->StartAdrBuffer, TotalIOs);
	
	/* Copy number of ios */
	IOList->NumberDigitalInput = IOCounter.NumberDigitalInputs;
	IOList->NumberDigitalOutput = IOCounter.NumberDigitalOutputs;
	IOList->NumberAnalogInput = IOCounter.NumberAnalogInputs;
	IOList->NumberAnalogOutput = IOCounter.NumberAnalogOutputs;
	IOList->TotalIONumber = IOCounter.NumberDigitalInputs + IOCounter.NumberDigitalOutputs + IOCounter.NumberAnalogInputs + IOCounter.NumberAnalogOutputs;
	return(0);
}

/* Function to get io module information */
unsigned short ModulesInformation(UDINT pModuleInfo)
{	static	DiagCreateInfo_typ		CreateHWInfo;
	static	DiagGetStrInfo_typ		GetModulePath, GetModuleName;
	static	DiagDisposeInfo_typ		DisposeInfo;
	static	SingleModuleInfo_typ	*SingleModuleInfo = 0;
	
	USINT	*pUSINT1 = 0, *pUSINT2 = 0;
	UINT	Status = 0;
	STRING	ModulePath[40], ModuleName[20];
	
	ModuleInfo_typ			*ModuleInfo = 0;
	
	memset(&(ModulePath), 0, sizeof(ModulePath));
	memset(&(ModuleName), 0, sizeof(ModuleName));
	
	*(UDINT*)&ModuleInfo = pModuleInfo;
	
	switch(ModuleInfo->Step)
	{
		/* Get information about configured hardware */
		case CREATE_HW_INFO:
			CreateHWInfo.enable = 1;
			CreateHWInfo.infoKind = asdiagCONFIGURED;
			
			DiagCreateInfo(&CreateHWInfo);
			Status = CreateHWInfo.status;
			
			if(CreateHWInfo.status == 0)
			{	ModuleInfo->TotalModules = CreateHWInfo.nrEntries;
				ModuleInfo->HWIdent = CreateHWInfo.ident;
				ModuleInfo->Step = ALLOC_MEMORY;
				Status = FUNCTION_BUSY;
			}
		break;
		
		/* Allocate memory for hardware information depending on number of modules */
		case ALLOC_MEMORY:
			Status = TMP_alloc(sizeof(SingleModuleInfo_typ)*ModuleInfo->TotalModules, (void*)&(ModuleInfo->StartAdrBuffer));
			
			if(Status == 0)
			{	memset((void*)ModuleInfo->StartAdrBuffer, 0, sizeof(SingleModuleInfo_typ)*ModuleInfo->TotalModules);
				*(UDINT*)&SingleModuleInfo = ModuleInfo->StartAdrBuffer;
				/* Set module index on next module after panel */
				ModuleInfo->ModuleIndex = 1;
				ModuleInfo->IgnoredModules = 1;
				ModuleInfo->Step = GET_MODULE_NAME;
				Status = FUNCTION_BUSY;
			}
		break;
		
		/* Get name for each hardware module */
		case GET_MODULE_NAME:
			GetModuleName.enable = 1;
			GetModuleName.ident = CreateHWInfo.ident;
			GetModuleName.index = ModuleInfo->ModuleIndex;
			GetModuleName.infoCode = asdiagCONFIG_MODULE;
			GetModuleName.pBuffer = (UDINT)ModuleName;
			GetModuleName.bufferLen = sizeof(ModuleName);
			
			DiagGetStrInfo(&GetModuleName);
			Status = GetModuleName.status;
			
			if(GetModuleName.status == 0)
			{	*(UDINT*)&pUSINT1 = (UDINT)(ModuleName + 1);
				*(UDINT*)&pUSINT2 = (UDINT)(ModuleName + 2);
				
				/* Ignore IF and ACxxx */
				if((*pUSINT1 == 'I' && *pUSINT2 == 'F') || (*pUSINT1 == 'A' && *pUSINT2 == 'C'))
				{	ModuleInfo->IgnoredModules++;
					ModuleInfo->Step = CHECK_NEXT_MODULE;
				}
				else
				{	strcpy((SingleModuleInfo + (ModuleInfo->ModuleIndex - ModuleInfo->IgnoredModules))->ModuleName, ModuleName);
					ModuleInfo->Step = GET_MODULE_PATH;
				}
				Status = FUNCTION_BUSY;	
			}
		break;
		
		/* Get path for each hardware module */
		case GET_MODULE_PATH:
			GetModulePath.enable = 1;
			GetModulePath.ident = CreateHWInfo.ident;
			GetModulePath.index = ModuleInfo->ModuleIndex;
			GetModulePath.infoCode = asdiagPATH;
			GetModulePath.pBuffer = (UDINT)ModulePath;
			GetModulePath.bufferLen = sizeof(ModulePath);
			
			DiagGetStrInfo(&GetModulePath);
			Status = GetModulePath.status;
			
			if(GetModulePath.status == 0)
			{	strcpy((SingleModuleInfo + (ModuleInfo->ModuleIndex - ModuleInfo->IgnoredModules))->ModulePath, ModulePath);
				ModuleInfo->Step = CHECK_NEXT_MODULE;
				Status = FUNCTION_BUSY;
			}
		break;
		
		/* Select nex module */
		case CHECK_NEXT_MODULE:
			if(ModuleInfo->ModuleIndex < ModuleInfo->TotalModules - 1)
			{	ModuleInfo->ModuleIndex++;
				ModuleInfo->Step = GET_MODULE_NAME;
			}
			else
			{	ModuleInfo->Step = DISPOSE_INFO;
			}
			Status = FUNCTION_BUSY;
		break;
		
		/* Dispose information */
		case DISPOSE_INFO:
			DisposeInfo.enable = 1;
			DisposeInfo.ident = ModuleInfo->HWIdent;
			
			DiagDisposeInfo(&DisposeInfo);
			
			if(DisposeInfo.status == 0)
			{	ModuleInfo->Step = CREATE_HW_INFO;
			}
		break;
	}
	return(Status);
}

/* Function to parse iomap data */
unsigned short StringParser(UDINT pBuffer, UDINT pIOData, UDINT pIOCounter, USINT Option)
{	USINT	*Parser = 0, Element = 0;
	UINT xcnt = 0;
	STRING	Data[MAX_LENGTH], ID[60], Type[40], DType[40], Device1[60], DPName1[34], Kind1[40], Device2[60], DPName2[34], Kind2[40];
	
	IOStringInfo_typ	*EntryInfo = 0;
	IOCounter_typ		*IOCounter = 0;
	
	memset(&(Data), 0, sizeof(Data));
	memset(&(ID), 0, sizeof(ID));
	memset(&(Type), 0, sizeof(Type));
	memset(&(DType), 0, sizeof(DType));
	memset(&(Device1), 0, sizeof(Device1));
	memset(&(DPName1), 0, sizeof(DPName1));
	memset(&(Kind1), 0, sizeof(Kind1));
	memset(&(Device2), 0, sizeof(Device2));
	memset(&(DPName2), 0, sizeof(DPName2));
	memset(&(Kind2), 0, sizeof(Kind2));

	
	*(UDINT*)&Parser = pBuffer;
	*(UDINT*)&EntryInfo = pIOData;
	*(UDINT*)&IOCounter = pIOCounter;
					
	while(*Parser)
	{	/* Information starts with " */
		while(*Parser != '"' && *Parser)
		{	Parser++;
		}
		if(!*Parser)
			break;
		else
			Parser++;
		
		/* Information ends with " */
		while(*Parser != '"' && *Parser)
		{	Data[xcnt] = *Parser;
			Parser++;
			xcnt++;
			if(xcnt == MAX_LENGTH)
				return(PV_NAME_OVERFLOW);
		}
		Parser++;
		Data[xcnt] = 0;
		xcnt = 0;
		
		/* Element 0 --> IO ID */
		if(Element == 0)
		{	strcpy(ID, Data);
			memcpy(Type, Data, 3);
		}
		/* Element 1 --> Data type */
		else if(Element == 1)
		{	strcpy(DType, Data);
		}
		/* Element 2 --> Device */
		else if(Element == 2)
		{	strcpy(Device1, Data);
		}
		/* Element 3 --> Data point name */
		else if(Element == 3)
		{	strcpy(DPName1, Data);
		}
		/* Element 4 --> Kind */
		else if(Element == 4)
		{	strcpy(Kind1, Data);
		}
		/* Element 5 --> Device */
		else if(Element == 5)
		{	strcpy(Device2, Data);
		}
		/* Element 6 --> Data point name */
		else if(Element == 6)
		{	strcpy(DPName2, Data);
		}
		/* Elemtn 7 --> Kind */
		else if(Element == 7)
		{	strcpy(Kind2, Data);
		}
								
		Element++;
		memset(&(Data), 0, sizeof(Data));
	}
	
	/* If less than 8 elements are detected --> information is completed */
	if(Element != 8)
	{	Element = 0;
		return(0);
	}
	
	/* Type %IX --> Digital input */
	if(Element == 8 && !strcmp(Type, "%IX"))
	{	IOCounter->NumberDigitalInputs++;
	}
	/* Type %QX --> Digital output */
	else if(Element == 8 && !strcmp(Type, "%QX"))
	{	IOCounter->NumberDigitalOutputs++;
	}
	/* Type %IW --> Analog input */
	else if(Element == 8 && !strcmp(Type, "%IW"))
	{	IOCounter->NumberAnalogInputs++;
	}
	/* Type %QW --> Analog output */
	else if(Element == 8 && !strcmp(Type, "%QW"))
	{	IOCounter->NumberAnalogOutputs++;
	}
	
	/* If option = 1 --> copy all information to EntryInfo */
	if(Option == 1 && Element == 8)
	{	strcpy(EntryInfo->ID, ID);
	
		if(!strcmp(Type, "%IX"))
		{	EntryInfo->Type = 1;
			if(!strcmp(Kind1, "io"))
			{	strcpy(EntryInfo->LogicalName, DPName1);
			}
			else if(!strcmp(Kind2, "io"))
			{	strcpy(EntryInfo->LogicalName, DPName2);
			}
		}
		else if(!strcmp(Type, "%QX"))
		{	EntryInfo->Type = 2;
			if(!strcmp(Kind1, "io"))
			{	strcpy(EntryInfo->LogicalName, DPName1);
			}
			else if(!strcmp(Kind2, "io"))
			{	strcpy(EntryInfo->LogicalName, DPName2);
			}
		}
		else if(!strcmp(Type, "%IW"))
		{	EntryInfo->Type = 3;
			if(!strcmp(Kind1, "io"))
			{	strcpy(EntryInfo->LogicalName, DPName1);
			}
			else if(!strcmp(Kind2, "io"))
			{	strcpy(EntryInfo->LogicalName, DPName2);
			}
		}
		else if(!strcmp(Type, "%QW"))
		{	EntryInfo->Type = 4;
			if(!strcmp(Kind1, "io"))
			{	strcpy(EntryInfo->LogicalName, DPName1);
			}
			else if(!strcmp(Kind2, "io"))
			{	strcpy(EntryInfo->LogicalName, DPName2);
			}
		}
		
		if(!strcmp(Kind1, "pv"))
		{	strcpy(EntryInfo->PVName, DPName1);
			strcpy(EntryInfo->Device, Device2);
		}
		else if(!strcmp(Kind2, "pv"))
		{	strcpy(EntryInfo->PVName, DPName2);
			strcpy(EntryInfo->Device, Device1);
		}
	}
		
	Element = 0;
	return(0);
}

/* Function to sort io list depending on device */
void SortIOList(UDINT pIOList, UINT IOEntries)
{	STRING				ParserString1[60], ParserString2[60], *Parser1, *Parser2;
	UINT				IOType = 0, xcnt = 0, ycnt = 0, zcnt = 0, ExchangeData;
	DINT				Result = 0;
	SingleIOEntry_typ	*SingleIOEntry = 0;
	SingleIOEntry_typ	IOEntryData;
	
	memset(&(ParserString1), 0, sizeof(ParserString1));
	memset(&(ParserString2), 0, sizeof(ParserString2));
	memset(&(IOEntryData), 0, sizeof(IOEntryData));
	
	*(UDINT*)&SingleIOEntry = pIOList;
	
	for(xcnt = 0; xcnt < IOEntries - 1; xcnt++)
	{	for(ycnt = 0; ycnt < IOEntries - 1 - xcnt; ycnt++)
		{	/* Pointer to io ID of entry */
			*(UDINT*)&Parser1 = (UDINT)(SingleIOEntry + ycnt)->ID;
			/* Pointer to io ID of the next entry */
			*(UDINT*)&Parser2 = (UDINT)(SingleIOEntry + ycnt + 1)->ID;
			
			while(*Parser1 && *Parser2)
			{	while(*Parser1 != '.' && *Parser2 != '.' && IOType == 0)
				{	Parser1++;
					Parser2++;
				}
				if(IOType == 0)
				{	Parser1++;
					Parser2++;
					IOType = 1;
				}
				
				while(*Parser1 != '.' && *Parser1)
				{	ParserString1[zcnt] = *Parser1;
					Parser1++;
					zcnt++;
				}
				Parser1++;
				ParserString1[zcnt] = 0;
				zcnt = 0;
				
				while(*Parser2 != '.' && *Parser2)
				{	ParserString2[zcnt] = *Parser2;
					Parser2++;
					zcnt++;
				}
				Parser2++;
				ParserString2[zcnt] = 0;
				zcnt = 0;
				
				Result = strcmp(ParserString1, ParserString2);
				
				if(Result < 0)
				{	break;
				}
				else if(Result > 0 && memcmp(ParserString1, "ModuleOk", 8) && memcmp(ParserString1, "SerialNumber", 12) && memcmp(ParserString1, "ModuleID", 8) &&
					memcmp(ParserString1, "HardwareVariant", 15) && memcmp(ParserString1, "FirmwareVersion", 15))
				{	ExchangeData = 1;
					break;	
				}
			}
			
			/* Exchange data */
			if(ExchangeData == 1)
			{	memcpy(&(IOEntryData), (SingleIOEntry + ycnt), sizeof(IOEntryData));
				memcpy((SingleIOEntry + ycnt), (SingleIOEntry + ycnt + 1), sizeof(IOEntryData));
				memcpy((SingleIOEntry + ycnt + 1), &(IOEntryData), sizeof(IOEntryData));
			
				ExchangeData = 0;
			}
			memset(&(ParserString1), 0, sizeof(ParserString1));
			memset(&(ParserString2), 0, sizeof(ParserString2));
			memset(&(IOEntryData), 0, sizeof(IOEntryData));
			IOType = 0;
		}
	}
}
