/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_65_
#define _BUR_1479044160_65_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct userData_typ
{	plcstring userName[8][9];
	plcstring password[8][9];
	unsigned char level[8];
} userData_typ;

typedef struct user_typ
{	plcstring userName[9];
	plcstring password[9];
	unsigned char level;
} user_typ;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/UserStd/UserStd/User.typ\\\" scope \\\"local\\\"\\n\"");

/* Additional IEC dependencies */
__asm__(".ascii \"iecdep \\\"Logical/UserStd/UserStd/User.var\\\" scope \\\"local\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_65_ */

