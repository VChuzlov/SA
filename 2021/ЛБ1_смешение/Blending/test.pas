uses UGeneticAlgorithm;


function f(x, act_values: array of real): real;
begin
  var (a, b, c, d) := x;
  result := abs(a + 2 * b + 3 * c + 4 * d - 30)
end;


begin
  var bounds := ||1.0, 30.0|, |1.0, 30.0|, |1.0, 30.0|, |1.0, 30.0||;
  genetic_algorithm(bounds, f, |30.0|).PrintLines
end.