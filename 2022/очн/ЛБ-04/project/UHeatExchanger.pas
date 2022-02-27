unit UHeatExchanger;


interface


uses UFlow;


type
  HeatExchanger = class
    d_in := 0.55;
    d_out := 0.7;
    length := 3.0;
    k := 4900;
    
    function calculate(hot, cold: Flow; h: real := 0.01): array of Flow;
  end;



implementation


function HeatExchanger.calculate(hot, cold: Flow; h: real): array of Flow;
begin
  var v_c := cold.volume_flow_rate / (3.14 * d_in ** 2 / 4 * length);
  var v_h := hot.volume_flow_rate / (3.14 * d_out ** 2 / 4 * length
                                      - 3.14 * d_in ** 2 / 4 * length);
                                      
  var hot_ := new Flow(hot.mass_flow_rate, hot.mass_fractions,
    hot.temperature, hot.pressure);
  var cold_ := new Flow(cold.mass_flow_rate, cold.mass_fractions,
    cold.temperature, cold.pressure);
    
  var len := 0.0;
  
  while len <= length do
  begin
    cold_.temperature += k * 3.14 * d_in / (v_c * cold_.density * cold_.cp)
      * (hot_.temperature - cold_.temperature) * h;
    hot_.temperature -= k * 3.14 * d_out / (v_h * hot_.density * hot_.cp)
      * (hot_.temperature - cold_.temperature) * h;
    len += h
  end;
  
  result := |hot_, cold_|
end;


end.