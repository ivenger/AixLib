within AixLib.Fluid.DistrictHeatingCooling.Demands.ClosedLoop;
model SubstationHeatingCoolingFixDeltaT "Substation model for bidirctional low-temperature networks for buildings with 
  heat pump and chiller. for simultaneous cooling and heating demands, 
  the return flows are used as supply flows for the other application. "

      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    "Medium model for water"
      annotation (choicesAllMatching = true);

    parameter Real cp_default = 4180 "Cp-value of Water";

    parameter Real HeatDemand_max "maximum heat demand for scaling of heatpump in Watt";
    parameter Real CoolingDemand_max "maximum cooling demand for scaling of chiller in Watt (negative values)";

    parameter Modelica.SIunits.Temperature deltaT_heatingSet "set temperature difference for heating on the site of building";
    parameter Modelica.SIunits.Temperature deltaT_coolingSet "set temperature difference for cooling on the building site";

    parameter Modelica.SIunits.Temperature deltaT_heatingGridSet "set temperature difference for heating on the site of thermal network";
    parameter Modelica.SIunits.Temperature deltaT_coolingGridSet "set temperature difference for cooling on the side of the thermal network";

    parameter Modelica.SIunits.Pressure dp_nominal(displayUnit="Pa")=30000 "nominal pressure drop";

  AixLib.Fluid.Delays.DelayFirstOrder vol(
    nPorts=2,
    redeclare package Medium = Medium,
    tau=600,
    m_flow_nominal=2)
             annotation (Placement(transformation(extent={{-242,4},{-222,24}})));
  AixLib.Fluid.Delays.DelayFirstOrder vol1(
    nPorts=2,
    redeclare package Medium = Medium,
    tau=600,
    m_flow_nominal=2)
             annotation (Placement(transformation(extent={{188,8},{208,28}})));
  AixLib.Fluid.Movers.FlowControlled_m_flow pumpHeating(redeclare package
      Medium = Medium, m_flow_nominal=2,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    addPowerToMedium=false,
    use_inputFilter=false)
    annotation (Placement(transformation(extent={{-80,-14},{-60,-34}})));
  AixLib.Fluid.Sources.MassFlowSource_T sourceHeating(
    use_m_flow_in=true,
    use_T_in=true,
    redeclare package Medium = Medium,
    nPorts=1) annotation (Placement(transformation(extent={{62,-64},{42,-44}})));
  Modelica.Blocks.Sources.Constant T_return(k=deltaT_heatingSet)
    annotation (Placement(transformation(extent={{118,-102},{104,-88}})));
  AixLib.Fluid.Sources.FixedBoundary sinkHeating(redeclare package Medium =
        Medium, nPorts=1)
    annotation (Placement(transformation(extent={{-48,-64},{-28,-44}})));
  Modelica.Blocks.Sources.Constant const(k=(cp_default*deltaT_heatingSet))
    annotation (Placement(transformation(extent={{128,-56},{116,-44}})));
  Modelica.Blocks.Math.Division division
    annotation (Placement(transformation(extent={{104,-44},{90,-30}})));
public
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-270,-10},{-250,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{210,-10},{230,10}}),
        iconTransformation(extent={{210,-10},{230,10}})));
  AixLib.Fluid.HeatPumps.Carnot_TCon heaPum(redeclare package Medium1 = Medium,
      redeclare package Medium2 = Medium,
    QCon_flow_nominal=HeatDemand_max,
    dp1_nominal=dp_nominal,
    dp2_nominal=dp_nominal,
    use_eta_Carnot_nominal=true,
    show_T=true,
    etaCarnot_nominal=0.5)
    annotation (Placement(transformation(extent={{10,-20},{-10,-40}})));
  Modelica.Blocks.Math.Division division1
    annotation (Placement(transformation(extent={{-96,-78},{-80,-62}})));
  Modelica.Blocks.Sources.Constant const3(k=(cp_default*deltaT_heatingGridSet))
    annotation (Placement(transformation(extent={{-138,-104},{-126,-92}})));
  Modelica.Blocks.Interfaces.RealInput HeatDemand
    annotation (Placement(transformation(extent={{-294,-80},{-254,-40}}),
        iconTransformation(extent={{152,68},{112,108}})));
  Modelica.Blocks.Interfaces.RealInput T_supplyHeatingSet annotation (
      Placement(transformation(
        extent={{20,20},{-20,-20}},
        rotation=180,
        origin={-270,-138}), iconTransformation(extent={{152,114},{112,154}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{92,-88},{72,-68}})));
  Modelica.Blocks.Math.Add add1(k2=-1)
    annotation (Placement(transformation(extent={{-134,-76},{-114,-56}})));
  AixLib.Fluid.FixedResistances.Junction jun(
    redeclare package Medium = Medium,
    dp_nominal={0,dp_nominal,dp_nominal},
    m_flow_nominal={2,2,2},
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Bidirectional,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Bidirectional,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Entering)
    annotation (Placement(transformation(extent={{-156,10},{-136,-10}})));

  AixLib.Fluid.FixedResistances.Junction jun1(
    redeclare package Medium = Medium,
    dp_nominal={0,dp_nominal,dp_nominal},
    m_flow_nominal={2,2,2},
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Entering)
    annotation (Placement(transformation(extent={{136,-10},{116,10}})));
  AixLib.Fluid.Chillers.Carnot_TEva chi(
    redeclare package Medium1 = Medium,
    redeclare package Medium2 = Medium,
    allowFlowReversal1=true,
    allowFlowReversal2=true,
    QEva_flow_nominal=CoolingDemand_max,
    use_eta_Carnot_nominal=true,
    dp1_nominal=dp_nominal,
    dp2_nominal=dp_nominal,
    etaCarnot_nominal=0.3)
    annotation (Placement(transformation(extent={{-4,40},{-24,20}})));
  AixLib.Fluid.Movers.FlowControlled_m_flow pumpCooling(
    redeclare package Medium = Medium,
    m_flow_nominal=2,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    addPowerToMedium=false,
    use_inputFilter=false)
    annotation (Placement(transformation(extent={{48,14},{28,34}})));
  Modelica.Blocks.Interfaces.RealInput CoolingDemand annotation (Placement(
        transformation(extent={{248,42},{208,82}}), iconTransformation(extent={{-176,40},
            {-136,80}})));
  Modelica.Blocks.Interfaces.RealInput T_supplyCoolingSet annotation (
      Placement(transformation(extent={{248,82},{208,122}}),
        iconTransformation(extent={{-176,110},{-136,150}})));
  AixLib.Fluid.Sources.MassFlowSource_T sourceCooling(
    use_m_flow_in=true,
    use_T_in=true,
    redeclare package Medium = Medium,
    nPorts=1) annotation (Placement(transformation(extent={{-70,44},{-50,64}})));
  AixLib.Fluid.Sources.FixedBoundary sinkCooling(redeclare package Medium =
        Medium, nPorts=1)
    annotation (Placement(transformation(extent={{30,46},{10,66}})));
  Modelica.Blocks.Math.Add add2(k2=-1)
    annotation (Placement(transformation(extent={{82,102},{62,122}})));
  Modelica.Blocks.Math.Division division2
    annotation (Placement(transformation(extent={{48,100},{34,114}})));
  Modelica.Blocks.Sources.Constant const1(k=-(cp_default*
        deltaT_coolingGridSet))
    annotation (Placement(transformation(extent={{78,84},{66,96}})));
  Modelica.Blocks.Math.Add add3(
                               k2=+1)
    annotation (Placement(transformation(extent={{-120,100},{-100,120}})));
  Modelica.Blocks.Sources.Constant T_return1(k=deltaT_coolingSet)
    annotation (Placement(transformation(extent={{-158,76},{-138,96}})));
  Modelica.Blocks.Math.Division division3
    annotation (Placement(transformation(extent={{-58,120},{-72,134}})));
  Modelica.Blocks.Sources.Constant const2(k=-(cp_default*deltaT_coolingSet))
    annotation (Placement(transformation(extent={{-32,94},{-44,106}})));
  AixLib.Fluid.Sensors.MassFlowRate senMasFlo_GridHeat(redeclare package Medium
      =        Medium)
    annotation (Placement(transformation(extent={{-206,-10},{-186,10}})));
  AixLib.Fluid.Sensors.MassFlowRate senMasFlo_GridCool(redeclare package Medium
      =        Medium)
    annotation (Placement(transformation(extent={{152,-10},{172,10}})));
  AixLib.Fluid.Sensors.MassFlowRate senMasFlo_HeatPump(redeclare package Medium
      =        Medium)
    annotation (Placement(transformation(extent={{-114,-34},{-94,-14}})));
  AixLib.Fluid.Sensors.MassFlowRate senMasFlo_chiller(redeclare package Medium
      =        Medium)
    annotation (Placement(transformation(extent={{78,14},{58,34}})));
equation
  connect(port_a,vol. ports[1])
    annotation (Line(points={{-260,0},{-234,0},{-234,4}},
                                                        color={0,127,255}));
  connect(port_b,vol1. ports[1])
    annotation (Line(points={{220,0},{196,0},{196,8}},
                                                     color={0,127,255}));
  connect(chi.port_b1, jun.port_3) annotation (Line(points={{-24,24},{-146,24},
          {-146,10}},color={0,127,255}));
  connect(heaPum.port_b2, jun1.port_3)
    annotation (Line(points={{10,-24},{126,-24},{126,-10}},
                                                          color={0,127,255}));
  connect(pumpHeating.port_b, heaPum.port_a2)
    annotation (Line(points={{-60,-24},{-10,-24}}, color={0,127,255}));
  connect(chi.port_a1, pumpCooling.port_b)
    annotation (Line(points={{-4,24},{28,24}},color={0,127,255}));
  connect(heaPum.P, add1.u2) annotation (Line(points={{-11,-30},{-54,-30},{-54,-80},
          {-144,-80},{-144,-72},{-136,-72},{-136,-72}}, color={0,0,127}));
  connect(HeatDemand, add1.u1)
    annotation (Line(points={{-274,-60},{-136,-60}}, color={0,0,127}));
  connect(add1.y, division1.u1) annotation (Line(points={{-113,-66},{-106,-66},{
          -106,-65.2},{-97.6,-65.2}}, color={0,0,127}));
  connect(const3.y, division1.u2) annotation (Line(points={{-125.4,-98},{-108,-98},
          {-108,-74.8},{-97.6,-74.8}}, color={0,0,127}));
  connect(division1.y, pumpHeating.m_flow_in) annotation (Line(points={{-79.2,-70},
          {-70,-70},{-70,-36}}, color={0,0,127}));
  connect(T_supplyHeatingSet, heaPum.TSet) annotation (Line(points={{-270,
          -138},{20,-138},{20,-39},{12,-39}},
                                        color={0,0,127}));
  connect(sourceHeating.ports[1], heaPum.port_a1) annotation (Line(points={{42,-54},
          {28,-54},{28,-36},{10,-36}}, color={0,127,255}));
  connect(sinkHeating.ports[1], heaPum.port_b1) annotation (Line(points={{-28,-54},
          {-22,-54},{-22,-36},{-10,-36}}, color={0,127,255}));
  connect(HeatDemand, division.u1) annotation (Line(points={{-274,-60},{-154,
          -60},{-154,-120},{132,-120},{132,-38},{105.4,-38},{105.4,-32.8}},
                                                                       color={0,
          0,127}));
  connect(division.u2, const.y) annotation (Line(points={{105.4,-41.2},{112,-41.2},
          {112,-50},{115.4,-50}}, color={0,0,127}));
  connect(division.y, sourceHeating.m_flow_in) annotation (Line(points={{89.3,
          -37},{76.65,-37},{76.65,-46},{64,-46}},
                                             color={0,0,127}));
  connect(T_supplyHeatingSet, add.u1) annotation (Line(points={{-270,-138},{
          124,-138},{124,-72},{94,-72}}, color={0,0,127}));
  connect(T_return.y, add.u2) annotation (Line(points={{103.3,-95},{100,-95},{100,
          -84},{94,-84}}, color={0,0,127}));
  connect(add.y, sourceHeating.T_in) annotation (Line(points={{71,-78},{68,-78},
          {68,-50},{64,-50}}, color={0,0,127}));
  connect(sourceCooling.ports[1], chi.port_a2) annotation (Line(points={{-50,54},
          {-30,54},{-30,36},{-24,36}}, color={0,127,255}));
  connect(chi.port_b2, sinkCooling.ports[1]) annotation (Line(points={{-4,36},{
          0,36},{0,56},{10,56}}, color={0,127,255}));
  connect(chi.P, add2.u2) annotation (Line(points={{-25,30},{-130,30},{-130,80},
          {88,80},{88,106},{84,106}}, color={0,0,127}));
  connect(CoolingDemand, add2.u1) annotation (Line(points={{228,62},{94,62},{
          94,118},{84,118}},
                          color={0,0,127}));
  connect(division2.u1, add2.y) annotation (Line(points={{49.4,111.2},{55.7,
          111.2},{55.7,112},{61,112}}, color={0,0,127}));
  connect(division2.u2, const1.y) annotation (Line(points={{49.4,102.8},{57.7,
          102.8},{57.7,90},{65.4,90}}, color={0,0,127}));
  connect(division2.y, pumpCooling.m_flow_in) annotation (Line(points={{33.3,
          107},{32,107},{32,66},{38,66},{38,36}}, color={0,0,127}));
  connect(T_return1.y, add3.u2) annotation (Line(points={{-137,86},{-130,86},{
          -130,104},{-122,104}}, color={0,0,127}));
  connect(T_supplyCoolingSet, add3.u1) annotation (Line(points={{228,102},{
          106,102},{106,146},{-150,146},{-150,116},{-122,116}},
                 color={0,0,127}));
  connect(add3.y, sourceCooling.T_in) annotation (Line(points={{-99,110},{-94,
          110},{-94,58},{-72,58}}, color={0,0,127}));
  connect(CoolingDemand, division3.u1) annotation (Line(points={{228,62},{94,
          62},{94,131.2},{-56.6,131.2}},
                                     color={0,0,127}));
  connect(const2.y, division3.u2) annotation (Line(points={{-44.6,100},{-50,100},
          {-50,122.8},{-56.6,122.8}}, color={0,0,127}));
  connect(division3.y, sourceCooling.m_flow_in) annotation (Line(points={{-72.7,
          127},{-86,127},{-86,62},{-72,62}}, color={0,0,127}));
  connect(T_supplyCoolingSet, chi.TSet) annotation (Line(points={{228,102},{
          106,102},{106,42},{8,42},{8,21},{-2,21}},                     color=
         {0,0,127}));
  connect(vol.ports[2], senMasFlo_GridHeat.port_a) annotation (Line(points={{
          -230,4},{-230,0},{-206,0},{-206,0}}, color={0,127,255}));
  connect(senMasFlo_GridHeat.port_b, jun.port_1)
    annotation (Line(points={{-186,0},{-156,0}}, color={0,127,255}));
  connect(senMasFlo_GridCool.port_b, vol1.ports[2])
    annotation (Line(points={{172,0},{200,0},{200,8}}, color={0,127,255}));
  connect(senMasFlo_GridCool.port_a, jun1.port_1)
    annotation (Line(points={{152,0},{136,0}}, color={0,127,255}));
  connect(jun.port_2, senMasFlo_HeatPump.port_a) annotation (Line(points={{
          -136,0},{-118,0},{-118,-24},{-114,-24}}, color={0,127,255}));
  connect(senMasFlo_HeatPump.port_b, pumpHeating.port_a)
    annotation (Line(points={{-94,-24},{-80,-24}}, color={0,127,255}));
  connect(senMasFlo_chiller.port_a, jun1.port_2) annotation (Line(points={{78,
          24},{100,24},{100,0},{116,0}}, color={0,127,255}));
  connect(senMasFlo_chiller.port_b, pumpCooling.port_a)
    annotation (Line(points={{58,24},{48,24}}, color={0,127,255}));
  connect(port_a, port_a)
    annotation (Line(points={{-260,0},{-260,0}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-260,
            -160},{220,160}}),
                         graphics={
        Rectangle(
          extent={{-160,160},{140,-160}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-90,30},{94,-146}},
          lineColor={0,0,0},
          fillColor={28,108,200},
          fillPattern=FillPattern.HorizontalCylinder),
        Polygon(
          points={{-106,30},{-6,140},{112,30},{-106,30}},
          lineColor={0,0,0},
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-48,6},{-12,-36}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-22,-72},{18,-146}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{18,6},{54,-36}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}),                      Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-260,-160},{220,
            160}})));
end SubstationHeatingCoolingFixDeltaT;