program kinetic_calculation;

uses UR_K_method;

const
  react_count = 3;
  comp_count = 3;
  h = 0.1;
  tk = 2;
  kin_par: array of double = (0.6, 0.26, 0.1);
  c_experimental: array of double = (0.241, 0.5492, 0.2099);
  
var
  i, j: integer;
  comp_conc: TArrOfDouble;
  //kin_par: TArrOfDouble;
  comp_conc_profile: TArrOfArrOfDouble;
  
  function kinetic_model(c, kin_par: TArrOfDouble; 
                           react_count: integer): TArrOfDouble;
  begin
    SetLength(result, comp_count);
    result[0] := - kin_par[0] * c[0];
    result[1] := kin_par[0] * c[0] - kin_par[1] * c[1] + kin_par[2] * c[2];
    result[2] := kin_par[1] * c[1] - kin_par[2] * c[2];
  end;
  
  function target_function (c: TArrOfDouble; kin_par: TArrOfDouble; 
                            react_count: integer; c_expperimental: TArrOfDouble): double;
  var
    i: integer;
    comp_conc_profile: TArrOfArrOfDouble;
  begin
    result := 0;
    comp_conc_profile := RK(kinetic_model, comp_count, react_count, h, tk, 
                          comp_conc, kin_par);
    for i := 0 to react_count-1 do
      result := result + abs(c_experimental[i] - comp_conc_profile[High(comp_conc_profile), i]);
  end;
  
  function dihotomy(a, b, delta, eps: double; c: TArrOfDouble; 
                    kin_par: TArrOfDouble; react_count: integer; 
                    kin_par_index: integer; c_expperimental: TArrOfDouble): double;
  var
    x1, x2: double;
    kin_par1, kin_par2: TArrOfDouble;
  begin
    SetLength(kin_par1, react_count);
    SetLength(kin_par2, react_count);
    repeat
      kin_par1[kin_par_index] := (a + b - delta) / 2;
      kin_par2[kin_par_index] := (a + b + delta) / 2; 
      if target_function(c, kin_par1, react_count, c_experimental) > 
                 target_function(c, kin_par2, react_count, c_experimental)
         then
            a := x1
         else
            b := x2;
    until  abs(b - a) / 2 <= eps;
    result := (a + b) / 2
  end;
  
  function get_kin_par(a, b, delta, eps: double; c: TArrOfDouble;
                       kin_par: TArrOfDouble; react_count: integer; 
                       c_expperimental: TArrOfDouble): TArrOfDouble;
  var
    i, j: integer;
    min: double;
  begin
    SetLength(result, react_count);
    for i := 0 to react_count-1 do
      begin
        min := 10;
        for j := 1 to 100000 do
          begin
            kin_par[i] := {dihotomy(a, b, delta, eps, c, kin_par, react_count, 
                              i, c_expperimental);}
                          random(1e-2, 0.7);
            if target_function(c, kin_par, react_count, c_experimental) < min then
              begin
                result[i] := kin_par[i];
                min := target_function(c, kin_par, react_count, c_experimental);
              end;
            kin_par[i] := result[i]
          end;
        writeln('K[', i, '] = ', result[i])
      end;
  end;
  
begin
  SetLength(comp_conc, comp_count);
  //SetLength(kin_par, react_count);
  comp_conc[0] := 0.8;
  comp_conc[1] := 0.2;
  comp_conc[2] := 0;
 { kin_par[0] := 0.1;
  kin_par[1] := 0.1;
  kin_par[2] := 0.1;
  kin_par :=  get_kin_par(1e-7, 1, 1e-6, 1e-5, comp_conc, 
                          kin_par, react_count, c_experimental);}
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