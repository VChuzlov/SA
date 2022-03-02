unit UFlow;
  

interface


uses UConst, URegularFunctions;


type
  Flow = class
    mass_fractions: array of real;
    volume_fractions: array of real;
    mole_fractions: array of real;
    
    mass_flow_rate: real;
    volume_flow_rate: real;
    mole_flow_rate: real;
    
    temperature: real;
    cp: real;
    density: real;
    average_mol_mass: real;
    
    constructor(mass_fractions: array of real;
      mass_flow_rate: real;
      temperature: real);
      
    procedure print_composition(basis: string);
    procedure print;
  end;
  
  procedure print_array(a: array of real);


implementation


procedure print_array(a: array of real);
begin
  foreach var x in a do
    println($'{x:f4}')
end;


constructor Flow.Create(mass_fractions: array of real;
  mass_flow_rate: real;
  temperature: real);
begin
  self.mass_fractions := normalize(mass_fractions);
  self.mass_flow_rate := mass_flow_rate;
  self.temperature := temperature;
  
  self.volume_fractions := convert_mass_to_volume_fractions(
    self.mass_fractions, UConst.DENSITIES);
    
  self.mole_fractions := convert_mass_to_mole_fractions(
    self.mass_fractions, UConst.MR);
    
  self.cp := get_flow_cp(self.mass_fractions, self.temperature,
    UConst.HEATCAPACITYCOEFFS);
  self.density := get_flow_density(self.mass_fractions,
    UConst.DENSITIES);
  self.average_mol_mass := get_average_mol_mass(
    self.mass_fractions, UConst.MR);
  
  self.mole_flow_rate := self.mass_flow_rate / self.average_mol_mass;
  self.volume_flow_rate := self.mass_flow_rate / self.density
end;


procedure Flow.print_composition(basis: string);
begin
  if basis = 'mass' then
    print_array(self.mass_fractions);
  
  if basis = 'volume' then
    print_array(self.volume_fractions);
  
  if basis = 'mole' then
    print_array(self.mole_fractions)
end;


procedure Flow.print;
begin
  println($'Температура: {self.temperature}, K');
  println($'Массовый расход: {self.mass_flow_rate}, кг/ч');
  println('Массовые доли компонентов:');
  self.print_composition('mass')
end;


end.