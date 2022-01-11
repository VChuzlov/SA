unit Unit30;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm30 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    OpenSk: TOpenDialog;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    F1: TLabel;
    F2: TLabel;
    F3: TLabel;
    F4: TLabel;
    F5: TLabel;
    F6: TLabel;
    Ff1: TLabel;
    Ff2: TLabel;
    Ff3: TLabel;
    Ff4: TLabel;
    Ff5: TLabel;
    Ff6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure research(ResF:string);
  end;

var
  Form30: TForm30;

implementation

Uses Unit5;
{$R *.DFM}

procedure TForm30.Button1Click(Sender: TObject);
begin
          ModalResult:=mrOK;
end;

procedure TForm30.research;
Var F:TextFile;
   i:word;
   frs:string[16];
   FrPar:array[1..12] of string;
   DatO:string [8];
begin
        AssignFile(f,ResF);
        Reset(f);
Label9.Caption:='Исследование';
for i:=1 to 138 do Readln(f);
i:=0;
While not eof(f) do
begin
inc(i);
readln(f,frs,FrPar[i]);
if FrPar[i]='' then dec(i);
end;
If I>=6 Then
 begin
 F1.Caption:=Frpar[i-5];
 F2.Caption:=Frpar[i-4];
 F3.Caption:=Frpar[i-3];
 F4.Caption:=Frpar[i-2];
 F5.Caption:=Frpar[i-1];
 F6.Caption:=Frpar[i];
end
else
 begin
 F1.Caption:='0';
 F2.Caption:='0';
 F3.Caption:='0';
 F4.Caption:='0';
 F5.Caption:='0';
 F6.Caption:='0';
 end;
closefile(f);
ShowModal;
end;

procedure TForm30.Button2Click(Sender: TObject);
Var F:TextFile;
   i:word;
   frs:string[16];
   FrPar:array[1..12] of string;
   DatO:string [8];
begin

OpenSk.InitialDir:=PathU;


If OpenSk.Execute then
 begin
        DatO:=ExtractFileName(OpenSk.FileName);
        Label10.Caption:=DatO;

        AssignFile(f,OpenSk.FileName);
        Reset(f);

for i:=1 to 138 do Readln(f);
i:=0;
While not eof(f) do
begin
inc(i);
readln(f,frs,FrPar[i]);
if FrPar[i]='' then dec(i);
end;
If I>=6 Then
 begin
 Ff1.Caption:=Frpar[i-5];
 Ff2.Caption:=Frpar[i-4];
 Ff3.Caption:=Frpar[i-3];
 Ff4.Caption:=Frpar[i-2];
 Ff5.Caption:=Frpar[i-1];
 Ff6.Caption:=Frpar[i];
end
else
 begin
 Ff1.Caption:='';
 Ff2.Caption:='';
 Ff3.Caption:='';
 Ff4.Caption:='';
 Ff5.Caption:='';
 Ff6.Caption:='';
 end;
closefile(f);
  end;

end;

end.
