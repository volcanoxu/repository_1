/********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Program: 6axATrqFF
 * File: 6axATrqFF.c
 * Author: frigenif
 * Created: May 17, 2011
 ********************************************************************
 * Implementation of program 6axATrqFF
 ********************************************************************/

#include <bur/plctypes.h>

#ifdef _DEFAULT_INCLUDES
 #include <AsDefault.h>
#endif

#include "math.h"

#define PI 	3.1415926535897932384626433832795	

void _INIT axATrqFFINIT( void )
{
	TrqFF6axA.Enable = 0;

	TrqFF6axA.Axes[0].Index = AXIS_Q1;
	TrqFF6axA.Axes[0].Sign = 0;				//-1;
	TrqFF6axA.Axes[0].MaxTorque = 6.6;  	//5.5;

	TrqFF6axA.Axes[1].Index = AXIS_Q2;
	TrqFF6axA.Axes[1].Sign = 1;
	TrqFF6axA.Axes[1].MaxTorque = 9.5;		//7.4;

	TrqFF6axA.Axes[2].Index = AXIS_Q3;
	TrqFF6axA.Axes[2].Sign = -1;
	TrqFF6axA.Axes[2].MaxTorque = 6.2;		//3.42;

	TrqFF6axA.Axes[3].Index = AXIS_Q4;
	TrqFF6axA.Axes[3].Sign = -1;
	TrqFF6axA.Axes[3].MaxTorque = 2;	//1.35;

	TrqFF6axA.Axes[4].Index = AXIS_Q5;
	TrqFF6axA.Axes[4].Sign = 1;
	TrqFF6axA.Axes[4].MaxTorque = 1.5;		//0.68;

	TrqFF6axA.Axes[5].Index = AXIS_Q6;
	TrqFF6axA.Axes[5].Sign = -1;
	TrqFF6axA.Axes[5].MaxTorque = 1.5;		//0.68;

	TrqFF6axA.Ramp = 0;
	
	CncProgWasActive = 0;
	TrqFF6axA.Enable = 0;

}

void _CYCLIC axATrqFFCYCLIC( void )
{


	/*************************** Check if system initialization is completed ***************************/

	if (AxesAddress == 0)
	{
		return;
	}
	else	/* access motion control structures */
	{
		pAxes = (Axes_Type*) AxesAddress;
	}

	AllAxControllerOn = 1;
	AllAxHomingOk = 1;
	for (i=0; i<=5; i++)
	{
		if ((*pAxes)[TrqFF6axA.Axes[i].Index].Output.Status.ControllerStatus != ncTRUE)
		{
			AllAxControllerOn = 0;
		}
		if ((*pAxes)[TrqFF6axA.Axes[i].Index].Output.Status.HomingOk != ncTRUE)
		{
			AllAxHomingOk = 0;
		}
	}

	/*************************** Check if feed forward is active and enabled ***************************/

	OptMotInMotion = 0;
	for (i=0; i<=14; i++)
	{
		/* check if any position != 0 */
		if(OptMotConfig.monitor.s_joint[i] != 0.0) 
			OptMotInMotion = 1;
	}

	if(	TrqFF6axA.Enable && AllAxControllerOn && AllAxHomingOk )
	{
		if(OptMotInMotion != 0)
			CncProgWasActive = 1;
		if(CncProgWasActive == 1)
			TrqFF6axA.Active = 1;
		else
			TrqFF6axA.Active = 0;
	}
	else
	{
		CncProgWasActive = 0;
		TrqFF6axA.Active = 0;
	}



	/*************************** ramp FF torque to prevent jumps ***************************/

	if(TrqFF6axA.Active) 
	{
		TrqFF6axA.Ramp+=0.005;
		if(TrqFF6axA.Ramp>1.0)
			TrqFF6axA.Ramp=1.0;
	}
	else
	{
		TrqFF6axA.Ramp=0.0;
	}



	/*************************** write FF torque to servo drives ***************************/
	
	for (i=0; i<6; i++)
	{	

		/* skip jumps to zero - except for axis J1 */
		if ((TrqFF6axA.Axes[i].SetTorque !=0) && (OptMotConfig.monitor.feed_forward_torque[6+i] == 0) && (i!=0))
		{
				OptMotConfig.monitor.feed_forward_torque[6+i] = TrqFF6axA.Axes[i].SetTorque;
		}

	//	 filter FF torque 
		TrqFF6axA.Axes[i].SetTorque = (REAL) OptMotConfig.monitor.feed_forward_torque[6+i];
		
		/* limit set torque to motor limits */
		if (TrqFF6axA.Axes[i].SetTorque > TrqFF6axA.Axes[i].MaxTorque)
		{
			TrqFF6axA.Axes[i].SetTorque = TrqFF6axA.Axes[i].MaxTorque;
		}
		else if (TrqFF6axA.Axes[i].SetTorque < -TrqFF6axA.Axes[i].MaxTorque)
		{
			TrqFF6axA.Axes[i].SetTorque = -TrqFF6axA.Axes[i].MaxTorque;
		}


		if(TrqFF6axA.Active)
		{
			TrqFF6axA.Axes[i].CorrectTorque = TrqFF6axA.Axes[i].SetTorque * TrqFF6axA.Axes[i].Sign * TrqFF6axA.Ramp;
			memcpy (&(pAxes[0]+TrqFF6axA.Axes[i].Index)->Input.Parameter.PDOWriteValue[0], &TrqFF6axA.Axes[i].CorrectTorque, 4);
		}
		else
		{
			TrqFF6axA.Axes[i].SetTorque = 0;
			TrqFF6axA.Axes[i].CorrectTorque = 0;
			memcpy (&(pAxes[0]+TrqFF6axA.Axes[i].Index)->Input.Parameter.PDOWriteValue[0], &TrqFF6axA.Axes[i].CorrectTorque, 4);
		}

	}


}	

	
