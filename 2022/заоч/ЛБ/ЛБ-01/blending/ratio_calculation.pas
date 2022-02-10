uses UConst, UGeneticAlgorithm;


function read_txt(filename: string): array of array of real;
begin
  foreach var (i, line) in ReadLines(filename).Numerate(0) do
  begin
    SetLength(result, i + 1);
    result[i] := line.ToReals
  end;
end;


function mix_flows(ratio: array of real;
    fractions: array of array of real): array of real;
begin
  result := ArrFill(fractions.Length, 0.0);
  
  foreach var i in fractions.Indices do
    foreach var j in ratio.Indices do
      result[i] += ratio[j] * fractions[i][j]
end;


function get_octane_number(c: array of real;
    octane_numbers: array of real;
    bi: array of real): real;
begin
  result := 0.0;
  
  foreach var i in c.Indices do
    result += octane_numbers[i] * c[i];
  
  foreach var i in c.Indices do
    for var j := i + 1 to c.High do
      result += bi[i] * bi[j] * c[i] * c[j]
end;


function normalize(x: array of real): array of real;
begin
  result := ArrFill(x.Length, 0.0);
  var s := x.Sum;
  
  foreach var i in x.Indices do
    result[i] := x[i] / s
end;


function obj_func(ratio: array of real;
    act_values: array of real): real;
begin
  var data := read_txt('data.txt');
  var flow := mix_flows(normalize(ratio), data);
  var ron := get_octane_number(flow, UConst.RON, UConst.Bi);
  
  result := (ron - act_values[0]) ** 2 + (flow[56] - act_values[1]) ** 2
end;


begin
  var bounds := ||0.0001, 0.9|, |0.0001, 0.9|, |0.0001, 0.9|,
                 |0.0001, 0.9|, |0.0001, 0.9|, |0.0001, 0.9||;
  var results := genetic_algorithm(bounds, obj_func, |92.2, 0.01|);
  
  var data := read_txt('data.txt');
  var flow := ArrFill(data.Length, 0.0);
  foreach var r in results do
  begin
    flow := mix_flows(normalize(r[:^1]), data);
    println($'ОЧИ = {get_octane_number(flow, UConst.RON, Uconst.Bi):f}, содержание бензола = {flow[56] * 100:f}, % об.')
  end;
    
end.