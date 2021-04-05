unit res;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TResF = class(TForm)
    GroupBox1: TGroupBox;
    DanF: TEdit;
    Button1: TButton;
    GroupBox2: TGroupBox;
    SkF: TEdit;
    Button2: TButton;
    GroupBox3: TGroupBox;
    RezF: TEdit;
    Button3: TButton;
    OpenD: TOpenDialog;
    SaveR: TSaveDialog;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DanFExit(Sender: TObject);
    procedure SkFExit(Sender: TObject);
    procedure RezFExit(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DanFile: string;
    SkFile: string;
    RezFile: string;
  end;

var
  ResF: TResF;
  Dan,Sk,Rz:boolean;

implementation

uses Unit5, Sdel, Unit4;

{$R *.DFM}

procedure TResF.Button5Click(Sender: TObject);
begin
ModalResult:=mrCancel
end;

procedure TResF.Button4Click(Sender: TObject);
begin
If not Dan then
 begin
 ShowMessage('Неверно указан файл с технологическими данными.'+#13+' Проверте правильность имени файла');
 Exit
 end;
If not Sk then
 begin
 ShowMessage('Неверно указан файл с составом сырья и катализата.'+#13+' Проверте правильность имени файла');
 Exit
 end;
If not Rz then
 begin
 ShowMessage('Невозможно создать файл с результатами.'+#13+' Проверте правильность имени файла');
 Exit
 end;
DanFile:=DanF.Text;
SkFile:=SkF.Text;
RezFile:=RezF.Text;
ModalResult:=mrOk;
end;

procedure TResF.Button1Click(Sender: TObject);
begin
OpenD.Filter:='Файл с технологическими данными|*.dan';
OpenD.InitialDir:=PathU;
If OpenD.Execute then
 begin
 DanF.Text:=OpenD.FileName;
 DanF.OnExit(Sender);
 end;
end;

procedure TResF.Button2Click(Sender: TObject);
begin
OpenD.Filter:='Файл с составом сырья и катализата|*.sk';
OpenD.InitialDir:=PathU;
If OpenD.Execute then
 begin
 SkF.Text:=OpenD.FileName;
 SkF.OnExit(Sender);
 end;
end;



procedure TResF.Button3Click(Sender: TObject);
var s:string;
begin
SaveR.InitialDir:=PathIsl;
If SaveR.Execute then
 begin
 S:=SaveR.FileName;
 If pos('.',S)=0 then S:=S+'.rez';
 RezF.Text:=S;
 RezF.OnExit(Sender);
 end;
end;

procedure TResF.DanFExit(Sender: TObject);
begin
Dan:=FileExists(DanF.Text);
end;

procedure TResF.SkFExit(Sender: TObject);
begin
Sk:=FileExists(SkF.Text);
end;

procedure TResF.RezFExit(Sender: TObject);
var F:file;
    namef:string;
begin
nameF:=RezF.Text;
If pos('.rez',nameF)=0 then nameF:=namef+'.rez';
RezF.Text:=nameF;
If FileExists(nameF) then Rz:=true
 else
 begin
 try
 AssignFile(F,nameF);
 Rewrite(F);
 CloseFile(F);
 Erase(F);
 Rz:=true;
 except Rz:=false;
 end;
 end;
end;

procedure TResF.Button6Click(Sender: TObject);
begin
If MessageDlg('Вы уверены, что хотите очистить директорию?',mtWarning,[mbYes,mbNo],0)=mrYes then
begin
If ClearDirectory(PathIsl) then CreateDir(PathIsl);
end;
end;

end.
