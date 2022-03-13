unit SvodSir;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Buttons, Grids, MakeRes, ClipBrd;

type
  TSirSvod = class(TForm)
    StringGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    BitBtn3: TBitBtn;
    Button1: TButton;
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    Procedure AddToFile(Res:ResT);
    Function FileToDate(FileName:String):String;
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DataS:String;
  end;

var
  SirSvod: TSirSvod;

Const
  SirName: array[1..31] of String[6] = ('  H2  ','  C1  ','  C2  ','  C3  ',
             '  nC4 ','  nC5 ','  nC6 ','  nC7 ','  nC8 ','  nC9 ',' nC10 ',
             '  iC4 ','  iC5 ','  iC6 ','  iC7 ','  iC8 ',' iC9  ',' iC10 ',
             '  ZP  ',' MZP  ',' DMZP ','  ZG  ','  MZG ','  C8H ','  C9H ',
             ' C10H ',' BENZ ',' TOLY ',' KSIL ','  AP9 ',' AP10 ');


implementation
Uses Unit5;
{$R *.DFM}

Function TSirSvod.FileToDate(FileName:String):String;
Begin
If (pos('-',FileName)=0) then FileName:='Нет даты'
                         else
   While pos('-',FileName)>0 do FileName[pos('-',FileName)]:='.';
Result:=FileName;
end;

Procedure TSirSvod.AddToFile(Res:ResT);
Var f:TextFile;
    i,j,tabcount:integer;
    dat1:array[1..100] of string;
    sos1:array[1..100,1..31] of double;
Begin
If not(FileExists(PathU+'\Issl\SvodSir.dt')) then Begin
   AssignFile(f,PathU+'\Issl\SvodSir.dt');
   Rewrite(f);
   Writeln(f,Res.DataS);
   For j:=1 to 31 do Write(f,Res.Sost[1,j]:4:2,' ');
   Writeln(f);
   CloseFile(f);
                                                  End;
AssignFile(f,PathU+'\Issl\SvodSir.dt');
Reset(f);
tabcount:=0;
While not SeekEOF(f) do Begin
      Inc(tabcount);
      Readln(f,Dat1[tabcount]);
      For j:=1 to 31 do read(f,sos1[tabcount,j]);
      Readln(f);
                        End;
CloseFile(f);
For i:=1 to tabcount do
    If Res.DataS=dat1[i] then Dat1[i]:='';


       For j:=1 to 31 do sos1[tabcount+1,j]:=Res.Sost[1,j];
       Dat1[tabcount+1]:=Res.DataS;

AssignFile(f,PathU+'\Issl\SvodSir.dt');
Rewrite(f);
For i:=1 to tabcount+1 do
If Dat1[i]<>'' then Begin
Writeln(f,Dat1[i]);
For j:=1 to 31 do Write(f,Sos1[i,j]:4:2,' ');
Writeln(f);
                    End;
CloseFile(f);
End;

procedure TSirSvod.BitBtn2Click(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TSirSvod.N1Click(Sender: TObject);
begin
BitBtn1Click(Sender);
end;

procedure TSirSvod.BitBtn1Click(Sender: TObject);
Var i,j:integer;
s:string;
begin
s:='';
For i:=0 to StringGrid1.RowCount do Begin
    For j:=0 to pred(StringGrid1.ColCount) do
        s:=s+StringGrid1.Cells[j,i]+#9;
    s:=s+#13;
                                    End;
ClipBoard.AsText:=s;
end;

procedure TSirSvod.FormShow(Sender: TObject);
Type TSirMas = array[1..100,1..31] of Double;
Var SirMas:TSirMas;
    DateMas:array[1..100] of String;
    i,j,k:integer;
    f:TextFile;

procedure SortTable;
Var i,j,k:integer;
    SSMas:array[0..31] of String;
begin
For i:=1 to pred(StringGrid1.ColCount) do
    For j:=1 to pred(StringGrid1.ColCount) do
      If (StringGrid1.Cells[j,0]<>'Нет даты') and (StringGrid1.Cells[i,0]<>'Нет даты') then
        If StrToDate(StringGrid1.Cells[j,0])>StrToDate(StringGrid1.Cells[i,0]) then
           For k:=0 to 31 do Begin
               SSMas[k]:=StringGrid1.Cells[j,k];
               StringGrid1.Cells[j,k]:=StringGrid1.Cells[i,k];
               StringGrid1.Cells[i,k]:=SSMas[k];
                             end;
end;

begin
AssignFile(f,PathU+'\Issl\SvodSir.dt');
Reset(f);
For i:=1 to 31 do
    For j:=1 to 100 do
        SirMas[j,i]:=0;
i:=0;
While not SeekEOF(f) do Begin
      Inc(i);
      Readln(f,DateMas[i]);
      For j:=1 to 31 do
          Read(f,SirMas[i,j]);
      Readln(f);
                        End;
CloseFile(f);
StringGrid1.ColCount:=i+1;
For i:=1 to 31 do
    For j:=1 to StringGrid1.ColCount do
        StringGrid1.Cells[j,i]:=FloatToStrF(SirMas[j,i],ffFixed,4,2);
For i:=1 to StringGrid1.ColCount do
    StringGrid1.Cells[i,0]:=DateMas[i];
For i:=1 to 31 do
    StringGrid1.Cells[0,i]:=SirName[i];
SortTable;
end;

procedure TSirSvod.BitBtn3Click(Sender: TObject);
Var i: integer;
begin
DeleteFile(PathU+'/Issl/SvodSir.dt');
StringGrid1.ColCount:=2;
For i:=0 to 31 do StringGrid1.Cells[1,i]:='';
end;

procedure TSirSvod.Button1Click(Sender: TObject);
Var i,j,k:integer;
    fds:array[0..50,0..31] of String;
begin
If StringGrid1.Col<>0 then Begin
For i:=0 to StringGrid1.ColCount do
    For j:=0 to StringGrid1.RowCount do
        fds[i,j]:=StringGrid1.Cells[i,j];
StringGrid1.Cols[StringGrid1.Col].Clear;
k:=0;
StringGrid1.ColCount:=StringGrid1.ColCount-1;
For i:=0 to StringGrid1.ColCount do
  If i<>StringGrid1.Col then Begin
    For j:=0 to StringGrid1.RowCount do Begin
        StringGrid1.Cells[k,j]:=fds[i,j];
                                        end;
        Inc(k);
                             End;
              End;
end;

end.
