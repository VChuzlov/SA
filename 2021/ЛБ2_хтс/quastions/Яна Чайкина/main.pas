uses UFlow, UMixer, UHeatExchanger, USplitter;

begin
  var f1 := new Flow(1088, |0.0000,	0.0000,	0.0001,	0.0002,	0.0003,
  0.0004,	0.0005,	0.0006,	0.0007,	0.0008,
  0.0009,	0.0010,	0.0011,	0.0012,	0.0013,
  0.0014,	0.0015,	0.0016,	0.0017,	0.0018,
  0.0019,	0.0020,	0.0021,	0.0478|, 300);
  
  var S1 := new Splitter(Arr(0.333, 0.333, 0.333));
  var flows := S1.calculate(f1);
  var (f2, f3, f4) := (flows[0], flows[1], flows[2]);
  
  var f8 := new Flow(3000, |0.0000, 0.0000, 0.0000, 0.0000, 0.0009, 0.0093, 0.0093,
  0.0009, 0.0000, 0.4650, 0.0000, 0.2325, 0.0009, 0.0000,
  0.0009, 0.0001, 0.0001, 0.0000, 0.0000, 0.2325, 0.0000,
  0.0000, 0.0009, 0.0465|, 500);
  
  var Sp2 := new Splitter(Arr(0.333, 0.333, 0.333));
  var flowss := Sp2.calculate(f8);
  var (f9, f10, f11) := (flowss[0], flowss[1], flowss[2]);
  
  var he1 := new HeatExchanger;
  var (f5, f12) := he1.calculate(f2, f9);
  
  var he2 := new HeatExchanger;
  var (f6, f14) := he2.calculate(f3, f11);
  
  var he3 := new HeatExchanger;
  var (f7, f13) := he3.calculate(f4, f10);
  
  var M1 := new Mixer;
  var f15 := M1.calculate(Arr(f12, f13, f14));
  
  var M2 := new Mixer;
  var f16 := M2.calculate(Arr(f5, f6, f7));
  
  writeln('Comp 2 ', f2.mass_fractions);
  writeln('R 2 ', f2.mass_flow_rate);
  writeln('Т 2 ', f2.temperature);
  writeln('D 2 ', f2.density);
  writeln('Cp 2 ', f2.heat_capacity);
  writeln;
  
  writeln('Comp 3 ', f3.mass_fractions);
  writeln('R 3 ', f3.mass_flow_rate);
  writeln('Т 3 ', f3.temperature);
  writeln('D 3 ', f3.density);
  writeln('Cp 3 ', f3.heat_capacity);
  writeln;
  
  writeln('Comp 4 ', f4.mass_fractions);
  writeln('R 4 ', f4.mass_flow_rate);
  writeln('Т 4 ', f4.temperature);
  writeln('D 4 ', f4.density);
  writeln('Cp 4 ', f4.heat_capacity);
  writeln;
  
  writeln('Comp 5 ', f5.mass_fractions);
  writeln('R 5 ', f5.mass_flow_rate);
  writeln('Т 5 ', f5.temperature);
  writeln('D 5 ', f5.density);
  writeln('Cp 5 ', f5.heat_capacity);
  writeln;
  
  writeln('Comp 6 ', f6.mass_fractions);
  writeln('R 6 ', f6.mass_flow_rate);
  writeln('Т 6 ', f6.temperature);
  writeln('D 6 ', f6.density);
  writeln('Cp 6 ', f6.heat_capacity);
  writeln;
  
  writeln('Comp 7 ', f7.mass_fractions);
  writeln('R 7 ', f7.mass_flow_rate);
  writeln('Т 7 ', f7.temperature);
  writeln('D 7 ', f7.density);
  writeln('Cp 7 ', f7.heat_capacity);
  writeln;
  
  writeln('Comp 9 ', f9.mass_fractions);
  writeln('R 9 ', f9.mass_flow_rate);
  writeln('Т 9 ', f9.temperature);
  writeln('D 9 ', f9.density);
  writeln('Cp 9 ', f9.heat_capacity); writeln;
  writeln;
  
  writeln('Сomp 10 ', f10.mass_fractions);
  writeln('R 10 ', f10.mass_flow_rate);
  writeln('Т 10 ', f10.temperature);
  writeln('D 10 ', f10.density);
  writeln('Cp 10 ', f10.heat_capacity);
  writeln;
  
  writeln('Comp 11 ', f11.mass_fractions);
  writeln('R 11 ', f11.mass_flow_rate);
  writeln('Т 11 ', f11.temperature);
  writeln('D 11 ', f11.density);
  writeln('Cp 11 ', f11.heat_capacity);
  writeln;
  
  writeln('Comp 12 ', f12.mass_fractions);
  writeln('R 12 ', f12.mass_flow_rate);
  writeln('Т 12 ', f12.temperature);
  writeln('D 12 ', f12.density);
  writeln('Cp 12 ', f12.heat_capacity);
  writeln;
  
  writeln('Comp 13 ', f13.mass_fractions);
  writeln('R 13 ', f13.mass_flow_rate);
  writeln('Т 13 ', f13.temperature);
  writeln('D 13 ', f13.density);
  writeln('Cp 13 ', f13.heat_capacity);
  writeln;
  
  writeln('Comp 14 ', f14.mass_fractions);
  writeln('R 14 ', f14.mass_flow_rate);
  writeln('Т 14 ', f14.temperature);
  writeln('D 14 ', f14.density);
  writeln('Cp 14 ', f14.heat_capacity);
  writeln;
  
  writeln('Comp 15 ', f15.mass_fractions);
  writeln('R 15 ', f15.mass_flow_rate);
  writeln('Т 15 ', f15.temperature);
  writeln('D 15 ', f15.density);
  writeln('Cp 15 ', f15.heat_capacity);
  
  writeln('Comp 16 ', f16.mass_fractions);
  writeln('R 16 ', f16.mass_flow_rate);
  writeln('Т 16 ', f16.temperature);
  writeln('D 16 ', f16.density);
  writeln('Cp 16 ', f16.heat_capacity);
end.