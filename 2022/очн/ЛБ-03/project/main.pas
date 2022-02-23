uses Runge_Kutta, UGeneticAlgorithm;


function kin_scheme(time: real; c, k: array of real): array of real;
begin
  result := ArrFill(c.Length, 0.0);
  result[0] := -k[0] * c[0];
  result[1] := k[0] * c[0] - k[1] * c[1];
  result[2] := k[1] * c[1];
  result[3] := k[0] * c[0] + k[1] * c[1]
end;


function obj_func(k, act_val: array of real): real;
begin
  var res := rk(kin_scheme, |1.0, 0.0, 0.0, 0.0|, k, 0.0, 1.0);  
  var res1d := res[10][1:];
  
  foreach var i in range(20, res.High, 10) do
    res1d := res1d + res[i][1:];
  
  foreach var i in res1d.Indices do
    result += (res1d[i] - act_val[i]) ** 2
end;


begin
  var act_val: array of real;
  foreach var (i, val) in ReadLines('act_val.txt').Numerate do
  begin
    SetLength(act_val, i);
    act_val[i-1] := val.ToReal
  end;
 
 var k := genetic_algorithm(||1e-3, 5.0|, |1e-3, 5.0||, obj_func, act_val)[0];
 var res := rk(kin_scheme, |1.0, 0.0, 0.0, 0.0|, k[:^1], 0.0, 1.0);
 res[::10].PrintLines
end.