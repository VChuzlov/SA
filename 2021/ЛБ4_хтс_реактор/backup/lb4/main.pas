uses UReactor, UFlow, UMixer, UHeatExchanger, USplitter;

begin
  var r1 := new Reactor(4.902, 2.438);
  var r2 := new Reactor(5.410, 2.819);
  var r3 := new Reactor(6.452, 2.971);
  var r4 := new Reactor(8.208, 3.505);
  
  var he1 := new HeatExchanger;
  he1.d_in := 0.75;
  he1.d_out := 0.90;
  
  var he2 := new HeatExchanger;
  he2.d_in := 0.80;
  he2.d_out := 0.95;
  
  var he3 := new HeatExchanger;
  he3.d_in := 0.82;
  he3.d_out := 0.97;
  
  var f_mass_frac: array of real := (
    0.77,	6.82,	8.57,	12.02,	12.41,	14.41,	9.26,	0.0,	0.0,	0.0,	0.0,	
    0.0,	0.87, 3.56,	4.04,	5.95,	4.23,	0.64,	0.96,	1.34,	4.24,	5.77,	3.02,	
    1.12,	0.0);
  
  var h2_mass_frac: array of real := (
    0.0,	0.0,	0.0,	0.0,	0.0,	0.0,	0.0,	0.0,	0.0,	0.0,	10.0,	0.0,	0.0,	
      0.0,	0.0,	0.0,	0.0,	0.0,	0.0, 0.0,	0.0,	0.0,	0.0,	0.0,	90.0);
    
  var feedstock := new Flow(26600, f_mass_frac, 763.15, 0.105);
  var h2 := new Flow(3700, h2_mass_frac, 763.15, 0.105);
  
  var m1 := new Mixer;
  var feed_mixture := m1.calculate(|feedstock, h2|);
  
  var heating_agent := new Flow(39000, f_mass_frac, 800.0, 0.105);
  var splitter := new Splitter(|0.333, 0.333, 0.333|);
  var flows := splitter.calculate(heating_agent);
  
  var products1 := r1.calculate(feed_mixture);
  var (f1, products1_h) := he1.calculate(flows[0], products1);
  
  var products2 := r2.calculate(products1_h);
  var (f2, products2_h) := he2.calculate(flows[1], products2);
  
  var products3 := r3.calculate(products2_h);
  var (f3, products3_h) := he3.calculate(flows[2], products3);
  var products4 := r4.calculate(products3_h);
  
  var (gas, h2_) := products4.gas_separation;
  PrintLn($'Выход риформата, мас. %: {products4.mass_flow_rate / feedstock.mass_flow_rate * 100}');
  Println($'Октановое число риформата: {products4.getRON}');
  
  Println($'A: {products4.mass_fractions[18:24].Sum}');
  Println($'P: {products4.mass_fractions[0:11].Sum}');
  Println($'N: {products4.mass_fractions[11:18].Sum}');
  
end.