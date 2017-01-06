/********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: ReceipeControl
 * File: ReceipeControl.c
 * Author: renj
 * Created: October 08, 2014
 ********************************************************************
 * Implementation of program ReceipeControl
 ********************************************************************/

#include <bur/plctypes.h>

#include <dataobj.h>
#include <string.h>           /*prototypes for asstring-library       */

#ifdef _DEFAULT_INCLUDES
	#include <AsDefault.h>
#endif

#if (CPU_TYPE == SG3)
_LOCAL DatObjMove_typ 		DOMove;
#endif

void _INIT ReceipeControlInit(void)
{	
	if (Recipe.Data.System.CurRcpIndex >= NB_RECIPE)
		Recipe.Data.System.CurRcpIndex = NB_RECIPE-1;
	DataLen		= sizeof(Recipe.Data);
	SysDataLen	= sizeof(Recipe.Data.System);
	UserDataLen	= sizeof(Recipe.Data.User);
	RcpStep = 0;
	
	Recipe.Monitor.RecipeAddress = (UDINT)&Recipe;
	DOInfo.enable	= 1;
	DOInfo.pName	= (UDINT)"RecipeData";
 
	/* Call  FUB  */
	DatObjInfo(&DOInfo);
	
	/* Check the  status */
	if ((DOInfo.status == doERR_MODULNOTFOUND) || (DOInfo.status == doERR_ILLOBJTYPE)) /* Data module not found -> create a new one */
	{
		/* Initialize create structure */
		DOCreate.enable 	= 1;
		DOCreate.grp	 	= 0;
		DOCreate.pName 		= (UDINT)"RecipeData";		/*不能与任何任务名和其它数据模块名相同*/
		DOCreate.len 		= DataLen*NB_RECIPE;

#if (CPU_TYPE == SG3)
		DOCreate.MemType 	= doUSRRAM;
#elif (CPU_TYPE == SG4)			
		DOCreate.MemType 	= doUSRROM;
#endif

		DOCreate.Option 	= 0;
		DOCreate.pCpyData 	= 0;
		
		/* Call FUB */
		DatObjCreate(&DOCreate);
		
		if (DOCreate.status == 0)
		{
#if (CPU_TYPE == SG3)
			/* Initialize move structure */ 
			DOMove.enable 	= 1; 
			DOMove.ident 	= DOCreate.ident; 
			DOMove.MemType 	= doFIXRAM; 
			DOMove.Option 	= 0; 
			/* Call FUB */ 
			DatObjMove(&DOMove); 
			/* Verify status */ 
			if (DOMove.status == 0) 
			{ 
				DoIdent = DOMove.identNew;
				strcpy(&ErrInfo[0],"DatObjMove executed correctly with no errors");
			}
			else
			{
				strcpy(&ErrInfo[0],"Error while moving data object(only SG3)");
			}
	 		 
#elif (CPU_TYPE == SG4)	/* For SG4 targets */			
			DoIdent = DOCreate.ident;
			strcpy(&ErrInfo[0],"DatObjCreate executed correctly with no errors");
#endif			

		}
		else
		{
			strcpy(&ErrInfo[0],"Error while creating data object");
		}

#if	(CPU_TYPE == SG4)	
		if (DOCreate.status == 0xFFFF)
		{
			strcpy(&ErrInfo[0],"DatObjCreate not yet complete - call FBK again (only SG4)");
		}
#endif
	}
	else
	{
		DoIdent = DOInfo.ident;
		strcpy(&ErrInfo[0],"DatObjInfo executed correctly with no errors");
		
		AdrOffset = 0;
		/* Initialize read structure */
		DORead.enable 		= 1;
		DORead.ident 		= DoIdent;
		DORead.Offset 		= AdrOffset;
		DORead.pDestination	= (UDINT)&Recipe.Data.System;
		DORead.len 			= SysDataLen;
		do 
		{
			/* Call FUB */
			DatObjRead(&DORead);
			
			if (DORead.status == 0)
			{
				strcpy(&ErrInfo[0],"DatObjRead executed correctly with no errors");
				Recipe.Monitor.RcpInitOK = 1;
			}
			else if (DORead.status != 0xFFFF)
			{
				strcpy(&ErrInfo[0],"DatObjRead had executed with errors");
			}
		}
		while (DORead.status == 0xFFFF);
		
		AdrOffset = UserDataLen*Recipe.Data.System.CurRcpIndex + SysDataLen;
		/* Initialize read structure */
		DORead.enable 		= 1;
		DORead.ident 		= DoIdent;
		DORead.Offset 		= AdrOffset;
		DORead.pDestination	= (UDINT)&Recipe.Data.User;
		DORead.len 			= UserDataLen;
	 	
		do 
		{
			/* Call FUB */
			DatObjRead(&DORead);
			
			if (DORead.status == 0)
			{
				strcpy(&ErrInfo[0],"DatObjRead executed correctly with no errors");
				strcpy(&Recipe.Monitor.CurrentRcpName[0],&Recipe.Data.System.RcpListName[Recipe.Data.System.CurRcpIndex][0]);
				Recipe.Monitor.RcpInitOK = 1;
			}
			else if (DORead.status != 0xFFFF)
			{
				strcpy(&ErrInfo[0],"DatObjRead had executed with errors");
			}
		}
		while (DORead.status == 0xFFFF);
		
		
		
		
	}/*end of if (DOInfo.status == doERR_MODULNOTFOUND)*/
	
	if (Recipe.Data.System.JointJogSpeed == 0) 
		Recipe.Data.System.JointJogSpeed = 30;
	if (Recipe.Data.System.PathJogSpeed == 0) 
		Recipe.Data.System.PathJogSpeed = 300;
	if (Recipe.Data.System.JogStepBase == 0) 
		Recipe.Data.System.JogStepBase = 0.1;
	if (Recipe.Data.System.JogStepJoint == 0) 
		Recipe.Data.System.JogStepJoint = 0.1;
}

void _CYCLIC ReceipeControlCyclic(void)
{
	switch(RcpStep)
	{
		case sIDLE:
			if ( Recipe.Cmd.Read )
			{
				RcpStep = sDAT_READ;
			}
			else if ( Recipe.Cmd.UserDataWrite )
			{
				RcpStep = sUSER_DAT_WRITE;
			}
			else if ( Recipe.Cmd.SysDataWrite )
			{
				RcpStep = sSYS_DAT_WRITE;
			}
			else if ( Recipe.Cmd.Rename )
			{
				strcpy(&Recipe.Data.System.RcpListName[Recipe.Monitor.ListRcpIndex][0],&Recipe.SetPar.NewRcpName[0]);
				Recipe.Cmd.Rename = 0;
				Recipe.Cmd.SysDataWrite = 1;
			}
			else if ( Recipe.Cmd.Delete )
			{
				strcpy(&Recipe.Data.System.RcpListName[Recipe.Monitor.ListRcpIndex][0],"");
				Recipe.Cmd.Delete = 0;
				Recipe.Cmd.SysDataWrite = 1;
			}
			break;
			
		case sDAT_READ:
			if (Recipe.Monitor.ListRcpIndex >= NB_RECIPE)
				Recipe.Monitor.ListRcpIndex = NB_RECIPE-1;
				
			AdrOffset = Recipe.Monitor.ListRcpIndex*UserDataLen + SysDataLen;
			
			/* Initialize read structure */
			DORead.enable 		= 1;
			DORead.ident 		= DoIdent;
			DORead.Offset 		= AdrOffset;
			DORead.pDestination	= (UDINT)&Recipe.Data.User;
			DORead.len 			= UserDataLen;
	 
			/* Call FUB */
			DatObjRead(&DORead);
			
			if (DORead.status == 0)
			{
				strcpy(&ErrInfo[0],"DatObjRead executed correctly with no errors");
				Recipe.Cmd.Read = 0;
				strcpy(&Recipe.Monitor.CurrentRcpName[0],&Recipe.Data.System.RcpListName[Recipe.Monitor.ListRcpIndex][0]);
				Recipe.Data.System.CurRcpIndex = Recipe.Monitor.ListRcpIndex;
				Recipe.Cmd.SysDataWrite = 1;
				Recipe.Monitor.RcpInitOK = 1;
				RcpStep = sIDLE;	
			}
			else if (DORead.status != 0xFFFF)
			{
				strcpy(&ErrInfo[0],"DatObjRead executed with errors");
				Recipe.Cmd.Read = 0;
				DORead.enable = 0;
				/* Call FUB */
				DatObjRead(&DORead);
				RcpStep = sIDLE;	
			}
#if	(CPU_TYPE == SG4)	
			if (DORead.status == 0xFFFF)
			{
				strcpy(&ErrInfo[0],"DatObjRead not yet complete - call FBK again (only SG4)");
			}
#endif
			break;
			
		case sUSER_DAT_WRITE:
			if (Recipe.Monitor.ListRcpIndex >= NB_RECIPE)
				Recipe.Monitor.ListRcpIndex = NB_RECIPE-1;
							
			AdrOffset = Recipe.Monitor.ListRcpIndex*UserDataLen + SysDataLen;
			
			/* Initialize read structure */
			DOWrite.enable 		= 1;
			DOWrite.ident 		= DoIdent;
			DOWrite.Offset 		= AdrOffset;
			DOWrite.pSource		= (UDINT)&Recipe.Data.User;
			DOWrite.len 		= UserDataLen;
	 
			/* Call FUB */
			DatObjWrite(&DOWrite);
			
			if (DOWrite.status == 0)
			{
				strcpy(&ErrInfo[0],"UserDatObjWrite executed correctly with no errors");
				Recipe.Cmd.UserDataWrite = 0;
				strcpy(&Recipe.Monitor.CurrentRcpName[0],&Recipe.Data.System.RcpListName[Recipe.Monitor.ListRcpIndex][0]);
				Recipe.Data.System.CurRcpIndex = Recipe.Monitor.ListRcpIndex;
				Recipe.Cmd.SysDataWrite = 1;
				RcpStep = sIDLE;	
			}
			else if (DOWrite.status != 0xFFFF)
			{
				strcpy(&ErrInfo[0],"UserDatObjWrite executed with errors");
				Recipe.Cmd.UserDataWrite = 0;
				DOWrite.enable = 0;
				/* Call FUB */
				DatObjWrite(&DOWrite);
				RcpStep = sIDLE;	
			}	
#if	(CPU_TYPE == SG4)	
			if (DOWrite.status == 0xFFFF)
			{
				strcpy(&ErrInfo[0],"UserDatObjWrite not yet complete - call FBK again (only SG4)");
			}
#endif		
			break;
		
		case sSYS_DAT_WRITE:					
			AdrOffset = 0;
			
			/* Initialize read structure */
			DOWrite.enable 		= 1;
			DOWrite.ident 		= DoIdent;
			DOWrite.Offset 		= AdrOffset;
			DOWrite.pSource		= (UDINT)&Recipe.Data.System;
			DOWrite.len 		= SysDataLen;
	 
			/* Call FUB */
			DatObjWrite(&DOWrite);
			
			if (DOWrite.status == 0)
			{
				strcpy(&ErrInfo[0],"SysDatObjWrite executed correctly with no errors");
				Recipe.Cmd.SysDataWrite = 0;
				RcpStep = sIDLE;	
			}
			else if (DOWrite.status != 0xFFFF)
			{
				strcpy(&ErrInfo[0],"SysDatObjWrite executed with errors");
				Recipe.Cmd.SysDataWrite = 0;
				DOWrite.enable = 0;
				/* Call FUB */
				DatObjWrite(&DOWrite);
				RcpStep = sIDLE;	
			}	
#if	(CPU_TYPE == SG4)	
			if (DOWrite.status == 0xFFFF)
			{
				strcpy(&ErrInfo[0],"SysDatObjWrite not yet complete - call FBK again (only SG4)");
			}
#endif		
			break;
			
		default:
			RcpStep = sIDLE;	
	}/*end of switch(RcpStep)*/
}
