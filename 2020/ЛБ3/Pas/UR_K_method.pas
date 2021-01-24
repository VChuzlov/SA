unit UR_K_method;

interface

type
  TArrOfDouble = array of double;
  TArrOfArrOfDouble = array of array of double;
  Tfunc = function (c: TArrOfDouble; kin_par: TArrOfDouble; 
                    comp_count: integer):TArrOfDouble;
  
function RK(f: Tfunc; comp_count, react_count: integer; h, tk: double;
            init_conc, kin_par: TArrOfDouble): TArrOfArrOfDouble;

implementation

function RK(f: Tfunc; comp_count, react_count: integer; h, tk: double; 
            init_conc, kin_par: TArrOfDouble): TArrOfArrOfDouble;
var
  k1, k2, k3, k4, z: TArrOfDouble;
  i, j: integer;
begin
  SetLength(result, Round(tk / h));
  for i := 0 to Round(tk / h)-1 do
    SetLength(result[i], comp_count);
  SetLength(k1, comp_count);
  SetLength(k2, comp_count);
  SetLength(k3, comp_count);
  SetLength(k4, comp_count);
  SetLength(z, comp_count);
  for j := 0 to Round(tk / h)-1 do
    begin
      k1 := f(init_conc, kin_par, react_count);
      for i := 0 to comp_count-1 do
        z[i] := init_conc[i] + k1[i] * h / 2;
      k2 := f(z, kin_par, react_count);
      for i := 0 to comp_count-1 do
        z[i] := init_conc[i] + k2[i] * h / 2;
      k3 := f(z, kin_par, react_count);
      for i := 0 to comp_count-1 do
        z[i] := init_conc[i] + k3[i] * h;
      k4 := f(z, kin_par, react_count);
      for i := 0 to comp_count-1 do
        begin
          init_conc[i] := init_conc[i] + (k1[i] + 2 * k2[i] + 2 * k3[i] + k4[i]) * h / 6;
          result[j, i] := init_conc[i]
        end;
    end;
end;

end.