unit Runge_Kutta;


interface


function rk_sum(arr1, arr2: array of real; coef: real): array of real;

function rk(func: function(time: real; c, k: array of real): array of real; 
  c, k: array of real; start, stop: real;
  h: real := 0.01): array of array of real;


implementation


function rk_sum(arr1, arr2: array of real; coef: real): array of real;
begin
  result := ArrFill(arr1.Length, 0.0);
  foreach var i in result.Indices do
    result[i] := arr1[i] + arr2[i] * coef
end;


function rk(func: function(time: real; c, k: array of real): array of real; 
  c, k: array of real; start, stop: real;
  h: real): array of array of real;
  
 begin 
  var time := start;
  var c_ := copy(c);
  var k1, k2, k3, k4: array of real;
  var n := Trunc((stop - start) / h) + 1;
  
  SetLength(result, n);
  foreach var i in result.Indices do
    SetLength(result[i], c_.Length + 1);
  
  foreach var i in result.Indices do
  begin
    result[i][0] := time;
    result[i][1:] := c_;
    
    k1 := func(time, c_, k);
    k2 := func(time + h / 2, rk_sum(c_, k1, h / 2), k);
    k3 := func(time + h / 2, rk_sum(c_, k2, h / 2), k);
    k4 := func(time + h, rk_sum(c_, k3, h), k);
    
    foreach var j in c_.Indices do
      c_[j] += h / 6 * (k1[j] + 2 * k2[j] + 2 * k3[j] + k4[j]);
    
    time += h
  end;
  
 end;


end.