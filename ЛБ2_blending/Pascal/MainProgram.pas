program Main_blending;

uses
  UBlending;

const
  flow_count = 6;
  comp_count = 64;

var
  comp_RON: TArrOfDouble;
  flow_composition: TArrOfArrOfDouble;
  mix_composition: TArrOfDouble; 
  RONc: double;
  treb_RON: double;
  i: integer;
  
procedure get_data(var RON:TArrOfDouble; flow_composition: TArrOfArrOfDouble);
var
  f1, f2: text;
  i, j: integer;
begin
  assign(f1, 'RON.txt');
  assign(f2, 'flow_comp.txt');
  reset(f1);
  reset(f2);
  for i := 0 to comp_count-1 do
    begin
      readln(f1, RON[i]);
      for j := 0 to flow_count-1 do
        read(f2, flow_composition[i, j]);
      readln(f2);
    end;
  close(f1);
  close(f2);
end;

procedure get_result(mix_composition: TArrOfDouble; RONc: double);
var
  f: text;
  i: integer;
begin
  assign(f, 'result.txt');
  rewrite(f);
  for i := 0 to flow_count-1 do
    writeln(f, 'Доля потока ', i+1, ' = ', mix_composition[i] * 100:8:2);
  writeln(f);
  writeln(f, 'Октановое число смешения = ', RONc:8:2);
  close(f);
end;

begin
  SetLength(comp_RON, comp_count);
  SetLength(flow_composition, comp_count);
  for i := 0 to comp_count-1 do
    SetLength(flow_composition[i], flow_count);
  SetLength(mix_composition, flow_count);
  write('Введите требуемое ОЧ: ');
  readln(treb_RON);
  get_data(comp_RON, flow_composition);
  blending(comp_count, flow_count, comp_RON, flow_composition, treb_RON, 
  5e-2, 5e-6, mix_composition, RONc);
  get_result(mix_composition, RONc);
end.