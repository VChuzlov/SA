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
      comp_heat_capacity[i] += (j+1) * coef[i][j] * temperature ** j;
  
  result := 0.0;
  foreach var i in mass_fractions.Indices do
    result += mass_fractions[i] * comp_heat_capacity[i]
end;


end.