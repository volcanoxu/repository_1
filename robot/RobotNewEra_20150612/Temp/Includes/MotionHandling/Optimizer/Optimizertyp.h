/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_16_
#define _BUR_1479044160_16_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct ARNC0FILEMONENTRY_typ
{	unsigned long name;
	unsigned long path_name;
	unsigned long dir_name;
	unsigned long device_name;
	unsigned long prog_nr;
	unsigned long storage_type;
	unsigned long time_stamp;
	plcbit precompiled_lcf;
	unsigned char NOT_USE_1[3];
	unsigned long next;
} ARNC0FILEMONENTRY_typ;

typedef struct ARNC0FILEMONBASIC_typ
{	plcstring name[32];
	unsigned long prog_nr;
	unsigned long storage_type;
} ARNC0FILEMONBASIC_typ;

typedef struct ARNC0FILEMONACCESS_typ
{	plcbit valid;
	unsigned char NOT_USE_1[3];
	unsigned long first;
} ARNC0FILEMONACCESS_typ;

typedef struct ARNC0FILEMON_typ
{	unsigned long set_offset;
	unsigned long offset;
	struct ARNC0FILEMONBASIC_typ file[32];
	struct ARNC0FILEMONACCESS_typ direct_access;
	plcbit handshake;
	unsigned char NOT_USE_1[3];
} ARNC0FILEMON_typ;

typedef struct ARNC0EXTWMCOL_typ
{	unsigned long result;
	unsigned long index1;
	unsigned long shape1;
} ARNC0EXTWMCOL_typ;

typedef struct ARNC0EXTWM_typ
{	double joint_position[12];
	double xyz_position[3];
	double D_FULL[6];
	double local_frame[6];
	struct ARNC0EXTWMCOL_typ collision;
} ARNC0EXTWM_typ;

typedef struct OPTMOT_SEG_CONFIG_typ
{	double distance;
	double increase_num_seg_from_radius;
	double increase_num_seg_orient_factor;
	unsigned long G126_num_seg;
	unsigned long G126_num_seg_PTP_Interp;
} OPTMOT_SEG_CONFIG_typ;

typedef struct OPTMOT_AXES_typ
{	unsigned long ax_count;
	unsigned char ax_index[15];
	unsigned char NOT_USE_1;
	double ax_factor[15];
} OPTMOT_AXES_typ;

typedef struct OPTMOT_PATHDEF_typ
{	unsigned short type;
	unsigned short ax_count;
	unsigned char ax_index[15];
	unsigned char NOT_USE_1;
	double ax_factor[15];
} OPTMOT_PATHDEF_typ;

typedef struct OPTMOT_TRF_VAR_INSTANCES_typ
{	unsigned long trf_var_ip;
	unsigned long trf_var_ip_wm;
	unsigned long trf_var_pp1;
	unsigned long trf_var_pp2;
	unsigned long trf_var_bgen;
} OPTMOT_TRF_VAR_INSTANCES_typ;

typedef struct OPTMOT_ACCESS_POINTS_typ
{	unsigned long pp_context;
	unsigned long wm_function;
	unsigned long address_debug_data;
	struct OPTMOT_TRF_VAR_INSTANCES_typ trf_var_instances;
} OPTMOT_ACCESS_POINTS_typ;

typedef struct OPTMOT_INTERNAL_typ
{	unsigned long buffer_nc_block;
	unsigned long buffer_geometric_data;
	unsigned char disable_optmot_for_channel;
	unsigned char Ts_multiple;
	unsigned char linear_feed;
	unsigned char bypass_optmot;
	unsigned long addr_dyn_model;
	unsigned short der_num_poly_points;
	unsigned short geometric_pos_filter;
	unsigned short buffer_level_lookahead;
	unsigned short G220_reduce_to_max_in_buffer;
	double sigma_diff_compute;
	double max_angle;
	struct OPTMOT_ACCESS_POINTS_typ access_points;
	double reserve1[10];
	signed long reserve2[10];
} OPTMOT_INTERNAL_typ;

typedef struct OPTMOT_LIMITS_typ
{	double v_joint_min[15];
	double v_joint_max[15];
	double a_joint_min[15];
	double a_joint_max[15];
	double j_joint_min[15];
	double j_joint_max[15];
	double torque_min[15];
	double torque_max[15];
	unsigned long torque_limits_in_generator_mode;
	double torque_gen_factor_min[15];
	double torque_gen_factor_max[15];
	double v_path_min[32];
	double v_path_max[32];
	double a_path_min[32];
	double a_path_max[32];
	double j_path_min[32];
	double j_path_max[32];
} OPTMOT_LIMITS_typ;

typedef struct OPTMOT_ACTIVE_LIMIT_typ
{	unsigned char type;
	unsigned char source;
	signed char min_max;
	unsigned char index;
} OPTMOT_ACTIVE_LIMIT_typ;

typedef struct OPTMOT_MONITOR_typ
{	double s_joint[15];
	double v_joint[15];
	double a_joint[15];
	double j_joint[15];
	double feed_forward_torque[15];
	double v_path[32];
	struct OPTMOT_ACTIVE_LIMIT_typ active_limit;
	unsigned short data_valid;
	unsigned short fill_level_lookahead;
	unsigned long reserve[2];
} OPTMOT_MONITOR_typ;

typedef struct OPTMOT_COND_STOP_typ
{	unsigned short active;
	unsigned short call_stop_internal;
	unsigned long identifier;
	unsigned long select_overlapped_identifier;
	unsigned long select_identifier_stop_internal;
} OPTMOT_COND_STOP_typ;

typedef struct OPTMOT_COND_STOP_OPTMOT_typ
{	unsigned long identifier_aktiv;
	unsigned long identifier_fulfilled;
} OPTMOT_COND_STOP_OPTMOT_typ;

typedef struct OPTMOT_STOPPING_typ
{	unsigned short G126_skip_if_stop;
	unsigned short trajectory;
	struct OPTMOT_COND_STOP_typ conditional_stop;
	struct OPTMOT_COND_STOP_OPTMOT_typ conditional_stop_optmot;
} OPTMOT_STOPPING_typ;

typedef struct OPTMOT_PATH_typ
{	double G126_skip_smaller_radius;
	unsigned long G126_round_whole_line;
	unsigned long count;
	struct OPTMOT_PATHDEF_typ definition[32];
	struct OPTMOT_STOPPING_typ stopping;
	unsigned long reserve1[171];
} OPTMOT_PATH_typ;

typedef struct OPTMOT_CONFIG_typ
{	struct OPTMOT_AXES_typ axes;
	struct OPTMOT_PATH_typ path;
	struct OPTMOT_LIMITS_typ limits[32];
	struct OPTMOT_SEG_CONFIG_typ segmentation;
	struct OPTMOT_MONITOR_typ monitor;
	struct OPTMOT_INTERNAL_typ internals;
} OPTMOT_CONFIG_typ;

typedef struct OPTMOT_MONITOR_ADVANCED_typ
{	double s_joint[15];
	double v_joint[15];
	double a_joint[15];
	double j_joint[15];
	double feed_forward_torque[15];
	double v_path[32];
	struct OPTMOT_ACTIVE_LIMIT_typ active_limit;
	unsigned short data_valid;
	unsigned short fill_level_lookahead;
	unsigned short tracking_active;
	unsigned short tracking_synch;
	unsigned short tracking_index;
	unsigned short reserve;
} OPTMOT_MONITOR_ADVANCED_typ;

typedef struct OPTMOT_TRACKING_ORIENTATION_typ
{	double phi;
	double theta;
	double psi;
} OPTMOT_TRACKING_ORIENTATION_typ;

typedef struct OPTMOT_TRACKING_ORIENT_PARAM_typ
{	unsigned long measure;
	unsigned long angles_type;
} OPTMOT_TRACKING_ORIENT_PARAM_typ;

typedef struct OPTMOT_TRACKING_LIMITS_typ
{	double maxVelocity;
} OPTMOT_TRACKING_LIMITS_typ;

typedef struct OPTMOT_TRACKING_CYCLIC_typ
{	double position;
	double velocity;
} OPTMOT_TRACKING_CYCLIC_typ;

typedef struct OPTMOT_TRACKING_CONVEYOR_typ
{	struct OPTMOT_TRACKING_LIMITS_typ limits;
	struct OPTMOT_TRACKING_ORIENTATION_typ orientation;
	struct OPTMOT_TRACKING_CYCLIC_typ cyclicData;
} OPTMOT_TRACKING_CONVEYOR_typ;

typedef struct OPTMOT_TRACKING_CONVEYORDATA_typ
{	struct OPTMOT_TRACKING_ORIENT_PARAM_typ orientationParameter;
	struct OPTMOT_TRACKING_CONVEYOR_typ conveyor[10];
} OPTMOT_TRACKING_CONVEYORDATA_typ;

typedef struct OPTMOT_TRACKING_typ
{	unsigned long enable;
	struct OPTMOT_TRACKING_CONVEYORDATA_typ conveyorData;
	double reserve1[8];
	unsigned long reserve2[32];
} OPTMOT_TRACKING_typ;

typedef struct OPTMOT_PATH_ADVANCED_typ
{	double G126_skip_smaller_radius;
	unsigned long G126_round_whole_line;
	unsigned long count;
	struct OPTMOT_PATHDEF_typ definition[32];
	struct OPTMOT_STOPPING_typ stopping;
	struct OPTMOT_TRACKING_typ tracking;
} OPTMOT_PATH_ADVANCED_typ;

typedef struct OPTMOT_CONFIG_ADVANCED_typ
{	struct OPTMOT_AXES_typ axes;
	struct OPTMOT_PATH_ADVANCED_typ path;
	struct OPTMOT_LIMITS_typ limits[32];
	struct OPTMOT_SEG_CONFIG_typ segmentation;
	struct OPTMOT_MONITOR_ADVANCED_typ monitor;
	struct OPTMOT_INTERNAL_typ internals;
} OPTMOT_CONFIG_ADVANCED_typ;

typedef struct ARNC0PLOTDATA01_typ
{	unsigned long block_ncprog;
	unsigned long line_ncprog;
	unsigned long MpId;
	unsigned long MpSubId;
	unsigned short cmd_code;
	unsigned short reserve;
	unsigned char data[52];
} ARNC0PLOTDATA01_typ;

typedef struct ARNC0PLOTDATA02_typ
{	unsigned long block_ncprog;
	unsigned long line_ncprog;
	unsigned long MpId;
	unsigned long MpSubId;
	unsigned short cmd_code;
	unsigned short reserve;
	unsigned char data[52];
} ARNC0PLOTDATA02_typ;

typedef struct ARNC0PLDMOVE_typ
{	float ep[3];
	float cp[3];
	float radius;
	float v_ncprog;
	unsigned long info;
} ARNC0PLDMOVE_typ;

typedef struct ARNC0PLDMOVE02_typ
{	float ep[3];
	float cp[3];
	float radius;
	float v_ncprog;
	float t;
	float s;
	float s_all;
	unsigned long info;
} ARNC0PLDMOVE02_typ;

typedef struct ARNC0PLDPROGEND_typ
{	float t;
	float s;
	float s_all;
} ARNC0PLDPROGEND_typ;

typedef struct ARNC0PLDPROGSTART_typ
{	unsigned long ProgNumber;
} ARNC0PLDPROGSTART_typ;

typedef struct ARNC0PLDTOOL_typ
{	float radius;
	float length;
	float offset[3];
	unsigned short index;
	unsigned short reserve;
} ARNC0PLDTOOL_typ;

typedef struct ARNC0PLDCSTRF_typ
{	float matrix[9];
	float offset[3];
	unsigned long info;
} ARNC0PLDCSTRF_typ;

typedef struct ARNC0PLDUSER_typ
{	unsigned char data[52];
} ARNC0PLDUSER_typ;

typedef struct ARNC0TRFIODATA_typ
{	unsigned long status;
	double in_pos[12];
	double in_pos_ext[12];
	double out_pos[72];
	unsigned long info[9];
} ARNC0TRFIODATA_typ;

typedef struct ARNC0WSCTRL_typ
{	unsigned long link_index;
	unsigned long link2_index;
	unsigned long area_index;
} ARNC0WSCTRL_typ;

typedef struct ARNC0IP_MON_typ
{	unsigned char enable;
	unsigned char reserve[3];
	unsigned char status_msg[80];
	unsigned char last_error_msg[120];
	unsigned short last_error_code;
	unsigned short loaded_prog_count;
	unsigned char prog_name[80];
	unsigned char ncblock_l2[80];
	unsigned char ncblock_l1[80];
	unsigned char ncblock[80];
	unsigned char ncblock_n1[80];
	unsigned char ncblock_n2[80];
	unsigned long cur_line_num;
	unsigned long cur_block_num;
	unsigned long intern1;
	unsigned long intern2;
	unsigned long intern3;
	unsigned long intern4;
	unsigned long intern5;
	unsigned long breakpoint_count;
	unsigned long ipvar_access_count;
	unsigned long intern6;
	unsigned long intern7;
	unsigned long num_parallel_events;
	unsigned long parallel_cycle_count;
	unsigned char parallel_action_text[12][80];
	unsigned long parallel_eval_count[12];
	unsigned long parallel_exec_count[12];
	unsigned long num_fubs_exec_ipsynch;
	unsigned long num_fubs_exec_ppsynch;
	unsigned char callstack[12][80];
	unsigned long shared_mem_size;
	unsigned long ip_mem_size;
	unsigned long ip_cur_file_mem_size;
	unsigned long sys_free_mem;
	unsigned long intern8;
	unsigned long intern9;
	unsigned long intern10;
	unsigned long intern11;
	unsigned char parallel_enabled;
	unsigned char parallel_rdisable_set;
	unsigned char intern12;
	unsigned char intern13;
	unsigned char cur_prog_file_name[80];
	unsigned char cur_prog_name[80];
} ARNC0IP_MON_typ;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/MotionHandling/Optimizer/Optimizer.typ\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_16_ */

