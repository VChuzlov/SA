unit UFlowCalc;


interface


uses UFlow, UMixer, UHeatExchanger, USplitter, ReadFlowComposition;


procedure calcPFD1();


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
    var flow1 := new Flow(f1_composition, 1035, t);
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
  
  println('Ò Flow 16, K', '|',  '(Ò Flow 16) - (T Flow 1), K');
  foreach var i in res.Indices do
  begin
    foreach var j in res[i].Indices do
      print($'        {res[i][j]}');
    println
  end
end;


end.