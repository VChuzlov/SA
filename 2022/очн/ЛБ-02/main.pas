uses UFlow, UMixer, UHeatExchanger, USplitter;


begin
  var f1 := new Flow(100, ArrRandomReal(24, 0, 1), 500);
  var f2 := new Flow(200, ArrRandomReal(24, 0, 1), 300);
  var f3 := new Flow(300, ArrRandomReal(24, 0, 1), 700);
  
  var mix1 := new Mixer;
  var f4 := mix1.calculate(|f1, f2, f3|);
  
  var he1 := new HeatExchanger;
  var res_he1 := he1.calculate(f3, f2);
  var (f5, f6) := (res_he1[0], res_he1[1]);
  
  var spl1 := new Splitter(|0.3, 0.3, 0.3|);
  var res_spl1 := spl1.calculate(f5);
  var (f7, f8, f9) := (res_spl1[0], res_spl1[1], res_spl1[2]);
  println(f7.mass_flow_rate, f8.mass_flow_rate);
end.