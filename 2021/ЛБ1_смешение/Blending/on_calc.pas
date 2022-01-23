uses UConst;


function calculate_octane_num(fractions:array of real; 
                              Bi: array of real := UConst.Bi; 
                              RON: array of real := UConst.RON): real;
begin
  result := 0;
  
  var delta := ArrFill(Bi.Length, 0.0);
  foreach var i in Bi.Indices do
    for var j := i+1 to Bi.High do
      delta[i] += Bi[i] * Bi[j] * fractions[i] * fractions[j];
  
  foreach var i in Bi.Indices do
    result += fractions[i] * RON[i];
  result += delta.Sum();
end;


function mix_flows(ratio: array of real; 
                   flows_composition: array of array of real): array of real;
begin
  result := ArrFill(flows_composition.Length, 0.0);
  
  foreach var i in flows_composition.Indices do
    foreach var j in flows_composition[i].Indices do
      result[i] += ratio[j] * flows_composition[i][j]
end;


function read_from_txt(filename: string): array of array of real;
begin
  foreach var (i, line) in ReadLines(filename).Numerate() do
  begin
    SetLength(result, i);
    result[i-1] := line.ToReals();
  end 
end;


begin
  var fractions := read_from_txt('data.txt');
  var mix_composition := mix_flows(|0.1, 0.1, 0.1, 0.1, 0.2, 0.4|, fractions);
  var mixture_ron := calculate_octane_num(mix_composition);
  print($'{mixture_ron:f}')
end.