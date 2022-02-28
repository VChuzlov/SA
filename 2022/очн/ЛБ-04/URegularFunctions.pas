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

function convert_mass_to_molar_fractions(mass_fractions:array of real;
  densities, mr: array of real): array of real;


function convert_molar_to_mass_fractions(molar_fractions: array of real;
  mr: array of real): array of real;

function get_ideal_gas_den(temperature, pressure: real; 
  mr: array of real): array of real;


function get_octane_number(c: array of real;
    octane_numbers: array of real;
    bi: array of real): real;
    

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
      cp[i] += coeffs[i][j] * temperature ** j;
  
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


function convert_mass_to_molar_fractions(mass_fractions:array of real;
  densities, mr: array of real): array of real;
begin
  result := ArrFill(mass_fractions.Length, 0.0);
  
  var density := get_flow_density(mass_fractions, densities);
  
  foreach var i in mass_fractions.Indices do
    result[i] := mass_fractions[i] * density * 1000 / mr[i]  
end;


function convert_molar_to_mass_fractions(molar_fractions: array of real;
  mr: array of real): array of real;
begin
  result := ArrFill(molar_fractions.Length, 0.0);
  
  var d := 0.0;
  foreach var i in molar_fractions.Indices do
    d += molar_fractions[i] * mr[i];
    
  foreach var i in molar_fractions.Indices do
    result[i] := molar_fractions[i] * mr[i] / d 
end;


function get_ideal_gas_den(temperature, pressure: real; 
  mr: array of real): array of real;
begin
  result := ArrFill(mr.Length, 0.0);
  foreach var i in mr.Indices do
    result[i] := pressure * mr[i] / (8.314 * temperature)
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


end.