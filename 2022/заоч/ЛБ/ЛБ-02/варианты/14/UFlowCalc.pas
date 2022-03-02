unit UFlowCalc;


interface


uses UFlow, UMixer, UHeatExchanger, USplitter, ReadFlowComposition;


procedure calcPFD1();
procedure calcPFD2();


implementation


procedure calcPFD1;
begin
  var he1 := new HeatExchanger;
  var he2 := new HeatExchanger;
  var he3 := new HeatExchanger;
  var splitter1 := new Splitter(|0.333, 0.333, 0.333|);
  var splitter2 := new Splitter(|0.333, 0.333, 0.333|);
  var mixer1 := new Mixer;
  var mixer2 := new Mixer;
  
  var res: array of array of real;
  
  var f1_composition := read_txt('f1_composition.txt');
  var f8_composition := read_txt('f8_composition.txt');
  
  foreach var (i, t) in range(300, 450, 10).Numerate do
  begin
    var flow1 := new Flow(f1_composition, 1159, t);
    var flow8 := new Flow(f8_composition, 3000, 500);
  
    var (flow2, flow3, flow4) := splitter1.calculate(flow1).ToList;
  
    
    var(flow9, flow10, flow11) := splitter2.calculate(flow8).ToList;
  
    var (flow12, flow5) := he1.calculate(flow9, flow2).ToList;
    var (flow14, flow6) := he2.calculate(flow11, flow3).ToList;
    var (flow13, flow7) := he3.calculate(flow10, flow4).ToList;
  
    var flow15 := mixer1.calculate(|flow12, flow13, flow14|);
    var flow16 := mixer2.calculate(|flow5, flow6, flow7|);
    
    SetLength(res, i);
    res[i-1] := |t, Round(flow16.temperature - flow1.temperature, 2)|;
  end;
  
  println('Т Flow 16, K', '|',  '(Т Flow 16) - (T Flow 1), K');
  foreach var i in res.Indices do
  begin
    foreach var j in res[i].Indices do
      print($'        {res[i][j]}');
    println
  end
end;


procedure calcPFD2;
begin
  var f1_composition := read_txt('f1_composition.txt');
  var f2_composition := read_txt('f2_composition.txt');
  var f3_composition := read_txt('f3_composition.txt');
  var f8_composition := read_txt('f8_composition.txt');
  
  var flow2 := new Flow(f1_composition, 2000, 305);
  var flow3 := new Flow(f2_composition, 1645, 310);
  var flow8 := new Flow(f8_composition, 2000, 500);
  
  var mixer1 := new Mixer;
  var mixer2 := new Mixer;
  
  var splitter1 := new Splitter(|0.333, 0.333, 0.333|);
    
  var he1 := new HeatExchanger;
  var he2 := new HeatExchanger;
  var he3 := new HeatExchanger;
  
  var res: array of array of real;
  foreach var (i, flow_rate) in range(2500, 2000, -50).Numerate do
  begin
    var flow1 := new Flow(f1_composition, flow_rate, 300);
      
    var flow4 := mixer1.calculate(|flow1, flow2, flow3|);
  
    var (flow9, flow10, flow11) := splitter1.calculate(flow8).ToList;
  
    var (flow12, flow5) := he1.calculate(flow9, flow4).ToList;
    var (flow13, flow6) := he2.calculate(flow10, flow5).ToList;
    var (flow14, flow7) := he3.calculate(flow11, flow6).ToList;
    
    var flow15 := mixer1.calculate(|flow12, flow13, flow14|);
    
      SetLength(res, i);
      res[i-1] := |flow_rate, Round(flow7.temperature, 2)|;
  end;
  
  println('Массовый расход Flow2, кг/ч', '|',  'Температура Flow 7, K');
  foreach var i in res.Indices do
  begin
    foreach var j in res[i].Indices do
      print($'               {res[i][j]}');
    println
  end
end;


end.