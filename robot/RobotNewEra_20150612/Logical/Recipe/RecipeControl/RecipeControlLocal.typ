(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: ReceipeControl
 * File: ReceipeControlLocal.typ
 * Author: renj
 * Created: October 08, 2014
 ********************************************************************
 * Local data types of program ReceipeControl
 ********************************************************************)

TYPE
	RecipeState_Type : 
		(
		sIDLE,
		sDAT_READ,
		sUSER_DAT_WRITE,
		sSYS_DAT_WRITE
		);
END_TYPE
