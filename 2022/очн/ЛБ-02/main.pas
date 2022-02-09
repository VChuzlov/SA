uses UFlow;

begin
  var f1 := new Flow(1000, ArrRandomReal(), 273.15); 
  f1.density.Println;
  f1.cp.Println;
  
  var f2 := new Flow(100, ArrRandomReal, 500);
  f2.cp.Println;
end.