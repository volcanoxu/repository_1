(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: HmiSetup
 * File: HmiSetupLocal.typ
 * Author: renj
 * Created: January 21, 2015
 ********************************************************************
 * Local data types of program HmiSetup
 ********************************************************************)

TYPE
	KineAxisType : 	STRUCT 
		Mech : HmiMechType;
		JointLimits : HmiJointLimitType;
	END_STRUCT;
END_TYPE
