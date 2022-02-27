﻿unit UMixer;


interface


uses UFlow;


type
  Mixer = class
    function calculate(flows: array of Flow): Flow;
  end;



implementation


function Mixer.calculate(flows: array of Flow): Flow;
begin
  var mass_flow := 0.0;
  foreach var f in flows do
    mass_flow += f.mass_flow_rate;
  
  var mass_fractions := ArrFill(
    flows[0].mass_fractions.Length, 0.0);
    
  foreach var i in mass_fractions.Indices do
    foreach var f in flows do
      mass_fractions[i] += f.mass_flow_rate * f.mass_fractions[i] / mass_flow;
  
  var cp := 0.0;
  foreach var f in flows do
    cp += f.mass_flow_rate * f.cp / mass_flow;
  
  var temperature := 0.0;
  foreach var f in flows do
    temperature += f.mass_flow_rate * f.cp * f.temperature / mass_flow / cp;
  
  var p := ArrFill(flows.Length, 0.0);
  foreach var (i, flow) in flows.Numerate(0) do
    p[i] := flow.pressure;
  
  result := new Flow(mass_flow, mass_fractions, temperature, p.Min)
end;


end.