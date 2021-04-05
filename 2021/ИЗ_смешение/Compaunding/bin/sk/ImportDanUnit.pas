unit ImportDanUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Unit8, ClipBrd, StdCtrls, unit5;

type
  TImpDan = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    SenDat:TStringList;
    numust:integer;
  public
    { Public declarations }
    function ImportTex(Dan:TDanFile):TDanFile;
    function ImportVSG(Dan:TDanFile):TDanFile;
    procedure Setunit(num:string);
  end;

var
  ImpDan: TImpDan;

implementation

{$R *.DFM}

function TImpDan.ImportTex(Dan:TDanFile):TDanFile;
var s,ts,tts,dat,mon:string;
    tab,ent:char;
    senspos:array[1..12] of integer;
    sensvar:array of double;
    i:integer;
begin
Result:=Dan;
tab:=chr(VK_TAB);
ent:=#$A;
s:=Clipboard.ASText;
If length(s)<40 then exit;
ts:=copy(s,1,pred(pos(ent,s)));
for i:=1 to 12 do senspos[i]:=-1;
i:=0;
repeat
tts:=copy(ts,1,pred(pos(tab,ts)));
delete(ts,1,pos(tab,ts));
If SenDat.IndexOf(tts)>=0 then senspos[succ(SenDat.IndexOf(tts))]:=i;
inc(i);
until pos(tab,ts)=0;
If SenDat.IndexOf(ts)>=0 then senspos[succ(SenDat.IndexOf(ts))]:=i;
delete(s,pred(length(s)),2);
while pos(ent,s)>0 do delete(s,1,pos(ent,s));
dat:=copy(s,1,pred(pos(tab,s)));
if pos(':',dat)>0 then delete(dat,pos(':',dat)-3,9);
If pos(' ',dat)<>0 then begin
for i:=1 to 2 do dat[pos(' ',dat)]:=DateSeparator;
dat:=copy(dat,1,pred(pos(' ',dat)));
mon:=copy(dat,succ(pos(DateSeparator,dat)),3);
delete(dat,succ(pos(DateSeparator,dat)),3);
If Mon='Jan' then Mon:='01';
If Mon='Feb' then Mon:='02';
If Mon='Mar' then Mon:='03';
If Mon='Apr' then Mon:='04';
If Mon='May' then Mon:='05';
If Mon='Jun' then Mon:='06';
If Mon='Jul' then Mon:='07';
If Mon='Aug' then Mon:='08';
If Mon='Sep' then Mon:='09';
If Mon='Oct' then Mon:='10';
If Mon='Nov' then Mon:='11';
If Mon='Dec' then Mon:='12';
insert(mon,dat,succ(pos(DateSeparator,dat)));
                        end;
i:=0;
while pos(tab,s)>0 do
 begin
 setlength(sensvar,succ(i));
 try
  sensvar[i]:=strtofl(copy(s,1,pred(pos(tab,s))));
 except
  sensvar[i]:=0;
 end;
 delete(s,1,pos(tab,s));
 inc(i);
 end;
setlength(sensvar,succ(i));
try
 sensvar[i]:=strtofl(s);
except
 sensvar[i]:=0;
end;
for i:=1 to 3 do Result.Pressure[i]:=sensvar[senspos[i]];
for i:=1 to 3 do Result.Temperature[i]:=sensvar[senspos[i+3]];
for i:=1 to 3 do Result.DifTemp[i]:=sensvar[senspos[i+3]]-sensvar[senspos[i+6]];
Result.Rg:=sensvar[senspos[10]];
If numust=6 then Result.Rg:=Result.Rg*1000;
Result.Rs:=sensvar[senspos[11]];
Result.Vl:=sensvar[senspos[12]];
Result.DaOt:=StrToDate(dat);
For i:=1 to 6 do If Result.Pressure[i]<=5 then Result.Pressure[i]:=14;
For i:=1 to 6 do If Result.Temperature[i]<=300 then Result.Temperature[i]:=490;
If Result.DifTemp[1]<=1 then Result.DifTemp[1]:=71;
If Result.DifTemp[2]<=1 then Result.DifTemp[2]:=42;
If Result.DifTemp[3]<=1 then Result.DifTemp[3]:=21;
If (numust=9) or (numust=14) then
   If Result.Rs<=10 then Result.Rs:=40;
   If Result.Rs<=10 then Result.Rs:=160;
If (numust=9) or (numust=14) then
   If Result.Rg<=100 then Result.Rg:=75000;
   If Result.Rg<=100 then Result.Rg:=180000;
If Result.Vl<=1 then Result.Vl:=15;
end;

function TImpDan.ImportVSG(Dan:TDanFile):TDanFile;
var s,s1:string;
    tab:char;
    sensvar:array of double;
    i,j,p:integer;
    Tstr:TstringList;
    h2:double;
begin
Tstr:=TstringList.Create;
Result:=Dan;
tab:=chr(VK_TAB);
s:=Clipboard.ASText;
while pos(tab+tab,s)>0 do delete(s,pos(tab+tab,s),1);
Tstr.Text:=s;
If Tstr.Count>1 then
 begin
 If length(Tstr.Strings[0])>40 then
  begin
  s:=Tstr.Strings[0];
  s1:=Tstr.Strings[pred(Tstr.Count)];
  end
 else
  begin
  s1:=Tstr.Strings[0];
  s:=Tstr.Strings[pred(Tstr.Count)];
  end;
end;
If length(s)<40 then exit;
i:=0;
while pos(tab,s)>0 do
 begin
 setlength(sensvar,succ(i));
 try
  sensvar[i]:=strtofl(copy(s,1,pred(pos(tab,s))));
 except
  dec(i);
  setlength(sensvar,succ(i));
 end;
 delete(s,1,pos(tab,s));
 inc(i);
 end;
setlength(sensvar,succ(i));
try
 sensvar[i]:=strtofl(s);
except
 dec(i);
 setlength(sensvar,succ(i));
end;
 for i:=pred(length(sensvar)) downto 0 do
  If sensvar[i]>100 then
   begin
   for j:=i to length(sensvar)-2 do sensvar[j]:=sensvar[j+1];
   setlength(sensvar,pred(length(sensvar)));
   end;
p:=-1; j:=-1;
repeat
for i:=0 to pred(length(sensvar)) do
 if sensvar[i]>50 then
  begin
  p:=i;
  break;
  end;
for i:=succ(p) to pred(length(sensvar)) do
 if sensvar[i]>50 then
  begin
  j:=i;
  break;
  end;
if j>=0 then
 begin
 for i:=p to length(sensvar)-2 do sensvar[i]:=sensvar[i+1];
 setlength(sensvar,pred(length(sensvar)));
 j:=-1;
 end;
until j<0;
If Tstr.Count>1 then
 begin
 delete(s1,1,pos(tab,s1));
 delete(s1,1,pos(tab,s1));
 s1:=copy(s1,1,pred(pos(tab,s1)));
 h2:=strtofl(s1);
 sensvar[1]:=sensvar[1]+sensvar[0]-h2;
 sensvar[0]:=h2;
 end;
Tstr.Free;
Result.C[1]:=sensvar[0];
Result.C[2]:=sensvar[1];
Result.C[3]:=sensvar[2]+sensvar[3];
Result.C[4]:=sensvar[4]+sensvar[5];
Result.C[5]:=sensvar[7];
Result.C[6]:=sensvar[6]+sensvar[8];
Result.C[7]:=sensvar[10];
Result.C[8]:=sensvar[9]+sensvar[11];
Result.C[9]:=sensvar[12];
If length(sensvar)<15 then Result.Sera:=0
 else Result.Sera:=sensvar[14];
end;

procedure TImpDan.Setunit(num:string);
begin
SenDat.Clear;
SenDat.LoadFromFile(PathS+'\sensname.'+num);
numust:=strtoint(num);
end;


procedure TImpDan.FormCreate(Sender: TObject);
begin
SenDat:=TStringList.Create;
end;

procedure TImpDan.FormDestroy(Sender: TObject);
begin
SenDat.Free;
end;

end.
