######################################################
#                                                    #
# Automatic generated Makefile for Visual Components #
#                                                    #
#                  Do NOT edit!                      #
#                                                    #
######################################################

VCC=@"$(AS_BIN_PATH)/br.vc.pc.exe"
LINK=@"$(AS_BIN_PATH)/BR.VC.Link.exe"
MODGEN=@"$(AS_BIN_PATH)/BR.VC.ModGen.exe"
VCPL=@"$(AS_BIN_PATH)/BR.VC.PL.exe"
VCHWPP=@"$(AS_BIN_PATH)/BR.VC.HWPP.exe"
VCDEP=@"$(AS_BIN_PATH)/BR.VC.Depend.exe"
VCFLGEN=@"$(AS_BIN_PATH)/BR.VC.lfgen.exe"
VCREFHANDLER=@"$(AS_BIN_PATH)/BR.VC.CrossReferenceHandler.exe"
VCXREFEXTENDER=@"$(AS_BIN_PATH)/BR.AS.CrossRefVCExtender.exe"
RM=CMD /C DEL
PALFILE_Visu=$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Palette.vcr
VCCFLAGS_Visu=-server -proj Visu -vc "$(AS_PROJECT_PATH)/Logical/Visualization/Visu/VCObject.vc" -prj_path "$(AS_PROJECT_PATH)" -temp_path "$(AS_TEMP_PATH)" -cfg $(AS_CONFIGURATION) -plc $(AS_PLC) -plctemp $(AS_TEMP_PLC) -cpu_path "$(AS_CPU_PATH)"
VCFIRMWARE=4.21.1
VCFIRMWAREPATH=$(AS_VC_PATH)/Firmware/V4.21.1/SG4
VCOBJECT_Visu=$(AS_PROJECT_PATH)/Logical/Visualization/Visu/VCObject.vc
VCSTARTUP="vcstart.br"
VCLOD="vclod.br"
VCSTPOST="vcstpost.br"
TARGET_FILE_Visu=$(AS_CPU_PATH)/Visu.br
OBJ_SCOPE_Visu=Visualization
PRJ_PATH_Visu=$(AS_PROJECT_PATH)
SRC_PATH_Visu=$(AS_PROJECT_PATH)/Logical/$(OBJ_SCOPE_Visu)/Visu
TEMP_PATH_Visu=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/Visu
TEMP_PATH_Shared=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared
TEMP_PATH_ROOT_Visu=$(AS_TEMP_PATH)
VC_LIBRARY_LIST_Visu=$(TEMP_PATH_Visu)/libraries.vci
VC_XREF_BUILDFILE_Visu=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/vcxref.build
VC_XREF_CLEANFILE=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/vcxref.clean
VC_LANGUAGES_Visu=$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr
CPUHWC="$(TEMP_PATH_Visu)/cpuhwc.vci"
VC_STATIC_OPTIONS_Visu="$(TEMP_PATH_Visu)/vcStaticOptions.xml"
VC_STATIC_OPTIONS_Shared="$(TEMP_PATH_Shared)/vcStaticOptions.xml"
# include Shared and Font Makefile (only once)
	include $(AS_TEMP_PATH)/objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCFntDat/Font_Visu.mak
ifneq ($(VCINC),1)
	VCINC=1
	include $(AS_TEMP_PATH)/objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/VCShared.mak
endif

DEPENDENCIES_Visu=-d vcgclass -profile "False"
DEFAULT_STYLE_SHEET_Visu=Source[local].StyleSheet[Default]
SHARED_MODULE=$(TEMP_PATH_ROOT_Visu)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/vcshared.br
LFNTFLAGS_Visu=-P "$(AS_PROJECT_PATH)" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)"
BDRFLAGS_Visu=-P "$(AS_PROJECT_PATH)" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)"

# Local Libs
LIB_LOCAL_OBJ_Visu=$(TEMP_PATH_Visu)/localobj.vca

# Hardware sources
PANEL_HW_OBJECT_Visu=$(TEMP_PATH_ROOT_Visu)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/Visu/dis.Hardware.vco
PANEL_HW_SOURCE_Visu=E:/Robot_moban/RobotNewEra_20150612/Physical/X20CP1586/Hardware.hw 
DIS_OBJECTS_Visu=$(PANEL_HW_OBJECT_Visu) $(KEYMAP_OBJECTS_Visu)

# KeyMapping flags
$(TEMP_PATH_Visu)/dis.5MP050.0653-02.vco: $(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/VC/5MP050.0653-02.dis
	$(VCHWPP) -f "$(PANEL_HW_SOURCE_Visu)" -o "$(subst .vco,.vci,$(TEMP_PATH_Visu)/dis.5MP050.0653-02.vco)" -n Visu -d Visu -pal "$(PALFILE_Visu)" -c "$(AS_CONFIGURATION)" -p "$(AS_PLC)" -ptemp "$(AS_TEMP_PLC)" -B "G4.06" -L "asrfbext: V*, visapi: V*" -hw "$(CPUHWC)" -warninglevel 2 -so $(VC_STATIC_OPTIONS_Visu) -sos $(VC_STATIC_OPTIONS_Shared) -keyboard "$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/VC/5MP050.0653-02.dis" -fp "$(AS_VC_PATH)/Firmware/V4.21.1/SG4" -prj "$(AS_PROJECT_PATH)" -apj "RobotNewEra" -sfas -vcob "$(VCOBJECT_Visu)"
	$(VCC) -f "$(subst .vco,.vci,$@)" -o "$@" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -k "$(VCVK_SOURCES_Visu)" $(VCCFLAGS_Visu) -p Visu -sfas

KEYMAP_SOURCES_Visu=$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/VC/5MP050.0653-02.dis 
KEYMAP_OBJECTS_Visu=$(TEMP_PATH_Visu)/dis.5MP050.0653-02.vco 

# All Source Objects
TXTGRP_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/PageNames.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/PageSetupSystem.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/Languages.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/NumPad_Limits.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/DateTimeFormats.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/httpURL_SDM.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/MSGTexts.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/ButtonText.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/DiagnosticsDataTypes.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/DiagnosticsForcing.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/DiagnosticsModuleInfoShort.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/DiagnosticsModuleInfo.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/ManualMode.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/PageAlarm.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/PageFileManager.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/PageIO.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/PageMain.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/PageSetup.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/PageTitle.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/WarningTitle.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/StatusBar.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/PanelTitles.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/PageJogging.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/PageEditorData.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/PageEdit.txtgrp 

FNINFO_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Fonts/Info.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Fonts/Html_SDM.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Fonts/Default.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Fonts/Header.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Fonts/SimSun10px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Fonts/Input.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Fonts/Status.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Fonts/Pads.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Fonts/ArialUnicode18pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Fonts/DejaVu9PxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Fonts/ArialUnicode14pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Fonts/CourierNew11Bold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Fonts/DefaultBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Fonts/ArialUni14pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Fonts/ArialUnicode12Bold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Fonts/SimSun14px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Fonts/Button1.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Fonts/SimSun12px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Fonts/SimSunArial14px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Fonts/SimSunArial12px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Fonts/SimSunArial10px.fninfo 

BMINFO_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_AcknowledgeReset.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_Active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_BypassOFF.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_BypassON.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_Inactive.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_Latched.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_NotQuit.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_Quit.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_Reset.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_ResetAcknowledge.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_Triggered.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/ProgressBorder.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/alarm.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/checkbox.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/checkbox_checked.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_default.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_default_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_down.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_global_area.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_global_area_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/information.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_left.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_left_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_down_multi.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_down_multi_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_up_multi.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_up_multi_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_radio_selected.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_radio.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_right.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_right_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_up.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_up_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/warning.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_decrease_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_increase.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_increase_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_decrease.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/frame_header.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/checkbox_small.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/checkbox_small_checked.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/BorderSlider09x09.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Slider_BallGray.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/gauge_200x200_round_nodiv.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/gauge_NeedleRed100x11_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/checkbox_small_gray.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/BackgroundVGA.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/FrameInvisible.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_off.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_on.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_ready.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_error.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/BackTransparent.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_Numpad.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_Numpad_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_AlphaPad_lower.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_AlphaPad_upper.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_AlphaPad_numeric.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_AlphaPad_numeric2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_AlphaPad_lowerPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_AlphaPad_upperPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_AlphaPad_numericPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_AlphaPad_numeric2Pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_ListPadVer.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_ListPadVer_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_ListPadHor.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_ListPadHor_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_EditPad_lower.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_EditPad_upper.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_EditPad_numeric.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_EditPad_numeric2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_EditPad_lowerPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_EditPad_upperPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_EditPad_numericPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_EditPad_numeric2Pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/InputBorder.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_down_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/OutputBorder.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/LabelBoarder.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/GroupControl.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Img_Config.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Img_Diagnostics.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Img_Home.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Img_Trend.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Img_Warning.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_control_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Img_Document.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/speedometer.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/login.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/continuous30.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/singlestep.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/speed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/contin.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jog.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jogbase.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jogjoint.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jogtool.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/mode.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/ss.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/contin30.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jogbase30.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jogjoint30.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jogtool30.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/ss30.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Headerbarbg.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_global_area_pressedInv.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_global_areaInv.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Bitmap_Up.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Bitmap_Down.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jogdirect30.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jogdirect.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Down.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/DownPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Up.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/UpPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/borderside.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/rect3325.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/rect3925.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/DownBmp.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/UpBmp.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/System.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Motor36.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/robot36.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/CalibBmp.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/close.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/IO.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Restart.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Refresh.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/help.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/RobotCalib.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/RobotGeo0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/RobotGeo1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/RobotGeo2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/RobotGeo3.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/RobotGeo4.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/RobotGeo5.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Workspace.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/BrowseData.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/KBLower.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/KBNumeric.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/KBNumeric2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/KBUpper.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/VarIcon.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/BRLogo.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/rect3926.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/info.bminfo 

BMGRP_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualization/Visu/BitmapGroups/AlarmAcknowledgeState.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/BitmapGroups/AlarmBypassState.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/BitmapGroups/AlarmEvent.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/BitmapGroups/AlarmState.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/BitmapGroups/Borders.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/BitmapGroups/GlobalArea.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/BitmapGroups/Pads.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/BitmapGroups/msgBox.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/BitmapGroups/AutoModes.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/BitmapGroups/JogModes.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/BitmapGroups/RobotGeo.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/BitmapGroups/KBs.bmgrp 

PAGE_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P100_MainPage.page \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P210_SetupSystem.page \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P700_Alarm.page \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P200_Setup.page \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P400_FileManager.page \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P600_Jogging.page \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P220_SetupAxis.page \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P230_SetupKinematics.page \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P240_SetupCalib.page \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P250_SetupIO.page \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P500_EditorPrg.page \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P260_SetupWorkspace.page \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P510_EditorData.page 

LAYER_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Layers/globalArea.layer \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Layers/LoginPopup.layer \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Layers/globalButtons.layer 

VCS_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualization/Visu/StyleSheets/Default.vcs 

BDR_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Decrease.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Decrease_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Global_Area.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Global_Area_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Increase.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Increase_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Multi_Scroll_Down.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Multi_Scroll_Down_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Multi_Scroll_Up.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Multi_Scroll_Up_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Radio.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Radio_selected.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Scoll_Up.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Scoll_Up_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Scroll_Down.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Scroll_Down_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Scroll_Left.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Scroll_Left_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Scroll_Right.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Scroll_Right_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/SunkenNG.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/CheckBox_checked.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Flat_black.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Flat_grey.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/OverdriveBorder.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/ProgressBarBorder.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/RaisedInner.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Raised.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/SliderBorder09.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/SunkenOuter.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Sunken.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/SunkenNGgray.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/FrameGlobal.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/FrameInvisible.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_KeyRingOff.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_KeyRingOn.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/OutputBorder.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/InputBorder.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/GroupControl.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/LabelBoarder.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Control.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Control_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/TabActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Global_Area_pressedInv.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Global_AreaInv.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/ButtonUpFlat.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/ButtonUpPressedFlat.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/ButtonDownPressedFlat.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/ButtonDownFlat.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/LeftBorder.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/ButtonFlat.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/ButtonFlatPressed.bdr 

TPR_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TouchPads/NumPad.tpr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TouchPads/AlphaPad.tpr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TouchPads/NavigationPad_ver.tpr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TouchPads/NavigationPad_hor.tpr \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/TouchPads/EditPad.tpr 

TDC_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Trends/TrendData.tdc 

TRD_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Trends/CPUTemperature.trd \
	$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Trends/ROOMTemperature.trd 

TRE_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Trends/Trend_Temperature.tre 

VCVK_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualization/Visu/VirtualKeys.vcvk 

VCR_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Palette.vcr 

# Runtime Object sources
VCR_OBJECT_Visu=$(TEMP_PATH_Visu)/vcrt.vco
VCR_SOURCE_Visu=$(SRC_PATH_Visu)/package.vcp
# All Source Objects END

#Panel Hardware
$(PANEL_HW_OBJECT_Visu): $(PANEL_HW_SOURCE_Visu) $(PALFILE_Visu) $(VC_LIBRARY_LIST_Visu) $(KEYMAP_SOURCES_Visu)
	$(VCHWPP) -f "$<" -o "$(subst .vco,.vci,$@)" -n Visu -d Visu -pal "$(PALFILE_Visu)" -c "$(AS_CONFIGURATION)" -p "$(AS_PLC)" -ptemp "$(AS_TEMP_PLC)" -B "G4.06" -L "asrfbext: V*, visapi: V*" -verbose "False" -profile "False" -hw "$(CPUHWC)" -warninglevel 2 -so $(VC_STATIC_OPTIONS_Visu) -sos $(VC_STATIC_OPTIONS_Shared) -fp "$(AS_VC_PATH)/Firmware/V4.21.1/SG4" -sfas -prj "$(AS_PROJECT_PATH)" -apj "RobotNewEra" -vcob "$(VCOBJECT_Visu)"
	$(VCC) -f "$(subst .vco,.vci,$@)" -o "$@" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -k "$(VCVK_SOURCES_Visu)" $(VCCFLAGS_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


# Pages
PAGE_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/page., $(notdir $(PAGE_SOURCES_Visu:.page=.vco)))

$(TEMP_PATH_Visu)/page.P100_MainPage.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P100_MainPage.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu) -P "$(AS_PROJECT_PATH)" -ds "$(SRC_PATH_Visu)/StyleSheets/Default.vcs" -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/page.P210_SetupSystem.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P210_SetupSystem.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu) -P "$(AS_PROJECT_PATH)" -ds "$(SRC_PATH_Visu)/StyleSheets/Default.vcs" -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/page.P700_Alarm.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P700_Alarm.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu) -P "$(AS_PROJECT_PATH)" -ds "$(SRC_PATH_Visu)/StyleSheets/Default.vcs" -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/page.P200_Setup.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P200_Setup.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu) -P "$(AS_PROJECT_PATH)" -ds "$(SRC_PATH_Visu)/StyleSheets/Default.vcs" -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/page.P400_FileManager.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P400_FileManager.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu) -P "$(AS_PROJECT_PATH)" -ds "$(SRC_PATH_Visu)/StyleSheets/Default.vcs" -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/page.P600_Jogging.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P600_Jogging.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu) -P "$(AS_PROJECT_PATH)" -ds "$(SRC_PATH_Visu)/StyleSheets/Default.vcs" -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/page.P220_SetupAxis.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P220_SetupAxis.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu) -P "$(AS_PROJECT_PATH)" -ds "$(SRC_PATH_Visu)/StyleSheets/Default.vcs" -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/page.P230_SetupKinematics.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P230_SetupKinematics.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu) -P "$(AS_PROJECT_PATH)" -ds "$(SRC_PATH_Visu)/StyleSheets/Default.vcs" -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/page.P240_SetupCalib.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P240_SetupCalib.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu) -P "$(AS_PROJECT_PATH)" -ds "$(SRC_PATH_Visu)/StyleSheets/Default.vcs" -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/page.P250_SetupIO.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P250_SetupIO.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu) -P "$(AS_PROJECT_PATH)" -ds "$(SRC_PATH_Visu)/StyleSheets/Default.vcs" -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/page.P500_EditorPrg.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P500_EditorPrg.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu) -P "$(AS_PROJECT_PATH)" -ds "$(SRC_PATH_Visu)/StyleSheets/Default.vcs" -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/page.P260_SetupWorkspace.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P260_SetupWorkspace.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu) -P "$(AS_PROJECT_PATH)" -ds "$(SRC_PATH_Visu)/StyleSheets/Default.vcs" -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/page.P510_EditorData.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Pages/P510_EditorData.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu) -P "$(AS_PROJECT_PATH)" -ds "$(SRC_PATH_Visu)/StyleSheets/Default.vcs" -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


#Pages END




# Stylesheets
VCS_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/vcs., $(notdir $(VCS_SOURCES_Visu:.vcs=.vco)))

$(TEMP_PATH_Visu)/vcs.Default.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/StyleSheets/Default.vcs
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu) -P "$(AS_PROJECT_PATH)" -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


#Stylesheets END




# Layers
LAYER_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/layer., $(notdir $(LAYER_SOURCES_Visu:.layer=.vco)))

$(TEMP_PATH_Visu)/layer.globalArea.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Layers/globalArea.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/layer.LoginPopup.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Layers/LoginPopup.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/layer.globalButtons.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Layers/globalButtons.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


#Layers END




# Virtual Keys
VCVK_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/vcvk., $(notdir $(VCVK_SOURCES_Visu:.vcvk=.vco)))

$(TEMP_PATH_Visu)/vcvk.VirtualKeys.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/VirtualKeys.vcvk
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas

$(VCVK_OBJECTS_Visu): $(VC_LANGUAGES_Visu)

#Virtual Keys END




# Touch Pads
TPR_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/tpr., $(notdir $(TPR_SOURCES_Visu:.tpr=.vco)))

$(TEMP_PATH_Visu)/tpr.NumPad.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TouchPads/NumPad.tpr
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu) -prj "E:/Robot_moban/RobotNewEra_20150612/Logical/Visualization/Visu" -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/tpr.AlphaPad.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TouchPads/AlphaPad.tpr
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu) -prj "E:/Robot_moban/RobotNewEra_20150612/Logical/Visualization/Visu" -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/tpr.NavigationPad_ver.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TouchPads/NavigationPad_ver.tpr
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu) -prj "E:/Robot_moban/RobotNewEra_20150612/Logical/Visualization/Visu" -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/tpr.NavigationPad_hor.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TouchPads/NavigationPad_hor.tpr
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu) -prj "E:/Robot_moban/RobotNewEra_20150612/Logical/Visualization/Visu" -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/tpr.EditPad.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TouchPads/EditPad.tpr
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu) -prj "E:/Robot_moban/RobotNewEra_20150612/Logical/Visualization/Visu" -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


#Touch Pads END




# Text Groups
TXTGRP_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/txtgrp., $(notdir $(TXTGRP_SOURCES_Visu:.txtgrp=.vco)))

$(TEMP_PATH_Visu)/txtgrp.PageNames.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/PageNames.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/txtgrp.PageSetupSystem.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/PageSetupSystem.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/txtgrp.Languages.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/Languages.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/txtgrp.NumPad_Limits.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/NumPad_Limits.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/txtgrp.DateTimeFormats.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/DateTimeFormats.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/txtgrp.httpURL_SDM.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/httpURL_SDM.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/txtgrp.MSGTexts.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/MSGTexts.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/txtgrp.ButtonText.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/ButtonText.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/txtgrp.DiagnosticsDataTypes.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/DiagnosticsDataTypes.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/txtgrp.DiagnosticsForcing.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/DiagnosticsForcing.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/txtgrp.DiagnosticsModuleInfoShort.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/DiagnosticsModuleInfoShort.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/txtgrp.DiagnosticsModuleInfo.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/DiagnosticsModuleInfo.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/txtgrp.ManualMode.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/ManualMode.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/txtgrp.PageAlarm.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/PageAlarm.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/txtgrp.PageFileManager.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/PageFileManager.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/txtgrp.PageIO.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/PageIO.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/txtgrp.PageMain.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/PageMain.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/txtgrp.PageSetup.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/PageSetup.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/txtgrp.PageTitle.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/PageTitle.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/txtgrp.WarningTitle.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/WarningTitle.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/txtgrp.StatusBar.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/StatusBar.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/txtgrp.PanelTitles.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/PanelTitles.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/txtgrp.PageJogging.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/PageJogging.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/txtgrp.PageEditorData.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/PageEditorData.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/txtgrp.PageEdit.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/TextGroups/PageEdit.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


#Text Groups END




# BitmapGroups
BMGRP_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/bmgrp., $(notdir $(BMGRP_SOURCES_Visu:.bmgrp=.vco)))

$(TEMP_PATH_Visu)/bmgrp.AlarmAcknowledgeState.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/BitmapGroups/AlarmAcknowledgeState.bmgrp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bmgrp.AlarmBypassState.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/BitmapGroups/AlarmBypassState.bmgrp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bmgrp.AlarmEvent.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/BitmapGroups/AlarmEvent.bmgrp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bmgrp.AlarmState.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/BitmapGroups/AlarmState.bmgrp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bmgrp.Borders.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/BitmapGroups/Borders.bmgrp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bmgrp.GlobalArea.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/BitmapGroups/GlobalArea.bmgrp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bmgrp.Pads.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/BitmapGroups/Pads.bmgrp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bmgrp.msgBox.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/BitmapGroups/msgBox.bmgrp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bmgrp.AutoModes.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/BitmapGroups/AutoModes.bmgrp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bmgrp.JogModes.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/BitmapGroups/JogModes.bmgrp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bmgrp.RobotGeo.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/BitmapGroups/RobotGeo.bmgrp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bmgrp.KBs.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/BitmapGroups/KBs.bmgrp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


#BitmapGroups END




# Bitmaps
BMINFO_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/bminfo., $(notdir $(BMINFO_SOURCES_Visu:.bminfo=.vco)))

$(TEMP_PATH_Visu)/bminfo.Alarm_AcknowledgeReset.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_AcknowledgeReset.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_AcknowledgeReset.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Alarm_Active.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_Active.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_Active.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Alarm_BypassOFF.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_BypassOFF.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_BypassOFF.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Alarm_BypassON.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_BypassON.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_BypassON.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Alarm_Inactive.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_Inactive.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_Inactive.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Alarm_Latched.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_Latched.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_Latched.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Alarm_NotQuit.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_NotQuit.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_NotQuit.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Alarm_Quit.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_Quit.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_Quit.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Alarm_Reset.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_Reset.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_Reset.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Alarm_ResetAcknowledge.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_ResetAcknowledge.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_ResetAcknowledge.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Alarm_Triggered.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_Triggered.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Alarm_Triggered.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.ProgressBorder.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/ProgressBorder.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/ProgressBorder.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.alarm.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/alarm.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/alarm.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.checkbox.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/checkbox.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/checkbox.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.checkbox_checked.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/checkbox_checked.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/checkbox_checked.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_default.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_default.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_default.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_default_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_default_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_default_pressed.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_scroll_down.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_down.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_down.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_global_area.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_global_area.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_global_area.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_global_area_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_global_area_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_global_area_pressed.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.information.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/information.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/information.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_scroll_left.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_left.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_left.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_scroll_left_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_left_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_left_pressed.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_scroll_down_multi.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_down_multi.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_down_multi.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_scroll_down_multi_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_down_multi_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_down_multi_pressed.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_scroll_up_multi.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_up_multi.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_up_multi.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_scroll_up_multi_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_up_multi_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_up_multi_pressed.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_radio_selected.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_radio_selected.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_radio_selected.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_radio.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_radio.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_radio.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_scroll_right.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_right.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_right.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_scroll_right_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_right_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_right_pressed.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_scroll_up.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_up.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_up.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_scroll_up_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_up_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_up_pressed.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.warning.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/warning.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/warning.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_decrease_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_decrease_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_decrease_pressed.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_increase.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_increase.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_increase.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_increase_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_increase_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_increase_pressed.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_decrease.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_decrease.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_decrease.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.frame_header.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/frame_header.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/frame_header.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.checkbox_small.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/checkbox_small.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/checkbox_small.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.checkbox_small_checked.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/checkbox_small_checked.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/checkbox_small_checked.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.BorderSlider09x09.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/BorderSlider09x09.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/BorderSlider09x09.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Slider_BallGray.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Slider_BallGray.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Slider_BallGray.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.gauge_200x200_round_nodiv.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/gauge_200x200_round_nodiv.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/gauge_200x200_round_nodiv.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.gauge_NeedleRed100x11_1.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/gauge_NeedleRed100x11_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/gauge_NeedleRed100x11_1.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.checkbox_small_gray.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/checkbox_small_gray.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/checkbox_small_gray.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.BackgroundVGA.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/BackgroundVGA.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/BackgroundVGA.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.FrameInvisible.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/FrameInvisible.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/FrameInvisible.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_off.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_off.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_off.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_on.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_on.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_on.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_ready.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_ready.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_ready.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_error.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_error.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_error.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.BackTransparent.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/BackTransparent.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/BackTransparent.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_Numpad.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_Numpad.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_Numpad.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_Numpad_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_Numpad_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_Numpad_pressed.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_AlphaPad_lower.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_AlphaPad_lower.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_AlphaPad_lower.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_AlphaPad_upper.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_AlphaPad_upper.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_AlphaPad_upper.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_AlphaPad_numeric.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_AlphaPad_numeric.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_AlphaPad_numeric.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_AlphaPad_numeric2.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_AlphaPad_numeric2.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_AlphaPad_numeric2.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_AlphaPad_lowerPressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_AlphaPad_lowerPressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_AlphaPad_lowerPressed.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_AlphaPad_upperPressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_AlphaPad_upperPressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_AlphaPad_upperPressed.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_AlphaPad_numericPressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_AlphaPad_numericPressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_AlphaPad_numericPressed.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_AlphaPad_numeric2Pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_AlphaPad_numeric2Pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_AlphaPad_numeric2Pressed.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_ListPadVer.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_ListPadVer.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_ListPadVer.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_ListPadVer_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_ListPadVer_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_ListPadVer_pressed.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_ListPadHor.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_ListPadHor.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_ListPadHor.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_ListPadHor_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_ListPadHor_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_ListPadHor_pressed.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_EditPad_lower.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_EditPad_lower.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_EditPad_lower.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_EditPad_upper.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_EditPad_upper.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_EditPad_upper.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_EditPad_numeric.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_EditPad_numeric.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_EditPad_numeric.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_EditPad_numeric2.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_EditPad_numeric2.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_EditPad_numeric2.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_EditPad_lowerPressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_EditPad_lowerPressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_EditPad_lowerPressed.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_EditPad_upperPressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_EditPad_upperPressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_EditPad_upperPressed.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_EditPad_numericPressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_EditPad_numericPressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_EditPad_numericPressed.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_EditPad_numeric2Pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_EditPad_numeric2Pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Key_EditPad_numeric2Pressed.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.InputBorder.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/InputBorder.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/InputBorder.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_scroll_down_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_down_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_scroll_down_pressed.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.OutputBorder.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/OutputBorder.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/OutputBorder.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.LabelBoarder.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/LabelBoarder.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/LabelBoarder.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.GroupControl.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/GroupControl.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/GroupControl.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Img_Config.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Img_Config.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Img_Config.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Img_Diagnostics.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Img_Diagnostics.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Img_Diagnostics.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Img_Home.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Img_Home.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Img_Home.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Img_Trend.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Img_Trend.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Img_Trend.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Img_Warning.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Img_Warning.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Img_Warning.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_control.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_control.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_control.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_control_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_control_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_control_pressed.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Img_Document.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Img_Document.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Img_Document.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.speedometer.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/speedometer.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/speedometer.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.login.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/login.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/login.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.continuous30.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/continuous30.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/continuous30.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.singlestep.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/singlestep.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/singlestep.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.speed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/speed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/speed.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.contin.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/contin.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/contin.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.jog.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jog.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jog.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.jogbase.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jogbase.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jogbase.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.jogjoint.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jogjoint.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jogjoint.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.jogtool.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jogtool.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jogtool.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.mode.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/mode.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/mode.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.ss.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/ss.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/ss.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.contin30.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/contin30.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/contin30.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.jogbase30.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jogbase30.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jogbase30.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.jogjoint30.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jogjoint30.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jogjoint30.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.jogtool30.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jogtool30.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jogtool30.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.ss30.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/ss30.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/ss30.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Headerbarbg.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Headerbarbg.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Headerbarbg.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_global_area_pressedInv.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_global_area_pressedInv.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_global_area_pressedInv.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.button_global_areaInv.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_global_areaInv.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/button_global_areaInv.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Bitmap_Up.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Bitmap_Up.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Bitmap_Up.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Bitmap_Down.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Bitmap_Down.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Bitmap_Down.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.jogdirect30.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jogdirect30.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jogdirect30.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.jogdirect.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jogdirect.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/jogdirect.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Down.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Down.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Down.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.DownPressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/DownPressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/DownPressed.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Up.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Up.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Up.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.UpPressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/UpPressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/UpPressed.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.borderside.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/borderside.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/borderside.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.rect3325.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/rect3325.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/rect3325.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.rect3925.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/rect3925.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/rect3925.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.DownBmp.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/DownBmp.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/DownBmp.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.UpBmp.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/UpBmp.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/UpBmp.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.System.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/System.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/System.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Motor36.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Motor36.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Motor36.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.robot36.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/robot36.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/robot36.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.CalibBmp.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/CalibBmp.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/CalibBmp.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.close.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/close.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/close.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.IO.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/IO.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/IO.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Restart.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Restart.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Restart.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Refresh.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Refresh.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Refresh.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.help.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/help.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/help.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.RobotCalib.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/RobotCalib.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/RobotCalib.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.RobotGeo0.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/RobotGeo0.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/RobotGeo0.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.RobotGeo1.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/RobotGeo1.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/RobotGeo1.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.RobotGeo2.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/RobotGeo2.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/RobotGeo2.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.RobotGeo3.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/RobotGeo3.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/RobotGeo3.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.RobotGeo4.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/RobotGeo4.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/RobotGeo4.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.RobotGeo5.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/RobotGeo5.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/RobotGeo5.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.Workspace.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Workspace.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/Workspace.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.BrowseData.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/BrowseData.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/BrowseData.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.KBLower.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/KBLower.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/KBLower.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.KBNumeric.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/KBNumeric.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/KBNumeric.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.KBNumeric2.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/KBNumeric2.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/KBNumeric2.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.KBUpper.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/KBUpper.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/KBUpper.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.VarIcon.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/VarIcon.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/VarIcon.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.BRLogo.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/BRLogo.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/BRLogo.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.rect3926.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/rect3926.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/rect3926.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/bminfo.info.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/info.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Bitmaps/info.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


#Bitmaps END




# Trend Configuration
TRE_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/tre., $(notdir $(TRE_SOURCES_Visu:.tre=.vco)))

$(TEMP_PATH_Visu)/tre.Trend_Temperature.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Trends/Trend_Temperature.tre
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


#Trend Configuration END




# Trend Data
TRD_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/trd., $(notdir $(TRD_SOURCES_Visu:.trd=.vco)))

$(TEMP_PATH_Visu)/trd.CPUTemperature.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Trends/CPUTemperature.trd
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


$(TEMP_PATH_Visu)/trd.ROOMTemperature.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Trends/ROOMTemperature.trd
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


#Trend Data END




# Trend Data Configuration
TDC_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/tdc., $(notdir $(TDC_SOURCES_Visu:.tdc=.vco)))

$(TEMP_PATH_Visu)/tdc.TrendData.vco: $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Trends/TrendData.tdc
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_Visu)" $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas


#Trend Data Configuration END


#
# Borders
#
BDR_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Decrease.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Decrease_pressed.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Global_Area.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Global_Area_pressed.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Increase.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Increase_pressed.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Multi_Scroll_Down.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Multi_Scroll_Down_pressed.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Multi_Scroll_Up.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Multi_Scroll_Up_pressed.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Radio.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Radio_selected.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Scoll_Up.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Scoll_Up_pressed.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Scroll_Down.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Scroll_Down_pressed.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Scroll_Left.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Scroll_Left_pressed.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Scroll_Right.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Scroll_Right_pressed.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_pressed.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/SunkenNG.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/CheckBox_checked.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Flat_black.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Flat_grey.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/OverdriveBorder.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/ProgressBarBorder.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/RaisedInner.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Raised.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/SliderBorder09.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/SunkenOuter.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Sunken.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/SunkenNGgray.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/FrameGlobal.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/FrameInvisible.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_KeyRingOff.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_KeyRingOn.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/OutputBorder.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/InputBorder.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/GroupControl.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/LabelBoarder.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Control.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Control_pressed.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/TabActive.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Global_Area_pressedInv.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/Button_Global_AreaInv.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/ButtonUpFlat.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/ButtonUpPressedFlat.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/ButtonDownPressedFlat.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/ButtonDownFlat.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/LeftBorder.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/ButtonFlat.bdr $(AS_PROJECT_PATH)/Logical/Visualization/Visu/Borders/ButtonFlatPressed.bdr 
BDR_OBJECTS_Visu=$(TEMP_PATH_Visu)/bdr.Bordermanager.vco
$(TEMP_PATH_Visu)/bdr.Bordermanager.vco: $(BDR_SOURCES_Visu)
	$(VCC) -f "$<" -o "$@" -pkg "$(SRC_PATH_Visu)" $(BDRFLAGS_Visu) $(VCCFLAGS_Visu) -p Visu$(SRC_PATH_Visu)
#
# Logical fonts
#
$(TEMP_PATH_Visu)/lfnt.en.vco: $(TEMP_PATH_Visu)/en.lfnt $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" $(LFNTFLAGS_Visu) $(VCCFLAGS_Visu) -p Visu -sfas
$(TEMP_PATH_Visu)/lfnt.zh.vco: $(TEMP_PATH_Visu)/zh.lfnt $(VC_LANGUAGES_Visu)
	 $(VCC) -f "$<" -o "$@" $(LFNTFLAGS_Visu) $(VCCFLAGS_Visu) -p Visu -sfas
LFNT_OBJECTS_Visu=$(TEMP_PATH_Visu)/lfnt.en.vco $(TEMP_PATH_Visu)/lfnt.zh.vco 

#Runtime Object
$(VCR_OBJECT_Visu) : $(VCR_SOURCE_Visu)
	$(VCC) -f "$<" -o "$@" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -sl en $(VCCFLAGS_Visu) -rt  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4211 -sfas
# Local resources Library rules
LIB_LOCAL_RES_Visu=$(TEMP_PATH_Visu)/localres.vca
$(LIB_LOCAL_RES_Visu) : $(TEMP_PATH_Visu)/Visu02.ccf

# Bitmap Library rules
LIB_BMP_RES_Visu=$(TEMP_PATH_Visu)/bmpres.vca
$(LIB_BMP_RES_Visu) : $(TEMP_PATH_Visu)/Visu03.ccf
$(BMGRP_OBJECTS_Visu) : $(PALFILE_Visu) $(VC_LANGUAGES_Visu)
$(BMINFO_OBJECTS_Visu) : $(PALFILE_Visu)

BUILD_FILE_Visu=$(TEMP_PATH_Visu)/BuildFiles.arg
$(BUILD_FILE_Visu) : BUILD_FILE_CLEAN_Visu $(BUILD_SOURCES_Visu)
BUILD_FILE_CLEAN_Visu:
	$(RM) /F /Q "$(BUILD_FILE_Visu)" 2>nul
#All Modules depending to this project
PROJECT_MODULES_Visu=$(AS_CPU_PATH)/Visu01.br $(AS_CPU_PATH)/Visu02.br $(AS_CPU_PATH)/Visu03.br $(FONT_MODULES_Visu) $(SHARED_MODULE)

# General Build rules

$(TARGET_FILE_Visu): $(PROJECT_MODULES_Visu) $(TEMP_PATH_Visu)/Visu.prj
	$(MODGEN) -so $(VC_STATIC_OPTIONS_Visu) -fw "$(VCFIRMWAREPATH)" -m $(VCSTPOST) -v V1.11.2 -f "$(TEMP_PATH_Visu)/Visu.prj" -o "$@" -vc "$(VCOBJECT_Visu)" $(DEPENDENCIES_Visu) $(addprefix -d ,$(notdir $(PROJECT_MODULES_Visu:.br=)))

$(AS_CPU_PATH)/Visu01.br: $(TEMP_PATH_Visu)/Visu01.ccf
	$(MODGEN) -so $(VC_STATIC_OPTIONS_Visu) -fw "$(VCFIRMWAREPATH)" -m $(VCLOD) -v V1.11.2 -b -vc "$(VCOBJECT_Visu)" -f "$<" -o "$@" $(DEPENDENCIES_Visu)

$(AS_CPU_PATH)/Visu02.br: $(TEMP_PATH_Visu)/Visu02.ccf
	$(MODGEN) -so $(VC_STATIC_OPTIONS_Visu) -fw "$(VCFIRMWAREPATH)" -m $(VCLOD) -v V1.11.2 -b -vc "$(VCOBJECT_Visu)" -f "$<" -o "$@" $(DEPENDENCIES_Visu)

$(AS_CPU_PATH)/Visu03.br: $(TEMP_PATH_Visu)/Visu03.ccf
	$(MODGEN) -so $(VC_STATIC_OPTIONS_Visu) -fw "$(VCFIRMWAREPATH)" -m $(VCLOD) -v V1.11.2 -b -vc "$(VCOBJECT_Visu)" -f "$<" -o "$@" $(DEPENDENCIES_Visu)

# General Build rules END
$(LIB_LOCAL_OBJ_Visu) : $(TEMP_PATH_Visu)/Visu01.ccf

# Main Module
$(TEMP_PATH_ROOT_Visu)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/Visu.vcm:
$(TEMP_PATH_Visu)/Visu.prj: $(TEMP_PATH_ROOT_Visu)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/Visu.vcm
	$(VCDEP) -m "$(TEMP_PATH_ROOT_Visu)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/Visu.vcm" -s "$(AS_CPU_PATH)/VCShared/Shared.vcm" -p "$(AS_PATH)/AS/VC/Firmware" -c "$(AS_CPU_PATH)" -fw "$(VCFIRMWAREPATH)" -hw "$(CPUHWC)" -so $(VC_STATIC_OPTIONS_Visu) -o Visu -proj Visu
	$(VCPL) $(notdir $(PROJECT_MODULES_Visu:.br=,4)) Visu,2 -o "$@" -p Visu -vc "Visu" -verbose "False" -fl "$(TEMP_PATH_ROOT_Visu)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/Visu.vcm" -vcr "$(VCR_SOURCE_Visu)" -prj "$(AS_PROJECT_PATH)" -warningLevel2 -sfas

# 01 Module

DEL_TARGET01_LFL_Visu=$(TEMP_PATH_Visu)\Visu01.ccf.lfl
$(TEMP_PATH_Visu)/Visu01.ccf: $(LIB_SHARED) $(SHARED_CCF) $(LIB_BMP_RES_Visu) $(TEMP_PATH_Visu)/Visu03.ccf $(LIB_LOCAL_RES_Visu) $(TEMP_PATH_Visu)/Visu02.ccf $(DIS_OBJECTS_Visu) $(PAGE_OBJECTS_Visu) $(VCS_OBJECTS_Visu) $(VCVK_OBJECTS_Visu) $(VCRT_OBJECTS_Visu) $(TPR_OBJECTS_Visu) $(TXTGRP_OBJECTS_Visu) $(LAYER_OBJECTS_Visu) $(VCR_OBJECT_Visu) $(TDC_OBJECTS_Visu) $(TRD_OBJECTS_Visu) $(TRE_OBJECTS_Visu) $(PRC_OBJECTS_Visu) $(SCR_OBJECTS_Visu)
	-@CMD if exist /Q "$(DEL_TARGET01_LFL_Visu)" /C DEL /F /Q "$(DEL_TARGET01_LFL_Visu)" 2>nul
	@$(VCFLGEN) "$@.lfl" "$(LIB_SHARED)" -temp "$(TEMP_PATH_Visu)" -prj "$(PRJ_PATH_Visu)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(LIB_BMP_RES_Visu)" -temp "$(TEMP_PATH_Visu)" -prj "$(PRJ_PATH_Visu)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(LIB_LOCAL_RES_Visu)" -temp "$(TEMP_PATH_Visu)" -prj "$(PRJ_PATH_Visu)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(DIS_OBJECTS_Visu:.vco=.vco,)" -temp "$(TEMP_PATH_Visu)" -prj "$(PRJ_PATH_Visu)" -sfas
	@$(VCFLGEN) "$@.lfl" -mask .page -vcp "$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Package.vcp" -temp "$(TEMP_PATH_Visu)" -prj "$(PRJ_PATH_Visu)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(VCS_OBJECTS_Visu:.vco=.vco,)" -temp "$(TEMP_PATH_Visu)" -prj "$(PRJ_PATH_Visu)" -sfas
	@$(VCFLGEN) "$@.lfl" -mask .vcvk -vcp "$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Package.vcp" -temp "$(TEMP_PATH_Visu)" -prj "$(PRJ_PATH_Visu)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(VCRT_OBJECTS_Visu:.vco=.vco,)" -temp "$(TEMP_PATH_Visu)" -prj "$(PRJ_PATH_Visu)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(TPR_OBJECTS_Visu:.vco=.vco,)" -temp "$(TEMP_PATH_Visu)" -prj "$(PRJ_PATH_Visu)" -sfas
	@$(VCFLGEN) "$@.lfl" -mask .txtgrp -vcp "$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Package.vcp" -temp "$(TEMP_PATH_Visu)" -prj "$(PRJ_PATH_Visu)" -sfas
	@$(VCFLGEN) "$@.lfl" -mask .layer -vcp "$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Package.vcp" -temp "$(TEMP_PATH_Visu)" -prj "$(PRJ_PATH_Visu)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(VCR_OBJECT_Visu:.vco=.vco,)" -temp "$(TEMP_PATH_Visu)" -prj "$(PRJ_PATH_Visu)" -sfas
	@$(VCFLGEN) "$@.lfl" -mask .tdc -vcp "$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Package.vcp" -temp "$(TEMP_PATH_Visu)" -prj "$(PRJ_PATH_Visu)" -sfas
	@$(VCFLGEN) "$@.lfl" -mask .trd -vcp "$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Package.vcp" -temp "$(TEMP_PATH_Visu)" -prj "$(PRJ_PATH_Visu)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(TRE_OBJECTS_Visu:.vco=.vco,)" -temp "$(TEMP_PATH_Visu)" -prj "$(PRJ_PATH_Visu)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(PRC_OBJECTS_Visu:.vco=.vco,)" -temp "$(TEMP_PATH_Visu)" -prj "$(PRJ_PATH_Visu)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(SCR_OBJECTS_Visu:.vco=.vco,)" -temp "$(TEMP_PATH_Visu)" -prj "$(PRJ_PATH_Visu)" -sfas
	$(LINK) "$@.lfl" -o "$@" -p Visu -lib "$(LIB_LOCAL_OBJ_Visu)" -P "$(AS_PROJECT_PATH)" -m "local objects" -profile "False" -warningLevel2 -vcr 4211 -sfas
# 01 Module END

# 02 Module

DEL_TARGET02_LFL_Visu=$(TEMP_PATH_Visu)\Visu02.ccf.lfl
$(TEMP_PATH_Visu)/Visu02.ccf: $(LIB_SHARED) $(SHARED_CCF) $(LIB_BMP_RES_Visu) $(TEMP_PATH_Visu)/Visu03.ccf $(BDR_OBJECTS_Visu) $(LFNT_OBJECTS_Visu) $(CLM_OBJECTS_Visu)
	-@CMD if exist /Q "$(DEL_TARGET02_LFL_Visu)" /C DEL /F /Q "$(DEL_TARGET02_LFL_Visu)" 2>nul
	@$(VCFLGEN) "$@.lfl" "$(LIB_SHARED)" -temp "$(TEMP_PATH_Visu)" -prj "$(PRJ_PATH_Visu)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(LIB_BMP_RES_Visu)" -temp "$(TEMP_PATH_Visu)" -prj "$(PRJ_PATH_Visu)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(BDR_OBJECTS_Visu:.vco=.vco,)" -temp "$(TEMP_PATH_Visu)" -prj "$(PRJ_PATH_Visu)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(LFNT_OBJECTS_Visu:.vco=.vco,)" -temp "$(TEMP_PATH_Visu)" -prj "$(PRJ_PATH_Visu)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(CLM_OBJECTS_Visu:.vco=.vco,)" -temp "$(TEMP_PATH_Visu)" -prj "$(PRJ_PATH_Visu)" -sfas
	$(LINK) "$@.lfl" -o "$@" -p Visu -lib "$(LIB_LOCAL_RES_Visu)" -P "$(AS_PROJECT_PATH)" -m "local resources" -profile "False" -warningLevel2 -vcr 4211 -sfas
# 02 Module END

# 03 Module

DEL_TARGET03_LFL_Visu=$(TEMP_PATH_Visu)\Visu03.ccf.lfl
$(TEMP_PATH_Visu)/Visu03.ccf: $(LIB_SHARED) $(SHARED_CCF) $(BMGRP_OBJECTS_Visu) $(BMINFO_OBJECTS_Visu) $(PALFILE_Visu)
	-@CMD if exist /Q "$(DEL_TARGET03_LFL_Visu)" /C DEL /F /Q "$(DEL_TARGET03_LFL_Visu)" 2>nul
	@$(VCFLGEN) "$@.lfl" "$(LIB_SHARED)" -temp "$(TEMP_PATH_Visu)" -prj "$(PRJ_PATH_Visu)" -sfas
	@$(VCFLGEN) "$@.lfl" -mask .bmgrp -vcp "$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Package.vcp" -temp "$(TEMP_PATH_Visu)" -prj "$(PRJ_PATH_Visu)" -sfas
	@$(VCFLGEN) "$@.lfl" -mask .bminfo -vcp "$(AS_PROJECT_PATH)/Logical/Visualization/Visu/Package.vcp" -temp "$(TEMP_PATH_Visu)" -prj "$(PRJ_PATH_Visu)" -sfas
	$(LINK) "$@.lfl" -o "$@" -p Visu -lib "$(LIB_BMP_RES_Visu)" -P "$(AS_PROJECT_PATH)" -m "bitmap resources" -profile "False" -warningLevel2 -vcr 4211 -sfas
# 03 Module END

# Post Build Steps

.PHONY : vcPostBuild_Visu

vcPostBuild_Visu :
	$(VCC) -pb -vcm "$(TEMP_PATH_Visu)/MODULEFILES.vcm" -fw "$(VCFIRMWAREPATH)" $(VCCFLAGS_Visu) -p Visu -vcr 4211 -sfas

# Post Build Steps END
