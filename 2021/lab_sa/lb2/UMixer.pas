unit UMixer;

interface

uses UFlow;

type
  Mixer = class
    function calculate(flows: array of Flow): Flow;
  end;

implementation

function Mixer.calculate(flows: array of Flow): Flow;
begin
  var mass_flow_rate := 0.0;
  var mass_fractions := ArrFill(flows[0].mass_fractions.Length, 0.0);
  var temperature := 0.0;
  
  foreach var i in flows.Indices do
    mass_flow_rate += flows[i].mass_flow_rate;
  
  foreach var i in mass_fractions.Indices do
    foreach var j in flows.Indices do
      mass_fractions[i] += flows[j].mass_flow_rate * flows[j].mass_fractions[i]
                            / mass_flow_rate;
 
 var cp := 0.0;
 foreach var i in flows.Indices do
   cp += flows[i].mass_flow_rate * flows[i].heat_capacity / mass_flow_rate;
 
 foreach var i in flows.Indices do
   temperature += flows[i].mass_flow_rate * flows[i].heat_capacity 
                  * flows[i].temperature / mass_flow_rate / cp;
 
 result := new Flow(mass_flow_rate, mass_fractions, temperature)
end;


end.
