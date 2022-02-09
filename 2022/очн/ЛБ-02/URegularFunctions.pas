unit URegularFunctions;


interface


function convert_mass_to_volume_fractions(
  mass_fractions: array of real;
  density: array of real): array of real;

function convert_mass_to_mole_fractions(
  mass_fractions: array of real;
  mr: array of real): array of real;

function get_flow_density(mass_fractions: array of real;
  density: array of real): real;


function get_average_mol_mass(mass_fractions: array of real;
  mr:array of real): real;
  

function get_flow_cp(mass_fractions: array of real;
  coeffs: array of array of real;
  temperature: real): real;

function normalize(x: array of real): array of real;


implementation


function convert_mass_to_volume_fractions(
  mass_fractions: array of real;
  density: array of real): array of real;
begin
  result := ArrFill(mass_fractions.Length, 0.0);
  var s := 0.0;
  
  foreach var i in mass_fractions.Indices do
    s += mass_fractions[i] / density[i];
  
  foreach var i in mass_fractions.Indices do
    result[i] := mass_fractions[i] / density[i] / s
end;


function convert_mass_to_mole_fractions(
  mass_fractions: array of real;
  mr: array of real): array of real;
begin
  result := ArrFill(mass_fractions.Length, 0.0);
  var s := 0.0;
  
  foreach var i in mass_fractions.Indices do
    s += mass_fractions[i] / mr[i];
  
  foreach var i in mass_fractions.Indices do
    result[i] := mass_fractions[i] / mr[i] / s
end;


function get_flow_density(mass_fractions: array of real;
  density: array of real): real;
begin
  result := 0.0;
  
  foreach var i in mass_fractions.Indices do
    result += mass_fractions[i] / density[i];
  
  result := 1 / result
end;


function get_average_mol_mass(mass_fractions: array of real;
  mr:array of real): real;
begin
  result := 0.0;
  
  foreach var i in mass_fractions.Indices do
    result += mass_fractions[i] / mr[i];
  
  result := 1 / result
end;
  
  
function get_flow_cp(mass_fractions: array of real;
  coeffs: array of array of real;
  temperature: real): real;
begin
  result := 0.0;
  var cp := ArrFill(mass_fractions.Length, 0.0);
  
  foreach var i in mass_fractions.Indices do
    foreach var j in coeffs[i].Indices do
      cp[i] += (j + 1) * coeffs[i][j] * temperature ** j;
  
  foreach var i in mass_fractions.Indices do
    result += mass_fractions[i] * cp[i]
end;


function normalize(x: array of real): array of real;
begin
  result := ArrFill(x.Length, 0.0);
  var s := x.Sum;
  
  foreach var i in x.Indices do
    result[i] := x[i] / s
end;


end.