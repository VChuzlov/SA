uses UConst;


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


begin
  var data := read_txt('data.txt');
  var ratio := Arr(0.1, 0.1, 0.1, 0.1, 0.2, 0.4);
  var fractions := mix_flows(ratio, data);
  var ron := get_octane_number(fractions, UConst.RON, UConst.Bi);
  
  var flow := ArrFill(fractions.Length, 0.0);
  foreach var j in ratio.Indices do
  begin
    foreach var i in data.Indices do
      flow[i] := data[i][j];
    
    println($'Октанове число потока {j + 1} = {get_octane_number(flow, UConst.RON, UConst.Bi):f3}')
  end;
end.