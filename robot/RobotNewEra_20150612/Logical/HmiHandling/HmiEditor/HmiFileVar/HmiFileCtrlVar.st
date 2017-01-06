(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: HmiFile
 * File: HmiFileCtrlVar.st
 * Author: renj
 * Created: October 29, 2014
 ********************************************************************
 * Implementation of program HmiFile
 ********************************************************************)

PROGRAM _INIT

END_PROGRAM


PROGRAM _CYCLIC
	
	CASE Internal.State OF
		
		HMIFILE_IDLE:
			
			HmiFileCtrlVar.Output.Status.Busy := FALSE;
			
			IF HmiFileCtrlVar.Input.Command.Read THEN
				
				Internal.State := HMIFILE_OPEN;
				HmiFileCtrlVar.Output.Status.ReadOK := FALSE;
				HmiFileCtrlVar.Output.Status.Busy := TRUE;

			END_IF
		
			IF HmiFileCtrlVar.Input.Command.Write THEN
		
				
				Internal.State := HMIFILE_DELETE;
				HmiFileCtrlVar.Output.Status.WriteOK := FALSE;
				HmiFileCtrlVar.Output.Status.Busy := TRUE;
			END_IF
		
		
		HMIFILE_OPEN:
			
			FileOpen_0.enable	:= TRUE;
			FileOpen_0.pDevice 	:= ADR(HmiFileCtrlVar.Input.Parameter.FileDevice);
			FileOpen_0.pFile 	:= ADR(HmiFileCtrlVar.Input.Parameter.FileName);
			FileOpen_0.mode 	:= fiREAD_WRITE;
			(* FB Call *)
			FileOpen_0();

			(* Get FBK output information *)
			Internal.FileIdent := FileOpen_0.ident;
			wStatus := FileOpen_0.status;
			
			IF (wStatus = 0) THEN
				
				Internal.State := HMIFILE_READ;
				
			ELSIF (wStatus <> 65535) THEN
				(* Verify status (20708 -> File doesn't exist) *)
				IF (wStatus = 20708) THEN
				
				END_IF
				
				IF (wStatus = 20799) THEN
					wError := FileIoGetSysError();
				END_IF
				
				IF HmiFileCtrlVar.Input.Command.Read THEN
					
					HmiFileCtrlVar.Input.Command.Read := FALSE;
				
				ELSIF HmiFileCtrlVar.Input.Command.Write THEN
				
					HmiFileCtrlVar.Input.Command.Write := FALSE;
					
				END_IF
				
				Internal.State := HMIFILE_ERROR;
				
			END_IF
			
		HMIFILE_READ:
			
			(**** Read data from file ****)
			(* Initialize file read structure *)
			FileReadEx_0.enable		:= TRUE;
			FileReadEx_0.ident     	:= Internal.FileIdent;
			FileReadEx_0.pDest     	:= HmiFileCtrlVar.Input.Parameter.StringBufferAdr;
			FileReadEx_0.len	   	:= HmiFileCtrlVar.Input.Parameter.StringBufferSize;
			
			(* Call FBK *)
			FileReadEx_0();
			(* Get status *)
			wStatus := FileReadEx_0.status;
			(* Verify status *)
			IF wStatus = 0 THEN
			
				Internal.FileByte := FileReadEx_0.bytesread;
			
				Internal.State := HMIFILE_CLOSE;
				
			ELSIF (wStatus <> 65535) THEN
				
				IF (wStatus = 20799) THEN
					wError := FileIoGetSysError();
				END_IF
				
				IF HmiFileCtrlVar.Input.Command.Read THEN
					
					HmiFileCtrlVar.Input.Command.Read := FALSE;
				
				ELSIF HmiFileCtrlVar.Input.Command.Write THEN
				
					HmiFileCtrlVar.Input.Command.Write := FALSE;
					
				END_IF
				
				Internal.State := HMIFILE_ERROR;
				
			END_IF
		
		HMIFILE_DELETE:
			(* Initialize file delete structure *)
			FileDelete_0.enable  := 1;
			FileDelete_0.pDevice := ADR(HmiFileCtrlVar.Input.Parameter.FileDevice);
			FileDelete_0.pName   :=ADR(HmiFileCtrlVar.Input.Parameter.FileName);
			(* Call FBK *)
			FileDelete_0();
			(* Get status *)
			wStatus := FileDelete_0.status;
		
			(* Verify status *)
			IF wStatus = 0 THEN
				Internal.State := HMIFILE_CREATE;
			ELSIF (wStatus <> 65535) THEN
				
				IF (wStatus = 20799) THEN
					wError := FileIoGetSysError();
				END_IF

				IF HmiFileCtrlVar.Input.Command.Write THEN
				
					HmiFileCtrlVar.Input.Command.Write := FALSE;
					
				END_IF
				
				Internal.State := HMIFILE_ERROR;
				
			END_IF

		HMIFILE_CREATE:
			(* Initialize file create structure *)
			FileCreate_0.enable  := 1;
			FileCreate_0.pDevice := ADR(HmiFileCtrlVar.Input.Parameter.FileDevice);
			FileCreate_0.pFile   := ADR(HmiFileCtrlVar.Input.Parameter.FileName);
			(* Call FBK *)
			FileCreate_0();
			(* Get FBK output information *)
			Internal.FileIdent := FileCreate_0.ident;
			wStatus := FileCreate_0.status;
			(* Verify status *)
			IF wStatus = 0 THEN
				Internal.State := HMIFILE_WRITE;
			ELSIF (wStatus <> 65535) THEN
				
				IF (wStatus = 20799) THEN
					wError := FileIoGetSysError();
				END_IF

				IF HmiFileCtrlVar.Input.Command.Write THEN
				
					HmiFileCtrlVar.Input.Command.Write := FALSE;
					
				END_IF
				
				Internal.State := HMIFILE_ERROR;
				
			END_IF

		HMIFILE_WRITE:
			(**** WRITE File ****)
			(* Initialize file close structure *)
			FileWriteEx_0.enable	:= TRUE;
			FileWriteEx_0.ident		:= Internal.FileIdent;
             
			FileWriteEx_0.len		:= HmiFileCtrlVar.Input.Parameter.StringBufferSize;
			FileWriteEx_0.pSrc		:= HmiFileCtrlVar.Input.Parameter.StringBufferAdr;;
			
			(* Call FBK *)	
			FileWriteEx_0();

			(* Get status *)
			wStatus := FileWriteEx_0.status;

			(* Verify status *)
			IF wStatus = 0 THEN
				Internal.State := HMIFILE_CLOSE;
			ELSIF (wStatus <> 65535) THEN
				
				IF (wStatus = 20799) THEN
					wError := FileIoGetSysError();
				END_IF
				
				IF HmiFileCtrlVar.Input.Command.Read THEN
					
					HmiFileCtrlVar.Input.Command.Read := FALSE;
				
				ELSIF HmiFileCtrlVar.Input.Command.Write THEN
				
					HmiFileCtrlVar.Input.Command.Write := FALSE;
					
				END_IF
				
				Internal.State := HMIFILE_ERROR;
				
			END_IF
		
		HMIFILE_CLOSE:
			(**** Close file ****)
			(* Initialize file close structure *)
			FileClose_0.enable	:= TRUE;
			FileClose_0.ident	:= Internal.FileIdent;
                        
			(* Call FBK *)
			FileClose_0();

			(* Get status *)
			wStatus := FileClose_0.status;
		
			IF wStatus = 0 THEN
				
				IF HmiFileCtrlVar.Input.Command.Read THEN
					
					HmiFileCtrlVar.Output.Status.ReadOK := TRUE;
					
					HmiFileCtrlVar.Input.Command.Read := FALSE;
				
				ELSIF HmiFileCtrlVar.Input.Command.Write THEN
				
					HmiFileCtrlVar.Output.Status.WriteOK := TRUE;
					
					HmiFileCtrlVar.Input.Command.Write := FALSE;
					
				END_IF
				
				Internal.State := HMIFILE_IDLE;
			
			ELSIF (wStatus <> 65535) THEN
				
				IF (wStatus = 20799) THEN
					wError := FileIoGetSysError();
				END_IF
				
				IF HmiFileCtrlVar.Input.Command.Read THEN
					
					HmiFileCtrlVar.Input.Command.Read := FALSE;
				
				ELSIF HmiFileCtrlVar.Input.Command.Write THEN
				
					HmiFileCtrlVar.Input.Command.Write := FALSE;
					
				END_IF
				
				Internal.State := HMIFILE_ERROR;
				
			END_IF
		
		HMIFILE_ERROR:
			
			IF HmiFileCtrlVar.Input.Command.AckError THEN
				
				HmiFileCtrlVar.Input.Command.AckError := 0;
				Internal.State := HMIFILE_IDLE;
		
			END_IF
								
	END_CASE
		
		
	
	
END_PROGRAM
