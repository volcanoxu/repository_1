/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_45_
#define _BUR_1479044160_45_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct RECIPE_DATA_USER_typ
{	unsigned char Reserve;
} RECIPE_DATA_USER_typ;

typedef struct RECIPE_DATA_SYSTEM_typ
{	unsigned short CurRcpIndex;
	plcstring RcpListName[11][21];
	float JointJogSpeed;
	float PathJogSpeed;
	float HomePosition[13];
	float JogStepJoint;
	float JogStepBase;
} RECIPE_DATA_SYSTEM_typ;

typedef struct RECIPE_DATA_typ
{	struct RECIPE_DATA_SYSTEM_typ System;
	struct RECIPE_DATA_USER_typ User;
} RECIPE_DATA_typ;

typedef struct RECIPE_COMMAND_typ
{	plcbit Read;
	plcbit UserDataWrite;
	plcbit SysDataWrite;
	plcbit Delete;
	plcbit Rename;
} RECIPE_COMMAND_typ;

typedef struct RECIPE_MONITOR_typ
{	plcstring CurrentRcpName[11];
	plcbit RcpInitOK;
	unsigned short ListRcpIndex;
	unsigned long DataAddress;
	unsigned long RecipeAddress;
} RECIPE_MONITOR_typ;

typedef struct RECIPE_SET_PAR_typ
{	plcstring NewRcpName[11];
} RECIPE_SET_PAR_typ;

typedef struct RECIPE_typ
{	struct RECIPE_COMMAND_typ Cmd;
	struct RECIPE_MONITOR_typ Monitor;
	struct RECIPE_SET_PAR_typ SetPar;
	struct RECIPE_DATA_typ Data;
} RECIPE_typ;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/Recipe/RecipeGlobal.typ\\\" scope \\\"global\\\"\\n\"");

/* Additional IEC dependencies */
__asm__(".ascii \"iecdep \\\"Logical/Recipe/RecipeGlobal.var\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_45_ */

