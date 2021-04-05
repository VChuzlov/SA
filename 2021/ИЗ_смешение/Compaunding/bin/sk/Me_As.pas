unit Me_As;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
    Dan=record
    dT,CH:double;
        end;
    Rez=record
    Deg,NumK,StIz,vh2:double;
       end;
  TM_A = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Mb1: TLabel;
    Mb2: TLabel;
    Mb3: TLabel;
    M1: TLabel;
    M2: TLabel;
    M3: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Kb1: TLabel;
    Kb2: TLabel;
    K1: TLabel;
    K2: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Button1: TButton;
    Button2: TButton;
    Ops: TOpenDialog;
    Comper: TLabel;
    Label4: TLabel;
    Mb4: TLabel;
    M4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function GetDan(DanF:string):Dan;
    function GetRez(RezF:string):Rez;
  public
    { Public declarations }
    procedure ShowMe(DanF,RezF:string;tip:word);
  end;

var
  M_A: TM_A;

implementation

uses Unit5;

{$R *.DFM}

function TM_A.GetDan;
var F:textFile;
    i:word;
    buf:double;
begin
AssignFile(F,DanF);
Reset(F);
For i:=1 to 5 do Readln(F);
Readln(F,buf);
Result.dT:=Buf;
Readln(F,buf);
Result.CH:=Buf;
CloseFile(F);
end;

function TM_A.GetRez;
var F:textFile;
    i:word;
    buf:double;
    s1:string[59];
    s2:string[45];
    S:string;
begin
AssignFile(F,RezF);
Reset(F);
For i:=1 to 8 do Readln(F);
Readln(F,s1,buf);
Result.NumK:=Buf;
For i:=1 to 22 do Readln(F);
Readln(F,s2,buf);
Result.vh2:=buf;
For i:=1 to 36 do Readln(F,S);
ReadLn(F,S);
Result.StIz:=Abs(StrToFl(copy(S,28,4))-StrToFl(copy(S,34,4)))*100;
Result.Deg:=StrToFl(Copy(s,58,5));
CloseFile(F);
end;

procedure TM_A.ShowMe;
var BD:Dan;
    BR:Rez;
begin
Case Tip of
0: begin Label10.Caption:='Расчет'; Label18.Caption:='Расчет' end;
1: begin Label10.Caption:='Исследование'; Label18.Caption:='Исследование' end;
   end;
BD:=GetDan(DanF);
BR:=GetRez(RezF);
Mb1.Caption:=FloatToStrF(Bd.dT,fffixed,3,1);
Mb2.Caption:=FloatToStrF(Bd.CH,fffixed,4,2);
Mb3.Caption:=FloatToStrF(Br.Deg,fffixed,4,2);
Mb4.Caption:=FloatToStrF(Br.vh2,fffixed,4,2);
Kb1.Caption:=FloatToStrF(Br.NumK,fffixed,3,1);
Kb2.Caption:=FloatToStrF(Br.StIz,fffixed,4,2);
M1.Caption:='';
M2.Caption:='';
M3.Caption:='';
M4.Caption:='';
K1.Caption:='';
K2.Caption:='';
Comper.Caption:='';
ShowModal;
end;

procedure TM_A.Button1Click(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TM_A.Button2Click(Sender: TObject);
var Pathf,Nf:string;
    BD:Dan;
    BR:Rez;
begin
Ops.InitialDir:=PathU;
If (Ops.Execute) then
 begin
 BD:=GetDan(Ops.FileName);
 M1.Caption:=FloatToStrF(Bd.dT,fffixed,3,1);
 M2.Caption:=FloatToStrF(Bd.CH,fffixed,4,2);
 Pathf:=ExtractFileDir(Ops.FileName);
 Nf:=ExtractFileName(Ops.FileName);
 delete(nf,pos('.',nf),4);
 Comper.Caption:='с '+nf;
 nf:='\'+nf+'.rez';
 if FileExists(Pathf+nf) then
  begin
  BR:=GetRez(Pathf+nf);
  M3.Caption:=FloatToStrF(Br.Deg,fffixed,4,2);
  M4.Caption:=FloatToStrF(Br.vh2,fffixed,4,2);
  K1.Caption:=FloatToStrF(Br.NumK,fffixed,3,1);
  K2.Caption:=FloatToStrF(Br.StIz,fffixed,4,2);
  end;
 end;
end;

procedure TM_A.FormShow(Sender: TObject);
begin
Ops.FileName:='';

end;

end.
