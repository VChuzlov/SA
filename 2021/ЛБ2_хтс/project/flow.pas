uses URegularFunctions;

type 
  Flow = class
    mass_flow_rate, mole_flow_rate, volume_flow_rate: real;
    mass_fractions, mole_fractions, volume_fractions: array of real;
    temperature: real;
    density: real;
    molar_mass: real;
    heat_capacity: real;
    
    constructor (mass_flow_rate: real; mass_fractions: array of real; 
                 temperature: real);
    begin
      self.mass_flow_rate := mass_flow_rate;
      self.mass_fractions := normalize(mass_fractions);
      self.temperature := temperature;
      
      self.mole_fractions := convert_mass_to_mole_fractions(self.mass_fractions);
      self.volume_fractions := convert_mass_to_volume_fractions(self.mass_fractions);
      
      self.density := get_flow_density(self.mass_fractions);
      self.molar_mass := get_flow_molar_mass(self.mass_fractions);
      self.heat_capacity := get_heat_capacity(self.mass_fractions, 
                                              self.temperature);
                                              
      self.volume_flow_rate := self.mass_flow_rate / self.density / 1000;
      self.mole_flow_rate := self.mass_flow_rate / self.molar_mass;
    end;             
  
  end;
  

begin
  var mass_frac := ArrRandomReal(24, 1e-5, 0.999);
  var f1 := new Flow(1000, mass_frac, 273.15);
  f1.volume_flow_rate.Println;
  f1.mole_flow_rate.Println;
end.