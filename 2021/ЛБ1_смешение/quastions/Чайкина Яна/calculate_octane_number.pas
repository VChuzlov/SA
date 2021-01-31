uses Uconst;

function read_txt(filename: string): array of array of real;
begin
  foreach var (i, line) in ReadLines(filename).Numerate do
  begin
    Setlength(result, i);
    result[i - 1] := line.ToReals;
  end;
end;

function mixing(ratio: array of real;
                flows: array of array of real): array of real;

begin
  result := ArrFill(flows.Length, 0.0);
  foreach var i in flows.Indices do
    foreach var j in ratio. Indices do
      result[i] += ratio[j] * flows[i][j];
end;

function calculate_octane_number(fractions: array of real; 
                                   Bi: array of real := Uconst.Bi;
                                   RON: array of real := Uconst.RON): real;
begin
  result := 0.0;
  var B := ArrFill(Bi.Length, 0.0);
  
  foreach var i in Bi.Indices do
    for var j := i + 1 to Bi. High do
      B[i] := Bi[i] * Bi[j] * fractions[i] * fractions[j];
  
  foreach var i in fractions.Indices do
    result += fractions[i] * RON[i];
  result += B.Sum;
end;

begin
  var data := read_txt('data.txt');
  var fractions := mixing(|0.1, 0.1, 0.1, 0.1, 0.2, 0.4|, data);
  var ron := calculate_octane_number(fractions);
  print($'Октановое чилсо смешения = {ron:f}');
  
end.