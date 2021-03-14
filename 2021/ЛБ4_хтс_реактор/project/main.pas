uses UFlow, UReactor, UMixer;

begin
  var r1 := new Reactor(4.9, 2.9);
  
  var f_mass_frac := Arr(
    0.77,	6.82,	8.57,	12.02,	12.41,	14.41,	9.26,	0.0,	0.0,	0.0,	0.0,	
    0.0,	0.87, 3.56,	4.04,	5.95,	4.23,	0.64,	0.96,	1.34,	4.24,	5.77,	3.02,	
    1.12,	0.0);
  
  var hbg_mass_frac := Arr(
    0.0,	0.0,	0.0,	0.0,	0.0,	0.0,	0.0,	0.0,	0.0,	0.0,	10.0,	0.0,	0.0,	
    0.0,	0.0,	0.0,	0.0,	0.0,	0.0, 0.0,	0.0,	0.0,	0.0,	0.0,	90.0);
  
  var feedstock := new Flow(100, f_mass_frac, 750, 0.6);
  var hbg := new Flow(50, hbg_mass_frac, 750, 0.6);
  
  var m1 := new Mixer;
  var feedstock_mix := m1.calculate(|feedstock, hbg|);
  
  var products := r1.calculate(feedstock_mix);
  feedstock_mix.mass_fractions.Println;
  println;
  products.mass_fractions.Println;
  println;
  products.temperature.Print
end.