/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_43_
#define _BUR_1479044160_43_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct ErrorHandlingInputCommand_Type
{	plcbit Acknowledge;
	plcbit Reset;
} ErrorHandlingInputCommand_Type;

typedef struct ErrorHandlingInputPara_Type
{	unsigned long SystemAddress;
	unsigned long CncAddress;
	unsigned long AxesAddress;
} ErrorHandlingInputPara_Type;

typedef struct ErrorHandlingInput_Type
{	struct ErrorHandlingInputPara_Type Parameter;
	struct ErrorHandlingInputCommand_Type Command;
} ErrorHandlingInput_Type;

typedef struct ErrorHandlingOutputMon_Type
{	unsigned long ErrorHandlingAddress;
	plcbit AlarmImage[101];
} ErrorHandlingOutputMon_Type;

typedef struct ErrorHandlingStatus_Type
{	plcbit SystemError;
	plcbit CncError;
	plcbit Axeserror;
} ErrorHandlingStatus_Type;

typedef struct ErrorHandlingOutput_Type
{	struct ErrorHandlingOutputMon_Type Monitor;
	struct ErrorHandlingStatus_Type Status;
} ErrorHandlingOutput_Type;

typedef struct ErrorHandling_Type
{	struct ErrorHandlingInput_Type Input;
	struct ErrorHandlingOutput_Type Output;
} ErrorHandling_Type;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/ErrorHandling/Error.typ\\\" scope \\\"global\\\"\\n\"");

/* Additional IEC dependencies */
__asm__(".ascii \"iecdep \\\"Logical/HmiHandling/HmiGlobal.var\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_43_ */

