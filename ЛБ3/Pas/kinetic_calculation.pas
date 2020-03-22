program kinetic_calculation;

uses UR_K_method;

const
  react_count = 3;
  comp_count = 3;
  h = 0.1;
  tk = 2;
  kin_par: array of double = (0.6, 0.26, 0.1);
  
var
  i, j: integer;
  comp_conc: TArrOfDouble;
  comp_conc_profile: TArrOfArrOfDouble;
  
  function kinetic_model(c, kin_par: TArrOfDouble; 
                           comp_count: integer): TArrOfDouble;
  begin
    SetLength(result, comp_count);
    result[0] := - kin_par[0] * c[0];
    result[1] := kin_par[0] * c[0] - kin_par[1] * c[1] + kin_par[2] * c[2];
    result[2] := kin_par[1] * c[1] - kin_par[2] * c[2];
  end;
  
begin
  SetLength(comp_conc, comp_count);
  comp_conc[0] := 0.8;
  comp_conc[1] := 0.2;
  comp_conc[2] := 0;
  comp_conc_profile := RK(kinetic_model, comp_count, react_count, h, tk, 
                          comp_conc, kin_par);
  for i := 0 to Round(tk / h)-1 do
    begin
      write((i * h + h):4:1);
      for j := 0 to comp_count-1 do
        write(comp_conc_profile[i, j]:8:4);
      writeln();
    end;
end.