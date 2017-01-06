/* Automation Studio generated header file */
/* Do not edit ! */
/* ModDiag 2.02.0 */

#ifndef _MODDIAG_
#define _MODDIAG_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _ModDiag_VERSION
#define _ModDiag_VERSION 2.02.0
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG4
		#include "DataObj.h"
		#include "sys_lib.h"
		#include "standard.h"
		#include "AsIO.h"
		#include "AsIOMMan.h"
		#include "AsIODiag.h"
#endif
#ifdef _SG3
		#include "DataObj.h"
		#include "sys_lib.h"
		#include "standard.h"
		#include "AsIO.h"
		#include "AsIOMMan.h"
		#include "AsIODiag.h"
#endif
#ifdef _SGC
		#include "DataObj.h"
		#include "sys_lib.h"
		#include "standard.h"
		#include "AsIO.h"
		#include "AsIOMMan.h"
		#include "AsIODiag.h"
#endif

/* Constants */
#ifdef _REPLACE_CONST
 #define MAX_MODULE_NUMBER 100U
#else
 #ifndef _GLOBAL_CONST
   #define _GLOBAL_CONST _WEAK const
 #endif
 _GLOBAL_CONST unsigned short MAX_MODULE_NUMBER;
#endif




/* Datatypes and datatypes of function blocks */
typedef struct IODPList_typ
{	unsigned long StartAdrBuffer;
	unsigned short NumberDigitalInput;
	unsigned short NumberDigitalOutput;
	unsigned short NumberAnalogInput;
	unsigned short NumberAnalogOutput;
	unsigned short TotalIONumber;
} IODPList_typ;

typedef struct SingleIOEntry_typ
{	plcstring ModuleName[21];
	plcstring Device[61];
	plcstring ID[61];
	plcstring LogicalName[41];
	unsigned char Type;
	plcstring PVName[513];
} SingleIOEntry_typ;

typedef struct SingleIOStatus_typ
{	plcbit ForceActive;
	signed long ActForceValue;
	signed long ActValue;
	unsigned char DataType;
} SingleIOStatus_typ;

typedef struct ModuleAlarmInformation_typ
{	plcstring ErrorModulePath[31];
	plcstring ErrorModuleName[21];
	plcbit AlarmBitField[300];
	plcbit ACKBitField[300];
} ModuleAlarmInformation_typ;

typedef struct SingleModuleInformationData_typ
{	plcstring ModulePath[31];
	plcstring ModuleName[21];
	unsigned char ModuleState;
	unsigned char ModuleColor;
	plcstring ErrorModuleName[21];
} SingleModuleInformationData_typ;

typedef struct ModuleInformationBuffer_typ
{	struct SingleModuleInformationData_typ ModuleInformation[100];
} ModuleInformationBuffer_typ;

typedef struct ModuleDiagnose
{
	/* VAR_INPUT (analog) */
	unsigned long AdrModuleInformationBuffer;
	unsigned char Option;
	unsigned long AdrAlarmInformation;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	struct SingleModuleInformationData_typ ActualModuleInformation;
	plcstring PathBuffer[100][31];
	unsigned char Step;
	unsigned char LastStep;
	unsigned char NumberOfTotalModules;
	unsigned char ModuleIndex;
	unsigned char ModuleNumber;
	unsigned char ModulesLastCheck;
	unsigned char NumberNotCheckedModules;
	unsigned char ModuleDifference;
	unsigned char ResetModuleAlarms;
	struct TON WaitTimer;
} ModuleDiagnose_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void ModuleDiagnose(struct ModuleDiagnose* inst);
_BUR_PUBLIC unsigned short IOStatus(unsigned long pIOList, unsigned long pStatusBuffer, unsigned short Elements, unsigned long pEnableForce, unsigned long pForceValue);
_BUR_PUBLIC unsigned short IOList(unsigned long pIOInformation);


#ifdef __cplusplus
};
#endif
#endif /* _MODDIAG_ */

