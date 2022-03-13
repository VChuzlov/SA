unit frak;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  Tfrak1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit6: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Label2: TLabel;
    Edit12: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    b1: TLabel;
    b2: TLabel;
    b3: TLabel;
    b4: TLabel;
    b5: TLabel;
    b6: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    SaveDfr: TSaveDialog;
    DateFr: TEdit;


    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frak1: Tfrak1;    code:integer;
     fr1:array [1..11] of real;
     pl1:real;
     frn:string;
implementation

uses Unit5, FmxUtils, Unit8, Unit9;

{$R *.DFM}
procedure Tfrak1.Button1Click(Sender: TObject);
var dfr,f:TextFile;
    DfrName,LastData,LastPuti,Par:String;
    ComL,DirL:array[0..79] of Char;
    J:word;
    Sd:array[1..144] of string;
    si : Tstartupinfo;
    p  : Tprocessinformation;
    SDl:Char;
begin
DfrName:=DateFr.Text;
LastData:=DataOtbora;
LastPuti:=Puti;
While Pos('.',DfrName)>0 do DfrName[Pos('.',DfrName)]:='-';
DataOtbora:=DfrName;
Form5.Caption:=' Установка: '+Ustanovka+'                            Дата отбора: '+DataOtbora;
DfrName:=DfrName+'.sk';
Puti:=FrPath;
If  (StrToFl(Unit9.Form9.Edit139.Text)=StrToFl(edit1.text))and(StrToFl(Unit9.Form9.Edit140.Text)=StrToFl(edit2.text))
    and(StrToFl(Unit9.Form9.Edit142.Text)=StrToFl(edit6.text))and(StrToFl(Unit9.Form9.Edit143.Text)=StrToFl(edit10.text))
    and(StrToFl(Unit9.Form9.Edit144.Text)=StrToFl(edit11.text))and(StrToFl(Unit9.Form9.Edit145.Text)=StrToFl(edit12.text)) then
  begin
  assignfile(dfr,PathS+'\sk');
  Reset(dfr);
  AssignFile(f,FrPath+'\'+Dfrname);
  Rewrite(f);
  For J:=1 To 138 do
   begin
   Readln(dfr,Par);
   WriteLn(f,Par);
  end;
  WriteLn(f,'                   '+edit1.text);
  WriteLn(f,'                   '+edit2.text);
  WriteLn(f,'                   '+edit6.text);
  WriteLn(f,'                   '+edit10.text);
  WriteLn(f,'                   '+edit11.text);
  WriteLn(f,'                   '+edit12.text);
  closefile(dfr);
  closeFile(f);
  end
  else
  begin
assignfile(dfr,PathS+'\sk');
reset(dfr);
For J:=1 To 138 Do ReadLn(dfr,sd[j]);
CloseFile(dfr);
assignfile(dfr,PathS+'\sk');
Rewrite(dfr);
For J:=1 To 138 Do WriteLn(dfr,sd[j]);
WriteLn(dfr,'                 '+Unit9.Form9.Edit139.Text);
WriteLn(dfr,'                 '+Unit9.Form9.Edit140.Text);
WriteLn(dfr,'                 '+Unit9.Form9.Edit142.Text);
WriteLn(dfr,'                 '+Unit9.Form9.Edit143.Text);
WriteLn(dfr,'                 '+Unit9.Form9.Edit144.Text);
WriteLn(dfr,'                 '+Unit9.Form9.Edit145.Text);
WriteLn(dfr,'                 '+edit1.text);
WriteLn(dfr,'                 '+edit2.text);
WriteLn(dfr,'                 '+edit6.text);
WriteLn(dfr,'                 '+edit10.text);
WriteLn(dfr,'                 '+edit11.text);
WriteLn(dfr,'                 '+edit12.text);
closefile(dfr);
FillChar( Si, SizeOf( Si ) , 0 );
with Si do begin
 cb := SizeOf( Si);
 dwFlags := startf_UseShowWindow;
 wShowWindow := SW_HIDE	;
end;
Createprocess(nil,StrPCopy(ComL,frn),nil,nil,false,Create_default_error_mode,nil,StrPCopy(DirL,PathS),si,p);
Waitforsingleobject(p.hProcess,infinite);
frak1.close;
If Fileexists(FrPath+'\'+DfrName) Then begin
AssignFile(dfr,FrPath+'\'+DfrName);
erase(dfr)
                                         end;
assignfile(dfr,PathS+'\sum-fr');
Reset(dfr);
AssignFile(f,FrPath+'\'+Dfrname);
Rewrite(f);
For J:=1 To 138 do
 begin
 Readln(dfr,Par);
 WriteLn(f,Par);
 end;
WriteLn(f,'                   '+edit1.text);
WriteLn(f,'                   '+edit2.text);
WriteLn(f,'                   '+edit6.text);
WriteLn(f,'                   '+edit10.text);
WriteLn(f,'                   '+edit11.text);
WriteLn(f,'                   '+edit12.text);
closefile(dfr);
closeFile(f);
 end;
If not fileexists(Puti+'\'+DataOtbora+'.dan') then begin
showMessage('Для расчета необходимо задать технологические условия'+#13+
            'за текущую дату:'+DataOtbora);
frak1.Hide;
Sdl:=DateSeparator;
DateSeparator:='-';
Form8.SaveDialog1.InitialDir:=Puti;
Form8.SaveDialog1.FileName:=DataOtbora+'.dan';
Form8.DateTimePicker1.Date:=StrToDate(DataOtbora);
DateSeparator:=Sdl;
Form8.Button3.Hide;
Form8.Button1.Show;
Form8.Button2.Show;
     AssignFile(f,LastPuti+'\'+LastData+'.dan');
     Reset(f);
     Readln(f,DiClor1,DiClor2,DiClor3);
     Readln(f,Akt);
     Readln(f,P2,P3,P4,P5);
     Readln(f,Vl);
     Readln(f,T2,T3,T4,T5);
     Readln(f,dT2,dT3,dT4,dT5);
     Readln(f,C1,C2,C3,C4,C5,C6,C7,C8,C9);
     Readln(f,Rg);
     Readln(f,Vsir);
     Readln(f,Sera);
     Readln(f,Rs);
     Readln(f,DaOt);
     Readln(f,DaRe);
     CloseFile(f);

     Str(Vsir:6:2,Par);
     Unit8.Form8.Edit26.Text:=Par;
     Str(Rs:4:1,Par);
     Unit8.Form8.Edit1.Text:=Par;
     Str(Rg:6:2,Par);
     Unit8.Form8.Edit2.Text:=Par;
     Str(P2:6:2,Par);
     Unit8.Form8.Edit3.Text:=Par;
     Str(P3:6:2,Par);
     Unit8.Form8.Edit4.Text:=Par;
     Str(P4:6:2,Par);
     Unit8.Form8.Edit5.Text:=Par;
     Str(P5:6:2,Par);
     Unit8.Form8.Edit6.Text:=Par;
     Str(T2:6:2,Par);
     Unit8.Form8.Edit7.Text:=Par;
     Str(T3:6:2,Par);
     Unit8.Form8.Edit8.Text:=Par;
     Str(T4:6:2,Par);
     Unit8.Form8.Edit9.Text:=Par;
     Str(T5:6:2,Par);
     Unit8.Form8.Edit10.Text:=Par;
     Str(dT2:6:2,Par);
     Unit8.Form8.Edit11.Text:=Par;
     Str(dT3:6:2,Par);
     Unit8.Form8.Edit12.Text:=Par;
     Str(dT4:6:2,Par);
     Unit8.Form8.Edit13.Text:=Par;
     Str(dT5:6:2,Par);
     Unit8.Form8.Edit14.Text:=Par;
     Str(C1:6:2,Par);
     Unit8.Form8.Edit15.Text:=Par;
     Str(C2:6:2,Par);
     Unit8.Form8.Edit16.Text:=Par;
     Str(C3:6:2,Par);
     Unit8.Form8.Edit17.Text:=Par;
     Str(C4:6:2,Par);
     Unit8.Form8.Edit18.Text:=Par;
     Str(C5:6:2,Par);
     Unit8.Form8.Edit19.Text:=Par;
     Str(C6:6:2,Par);
     Unit8.Form8.Edit20.Text:=Par;
     Str(C7:6:2,Par);
     Unit8.Form8.Edit21.Text:=Par;
     Str(C8:6:2,Par);
     Unit8.Form8.Edit22.Text:=Par;
     Str(C9:6:2,Par);
     Unit8.Form8.Edit23.Text:=Par;
     Str(Vl:6:2,Par);
     Unit8.Form8.Edit24.Text:=Par;
     Str(Sera:6:2,Par);
     Unit8.Form8.Edit25.Text:=Par;

Form8.ShowModal;
Form8.Enabled:=True;
If (Form8.ModalResult=mrOK)and Start then begin
 Form5.N8.Click; Start:=False;  end;
                                               end
else begin ShowMessage('Файл с технологическими условиями уже существует.'+#13+
                 'Можно проводить расчет.');
      If Start then begin
      Form5.N8.Click; Start:=False;  end;
     end;

end;
procedure Tfrak1.Button2Click(Sender: TObject);
begin
frak1.Close;
end;



end.
