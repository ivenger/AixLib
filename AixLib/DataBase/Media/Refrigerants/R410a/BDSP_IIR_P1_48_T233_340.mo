within AixLib.DataBase.Media.Refrigerants.R410a;
record BDSP_IIR_P1_48_T233_340
  "Record with fitting coefficients calculated for first implementation"
  import AixLib;
  extends
    AixLib.DataBase.Media.Refrigerants.BubbleDewStatePropertiesBaseDataDefinition(
    name="Coefficients taken from Engelpracht",
    saturationPressure_nT=6,
    saturationPressure_n={-5.42493213611446, 4.55984223535243, -5.63920263436646, -17.0179004677748, 16.6119518017247, -9.23457354191128},
    saturationPressure_e={0.914568767900918, 0.84920213389611, 0.914588351221298, 5.60238999663603, 4.56148875806592, 3.77677091719265},
    saturationTemperature_nT=20,
    saturationTemperature_n={0.000212734358958718, -0.00274826770400574, 0.0139370674840602, -0.0315500773133433, 0.0121512184212727, 0.0856249369531822, -0.14074454381608, -0.0367634254282132, 0.254757708465645, -0.112689322533039, -0.182876490328916, 0.134350167076272, 0.0860242126577126, -0.100893270492692, 0.0309833589718576, -0.0529002490944326, 0.127140300183199, -0.277494430607753, 0.928326269698458, 0.315625855266007},
    saturationTemperature_iO={1690546.68662399, 1337345.61888569, 288.8, 32.1728405128715},
    bubbleDensity_nT=36,
    bubbleDensity_n={-0.000192762866406722, -0.000190066864688335, 0.00293566954837911, 0.00268386296928044, -0.0182096723714437, -0.014865285998038, 0.0568626882005316, 0.0376306904579577, -0.082657162249119, -0.0259497210302272, 0.00629647024697751, -0.0736032471821009, 0.128200045509028, 0.144634562910487, -0.0917421290392061, -0.0128449984203913, -0.0679342010271487, -0.0942651048840495, 0.0193911381842398, -0.0743660434596505, 0.0785551804508647, 0.0901572786179191, 0.0718657904122464, 0.21155243287858, -0.126169099890902, -0.220033640493862, -0.0624251345902524, -0.072663984277077, 0.127659685757962, 0.146102411920836, -0.0550862199890643, -0.0662654086479959, -0.0342907457908567, -0.122145006192698, -0.830658005524877, 0.186630093154286},
    bubbleDensity_iO={288.8, 32.1728405128715, 1070.36639000342, 176.461891556476},
    dewDensity_nT=35,
    dewDensity_n={6.58978478503912e-06, 8.61462899584184e-06, -6.20269693625927e-05, -7.37407932198282e-05, 0.000190760055223262, 0.000178769740095248, -0.000136388992345257, 4.36249648285315e-05, -0.000238334815888865, -0.000431298226628196, 3.80080621897099e-05, -0.000561479744368981, 0.000423297560316714, 0.0011568545426888, 0.000495543657457393, 0.00214762507546025, -5.92221614138573e-07, -0.00196695410352135, -0.000901075042193254, -0.00283896802944253, -0.00166768829541246, -0.00088860171586863, -0.00158538480741269, 0.00289539863035636, 0.00214921036271588, 0.00434299894514524, 0.0157317419040667, 0.0012382068787828, -0.0125489243448401, 0.0112261211991694, 0.0370242887570731, 0.0865129026480271, 0.262992182086301, 0.594247698000419, -0.38258005733403},
    dewDensity_iO={288.8, 32.1728405128715, 81.1402553535331, 81.8525665515266},
    bubbleEnthalpy_nT=24,
    bubbleEnthalpy_n={0.000490246648345094, -0.00557706139864375, 0.0228694199630369, -0.0295623061533724, -0.0540907239400526, 0.183700039484998, -0.0402840297763956, -0.337133368803756, 0.21534362178513, 0.287671541912508, -0.128383868132659, -0.156430951730721, -0.216555268787737, 0.0966313372190178, 0.417208839285077, -0.0769483120290127, -0.275377677418503, -9.99880752350359e-05, 0.131709506237597, -0.0526459403049543, 0.0872378134712026, -0.198136228106192, 0.912820978401616, 0.213699512339652},
    bubbleEnthalpy_iO={1690546.68662399, 1337345.61888569, 230591.064744288, 55427.1819514098},
    dewEnthalpy_nT=26,
    dewEnthalpy_n={-0.000218029221261958, 0.0022323353175877, -0.00799014541436163, 0.00833845606213506, 0.0144702747235008, -0.0331179314189472, 0.000390283122980614, 0.0115258430193761, 0.0308964007853627, 0.0136472460889214, -0.0360136736458006, -0.0386765421186988, -0.0605463077241532, 0.0502647244559176, 0.095321629007505, 0.0755533366303853, 0.063900536295213, -0.298358086862518, -0.10365771583044, 0.163409334532178, 0.17524027979117, -0.215325369147047, 0.197032758310628, -0.777842402746969, 0.173961838358794, 0.983520185682028},
    dewEnthalpy_iO={1690546.68662399, 1337345.61888569, 419045.765501892, 8545.487483279},
    bubbleEntropy_nT=24,
    bubbleEntropy_n={0.00033828165088767, -0.00370309827636681, 0.014209075443824, -0.0145766678299393, -0.0416403990009039, 0.101032460509914, 0.0336400125229364, -0.233747525374593, 0.0199708486352523, 0.290832433096577, -0.00660210880306234, -0.197892691158687, -0.12141201709424, 0.00592212772109565, 0.255290714023843, 0.0779323618368683, -0.184232949517685, -0.0976178186610381, 0.122020592620146, -0.0471292444744683, 0.113902422370081, -0.245671669378254, 0.888482458507174, 0.274891927776532},
    bubbleEntropy_iO={1690546.68662399, 1337345.61888569, 1160.97331866083, 185.695651493037},
    dewEntropy_nT=24,
    dewEntropy_n={-0.000546560772734549, 0.00581168717069958, -0.0215691827119022, 0.0223518186558442, 0.0473507418719607, -0.0983005227940781, -0.0497700161113581, 0.0790325658994048, 0.256674014689244, 0.0817324388473164, -0.899619588503897, -0.161232661224616, 1.51293677931511, 0.15442682704994, -1.47492388142783, -0.122700813082128, 0.808894385214169, 0.136507017005217, -0.308151297008007, 0.0270489376466083, -0.0847856959955504, 0.132564781752192, -0.773757700736367, -0.150479610948503},
    dewEntropy_iO={1690546.68662399, 1337345.61888569, 1842.94582896195, 79.2403170328169});
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
<td><p>48</p></td>
</tr>
<tr>
<td><p>Temperature (T) in K</p></td>
<td><p>233.15</p></td>
<td><p>340.15</p></td>
</tr>
</table>
<p>The reference point is defined as 200 kJ/kg and 1 kJ/kg/K, respectively, for enthalpy and entropy for the saturated liquid at 273.15 K.</p>
<p><b>References</b></p>
<p>Engelpracht, Mirko (2017): Development of modular and scalable simulation models for heat pumps and chillers considering various refrigerants. <i>Master Thesis</i></p>
</html>"));
end BDSP_IIR_P1_48_T233_340;
