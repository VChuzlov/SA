unit Runge_Kutta;


interface


function rk(func: function(time: real; c, k: array of real):array of real;
  c, k: array of real; start, stop: real; 
  h: real := 0.01): array of array of real;

function rk_sum(arr1, arr2: array of real; coef: real): array of real;


implementation


function rk_sum(arr1, arr2: array of real; coef: real): array of real;
begin
  result := ArrFill(arr1.Length, 0.0);
  foreach var i in result.Indices do
    result[i] := arr1[i] + coef * arr2[i]
end;


function rk(func: function(time: real; c, k: array of real): array of real;
  c, k: array of real; start, stop: real; 
  h: real): array of array of real;

begin
  var k1, k2, k3, k4: array of real;
  var time := start;
  var n := Trunc((stop - start) / h) + 1;
  var c_ := copy(c);
  
  SetLength(result, n);
  foreach var i in result.indices do
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