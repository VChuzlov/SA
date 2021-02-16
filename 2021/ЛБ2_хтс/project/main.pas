uses UFlow, UMixer, UHeatExchanger, USplitter;

begin
  var f1 := new Flow(100, ArrRandomReal(24, 0, 1), 400);  
  var f2 := new Flow(500, ArrRAndomReal(24, 0, 1), 500);
  
  var m1 := new Mixer;
  var f := m1.calculate(|f1, f2|);
    
  var h1 := new HeatExchanger;
  var (f4, f5) := h1.calculate(f2, f1);
  f4.temperature.Print;
  f5.temperature.Print;
  
  var spl1 := new Splitter(|0.3, 0.3, 0.3|);
  var sflows := spl1.calculate(f5);
  sflows[0].mass_flow_rate.Print
end.