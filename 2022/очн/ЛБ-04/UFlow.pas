unit UFlow;


interface

uses URegularFunctions, UConst;

type
  Flow = class
    mass_flow_rate: real;
    mole_flow_rate: real;
    volume_flow_rate: real;
    
    mass_fractions: array of real;
    volume_fractions: array of real;
    mole_fractions: array of real;
    molar_fractions: array of real;
        
    temperature: real;
    pressure: real;
    density: real;
    average_mol_mass: real;
    cp: real;
    
    constructor(mass_flow_rate: real;
      mass_fractions: array of real;
      temperature, pressure: real);
    
    procedure gas_separation;
    
    function getRON(): real;
    
  end;


implementation


constructor Flow.Create(mass_flow_rate: real;
  mass_fractions: array of real;
  temperature, pressure: real);
begin
  self.mass_flow_rate := mass_flow_rate;
  self.mass_fractions := normalize(mass_fractions);
  self.temperature := temperature;
  self.pressure := pressure;
  
  self.mole_fractions := convert_mass_to_mole_fractions(
    self.mass_fractions, UConst.MR);
    
  self.volume_fractions := convert_mass_to_volume_fractions(
    self.mass_fractions, UConst.DENSITIES);
       
  self.density := get_flow_density(self.mass_fractions, UConst.DENSITIES);
  self.average_mol_mass := get_average_mol_mass(self.mass_fractions, UConst.MR);
  
  self.mole_flow_rate := self.mass_flow_rate / self.average_mol_mass;
  self.volume_flow_rate := self.mass_flow_rate / self.density / 1000;
  
  self.cp := get_flow_cp(self.mass_fractions, UConst.HEATCAPACITYCOEFFS, 
    self.temperature);
    
  self.molar_fractions := convert_mass_to_molar_fractions(self.mass_fractions,
    get_ideal_gas_den(self.temperature, self.pressure,UConst.MR), UConst.MR);
    
end;


procedure Flow.gas_separation;
begin
  var mass_flows := ArrFill(self.mass_fractions.Length, 0.0);
  foreach var i in mass_flows.Indices do
    mass_flows[i] := self.mass_fractions[i] * self.mass_flow_rate;
  
  foreach var i in range(7, 10) do
    mass_flows[i] := 0.0;
  mass_flows[^1] := 0.0;
  
  self.mass_fractions := normalize(mass_flows);
  self.mass_flow_rate := mass_flows.Sum;
  
  self.mole_fractions := convert_mass_to_mole_fractions(
    self.mass_fractions, UConst.MR);
    
  self.volume_fractions := convert_mass_to_volume_fractions(
    self.mass_fractions, UConst.DENSITIES);
       
  self.density := get_flow_density(self.mass_fractions, UConst.DENSITIES);
  self.average_mol_mass := get_average_mol_mass(self.mass_fractions, UConst.MR);
  
  self.mole_flow_rate := self.mass_flow_rate / self.average_mol_mass;
  self.volume_flow_rate := self.mass_flow_rate / self.density / 1000;
  
  self.cp := get_flow_cp(self.mass_fractions, UConst.HEATCAPACITYCOEFFS, 
    self.temperature);
end;


function Flow.getRON: real;
begin
  result := get_octane_number(self.mass_fractions, UConst.RON, UConst.Bi);
end;


end.