uses UConst, UGeneticAlgorythm;


function read_txt(filename: string): array of array of real;
begin
  foreach var (i, line) in ReadLines(filename).Numerate() do
  begin
    SetLength(result, i);
    result[i-1] := line.ToReals();
  end 
end;


function mixing(ratio: array of real; 
                   flows_composition: array of array of real): array of real;
begin
  result := ArrFill(flows_composition.Length, 0.0);
  
  foreach var i in flows_composition.Indices do
    foreach var j in flows_composition[i].Indices do
      result[i] += ratio[j] * flows_composition[i][j]
end;



function calculate_octane_number(fractions:array of real; 
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


function normalize(x: array of real): array of real;
begin
  result := ArrFill(x.Length, 0.0);
  var s := x.Sum;
  
  foreach var i in x.Indices do
    result[i] := x[i] / s;  
end;


function objective_function(ratio, actual_values: array of real): real;
begin
  var data := read_txt('data.txt');
  var fractions := mixing(normalize(ratio), data);
  var ron := calculate_octane_number(fractions);
 
  result := (actual_values[0] - ron) ** 2 
            + (actual_values[1] - fractions[57]) ** 2;
end;


begin
  var data := read_txt('data.txt');
  
  var bounds := ||0.1, 0.9|, |0.1, 0.9|, |0.1, 0.9|,
                 |0.1, 0.9|, |0.1, 0.9|, |0.1, 0.9||;
  var res := genetic_algorithm(bounds, objective_function, |92.0, 0.01|);
  
  var norm_ratio: array of array of real;
  SetLength(norm_ratio, res.Length);
  foreach var i in norm_ratio.Indices do
  begin
    SetLength(norm_ratio[i], res[i].Length-1);
    norm_ratio[i] := normalize(res[i][:^1])
  end;
  norm_ratio.PrintLines;
  
  foreach var row in norm_ratio do
  begin
    var mixture := mixing(row, data);
    calculate_octane_number(mixture).Println;
    mixture[57].Println
  end
end.