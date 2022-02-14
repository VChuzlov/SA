unit USplitter;


interface


uses UFlow, URegularFunctions;


type
  Splitter = class
    ratio: array of real;
    
    constructor(ratio: array of real);
    function calculate(flow_: Flow): array of Flow;
  end;



implementation


constructor Splitter.Create(ratio: array of real);
begin
  self.ratio := normalize(ratio)
end;


function Splitter.calculate(flow_: Flow): array of Flow;
begin
  var mass_flows := ArrFill(self.ratio.Length, 0.0);
  
  foreach var i in mass_flows.Indices do
    mass_flows[i] := flow_.mass_flow_rate * self.ratio[i];
  
  SetLength(result, self.ratio.Length);
  foreach var i in result.Indices do
    result[i] := new Flow(mass_flows[i], flow_.mass_fractions,
      flow_.temperature)
end;


end.