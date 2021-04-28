unit URegularFunctions;

interface

uses UConst;

function normalize(x: array of real): array of real;
function convert_mass_to_volume_fractions(mass_fractions: array of real;
         density: array of real := UConst.DeNSITIES): array of real;
function convert_mass_to_mole_fractions(mass_fractions: array of real;
         mass: array of real := UConst.MR): array of real; 
function get_flow_density(mass_fractions: array of real;
         density: array of real := UConst.DENSITIES): real;
function get_flow_molar_mass(mass_fractions: array of real;
         mass: array of real := UConst.MR): real;
function get_flow_heat_capacity(mass_fractions: array of real; temperature: real;
         coeffs: array of array of real := UConst.HEATCAPACITYCOEFFS): real;
         
implementation

function normalize(x: array of real): array of real;
begin
  var s := x.Sum;
  result := ArrFill(x.Length, 0.0);
  
  foreach var i in x.Indices do
    result[i] := x[i] / s
end;


function convert_mass_to_volume_fractions(mass_fractions: array of real;
         density: array of real): array of real;
begin
  var s := 0.0;
  result := ArrFill(mass_fractions.Length, 0.0);
  
  foreach var i in mass_fractions.Indices do
    s += mass_fractions[i] / density[i];
  
  foreach var i in mass_fractions.Indices do
    result[i] := mass_fractions[i] / density[i] / s
end;  


function convert_mass_to_mole_fractions(mass_fractions: array of real;
         mass: array of real): array of real; 
begin
  var s := 0.0;
  result := ArrFill(mass_fractions.Length, 0.0);
  
  foreach var i in mass_fractions.Indices do
    s += mass_fractions[i] / mass[i];
  
  foreach var i in mass_fractions.Indices do
    result[i] := mass_fractions[i] / mass[i] / s
end;
  

function get_flow_density(mass_fractions: array of real;
         density: array of real): real;  
begin
  result := 0.0;
  foreach var i in mass_fractions.Indices do
    result += mass_fractions[i] / density[i];
  result := 1 / result
end;


function get_flow_molar_mass(mass_fractions: array of real;
         mass: array of real): real;
begin
  result := 0.0;
  foreach var i in mass_fractions.Indices do
    result += mass_fractions[i] / mass[i];
  result := 1 / result
end;


function get_flow_heat_capacity(mass_fractions: array of real; temperature: real;
         coeffs: array of array of real): real;
begin
  var cpi := ArrFill(mass_fractions.Length, 0.0);
  foreach var i in coeffs.Indices do
    foreach var j in coeffs[i].Indices do
      cpi[i] += (j+1) * coeffs[i][j] * temperature ** j;
    
  result := 0.0;
  foreach var i in mass_fractions.Indices do
    result += mass_fractions[i] * cpi[i]
end;


end.