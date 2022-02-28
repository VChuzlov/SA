unit UReactor;


interface


uses UFlow, UKinScheme, URegularFunctions, Runge_Kutta, UConst;


type
  Reactor = class
    length, diameter, volume: real;
    
    constructor(length, diameter: real);
    
    function calculate(feedstock: Flow): Flow;
  end;


implementation


constructor Reactor.Create(length, diameter: real);
begin
  self.diameter := diameter;
  self.length := length;
  self.volume := 3.14 * self.diameter ** 2 / 4 * self.length;
end;


function Reactor.calculate(feedstock: Flow): Flow;
begin
  var gas_vol_flow_rate := feedstock.mole_flow_rate * 8.314 
    * feedstock.temperature / feedstock.pressure * 1e-3;
    
  var stop_time := self.volume / gas_vol_flow_rate * 3600;
  
  var res := rk(kin_scheme, feedstock.molar_fractions + |feedstock.temperature|,
    UConst.K0, 0.0, stop_time)[^1][1:];

  var mass_fractions := convert_molar_to_mass_fractions(res[:^1], UConst.MR);
  
  result := new Flow(feedstock.mass_flow_rate, mass_fractions, res[^1], 
    feedstock.pressure);
end;


end.