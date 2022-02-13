uses UFlow, UMixer, UHeatExchanger, USplitter;


begin
  var f1 := new Flow(ArrRandomReal(24, 0, 1), 100, 500);
  var f2 := new Flow(ArrRandomReal(24, 0, 1), 200, 300);
  var f3 := new Flow(ArrRandomReal(24, 0, 1), 300, 700);
  
  var mix1 := new Mixer;
  var f4 := mix1.calculate(|f1, f2, f3|);
  
  f4.mass_flow_rate.Println;
  f4.temperature.Println;
  
  var he1 := new HeatExchanger;
  var res := he1.calculate(f3, f2);
  var (f5, f6) := (res[0], res[1]);
  
  var spl := new Splitter(|0.333, 0.333, 0.333|);
  var r := spl.calculate(f5);
  var (f7, f8, f9) := (r[0], r[1], r[2]);
  f7.mass_flow_rate.Println
end.