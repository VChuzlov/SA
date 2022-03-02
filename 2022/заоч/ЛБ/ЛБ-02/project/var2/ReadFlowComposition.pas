unit ReadFlowComposition;


interface


function read_txt(filename: string): array of real;


implementation


function read_txt(filename: string): array of real;
begin
  foreach var (i, fraction) in ReadLines(filename).Numerate do
  begin
    SetLength(result, i);
    result[i-1] := fraction.ToReal
  end;
end;


end.