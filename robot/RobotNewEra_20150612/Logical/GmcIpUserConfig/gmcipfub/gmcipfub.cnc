<?xml version="1.0" encoding="UTF-8"?>
<CONFIG>
  <FUBOutputs>

<!--****************************************************************************
    *  Function block output rule definitions
    *
    *  <FUBOutput Name="<name of the rule>"
    *             Template="<LCF AIL template>"
    *             ExecuteInSimulation="<boolean>">
    *    <BUSY Condition="<statement>" />
    *    <ERROR Condition="<statement>" />
    *  </FUBOutput>
    *
    *  Name: Name of the output rule
    *  Template: Name of the LCF-defined AIL code template
    *  ExecuteInSimulation: Specifies whether the FuB should be executed during
    *   a simulation run to gather restart information
    *  <BUSY Condition>: Conditional expression to identify this function block
    *   as being busy
    *  <ERROR Condition>: Condition expression to identify this function block
    *   as being in error
    *
    *  Example:
    *   - Standard PLCOpen function block behaviour (defined in gmcipcfg)
    *     <FUBOutput Name="PLCOpen">
    *       <BUSY Condition="$busy == 1" />
    *       <ERROR Condition="$error == 1" />
    *     </FUBOutput>
    *   - Standard AS-library function block behaviour (defined in gmcipcfg)
    *     <FUBOutput Name="BuR">
    *       <BUSY Condition="$status == 65535" />
    *       <ERROR Condition="$status != 0 && $status != 65535" />
    *     </FUBOutput>
    ****************************************************************************-->

  </FUBOutputs>
  <FUBS>

<!--****************************************************************************
    *  Function block declarations
    *
    *  <FUB Name="<name of the FUB>"
    *       OutType="<FUB output rule name>"
    *       Template="<LCF AIL template>"
    *       ExecuteInSimulation="<boolean>">
    *    <BUSY Condition="<statement>" />
    *    <ERROR Condition="<statement>" />
    *  </FUB>
    *
    *  Name: Name of the function block
    *  OutType: Name of the FUB output rule
    *  Template: Name of the LCF-defined AIL code template
    *  ExecuteInSimulation: Specifies whether the FuB should be executed during
    *   a simulation run to gather restart information
    *  <BUSY Condition>: Conditional expression to identify this function block
    *   as being busy
    *  <ERROR Condition>: Condition expression to identify this function block
    *   as being in error
    *
    *  Example:
    *   - FUB declarations using predefined output rules
    *    <FUB Name="AsArLogWrite" OutType="BuR" />
    *    <FUB Name="MC_MoveAbsolute" OutType="PLCOpen" />
    *  - FUB declaration of user FUB with specific output rules
    *    <FUB Name="MyFub" ExecuteInSimulation="Yes" >
    *      <ERROR condition="$status == -1"/>
    *      <BUSY condition="$status == 1"/>
    *    </FUB>
    *    <FUB Name="myFUB" OutType="BuR">
    *      <ERROR Condition="$status != 0 && $status != 1 && $status != 2 && $status != 65535" />
    *    </FUB >
    ****************************************************************************-->

  </FUBS>
</CONFIG>