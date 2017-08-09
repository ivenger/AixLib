within AixLib.DataBase.Media.Refrigerants.R134a;
record BDSP_IIR_P1_395_T233_370
  "Record with fitting coefficients calculated for first implementation"
  import AixLib;
  extends
    AixLib.DataBase.Media.Refrigerants.BubbleDewStatePropertiesBaseDataDefinition(
    name="Coefficients taken from Engelpracht",
    saturationPressure_nT=5,
    saturationPressure_n={-5.29535582243675, -5.15024230998653, -3.13553371894143, 3.81009392578704, -10.0339381768489},
    saturationPressure_e={0.927890501793078, 0.927889861253321, 3.24457658937591, 0.866053953377016, 7.91909121618172},
    saturationTemperature_nT=20,
    saturationTemperature_n={0.000856145215973102, -0.012572124352724, 0.0770475764642235, -0.249050314762991, 0.425168770423832, -0.253413897218538, -0.354221116728346, 0.780471017454786, -0.568839868842873, 0.0593606578796145, 0.476452166349934, -0.774526008534057, 0.334501685240843, 0.282001632207744, -0.205778664289702, -0.134756698170718, 0.231277309474011, -0.320459852390984, 0.892255186981679, 0.38249253104432},
    saturationTemperature_iO={1173800.40711465, 1099321.32004152, 303.15, 40.457817538765},
    bubbleDensity_nT=31,
    bubbleDensity_n={-1.99050688360501e-05, -1.95142006499461e-05, 0.000222365658261271, 0.000201449273758331, -0.000884554304484925, -0.000711233946249634, 0.00117810694822977, 0.000692222421841495, 0.00102217606099457, 0.00115118761651369, -0.00271392542422017, -0.00139835845666441, -0.00304627975391413, -0.00324890680807353, 0.0052745028368933, 0.0015035390606699, 0.00966016249453505, 0.00877619977663642, -0.0105366608468246, -0.000616337915310588, -0.0238499545719808, -0.0229939450681468, 0.0427509092895292, 0.0228301975089902, -0.0278957421821363, -0.015629210325371, -0.00608897193476253, -0.0374485959337434, -0.127670555032919, -0.852119620735449, 0.175929581543644},
    bubbleDensity_iO={303.15, 40.457817538765, 1154.76921560841, 186.377105500294},
    dewDensity_nT=32,
    dewDensity_n={2.6424608384756e-05, 6.70712781452191e-05, -0.000306003129608424, -0.00086631140654061, 0.00129166033049564, 0.00441713821541128, -0.00199991775882815, -0.0107006379492618, -0.00095979289775483, 0.0101819654961302, 0.00487742079986775, 0.00404298825822586, 0.00156280037379907, -0.0100260256225324, -0.00993446985358331, -0.00633529330607583, -0.00152493313354843, 0.00577975219114743, 0.00928365063283756, 0.0192116863158408, 0.0104752961686273, -0.0157770655470561, -0.0160629389592364, -0.00442695150412588, 0.00163884176955777, 0.0125403112808612, 0.0213729212936608, 0.0335588375215924, 0.0944670658995607, 0.290203185591792, 0.571375643654458, -0.410573575889814},
    dewDensity_iO={303.15, 40.457817538765, 69.6350562981406, 78.2018951633148},
    bubbleEnthalpy_nT=20,
    bubbleEnthalpy_n={0.000643955583122244, -0.00903354208639087, 0.0519961916132593, -0.153093505731763, 0.222156994328846, -0.0759150034894905, -0.180419896118152, 0.179958908866564, -0.104020450003939, 0.30180839243061, -0.154498103846821, -0.501764195128414, 0.511695939749379, 0.0948185681821124, -0.19514687212152, -0.0846449464610971, 0.194785429539137, -0.258319108109933, 0.898379169203496, 0.301093896760792},
    bubbleEnthalpy_iO={1173800.40711509, 1099321.32004199, 246214.388066966, 61231.3334054695},
    dewEnthalpy_nT=20,
    dewEnthalpy_n={0.000146114755723916, -0.0019919160005003, 0.0109988406358016, -0.0311947330620793, 0.0499552429639684, -0.0665601068588061, 0.147469798302808, -0.277432585048023, 0.191088567972776, 0.165337515949091, -0.308799991735697, 0.0767890190523656, 0.096151215082195, -0.130568776308635, 0.206740480104201, -0.245243281452568, 0.246372277496221, -0.550946254566628, 0.847986730088046, 0.716885920461567},
    dewEnthalpy_iO={1173800.40711465, 1099321.32004152, 409576.287023374, 16957.9188539679},
    bubbleEntropy_nT=18,
    bubbleEntropy_n={0.00284189296657569, -0.0368836456982008, 0.19220422424959, -0.488659533566704, 0.512118973546239, 0.237332482467957, -1.0197350762984, 0.581768823312344, 0.270937563407533, -0.274490051594771, 0.248723895581585, -0.428783234059689, 0.103128885664524, 0.104039083894388, 0.124473252062715, -0.322942845043548, 0.864782086800948, 0.367254501164274},
    bubbleEntropy_iO={1173800.40711509, 1099321.32004199, 1143.41719860427, 197.97154554642},
    dewEntropy_nT=20,
    dewEntropy_n={-0.0034897846279889, 0.0535860524537702, -0.346503794691849, 1.19044487009117, -2.14399458831077, 1.10085009131208, 3.16107365916373, -6.31082724099684, 2.40076318691562, 5.0114795117494, -5.99082191486733, 0.288248120938586, 3.1237950342012, -1.39246834979196, -0.649160332871882, 0.613836064832119, -0.166303870548519, -0.0348797154510423, -0.487193861215391, -0.112521430007482},
    dewEntropy_iO={1173800.40711465, 1099321.32004152, 1712.24326581151, 28.1128516491483});
  annotation (Documentation(revisions="<html>
<ul>
  <li>
  June 14, 2017, by Mirko Engelpracht:<br/>
  First implementation (see <a href=\"https://github.com/RWTH-EBC/AixLib/issues/408\">issue 408</a>).
  </li>
</ul>
</html>", info="<html>
<p>In this record, fitting coefficients are provided for thermodynamic properties at bubble and dew line. For detailed information of these thermodynamic properties as well as the fitting coefficients, please checkout <a href=\"modelica://AixLib.DataBase.Media.Refrigerants.BubbleDewStatePropertiesBaseDataDefinition\">AixLib.DataBase.Media.Refrigerants.BubbleDewStatePropertiesBaseDataDefinition</a>. The fitting coefficients are used in a hybrid refrigerant model provided in <a href=\"modelica://AixLib.Media.Refrigerants\">AixLib.Media.Refrigerants</a>. For detailed information, please checkout <a href=\"modelica://AixLib.Media.Refrigerants.Interfaces.TemplateHybridTwoPhaseMediumRecord\">AixLib.Media.Refrigerants.Interfaces.TemplateHybridTwoPhaseMediumRecord</a>.</p>
<p><b>Assumptions and limitations</b></p>
<p>The provided coefficients are fitted to external data by Engelpracht and are valid within the following range:<br></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\" width=\"30%\"><tr>
<td><p>Parameter</p></td>
<td><p>Minimum Value</p></td>
<td><p>Maximum Value</p></td>
</tr>
<tr>
<td><p>Pressure (p) in bar</p></td>
<td><p>1</p></td>
<td><p>39.5</p></td>
</tr>
<tr>
<td><p>Temperature (T) in K</p></td>
<td><p>233.15</p></td>
<td><p>370.15</p></td>
</tr>
</table>
<p>The reference point is defined as 200 kJ/kg and 1 kJ/kg/K, respectively, for enthalpy and entropy for the saturated liquid at 273.15 K.</p>
<p><b>References</b></p>
<p>Engelpracht, Mirko (2017): Development of modular and scalable simulation models for heat pumps and chillers considering various refrigerants. <i>Master Thesis</i></p>
</html>"));
end BDSP_IIR_P1_395_T233_370;
