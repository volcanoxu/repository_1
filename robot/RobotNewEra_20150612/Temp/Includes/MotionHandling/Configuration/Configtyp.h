/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_7_
#define _BUR_1479044160_7_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct ConfigInputParameter_Type
{	unsigned char SimulatedHardwareAR000;
	unsigned long SystemAddress;
	unsigned long CncAddress;
	unsigned long AxesAddress;
	unsigned long TrfAddress;
} ConfigInputParameter_Type;

typedef struct ConfigInput_Type
{	struct ConfigInputParameter_Type Parameter;
} ConfigInput_Type;

typedef struct ConfigOutputMonitor_Type
{	plcbit ConfigOk;
} ConfigOutputMonitor_Type;

typedef struct ConfigOutput_Type
{	struct ConfigOutputMonitor_Type Monitor;
} ConfigOutput_Type;

typedef struct Config_Type
{	struct ConfigInput_Type Input;
	struct ConfigOutput_Type Output;
} Config_Type;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/MotionHandling/Configuration/Config.typ\\\" scope \\\"restricted\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_7_ */

