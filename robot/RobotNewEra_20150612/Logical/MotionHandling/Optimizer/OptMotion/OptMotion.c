/********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Program: OptMotion
 * File: OptMotion.c
 * Author: grubere
 * Created: June 01, 2010
 ********************************************************************
 * Implementation of program OptMotion
 ********************************************************************/

#include <bur/plctypes.h>

#ifdef _DEFAULT_INCLUDES
 #include <AsDefault.h>
#endif

#define PI 3.14159265

void _INIT OptMotionINIT( void )
{
/* ======== Units in [rad], [kg], [m] ======== */
	
	/* ======== Baseparameter for dynamic model ======== */
	
	Par6axATrf[0].base_param1 = 0.000000;
	Par6axATrf[0].base_param2 = 0.000000;
	Par6axATrf[0].base_param3 = 0.000000;
	Par6axATrf[0].base_param4 = 0.000000;
	Par6axATrf[0].base_param5 = 0.000000;
	Par6axATrf[0].base_param6 = 0.000000;
	Par6axATrf[0].base_param7 = 0.000000;
	Par6axATrf[0].base_param8 = 71.983100;
	Par6axATrf[0].base_param9 = 0.000000;
	Par6axATrf[0].base_param10 = 0.000000;
	Par6axATrf[0].base_param11 = 0.000000;
	Par6axATrf[0].base_param12 = 0.000000;
	Par6axATrf[0].base_param13 = 0.000000;
	Par6axATrf[0].base_param14 = 0.000000;
	Par6axATrf[0].base_param15 = 0.000000;
	Par6axATrf[0].base_param16 = -0.469116;
	Par6axATrf[0].base_param17 = 0.000000;
	Par6axATrf[0].base_param18 = 21.356410;
	Par6axATrf[0].base_param19 = -7.126585;
	Par6axATrf[0].base_param20 = -1.513853;
	Par6axATrf[0].base_param21 = 0.987800;
	Par6axATrf[0].base_param22 = 0.256704;
	Par6axATrf[0].base_param23 = 0.000000;
	Par6axATrf[0].base_param24 = 26.658310;
	Par6axATrf[0].base_param25 = 0.000000;
	Par6axATrf[0].base_param26 = 0.000000;
	Par6axATrf[0].base_param27 = 0.000000;
	Par6axATrf[0].base_param28 = 0.000000;
	Par6axATrf[0].base_param29 = 0.000000;
	Par6axATrf[0].base_param30 = 9.741126;
	Par6axATrf[0].base_param31 = 0.000000;
	Par6axATrf[0].base_param32 = -0.064780;
	Par6axATrf[0].base_param33 = -5.490367;
	Par6axATrf[0].base_param34 = 2.568725;
	Par6axATrf[0].base_param35 = -2.032787;
	Par6axATrf[0].base_param36 = 6.458844;
	Par6axATrf[0].base_param37 = 0.000000;
	Par6axATrf[0].base_param38 = 2.981729;
	Par6axATrf[0].base_param39 = 0.000000;
	Par6axATrf[0].base_param40 = 0.000000;
	Par6axATrf[0].base_param41 = 0.000000;
	Par6axATrf[0].base_param42 = 0.000000;
	Par6axATrf[0].base_param43 = 0.000000;
	Par6axATrf[0].base_param44 = 0.000000;
	Par6axATrf[0].base_param45 = -0.481579;
	Par6axATrf[0].base_param46 = 0.382556;
	Par6axATrf[0].base_param47 = -0.772865;
	Par6axATrf[0].base_param48 = 0.234084;
	Par6axATrf[0].base_param49 = 1.289617;
	Par6axATrf[0].base_param50 = 0.000000;
	Par6axATrf[0].base_param51 = 1.014531;
	Par6axATrf[0].base_param52 = 3.947117;
	Par6axATrf[0].base_param53 = 0.000000;
	Par6axATrf[0].base_param54 = 0.000000;
	Par6axATrf[0].base_param55 = 0.000000;
	Par6axATrf[0].base_param56 = 0.000000;
	Par6axATrf[0].base_param57 = 0.000000;
	Par6axATrf[0].base_param58 = 1.674332;
	Par6axATrf[0].base_param59 = 0.000000;
	Par6axATrf[0].base_param60 = 0.099178;
	Par6axATrf[0].base_param61 = 0.705105;
	Par6axATrf[0].base_param62 = 0.213770;
	Par6axATrf[0].base_param63 = -0.109433;
	Par6axATrf[0].base_param64 = 1.254646;
	Par6axATrf[0].base_param65 = 0.000000;
	Par6axATrf[0].base_param66 = 0.465107;
	Par6axATrf[0].base_param67 = 0.000000;
	Par6axATrf[0].base_param68 = 0.000000;
	Par6axATrf[0].base_param69 = 0.000000;
	Par6axATrf[0].base_param70 = 0.000000;
	Par6axATrf[0].base_param71 = 0.000000;
	Par6axATrf[0].base_param72 = 0.000000;
	Par6axATrf[0].base_param73 = -0.037241;
	Par6axATrf[0].base_param74 = -0.029525;
	Par6axATrf[0].base_param75 = -0.194226;
	Par6axATrf[0].base_param76 = 0.010846;
	Par6axATrf[0].base_param77 = -0.003949;
	Par6axATrf[0].base_param78 = 0.000000;
	Par6axATrf[0].base_param79 = -0.150153;
	Par6axATrf[0].base_param80 = 0.103083;
	Par6axATrf[0].base_param81 = 0.000000;
	Par6axATrf[0].base_param82 = 0.000000;
	Par6axATrf[0].base_param83 = 0.000000;
	Par6axATrf[0].base_param84 = 0.000000;
	Par6axATrf[0].base_param85 = 0.000000;
	Par6axATrf[0].base_param86 = 0.000000;
	Par6axATrf[0].base_param87 = 0.000000;
	Par6axATrf[0].base_param88 = 0.000000;
	Par6axATrf[0].base_param89 = 0.000000;
	Par6axATrf[0].base_param90 = 0.000000;
	Par6axATrf[0].base_param91 = 0.000000;
	Par6axATrf[0].base_param92 = 0.000000;
	Par6axATrf[0].base_param93 = 0.000000;
	Par6axATrf[0].base_param94 = 0.000000;
	Par6axATrf[0].base_param95 = 0.000000;
	Par6axATrf[0].base_param96 = 0.000000;
	Par6axATrf[0].base_param97 = 0.000000;
	Par6axATrf[0].base_param98 = 470.100069;
	Par6axATrf[0].base_param99 = 43.620507;
	Par6axATrf[0].base_param100 = 16.966225;
	Par6axATrf[0].base_param101 = 47.740884;
	Par6axATrf[0].base_param102 = 3.974347;
	Par6axATrf[0].base_param103 = 1.926903;
	Par6axATrf[0].base_param104 = 234.410106;
	Par6axATrf[0].base_param105 = 28.334038;
	Par6axATrf[0].base_param106 = 24.160627;
	Par6axATrf[0].base_param107 = 48.112117;
	Par6axATrf[0].base_param108 = 9.985319;
	Par6axATrf[0].base_param109 = 5.056168;
	/* ================================== */ 
			
	/* ======== Static Parameter ======== */
	Par6axATrf[0].a0x = 0;
	Par6axATrf[0].a0y = 0;
	Par6axATrf[0].a0z = 0;
	Par6axATrf[0].a1x = 0.17;
	Par6axATrf[0].a1y = 0.1415;
	Par6axATrf[0].a1z = 0.45;
	Par6axATrf[0].a2x = 0;
	Par6axATrf[0].a2y = 0;
	Par6axATrf[0].a2z = 0.55;
	Par6axATrf[0].a3x = 0.1775;
	Par6axATrf[0].a3y = -0.1415;
	Par6axATrf[0].a3z = 0.09;
	Par6axATrf[0].a4x = 0.4225;
	Par6axATrf[0].a5x = 0.1;
	Par6axATrf[0].iG1 = 147.5;
	Par6axATrf[0].iG2 = 89;
	Par6axATrf[0].iG3 = 89;
	Par6axATrf[0].iG4 = 160.0;
	Par6axATrf[0].iG5 = 67.74;
	Par6axATrf[0].iG6 = 50;
	Par6axATrf[0].g = 9.81;
	/* ================================== */ 

	
/* ======== ax-definition of joint axes ======== */
	
	OptMotConfig.axes.ax_count = 6;
	OptMotConfig.axes.ax_index[0] = 6;
	OptMotConfig.axes.ax_index[1] = 7;
	OptMotConfig.axes.ax_index[2] = 8;
	OptMotConfig.axes.ax_index[3] = 9;
	OptMotConfig.axes.ax_index[4] = 10;
	OptMotConfig.axes.ax_index[5] = 11;
	OptMotConfig.axes.ax_factor[0] = PI/180.0;
	OptMotConfig.axes.ax_factor[1] = PI/180.0;
	OptMotConfig.axes.ax_factor[2] = PI/180.0;
	OptMotConfig.axes.ax_factor[3] = PI/180.0;
	OptMotConfig.axes.ax_factor[4] = PI/180.0;
	OptMotConfig.axes.ax_factor[5] = PI/180.0;
	
/* =================== dynamic limits for joint axes =================== */

	OptMotConfig.limits[0].v_joint_max[0] = 95 * OptMotConfig.axes.ax_factor[0];		
	OptMotConfig.limits[0].v_joint_max[1] = 90 * OptMotConfig.axes.ax_factor[1];		
	OptMotConfig.limits[0].v_joint_max[2] = 90 * OptMotConfig.axes.ax_factor[2];		 
	OptMotConfig.limits[0].v_joint_max[3] = 120 * OptMotConfig.axes.ax_factor[3];		
	OptMotConfig.limits[0].v_joint_max[4] = 120 * OptMotConfig.axes.ax_factor[4];		
	OptMotConfig.limits[0].v_joint_max[5] = 190 * OptMotConfig.axes.ax_factor[5];		
	OptMotConfig.limits[0].v_joint_min[0] = -OptMotConfig.limits[0].v_joint_max[0];
	OptMotConfig.limits[0].v_joint_min[1] = -OptMotConfig.limits[0].v_joint_max[1];
	OptMotConfig.limits[0].v_joint_min[2] = -OptMotConfig.limits[0].v_joint_max[2];
	OptMotConfig.limits[0].v_joint_min[3] = -OptMotConfig.limits[0].v_joint_max[3]; 
	OptMotConfig.limits[0].v_joint_min[4] = -OptMotConfig.limits[0].v_joint_max[4]; 
	OptMotConfig.limits[0].v_joint_min[5] = -OptMotConfig.limits[0].v_joint_max[5]; 

	OptMotConfig.limits[0].a_joint_max[0] = 5 * OptMotConfig.limits[0].v_joint_max[0];
	OptMotConfig.limits[0].a_joint_max[1] = 5 * OptMotConfig.limits[0].v_joint_max[1];
	OptMotConfig.limits[0].a_joint_max[2] = 5 * OptMotConfig.limits[0].v_joint_max[2];
	OptMotConfig.limits[0].a_joint_max[3] = 5 * OptMotConfig.limits[0].v_joint_max[3];  
	OptMotConfig.limits[0].a_joint_max[4] = 5 * OptMotConfig.limits[0].v_joint_max[4];
	OptMotConfig.limits[0].a_joint_max[5] = 5 * OptMotConfig.limits[0].v_joint_max[5];
	OptMotConfig.limits[0].a_joint_min[0] = -OptMotConfig.limits[0].a_joint_max[0];
	OptMotConfig.limits[0].a_joint_min[1] = -OptMotConfig.limits[0].a_joint_max[1];
	OptMotConfig.limits[0].a_joint_min[2] = -OptMotConfig.limits[0].a_joint_max[2];
	OptMotConfig.limits[0].a_joint_min[3] = -OptMotConfig.limits[0].a_joint_max[3];
	OptMotConfig.limits[0].a_joint_min[4] = -OptMotConfig.limits[0].a_joint_max[4];
	OptMotConfig.limits[0].a_joint_min[5] = -OptMotConfig.limits[0].a_joint_max[5];

	OptMotConfig.limits[0].j_joint_max[0] = 20 * OptMotConfig.limits[0].a_joint_max[0];
	OptMotConfig.limits[0].j_joint_max[1] = 40 * OptMotConfig.limits[0].a_joint_max[1];
	OptMotConfig.limits[0].j_joint_max[2] = 40 * OptMotConfig.limits[0].a_joint_max[2];
	OptMotConfig.limits[0].j_joint_max[3] = 40 * OptMotConfig.limits[0].a_joint_max[3];
	OptMotConfig.limits[0].j_joint_max[4] = 40 * OptMotConfig.limits[0].a_joint_max[4];
	OptMotConfig.limits[0].j_joint_max[5] = 40 * OptMotConfig.limits[0].a_joint_max[5];
	OptMotConfig.limits[0].j_joint_min[0] = -OptMotConfig.limits[0].j_joint_max[0];
	OptMotConfig.limits[0].j_joint_min[1] = -OptMotConfig.limits[0].j_joint_max[1];
	OptMotConfig.limits[0].j_joint_min[2] = -OptMotConfig.limits[0].j_joint_max[2];
	OptMotConfig.limits[0].j_joint_min[3] = -OptMotConfig.limits[0].j_joint_max[3];
	OptMotConfig.limits[0].j_joint_min[4] = -OptMotConfig.limits[0].j_joint_max[4];
	OptMotConfig.limits[0].j_joint_min[5] = -OptMotConfig.limits[0].j_joint_max[5];

	OptMotConfig.limits[0].torque_max[0] = 50.5;
	OptMotConfig.limits[0].torque_max[1] = 70.4;
	OptMotConfig.limits[0].torque_max[2] = 30.42;
	OptMotConfig.limits[0].torque_max[3] = 10.35;
	OptMotConfig.limits[0].torque_max[4] = 11.68;
	OptMotConfig.limits[0].torque_max[5] = 11.68;
	OptMotConfig.limits[0].torque_min[0] = -OptMotConfig.limits[0].torque_max[0];
	OptMotConfig.limits[0].torque_min[1] = -OptMotConfig.limits[0].torque_max[1];
	OptMotConfig.limits[0].torque_min[2] = -OptMotConfig.limits[0].torque_max[2];
	OptMotConfig.limits[0].torque_min[3] = -OptMotConfig.limits[0].torque_max[3];
	OptMotConfig.limits[0].torque_min[4] = -OptMotConfig.limits[0].torque_max[4];
	OptMotConfig.limits[0].torque_min[5] = -OptMotConfig.limits[0].torque_max[5];
	
	/* Limits for path definition 0 */
	OptMotConfig.limits[0].v_path_max[0] = 4000;
	OptMotConfig.limits[0].v_path_min[0] = -4000;
	OptMotConfig.limits[0].a_path_max[0] = 100000;
	OptMotConfig.limits[0].a_path_min[0] = -OptMotConfig.limits[0].a_path_max[0];
	OptMotConfig.limits[0].j_path_max[0] = 500000;
	OptMotConfig.limits[0].j_path_min[0] = -OptMotConfig.limits[0].j_path_max[0];
	
	/* Limits for path definition 1 */
	OptMotConfig.limits[0].v_path_max[1] = 2000;
	OptMotConfig.limits[0].v_path_min[1] = -2000;
	OptMotConfig.limits[0].a_path_max[1] = 100000;
	OptMotConfig.limits[0].a_path_min[1] = -OptMotConfig.limits[0].a_path_max[0];
	OptMotConfig.limits[0].j_path_max[1] = 1000000;
	OptMotConfig.limits[0].j_path_min[1] = -OptMotConfig.limits[0].j_path_max[0];
	
	/* Limits for path definition 2 */
	OptMotConfig.limits[0].v_path_max[2] = 2000;
	OptMotConfig.limits[0].v_path_min[2] = -2000;
	OptMotConfig.limits[0].a_path_max[2] = 100000;
	OptMotConfig.limits[0].a_path_min[2] = -OptMotConfig.limits[0].a_path_max[0];
	OptMotConfig.limits[0].j_path_max[2] = 1000000;
	OptMotConfig.limits[0].j_path_min[2] = -OptMotConfig.limits[0].j_path_max[0];	
	
	OptMotConfig.internals.Ts_multiple = 6.0;
	OptMotConfig.internals.buffer_nc_block = 400;
	OptMotConfig.segmentation.distance = 1.0;   	
	
	
	/* =================== path definitions =================== */

	OptMotConfig.path.count = 3;
	
	// Path definition 0 --> must be used for TRACKING
	// v_path = sqrt( (v_X)^2 + (v_Y)^2 + (v_Z)^2 )
	// Units --> [v_path] = mm/s
	OptMotConfig.path.definition[0].type = 0;	
	OptMotConfig.path.definition[0].ax_count = 6;
	OptMotConfig.path.definition[0].ax_index[0] = 0;
	OptMotConfig.path.definition[0].ax_index[1] = 1;
	OptMotConfig.path.definition[0].ax_index[2] = 2;
	OptMotConfig.path.definition[0].ax_index[3] = 3;
	OptMotConfig.path.definition[0].ax_index[4] = 4;
	OptMotConfig.path.definition[0].ax_index[5] = 5;
	OptMotConfig.path.definition[0].ax_factor[0] = 1;	
	OptMotConfig.path.definition[0].ax_factor[1] = 1;	
	OptMotConfig.path.definition[0].ax_factor[2] = 1;
	OptMotConfig.path.definition[0].ax_factor[3] = 1;	
	OptMotConfig.path.definition[0].ax_factor[4] = 1;	
	OptMotConfig.path.definition[0].ax_factor[5] = 1;

	// Path definition 1 --> for orientation movements
	// v_path = omega_path = f(v_A, v_B, v_C)
	// Units --> [v_path] = ?s
	OptMotConfig.path.definition[1].type = 1;	
	OptMotConfig.path.definition[1].ax_count = 3;
	OptMotConfig.path.definition[1].ax_index[0] = 3;
	OptMotConfig.path.definition[1].ax_index[1] = 4;
	OptMotConfig.path.definition[1].ax_index[2] = 5;
	OptMotConfig.path.definition[1].ax_factor[0] = 1;	
	OptMotConfig.path.definition[1].ax_factor[1] = 1;	
	OptMotConfig.path.definition[1].ax_factor[2] = 1;	

	// Path definition 2 --> for PTP movements
	// v_path = sqrt( (v_Q1)^2 + (v_Q2)^2 + (v_Q3)^2 + (v_Q4)^2 + (v_Q5)^2 + (v_Q6)^2 )
	// Units with ax_factor[] = 1: --> [v_path] = ?s 
	OptMotConfig.path.definition[2].type = 0;	
	OptMotConfig.path.definition[2].ax_count = 6;
	OptMotConfig.path.definition[2].ax_index[0] = 6;
	OptMotConfig.path.definition[2].ax_index[1] = 7;
	OptMotConfig.path.definition[2].ax_index[2] = 8;
	OptMotConfig.path.definition[2].ax_index[3] = 9;
	OptMotConfig.path.definition[2].ax_index[4] = 10;
	OptMotConfig.path.definition[2].ax_index[5] = 11;
	OptMotConfig.path.definition[2].ax_factor[0] = 1;	
	OptMotConfig.path.definition[2].ax_factor[1] = 1;	
	OptMotConfig.path.definition[2].ax_factor[2] = 1;	
	OptMotConfig.path.definition[2].ax_factor[3] = 1;	
	OptMotConfig.path.definition[2].ax_factor[4] = 1;	
	OptMotConfig.path.definition[2].ax_factor[5] = 1;	

	
	
	/* =================== tracking configuration =================== */
	
	OptMotConfig.path.tracking.enable = 0;
	OptMotConfig.path.tracking.conveyorData.orientationParameter.angles_type = TRF_CARDAN_XYZ_ANGLES;
	OptMotConfig.path.tracking.conveyorData.orientationParameter.measure = TRF_DEGREES;
	
	//first conveyor
	OptMotConfig.path.tracking.conveyorData.conveyor[0].limits.maxVelocity = 100;
	OptMotConfig.path.tracking.conveyorData.conveyor[0].orientation.phi = 0;
	OptMotConfig.path.tracking.conveyorData.conveyor[0].orientation.theta = 0;
	OptMotConfig.path.tracking.conveyorData.conveyor[0].orientation.psi = 90;
	
}

void _CYCLIC OptMotionCYCLIC( void )
{	
	
}
