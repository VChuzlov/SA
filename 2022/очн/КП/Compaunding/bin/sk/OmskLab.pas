unit OmskLab;

interface

uses Classes, SysUtils, Dialogs, Windows, MakeRes, ClipBrd, unit9;
Function FlToStr(num:Extended):String;
Type
//  TSKArray = array[1..69] of double;
  String4 = String[4];
  TPoluboy = class(TObject)
private
  BasePickNum,BaseTime,Eps:array[1..300] of double;
  SKPos:array[1..300] of integer;
  BaseName:array[1..300] of String[43];
  PickNum,Time,Area:array[1..300] of double;
  ComponentName:array[1..300] of String[43];
  Ext:String4;
  RowCount,BaseCount:integer;
public
  property TypeOfExt: String4 read Ext write Ext;
//  property ExperimentalOctan: double read OktE write OktE;
//  property Results: ResT read Res;
  constructor Create;
  destructor Destroy;
  procedure MakeSKFiles(Name: string);
  procedure GetData(Var Structure: TSKArray);
  procedure LoadFromFile(Name: string);
  procedure LoadFromClipboard;
end;

implementation

Uses Unit1,Unit5;

Function FlToStr(num:Extended):String;
var str:string[10];
begin
str:=FloatToStrF(num,ffFixed,3,3);
While pos(' ',str)>0 do delete(str,pos(' ',str),1);
While pos(',',str)>0 do str[pos(',',str)]:='.';
Result:=str;
end;

constructor TPoluboy.Create;
begin
inherited Create;
end;

destructor TPoluboy.Destroy;
begin
inherited Destroy;
end;

procedure TPoluboy.LoadFromFile(Name:string);
Var i,j: integer;
    x:real;
    f:TextFile;
    s,ss:string;
begin
RowCount:=0;
BaseCount:=0;
For i:=1 to 300  do Begin
      PickNum[i]:=0;
      Time[i]:=0;
      Area[i]:=0;
                    end;
AssignFile(f,Name);
Reset(f);
For i:=1 to 3 do Readln(f);
While not SeekEOF(f) do Begin
      Inc(RowCount);
      Try
      Readln(f,s);
      For i:=1 to length(s) do
          If s[i]=#9 then Delete(s,i,1);
      PickNum[RowCount]:=StrToFloat(copy(s,1,3));
      Time[RowCount]:=StrToFloat(copy(s,8,8));
      Area[RowCount]:=StrToFloat(copy(s,31,7));
      Except
      Dec(RowCount);
      end;
                        End;
CloseFile(f);

AssignFile(f,PutiProgram+'\basa\Omsklab.dt');
Reset(f);
While not SeekEOF(f) do Begin
      Inc(BaseCount);
      Readln(f,BasePickNum[BaseCount],BaseTime[BaseCount],Eps[BaseCount],SKPos[BaseCount],BaseName[BaseCount]);
                        End;

CloseFile(f);
For i:=1 to BaseCount do While pos(' ',BaseName[i])>0 do delete(BaseName[i],pos(' ',BaseName[i]),1)
end;

procedure TPoluboy.LoadFromClipBoard;
Var i,j,k: integer;
    SostT:TstringList;
    s,ss:string;
    sss:string[10];
    stmas:array[1..300,1..3] of double;
    f:textFile;
begin
RowCount:=0;
BaseCount:=0;
For i:=1 to 300  do Begin
for j:=1 to 3 do stmas[i,j]:=0;
      PickNum[i]:=0;
      Time[i]:=0;
      Area[i]:=0;
                    end;

SostT:=TstringList.Create;
try
s:=Clipboard.AsText;
while pos(',',s)>0 do s[pos(',',s)]:='.';
SostT.Text:=s;
For i:=0 to Pred(SostT.Count) do Begin
ss:=SostT.Strings[i];
sss:=''; k:=0;
For j:=1 to Length(ss) do Begin
 If (ss[j]<>#9) and (j<>length(ss)) then sss:=sss+ss[j]
              else Begin
              Inc(k);
              stmas[i+1,k]:=StrToFl(sss);
              sss:='';
                   end;
                          End;

                           end;
For i:=1 to SostT.Count do Begin
      PickNum[i]:=stmas[i,1];
      Time[i]:=stmas[i,2];
      Area[i]:=stmas[i,3];
                           end;
RowCount:=SostT.Count;
AssignFile(f,PutiProgram+'\basa\Omsklab.dt');
Reset(f);
While not SeekEOF(f) do Begin
      Inc(BaseCount);
      Readln(f,BasePickNum[BaseCount],BaseTime[BaseCount],Eps[BaseCount],SKPos[BaseCount],BaseName[BaseCount]);
                        End;

CloseFile(f);
For i:=1 to BaseCount do While pos(' ',BaseName[i])>0 do delete(BaseName[i],pos(' ',BaseName[i]),1)
except
ShowMessage('Ошибка копирования из буфера');
end;
SostT.Free;

end;

procedure TPoluboy.MakeSKFiles(Name: string);
Var i,j: integer;
    f: TextFile;
    s:string[43];
begin
AssignFile(f,ChangeFileExt(Name,Ext));
Rewrite(f);
For i:=1 to RowCount do Begin
  s:='';
  For j:=1 to 43-length(ComponentName[i]) do s:=s+' ';
    Writeln(f,ComponentName[i],s,FlToStr(Area[i]));
                        End;
CloseFile(f);
end;

procedure TPoluboy.GetData(Var Structure: TSKArray);
Var i,j: integer;
    f: TextFile;
    s:string[43];
begin
For i:=1 to 69 do Structure[i]:=0;
For i:=1 to RowCount do Begin
    For j:=1 to BaseCount do Begin
        If (Time[i]<(BaseTime[j]+Eps[j])) and (Time[i]>(BaseTime[j]-Eps[j])) then Begin
           ComponentName[i]:=BaseName[j];
           Structure[SKPos[j]]:=Structure[SKPos[j]]+Area[i];
                                                                                  End
                             End;
                        End;
For i:=1 to RowCount do If ComponentName[i]='' then ComponentName[i]:='Unknown component';

end;

end.
