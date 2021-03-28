unit URegularFunctions;

interface

uses UConst;

function normalize(x: array of real): array of real;
function convert_mass_to_volume_fractions(mass_fractions: array of real; 
         densities: array of real := UConst.DENSITIES): array of real;
function convert_mass_to_mole_fractions(mass_fractions: array of real; 
         molar_masses: array of real := UConst.MR): array of real;
function get_flow_density(mass_fractions: array of real; 
         densities: array of real := UConst.DENSITIES): real;
function get_flow_molar_mass(mass_fractions:array of real;
         molar_masses: array of real := UConst.MR): real;
function get_heat_capacity(mass_fractions: array of real; temperature: real;
         coef: array of array of real := UConst.HEATCAPACITYCOEFFS): real;
function convert_mass_to_molar_fractions(mass_fractions:array of real;
         densities: array of real := UConst.DENSITIES;
         molar_masses: array of real := UConst.MR): array of real;
function convert_molar_to_mass_fractions(molar_fractions: array of real;
         molar_masses: array of real := UConst.MR): array of real;
function runge_kutt(func: function(time: real; c, k: array of real): array of real;
                    c, k:array of real; start, stop: real; 
                    h: real := 0.01): array of array of real;
function get_gas_densities(temperature, pressure: real; 
                            mol_masses: array of real := UConst.MR): array of real;

implementation


function normalize(x: array of real): array of real;
begin
  var s := x.Sum;
  result := ArrFill(x.Length, 0.0);
  
  foreach var i in x.Indices do
    result[i] := x[i] / s
end;


function convert_mass_to_volume_fractions(mass_fractions, 
         densities: array of real): array of real;
begin
  result := ArrFill(mass_fractions.Length, 0.0);
  var s := 0.0;
  foreach var i in mass_fractions.Indices do
    s += mass_fractions[i] * densities[i];
  
  foreach var i in mass_fractions.Indices do
    result[i] := mass_fractions[i] * densities[i] / s
end;


function convert_mass_to_mole_fractions(mass_fractions, 
         molar_masses: array of real): array of real;
begin
  result := ArrFill(mass_fractions.Length, 0.0);
  var s := 0.0;
  foreach var i in mass_fractions.Indices do
    s += mass_fractions[i] / molar_masses[i];
  
  foreach var i in mass_fractions.Indices do
    result[i] := mass_fractions[i] / molar_masses[i] / s
end;


function get_flow_density(mass_fractions,
         densities: array of real): real;
begin
  var s := 0.0;
  foreach var i in mass_fractions.Indices do
    s += mass_fractions[i] / densities[i];
  
  result := 1 / s
end;


function get_flow_molar_mass(mass_fractions,
         molar_masses: array of real): real;
begin
  var s := 0.0;
  foreach var i in mass_fractions.Indices do
    s += mass_fractions[i] / molar_masses[i];
  
  result := 1 / s
end;


function get_heat_capacity(mass_fractions: array of real; temperature: real;
         coef: array of array of real): real;
begin
  var comp_heat_capacity := ArrFill(mass_fractions.Length, 0.0);
  foreach var i in mass_fractions.Indices do
    foreach var j in coef[i].Indices do
      comp_heat_capacity[i] += coef[i][j] * temperature ** j;
  
  result := 0.0;
  foreach var i in mass_fractions.Indices do
    result += mass_fractions[i] * comp_heat_capacity[i]
end;


function convert_mass_to_molar_fractions(mass_fractions:array of real;
         densities: array of real; molar_masses:array of real): array of real;
begin
  result := ArrFill(mass_fractions.Length, 0.0);
  var flow_density := get_flow_density(mass_fractions, densities);
  
  for var i := 0 to result.High do
    result[i] := mass_fractions[i] / molar_masses[i] * flow_density * 1000;
end;
         

function convert_molar_to_mass_fractions(molar_fractions: array of real;
         molar_masses: array of real): array of real;
begin
  result := ArrFill(molar_fractions.Length, 0.0);
  
  var flow_density := 0.0;
  for var i := 0 to molar_fractions.High do
    flow_density += molar_fractions[i] * molar_masses[i];
  
  for var i := 0 to result.High do
    result[i] := molar_fractions[i] * molar_masses[i] / flow_density;
  
end;  


function runge_kutt(func: function(time: real; c, k: array of real): array of real;
                    c, k:array of real; start, stop: real; 
                    h: real): array of array of real;
  
  function sum(a: real; arr1, arr2: array of real): array of real;
  begin
    result := ArrFill(arr1.Length, 0.0);
    
    for var i := 0 to arr1.High do
      result[i] += arr1[i] + arr2[i] * a
  end;

begin
  var k1, k2, k3, k4: array of real;
  var time := start;
  var iter := Trunc((stop - start) / h) + 1;
  var c_ := copy(c);
  
  SetLength(result, iter);
  for var i := 0 to iter-1 do
    SetLength(result[i], c.Length+1);
  
  for var i := 0 to result.High do
  begin
    result[i][0] := time;
    for var j := 0 to c_.High do
      result[i][j+1] := c_[j];
      
    k1 := func(time, c_, k);
    k2 := func(time + h / 2, sum(h / 2, c_, k1), k);
    k3 := func(time + h / 2, sum(h / 2, c_, k2), k);
    k4 := func(time + h, sum(h, c_, k3), k);
    
    for var j := 0 to c_.High do
      c_[j] += h / 6 * (k1[j] + 2 * k2[j] + 2 * k3[j] + k4[j]);
    
    time += h
  end;
end;


function get_gas_densities(temperature, pressure: real; 
                            mol_masses: array of real): array of real;
begin
  result := ArrFill(mol_masses.Length, 0.0);
  for var i := 0 to result.High do
    result[i] := pressure * mol_masses[i] / (8.314 * temperature)
end;

end.