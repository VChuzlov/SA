uses UConst, UGeneticAlgorithm;
  
  function read_txt(filename: string): array of array of real;
  begin
    foreach var (i, line) in ReadLines(filename).Numerate do
    begin
      Setlength (result, i);
      result[i-1] := line.ToReals;
    end;
  end;
  
  
 function mixing(ratio: array of real;
                 flows: array of array of real): array of real;
begin
  result := ArrFill(flows.Length,0.0);
  foreach var i in flows.Indices do 
    foreach var j in ratio.Indices do
      result [i] += ratio [j] * flows[i][j];
end;

         
function calculate_octane_number(fractions: array of real; 
                                 Bi: array of real := UConst.Bi;
                                 RON: array of real := UConst.RON): real;
begin
  result := 0.0;
  var B := ArrFill(Bi.Length, 0.0);
  
  foreach var i in Bi.Indices do
    for var j :=i+1 to Bi.High do
      B[i] := Bi[i] * B[j]* fractions[i] * fractions[j];
      
  foreach var i in fractions.Indices do
    result += fractions[i] * RON[i];
  result += B.Sum;
end;
  
  function normalize (x: array of real): array of real;
begin
  var s:= x.Sum;
  result:= ArrFill (x.Length, 0.0);
  foreach var i in x.Indices do
    result [i]:= x[i]/s;
end;

function objective_func(ratio, actual_values: array of real):real;
begin
  var data:= read_txt('data.txt');
  var fractions:= mixing(normalize(ratio), data);
  var ron:= calculate_octane_number(fractions);
  
  result:=(actual_values[0]-ron)**2;
end;

  
  begin
    var data := read_txt('data.txt');
//    var fractions := mixing(|0.15, 0.19, 0.33, 0.1, 0.115, 0.115|,data);
//    var ron := calculate_octane_number(fractions);
//    print($'Октановое число смешения = {ron:f}')
  var bounds:=||1e-5,0.99|,|1e-5,0.99|,|1e-5,0.99|,|1e-5,0.99|,|1e-5,0.99|,
              |1e-5,0.99||;
 var res:= genetic_algorithm(bounds, objective_func, |92.0|);
 var norm_ratio: array of array of real;
 SetLength(norm_ratio, res.Length);
 foreach var i in res.Indices do
   norm_ratio [i]:= normalize(res[i][:^1]);
 
 foreach var i in norm_ratio.Indices do
    Println(calculate_octane_number(mixing(norm_ratio[i],data)));
 
norm_ratio.PrintLines
  end.
