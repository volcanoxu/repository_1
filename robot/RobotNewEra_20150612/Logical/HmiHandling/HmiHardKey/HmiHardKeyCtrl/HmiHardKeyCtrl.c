/********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: HardKeySim
 * File: HardKeySim.c
 * Author: Administrator
 * Created: April 23, 2012
 ********************************************************************
 * Implementation of program HardKeySim
 ********************************************************************/

#include <bur/plctypes.h>

#include <AsRfbExt.h>

#ifdef _DEFAULT_INCLUDES
#include <AsDefault.h>
#endif

void _INIT avcINIT(void)
{
	uiTimeOut = 500;
	Status_RfbExtInit = RfbExtInit(&pLib, uiTimeOut);	/*	Initialize RfbExt functions	*/	
	Enable_RfbExtConnect = 1;
}

void _CYCLIC avcCYCLIC(void)
{
	
	if (Enable_RfbExtConnect == 1)	
	{		
		Status_RfbExtConnect = RfbExtConnect((UDINT)&pLib, (UDINT) "Visu");				
		if (!Status_RfbExtConnect)			
			Enable_RfbExtConnect = 0;
	}	
	
	Status_RfbExtDataAge = RfbExtDataAge(&pLib, (UDINT)&pAge);
	
	if (pAge <= uiTimeOut)		/*	Otherwise there is no connection to the B&R VNC viewer	*/	
	{
		Status_RfbExtJoystickValue = RfbExtJoystickValue(&pLib, 0, &HmiHardKey.Input.Joystick_YValue, &HmiHardKey.Input.Joystick_XValue, &HmiHardKey.Input.Joystick_ZValue);
	}

}
