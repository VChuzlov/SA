uses URegularFunctions;

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
    begin
      self.mass_flow_rate := mass_flow_rate;
      self.mass_fractions := normalize(mass_fractions);
      self.temperature := temperature;
      
      self.volume_fractions := convert_mass_to_volume_fractions(self.mass_fractions);
      self.mole_fractions := convert_mass_to_mole_fractions(self.mass_fractions);
      
      self.density := get_flow_density(self.mass_fractions);
      self.molar_mass := get_flow_molar_mass(self.mass_fractions);
      self.heat_capacity := get_flow_heat_capacity(self.mass_fractions, 
                                                   self.temperature);
      
      self.mole_flow_rate := self.mass_flow_rate / self.molar_mass;
      self.volume_flow_rate := self.mass_flow_rate / self.density / 1000;
    end;
    
    
  end;
  
  
  begin
    var flow1 := new Flow(1000, ArrRandomReal(24, 0.0, 1.0), 500);
    flow1.density.Println;
    flow1.mole_fractions.PrintLines;
    
  end.