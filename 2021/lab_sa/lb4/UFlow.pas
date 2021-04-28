unit UFlow;

interface 

uses URegularFunctions, UConst;

type 
  Flow = class
    mass_flow_rate, mole_flow_rate, volume_flow_rate: real;
    mass_fractions, mole_fractions, volume_fractions, 
    molar_fractions: array of real;
    
    temperature: real;
    density: real;
    molar_mass: real;
    heat_capacity: real;
    pressure: real;
    
    constructor Create(mass_flow_rate: real; mass_fractions: array of real; 
                       temperature, pressure: real);
    function gas_separation: sequence of Flow;
    function getRON(Bi: array of real := UConst.Bi;
                    RON: array of real:= UConst.RON): real;
                              
end;


implementation

constructor Flow.Create(mass_flow_rate: real; mass_fractions: array of real; 
                        temperature, pressure: real);
begin
      self.mass_flow_rate := mass_flow_rate;
      self.mass_fractions := normalize(mass_fractions);
      self.temperature := temperature;
      self.pressure := pressure;
      
      self.mole_fractions := convert_mass_to_mole_fractions(self.mass_fractions, 
                                                            UConst.MR);
      self.volume_fractions := convert_mass_to_volume_fractions(self.mass_fractions, 
                                                                UConst.DENSITIES);
      self.molar_fractions := convert_mass_to_molar_fractions(self.mass_fractions, 
                              get_gas_densities(self.temperature, self.pressure, 
                              UConst.MR), UConst.MR);
      
      self.density := get_flow_density(self.mass_fractions, UConst.DENSITIES);
      self.molar_mass := get_flow_molar_mass(self.mass_fractions, UConst.MR);
      self.heat_capacity := get_heat_capacity(self.mass_fractions, 
                                              self.temperature, UConst.HEATCAPACITYCOEFFS);
                                              
      self.volume_flow_rate := self.mass_flow_rate / self.density / 1000;
      self.mole_flow_rate := self.mass_flow_rate / self.molar_mass;
      
    end;


function Flow.gas_separation: sequence of Flow;
begin
  var gas_mass_frac := ArrFill(self.mass_fractions.Length, 0.0);
  var gas_mass_flow_rate := 0.0;
  
  for var i := 7 to 10 do
  begin
    gas_mass_frac[i] := self.mass_fractions[i];
    gas_mass_flow_rate += self.mass_fractions[i] * self.mass_flow_rate;
    self.mass_fractions[i] := 0.0;
    self.volume_fractions[i] := 0.0;
    self.mole_fractions[i] := 0.0;
  end;
  
  var h2_mass_frac := ArrFill(self.mass_fractions.Length-1, 0.0) + |1.0|;
  var h2_mass_flow_rate := self.mass_fractions[^1] * self.mass_flow_rate;
  
  self.mass_fractions[^1] := 0.0;
  self.volume_fractions[^1] := 0.0;
  self.mole_fractions[^1] := 0.0;
  
  self.mass_flow_rate -= gas_mass_flow_rate + h2_mass_flow_rate;
  self.mass_fractions := normalize(self.mass_fractions);
  self.volume_fractions := normalize(self.volume_fractions);
  self.mole_fractions := normalize(self.mole_fractions);
  
  var gas := new Flow(gas_mass_flow_rate, gas_mass_frac, self.temperature, 
                      self.pressure);
  var h2 := new Flow(h2_mass_flow_rate, h2_mass_frac, self.temperature, 
                     self.pressure);
  
  result := seq(gas, h2)
end;


function Flow.getRON(Bi: array of real; RON: array of real): real;
begin
  result := 0.0;
  var B := ArrFill(Bi.Length, 0.0);
  
  foreach var i in Bi.Indices do
    for var j := i+1 to Bi.High do
      B[i] := Bi[j] * Bi[i] * self.volume_fractions[i] * self.volume_fractions[j];
  
  foreach var i in self.volume_fractions.Indices do
    result += self.volume_fractions[i] * RON[i];
  result += B.Sum
end;


end.