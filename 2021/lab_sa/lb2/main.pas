uses 
  UFlow, UMixer, UHeatExchanger, USplitter;
  
begin
  var f1 := new Flow(100, ArrRandomReal(24, 0, 1), 500);
  var f2 := new Flow(200, ArrRandomReal(24, 0, 1), 300);
  var f3 := new Flow(300, ArrRandomReal(24, 0, 1), 700);
  
  var m1 := new Mixer;
  var f4 := m1.calculate(|f1, f2, f3|);
  
  var he := new HeatExchanger;
  var (f5, f6) := he.calculate(f3, f2);
  
  var spl := new Splitter(|0.333, 0.333, 0.333|);
  var flows := spl.calculate(f3);
  
  f4.temperature.Println;
  println(f5.temperature, f6.temperature);
  
  print(flows[0].mass_flow_rate, flows[1].mass_flow_rate, flows[2].mass_flow_rate)
end.