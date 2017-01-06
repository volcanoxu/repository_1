<?xml version="1.0" encoding="utf-8"?>
<?AutomationStudio Version=4.2.1.214?>
<SwConfiguration CpuAddress="SL1" xmlns="http://br-automation.co.at/AS/SwConfiguration">
  <TaskClass Name="Cyclic#1">
    <Task Name="6axATrqFF" Source="MotionHandling.FeedForward.6axATrqFF.prg" Memory="UserROM" Language="ANSIC" Debugging="true" />
    <Task Name="Config" Source="MotionHandling.Configuration.Config.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="System" Source="MotionHandling.SystemHandling.System.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Cnc" Source="MotionHandling.CncHandling.Cnc.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Axes" Source="MotionHandling.AxesHandling.Axes.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="OptMotion" Source="MotionHandling.Optimizer.OptMotion.prg" Memory="UserROM" Language="ANSIC" Debugging="true" />
    <Task Name="Jog" Source="MotionHandling.Jogging.Jog.prg" Memory="UserROM" Language="ANSIC" Debugging="true" />
    <Task Name="Trf" Source="MotionHandling.Transformations.Trf.prg" Memory="UserROM" Language="ANSIC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#2">
    <Task Name="Error" Source="ErrorHandling.Error.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="HmiKeyCtrl" Source="HmiHandling.HmiKeyCtrl.HmiKeyCtrl.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="HmiHardKey" Source="HmiHandling.HmiHardKey.HmiHardKeyCtrl.prg" Memory="UserROM" Language="ANSIC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#3" />
  <TaskClass Name="Cyclic#4">
    <Task Name="HmiJogCtrl" Source="HmiHandling.HmiJog.HmiJogCtrl.prg" Memory="UserROM" Language="ANSIC" Debugging="true" />
    <Task Name="HmiSetup" Source="HmiHandling.HmiSetup.HmiSetup.prg" Memory="UserROM" Language="ANSIC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#5" />
  <TaskClass Name="Cyclic#6" />
  <TaskClass Name="Cyclic#7" />
  <TaskClass Name="Cyclic#8">
    <Task Name="RecipeCont" Source="Recipe.RecipeControl.prg" Memory="UserROM" Language="ANSIC" Debugging="true" />
    <Task Name="HmiIO" Source="HmiHandling.HmiIO.HmiIO.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="HmiAlarm" Source="HmiHandling.HmiAlarm.HmiAlarm.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <DataObjects>
    <DataObject Name="Acp10sys" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="Arnc0sys" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="acp10sys" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="arnc0sys" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="User" Source="" Memory="UserROM" Language="Binary" />
  </DataObjects>
  <NcDataObjects>
    <NcDataObject Name="sdc_i" Source="MotionHandling.MotionInitFiles.SDC.sdc_i.dob" Memory="UserROM" Language="Ax" />
    <NcDataObject Name="sdc_p" Source="MotionHandling.MotionInitFiles.SDC.sdc_p.dob" Memory="UserROM" Language="Apt" />
    <NcDataObject Name="ps_p" Source="MotionHandling.MotionInitFiles.ps_p.dob" Memory="UserROM" Language="Apt" />
    <NcDataObject Name="acpm_p" Source="MotionHandling.MotionInitFiles.acpm_p.dob" Memory="UserROM" Language="Apt" />
    <NcDataObject Name="acpmic_p" Source="MotionHandling.MotionInitFiles.acpmic_p.dob" Memory="UserROM" Language="Apt" />
    <NcDataObject Name="joint1_i" Source="MotionHandling.MotionInitFiles.joint1_i.dob" Memory="UserROM" Language="Ax" />
    <NcDataObject Name="joint2_i" Source="MotionHandling.MotionInitFiles.joint2_i.dob" Memory="UserROM" Language="Ax" />
    <NcDataObject Name="joint3_i" Source="MotionHandling.MotionInitFiles.joint3_i.dob" Memory="UserROM" Language="Ax" />
    <NcDataObject Name="joint4_i" Source="MotionHandling.MotionInitFiles.joint4_i.dob" Memory="UserROM" Language="Ax" />
    <NcDataObject Name="joint5_i" Source="MotionHandling.MotionInitFiles.joint5_i.dob" Memory="UserROM" Language="Ax" />
    <NcDataObject Name="joint6_i" Source="MotionHandling.MotionInitFiles.joint6_i.dob" Memory="UserROM" Language="Ax" />
    <NcDataObject Name="AcpError" Source="MotionHandling.AxesHandling.AcpError.dob" Memory="UserROM" Language="Ett" />
    <NcDataObject Name="JogInit" Source="MotionHandling.Jogging.JogInit.dob" Memory="UserROM" Language="Cnc" />
    <NcDataObject Name="JogPrg" Source="MotionHandling.Jogging.JogPrg.dob" Memory="UserROM" Language="Cnc" />
    <NcDataObject Name="robot_i" Source="MotionHandling.MotionInitFiles.robot_i.dob" Memory="UserROM" Language="Cns" />
  </NcDataObjects>
  <Binaries>
    <BinaryObject Name="TRFk_A0" Source="MotionHandling.Transformations.TRFk_A0.br" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="sysconf" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="ashwd" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="iomap" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="asfw" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="arconfig" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="acp10cfg" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="arnc0cfg" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="cncmap" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="axesmap" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Arnc0map" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Acp10map" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Acp10sys" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Arnc0sys" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcfntttf" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccedit" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccbmp" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcshared" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpdvnc" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccshape" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcfile" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcgclass" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcchspot" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Vismp02" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcmgr" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcresman" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccbtn" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcdsloc" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccalarm" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccovl" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpfx20" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccline" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcctext" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcalarm" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcbclass" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="visvc" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcrt" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccnum" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccstr" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcnet" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="arialbd" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Vismp01" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpdsw" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Vismp03" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcdsint" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vctcal" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcclbox" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccdt" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="arial" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccbar" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccddbox" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccpopup" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="arialxsr" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="AXESMap" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="CNCMap" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Arnc0cfg" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Acp10cfg" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Visu03" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Visu01" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Visu02" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="arialgkb" Source="" Memory="UserROM" Language="Binary" />
  </Binaries>
  <Libraries>
    <LibraryObject Name="Operator" Source="Libraries.Operator.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsIecCon" Source="Libraries.AsIecCon.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="astime" Source="Libraries.astime.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="DataObj" Source="Libraries.DataObj.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsMem" Source="Libraries.AsMem.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsArLog" Source="Libraries.AsArLog.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsArProf" Source="Libraries.AsArProf.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="FileIO" Source="Libraries.FileIO.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="standard" Source="Libraries.standard.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="Acp10sim" Source="Libraries.Acp10sim.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="acp10_mc" Source="Libraries.Acp10_MC.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="brsystem" Source="Libraries.brsystem.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="Acp10man" Source="Libraries.Acp10man.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="sys_lib" Source="Libraries.sys_lib.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="Runtime" Source="Libraries.Runtime.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="NcGlobal" Source="Libraries.NcGlobal.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="Acp10par" Source="Libraries.Acp10par.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="Acp10sdc" Source="Libraries.Acp10sdc.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="asrfbext" Source="Libraries.asrfbext.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsICMP" Source="Libraries.AsICMP.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsUSB" Source="Libraries.AsUSB.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="visapi" Source="Libraries.visapi.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="ModDiag" Source="HmiHandling.HmiIO.ModDiag.lby" Memory="UserROM" Language="ANSIC" Debugging="true" />
    <LibraryObject Name="AsIOMMan" Source="Libraries.AsIOMMan.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsIODiag" Source="Libraries.AsIODiag.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsSem" Source="Libraries.AsSem.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="TRF_LIB" Source="Libraries.TRF_LIB.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsIO" Source="Libraries.AsIO.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsBrStr" Source="Libraries.AsBrStr.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="powerlnk" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="MyLib" Source="Libraries.MyLib.lby" Memory="None" Language="ANSIC" Debugging="true" />
    <LibraryObject Name="Arnc0ext" Source="Libraries.Arnc0ext.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="Arnc0man" Source="Libraries.Arnc0man.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="Arnc0mx" Source="Libraries.Arnc0mx.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="loopconr" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="ashw" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
  </Libraries>
</SwConfiguration>