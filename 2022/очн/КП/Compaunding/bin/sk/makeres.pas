unit makeres;

interface
uses SysUtils;
Const ResNam:array[1..24] of string=('Дата','Активность','Температура',
      'Давление','Подача хлорорганики','Сера','Расход сырья','Влажность',
      'Водород','Скорость подачи','Кратность циркуляции ВСГ','моль/моль',
      'Число крекинга','О.ч.м','О.ч.и','Выход продукта','Октанотонны',
      'Кокс на катализаторе','Хлор на катализаторе','Переработанное сырье',
      'Средняя температура','Парафины/(нафт.+аром)','н-Пар/и-Пар','Дегидроциклизация');
type ResT=record
          Data:TDateTime;
          DataS:string[10];
          akt:double;
          T,P,Cl:array[1..3] of double;
          Sera,GSir,Vlaga,H2,Spod,VSG,VSGm,Krek:double;
          Par,IPar,Naf5,Naf6,Arom:array[1..2,1..11] of double;
          Sost:array[1..5,1..31] of Double;
          Ochm,Ochi,Vyh,Oktt:double;
          Koks,Clkat:array[1..3] of double;
          Pererab,Tsr,P_NAr:double;
          nP_iP:array[1..2] of double;
          Degidr,dT:double;
          koksNakopl:double;
          end;
      PResT=^ResCount;
      ResCount=record
               sv:ResT;
               NextS:PResT;
               end;
Var CurRes:ResT;
    FirstS,CurS,NextS,FS,ListF:PResT;
    Fd,Fm,Fy,Ld,Lm,Ly:integer;
    Fdata,LData:TDateTime;
    FlagF: Boolean;
function MakeResFile(Resfile:string):ResT;
function LoadRes(Resfile:string):ResT;
procedure MakeSvod(ResFile,SvodFile:string);
implementation
uses  unit5,unit8;
procedure MakeSvod(ResFile,SvodFile:string);
var SF:file of ResT;
begin
New(FS);
Fs^.sv:=MakeResFile(ResFile);
  FlagF:=False;
  If not FileExists(SvodFile) then
  begin
  AssignFile(SF,SvodFile);
  Rewrite(SF);
  CloseFile(SF);
  end;
  Assignfile(SF,SvodFile);
  reset(SF);
  New(FirstS);
  NextS:=FirstS;
  CurS:=FirstS;
  While (not eof(SF)) do Begin
  FlagF:=True;
  Read(SF,NextS^.sv);
  CurS:=NextS;
  New(NextS);
  CurS^.NextS:=NextS;
  end;
  If (not FlagF) Then FirstS:=nil;
  CurS^.NextS:=nil;
  Dispose(NextS);
  CloseFile(SF);
Fdata:=FS^.sv.data;
FlagF:=true;
CurS:=FirstS;
NextS:=nil;
  While (CurS<>nil)and(FlagF) do Begin
  Ldata:=CurS^.sv.data;
  If FData<LData then begin
      FlagF:=False;
      If (NextS=nil)or(NextS^.sv.Data<>FS^.sv.Data)
       Then Begin
      If nextS<>nil then begin
         nextS^.NextS:=FS;
         FS^.NextS:=CurS;
                          end
      else begin
         FirstS:=FS;
         FirstS^.NextS:=CurS;
           end;                       end
       else begin NextS^.sv:=FS^.sv;
            Dispose(FS);
            FS:=NextS;
            end
                                      end;
  NextS:=CurS;
  CurS:=CurS^.NextS;
                                 end;
If NextS=nil Then begin
FS^.NextS:=nil;
FirstS:=FS;
NextS:=FS;
FlagF:=False;
                    end;
If (FlagF) then
   If (NextS^.sv.Data<>FS^.sv.Data)
    then begin
   NextS^.NextS:=FS;
   FS^.NextS:=nil
              end
   else
   begin
   NextS^.sv:=FS^.sv;
   Dispose(FS);
   FS:=NextS;
   end;
If FS<>FirstS then
 begin
 CurS:=FirstS;
 NextS:=FirstS^.NextS;
 while NextS<>FS do
  begin
  CurS:=NextS;
  NextS:=NextS^.NextS;
  end;
 If (FS.sv.Pererab-CurS.sv.Pererab)>0 then
 FS.sv.koksNakopl:=CurS.sv.koksNakopl+FS.sv.koks[3]/FS.sv.Pererab*(FS.sv.Pererab-CurS.sv.Pererab)
 else FS.sv.koksNakopl:=FS.sv.koks[3];
 end;
CurS:=FS;
NextS:=FS^.NextS;
while NextS<>nil do
begin
 If (NextS.sv.Pererab-CurS.sv.Pererab)>0 then
 NextS.sv.koksNakopl:=CurS.sv.koksNakopl+NextS.sv.koks[3]/NextS.sv.Pererab*(NextS.sv.Pererab-CurS.sv.Pererab)
 else NextS.sv.koksNakopl:=NextS.sv.koks[3];
 CurS:=NextS;
 NextS:=NextS^.NextS;
end;
assignFile(SF,SvodFile);
rewrite(SF);
CurS:=FirstS;
While CurS<>nil Do Begin
Write(SF,CurS^.sv);
CurS:=CurS^.NextS
                    end;
CloseFile(SF);
CurS:=FirstS;
While CurS<>nil do
 begin
 FirstS:=CurS^.NextS;
 Dispose(CurS);
 CurS:=FirstS;
 end;
end;

function LoadRes(Resfile:string):ResT;
Var F:file of ResT;
begin
AssignFile(F,ResFile);
Reset(F);
Read(F,Result);
CloseFile(F);
end;

function MakeResFile(Resfile:string):ResT;
Var F:TextFile;
    i,j,pos:word;
    code:integer;
    s:string;
begin
AssignFile(F,Resfile);
try
Reset(F);
Readln(F);
With CurRes do
begin
Readln(F,s);
S[3]:=DateSeparator;
S[6]:=DateSeparator;
Data:=StrToDate(copy(S,1,10));
DataS:=FormatDateTime(LongDat,Data);
Readln(F,s);
val(copy(s,40,4),akt,code);
Readln(F,s);
val(copy(s,36,5),T[1],code);
val(copy(s,51,5),T[2],code);
val(copy(s,66,5),T[3],code);
Readln(F,s);
val(copy(s,35,4),P[1],code);
val(copy(s,49,4),P[2],code);
val(copy(s,63,4),P[3],code);
Readln(F,s);
val(copy(s,33,3),Cl[1],code);
val(copy(s,47,3),Cl[2],code);
val(copy(s,61,3),Cl[3],code);
Readln(F,s);
val(copy(s,29,4),Sera,code);
val(copy(s,62,5),GSir,code);
Readln(F,s);
val(copy(s,27,4),Vlaga,code);
H2:=StrToFl(copy(s,40,5));
//val(copy(s,41,4),H2,code);
val(copy(s,61,4),SPod,code);
Readln(F,s);
val(copy(s,30,6),VSG,code);
val(copy(s,46,4),VSGm,code);
val(copy(s,60,3),Krek,code);
For i:=1 to 5 do Readln(F);
for i:=1 to 11 do
 begin
 Readln(F,s);
 If i=11 then Readln(F,s);
 If length(s)<69 then continue;
 val(copy(s,2,5),Par[1,i],code);
 val(copy(s,9,5),Par[2,i],code);
 val(copy(s,16,5),iPar[1,i],code);
 val(copy(s,23,5),iPar[2,i],code);
 val(copy(s,30,5),Naf5[1,i],code);
 val(copy(s,37,5),Naf5[2,i],code);
 val(copy(s,44,5),Naf6[1,i],code);
 val(copy(s,51,5),Naf6[2,i],code);
// val(copy(s,58,5),Arom[1,i],code);
// val(copy(s,65,5),Arom[2,i],code);
 Arom[1,i]:=StrToFl(copy(s,58,6));
 Arom[2,i]:=StrToFl(copy(s,65,5));
 end;
For i:=1 to 5 do Readln(F);
For i:=1 to 31 do
 begin
 Readln(F,s);
 pos:=14;
 for j:=1 to 5 do
  begin
  val(copy(s,pos,5),Sost[j,i],code);
  Case j of
  1..2,4:pos:=Pos+11;
  3:pos:=Pos+10;
  end;
  end
 end;
Readln(F,s);
If length(s)<41 then Ochm:=0
else val(copy(s,46,6),Ochm,code);
Readln(F,s);
If length(s)<41 then Ochi:=0
else val(copy(s,45,6),Ochi,code);
Readln(F,s);
val(copy(s,27,6),Vyh,code);
If length(s)>41 then val(copy(s,41,7),Oktt,code)
else Oktt:=0;
Readln(F,s);
val(copy(s,26,5),Koks[1],code);
val(copy(s,31,5),Koks[2],code);
val(copy(s,36,5),Koks[3],code);
Readln(F,s);
val(copy(s,26,5),ClKat[1],code);
val(copy(s,31,5),ClKat[2],code);
val(copy(s,36,5),ClKat[3],code);
Readln(F,s);
val(copy(s,27,10),Pererab,code);
val(copy(s,48,5),Tsr,code);
{If (Pererab-w)>0 then w:=(Pererab-w)/pererab else w:=1;
koks[1]:=koks[1]*w+strToFl(Form8.koks1.Text);
koks[2]:=koks[2]*w+strToFl(Form8.koks2.Text);
koks[3]:=koks[3]*w+strToFl(Form8.koks3.Text);}
koksNakopl:=koks[3];
Readln(F,s);
val(copy(s,13,4),P_NAr,code);
val(copy(s,27,5),nP_iP[1],code);
val(copy(s,33,5),nP_iP[2],code);
val(copy(s,58,5),Degidr,code);
Result:=CurRes;
end;
finally
CloseFile(F);
end;
i:=length(ResFile);
delete(ResFile,i-3,4);
ResFile:=ResFile+'.dan';
If FileExists(ResFile) then
  begin
  AssignFile(F,ResFile);
  Reset(F);
  For i:=1 to 5 do Readln(F);
  Readln(F,s);
  val(copy(s,1,6),CurRes.dT,code);
  CloseFile(F);
  end
Else CurRes.dT:=0;
Result:=CurRes;
end;
end.
