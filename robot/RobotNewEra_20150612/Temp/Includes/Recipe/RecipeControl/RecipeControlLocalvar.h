/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_64_
#define _BUR_1479044160_64_

#include <bur/plctypes.h>

/* Constants */
#ifdef _REPLACE_CONST
#else
#endif


/* Variables */
_BUR_LOCAL struct DatObjInfo DOInfo;
_BUR_LOCAL struct DatObjRead DORead;
_BUR_LOCAL struct DatObjWrite DOWrite;
_BUR_LOCAL struct DatObjCreate DOCreate;
_BUR_LOCAL plcstring ErrInfo[65];
_BUR_LOCAL unsigned long AdrOffset;
_BUR_LOCAL unsigned long UserDataLen;
_BUR_LOCAL unsigned long SysDataLen;
_BUR_LOCAL unsigned long DataLen;
_BUR_LOCAL unsigned long DoIdent;
_BUR_LOCAL enum RecipeState_Type RcpStep;
_BUR_LOCAL struct RECIPE_typ Recipe;





__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/Recipe/RecipeControl/RecipeControlLocal.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/DataObj/DataObj.fun\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_64_ */

