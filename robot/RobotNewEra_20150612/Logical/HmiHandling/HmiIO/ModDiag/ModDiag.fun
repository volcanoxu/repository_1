FUNCTION_BLOCK ModuleDiagnose
	VAR_INPUT
		AdrModuleInformationBuffer	:UDINT;
		Option	:USINT;
		AdrAlarmInformation	:UDINT;
	END_VAR
	VAR_OUTPUT
		status	:UINT;
	END_VAR
	VAR
		ActualModuleInformation	:SingleModuleInformationData_typ;
		PathBuffer	:ARRAY[0..99] OF STRING[30];
		Step	:USINT;
		LastStep	:USINT;
		NumberOfTotalModules	:USINT;
		ModuleIndex	:USINT;
		ModuleNumber	:USINT;
		ModulesLastCheck	:USINT;
		NumberNotCheckedModules	:USINT;
		ModuleDifference	:USINT;
		ResetModuleAlarms	:USINT;
		WaitTimer	:TON;
	END_VAR
END_FUNCTION_BLOCK
FUNCTION IOStatus : UINT
	VAR_INPUT
		pIOList	:UDINT;
		pStatusBuffer	:UDINT;
		Elements	:UINT;
		pEnableForce	:UDINT;
		pForceValue	:UDINT;
	END_VAR
END_FUNCTION
FUNCTION IOList : UINT
	VAR_INPUT
		pIOInformation	:UDINT;
	END_VAR
END_FUNCTION
