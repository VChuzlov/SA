Unit UHTS;

interface

type
  TArrOfDouble = array of double;
  TArrOfArrOfDouble = array of array of double;
  
function get_comp_Cp(comp_count: integer; flows_count: integer; 
                     flows_param: TArrOfArrOfDouble): TArrOfArrOfDouble;
function get_flow_Cp(comp_count: integer; flows_count: integer; 
                     flows_composition: TArrOfArrOfDouble; 
                     comp_Cp: TArrOfArrOfDouble): TArrOfDouble;
procedure mixer(comp_count: integer; flows_count: integer; flows_param: TArrOfArrOfDouble; 
                flows_composition: TArrOfArrOfDouble; var flow_rate, flow_Cp, 
                flow_Temp: double; var flow_composition: TArrOfDouble);
procedure heater(comp_count: integer; flows_count: integer; heater_flow_rate: double;
                 heater_flow_Temp: double; flow_rate: double; flow_Cp: double; 
                 var flow_Temp: double);
procedure splitter(split_ratio: double; flow_rate: double; var flow_rate1, flow_rate2: double);

implementation

function get_comp_Cp(comp_count: integer; flows_count: integer; 
                     flows_param: TArrOfArrOfDouble): TArrOfArrOfDouble;
const
  A: array of double = (0.869, 0.963);
  B: array of double = (1e-5, 1.1e-5);
var
  i, j: integer;
begin
  SetLength(Result, flows_count);
  for i := 0 to flows_count-1 do
    SetLength(Result[i], comp_count);
  for i := 0 to comp_count-1 do
    for j := 0 to flows_count-1 do
      Result[j, i] := A[i] + B[i] * (flows_param[j, 1] + 273.15)
end;

function get_flow_Cp(comp_count: integer; flows_count: integer; 
                     flows_composition: TArrOfArrOfDouble;
                     comp_Cp: TArrOfArrOfDouble): TArrOfDouble;
var
  i, j: integer;
  s: double;
begin
  SetLength(Result, flows_count);
  for j := 0 to flows_count-1 do
    begin
      s := 0;
      for i := 0 to comp_count-1 do
        s := s + flows_composition[j, i] * comp_Cp[j, i];
      Result[j] := s;
    end;
end;

procedure mixer(comp_count: integer; flows_count: integer; flows_param: TArrOfArrOfDouble; 
                flows_composition: TArrOfArrOfDouble; var flow_rate, flow_Cp, 
                flow_Temp: double; var flow_composition: TArrOfDouble);
var
  i, j: integer;
  comp_Cp: TArrOfArrOfDouble;
  flows_Cp: TArrOfDouble;
begin
  SetLength(comp_Cp, flows_count);
  for i := 0 to flows_count-1 do
    SetLength(comp_Cp[i], comp_count);
  SetLength(flows_Cp, flows_count);
  
  flow_rate := 0;
  flow_Cp := 0;
  flow_Temp := 0;
  
  // Определяем теплоемкость каждого компонента
  comp_Cp := get_comp_Cp(comp_count, flows_count, flows_param);
  // Определяем теплоемкость потоков смесителя
  flows_Cp := get_flow_Cp(comp_count, flows_count, flows_composition, comp_Cp);
  
  (* Определение расхода смесевого потока (G4) *)
  for i:= 0 to flows_count-1 do
    flow_rate:= flow_rate + flows_param[i, 0];
  (* Определение состава смесевого потока(G4) *)
  for i:= 0 to comp_count-1 do
    for j:= 0 to flows_count-1 do
      flow_composition[i]:= flow_composition[i] + flows_param[j, 0] 
                                 * flows_composition[j, i] / flow_rate;
  (* Определение теплоемкости смесевого потока(G4) *)
  for i:= 0 to flows_count-1 do
    flow_Cp:= flow_Cp + flows_param[i, 0] / flow_rate * flows_Cp[i];
  (* Определение температуры смесевого потока(G4) *)
  for i:= 0 to flows_count-1 do
    flow_Temp:= flow_Temp + flows_param[i, 0] * flows_Cp[i] * (flows_param[i, 1] + 273.15) 
               / (flow_Cp * flow_rate);
end;

procedure heater(comp_count: integer; flows_count: integer; heater_flow_rate: double;
                 heater_flow_Temp: double; flow_rate: double; flow_Cp: double; 
                 var flow_Temp: double);
const
  d_vnutr = 0.05; // Внутр. диаметр труб, м
  d_vnesh = 0.057; // Внеш. диаметр труб, м
  kol_trub = 3280; //Количество труб
  S_sech = 5.85; //Площ. сечения теплообмена, м2
  r_term = 0.127; //Термич. сопротивление стенки, м2/Вт
  S = 3860; //Площадь теплообмена, м2
  Cp_hot = 0.920; //Теплоемкость гор. теплоносителя, Дж/(кг*К)
var
  W_cold: double; // Водяной эквивалент холодного потока
  W_hot: double; // Водяной эквивалент горячего потока
  N, M, a1, a2, Kt: double;
begin
  W_cold:= flow_rate * flow_Cp;
  W_hot:= heater_flow_rate * Cp_hot;
  N:= W_hot / W_cold;
  a1:= 1 / d_vnutr * exp(0.8 * ln(heater_flow_Temp / (kol_trub * d_vnutr))) 
       * (3.43 + 2.71e-3 * heater_flow_Temp);
  a2:= 1 / d_vnesh * exp(0.6 * ln(flow_rate * d_vnesh / S_sech)) 
       * (3.483 + 7.27e-3 * (flow_Temp - 273.15));
  Kt:= 1 / (1 / a1 + r_term + 1 / a2);
  M:= Kt * S / W_hot;
  flow_Temp := (flow_Temp - 273.15) + (heater_flow_Temp - (flow_Temp - 273.15)) 
               * N * (exp(M * (1 - N)) - 1) / (exp(M * (1 - N)) - N) + 273.15
end;

procedure splitter(split_ratio: double; flow_rate: double; var flow_rate1, flow_rate2: double);
begin
  if split_ratio <= 1 then
    begin
      flow_rate1 := split_ratio * flow_rate;
      flow_rate2 := (1 - split_ratio) * flow_rate;
    end
end;

end.
