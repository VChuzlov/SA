uses UGeneticAlgorithm;


function kin_scheme(time: real; c, k: array of real): array of real;
begin
  SetLength(result, c.Length);
  result[0] := -k[0] * c[0];
  result[1] := k[0] * c[0] - k[1] * c[1];
  result[2] := k[1] * c[1];
  result[3] := k[0] * c[0] + k[1] * c[1];
end;


function runge_kutt(
         func: function(time:real; c, k: array of real): array of real;
         c, k: array of real; start, stop: real; 
         h: real := 0.01): array of array of real;
         
  function sum_(arr1, arr2: array of real; a: real): array of real;
  begin
    result := ArrFill(arr1.Length, 0.0); 
    for var i := 0 to result.High do
      result[i] += arr1[i] + a * arr2[i]
  end;
  
begin
  var k1 := ArrFill(c.Length, 0.0);
  var k2 := ArrFill(c.Length, 0.0);
  var k3 := ArrFill(c.Length, 0.0);
  var k4 := ArrFill(c.Length, 0.0);
  
  var iter := Trunc((stop - start) / h) + 1;
  
  SetLength(result, iter);
  for var i := 0 to result.High do
    SetLength(result[i], c.Length+1);
  
  var c_ := copy(c);
  var time := start;
  
  for var i := 0 to result.High do
  begin
    result[i][0] := time;
    for var j := 0 to c_.High do
      result[i][j+1] := c_[j];
    
    k1 := func(time, c_, k);
    k2 := func(time + h / 2, sum_(c_, k1, h / 2), k);
    k3 := func(time + h / 2, sum_(c_, k2, h / 2), k);
    k4 := func(time + h, sum_(c_, k3, h), k);
    
    for var j := 0 to c_.High do
      c_[j] += h / 6 * (k1[j] + 2 * k2[j] + 2 * k3[j] + k4[j]);
    
    time += h
  end;
end;


function obj_func(k, act_values: array of real): real;
begin
  var res := runge_kutt(kin_scheme, |1.0, 0.0, 0.0, 0.0|, k, 0.0, 1.0);
  
  var res_ := res[10][1:];
  foreach var i in range(20, res.High, 10) do
    res_ := res_ + res[i][1:];
  
  for var i := 0 to act_values.High do
    result += (act_values[i] - res_[i]) ** 2;
end;


begin  
  var act_values: array of real;
  foreach var (i, item) in ReadLines('act_values.txt').Numerate do
  begin
    SetLength(act_values, i);
    act_values[i-1] := item.ToReal;
  end;
  
  var k := genetic_algorithm(||1e-3, 10|, |1e-3, 10||, obj_func, act_values)[0];
  k.Println;
  
  var res := runge_kutt(kin_scheme, |1.0, 0.0, 0.0, 0.0|, k, 0.0, 1.0);
  foreach var i in range(10, res.High, 10) do
  res[i].Println;
end.