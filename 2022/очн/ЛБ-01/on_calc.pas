uses UConst;


function read_txt(filename: string): array of array of real;
begin
  foreach var (i, lines) in ReadLines(filename).Numerate(0) do
  begin
    SetLength(result, i+1);
    result[i] := lines.ToReals
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


function get_octane_number(fractions: array of real;
    octane_numbers: array of real;
    bi: array of real): real;
begin
  result := 0.0;
  
  foreach var i in fractions.Indices do
    result += fractions[i] * octane_numbers[i];
  
  foreach var i in fractions.Indices do
    foreach var j in fractions.Indices do
      if i <> j then
        result += bi[i] * bi[j] * fractions[i] * fractions[j]
end;


begin
  var data := read_txt('data.txt');
  var fractions := mix_flows(arr(0.1, 0.1, 0.1, 0.1, 0.2, 0.4), 
                              data);
                              
  var ron := get_octane_number(fractions, UConst.RON, UConst.Bi);
  
  var flow := ArrFill(fractions.Length, 0.0);
  foreach var j in data[0].Indices do
  begin
    foreach var i in fractions.Indices do
      flow[i] := data[i][j];
    
    get_octane_number(flow, UCOnst.RON, UConst.Bi).Println
  end;
end.