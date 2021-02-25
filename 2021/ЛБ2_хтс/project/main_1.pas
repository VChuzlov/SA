uses UFlow, UMixer, UHeatExchanger, USplitter;

const
  f1_mass_frac: array of real = (9.75361395781172E-06, 0, 0.0975361395781172, 
    9.75361395781172E-06, 0.000975361395781172, 0.00975361395781172,
    0.00975361395781172, 0.000975361395781172, 9.75361395781172E-06,
    0.146304209367176, 9.75361395781172E-06, 0.146304209367176,
    0.000975361395781172, 9.75361395781172E-06, 0.000975361395781172,
    9.75361395781172E-05, 9.75361395781172E-05, 9.75361395781172E-06,
    0.195072279156234, 0.0487680697890586, 9.75361395781172E-07,
    0.292608418734352, 0.000975361395781172, 0.0487680697890586);
    
  f8_mass_frac: array of real  = (9.30006761149154E-06, 0, 0, 9.30006761149154E-06, 
    0.000930006761149154, 0.00930006761149154, 0.00930006761149154,
    0.000930006761149154, 9.30006761149154E-06, 0.465003380574577,
    9.30006761149154E-06, 0.232501690287288, 0.000930006761149154, 
    9.30006761149154E-06, 0.000930006761149154, 9.30006761149154E-05, 
    9.30006761149154E-05, 9.30006761149154E-06, 0, 0.232501690287288,
    9.30006761149154E-07, 0, 0.000930006761149154, 0.0465003380574577);

procedure main(comp1, comp2: array of real; G1, G2: real; t1, t2: real);
begin
 var flow1 := new Flow(G1, f1_mass_frac, t1);
 var flow8 := new Flow(G2, f8_mass_frac, t2);
 
 var sp1 := new Splitter(|0.33, 0.33, 0.33|);
 var flows := sp1.calculate(flow1);
 var (flow2, flow3, flow4) := (flows[0], flows[1], flows[2]);
 
 
 var sp2 := new Splitter(|0.3, 0.3, 0.3|);
 flows := sp2.calculate(flow8);
 var (flow9, flow10, flow11) := (flows[0], flows[1], flows[2]);
 
 var he1 := new HeatExchanger;
 var he2 := new HeatExchanger;
 var he3 := new HeatExchanger;
 
 var (flow12, flow5) := he1.calculate(flow9, flow2);
 var (flow13, flow6) := he2.calculate(flow10, flow3);
 var (flow14, flow7) := he3.calculate(flow11, flow4);
 
 var mixer1 := new Mixer;
 var mixer2 := new Mixer;
 
 var flow15 := mixer1.calculate(|flow12, flow13, flow14|);
 var flow16 := mixer2.calculate(|flow5, flow6, flow7|);
 
 flow15.temperature.Print;
 flow16.temperature.Println;
end;


begin
  foreach var t in range(300, 450, 10) do
    main(f1_mass_frac, f8_mass_frac, 1000, 3000, t, 500)
end.