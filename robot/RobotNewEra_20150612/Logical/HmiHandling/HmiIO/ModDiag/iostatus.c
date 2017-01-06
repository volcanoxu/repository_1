/************************************************************************************************************************/
/* Object name: iostatus.c																								*/
/* Author:      Andreas Hager, B&R																						*/
/* Site:        Eggelsberg                                                                                            	*/
/* Created:     24-Feb-2006                                                                                           	*/
/* Restriction: 													      		                                      	*/
/* Description: Function to handle configured IO data points	                                                      	*/
/*----------------------------------------------------------------------------------------------------------------------*/
/* Version 1.00			24-Feb-2006		 Andreas Hager			Official release								  		*/
/*----------------------------------------------------------------------------------------------------------------------*/
/* Version 1.01			12-Dec-2006		 Andreas Hager			More IOs can be handled and commment added 		  		*/
/*----------------------------------------------------------------------------------------------------------------------*/
/* Version 2.00			16-Jul-2008		 Andreas Hager			AS3 - Changes for GCC 4.1.1								*/
/*----------------------------------------------------------------------------------------------------------------------*/
/* Development tool: B&R Automation Studio V3.0.71.10 																  	*/
/*----------------------------------------------------------------------------------------------------------------------*/
/* Comment:                                                                                                           	*/
/************************************************************************************************************************/

#include <ModDiag.h>
#include <bur/plctypes.h>
#include <AsIOMMan.h>
#include <DataObj.h>
#include <string.h>
#include <AsIO.h>
#include <AsIODiag.h>
#include <Sys_lib.h>
#include "internal_h.h"

#define	FORCE_STATUS	0x04

#define	CHECK_DP_ACTIONS	0
#define	ENABLE_FORCE		1
#define	SET_FORCE_VALUE		2
#define	GET_DP_STATUS		3
#define	DISABLE_FORCE		4
#define	NEXT_DP				5

#define	FUNCTION_BUSY	65535

static	AsIODPStatus_typ		IODPStatus;
static	AsIOEnableForcing_typ	IODPEnableForce;
static	AsIODisableForcing_typ	IODPDisableForce;
static	AsIOSetForceValue_typ	IODPSetForceValue;

unsigned short IOStatus(unsigned long pIOList, unsigned long pStatusBuffer, unsigned short Elements, unsigned long pEnableForce, unsigned long pForceValue)
{	static	USINT		Step = 0;
	static	UINT		DPIndex = 0;
	
	USINT	StatusFlag = 0, ForceStatus = 0;
	UINT	Status = 0;
			
	SingleIOEntry_typ		*SingleIOEntry = 0;
	SingleIOStatus_typ		*SingleIOStatus = 0;
	BOOL					*EnableForce = 0;
	DINT					*ForceValue = 0;

	*(UDINT*)&SingleIOEntry = pIOList;
	*(UDINT*)&SingleIOStatus = pStatusBuffer;
	*(UDINT*)&EnableForce = pEnableForce;
	*(UDINT*)&ForceValue = pForceValue;

	if(Elements <= 0)
	{	return(0);
	}
	
	switch(Step)
	{	/* Check actions for data point */
		case CHECK_DP_ACTIONS:
			/* Force data point - forcing data point */
			if(*(EnableForce + DPIndex) == 1)
			{	if((SingleIOStatus + DPIndex)->ForceActive == 0)
				{	/* Call funtion block to enable forcing */
					IODPEnableForce.enable = 1;
					IODPEnableForce.pDatapoint = (UDINT)(SingleIOEntry + DPIndex)->ID;
					
					AsIOEnableForcing(&(IODPEnableForce));
					Status = IODPEnableForce.status;
														
					if(IODPEnableForce.status == 0)
					{	Status = FUNCTION_BUSY;
						Step = SET_FORCE_VALUE;
					}
				}
				else
				{	Status = FUNCTION_BUSY;
					Step = SET_FORCE_VALUE;
				}
			}
			else
			{	Status = FUNCTION_BUSY;
				Step = GET_DP_STATUS;
			}
		break;	
		
		/* Set force value for data point */				
		case SET_FORCE_VALUE:
			/* Call function block to set force value */
			IODPSetForceValue.enable = 1;
			IODPSetForceValue.pDatapoint = (UDINT)(SingleIOEntry + DPIndex)->ID;
			/* Force value */
			IODPSetForceValue.value = *(ForceValue + DPIndex);
			
			AsIOSetForceValue(&(IODPSetForceValue));
			Status = IODPSetForceValue.status;
				
			if(IODPSetForceValue.status == 0)
			{	Status = FUNCTION_BUSY;
				Step = GET_DP_STATUS;
			}
		break;
	
		/* Get data point status */
		case GET_DP_STATUS:	
			/* Call functio block to get data point status */
			IODPStatus.enable = 1;
			IODPStatus.pDatapoint = (UDINT)(SingleIOEntry + DPIndex)->ID;
			
			AsIODPStatus(&(IODPStatus));
			Status = IODPStatus.status;
			
			if(IODPStatus.status == 0)
			{	/* Copy data to io status buffer */
				(SingleIOStatus + DPIndex)->ActValue = (DINT)IODPStatus.value;
				(SingleIOStatus + DPIndex)->ActForceValue = (DINT)IODPStatus.forceValue;
				(SingleIOStatus + DPIndex)->DataType = IODPStatus.datatype;
				
				StatusFlag = IODPStatus.flags;
				ForceStatus = IODPStatus.flags & FORCE_STATUS;
				
				if(StatusFlag==39 || StatusFlag == 23 )
				{
					(SingleIOStatus + DPIndex)->ActValue = (DINT)IODPStatus.forceValue;
				}
				
				if(ForceStatus == 4)
				{	(SingleIOStatus + DPIndex)->ForceActive = 1;	
				}
				else
				{	(SingleIOStatus + DPIndex)->ForceActive = 0;
				}
				
				Status = FUNCTION_BUSY;
				Step = DISABLE_FORCE;
			}
		break;
		
		/* Disable forcing */
		case DISABLE_FORCE:
			/* Forcing data point */
			if(*(EnableForce + DPIndex) == 0 && (SingleIOStatus + DPIndex)->ForceActive == 1)
			{	/* Call function block to disable forcing */
				IODPDisableForce.enable = 1;
				IODPDisableForce.pDatapoint = (UDINT)(SingleIOEntry + DPIndex)->ID;
				
				AsIODisableForcing(&(IODPDisableForce));
				Status = IODPDisableForce.status;
				
				if(IODPDisableForce.status == 0)		
				{	Status = FUNCTION_BUSY;
					Step = NEXT_DP;
				}
			}
			else
			{	Status = FUNCTION_BUSY;
				Step = NEXT_DP;
			}
		break;
		
		/* Select next io data point */
		case NEXT_DP:
			if(DPIndex < Elements - 1)
			{	DPIndex++;
				Status = FUNCTION_BUSY;
				Step = CHECK_DP_ACTIONS;
			}
			else
			{	DPIndex = 0;
				Status = 0;
				Step = CHECK_DP_ACTIONS;
			}
		break;
	}
	return(Status);
}
