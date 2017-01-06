typedef struct	SingleModuleInfo
{	
	STRING	ModuleName[20];
	STRING	ModulePath[40];
}SingleModuleInfo_typ;

typedef struct	ModuleInfo
{	
	USINT	Step;
	UDINT	HWIdent;
	UDINT	ModuleIndex;
	UDINT	TotalModules;
	UDINT	StartAdrBuffer;
	UDINT	IgnoredModules;
}ModuleInfo_typ;

typedef struct	IOStringInfo
{	
	STRING	ModuleName[20];
	STRING	Device[60];
	STRING	ID[60];
	STRING	LogicalName[40];
	USINT	Type;
	STRING	PVName[512];	
}IOStringInfo_typ;

typedef struct IOCounter
{	
	UINT	NumberDigitalInputs;
	UINT	NumberDigitalOutputs;
	UINT	NumberAnalogInputs;
	UINT	NumberAnalogOutputs;
}IOCounter_typ;
