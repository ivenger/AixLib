﻿within AixLib.FastHVAC.Valves;
model Manifold
  parameter Integer n(min=1) = 1 "Number of input flows";
    Modelica.SIunits.SpecificEnthalpy h_outflow_mixed
    "mixed specific enthalpy leaving port b";

  Interfaces.EnthalpyPort_a enthalpyPort_a[n]
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));

  Interfaces.EnthalpyPort_b enthalpyPort_b
  "n-dimensional imput port 1-dimensional output port" annotation (Placement(transformation(extent={{90,-10},{110,10}})));

equation
    h_outflow_mixed =
   sum(inStream(enthalpyPort_a.h_outflow) * enthalpyPort_a.m_flow)
   / sum(enthalpyPort_a.m_flow);

//   enthalpyPort_b.m_flow = - sum(enthalpyPort_a.m_flow);  //mass balance
//   sum(inStream(enthalpyPort_a.h_outflow) * enthalpyPort_a.m_flow) =
//    / sum(enthalpyPort_a.m_flow);
//
//   enthalpyPort_b.m_flow * enthalpyPort_b.h_outflow
//   + enthalpyPort_a.m_flow * inStream(enthalpyPort_a.h_outflow) = 0;                                                        //enthalpy balance
//   enthalpyPort_b.h_outflow = enthalpyPort_b.c_outflow*enthalpyPort_b.T_outflow;
//                                                            //h=c*T
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(graphics={Polygon(
          points={{100,20},{20,20},{-20,60},{-100,60},{-100,60},{-100,40},{-30,
              40},{0,10},{-100,10},{-100,-10},{-96,-10},{0,-10},{-30,-40},{-100,
              -40},{-100,-60},{-20,-60},{20,-20},{100,-20},{100,-18},{100,20}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html><h4>
  <span style=\"color:#008000\">Overview</span>
</h4>
<p>
  Model for a manifold
</p>
<h4>
  <span style=\"color:#008000\">Level of Development</span>
</h4>
<p>
  <img src=\"modelica://HVAC/Images/stars2.png\" alt=\"\" />
</p>
<h4>
  <span style=\"color:#008000\">Concept</span>
</h4>
<p>
  Collects the flow of the n input ports into one single output port.
  Input flows must be of the same medium (same density and specific
  heat capacity). The temperature and enthalpy of the output flow are
  obtained by balancing the mass and enthalpy flows.
</p>
</html>",
revisions="<html><ul>
  <li>
    <i>April 13, 2017&#160;</i> Tobias Blacha:<br/>
    Moved into AixLib
  </li>
  <li>
    <i>February 22, 2014&#160;</i> by Nicolás Chang:<br/>
    Implemented.
  </li>
</ul>
</html>"));
end Manifold;
