/********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Program: Trf
 * File: Trf.c
 * Author: frigenif
 * Created: December 08, 2011
 ********************************************************************
 * Implementation of program Trf
 ********************************************************************/

#include <bur/plctypes.h>
#include <TRF_LIB.h>

#ifdef _DEFAULT_INCLUDES
 #include <AsDefault.h>
#endif

void _INIT TrfINIT( void )
{
	
	/* Trasformation Configuration */

	/* Unit definintion */
	Robot_TRF.units.measure= TRF_DEGREES;
	Robot_TRF.units.epsilon= 0.000001;
	// Initialization
	// Warning: Delete those if = 0 then = ,they are only for Testpurpose
	if (HmiRetain.HmiRobot.CartesianLimits[0].Min == 0) HmiRetain.HmiRobot.CartesianLimits[0].Min = -2658;
	if (HmiRetain.HmiRobot.CartesianLimits[1].Min == 0) HmiRetain.HmiRobot.CartesianLimits[1].Min = -2658;
	if (HmiRetain.HmiRobot.CartesianLimits[2].Min == 0) HmiRetain.HmiRobot.CartesianLimits[2].Min = -602;
	if (HmiRetain.HmiRobot.CartesianLimits[0].Max == 0) HmiRetain.HmiRobot.CartesianLimits[0].Max = 2658;
	if (HmiRetain.HmiRobot.CartesianLimits[1].Max == 0) HmiRetain.HmiRobot.CartesianLimits[1].Max = 2658;
	if (HmiRetain.HmiRobot.CartesianLimits[2].Max == 0) HmiRetain.HmiRobot.CartesianLimits[2].Max = 3297;
	
	if (HmiRetain.HmiRobot.HomePos.Pos.x == 0) HmiRetain.HmiRobot.HomePos.Pos.x = 1854;
	if (HmiRetain.HmiRobot.HomePos.Pos.y == 0) HmiRetain.HmiRobot.HomePos.Pos.y = 0;
	if (HmiRetain.HmiRobot.HomePos.Pos.z == 0) HmiRetain.HmiRobot.HomePos.Pos.z = 1990;
		
	//	 Dimensions and position in the global coordinate system 
	if (HmiRetain.HmiRobot.Mech[1].OffsetX == 0) HmiRetain.HmiRobot.Mech[1].OffsetX = 312.0;
	if (HmiRetain.HmiRobot.Mech[1].OffsetZ == 0) HmiRetain.HmiRobot.Mech[1].OffsetZ = 680.0;
	if (HmiRetain.HmiRobot.Mech[2].OffsetZ == 0) HmiRetain.HmiRobot.Mech[2].OffsetZ = 1075.0;
	if (HmiRetain.HmiRobot.Mech[3].OffsetX == 0) HmiRetain.HmiRobot.Mech[3].OffsetX = 400.0;
	if (HmiRetain.HmiRobot.Mech[3].OffsetZ == 0) HmiRetain.HmiRobot.Mech[3].OffsetZ = 235.0;
	if (HmiRetain.HmiRobot.Mech[4].OffsetX == 0) HmiRetain.HmiRobot.Mech[4].OffsetX = 882.0;
	if (HmiRetain.HmiRobot.Mech[5].OffsetX == 0) HmiRetain.HmiRobot.Mech[5].OffsetX = 260.0;
		
	Robot_TRF.mech.a0x = HmiRetain.HmiRobot.Mech[0].OffsetX;
	Robot_TRF.mech.a0y = HmiRetain.HmiRobot.Mech[0].OffsetY;
	Robot_TRF.mech.a0z = HmiRetain.HmiRobot.Mech[0].OffsetZ;
	Robot_TRF.mech.a1x = HmiRetain.HmiRobot.Mech[1].OffsetX;
	Robot_TRF.mech.a1y = HmiRetain.HmiRobot.Mech[1].OffsetY;
	Robot_TRF.mech.a1z = HmiRetain.HmiRobot.Mech[1].OffsetZ;
	Robot_TRF.mech.a2x = HmiRetain.HmiRobot.Mech[2].OffsetX;
	Robot_TRF.mech.a2y = HmiRetain.HmiRobot.Mech[2].OffsetY;
	Robot_TRF.mech.a2z = HmiRetain.HmiRobot.Mech[2].OffsetZ;
	Robot_TRF.mech.a3x = HmiRetain.HmiRobot.Mech[3].OffsetX;
	Robot_TRF.mech.a3y = HmiRetain.HmiRobot.Mech[3].OffsetY;
	Robot_TRF.mech.a3z = HmiRetain.HmiRobot.Mech[3].OffsetZ;
	Robot_TRF.mech.a4x = HmiRetain.HmiRobot.Mech[4].OffsetX;
	Robot_TRF.mech.a5x = HmiRetain.HmiRobot.Mech[5].OffsetX;
	
	Robot_TRF.mech.angles_type = TRF_CARDAN_ANGLES;

	/* preferred mode */
	Robot_TRF.mode.preferred = TRF_MODE_FRONT + TRF_MODE_CONVEX + TRF_MODE_POSITIVE;

	// Joint properties
	if (HmiRetain.HmiRobot.Mech[1].Direction == 0) HmiRetain.HmiRobot.Mech[1].Direction = 1;
	if (HmiRetain.HmiRobot.Mech[2].Direction == 0) HmiRetain.HmiRobot.Mech[2].Direction = 1;
	if (HmiRetain.HmiRobot.Mech[4].Direction == 0) HmiRetain.HmiRobot.Mech[4].Direction = 1;
	
	if (HmiRetain.HmiRobot.JointLimits[0].Min == 0) HmiRetain.HmiRobot.JointLimits[0].Min = -180;
	if (HmiRetain.HmiRobot.JointLimits[0].Max == 0) HmiRetain.HmiRobot.JointLimits[0].Max = 180;
	if (HmiRetain.HmiRobot.JointLimits[1].Min == 0) HmiRetain.HmiRobot.JointLimits[1].Min = -76;
	if (HmiRetain.HmiRobot.JointLimits[1].Max == 0) HmiRetain.HmiRobot.JointLimits[1].Max = 60;
	if (HmiRetain.HmiRobot.JointLimits[2].Min == 0) HmiRetain.HmiRobot.JointLimits[2].Min = -65; //-142;
	if (HmiRetain.HmiRobot.JointLimits[2].Max == 0) HmiRetain.HmiRobot.JointLimits[2].Max = 230;
	if (HmiRetain.HmiRobot.JointLimits[3].Min == 0) HmiRetain.HmiRobot.JointLimits[3].Min = -360;
	if (HmiRetain.HmiRobot.JointLimits[3].Max == 0) HmiRetain.HmiRobot.JointLimits[3].Max = 360; //-360;
	if (HmiRetain.HmiRobot.JointLimits[4].Min == 0) HmiRetain.HmiRobot.JointLimits[4].Min = -125;
	if (HmiRetain.HmiRobot.JointLimits[4].Max == 0) HmiRetain.HmiRobot.JointLimits[4].Max = 125;
	if (HmiRetain.HmiRobot.JointLimits[5].Min == 0) HmiRetain.HmiRobot.JointLimits[5].Min = -360;
	if (HmiRetain.HmiRobot.JointLimits[5].Max == 0) HmiRetain.HmiRobot.JointLimits[5].Max = 360;
	
	Robot_TRF.mech.axis_Q1.property = TRF_MATH_POSITIVE + HmiRetain.HmiRobot.Mech[0].Direction + TRF_SW_ENDS_ENABLE + TRF_MULT_FACTOR_DISABLE;
	Robot_TRF.mech.axis_Q1.min_sw_end = HmiRetain.HmiRobot.JointLimits[0].Min;
	Robot_TRF.mech.axis_Q1.max_sw_end = HmiRetain.HmiRobot.JointLimits[0].Max;
	Robot_TRF.mech.axis_Q1.maximal_change = 5000.0;	// obsolete
	Robot_TRF.mech.axis_Q1.mult_factor = 0.0;

	Robot_TRF.mech.axis_Q2.property = TRF_MATH_POSITIVE + HmiRetain.HmiRobot.Mech[1].Direction + TRF_SW_ENDS_ENABLE + TRF_MULT_FACTOR_DISABLE ;
	Robot_TRF.mech.axis_Q2.min_sw_end = HmiRetain.HmiRobot.JointLimits[1].Min;
	Robot_TRF.mech.axis_Q2.max_sw_end = HmiRetain.HmiRobot.JointLimits[1].Max;
	Robot_TRF.mech.axis_Q2.maximal_change = 5000.0;	// obsolete
	Robot_TRF.mech.axis_Q2.mult_factor = 0.0;

	Robot_TRF.mech.axis_Q3.property = TRF_MATH_POSITIVE + HmiRetain.HmiRobot.Mech[2].Direction + TRF_SW_ENDS_ENABLE + TRF_MULT_FACTOR_DISABLE;
	Robot_TRF.mech.axis_Q3.min_sw_end = HmiRetain.HmiRobot.JointLimits[2].Min;
	Robot_TRF.mech.axis_Q3.max_sw_end = HmiRetain.HmiRobot.JointLimits[2].Max;
	Robot_TRF.mech.axis_Q3.maximal_change = 5000.0;	// obsolete
	Robot_TRF.mech.axis_Q3.mult_factor = 0.0;

	Robot_TRF.mech.axis_Q4.property = TRF_MATH_POSITIVE + HmiRetain.HmiRobot.Mech[3].Direction + TRF_SW_ENDS_ENABLE + TRF_MULT_FACTOR_DISABLE;
	Robot_TRF.mech.axis_Q4.min_sw_end = HmiRetain.HmiRobot.JointLimits[3].Min;
	Robot_TRF.mech.axis_Q4.max_sw_end = HmiRetain.HmiRobot.JointLimits[3].Max;
	Robot_TRF.mech.axis_Q4.maximal_change = 5000.0;	// obsolete
	Robot_TRF.mech.axis_Q4.mult_factor = 0.0;

	Robot_TRF.mech.axis_Q5.property = TRF_MATH_POSITIVE + HmiRetain.HmiRobot.Mech[4].Direction + TRF_SW_ENDS_ENABLE + TRF_MULT_FACTOR_DISABLE;
	Robot_TRF.mech.axis_Q5.min_sw_end = HmiRetain.HmiRobot.JointLimits[4].Min;
	Robot_TRF.mech.axis_Q5.max_sw_end = HmiRetain.HmiRobot.JointLimits[4].Max;
	Robot_TRF.mech.axis_Q5.maximal_change = 5000.0;	// obsolete
	Robot_TRF.mech.axis_Q5.mult_factor = 0.0;


	Robot_TRF.mech.axis_Q6.property = TRF_MATH_POSITIVE + HmiRetain.HmiRobot.Mech[5].Direction + TRF_SW_ENDS_ENABLE + TRF_MULT_FACTOR_DISABLE;
	Robot_TRF.mech.axis_Q6.min_sw_end = HmiRetain.HmiRobot.JointLimits[5].Min;
	Robot_TRF.mech.axis_Q6.max_sw_end = HmiRetain.HmiRobot.JointLimits[5].Max;
	Robot_TRF.mech.axis_Q6.maximal_change = 5000.0;	// obsolete
	Robot_TRF.mech.axis_Q6.mult_factor = 0.0;
	
	/* Add link to dynamic model */
	RobotDynGeneric.addr_var_name = (UDINT)("OptMotion:Par6axATrf");
	Robot_TRF.ident.dyn_model = (UDINT)&(RobotDynGeneric);
			
	/* Pointers to transformation functions */
	Robot_TRF.fctaddr.direct = (UDINT) TRF_direct;
	Robot_TRF.fctaddr.inverse = (UDINT) TRF_inverse;
	Robot_TRF.fctaddr.get_mode = (UDINT) TRF_get_mode;
	
	/* Coupling between Axes*/
	if (HmiRetain.HmiRobot.Coupling[0].Enable == 0) HmiRetain.HmiRobot.Coupling[0].Enable = 1;
	if (HmiRetain.HmiRobot.Coupling[0].Coefficient == 0) HmiRetain.HmiRobot.Coupling[0].Coefficient = 1.0/120;
	if (HmiRetain.HmiRobot.Coupling[1].Enable == 0) HmiRetain.HmiRobot.Coupling[1].Enable = 1;
	if (HmiRetain.HmiRobot.Coupling[1].Coefficient == 0) HmiRetain.HmiRobot.Coupling[1].Coefficient = -1.0/89;
	
	ExtJoint.link[0].enabled = HmiRetain.HmiRobot.Coupling[0].Enable;
	ExtJoint.link[0].idealToCpl = 0;
	ExtJoint.link[0].i = 4;
	ExtJoint.link[0].j = 3; // 4 Affects 5
	ExtJoint.link[0].coeff = HmiRetain.HmiRobot.Coupling[0].Coefficient;
	
	ExtJoint.link[1].enabled = HmiRetain.HmiRobot.Coupling[1].Enable;
	ExtJoint.link[1].idealToCpl = 0;
	ExtJoint.link[1].i = 5;
	ExtJoint.link[1].j = 4; // 5 Affects 6 
	ExtJoint.link[1].coeff = HmiRetain.HmiRobot.Coupling[1].Coefficient;
	
	ExtJoint.link[2].enabled = HmiRetain.HmiRobot.Coupling[2].Enable;
	ExtJoint.link[2].idealToCpl = 0;
	ExtJoint.link[2].i = 5;
	ExtJoint.link[2].j = 3; // 4 Affects 6 
	ExtJoint.link[2].coeff = HmiRetain.HmiRobot.Coupling[2].Coefficient;
	
	
	ExtTrfData.joint = &ExtJoint;
	Robot_TRF.type_04 = &ExtTrfData;
	
	/* Initialization of transformation object */
	TRF_6AX_InitStatus = TRF_init_instance((UDINT)"Robot_TRF");
	
}


void _CYCLIC TrfCYCLIC( void )
{

	if (AxesAddress != 0)
	{
		pAxes = (Axes_Type*) AxesAddress;
		
		/* call direct tranformations to allign TCP axes when homing */
		TrfInPos[0]	=	(LREAL) (*pAxes)[AXIS_Q1].Output.Monitor.Position;
		TrfInPos[1]	=	(LREAL) (*pAxes)[AXIS_Q2].Output.Monitor.Position;
		TrfInPos[2]	=	(LREAL) (*pAxes)[AXIS_Q3].Output.Monitor.Position;
		TrfInPos[3]	=	(LREAL) (*pAxes)[AXIS_Q4].Output.Monitor.Position;
		TrfInPos[4]	=	(LREAL) (*pAxes)[AXIS_Q5].Output.Monitor.Position;
		TrfInPos[5]	=	(LREAL) (*pAxes)[AXIS_Q6].Output.Monitor.Position;
		
		SimPos[0]	=	(*pAxes)[AXIS_Q1].Output.Monitor.Position;
		SimPos[1]	=	(*pAxes)[AXIS_Q2].Output.Monitor.Position;
		SimPos[2]	=	(*pAxes)[AXIS_Q3].Output.Monitor.Position;
		SimPos[3]	=	(*pAxes)[AXIS_Q4].Output.Monitor.Position;
		SimPos[4]	=	(*pAxes)[AXIS_Q5].Output.Monitor.Position;
		SimPos[5]	=	(*pAxes)[AXIS_Q6].Output.Monitor.Position;

		TrfInPosExt[0]	= 0;
		TrfInPosExt[1]	= 0;
		TrfInPosExt[2]	= 0;
		TrfInPosExt[3]	= 0;
		TrfInPosExt[4]	= 0;
		TrfInPosExt[5]	= 0;
		
		TrfDirectTransStatus = TRF_direct(&Robot_TRF, (UDINT)&TrfInPos[0], (UDINT)&TrfInPosExt[0], (UDINT)&TrfOutPos[0],(UDINT) &TrfDirectInfo[0]);
		
		(*pAxes)[AXIS_X].Input.Parameter.AutoPosition	= (REAL) (TrfOutPos[0]);
		(*pAxes)[AXIS_Y].Input.Parameter.AutoPosition	= (REAL) (TrfOutPos[1]);
		(*pAxes)[AXIS_Z].Input.Parameter.AutoPosition	= (REAL) (TrfOutPos[2]);
		(*pAxes)[AXIS_A].Input.Parameter.AutoPosition	= (REAL) (TrfOutPos[3]);
		(*pAxes)[AXIS_B].Input.Parameter.AutoPosition	= (REAL) (TrfOutPos[4]);
		(*pAxes)[AXIS_C].Input.Parameter.AutoPosition	= (REAL) (TrfOutPos[5]);

		(*pAxes)[AXIS_X].Input.Parameter.HomePosition	= (REAL) (TrfOutPos[0]);
		(*pAxes)[AXIS_Y].Input.Parameter.HomePosition	= (REAL) (TrfOutPos[1]);
		(*pAxes)[AXIS_Z].Input.Parameter.HomePosition	= (REAL) (TrfOutPos[2]);
		(*pAxes)[AXIS_A].Input.Parameter.HomePosition	= (REAL) (TrfOutPos[3]);
		(*pAxes)[AXIS_B].Input.Parameter.HomePosition	= (REAL) (TrfOutPos[4]);
		(*pAxes)[AXIS_C].Input.Parameter.HomePosition	= (REAL) (TrfOutPos[5]);
		
		(*pAxes)[AXIS_Q1].Output.Monitor.DecoupledPosition = (*pAxes)[AXIS_Q1].Output.Monitor.Position;
		(*pAxes)[AXIS_Q2].Output.Monitor.DecoupledPosition = (*pAxes)[AXIS_Q2].Output.Monitor.Position;
		(*pAxes)[AXIS_Q3].Output.Monitor.DecoupledPosition = (*pAxes)[AXIS_Q3].Output.Monitor.Position;
		(*pAxes)[AXIS_Q4].Output.Monitor.DecoupledPosition = (*pAxes)[AXIS_Q4].Output.Monitor.Position;
		(*pAxes)[AXIS_Q5].Output.Monitor.DecoupledPosition = (*pAxes)[AXIS_Q5].Output.Monitor.Position - (*pAxes)[AXIS_Q4].Output.Monitor.Position * HmiRetain.HmiRobot.Coupling[0].Coefficient * ((LREAL) HmiRetain.HmiRobot.Coupling[0].Enable) ;
		(*pAxes)[AXIS_Q6].Output.Monitor.DecoupledPosition = (*pAxes)[AXIS_Q6].Output.Monitor.Position - (*pAxes)[AXIS_Q5].Output.Monitor.Position * HmiRetain.HmiRobot.Coupling[1].Coefficient * ((LREAL) HmiRetain.HmiRobot.Coupling[1].Enable) 
			- (*pAxes)[AXIS_Q4].Output.Monitor.Position * HmiRetain.HmiRobot.Coupling[2].Coefficient * ((LREAL) HmiRetain.HmiRobot.Coupling[2].Enable);

		SimPosVisu[0]	=	(*pAxes)[AXIS_Q1].Output.Monitor.DecoupledPosition;
		SimPosVisu[1]	=	(*pAxes)[AXIS_Q2].Output.Monitor.DecoupledPosition;
		SimPosVisu[2]	=	(*pAxes)[AXIS_Q3].Output.Monitor.DecoupledPosition;
		SimPosVisu[3]	=	(*pAxes)[AXIS_Q4].Output.Monitor.DecoupledPosition;
		SimPosVisu[4]	=	(*pAxes)[AXIS_Q5].Output.Monitor.DecoupledPosition;
		SimPosVisu[5]	=	(*pAxes)[AXIS_Q6].Output.Monitor.DecoupledPosition;
	}
	
}
