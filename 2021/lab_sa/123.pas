
begin
  var n := 10;
  var a := new real[n];
  for var i := 1 to n do
    a[i-1] := arctan(i * 2 + i / n) - sin(i + n);
  
  var f := OpenWrite('result.txt');
  for var i := 0 to a.High do
    write(f, a[i]:8:4);
  
  f.Close;
end.