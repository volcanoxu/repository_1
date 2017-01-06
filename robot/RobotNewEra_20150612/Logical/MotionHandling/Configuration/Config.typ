
TYPE
	ConfigInputParameter_Type : 	STRUCT 
		SimulatedHardwareAR000 : USINT;
		SystemAddress : UDINT;
		CncAddress : UDINT;
		AxesAddress : UDINT;
		TrfAddress : UDINT;
	END_STRUCT;
	ConfigInput_Type : 	STRUCT 
		Parameter : ConfigInputParameter_Type;
	END_STRUCT;
	ConfigOutputMonitor_Type : 	STRUCT 
		ConfigOk : BOOL;
	END_STRUCT;
	ConfigOutput_Type : 	STRUCT 
		Monitor : ConfigOutputMonitor_Type;
	END_STRUCT;
	Config_Type : 	STRUCT 
		Input : ConfigInput_Type;
		Output : ConfigOutput_Type;
	END_STRUCT;
END_TYPE
