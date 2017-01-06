(********************************************************************
 * COPYRIGHT -- Microsoft
 ********************************************************************
 * Package: Optimizer
 * File: Optimizer.typ
 * Author: renj
 * Created: April 24, 2015
 ********************************************************************
 * Data types of package Optimizer
 ********************************************************************)

TYPE
	ARNC0FILEMONENTRY_typ : 	STRUCT 
		name : UDINT; (* File name (address) *)
		path_name : UDINT; (* Full path file name (address) *)
		dir_name : UDINT; (* Directory name (address) *)
		device_name : UDINT; (* Device name (address) *)
		prog_nr : UDINT; (* Number of loaded program *)
		storage_type : UDINT; (* Storage type: 1-file, 2-module *)
		time_stamp : UDINT; (* File time stamp *)
		precompiled_lcf : BOOL; (* Loaded file is laguage configuration file *)
		NOT_USE_1 : ARRAY[0..2]OF USINT;
		next : UDINT; (* Next element in file list *)
	END_STRUCT;
	ARNC0FILEMONBASIC_typ : 	STRUCT 
		name : STRING[31]; (* Name of loaded file *)
		prog_nr : UDINT; (* Number of loaded program *)
		storage_type : UDINT; (* Storage type: 1-file, 2-module *)
	END_STRUCT;
	ARNC0FILEMONACCESS_typ : 	STRUCT 
		valid : BOOL; (* Extended data can be accessed *)
		NOT_USE_1 : ARRAY[0..2]OF USINT;
		first : UDINT; (* Begin of the file list *)
	END_STRUCT;
	ARNC0FILEMON_typ : 	STRUCT 
		set_offset : UDINT; (* Required file offset *)
		offset : UDINT; (* Offset of displayed files *)
		file : ARRAY[0..31]OF ARNC0FILEMONBASIC_typ; (* File monitor *)
		direct_access : ARNC0FILEMONACCESS_typ; (* Access to extended data *)
		handshake : BOOL; (* Set to update data *)
		NOT_USE_1 : ARRAY[0..2]OF USINT;
	END_STRUCT;
	ARNC0EXTWMCOL_typ : 	STRUCT 
		result : UDINT; (* WM result *)
		index1 : UDINT; (* Index of 1st found colliding area *)
		shape1 : UDINT; (* Shape of colliding area: 1-block, 2-hspace *)
	END_STRUCT;
	ARNC0EXTWM_typ : 	STRUCT 
		joint_position : ARRAY[0..11]OF LREAL; (* Joint coordinate *)
		xyz_position : ARRAY[0..2]OF LREAL; (* TCP position if joints cannot be used *)
		D_FULL : ARRAY[0..5]OF LREAL; (* General tool *)
		local_frame : ARRAY[0..5]OF LREAL; (* Local (base) frame *)
		collision : ARNC0EXTWMCOL_typ; (* Additional information about collisions *)
	END_STRUCT;
	OPTMOT_SEG_CONFIG_typ : 	STRUCT 
		distance : LREAL; (* Length of the path segments in CNC units *)
		increase_num_seg_from_radius : LREAL; (* Finer segmentation of circles with smaller radius *)
		increase_num_seg_orient_factor : LREAL; (* Finer segmentation of orientation change *)
		G126_num_seg : UDINT; (* Finer segmentation of rounding edge *)
		G126_num_seg_PTP_Interp : UDINT; (* Finer segmentation of rounding edge *)
	END_STRUCT;
	OPTMOT_AXES_typ : 	STRUCT 
		ax_count : UDINT; (* Number of axes for optimization *)
		ax_index : ARRAY[0..14]OF USINT; (* Index of CNC-axis *)
		NOT_USE_1 : USINT;
		ax_factor : ARRAY[0..14]OF LREAL; (* Scaling factor *)
	END_STRUCT;
	OPTMOT_PATHDEF_typ : 	STRUCT 
		type : UINT; (* Type of path definition *)
		ax_count : UINT; (* Number of axes for path computation *)
		ax_index : ARRAY[0..14]OF USINT; (* Index of CNC-axis *)
		NOT_USE_1 : USINT;
		ax_factor : ARRAY[0..14]OF LREAL; (* Scaling factor *)
	END_STRUCT;
	OPTMOT_TRF_VAR_INSTANCES_typ : 	STRUCT 
		trf_var_ip : UDINT; (* For developers only *)
		trf_var_ip_wm : UDINT; (* For developers only *)
		trf_var_pp1 : UDINT; (* For developers only *)
		trf_var_pp2 : UDINT; (* For developers only *)
		trf_var_bgen : UDINT; (* For developers only *)
	END_STRUCT;
	OPTMOT_ACCESS_POINTS_typ : 	STRUCT 
		pp_context : UDINT; (* Access of data for external workspace monitoring *)
		wm_function : UDINT; (* Access for external call of workspace monitoring *)
		address_debug_data : UDINT; (* For developers only *)
		trf_var_instances : OPTMOT_TRF_VAR_INSTANCES_typ; (* Structure of access points for developers only *)
	END_STRUCT;
	OPTMOT_INTERNAL_typ : 	STRUCT 
		buffer_nc_block : UDINT; (* Size of a buffer containing NC-blocks *)
		buffer_geometric_data : UDINT; (* Size of a buffer containing geometric data of the path *)
		disable_optmot_for_channel : USINT; (* Deactivation of optimizer for current CNC channel *)
		Ts_multiple : USINT; (* Sample time of trajectory planer *)
		linear_feed : USINT; (* Behavior of path acceleration *)
		bypass_optmot : USINT; (* Simulation mode *)
		addr_dyn_model : UDINT; (* Pointer to the dynamic model *)
		der_num_poly_points : UINT; (* Number of segments used for derivatives computation *)
		geometric_pos_filter : UINT; (* Number of segments used for position filter *)
		buffer_level_lookahead : UINT; (* Minimal fill level of lookahead buffer *)
		G220_reduce_to_max_in_buffer : UINT; (* Reduction of G220 time *)
		sigma_diff_compute : LREAL; (* Lookahead of segmentation *)
		max_angle : LREAL; (* Angle to detect stops on path *)
		access_points : OPTMOT_ACCESS_POINTS_typ; (* Structure of access points for developers only *)
		reserve1 : ARRAY[0..9]OF LREAL; (* For developers only *)
		reserve2 : ARRAY[0..9]OF DINT; (* For developers only *)
	END_STRUCT;
	OPTMOT_LIMITS_typ : 	STRUCT 
		v_joint_min : ARRAY[0..14]OF LREAL; (* Minimal velocity limits of the joint axes *)
		v_joint_max : ARRAY[0..14]OF LREAL; (* Maximal velocity limits of the joint axes *)
		a_joint_min : ARRAY[0..14]OF LREAL; (* Minimal acceleration limits of the joint axes *)
		a_joint_max : ARRAY[0..14]OF LREAL; (* Maximal acceleration limits of the joint axes *)
		j_joint_min : ARRAY[0..14]OF LREAL; (* Minimal jerk limits of the joint axes *)
		j_joint_max : ARRAY[0..14]OF LREAL; (* Maximal jerk limits of the joint axes *)
		torque_min : ARRAY[0..14]OF LREAL; (* Minimal torque limits of the joint axes *)
		torque_max : ARRAY[0..14]OF LREAL; (* Maximal torque limits of the joint axes *)
		torque_limits_in_generator_mode : UDINT; (* Activation of generator mode *)
		torque_gen_factor_min : ARRAY[0..14]OF LREAL; (* Factor for minimal torque limit in generator mode *)
		torque_gen_factor_max : ARRAY[0..14]OF LREAL; (* Factor for maximal torque limit in generator mode *)
		v_path_min : ARRAY[0..31]OF LREAL; (* Minimal velocity limits of the path definitions *)
		v_path_max : ARRAY[0..31]OF LREAL; (* Maximal velocity limits of the path definitions *)
		a_path_min : ARRAY[0..31]OF LREAL; (* Minimal acceleration limits of the path definitions *)
		a_path_max : ARRAY[0..31]OF LREAL; (* Maximal acceleration limits of the path definitions *)
		j_path_min : ARRAY[0..31]OF LREAL; (* Minimal jerk limits of the path definitions *)
		j_path_max : ARRAY[0..31]OF LREAL; (* Maximal jerk limits of the path definitions *)
	END_STRUCT;
	OPTMOT_ACTIVE_LIMIT_typ : 	STRUCT 
		type : USINT; (* Type of the active limit *)
		source : USINT; (* Source of the active limit *)
		min_max : SINT; (* Positive or negative range of the active limit *)
		index : USINT; (* Index of the axis or path definition of the active limit *)
	END_STRUCT;
	OPTMOT_MONITOR_typ : 	STRUCT 
		s_joint : ARRAY[0..14]OF LREAL; (* Cyclical joint position in CNC units *)
		v_joint : ARRAY[0..14]OF LREAL; (* Cyclical joint velocity in CNC units *)
		a_joint : ARRAY[0..14]OF LREAL; (* Cyclical joint acceleration in CNC units *)
		j_joint : ARRAY[0..14]OF LREAL; (* Cyclical joint jerk in CNC units *)
		feed_forward_torque : ARRAY[0..14]OF LREAL; (* Cyclical joint torque/force *)
		v_path : ARRAY[0..31]OF LREAL; (* Cyclical path velocity in CNC units *)
		active_limit : OPTMOT_ACTIVE_LIMIT_typ; (* Structure of information about current limitation *)
		data_valid : UINT; (* Feed forward data is valid *)
		fill_level_lookahead : UINT; (* Fill level of lookahead buffer *)
		reserve : ARRAY[0..1]OF UDINT;
	END_STRUCT;
	OPTMOT_COND_STOP_typ : 	STRUCT 
		active : UINT; (* Conditional stop active *)
		call_stop_internal : UINT; (* Internal execution of the conditional stop *)
		identifier : UDINT; (* Identifier of the conditional stop *)
		select_overlapped_identifier : UDINT; (* Selection of identifier in overlapping conditional stops *)
		select_identifier_stop_internal : UDINT; (* Selection of identifier if conditional stop is executed internally *)
	END_STRUCT;
	OPTMOT_COND_STOP_OPTMOT_typ : 	STRUCT 
		identifier_aktiv : UDINT; (* Output of aktive identifier *)
		identifier_fulfilled : UDINT; (* Input of fulfilled identifier *)
	END_STRUCT;
	OPTMOT_STOPPING_typ : 	STRUCT 
		G126_skip_if_stop : UINT; (* Skip G126 if a stop on path occurs *)
		trajectory : UINT; (* Definition of stopping trajectory *)
		conditional_stop : OPTMOT_COND_STOP_typ; (* Structure of conditional stop *)
		conditional_stop_optmot : OPTMOT_COND_STOP_OPTMOT_typ; (* Structure of optmot synchronal conditional stop *)
	END_STRUCT;
	OPTMOT_PATH_typ : 	STRUCT 
		G126_skip_smaller_radius : LREAL; (* Skip G126 if programmed radius is smaller *)
		G126_round_whole_line : UDINT; (* Round whole first/last line *)
		count : UDINT; (* Number of path definitions *)
		definition : ARRAY[0..31]OF OPTMOT_PATHDEF_typ; (* Structure of path definitions parameters *)
		stopping : OPTMOT_STOPPING_typ; (* Structure of stopping parameters *)
		reserve1 : ARRAY[0..170]OF UDINT;
	END_STRUCT;
	OPTMOT_CONFIG_typ : 	STRUCT 
		axes : OPTMOT_AXES_typ; (* Structure of joint axes parameters *)
		path : OPTMOT_PATH_typ; (* Structure of path parameters *)
		limits : ARRAY[0..31]OF OPTMOT_LIMITS_typ; (* Structure of limit parameters *)
		segmentation : OPTMOT_SEG_CONFIG_typ; (* Structure of segmentation parameters *)
		monitor : OPTMOT_MONITOR_typ; (* Structure of monitor parameters *)
		internals : OPTMOT_INTERNAL_typ; (* Structure of internal parameters *)
	END_STRUCT;
	OPTMOT_MONITOR_ADVANCED_typ : 	STRUCT 
		s_joint : ARRAY[0..14]OF LREAL; (* Cyclical joint position in CNC units *)
		v_joint : ARRAY[0..14]OF LREAL; (* Cyclical joint velocity in CNC units *)
		a_joint : ARRAY[0..14]OF LREAL; (* Cyclical joint acceleration in CNC units *)
		j_joint : ARRAY[0..14]OF LREAL; (* Cyclical joint jerk in CNC units *)
		feed_forward_torque : ARRAY[0..14]OF LREAL; (* Cyclical joint torque/force *)
		v_path : ARRAY[0..31]OF LREAL; (* Cyclical path velocity in CNC units *)
		active_limit : OPTMOT_ACTIVE_LIMIT_typ; (* Structure of information about current limitation *)
		data_valid : UINT; (* Feed forward data is valid *)
		fill_level_lookahead : UINT; (* Fill level of lookahead buffer *)
		tracking_active : UINT; (* Tracking active *)
		tracking_synch : UINT; (* Robot synchronized with conveyor *)
		tracking_index : UINT; (* Active tracking index *)
		reserve : UINT;
	END_STRUCT;
	OPTMOT_TRACKING_ORIENTATION_typ : 	STRUCT 
		phi : LREAL; (* Phi-component of a rotation *)
		theta : LREAL; (* Theta-component of a rotation *)
		psi : LREAL; (* Psi-component of a rotation *)
	END_STRUCT;
	OPTMOT_TRACKING_ORIENT_PARAM_typ : 	STRUCT 
		measure : UDINT; (* Unit of measurement of the angles *)
		angles_type : UDINT; (* Angles type *)
	END_STRUCT;
	OPTMOT_TRACKING_LIMITS_typ : 	STRUCT 
		maxVelocity : LREAL; (* Maximal velocity of the conveyor belt *)
	END_STRUCT;
	OPTMOT_TRACKING_CYCLIC_typ : 	STRUCT 
		position : LREAL; (* Cyclical position of the conveyor belt *)
		velocity : LREAL; (* Cyclical velocity of the conveyor belt *)
	END_STRUCT;
	OPTMOT_TRACKING_CONVEYOR_typ : 	STRUCT 
		limits : OPTMOT_TRACKING_LIMITS_typ; (* Structure of conveyor limits *)
		orientation : OPTMOT_TRACKING_ORIENTATION_typ; (* Structure of orientation between global basic frame and conveyor belt frame *)
		cyclicData : OPTMOT_TRACKING_CYCLIC_typ; (* Structure of cyclic data *)
	END_STRUCT;
	OPTMOT_TRACKING_CONVEYORDATA_typ : 	STRUCT 
		orientationParameter : OPTMOT_TRACKING_ORIENT_PARAM_typ; (* Structure of general orientation parameters *)
		conveyor : ARRAY[0..9]OF OPTMOT_TRACKING_CONVEYOR_typ; (* Structure of conveyor belt data *)
	END_STRUCT;
	OPTMOT_TRACKING_typ : 	STRUCT 
		enable : UDINT; (* Enable tracking *)
		conveyorData : OPTMOT_TRACKING_CONVEYORDATA_typ; (* Structure of conveyor belt tracking *)
		reserve1 : ARRAY[0..7]OF LREAL; (* For developers only *)
		reserve2 : ARRAY[0..31]OF UDINT; (* For developers only *)
	END_STRUCT;
	OPTMOT_PATH_ADVANCED_typ : 	STRUCT 
		G126_skip_smaller_radius : LREAL; (* Skip G126 if programmed radius is smaller *)
		G126_round_whole_line : UDINT; (* Round whole first/last line *)
		count : UDINT; (* Number of path definitions *)
		definition : ARRAY[0..31]OF OPTMOT_PATHDEF_typ; (* Structure of path definitions parameters *)
		stopping : OPTMOT_STOPPING_typ; (* Structure of stopping parameters *)
		tracking : OPTMOT_TRACKING_typ; (* Structure of tracking parameters *)
	END_STRUCT;
	OPTMOT_CONFIG_ADVANCED_typ : 	STRUCT 
		axes : OPTMOT_AXES_typ; (* Structure of joint axes parameters *)
		path : OPTMOT_PATH_ADVANCED_typ; (* Structure of path parameters *)
		limits : ARRAY[0..31]OF OPTMOT_LIMITS_typ; (* Structure of limit parameters *)
		segmentation : OPTMOT_SEG_CONFIG_typ; (* Structure of segmentation parameters *)
		monitor : OPTMOT_MONITOR_ADVANCED_typ; (* Structure of monitor parameters *)
		internals : OPTMOT_INTERNAL_typ; (* Structure of internal parameters *)
	END_STRUCT;
	ARNC0PLOTDATA01_typ : 	STRUCT 
		block_ncprog : UDINT; (* Block number *)
		line_ncprog : UDINT; (* Line number *)
		MpId : UDINT; (* Motion packet ident *)
		MpSubId : UDINT; (* Motion packet subident *)
		cmd_code : UINT; (* Command *)
		reserve : UINT; (* don't use *)
		data : ARRAY[0..51]OF USINT; (* Data *)
	END_STRUCT;
	ARNC0PLOTDATA02_typ : 	STRUCT 
		block_ncprog : UDINT; (* Block number *)
		line_ncprog : UDINT; (* Line number *)
		MpId : UDINT; (* Motion packet ident *)
		MpSubId : UDINT; (* Motion packet subident *)
		cmd_code : UINT; (* Command *)
		reserve : UINT; (* don't use *)
		data : ARRAY[0..51]OF USINT; (* Data *)
	END_STRUCT;
	ARNC0PLDMOVE_typ : 	STRUCT 
		ep : ARRAY[0..2]OF REAL; (* End point *)
		cp : ARRAY[0..2]OF REAL; (* Center point *)
		radius : REAL; (* Tool radius *)
		v_ncprog : REAL; (* Programmed feedrate *)
		info : UDINT; (* Info bits *)
	END_STRUCT;
	ARNC0PLDMOVE02_typ : 	STRUCT 
		ep : ARRAY[0..2]OF REAL; (* End point *)
		cp : ARRAY[0..2]OF REAL; (* Center point *)
		radius : REAL; (* Tool radius *)
		v_ncprog : REAL; (* Programmed feedrate *)
		t : REAL; (* block runtime *)
		s : REAL; (* block length, interpolated axes *)
		s_all : REAL; (* block length, all axes *)
		info : UDINT; (* Info bits *)
	END_STRUCT;
	ARNC0PLDPROGEND_typ : 	STRUCT 
		t : REAL; (* estimated runtime *)
		s : REAL; (* path length, interpolated axes *)
		s_all : REAL; (* path length, all axes *)
	END_STRUCT;
	ARNC0PLDPROGSTART_typ : 	STRUCT 
		ProgNumber : UDINT; (* program number *)
	END_STRUCT;
	ARNC0PLDTOOL_typ : 	STRUCT 
		radius : REAL; (* Tool radius *)
		length : REAL; (* Tool length *)
		offset : ARRAY[0..2]OF REAL; (* Tool offset *)
		index : UINT; (* Tool index, tool data number *)
		reserve : UINT; (* don't use *)
	END_STRUCT;
	ARNC0PLDCSTRF_typ : 	STRUCT 
		matrix : ARRAY[0..8]OF REAL; (* Rotation matrix *)
		offset : ARRAY[0..2]OF REAL; (* Offset (cs + tool) *)
		info : UDINT; (* Info bits *)
	END_STRUCT;
	ARNC0PLDUSER_typ : 	STRUCT 
		data : ARRAY[0..51]OF USINT; (* User data *)
	END_STRUCT;
	ARNC0TRFIODATA_typ : 	STRUCT 
		status : UDINT; (* Return status of the last call of the transformation function *)
		in_pos : ARRAY[0..11]OF LREAL; (* Input positions of the transformation function *)
		in_pos_ext : ARRAY[0..11]OF LREAL; (* Extended input positions of the transformation function *)
		out_pos : ARRAY[0..71]OF LREAL; (* Output positions of the transformation function *)
		info : ARRAY[0..8]OF UDINT; (* Information about the last call of the transformation function *)
	END_STRUCT;
	ARNC0WSCTRL_typ : 	STRUCT 
		link_index : UDINT; (* index of colliding link *)
		link2_index : UDINT; (* index of colliding link for self-collision *)
		area_index : UDINT; (* index of colliding area *)
	END_STRUCT;
	ARNC0IP_MON_typ : 	STRUCT 
		enable : USINT; (*Enable cyclic update *)
		reserve : ARRAY[0..2]OF USINT; (*[RESERVE] *)
		status_msg : ARRAY[0..79]OF USINT; (*String: current status of interpreter e.g. Running/Waiting/Finished *)
		last_error_msg : ARRAY[0..119]OF USINT; (*String: last error message issued *)
		last_error_code : UINT; (*Last status message code issued *)
		loaded_prog_count : UINT; (*Number of files loaded *)
		prog_name : ARRAY[0..79]OF USINT; (*Name of start-program *)
		ncblock_l2 : ARRAY[0..79]OF USINT; (*Interpeter block monitor: current line -2 *)
		ncblock_l1 : ARRAY[0..79]OF USINT; (*Interpeter block monitor: current line -1 *)
		ncblock : ARRAY[0..79]OF USINT; (*Interpeter block monitor: current line *)
		ncblock_n1 : ARRAY[0..79]OF USINT; (*Interpeter block monitor: current line +1 *)
		ncblock_n2 : ARRAY[0..79]OF USINT; (*Interpeter block monitor: current line +2 *)
		cur_line_num : UDINT; (*Interpeter block monitor: current line number *)
		cur_block_num : UDINT; (*Interpeter block monitor: current line N-block number *)
		intern1 : UDINT; (*[INTERNAL] *)
		intern2 : UDINT; (*[INTERNAL] *)
		intern3 : UDINT; (*[INTERNAL] *)
		intern4 : UDINT; (*[INTERNAL] *)
		intern5 : UDINT; (*[INTERNAL] *)
		breakpoint_count : UDINT; (*Number of breakpoints set *)
		ipvar_access_count : UDINT; (*Number of IP variables being directly accessed by PLC *)
		intern6 : UDINT; (*[INTERNAL] *)
		intern7 : UDINT; (*[INTERNAL] *)
		num_parallel_events : UDINT; (*Number of cyclic jobs currently active *)
		parallel_cycle_count : UDINT; (*Number of execution cycles of all cyclic jobs *)
		parallel_action_text : ARRAY[0..11,0..79]OF USINT; (*cyclic execution monitor - cyclic job source line text *)
		parallel_eval_count : ARRAY[0..11]OF UDINT; (*number of times the cyclic job has been evaluated (tested) *)
		parallel_exec_count : ARRAY[0..11]OF UDINT; (*number of times a Synchronised Action has executed (not relevant to FUBs) *)
		num_fubs_exec_ipsynch : UDINT; (*Number of interpreter synchronous FUBs executing *)
		num_fubs_exec_ppsynch : UDINT; (*Number of path synchronous FUBs executing *)
		callstack : ARRAY[0..11,0..79]OF USINT; (*Program callstack *)
		shared_mem_size : UDINT; (*Memory consumed by shared library data (partitions will be larger) *)
		ip_mem_size : UDINT; (*Memory consumed by interpreter instance (partitions will be larger) *)
		ip_cur_file_mem_size : UDINT; (*Memory consumed by start program (or last loaded program) file (partitions will be larger) *)
		sys_free_mem : UDINT; (*Available system memory *)
		intern8 : UDINT; (*[INTERNAL] *)
		intern9 : UDINT; (*[INTERNAL] *)
		intern10 : UDINT; (*[INTERNAL] *)
		intern11 : UDINT; (*[INTERNAL] *)
		parallel_enabled : USINT; (*Bool: cyclic execution enabled *)
		parallel_rdisable_set : USINT; (*Bool: cyclic jobs set the keep-alive (rdisable) flag *)
		intern12 : USINT; (*[INTERNAL] *)
		intern13 : USINT; (*[INTERNAL] *)
		cur_prog_file_name : ARRAY[0..79]OF USINT; (*File name of the current program*)
		cur_prog_name : ARRAY[0..79]OF USINT; (*Name of the current program*)
	END_STRUCT;
END_TYPE
