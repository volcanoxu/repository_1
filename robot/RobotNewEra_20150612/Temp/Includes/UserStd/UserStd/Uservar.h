/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_66_
#define _BUR_1479044160_66_

#include <bur/plctypes.h>

/* Constants */
#ifdef _REPLACE_CONST
 #define MAX_USER_LEVEL 4U
 #define PASSWORD_DATA_NAME "myUser"
 #define USER_ADMIN_PASSWORD "123"
 #define MAX_PASSWORD_LENGTH 8U
 #define MAX_USER_NAME_LENGTH 8U
 #define MAX_USER_MINUS_ONE 7U
 #define MAX_USER 8U
#else
 _LOCAL_CONST unsigned char MAX_USER_LEVEL;
 _LOCAL_CONST plcstring PASSWORD_DATA_NAME[11];
 _LOCAL_CONST plcstring USER_ADMIN_PASSWORD[9];
 _LOCAL_CONST unsigned char MAX_PASSWORD_LENGTH;
 _LOCAL_CONST unsigned char MAX_USER_NAME_LENGTH;
 _LOCAL_CONST unsigned char MAX_USER_MINUS_ONE;
 _LOCAL_CONST unsigned char MAX_USER;
#endif


/* Variables */
_BUR_LOCAL signed long constant;
_BUR_LOCAL unsigned char i;
_BUR_LOCAL unsigned char j;
_BUR_LOCAL unsigned char k;
_BUR_LOCAL unsigned short result;
_BUR_LOCAL unsigned short userStep;
_BUR_LOCAL unsigned long ident;
_BUR_LOCAL unsigned char initError;
_BUR_LOCAL unsigned short dataObjSize;
_BUR_LOCAL unsigned short dataStruSize;
_BUR_LOCAL struct DatObjRead dataObjRead;
_BUR_LOCAL struct DatObjWrite dataObjWrite;
_BUR_LOCAL struct DatObjInfo dataObjInfo;
_BUR_LOCAL struct DatObjCreate dataObjCreate;
_BUR_LOCAL unsigned short disableLogOutToPre;
_BUR_LOCAL unsigned short errorNumber;
_BUR_LOCAL unsigned short errorInfo;
_BUR_LOCAL plcstring curPassword[11];
_BUR_LOCAL unsigned short focusIndex;
_BUR_LOCAL struct user_typ newUser;
_BUR_LOCAL struct user_typ curUser;
_BUR_LOCAL struct user_typ preUser;
_BUR_LOCAL struct userData_typ visUserData;
_BUR_LOCAL unsigned char visUserIndex[8];
_BUR_LOCAL struct userData_typ userData;
_BUR_LOCAL unsigned char cmdDelUser;
_BUR_LOCAL unsigned char cmdNewUser;
_BUR_LOCAL unsigned char cmdLogOut;
_BUR_LOCAL unsigned char cmdLogOutToPre;
_BUR_LOCAL unsigned char cmdLogIn;





__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/UserStd/UserStd/User.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/DataObj/DataObj.fun\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_66_ */

