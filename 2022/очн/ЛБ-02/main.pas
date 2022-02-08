uses UFlow;


begin
  var mass_frac := ArrRandomReal(24, 0, 1);
  var flow1 := new Flow(mass_frac, 1000, 273.15);
  
  flow1.average_mol_mass.Println;
  flow1.mole_flow_rate.Println;
  flow1.volume_fractions.Sum.Println;
  
end.