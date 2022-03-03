﻿uses Runge_Kutta, UGeneticAlgorithm;


function kin_scheme(time: real; c, k: array of real): array of real;
begin
  result := ArrFill(c.Length, 0.0);
  result[0] := -k[0] * c[0] * c[1];
  result[1] := -k[0] * c[0] * c[1] - k[1] * c[2] * c[1];
  result[2] := k[0] * c[0] * c[1] - k[1] * c[2] * c[1];
  result[3] := k[1] * c[2] * c[1]
end;


function obj_func(k, act_val: array of real): real;
begin
  var res := rk(kin_scheme, |1.0, 1.0, 0.0, 0.0|, k, 0.0, 1.5);
  var res1d := res[15][1:];
  foreach var i in range(30, res.High, 15) do
    res1d := res1d + res[i][1:];
  
  foreach var i in act_val.Indices do
    result += (res1d[i] - act_val[i]) ** 2
end;


begin
  var act_val: array of real;
  foreach var (i, val) in ReadLines('var23.txt').Numerate do
  begin
    SetLength(act_val, i);
    act_val[i - 1] := val.ToReal;
  end;
  
  var k := genetic_algorithm(||1e-3, 5.0|, |1e-3, 5.0||, obj_func, act_val)[0];
  println('Константы скоростей реакций:');
  println($'k1 = {Round(k[0], 5)}; k2 = {Round(k[1], 5)}');
  println($'Суммарная ошибка: {k[2]}');
    
  println;
  var res := rk(kin_scheme, |1.0, 1.0, 0.0, 0.0|, k[:^1], 0.0, 1.5);
  println('Время, с', '  C[0]', '    C[1]', '    C[2]', '    C[3]');
  foreach var line in res[::15] do
  begin
    foreach var i in line.Indices do
      print($'{line[i]:f4}', ' ');
    println
  end
end.