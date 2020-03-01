program hts;

uses
  UHTS;
  
const
  comp_count = 2;
  flows_count = 3;
  
var 
  flows_composition: TArrOfArrOfDouble; // Состав потоков,подаваемых на смешение
  flows_param: TArrOfArrOfDouble; // Параметры потоков
  heater_flow_rate: double; // Расход горячего потока теплообменника
  heater_flow_Temp: double; // Начальная температура горячего потока теплообменника
  flow_rate: double; // Расход потока
  flow_Cp: double;  // Теплоемкость потока
  flow_Temp: double; // Конечная температура холодного потока
  flow_composition: TArrOfDouble; // Состав потока после смешения
  flow_rate1: double; // Расходы потока после делителя 
  flow_rate2: double; // Расходы потока после делителя
  f1, f2: text;
  i, j: integer;

begin
  SetLength(flows_param, flows_count);
  for i := 0 to flows_count-1 do
    SetLength(flows_param[i], comp_count);
  SetLength(flows_composition, flows_count);
  for i := 0 to flows_count-1 do
    SetLength(flows_composition[i], comp_count);
  SetLength(flow_composition, comp_count);
    
  assign(f1, 'flows_param.txt');
  reset(f1);
  assign(f2, 'flows_composition.txt');
  reset(f2);
  //Считывание параметров потоков
  for i:= 0 to flows_count-1 do
    begin
      for j:= 0 to comp_count-1 do
        read(f1, flows_param[i, j]);
      readln(f1)
    end;
  //Считывание составов потоков
  for i:= 0 to flows_count-1 do
    begin
      for j:= 0 to comp_count-1 do
        read(f2, flows_composition[i, j]);
      readln(f2)
    end;
    
  writeln('===========Смеситель===========');
  mixer(comp_count, flows_count, flows_param, flows_composition, flow_rate, 
        flow_Cp, flow_Temp, flow_composition);
  writeln('Расход потока', flow_rate:10, ' кг / ч');
  for i:= 0 to comp_count-1 do
    writeln('Доля компонента ', i+1, flow_composition[i]:8:4);
  writeln('Теплоемкость потока', flow_Cp:10:4, ' Дж / (кг * К)');
  writeln('Температура потока', flow_Temp:13:4, ' K');
  
  writeln('===========Теплообменник===========');
  heater(comp_count, flows_count, 6200, 360, flow_rate, flow_Cp, flow_Temp);
  //heater (6200, 360, mix_Flow_Rate, mix_Cp, mix_Temp, heated_Flow_Temp, mix_Comp_Frac);
  writeln('Т нагретого потока', flow_Temp:10:4, ' K');
  writeln('F нагретого потока', flow_rate:6, ' кг/ч');
  for i:= 0 to comp_count-1 do
    writeln('Доля компонента ', i, flow_composition[i]:9:4);
  
  writeln('===========Делитель===========');
  Splitter(0.8, flow_rate, flow_rate1, flow_rate2);
  writeln('F потока ', 1, flow_rate1:9);
  writeln('F потока ', 2, flow_rate2:9);
  
  close(f1);
  close(f2)
end.