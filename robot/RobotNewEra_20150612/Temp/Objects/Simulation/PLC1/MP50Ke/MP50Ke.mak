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
PALFILE_MP50Ke=$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Palette.vcr
VCCFLAGS_MP50Ke=-server -proj MP50Ke -vc "$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/VCObject.vc" -prj_path "$(AS_PROJECT_PATH)" -temp_path "$(AS_TEMP_PATH)" -cfg $(AS_CONFIGURATION) -plc $(AS_PLC) -plctemp $(AS_TEMP_PLC) -cpu_path "$(AS_CPU_PATH)"
VCFIRMWARE=4.24.0
VCFIRMWAREPATH=$(AS_VC_PATH)/Firmware/V4.24.0/SG4
VCOBJECT_MP50Ke=$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/VCObject.vc
VCSTARTUP="vcstart.br"
VCLOD="vclod.br"
VCSTPOST="vcstpost.br"
TARGET_FILE_MP50Ke=$(AS_CPU_PATH)/MP50Ke.br
OBJ_SCOPE_MP50Ke=Visualization
PRJ_PATH_MP50Ke=$(AS_PROJECT_PATH)
SRC_PATH_MP50Ke=$(AS_PROJECT_PATH)/Logical/$(OBJ_SCOPE_MP50Ke)/MP50Key
TEMP_PATH_MP50Ke=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/MP50Ke
TEMP_PATH_Shared=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared
TEMP_PATH_ROOT_MP50Ke=$(AS_TEMP_PATH)
VC_LIBRARY_LIST_MP50Ke=$(TEMP_PATH_MP50Ke)/libraries.vci
VC_XREF_BUILDFILE_MP50Ke=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/vcxref.build
VC_XREF_CLEANFILE=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/vcxref.clean
VC_LANGUAGES_MP50Ke=$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr
CPUHWC="$(TEMP_PATH_MP50Ke)/cpuhwc.vci"
VC_STATIC_OPTIONS_MP50Ke="$(TEMP_PATH_MP50Ke)/vcStaticOptions.xml"
VC_STATIC_OPTIONS_Shared="$(TEMP_PATH_Shared)/vcStaticOptions.xml"
# include Shared and Font Makefile (only once)
	include $(AS_TEMP_PATH)/objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCFntDat/Font_MP50Ke.mak
ifneq ($(VCINC),1)
	VCINC=1
	include $(AS_TEMP_PATH)/objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/VCShared.mak
endif

DEPENDENCIES_MP50Ke=-d vcgclass -profile "False"
DEFAULT_STYLE_SHEET_MP50Ke=Source[local].StyleSheet[Color]
SHARED_MODULE=$(TEMP_PATH_ROOT_MP50Ke)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/vcshared.br
LFNTFLAGS_MP50Ke=-P "$(AS_PROJECT_PATH)" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)"
BDRFLAGS_MP50Ke=-P "$(AS_PROJECT_PATH)" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)"

# Local Libs
LIB_LOCAL_OBJ_MP50Ke=$(TEMP_PATH_MP50Ke)/localobj.vca

# Hardware sources
PANEL_HW_OBJECT_MP50Ke=$(TEMP_PATH_ROOT_MP50Ke)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/MP50Ke/dis.Hardware.vco
PANEL_HW_VCI_MP50Ke=$(TEMP_PATH_ROOT_MP50Ke)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/MP50Ke/dis.Hardware.vci
PANEL_HW_SOURCE_MP50Ke=D:/AS/workspace/projects/RobotNewEra_20150612/Physical/Simulation/Hardware.hw 
DIS_OBJECTS_MP50Ke=$(PANEL_HW_OBJECT_MP50Ke) $(KEYMAP_OBJECTS_MP50Ke)

# KeyMapping flags
KEYMAP_SOURCES_MP50Ke=
KEYMAP_OBJECTS_MP50Ke=

# All Source Objects
TXTGRP_SOURCES_MP50Ke=$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/TextGroups/SwitchStatus.txtgrp 

FNINFO_SOURCES_MP50Ke=$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Fonts/DefaultFont.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Fonts/Arial10pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Fonts/Arial9pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Fonts/Arial9pxValue.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Fonts/Arial9px.fninfo 

BMINFO_SOURCES_MP50Ke=$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/MP50.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/ProgressBorder.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/backward_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/backward_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/control_button_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/control_button_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/down_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/down_active_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/down_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/down_pressed_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/forward_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/forward_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/frame_header.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/global_area_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/global_area_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/left_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/left_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/multi_down_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/multi_down_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/multi_up_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/multi_up_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/right_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/right_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/up_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/up_active_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/up_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/up_pressed_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneAlphaPadQVGA1_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneAlphaPadQVGA1_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneAlphaPadQVGA2_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneAlphaPadQVGA3_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneAlphaPad_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneAlphaPad_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneEditPadQVGA3_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneEditPadVga_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneEditPadVga_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneEditpadQVGA2_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneListPadHor_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneListPadHor_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneListPadVer_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneListPadVer_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneNumPad_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneNumPad_released.bminfo 

BMGRP_SOURCES_MP50Ke=$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/BitmapGroups/AlphaPadQVGA.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/BitmapGroups/Borders.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/BitmapGroups/NavigationPad.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/BitmapGroups/NumPad.bmgrp 

PAGE_SOURCES_MP50Ke=$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Pages/Init_Page.page 

VCS_SOURCES_MP50Ke=$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/StyleSheets/Color.vcs \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/StyleSheets/Gray.vcs 

BDR_SOURCES_MP50Ke=$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/Bump.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/Flat_black.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/Flat_grey.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/RaisedInner.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/Raised.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/Sunken.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/BackwardActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/BackwardPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/ControlActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/ControlPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/DownActiveControl.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/DownPressedControl.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/ForwardActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/ForwardPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/GlobalAreaActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/GlobalAreaPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/MultiScrollDownActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/MultiScrollDownPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/MultiScrollUpActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/ScrollDownActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/ScrollDownPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/ScrollLeftActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/ScrollLeftPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/ScrollRightActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/ScrollRightPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/ScrollUpActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/ScrollUpPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/UpActiveControl.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/UpPressedControl.bdr 

TPR_SOURCES_MP50Ke=$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/TouchPads/AlphaPad.tpr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/TouchPads/EditPad.tpr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/TouchPads/AlphaPadQVGA.tpr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/TouchPads/NavigationPad_hor.tpr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/TouchPads/NavigationPad_ver.tpr \
	$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/TouchPads/NumPad.tpr 

TDC_SOURCES_MP50Ke=$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Trends/TrendData.tdc 

VCVK_SOURCES_MP50Ke=$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/VirtualKeys.vcvk 

VCR_SOURCES_MP50Ke=$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Palette.vcr 

# Runtime Object sources
VCR_OBJECT_MP50Ke=$(TEMP_PATH_MP50Ke)/vcrt.vco
VCR_SOURCE_MP50Ke=$(SRC_PATH_MP50Ke)/package.vcp
# All Source Objects END

#Panel Hardware
$(PANEL_HW_VCI_MP50Ke): $(PANEL_HW_SOURCE_MP50Ke)
	$(VCHWPP) -f "$<" -o "$@" -n MP50Key -d MP50Ke -pal "$(PALFILE_MP50Ke)" -c "$(AS_CONFIGURATION)" -p "$(AS_PLC)" -ptemp "$(AS_TEMP_PLC)" -B "D4.24" -L "asrfbext: V*, visapi: V*" -verbose "False" -profile "False" -hw "$(CPUHWC)" -warninglevel 2 -so $(VC_STATIC_OPTIONS_MP50Ke) -sos $(VC_STATIC_OPTIONS_Shared) -fp "$(AS_VC_PATH)/Firmware/V4.24.0/SG4" -sfas -prj "$(AS_PROJECT_PATH)" -apj "RobotNewEra" -vcob "$(VCOBJECT_MP50Ke)"

$(PANEL_HW_OBJECT_MP50Ke): $(PANEL_HW_VCI_MP50Ke) $(PALFILE_MP50Ke) $(VC_LIBRARY_LIST_MP50Ke) $(KEYMAP_SOURCES_MP50Ke)
	$(VCC) -f "$(subst .vco,.vci,$@)" -o "$@" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -k "$(VCVK_SOURCES_MP50Ke)" $(VCCFLAGS_MP50Ke) -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


# Pages
PAGE_OBJECTS_MP50Ke = $(addprefix $(TEMP_PATH_MP50Ke)/page., $(notdir $(PAGE_SOURCES_MP50Ke:.page=.vco)))

$(TEMP_PATH_MP50Ke)/page.Init_Page.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Pages/Init_Page.page $(VC_LANGUAGES_MP50Ke)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke) -P "$(AS_PROJECT_PATH)" -ds "$(SRC_PATH_MP50Ke)/StyleSheets/Color.vcs" -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


#Pages END




# Stylesheets
VCS_OBJECTS_MP50Ke = $(addprefix $(TEMP_PATH_MP50Ke)/vcs., $(notdir $(VCS_SOURCES_MP50Ke:.vcs=.vco)))

$(TEMP_PATH_MP50Ke)/vcs.Color.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/StyleSheets/Color.vcs
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke) -P "$(AS_PROJECT_PATH)" -ds $(DEFAULT_STYLE_SHEET_MP50Ke) -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/vcs.Gray.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/StyleSheets/Gray.vcs
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke) -P "$(AS_PROJECT_PATH)" -ds $(DEFAULT_STYLE_SHEET_MP50Ke) -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


#Stylesheets END




# Virtual Keys
VCVK_OBJECTS_MP50Ke = $(addprefix $(TEMP_PATH_MP50Ke)/vcvk., $(notdir $(VCVK_SOURCES_MP50Ke:.vcvk=.vco)))

$(TEMP_PATH_MP50Ke)/vcvk.VirtualKeys.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/VirtualKeys.vcvk
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas

$(VCVK_OBJECTS_MP50Ke): $(VC_LANGUAGES_MP50Ke)

#Virtual Keys END




# Touch Pads
TPR_OBJECTS_MP50Ke = $(addprefix $(TEMP_PATH_MP50Ke)/tpr., $(notdir $(TPR_SOURCES_MP50Ke:.tpr=.vco)))

$(TEMP_PATH_MP50Ke)/tpr.AlphaPad.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/TouchPads/AlphaPad.tpr
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke) -prj "D:/AS/workspace/projects/RobotNewEra_20150612/Logical/Visualization/MP50Key" -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/tpr.EditPad.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/TouchPads/EditPad.tpr
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke) -prj "D:/AS/workspace/projects/RobotNewEra_20150612/Logical/Visualization/MP50Key" -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/tpr.AlphaPadQVGA.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/TouchPads/AlphaPadQVGA.tpr
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke) -prj "D:/AS/workspace/projects/RobotNewEra_20150612/Logical/Visualization/MP50Key" -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/tpr.NavigationPad_hor.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/TouchPads/NavigationPad_hor.tpr
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke) -prj "D:/AS/workspace/projects/RobotNewEra_20150612/Logical/Visualization/MP50Key" -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/tpr.NavigationPad_ver.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/TouchPads/NavigationPad_ver.tpr
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke) -prj "D:/AS/workspace/projects/RobotNewEra_20150612/Logical/Visualization/MP50Key" -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/tpr.NumPad.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/TouchPads/NumPad.tpr
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke) -prj "D:/AS/workspace/projects/RobotNewEra_20150612/Logical/Visualization/MP50Key" -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


#Touch Pads END




# Text Groups
TXTGRP_OBJECTS_MP50Ke = $(addprefix $(TEMP_PATH_MP50Ke)/txtgrp., $(notdir $(TXTGRP_SOURCES_MP50Ke:.txtgrp=.vco)))

$(TEMP_PATH_MP50Ke)/txtgrp.SwitchStatus.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/TextGroups/SwitchStatus.txtgrp $(VC_LANGUAGES_MP50Ke)
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


#Text Groups END




# BitmapGroups
BMGRP_OBJECTS_MP50Ke = $(addprefix $(TEMP_PATH_MP50Ke)/bmgrp., $(notdir $(BMGRP_SOURCES_MP50Ke:.bmgrp=.vco)))

$(TEMP_PATH_MP50Ke)/bmgrp.AlphaPadQVGA.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/BitmapGroups/AlphaPadQVGA.bmgrp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bmgrp.Borders.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/BitmapGroups/Borders.bmgrp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bmgrp.NavigationPad.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/BitmapGroups/NavigationPad.bmgrp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bmgrp.NumPad.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/BitmapGroups/NumPad.bmgrp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


#BitmapGroups END




# Bitmaps
BMINFO_OBJECTS_MP50Ke = $(addprefix $(TEMP_PATH_MP50Ke)/bminfo., $(notdir $(BMINFO_SOURCES_MP50Ke:.bminfo=.vco)))

$(TEMP_PATH_MP50Ke)/bminfo.MP50.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/MP50.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/MP50.png
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.ProgressBorder.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/ProgressBorder.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/ProgressBorder.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.backward_active.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/backward_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/backward_active.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.backward_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/backward_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/backward_pressed.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.control_button_active.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/control_button_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/control_button_active.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.control_button_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/control_button_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/control_button_pressed.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.down_active.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/down_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/down_active.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.down_active_control.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/down_active_control.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/down_active_control.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.down_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/down_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/down_pressed.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.down_pressed_control.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/down_pressed_control.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/down_pressed_control.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.forward_active.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/forward_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/forward_active.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.forward_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/forward_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/forward_pressed.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.frame_header.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/frame_header.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/frame_header.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.global_area_active.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/global_area_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/global_area_active.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.global_area_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/global_area_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/global_area_pressed.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.left_active.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/left_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/left_active.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.left_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/left_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/left_pressed.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.multi_down_active.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/multi_down_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/multi_down_active.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.multi_down_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/multi_down_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/multi_down_pressed.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.multi_up_active.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/multi_up_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/multi_up_active.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.multi_up_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/multi_up_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/multi_up_pressed.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.right_active.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/right_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/right_active.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.right_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/right_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/right_pressed.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.up_active.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/up_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/up_active.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.up_active_control.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/up_active_control.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/up_active_control.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.up_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/up_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/up_pressed.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.up_pressed_control.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/up_pressed_control.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/up_pressed_control.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.zuneAlphaPadQVGA1_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneAlphaPadQVGA1_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneAlphaPadQVGA1_pressed.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.zuneAlphaPadQVGA1_released.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneAlphaPadQVGA1_released.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneAlphaPadQVGA1_released.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.zuneAlphaPadQVGA2_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneAlphaPadQVGA2_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneAlphaPadQVGA2_pressed.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.zuneAlphaPadQVGA3_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneAlphaPadQVGA3_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneAlphaPadQVGA3_pressed.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.zuneAlphaPad_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneAlphaPad_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneAlphaPad_pressed.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.zuneAlphaPad_released.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneAlphaPad_released.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneAlphaPad_released.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.zuneEditPadQVGA3_released.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneEditPadQVGA3_released.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneEditPadQVGA3_released.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.zuneEditPadVga_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneEditPadVga_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneEditPadVga_pressed.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.zuneEditPadVga_released.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneEditPadVga_released.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneEditPadVga_released.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.zuneEditpadQVGA2_released.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneEditpadQVGA2_released.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneEditpadQVGA2_released.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.zuneListPadHor_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneListPadHor_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneListPadHor_pressed.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.zuneListPadHor_released.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneListPadHor_released.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneListPadHor_released.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.zuneListPadVer_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneListPadVer_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneListPadVer_pressed.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.zuneListPadVer_released.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneListPadVer_released.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneListPadVer_released.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.zuneNumPad_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneNumPad_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneNumPad_pressed.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


$(TEMP_PATH_MP50Ke)/bminfo.zuneNumPad_released.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneNumPad_released.bminfo $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Bitmaps/zuneNumPad_released.bmp
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


#Bitmaps END




# Trend Data Configuration
TDC_OBJECTS_MP50Ke = $(addprefix $(TEMP_PATH_MP50Ke)/tdc., $(notdir $(TDC_SOURCES_MP50Ke:.tdc=.vco)))

$(TEMP_PATH_MP50Ke)/tdc.TrendData.vco: $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Trends/TrendData.tdc
	 $(VCC) -f "$<" -o "$@" -l "$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -pal "$(PALFILE_MP50Ke)" $(VCCFLAGS_MP50Ke)  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas


#Trend Data Configuration END


#
# Borders
#
BDR_SOURCES_MP50Ke=$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/Bump.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/Flat_black.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/Flat_grey.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/RaisedInner.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/Raised.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/Sunken.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/BackwardActive.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/BackwardPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/ControlActive.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/ControlPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/DownActiveControl.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/DownPressedControl.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/ForwardActive.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/ForwardPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/GlobalAreaActive.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/GlobalAreaPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/MultiScrollDownActive.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/MultiScrollDownPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/MultiScrollUpActive.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/ScrollDownActive.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/ScrollDownPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/ScrollLeftActive.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/ScrollLeftPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/ScrollRightActive.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/ScrollRightPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/ScrollUpActive.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/ScrollUpPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/UpActiveControl.bdr $(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Borders/UpPressedControl.bdr 
BDR_OBJECTS_MP50Ke=$(TEMP_PATH_MP50Ke)/bdr.Bordermanager.vco
$(TEMP_PATH_MP50Ke)/bdr.Bordermanager.vco: $(BDR_SOURCES_MP50Ke)
	$(VCC) -f "$<" -o "$@" -pkg "$(SRC_PATH_MP50Ke)" $(BDRFLAGS_MP50Ke) $(VCCFLAGS_MP50Ke) -p MP50Ke$(SRC_PATH_MP50Ke)
#
# Logical fonts
#
$(TEMP_PATH_MP50Ke)/lfnt.en.vco: $(TEMP_PATH_MP50Ke)/en.lfnt $(VC_LANGUAGES_MP50Ke)
	 $(VCC) -f "$<" -o "$@" $(LFNTFLAGS_MP50Ke) $(VCCFLAGS_MP50Ke) -p MP50Ke -sfas
$(TEMP_PATH_MP50Ke)/lfnt.zh.vco: $(TEMP_PATH_MP50Ke)/zh.lfnt $(VC_LANGUAGES_MP50Ke)
	 $(VCC) -f "$<" -o "$@" $(LFNTFLAGS_MP50Ke) $(VCCFLAGS_MP50Ke) -p MP50Ke -sfas
LFNT_OBJECTS_MP50Ke=$(TEMP_PATH_MP50Ke)/lfnt.en.vco $(TEMP_PATH_MP50Ke)/lfnt.zh.vco 

#Runtime Object
$(VCR_OBJECT_MP50Ke) : $(VCR_SOURCE_MP50Ke)
	$(VCC) -f "$<" -o "$@" -cv "$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo" -sl en $(VCCFLAGS_MP50Ke) -rt  -p MP50Ke -so $(VC_STATIC_OPTIONS_MP50Ke) -vcr 4240 -sfas
# Local resources Library rules
LIB_LOCAL_RES_MP50Ke=$(TEMP_PATH_MP50Ke)/localres.vca
$(LIB_LOCAL_RES_MP50Ke) : $(TEMP_PATH_MP50Ke)/MP50Ke02.ccf

# Bitmap Library rules
LIB_BMP_RES_MP50Ke=$(TEMP_PATH_MP50Ke)/bmpres.vca
$(LIB_BMP_RES_MP50Ke) : $(TEMP_PATH_MP50Ke)/MP50Ke03.ccf
$(BMGRP_OBJECTS_MP50Ke) : $(PALFILE_MP50Ke) $(VC_LANGUAGES_MP50Ke)
$(BMINFO_OBJECTS_MP50Ke) : $(PALFILE_MP50Ke)

BUILD_FILE_MP50Ke=$(TEMP_PATH_MP50Ke)/BuildFiles.arg
$(BUILD_FILE_MP50Ke) : BUILD_FILE_CLEAN_MP50Ke $(BUILD_SOURCES_MP50Ke)
BUILD_FILE_CLEAN_MP50Ke:
	$(RM) /F /Q "$(BUILD_FILE_MP50Ke)" 2>nul
#All Modules depending to this project
PROJECT_MODULES_MP50Ke=$(AS_CPU_PATH)/MP50Ke01.br $(AS_CPU_PATH)/MP50Ke02.br $(AS_CPU_PATH)/MP50Ke03.br $(FONT_MODULES_MP50Ke) $(SHARED_MODULE)

# General Build rules

$(TARGET_FILE_MP50Ke): $(PROJECT_MODULES_MP50Ke) $(TEMP_PATH_MP50Ke)/MP50Ke.prj
	$(MODGEN) -so $(VC_STATIC_OPTIONS_MP50Ke) -fw "$(VCFIRMWAREPATH)" -m $(VCSTPOST) -v V1.11.2 -f "$(TEMP_PATH_MP50Ke)/MP50Ke.prj" -o "$@" -vc "$(VCOBJECT_MP50Ke)" $(DEPENDENCIES_MP50Ke) $(addprefix -d ,$(notdir $(PROJECT_MODULES_MP50Ke:.br=)))

$(AS_CPU_PATH)/MP50Ke01.br: $(TEMP_PATH_MP50Ke)/MP50Ke01.ccf
	$(MODGEN) -so $(VC_STATIC_OPTIONS_MP50Ke) -fw "$(VCFIRMWAREPATH)" -m $(VCLOD) -v V1.11.2 -b -vc "$(VCOBJECT_MP50Ke)" -f "$<" -o "$@" $(DEPENDENCIES_MP50Ke)

$(AS_CPU_PATH)/MP50Ke02.br: $(TEMP_PATH_MP50Ke)/MP50Ke02.ccf
	$(MODGEN) -so $(VC_STATIC_OPTIONS_MP50Ke) -fw "$(VCFIRMWAREPATH)" -m $(VCLOD) -v V1.11.2 -b -vc "$(VCOBJECT_MP50Ke)" -f "$<" -o "$@" $(DEPENDENCIES_MP50Ke)

$(AS_CPU_PATH)/MP50Ke03.br: $(TEMP_PATH_MP50Ke)/MP50Ke03.ccf
	$(MODGEN) -so $(VC_STATIC_OPTIONS_MP50Ke) -fw "$(VCFIRMWAREPATH)" -m $(VCLOD) -v V1.11.2 -b -vc "$(VCOBJECT_MP50Ke)" -f "$<" -o "$@" $(DEPENDENCIES_MP50Ke)

# General Build rules END
$(LIB_LOCAL_OBJ_MP50Ke) : $(TEMP_PATH_MP50Ke)/MP50Ke01.ccf

# Main Module
$(TEMP_PATH_ROOT_MP50Ke)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/MP50Ke.vcm:
$(TEMP_PATH_MP50Ke)/MP50Ke.prj: $(TEMP_PATH_ROOT_MP50Ke)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/MP50Ke.vcm
	$(VCDEP) -m "$(TEMP_PATH_ROOT_MP50Ke)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/MP50Ke.vcm" -s "$(AS_CPU_PATH)/VCShared/Shared.vcm" -p "$(AS_PATH)/AS/VC/Firmware" -c "$(AS_CPU_PATH)" -fw "$(VCFIRMWAREPATH)" -hw "$(CPUHWC)" -so $(VC_STATIC_OPTIONS_MP50Ke) -o MP50Ke -proj MP50Ke
	$(VCPL) $(notdir $(PROJECT_MODULES_MP50Ke:.br=,4)) MP50Ke,2 -o "$@" -p MP50Ke -vc "MP50Ke" -verbose "False" -fl "$(TEMP_PATH_ROOT_MP50Ke)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/MP50Ke.vcm" -vcr "$(VCR_SOURCE_MP50Ke)" -prj "$(AS_PROJECT_PATH)" -warningLevel2 -sfas

# 01 Module

DEL_TARGET01_LFL_MP50Ke=$(TEMP_PATH_MP50Ke)\MP50Ke01.ccf.lfl
$(TEMP_PATH_MP50Ke)/MP50Ke01.ccf: $(LIB_SHARED) $(SHARED_CCF) $(LIB_BMP_RES_MP50Ke) $(TEMP_PATH_MP50Ke)/MP50Ke03.ccf $(LIB_LOCAL_RES_MP50Ke) $(TEMP_PATH_MP50Ke)/MP50Ke02.ccf $(DIS_OBJECTS_MP50Ke) $(PAGE_OBJECTS_MP50Ke) $(VCS_OBJECTS_MP50Ke) $(VCVK_OBJECTS_MP50Ke) $(VCRT_OBJECTS_MP50Ke) $(TPR_OBJECTS_MP50Ke) $(TXTGRP_OBJECTS_MP50Ke) $(LAYER_OBJECTS_MP50Ke) $(VCR_OBJECT_MP50Ke) $(TDC_OBJECTS_MP50Ke) $(TRD_OBJECTS_MP50Ke) $(TRE_OBJECTS_MP50Ke) $(PRC_OBJECTS_MP50Ke) $(SCR_OBJECTS_MP50Ke)
	-@CMD /Q /C if exist "$(DEL_TARGET01_LFL_MP50Ke)" DEL /F /Q "$(DEL_TARGET01_LFL_MP50Ke)" 2>nul
	@$(VCFLGEN) "$@.lfl" "$(LIB_SHARED)" -temp "$(TEMP_PATH_MP50Ke)" -prj "$(PRJ_PATH_MP50Ke)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(LIB_BMP_RES_MP50Ke)" -temp "$(TEMP_PATH_MP50Ke)" -prj "$(PRJ_PATH_MP50Ke)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(LIB_LOCAL_RES_MP50Ke)" -temp "$(TEMP_PATH_MP50Ke)" -prj "$(PRJ_PATH_MP50Ke)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(DIS_OBJECTS_MP50Ke:.vco=.vco|)" -temp "$(TEMP_PATH_MP50Ke)" -prj "$(PRJ_PATH_MP50Ke)" -sfas
	@$(VCFLGEN) "$@.lfl" -mask .page -vcp "$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Package.vcp" -temp "$(TEMP_PATH_MP50Ke)" -prj "$(PRJ_PATH_MP50Ke)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(VCS_OBJECTS_MP50Ke:.vco=.vco|)" -temp "$(TEMP_PATH_MP50Ke)" -prj "$(PRJ_PATH_MP50Ke)" -sfas
	@$(VCFLGEN) "$@.lfl" -mask .vcvk -vcp "$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Package.vcp" -temp "$(TEMP_PATH_MP50Ke)" -prj "$(PRJ_PATH_MP50Ke)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(VCRT_OBJECTS_MP50Ke:.vco=.vco|)" -temp "$(TEMP_PATH_MP50Ke)" -prj "$(PRJ_PATH_MP50Ke)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(TPR_OBJECTS_MP50Ke:.vco=.vco|)" -temp "$(TEMP_PATH_MP50Ke)" -prj "$(PRJ_PATH_MP50Ke)" -sfas
	@$(VCFLGEN) "$@.lfl" -mask .txtgrp -vcp "$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Package.vcp" -temp "$(TEMP_PATH_MP50Ke)" -prj "$(PRJ_PATH_MP50Ke)" -sfas
	@$(VCFLGEN) "$@.lfl" -mask .layer -vcp "$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Package.vcp" -temp "$(TEMP_PATH_MP50Ke)" -prj "$(PRJ_PATH_MP50Ke)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(VCR_OBJECT_MP50Ke:.vco=.vco|)" -temp "$(TEMP_PATH_MP50Ke)" -prj "$(PRJ_PATH_MP50Ke)" -sfas
	@$(VCFLGEN) "$@.lfl" -mask .tdc -vcp "$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Package.vcp" -temp "$(TEMP_PATH_MP50Ke)" -prj "$(PRJ_PATH_MP50Ke)" -sfas
	@$(VCFLGEN) "$@.lfl" -mask .trd -vcp "$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Package.vcp" -temp "$(TEMP_PATH_MP50Ke)" -prj "$(PRJ_PATH_MP50Ke)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(TRE_OBJECTS_MP50Ke:.vco=.vco|)" -temp "$(TEMP_PATH_MP50Ke)" -prj "$(PRJ_PATH_MP50Ke)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(PRC_OBJECTS_MP50Ke:.vco=.vco|)" -temp "$(TEMP_PATH_MP50Ke)" -prj "$(PRJ_PATH_MP50Ke)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(SCR_OBJECTS_MP50Ke:.vco=.vco|)" -temp "$(TEMP_PATH_MP50Ke)" -prj "$(PRJ_PATH_MP50Ke)" -sfas
	$(LINK) "$@.lfl" -o "$@" -p MP50Ke -lib "$(LIB_LOCAL_OBJ_MP50Ke)" -P "$(AS_PROJECT_PATH)" -m "local objects" -profile "False" -warningLevel2 -vcr 4240 -sfas
# 01 Module END

# 02 Module

DEL_TARGET02_LFL_MP50Ke=$(TEMP_PATH_MP50Ke)\MP50Ke02.ccf.lfl
$(TEMP_PATH_MP50Ke)/MP50Ke02.ccf: $(LIB_SHARED) $(SHARED_CCF) $(LIB_BMP_RES_MP50Ke) $(TEMP_PATH_MP50Ke)/MP50Ke03.ccf $(BDR_OBJECTS_MP50Ke) $(LFNT_OBJECTS_MP50Ke) $(CLM_OBJECTS_MP50Ke)
	-@CMD /Q /C if exist "$(DEL_TARGET02_LFL_MP50Ke)" DEL /F /Q "$(DEL_TARGET02_LFL_MP50Ke)" 2>nul
	@$(VCFLGEN) "$@.lfl" "$(LIB_SHARED)" -temp "$(TEMP_PATH_MP50Ke)" -prj "$(PRJ_PATH_MP50Ke)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(LIB_BMP_RES_MP50Ke)" -temp "$(TEMP_PATH_MP50Ke)" -prj "$(PRJ_PATH_MP50Ke)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(BDR_OBJECTS_MP50Ke:.vco=.vco|)" -temp "$(TEMP_PATH_MP50Ke)" -prj "$(PRJ_PATH_MP50Ke)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(LFNT_OBJECTS_MP50Ke:.vco=.vco|)" -temp "$(TEMP_PATH_MP50Ke)" -prj "$(PRJ_PATH_MP50Ke)" -sfas
	@$(VCFLGEN) "$@.lfl" "$(CLM_OBJECTS_MP50Ke:.vco=.vco|)" -temp "$(TEMP_PATH_MP50Ke)" -prj "$(PRJ_PATH_MP50Ke)" -sfas
	$(LINK) "$@.lfl" -o "$@" -p MP50Ke -lib "$(LIB_LOCAL_RES_MP50Ke)" -P "$(AS_PROJECT_PATH)" -m "local resources" -profile "False" -warningLevel2 -vcr 4240 -sfas
# 02 Module END

# 03 Module

DEL_TARGET03_LFL_MP50Ke=$(TEMP_PATH_MP50Ke)\MP50Ke03.ccf.lfl
$(TEMP_PATH_MP50Ke)/MP50Ke03.ccf: $(LIB_SHARED) $(SHARED_CCF) $(BMGRP_OBJECTS_MP50Ke) $(BMINFO_OBJECTS_MP50Ke) $(PALFILE_MP50Ke)
	-@CMD /Q /C if exist "$(DEL_TARGET03_LFL_MP50Ke)" DEL /F /Q "$(DEL_TARGET03_LFL_MP50Ke)" 2>nul
	@$(VCFLGEN) "$@.lfl" "$(LIB_SHARED)" -temp "$(TEMP_PATH_MP50Ke)" -prj "$(PRJ_PATH_MP50Ke)" -sfas
	@$(VCFLGEN) "$@.lfl" -mask .bmgrp -vcp "$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Package.vcp" -temp "$(TEMP_PATH_MP50Ke)" -prj "$(PRJ_PATH_MP50Ke)" -sfas
	@$(VCFLGEN) "$@.lfl" -mask .bminfo -vcp "$(AS_PROJECT_PATH)/Logical/Visualization/MP50Key/Package.vcp" -temp "$(TEMP_PATH_MP50Ke)" -prj "$(PRJ_PATH_MP50Ke)" -sfas
	$(LINK) "$@.lfl" -o "$@" -p MP50Ke -lib "$(LIB_BMP_RES_MP50Ke)" -P "$(AS_PROJECT_PATH)" -m "bitmap resources" -profile "False" -warningLevel2 -vcr 4240 -sfas
# 03 Module END

