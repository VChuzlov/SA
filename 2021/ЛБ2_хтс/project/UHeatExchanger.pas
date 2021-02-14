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
  var len := 0.0;
  var t_cold := cold.temperature;
  var t_hot := hot.temperature;
  
  var v_cold := cold.volume_flow_rate / (3.14 * d_in ** 2 / 4 * length);
  var v_hot := hot.volume_flow_rate / (3.14 * d_out ** 2 / 4 * length 
                                        - 3.14 * d_in ** 2 / 4 * length);
  
  while len <= length do
  begin
    t_cold += k * 3.14 * d_in / (v_cold * cold.density * 1e3 * cold.heat_capacity) 
             * (t_hot - t_cold) * h;
    t_hot -= k * 3.14 * d_out / (v_hot * hot.density * 1e3 * hot.heat_capacity) 
             * (t_hot - t_cold) * h;
    len += h;
  end;
  
  cold.temperature := t_cold;
  hot.temperature := t_hot;
  
  result := seq(hot, cold)
end;

end.
