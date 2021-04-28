unit UHeatExchanger;

interface

uses UFlow;

type
  HeatExchanger = class
    d_in := 0.2;
    d_out := 0.5;
    length := 3.0;
    k := 4900;
    
    function calculate(hot, cold: Flow; h: real := 0.01): sequence of Flow;
  end;

implementation


function HeatExchanger.calculate(hot, cold: Flow; h: real): sequence of Flow;
begin
  var t_hot := hot.temperature;
  var t_cold := cold.temperature;
  
  var v_cold := cold.volume_flow_rate / (3.14 * d_in ** 2 / 4 * length);
  var v_hot := hot.volume_flow_rate / (3.14 * d_out ** 2 / 4 * length
                - 3.14 * d_in ** 2 / 4 * length);
  var len := 0.0;
  
  while len <= length do
  begin
    t_hot -= k * 3.14 * d_out / (v_hot * hot.density * hot.heat_capacity) 
              * (t_hot - t_cold) * h;
    t_cold += k * 3.14 * d_in / (v_cold * cold.density * cold.heat_capacity)
              * (t_hot - t_cold) * h;
    len += h
  end;
  
  var hot_ := new Flow(hot.mass_flow_rate, hot.mass_fractions, t_hot);
  var cold_ := new Flow(cold.mass_flow_rate, cold.mass_fractions, t_cold);
  result := seq(hot_, cold_)
end;


end.