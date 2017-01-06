(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: HmiAlarm
 * File: HmiAlarm.st
 * Author: renj
 * Created: October 14, 2014
 ********************************************************************
 * Implementation of program HmiAlarm
 ********************************************************************)

PROGRAM _INIT


END_PROGRAM


PROGRAM _CYCLIC

	IF HmiGlobal.PageControl.ActPage = PAGE_ALARM THEN
		IF (gUserLevel > 0) THEN
			
		END_IF
	ELSE
		
		RETURN;
	END_IF
	

END_PROGRAM
