TYPE
	IODPList_typ : STRUCT
		StartAdrBuffer	: UDINT ;
		NumberDigitalInput	: UINT ;
		NumberDigitalOutput	: UINT ;
		NumberAnalogInput	: UINT ;
		NumberAnalogOutput	: UINT ;
		TotalIONumber	: UINT ;
	END_STRUCT;
	SingleIOEntry_typ : STRUCT
		ModuleName	: STRING[20] ;
		Device	: STRING[60] ;
		ID	: STRING[60] ;
		LogicalName	: STRING[40] ;
		Type	: USINT ;
		PVName	: STRING[512] ;
	END_STRUCT;
	SingleIOStatus_typ : STRUCT
		ForceActive	: BOOL ;
		ActForceValue	: DINT ;
		ActValue	: DINT ;
		DataType	: USINT ;
	END_STRUCT;
	ModuleAlarmInformation_typ : STRUCT
		ErrorModulePath	: STRING[30] ;
		ErrorModuleName	: STRING[20] ;
		AlarmBitField	: ARRAY[0..299] OF BOOL ;
		ACKBitField	: ARRAY[0..299] OF BOOL ;
	END_STRUCT;
	SingleModuleInformationData_typ : STRUCT
		ModulePath	: STRING[30] ;
		ModuleName	: STRING[20] ;
		ModuleState	: USINT ;
		ModuleColor	: USINT ;
		ErrorModuleName	: STRING[20] ;
	END_STRUCT;
	ModuleInformationBuffer_typ : STRUCT
		ModuleInformation	: ARRAY[0..99] OF SingleModuleInformationData_typ ;
	END_STRUCT;
END_TYPE