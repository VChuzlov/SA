uses UFlow, UMixer, UHeatExchanger, USplitter, ReadFlowComposition, UFlowCalc;



begin
  var f1_composition := read_txt('f1_composition.txt');
  var f2_composition := read_txt('f2_composition.txt');
  var f3_composition := read_txt('f3_composition.txt');
  var f8_composition := read_txt('f8_composition.txt');
  
  
  var flow1 := new Flow(f1_composition, 1064, 300);
  var flow2 := new Flow(f2_composition, 2000, 335);
  var flow3 := new Flow(f3_composition, 1566, 265);
  var flow8 := new Flow(f8_composition, 2000, 500);
  
  var mixer1 := new Mixer;
  var mixer2 := new Mixer;
  
  var splitter1 := new Splitter(|0.333, 0.333, 0.333|);
    
  var he1 := new HeatExchanger;
  var he2 := new HeatExchanger;
  var he3 := new HeatExchanger;
  
  var flow4 := mixer1.calculate(|flow1, flow2, flow3|);
  
  var (flow9, flow10, flow11) := splitter1.calculate(flow8).ToList;
  
  var (flow12, flow5) := he1.calculate(flow9, flow4).ToList;
  var (flow13, flow6) := he2.calculate(flow10, flow5).ToList;
  var (flow14, flow7) := he3.calculate(flow11, flow6).ToList;
    
  var flow15 := mixer1.calculate(|flow12, flow13, flow14|);
 

  println('Свойства потока Flow 15');
  println('-'*20);
  flow15.print;
  println;
  println('Свойства потока Flow 7');
  println('-'*20);
  flow7.print;
  println;
  println('Исследование влияния технологических параметров:');
  println('-'*20);
  calcPFD2
end.