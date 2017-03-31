within AixLib.Controls.HeatPumpControllers.Examples;
model HeatPumpController "Example for usage of heat pump controller"
  extends Modelica.Icons.Example;

  HPControllerOnOff hPControllerOnOff(bandwidth=2)
    "Simple on/off controller for a heat pump"
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Modelica.Blocks.Interaction.Show.BooleanValue booleanValue
    annotation (Placement(transformation(extent={{66,40},{86,60}})));
  ControllerInterfaces.HeatPumpControlBus heatPumpControlBus annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,0})));
  Modelica.Blocks.Interaction.Show.BooleanValue booleanValue1
    annotation (Placement(transformation(extent={{66,18},{86,38}})));
  Modelica.Blocks.Sources.RealExpression temperatureMeasurements[4](y={280,290,
        300,310}) annotation (Placement(transformation(
        extent={{-31,-10},{31,10}},
        rotation=180,
        origin={69,0})));
  Modelica.Blocks.Sources.RealExpression massFlowRateMeasurements[2](y={0.5,1})
    annotation (Placement(transformation(
        extent={{-31,-10},{31,10}},
        rotation=180,
        origin={69,-20})));
  Modelica.Blocks.Sources.Sine T_meas(
    freqHz=1/3600,
    amplitude=6,
    offset=310) "generates the measured temperature"
    annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
  Modelica.Blocks.Sources.Constant T_set(k=310)
    "provides the temperature set point"
    annotation (Placement(transformation(extent={{-100,-40},{-80,-20}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue1
    annotation (Placement(transformation(extent={{-60,70},{-20,90}})));
  Modelica.Blocks.Interfaces.RealOutput output_T_meas(
    final quantity="ThermodynamicTemperature",
    final unit="K",
    displayUnit="degC",
    min=0) "Temperature measurement"
    annotation (Placement(transformation(extent={{85,-75},{115,-45}})));
  Modelica.Blocks.Interfaces.BooleanOutput output_on
    annotation (Placement(transformation(extent={{86,-94},{114,-66}})));
equation
  connect(hPControllerOnOff.heatPumpControlBus, heatPumpControlBus) annotation (
     Line(
      points={{-40.05,0.05},{-20.025,0.05},{-20.025,0},{0,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(heatPumpControlBus.N, realValue.numberPort) annotation (Line(
      points={{0.05,-0.05},{20,-0.05},{20,70},{58.5,70}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(heatPumpControlBus.input_on, booleanValue.activePort) annotation (
      Line(
      points={{0.05,-0.05},{20,-0.05},{20,50},{64.5,50}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(heatPumpControlBus.input_mode, booleanValue1.activePort) annotation (
      Line(
      points={{0.05,-0.05},{10,-0.05},{20,-0.05},{20,28},{64.5,28}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(temperatureMeasurements[1].y, heatPumpControlBus.T_flow_ev)
    annotation (Line(points={{34.9,4.21885e-015},{0.05,4.21885e-015},{0.05,
          -0.05}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(temperatureMeasurements[2].y, heatPumpControlBus.T_flow_co)
    annotation (Line(points={{34.9,4.21885e-015},{0.05,4.21885e-015},{0.05,
          -0.05}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(temperatureMeasurements[3].y, heatPumpControlBus.T_ret_ev)
    annotation (Line(points={{34.9,4.21885e-015},{0.05,4.21885e-015},{0.05,
          -0.05}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(temperatureMeasurements[4].y, heatPumpControlBus.T_ret_co)
    annotation (Line(points={{34.9,4.21885e-015},{0.05,4.21885e-015},{0.05,
          -0.05}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(massFlowRateMeasurements[1].y, heatPumpControlBus.m_flow_ev)
    annotation (Line(points={{34.9,-20},{20,-20},{20,-0.05},{0.05,-0.05}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(massFlowRateMeasurements[2].y, heatPumpControlBus.m_flow_co)
    annotation (Line(points={{34.9,-20},{20,-20},{20,-0.05},{0.05,-0.05}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(T_meas.y, hPControllerOnOff.T_meas) annotation (Line(points={{-79,30},
          {-70,30},{-70,4},{-60,4}}, color={0,0,127}));
  connect(T_set.y, hPControllerOnOff.T_set) annotation (Line(points={{-79,-30},
          {-70,-30},{-70,-4},{-60,-4}}, color={0,0,127}));
  connect(T_meas.y, realValue1.numberPort) annotation (Line(points={{-79,30},{
          -66,30},{-66,80},{-63,80}}, color={0,0,127}));
  connect(T_meas.y, output_T_meas) annotation (Line(points={{-79,30},{-74,30},{
          -74,-60},{100,-60}}, color={0,0,127}));
  connect(heatPumpControlBus.input_on, output_on) annotation (Line(
      points={{0.05,-0.05},{20,-0.05},{20,-80},{100,-80}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  annotation (experiment(StopTime=10000, Interval=10));
end HeatPumpController;