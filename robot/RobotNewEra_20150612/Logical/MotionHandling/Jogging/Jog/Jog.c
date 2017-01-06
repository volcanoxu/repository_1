/********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Program: Jog
 * File: Jog.c
 * Author: frigenif
 * Created: December 05, 2012
 ********************************************************************
 * Implementation of program Jog
 ********************************************************************/

#include <bur/plctypes.h>
#include <AsBrStr.h>
#define _REPLACE_CONST 


#ifdef _DEFAULT_INCLUDES
#include <AsDefault.h>
#endif

void _INIT JogINIT(void)
{
	Jogging.JogAddress = (UDINT)&Jogging;
}

void _CYCLIC JogCYCLIC(void)
{

	if (CncAddress != 0)
	{
		pCnc = (Cnc_Type*) CncAddress;
		
		switch(Jogging.State)
		{
			case JOG_WAIT:
				if (Jogging.Run)
				{
					if(pCnc[CNC]->Output.State.Standby)	/* start jogging */
					{
						Jogging.State = JOG_RUN;
						brsstrcpy((UDINT)&pCnc[CNC]->Input.Parameter.NcInitProgramName,(UDINT)&"");
						strcpy((UDINT)&pCnc[CNC]->Input.Parameter.NcProgramName,(UDINT)&"JogPrg");
						
						Jogging.MoveAxis[0] = HmiKeyControl.Output.Status.MoveAxis[0];
						Jogging.MoveAxis[1] = HmiKeyControl.Output.Status.MoveAxis[1];
						Jogging.MoveAxis[2] = HmiKeyControl.Output.Status.MoveAxis[2];
						Jogging.MoveAxis[3] = HmiKeyControl.Output.Status.MoveAxis[3];
						Jogging.MoveAxis[4] = HmiKeyControl.Output.Status.MoveAxis[4];
						Jogging.MoveAxis[5] = HmiKeyControl.Output.Status.MoveAxis[5];
						
						pCnc[CNC]->Input.Parameter.NcProgramStartMode = 3;
						pCnc[CNC]->Input.Parameter.NcProgramStartPos = -1;
						pCnc[CNC]->Input.Command.StartNcProgram = 1;
					}
					else /* jogging not allowed now */
					{
						Jogging.Run = 0;
						if (pCnc[CNC]->Output.State.Moving)
							pCnc[CNC]->Input.Command.Stop = 1;
					}
				}
				break;
			case JOG_RUN:
				if (!Jogging.Run)	/* stop jogging */
				{
					Jogging.State = JOG_WAIT;
					pCnc[CNC]->Input.Command.Stop = 1;
				}
				if (pCnc[CNC]->Output.State.Errorstop)
				{
					Jogging.Run = 0;
					Jogging.State = JOG_WAIT;
				}
				break;
		}
	}
	
}
