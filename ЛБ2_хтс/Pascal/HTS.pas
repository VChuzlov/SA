program hts;
type
  m = array [1..100] of real;
  m2 = array [1..10, 1..100] of real;
const
  k = 2; // Количество компонентов в потоках;
  p = 3; // Количество потоков, подаваемых в смеситель
(*Коэффициенты для определения теплоемкости*)
  A: array [1..k] of real = (0.869, 0.963);
  B: array [1..k] of real = (1e-5, 1.1e-5);
(*Параметры теплообменника*)
  d_vnutr = 0.05; // Внутр. диаметр труб, м
  d_vnesh = 0.057; // Внеш. диаметр труб, м
  kol_trub = 3280; //Количество труб
  S_sech = 5.85; //Площ. сечения теплообмена, м2
  r_term = 0.127; //Термич. сопротивление стенки, м2/Вт
  S = 3860; //Площадь теплообмена, м2
  Cp_hot = 0.920; //Теплоемкость гор. теплоносителя, Дж/(кг*К)
var
  Flow_Rate: m; // Массовый расход потоков,подаваемых на смешение
  Flow_T: m; // Температура потоков,подаваемых на смешение 
  Flow_Comp_Frac: m2; // Состав потоков,подаваемых на смешение
  flows_param: m2; // Параметры потоков
  flows_composition: m2; // Составы потоков
  Cp_comp: m2; // Массив теплоемкостей компонентов
  Flow_Cp: m; // Массив теплоемкостей потоков
  heater_Flow_Rate: real; // Расход горячего потока теплообменника
  heater_Flow_Temp: real; // Начальная температура горячего потока теплообменника
  heated_Flow_Temp: real; // Конечная температура холодного потока
  splitFlow_Rate: m; // Расходы потоков после делителя 
  mix_Flow_Rate, mix_Cp, mix_Temp: real;
  mix_Comp_Frac: m;
  f1, f2: text;
  i, j: integer;
  
procedure getCp_comp(Flows_param: m2; var Cp_comp: m2);
var
  i, j: integer;
begin
  for i:= 1 to k do
    for j:= 1 to p do
      Cp_comp[j, i]:= A[i] + B[i] * (Flows_param[j, 2] + 273);
end;

procedure getFlow_Cp(flows_composition: m2; var Flow_Cp: m);
var
  i, j: integer;
begin
  for j:= 1 to p do
    for i:= 1 to k do 
      Flow_Cp[j]:= Flow_Cp[j] + flows_composition[j, i] * Cp_comp[j, i];
end;

procedure Mixer (Flows_param, Flows_composition: m2; var mix_Flow_Rate, mix_Cp, 
                 mix_Temp: real; var mix_Comp_Frac: m);
var
  i, j: integer;
begin
  //mix_Flow_Rate:= 0;
  getCp_comp(Flows_param, Cp_comp); // Определяем теплоемкость каждого компонента
  getFlow_Cp(flows_composition, Flow_Cp); // Определяем теплоемкость потоков смесителя
  (*Определение расхода смесевого потока (G4)*)
  for i:= 1 to p do
    mix_Flow_Rate:= mix_Flow_Rate + Flows_param[i, 1];
  (*Определение состава смесевого потока(G4)*)
  for i:= 1 to k do
    for j:= 1 to p do
      mix_Comp_Frac[i]:= mix_Comp_Frac[i] + Flows_param[j, 1] * Flows_composition[j, i] / mix_Flow_Rate;  
  (*Определение теплоемкости смесевого потока(G4)*)
  for i:= 1 to p do
    mix_Cp:= mix_Cp + Flows_param[i, 1] / mix_Flow_Rate * Flow_Cp[i];
  (*Определение температуры смесевого потока(G4)*)
  for i:= 1 to p do
    mix_Temp:= mix_Temp + Flows_param[i, 1] * Flow_Cp[i] * (Flows_param[i, 2] + 273) / (mix_Cp * mix_Flow_Rate);
end;  

procedure heater (heater_Flow_Rate, heater_Flow_Temp: real; 
                  var mix_Flow_Rate, mix_Cp, mix_Temp, heated_Flow_Temp: real; 
                  var mix_Comp_Frac: m);
var
  i, j: integer;
  W_cold: real; // Водяной эквивалент холодного потока
  W_hot: real; // Водяной эквивалент горячего потока
  N, M, a1, a2, Kt: real; 
begin
  W_cold:= mix_Flow_Rate * mix_Cp;
  W_hot:= heater_Flow_Rate * Cp_hot;
  N:= W_hot / W_cold;
  a1:= 1 / d_vnutr * exp(0.8 * ln(heater_Flow_Rate / (kol_trub * d_vnutr))) * (3.43 + 2.71e-3 * heater_Flow_Temp);
  a2:= 1 / d_vnesh * exp(0.6 * ln(mix_Flow_Rate * d_vnesh / S_sech))*(3.483 + 7.27e-3 * (mix_Temp - 273));
  Kt:= 1 / (1 / a1 + r_term + 1 / a2);
  M:= Kt * S / W_hot;
  heated_Flow_Temp:= (mix_Temp - 273) + (heater_Flow_Temp - (mix_Temp - 273)) * N * (exp(M * (1 - N)) - 1) / (exp(M * (1 - N)) - N)
end;

procedure Splitter(split_Flow1, split_Flow2, mix_Flow_Rate: real; var splitFlow_Rate: m);
var
  i: integer;
begin
  splitFlow_Rate[1]:= split_Flow1 * mix_Flow_Rate;
  splitFlow_Rate[2]:= split_Flow2 * mix_Flow_Rate;
end;

begin
  assign(f1, 'flows_param.txt');
  reset(f1);
  assign(f2, 'flows_composition.txt');
  reset(f2);
  //Считывание параметров потоков
  for i:= 1 to p do
    begin
      for j:= 1 to k do
        read(f1, flows_param[i, j]);
      readln(f1)
    end;
  //Считывание составов потоков
  for i:= 1 to p do
    begin
      for j:= 1 to k do
        read(f2, flows_composition[i, j]);
      readln(f2)
    end;
  writeln('===========Смеситель===========');
  Mixer(Flows_param, Flows_composition, mix_Flow_Rate, mix_Cp, mix_Temp, mix_Comp_Frac);
  Writeln('Расход потока', mix_Flow_Rate:10, ' кг/ч');
  for i:= 1 to k do
    Writeln('Доля компонента ', i, mix_Comp_Frac[i]:8:4);
  writeln('Теплоемкость G4', mix_Cp:10:4, ' Дж/(кг*К)');
  writeln('Температура G4', mix_Temp:13:4, ' K');
  writeln('===========Теплообменник===========');
  heater (6200, 360, mix_Flow_Rate, mix_Cp, mix_Temp, heated_Flow_Temp, mix_Comp_Frac);
  writeln('Т нагретого потока', heated_Flow_Temp:10:4, ' °C');
  writeln('F нагретого потока', mix_Flow_Rate:6, ' кг/ч');
  for i:= 1 to k do
    Writeln('Доля компонента ', i, mix_Comp_Frac[i]:9:4);
  writeln('===========Делитель===========');
  Splitter(0.5, 0.5, mix_Flow_Rate, splitFlow_Rate);
  for i:= 1 to 2 do
  writeln('F потока ', i, splitFlow_Rate[i]:9);
  close(f1);
  close(f2)
end.