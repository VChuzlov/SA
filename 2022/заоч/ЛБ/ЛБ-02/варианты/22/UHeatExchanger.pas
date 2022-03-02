unit UHeatExchanger;

interface


uses UFlow;


type
  HeatExchanger = class
    d_in := 0.11;
    d_out := 0.33;
    length := 3.01;
    k := 4900;
    
    function calculate(hot, cold: Flow;
      h: real := 0.01): array of Flow;
  end;


implementation


function HeatExchanger.calculate(hot, cold: Flow;
  h: real): array of Flow;
begin
  var v_cold := cold.volume_flow_rate / (3.14 * d_in ** 2 / 4 * length);
  var v_hot := hot.volume_flow_rate / (3.14 * d_out ** 2 / 4 * length 
                                        - 3.14 * d_in ** 2 / 4 * length);
  var len := 0.0;
  var hot_ := new Flow(hot.mass_fractions, hot.mass_flow_rate,
    hot.temperature);
  var cold_ := new Flow(cold.mass_fractions, cold.mass_flow_rate,
    cold.temperature);
  
  while len <= length do
  begin
    hot_.temperature -= k * 3.14 * d_out 
      / (v_hot * hot_.density * 1e3 * hot_.cp) 
        * (hot_.temperature - cold_.temperature);
    
    cold_.temperature += k * 3.14 * d_in
      / (v_cold * cold_.density * 1e3 * cold_.cp)
        * (hot_.temperature - cold_.temperature);
    
    len += h
  end;
  
  result := Arr(hot_, cold_)
end;


end.