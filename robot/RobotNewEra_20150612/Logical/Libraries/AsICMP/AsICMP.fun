(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Library: AsIcmp
 * File: AsIcmp.fun
 * Author: B+R
 ********************************************************************
 * Functions and function blocks of library AsIcmp
 ********************************************************************)
                                                                      
FUNCTION_BLOCK IcmpPing					(*pings a station; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pHost			: UDINT;		(*pointer to the IP address or name of the station that should be pinged*)
		timeout			: UINT;			(*response timeout*)
	END_VAR

	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR

	VAR
        i_state			: UINT;			(*internal variable*)
		i_result		: UINT;			(*internal variable*)
        i_tmp			: UDINT;		(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK
