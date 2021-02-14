unit UFlow;

interface 

uses URegularFunctions;

type 
  Flow = class
    mass_flow_rate, mole_flow_rate, volume_flow_rate: real;
    mass_fractions, mole_fractions, volume_fractions: array of real;
    temperature: real;
    density: real;
    molar_mass: real;
    heat_capacity: real;
    
    constructor Create(mass_flow_rate: real; mass_fractions: array of real; 
                       temperature: real); 
    
    procedure show();
  
  end;

implementation

constructor Flow.Create(mass_flow_rate: real; mass_fractions: array of real; 
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

procedure Flow.show();
begin
  print($'Flow object: mass flow rate: {self.mass_flow_rate}')
end;


end.