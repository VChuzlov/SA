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
                              UConst.DENSITIES, UConst.MR);
      
      self.density := get_flow_density(self.mass_fractions, UConst.DENSITIES);
      self.molar_mass := get_flow_molar_mass(self.mass_fractions, UConst.MR);
      self.heat_capacity := get_heat_capacity(self.mass_fractions, 
                                              self.temperature, UConst.HEATCAPACITYCOEFFS);
                                              
      self.volume_flow_rate := self.mass_flow_rate / self.density / 1000;
      self.mole_flow_rate := self.mass_flow_rate / self.molar_mass;
    end;


end.