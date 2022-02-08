uses UFlow;


begin
  var mass_frac := ArrRandomReal(24, 0, 1);
  var flow := new Flow(mass_frac, 1000, 273.15);
  
  flow.average_mol_mass.Println;
  flow.mole_flow_rate.Println;
  flow.volume_fractions.Sum.Println
end.