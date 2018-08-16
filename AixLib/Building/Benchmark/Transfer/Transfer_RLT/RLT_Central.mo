﻿within AixLib.Building.Benchmark.Transfer.Transfer_RLT;
model RLT_Central
  replaceable package Medium_Water =
    AixLib.Media.Water "Medium in the component";
  replaceable package Medium_Air =
    AixLib.Media.Air "Medium in the component";

    parameter Real riseTime_valve = 0 annotation(Dialog(tab = "General"));

    parameter AixLib.Fluid.Movers.Data.Generic pump_model_hot annotation(Dialog(tab = "Hot"), choicesAllMatching = true);
    parameter Modelica.SIunits.Velocity v_nominal_hot = 0 annotation(Dialog(tab = "Hot"));
    parameter Real m_flow_nominal_hot = 0 annotation(Dialog(tab = "Hot"));
    parameter Modelica.SIunits.Length pipe_length_hot = 0 annotation(Dialog(tab = "Hot"));
    parameter Modelica.SIunits.Length pipe_wall_thickness_hot = 0 annotation(Dialog(tab = "Hot"));
    parameter Modelica.SIunits.Length pipe_insulation_thickness_hot = 0 annotation(Dialog(tab = "Hot"));
    parameter Modelica.SIunits.ThermalConductivity pipe_insulation_conductivity_hot = 0  annotation(Dialog(tab = "Hot"));
    parameter Modelica.SIunits.Volume V_mixing_hot = 0 annotation(Dialog(tab = "Hot"));
    parameter Modelica.SIunits.Pressure dpValve_nominal_hot = 0 annotation(Dialog(tab = "Hot"));

    parameter AixLib.Fluid.Movers.Data.Generic pump_model_cold annotation(Dialog(tab = "Cold"), choicesAllMatching = true);
    parameter Modelica.SIunits.Velocity v_nominal_cold = 0 annotation(Dialog(tab = "Cold"));
    parameter Real m_flow_nominal_cold = 0 annotation(Dialog(tab = "Cold"));
    parameter Modelica.SIunits.Length pipe_length_cold = 0 annotation(Dialog(tab = "Cold"));
    parameter Modelica.SIunits.Length pipe_wall_thickness_cold = 0 annotation(Dialog(tab = "Cold"));
    parameter Modelica.SIunits.Length pipe_insulation_thickness_cold = 0 annotation(Dialog(tab = "Cold"));
    parameter Modelica.SIunits.ThermalConductivity pipe_insulation_conductivity_cold = 0 annotation(Dialog(tab = "Cold"));
    parameter Modelica.SIunits.Volume V_mixing_cold = 0 annotation(Dialog(tab = "Cold"));
    parameter Modelica.SIunits.Pressure dpValve_nominal_cold = 0 annotation(Dialog(tab = "Cold"));

    parameter Modelica.SIunits.Velocity RLT_v_nominal = 0 annotation(Dialog(tab = "RLT"));
    parameter Real RLT_m_flow_nominal = 0 annotation(Dialog(tab = "RLT"));
    parameter Modelica.SIunits.Length RLT_pipe_length = 0 annotation(Dialog(tab = "RLT"));
    parameter Modelica.SIunits.Length RLT_pipe_wall_thickness = 0 annotation(Dialog(tab = "RLT"));
    parameter Modelica.SIunits.Length RLT_pipe_insulation_thickness = 0 annotation(Dialog(tab = "RLT"));
    parameter Modelica.SIunits.ThermalConductivity RLT_pipe_insulation_conductivity = 0  annotation(Dialog(tab = "RLT"));
  Fluid.HeatExchangers.ConstantEffectiveness Ext_Warm(
    m1_flow_nominal=1,
    m2_flow_nominal=10,
    dp1_nominal=10,
    dp2_nominal=10,
    redeclare package Medium1 = Medium_Water,
    redeclare package Medium2 = Medium_Air)
    annotation (Placement(transformation(extent={{-42,-70},{-62,-50}})));
  Fluid.HeatExchangers.ConstantEffectiveness Ext_Cold(
    m1_flow_nominal=1,
    m2_flow_nominal=10,
    dp1_nominal=10,
    dp2_nominal=10,
    redeclare package Medium1 = Medium_Water,
    redeclare package Medium2 = Medium_Air)
    annotation (Placement(transformation(extent={{34,-70},{14,-50}})));
  Modelica.Fluid.Interfaces.FluidPort_a Fluid_in_cold(redeclare package Medium
      = Medium_Water)
    "Fluid connector a1 (positive design flow direction is from port_a1 to port_b1)"
    annotation (Placement(transformation(extent={{70,90},{90,110}})));
  Modelica.Fluid.Interfaces.FluidPort_b Fluid_out_cold(redeclare package Medium
      = Medium_Water)
    "Fluid connector b1 (positive design flow direction is from port_a1 to port_b1)"
    annotation (Placement(transformation(extent={{30,90},{50,110}})));
  Modelica.Fluid.Interfaces.FluidPort_a Fluid_in_hot(redeclare package Medium
      = Medium_Water)
    "Fluid connector a1 (positive design flow direction is from port_a1 to port_b1)"
    annotation (Placement(transformation(extent={{-50,90},{-30,110}})));
  Modelica.Fluid.Interfaces.FluidPort_b Fluid_out_hot(redeclare package Medium
      = Medium_Water)
    "Fluid connector b1 (positive design flow direction is from port_a1 to port_b1)"
    annotation (Placement(transformation(extent={{-90,90},{-70,110}})));
  Modelica.Fluid.Interfaces.FluidPort_a Air_in(redeclare package Medium =
        Medium_Air)
    "Fluid connector a2 (positive design flow direction is from port_a2 to port_b2)"
    annotation (Placement(transformation(extent={{-140,-76},{-120,-56}})));
  Modelica.Fluid.Interfaces.FluidPort_b Air_out(redeclare package Medium =
        Medium_Air)
    "Fluid connector b (positive design flow direction is from port_a to port_b)"
    annotation (Placement(transformation(extent={{90,-76},{110,-56}})));
  Modelica.Blocks.Interfaces.RealInput X_w
    "Set point for water vapor mass fraction in kg/kg total air of the fluid that leaves port_b"
    annotation (Placement(transformation(
        extent={{12,-12},{-12,12}},
        rotation=90,
        origin={0,100})));
  Fluid.FixedResistances.PlugFlowPipe plugFlowPipe(redeclare package Medium =
        Medium_Water,
    cPip=500,
    rhoPip=8000,
    v_nominal=v_nominal_hot,
    m_flow_nominal=m_flow_nominal_hot,
    dIns=pipe_insulation_thickness_hot,
    kIns=pipe_insulation_conductivity_hot,
    thickness=pipe_wall_thickness_hot,
    nPorts=1,
    length=pipe_length_hot*2,
    allowFlowReversal=false)
    annotation (Placement(transformation(extent={{-9,8},{9,-8}},
        rotation=-90,
        origin={-40,11})));
  Fluid.Actuators.Valves.ThreeWayLinear val1(
    redeclare package Medium = Medium_Water,
    m_flow_nominal=m_flow_nominal_hot,
    CvData=AixLib.Fluid.Types.CvTypes.OpPoint,
    dpValve_nominal=dpValve_nominal_hot,
    riseTime=riseTime_valve,
    use_inputFilter=false)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-40,60})));
  Fluid.MixingVolumes.MixingVolume vol(
    redeclare package Medium = Medium_Water,
    m_flow_nominal=m_flow_nominal_hot,
    V=V_mixing_hot,
    nPorts=4) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-86,60})));
  Modelica.Blocks.Interfaces.RealInput pump_hot
    "Constant normalized rotational speed"
    annotation (Placement(transformation(extent={{112,-52},{88,-28}})));
  Fluid.Movers.SpeedControlled_y fan1(redeclare package Medium = Medium_Water,
      redeclare Fluid.Movers.Data.Pumps.Wilo.Stratos25slash1to4 per,
    allowFlowReversal=false)
    annotation (Dialog(enable = true), Placement(transformation(extent={{-8,-8},{8,8}},
        rotation=-90,
        origin={80,0})));
  Modelica.Blocks.Interfaces.RealInput pump_cold
    "Constant normalized rotational speed"
    annotation (Placement(transformation(extent={{112,-12},{88,12}})));
  Fluid.Actuators.Valves.ThreeWayLinear val2(
    redeclare package Medium = Medium_Water,
    m_flow_nominal=m_flow_nominal_cold,
    CvData=AixLib.Fluid.Types.CvTypes.OpPoint,
    dpValve_nominal=dpValve_nominal_cold,
    riseTime=riseTime_valve,
    use_inputFilter=false)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={80,80})));
  Modelica.Blocks.Interfaces.RealInput valve_hot
    "Actuator position (0: closed, 1: open)"
    annotation (Placement(transformation(extent={{112,28},{88,52}})));
  Modelica.Blocks.Interfaces.RealInput valve_cold
    "Actuator position (0: closed, 1: open)"
    annotation (Placement(transformation(extent={{112,68},{88,92}})));
  Fluid.MixingVolumes.MixingVolume vol1(
    redeclare package Medium = Medium_Water,
    nPorts=4,
    m_flow_nominal=m_flow_nominal_cold,
    V=V_mixing_cold) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={34,80})));
  Fluid.FixedResistances.PlugFlowPipe plugFlowPipe3(
                                                   redeclare package Medium =
        Medium_Water,
    cPip=500,
    rhoPip=8000,
    nPorts=1,
    v_nominal=v_nominal_cold,
    m_flow_nominal=m_flow_nominal_cold,
    dIns=pipe_insulation_thickness_cold,
    kIns=pipe_insulation_conductivity_cold,
    thickness=pipe_wall_thickness_cold,
    length=pipe_length_cold*2,
    allowFlowReversal=false)
    annotation (Placement(transformation(extent={{-9,8},{9,-8}},
        rotation=-90,
        origin={80,21})));
  Fluid.Movers.SpeedControlled_y fan2(redeclare package Medium = Medium_Water,
      redeclare Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per,
    allowFlowReversal=false)
    annotation (Placement(transformation(extent={{-8,-8},{8,8}},
        rotation=-90,
        origin={-40,-20})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort_pumpsAndPipes
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  Fluid.Sensors.Temperature senTem2(redeclare package Medium = Medium_Water)
    annotation (Placement(transformation(extent={{-82,26},{-62,46}})));
  Fluid.Sensors.MassFlowRate senMasFlo(redeclare package Medium = Medium_Water,
      allowFlowReversal=false)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,-34})));
  Fluid.Sensors.Temperature senTem1(redeclare package Medium = Medium_Water)
    annotation (Placement(transformation(extent={{-60,26},{-40,46}})));
  Fluid.Sensors.Temperature senTem3(redeclare package Medium = Medium_Water)
    annotation (Placement(transformation(extent={{40,50},{60,70}})));
  Fluid.Sensors.Temperature senTem4(redeclare package Medium = Medium_Water)
    annotation (Placement(transformation(extent={{60,50},{80,70}})));
  Fluid.Sensors.MassFlowRate senMasFlo1(
                                       redeclare package Medium = Medium_Water,
      allowFlowReversal=false)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,-14})));
  Modelica.Blocks.Interfaces.RealOutput massflow_hot annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-80,-100})));
  Modelica.Blocks.Interfaces.RealOutput power_pump_hot annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-40,-100})));
  Modelica.Blocks.Interfaces.RealOutput power_pump_cold annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={40,-100})));
  Modelica.Blocks.Interfaces.RealOutput massflow_cold
    "Mass flow rate from port_a to port_b" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={80,-100})));
  Modelica.Blocks.Interfaces.RealOutput cold_out annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-100,80})));
  Modelica.Blocks.Interfaces.RealOutput cold_in annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-100,40})));
  Modelica.Blocks.Interfaces.RealOutput hot_out annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-100,0})));
  Modelica.Blocks.Interfaces.RealOutput hot_in annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-100,-40})));
  Fluid.MixingVolumes.MixingVolume vol2(
    nPorts=2,
    redeclare package Medium = Medium_Air,
    m_flow_nominal=10,
    V=1)      annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={70,-60})));
  Fluid.MixingVolumes.MixingVolume vol3(
    nPorts=2,
    redeclare package Medium = Medium_Air,
    m_flow_nominal=10,
    V=1)      annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-18,-60})));
  Fluid.MixingVolumes.MixingVolume vol4(
    nPorts=2,
    redeclare package Medium = Medium_Air,
    m_flow_nominal=10,
    V=1)      annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-90,-60})));
equation
  connect(val1.port_3, vol.ports[1]) annotation (Line(points={{-46,60},{-64,60},
          {-64,58.2},{-80,58.2}},
                              color={0,127,255}));
  connect(Fluid_out_hot, vol.ports[2])
    annotation (Line(points={{-80,100},{-80,59.4}}, color={0,127,255}));
  connect(val1.port_2, plugFlowPipe.port_a)
    annotation (Line(points={{-40,54},{-40,20}}, color={0,127,255}));
  connect(Fluid_in_hot, val1.port_1)
    annotation (Line(points={{-40,100},{-40,66}}, color={0,127,255}));
  connect(fan1.y, pump_cold)
    annotation (Line(points={{89.6,0},{100,0}}, color={0,0,127}));
  connect(val1.y, valve_hot) annotation (Line(points={{-32.8,60},{20,60},{20,40},
          {100,40}}, color={0,0,127}));
  connect(val2.y, valve_cold)
    annotation (Line(points={{87.2,80},{100,80}}, color={0,0,127}));
  connect(plugFlowPipe3.ports_b[1], fan1.port_a)
    annotation (Line(points={{80,12},{80,8}}, color={0,127,255}));
  connect(plugFlowPipe3.port_a, val2.port_2)
    annotation (Line(points={{80,30},{80,74}}, color={0,127,255}));
  connect(val2.port_3, vol1.ports[1]) annotation (Line(points={{74,80},{58,80},
          {58,78.2},{40,78.2}},
                           color={0,127,255}));
  connect(Fluid_out_cold, vol1.ports[2])
    annotation (Line(points={{40,100},{40,79.4},{40,79.4}},color={0,127,255}));
  connect(Fluid_in_cold, val2.port_1)
    annotation (Line(points={{80,100},{80,86},{80,86}}, color={0,127,255}));
  connect(Ext_Cold.port_a1, fan1.port_b) annotation (Line(points={{34,-54},{60,-54},
          {60,-40},{80,-40},{80,-8}}, color={0,127,255}));
  connect(plugFlowPipe.ports_b[1], fan2.port_a)
    annotation (Line(points={{-40,2},{-40,-12}}, color={0,127,255}));
  connect(fan2.port_b, Ext_Warm.port_a1) annotation (Line(points={{-40,-28},{-40,
          -54},{-42,-54}},           color={0,127,255}));
  connect(fan2.y, pump_hot) annotation (Line(points={{-30.4,-20},{-20,-20},{-20,
          -40},{100,-40}}, color={0,0,127}));
  connect(fan2.heatPort, plugFlowPipe.heatPort) annotation (Line(points={{
          -45.44,-20},{-60,-20},{-60,11},{-48,11}}, color={191,0,0}));
  connect(fan1.heatPort, plugFlowPipe3.heatPort) annotation (Line(points={{
          74.56,0},{60,0},{60,21},{72,21}}, color={191,0,0}));
  connect(fan2.heatPort, plugFlowPipe3.heatPort) annotation (Line(points={{
          -45.44,-20},{-60,-20},{-60,-40},{60,-40},{60,21},{72,21}}, color={191,
          0,0}));
  connect(heatPort_pumpsAndPipes, plugFlowPipe3.heatPort) annotation (Line(
        points={{0,-100},{0,-40},{60,-40},{60,21},{72,21}}, color={191,0,0}));
  connect(senTem2.port, vol.ports[3]) annotation (Line(points={{-72,26},{-80,26},
          {-80,60.6}}, color={0,127,255}));
  connect(senTem1.port, plugFlowPipe.port_a)
    annotation (Line(points={{-50,26},{-40,26},{-40,20}}, color={0,127,255}));
  connect(senTem3.port, vol1.ports[3])
    annotation (Line(points={{50,50},{40,50},{40,80.6}}, color={0,127,255}));
  connect(senTem4.port, val2.port_2)
    annotation (Line(points={{70,50},{80,50},{80,74}}, color={0,127,255}));
  connect(senMasFlo1.port_a, Ext_Cold.port_b1) annotation (Line(points={{40,-24},
          {40,-40},{0,-40},{0,-54},{14,-54}},color={0,127,255}));
  connect(Ext_Warm.port_b1, senMasFlo.port_a) annotation (Line(points={{-62,-54},
          {-80,-54},{-80,-44}}, color={0,127,255}));
  connect(senMasFlo.m_flow, massflow_hot) annotation (Line(points={{-91,-34},{
          -114,-34},{-114,-80},{-80,-80},{-80,-100}}, color={0,0,127}));
  connect(fan2.P, power_pump_hot) annotation (Line(points={{-32.8,-28.8},{-32.8,
          -80},{-40,-80},{-40,-100}}, color={0,0,127}));
  connect(fan1.P, power_pump_cold) annotation (Line(points={{87.2,-8.8},{87.2,
          -40},{40,-40},{40,-100}}, color={0,0,127}));
  connect(senMasFlo1.m_flow, massflow_cold) annotation (Line(points={{29,-14},{
          20,-14},{20,-40},{40,-40},{40,-80},{80,-80},{80,-100}}, color={0,0,
          127}));
  connect(senTem1.T, hot_in) annotation (Line(points={{-43,36},{-20,36},{-20,
          -40},{-100,-40}}, color={0,0,127}));
  connect(senTem2.T, hot_out) annotation (Line(points={{-65,36},{-60,36},{-60,0},
          {-100,0}}, color={0,0,127}));
  connect(senTem3.T, cold_out) annotation (Line(points={{57,60},{60,60},{60,40},
          {20,40},{20,80},{-100,80}}, color={0,0,127}));
  connect(senTem4.T, cold_in) annotation (Line(points={{77,60},{78,60},{78,40},
          {-100,40}}, color={0,0,127}));
  connect(senMasFlo.port_b, vol.ports[4])
    annotation (Line(points={{-80,-24},{-80,61.8}}, color={0,127,255}));
  connect(senMasFlo1.port_b, vol1.ports[4])
    annotation (Line(points={{40,-4},{40,81.8}}, color={0,127,255}));
  connect(Ext_Cold.port_b2, vol2.ports[1])
    annotation (Line(points={{34,-66},{68.8,-66}}, color={0,127,255}));
  connect(vol2.ports[2], Air_out)
    annotation (Line(points={{71.2,-66},{100,-66}}, color={0,127,255}));
  connect(Air_in, vol4.ports[1])
    annotation (Line(points={{-130,-66},{-91.2,-66}}, color={0,127,255}));
  connect(vol4.ports[2], Ext_Warm.port_a2)
    annotation (Line(points={{-88.8,-66},{-62,-66}}, color={0,127,255}));
  connect(Ext_Warm.port_b2, vol3.ports[1])
    annotation (Line(points={{-42,-66},{-19.2,-66}}, color={0,127,255}));
  connect(vol3.ports[2], Ext_Cold.port_a2)
    annotation (Line(points={{-16.8,-66},{14,-66}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={Text(
          extent={{-188,-56},{-126,-76}},
          lineColor={28,108,200},
          textString="Parameter Wärmetausch
müssen angepasst werden
")}));
end RLT_Central;
