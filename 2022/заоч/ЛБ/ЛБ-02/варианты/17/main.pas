uses UFlow, UMixer, UHeatExchanger, USplitter, ReadFlowComposition, UFlowCalc;



begin
  var f1_composition := read_txt('f1_composition.txt');
  var f8_composition := read_txt('f8_composition.txt');
  
  
  var flow1 := new Flow(f1_composition, 1117, 300);
  var flow8 := new Flow(f8_composition, 3000, 500);
  
  var splitter1 := new Splitter(|0.333, 0.333, 0.333|);
  var (flow2, flow3, flow4) := splitter1.calculate(flow1).ToList;
  
  var splitter2 := new Splitter(|0.333, 0.333, 0.333|);
  var(flow9, flow10, flow11) := splitter2.calculate(flow8).ToList;
  
  var he1 := new HeatExchanger;
  var he2 := new HeatExchanger;
  var he3 := new HeatExchanger;
  
  var (flow12, flow5) := he1.calculate(flow9, flow2).ToList;
  var (flow14, flow6) := he2.calculate(flow11, flow3).ToList;
  var (flow13, flow7) := he3.calculate(flow10, flow4).ToList;
  
  var mixer1 := new Mixer;
  var mixer2 := new Mixer;
  
  var flow15 := mixer1.calculate(|flow12, flow13, flow14|);
  var flow16 := mixer2.calculate(|flow5, flow6, flow7|);

  println('Свойства потока Flow 15');
  println('-'*20);
  flow15.print;
  println;
  println('Свойства потока Flow 16');
  println('-'*20);
  flow16.print;
  println;
  println('Исследование влияния технологических параметров:');
  println('-'*20);
  calcPFD1
end.