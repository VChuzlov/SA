unit UFlow;

interface

uses URegularFunctions, UConst;

type
  Flow = class
    mass_flow_rate: real;
    mole_flow_rate: real;
    volume_flow_rate: real;
    
    mass_fractions: array of real;
    mole_fractions: array of real;
    volume_fractions: array of real;
    
    temperature, density, molar_mass, heat_capacity: real;
    
    constructor(mass_flow_rate: real; mass_fractions: array of real; 
                temperature: real);
end;


implementation


constructor Flow.create(mass_flow_rate: real; mass_fractions: array of real; 
                temperature: real);
begin
      self.mass_flow_rate := mass_flow_rate;
      self.mass_fractions := normalize(mass_fractions);
      self.temperature := temperature;
      
      self.volume_fractions := convert_mass_to_volume_fractions(self.mass_fractions, UConst.DENSITIES);
      self.mole_fractions := convert_mass_to_mole_fractions(self.mass_fractions, UCOnst.MR);
      
      self.density := get_flow_density(self.mass_fractions, UConst.DENSITIES);
      self.molar_mass := get_flow_molar_mass(self.mass_fractions, UConst.MR);
      self.heat_capacity := get_flow_heat_capacity(self.mass_fractions, 
                                                   self.temperature, UConst.HEATCAPACITYCOEFFS);
      
      self.mole_flow_rate := self.mass_flow_rate / self.molar_mass;
      self.volume_flow_rate := self.mass_flow_rate / self.density / 1000;
    end;

end.