(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: User
 * File: User.typ
 * Author: Liub
 * Created: January 16, 2012
 ********************************************************************
 * Local data types of program User
 ********************************************************************)

TYPE
	userData_typ : 	STRUCT  (*Save to data object*)
		userName : ARRAY[0..MAX_USER_MINUS_ONE]OF STRING[MAX_USER_NAME_LENGTH];
		password : ARRAY[0..MAX_USER_MINUS_ONE]OF STRING[MAX_PASSWORD_LENGTH];
		level : ARRAY[0..MAX_USER_MINUS_ONE]OF USINT;
	END_STRUCT;
	user_typ : 	STRUCT  (*user interface*)
		userName : STRING[MAX_USER_NAME_LENGTH];
		password : STRING[MAX_PASSWORD_LENGTH];
		level : USINT;
	END_STRUCT;
END_TYPE
