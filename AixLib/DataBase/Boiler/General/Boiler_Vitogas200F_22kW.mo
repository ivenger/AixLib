within AixLib.DataBase.Boiler.General;
record Boiler_Vitogas200F_22kW "Gas-fired boiler Viessmann Vitogas200-F 22kW"
  extends BoilerTwoPointBaseDataDefinition(
    name="Vitogas200F_22kW",
    volume=0.0097,
    pressureDrop=7853000000,
    Q_nom=24300,
    Q_min=7290,
    eta=[0.3,0.93; 1.0,0.93]);
                                  annotation (Documentation(revisions="<html>
<ul>
  <li><i>June 19, 2013&nbsp;</i> by Ole Odendahl:<br/>Formatted documentation appropriately, awarded 5 stars</li>
  <li><i>June 23, 2006&nbsp;</i> by Ana Constantin:<br/>implemented</li>
</ul>
</html>", info="<html>
<p>Source:</p>
<p><ul>
<li>Product: Vitogas 200-F</li>
<li>Manufacturer: Viessmann</li>
<li>Broschure: Vitogas 200-F; 5/2010</li>
</ul></p>
</html>"));
end Boiler_Vitogas200F_22kW;
