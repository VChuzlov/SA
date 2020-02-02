Unit UBlending;

interface

type
  TArrOfDouble = array of double;
  TArrOfArrOfDouble = array of array of double;
  
function get_flow_RON (comp_count:integer; RON: TArrOfDouble; 
  flow_composition: TArrOfDouble): double;
function get_mix_RON(flow_count:integer; RON: TArrOfDouble;
  mix_composition: TArrOfDouble): double;
function get_min(flow_count: integer; flows_RON: TArrOfDouble; 
  treb_RON: double): integer;
function normalization(flow_count:integer; mix_composition: TArrOfDouble): TArrOfDouble;
function get_mix_composition(eps: double; h: double; flow_count:integer; min: integer; 
  flows_RON: TArrOfDouble; trebRON: double): TArrOfDouble;
procedure blending(comp_count:integer; flow_count:integer; comp_RON:TArrOfDouble; 
  flow_composition: TArrOfArrOfDouble; treb_RON: double; 
  eps: double; h: double; var mix_composition: TArrOfDouble; var RONc:double);

implementation

function get_flow_RON (comp_count:integer; RON: TArrOfDouble; 
  flow_composition: TArrOfDouble): double;
var
  i: integer;
  s: double;
begin
  s := 0;
  for i := 0 to comp_count-1 do
    s := s + RON[i] * flow_composition[i];
  Result := s;
end;

function get_mix_RON(flow_count:integer; RON: TArrOfDouble;
  mix_composition: TArrOfDouble): double;
var
  i: integer;
  s: double;
begin
  s := 0;
  for i := 0 to flow_count-1 do
    s := s + RON[i] * mix_composition[i];
  Result := s;
end;

function get_min(flow_count:integer; flows_RON: TArrOfDouble; 
  treb_RON: double): integer;
var
  i: integer;
  d: double;
begin
  d := abs(flows_RON[0] - treb_RON);
  Result := 0;
  for i := 1 to flow_count-1 do
    if abs(flows_RON[i] - treb_RON) < d then
      begin
        d := abs(flows_RON[i] - treb_RON);
        Result := i;
      end;
end;

function normalization(flow_count:integer; mix_composition: TArrOfDouble): TArrOfDouble;
var
  i: integer;
  s: double;
begin
  SetLength(Result, flow_count);
  s := 0;
  for i := 0 to flow_count-1 do
    s := s + abs(mix_composition[i]);
  for i := 0 to flow_count-1 do
    Result[i] := abs(mix_composition[i]) / s;
end;

function get_mix_composition(eps: double; h: double; flow_count:integer; min: integer; 
  flows_RON: TArrOfDouble; trebRON: double): TArrOfDouble;
var
  i: integer;
  n: integer;
  RONc: double;
begin
  SetLength(Result, flow_count);
  n := 1;
  Result[min] := 1;
  for i := 0 to flow_count-1 do
    if i <> min then
      Result[i] := 0;
  RONc := get_mix_RON(flow_count, flows_RON, Result);
  if abs(RONc - trebRON) > eps then
    repeat
      if flows_RON[min] > trebRON then
        begin
          Result[min] := Result[min] - h;
          for i := 0 to flow_count-1 do
            if i <> min then
              if flows_RON[i] < flows_RON[min] then
                Result[i] := Result[i] + h * abs(flows_RON[i] - trebRON)
              else
                Result[i] := Result[i] - h * abs(flows_RON[i] - trebRON)
        end
      else
        begin
          Result[min] := Result[min] + h;
          for i := 0 to flow_count-1 do
            if i <> min then
              if flows_RON[i] < flows_RON[min] then
                Result[i] := Result[i] - h * abs(flows_RON[i] - trebRON)
              else
                Result[i] := Result[i] + h * abs(flows_RON[i] - trebRON)
        end;
      Result := normalization(flow_count, Result);
      RONc := get_mix_RON(flow_count, flows_RON, Result);
      if n >= 1e5 then
        begin
          writeln('Выполнено 100 000 итераций, но решение не было найдено!');
          break;
        end;
      n := n + 1;
    until abs(RONc - trebRon) <= eps;  
end;

procedure blending(comp_count:integer; flow_count:integer; comp_RON:TArrOfDouble; 
  flow_composition:TArrOfArrOfDouble;  treb_RON: double; 
  eps: double; h: double; var mix_composition: TArrOfDouble; var RONc: double);
var
  min: integer;
  i, j: integer;
  flows_RON: TArrOfDouble;
  flow_comp: TArrOfDouble;
  
begin
  SetLength(comp_RON, comp_count);
  SetLength(flow_comp, comp_count);
  SetLength(flows_RON, flow_count);
  SetLength(mix_composition, flow_count);
  SetLength(flows_RON, flow_count);
  
  for i := 0 to flow_count-1 do
    begin
      for j := 0 to comp_count-1 do
        flow_comp[j] := flow_composition[j, i] / 100;
      flows_RON[i] := get_flow_RON (comp_count, comp_RON, flow_comp);
    end;
  
  min := get_min(flow_count, flows_RON, treb_RON);
  mix_composition[min] := 1;
  for i := 0 to flow_count-1 do
    if i <> min then
      mix_composition[i] := 0;
  
  mix_composition := get_mix_composition(eps, h, flow_count, min, flows_RON, treb_RON);
  RONc := get_mix_RON(flow_count, flows_RON, mix_composition);
  
end;

end.