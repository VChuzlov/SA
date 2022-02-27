uses UFlow, UReactor, UMixer, UHeatExchanger, USplitter;

begin
  var r1 := new Reactor(4.902, 2.438);
  
  var f_mass_frac := Arr(
    0.77,	6.82,	8.57,	12.02,	12.41,	14.41,	9.26,	0.0,	0.0,	0.0,	0.0,	
    0.0,	0.87, 3.56,	4.04,	5.95,	4.23,	0.64,	0.96,	1.34,	4.24,	5.77,	3.02,	
    1.12,	0.0);
  
  var hbg_mass_frac := Arr(
    0.0,	0.0,	0.0,	0.0,	0.0,	0.0,	0.0,	0.0,	0.0,	0.0,	10.0,	0.0,	0.0,	
    0.0,	0.0,	0.0,	0.0,	0.0,	0.0, 0.0,	0.0,	0.0,	0.0,	0.0,	90.0);
  
  var feedstock := new Flow(26600, f_mass_frac, 763.15, 0.105);
  var hbg := new Flow(3700, hbg_mass_frac, 763.15, 0.105);
  
  var m1 := new Mixer;
  var feedstock_mix := m1.calculate(|feedstock, hbg|);
  
  var products1 := r1.calculate(feedstock_mix);
  products1.temperature.Println;
  
  var hf_mass_fractions: array of real := (
    0.77,	6.82,	8.57,	12.02,	12.41,	14.41,	9.26,	0.0,	0.0,	0.0,	0.0,	
    0.0,	0.87, 3.56,	4.04,	5.95,	4.23,	0.64,	0.96,	1.34,	4.24,	5.77,	3.02,	
    1.12,	0.0
  );
  
  var heating_flow := new Flow(39000, hf_mass_fractions, 800, 0.105);
  var splitter := new Splitter(|0.333, 0.333, 0.333|);
  var hf := splitter.calculate(heating_flow);
    
  var he1 := new HeatExchanger;
  he1.d_in := 0.75;
  he1.d_out := 0.9;
  var (f1, products1_h) := he1.calculate(hf[0], products1);
  products1_h.temperature.Println;
  
  
  var r2 := new Reactor(5.410, 2.819);
  var products2 := r2.calculate(products1_h);
  products2.temperature.Println;
  
  var he2 := new HeatExchanger;
  he2.d_in := 0.8;
  he2.d_out := 0.95;
  var (f2, products2_h) := he2.calculate(hf[1], products2);
  products2_h.temperature.Println;
  
  var r3 := new Reactor(6.452, 2.971);
  var products3 := r3.calculate(products2_h);
  products3.temperature.Println;
  
  var he3 := new HeatExchanger;
  he3.d_in := 0.82;
  he3.d_out := 0.97;
  var (f3, products3_h) := he3.calculate(hf[2], products3);
  products3_h.temperature.Println;
  
  var r4 := new Reactor(8.208, 3.505);
  var products4 := r4.calculate(products3_h);
  products4.temperature.Println;
  
  var (gas, h2) := products4.gas_separation;
  println;
  products4.mass_fractions[18:24].Println;
  products4.mass_fractions[18:24].Sum.Println;
  products4.getRON.Println;
end.