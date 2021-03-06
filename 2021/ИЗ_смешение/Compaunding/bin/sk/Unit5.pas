unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ComCtrls, ExtCtrls, makeres, URasDisAkt, FileCtrl, ActObj,
  jpeg, OleServer, WordXP, ExcelXP;

function StrToFl(num:string):Extended;
type
  TForm5 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N11: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N6: TMenuItem;
    N12: TMenuItem;
    OpenDialog1: TOpenDialog;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    N16: TMenuItem;
    Gr: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N20: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N21: TMenuItem;
    Bdan: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N19: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    About1: TMenuItem;
    About2: TMenuItem;
    procedure N6Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure FrClick(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure BdanClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure CrazyProcedure;
    procedure FormCreate(Sender: TObject);
    procedure About2Click(Sender: TObject);

  private
    { Private declarations }
    procedure RasIssl(way:word);
  public

    { Public declarations }
  end;
var
 Sav:String;
      Start:Boolean;
Const      LongDat='dd.mm.yyyy';
      ShortDat='dd.mm.yy';
Type
HexMas = array[1..6] of double;
TDanFile = record
     DiClor:HexMas;
     Akt:double;
     Pressure:HexMas;
     Vl:double;
     Temperature:HexMas;
     DifTemp:HexMas;
     C:array[1..9] of double;
     Rg:double;
     Vsir:double;
     Sera:double;
     Rs:double;
     DaOt:TDate;
     DaRe:TDate;
           end;
var
  Form5: TForm5;
  pp1,pp2:char;
  CoolActiv: TActivObj;
  Dan:TDanFile;
  Rst:ResT;
  Ustanovka:string;      {�������� ���������}
  PolnoeIma:string;  {������ ��� ���������� ����� � �������}
  Puti:string;       {����}
  PathS:string;      {��������� ����������}
  FrPath:string;
  PathU,PathIsl: string;
  DataOtbora,LastData:string; {���� ������}
  Process:string;    {��������� ������ ��������}
  N_Process:integer; {����� ���������� ��������}

  DaOt:string[10];   {���� ������}
  DaRe:string[10];   {���� ����������� ������������}
  DiClor1, DiClor2, DiClor3:real;  {������ ������������}
  Akt:real;         {���������� �����������}
  P2, P3, P4, P5:real;          {�������� � �-2, P-3, P-4, P-5}
  T2, T3, T4, T5:real;          {����������� � �-2, P-3, P-4, P-5}
  dT2, dT3, dT4, dT5:real;      {������� ����������� � �-2, P-3, P-4, P-5}
  Vl:real;  {��������� ���}
  Rs:real;  {������ �����}
  Rg:real;  {������ ���}
  Sera:real;        {���������� ����}
  Vsir:real;        {����� ��������������� �����, �}

  C1, C2, C3, C4, C5, C6, C7, C8, C9:real;      {�������� ������� ���}
  fr1:array [1..11] of real; {�������� ������������ �������}
  pl1:real; {��������� �����}
  Ce, Cr:real;    {������������ ���������
                  �����������������
                  ���������}

  CeStr, CrStr:string [8];    {������������ ���������
                              �����������������
                              ���������
                              ���������}

  CL1,CL2,CL3:real;           {������ ������������
                              �� ��������� �-202� �-203� �-204}

  CL1Str,CL2Str,CL3Str:string [8]; {������ ������������
                                   �� ��������� �-202� �-203� �-204
                                   ���������}

  Ak:real;                         {������� ����������
                                   ������������ �� "REZ"}

  AkStr:string [8];                {������� ����������
                                   ������������ �� "REZ"
                                   ���������}

  CLKat1,CLKat2,CLKat3:string[5];       {����� �� ������������
                                   � �-202. 203 ,204}

  CLKat1Str,CLKat2Str,CLKat3Str:string [8];   {����� �� ������������
                                              � �-202. 203 ,204
                                              ���������}
  ComL,DirL:array[0..79] of Char;
  w:double;
  procedure gopa(PolnoeIma:string;var Put,Gopen:string);
           {��������� ���������� �� ������� �����
             ���������� ����� ���� � ����}
 procedure WriteDan(Dan:TDanFile;file2:String);
 procedure ReadDan(var Dan:TDanFile;file1:String);
function DelS(s: string): string;

           {��������� ������� ����������}

implementation

Uses Unit3, Unit4, Unit6, Unit7, Unit8, Unit9, Unit10,
     Unit11, Unit12,
     Unit13, Unit15, frak, test, adv, Unit1, SvodTab, Unit16,
  Unit17, {Unit20,} basa, Unit30, Treefind, res, Me_As, reportform, NewReport,
  Unit2Ab;
{$R *.DFM}

Function StrToFl(num:string):Extended;
begin
If DecimalSeparator=',' then pp2:='.'
 else pp2:=',';
While pos(' ',num)>0 do delete(num,pos(' ',num),1);
While pos(pp2,num)>0 do num[pos(pp2,num)]:=DecimalSeparator;
Result:=StrToFloat(num);
end;

procedure ReadDan(var Dan:TDanFile;file1:String);
Var
DaOtb,DaReg:string[10];
f:TextFile;
i:integer;
s:string;
procedure getarr(s:string; var Arr:HexMas);
var i:integer;
    s1:string;
begin
     while pos('  ',s)>0 do delete(s,pos('  ',s),1);
     if s[1]=' ' then delete(s,1,1);
     try
     For i:=1 to ColReakt do
      begin
      s1:=copy(s,1,pos(' ',s));
      delete(s,1,pos(' ',s));
      Arr[i]:=strtofl(s1);
      end;
     except
     end;

end;

Begin
     AssignFile(f,File1);
     Reset(f);
     try
     Readln(f,s);
     getarr(s,Dan.DiClor);
     Readln(f,Dan.Akt);
     Readln(f,s);
     getarr(s,Dan.Pressure);
     Readln(f,Dan.Vl);
     Readln(f,s);
     getarr(s,Dan.Temperature);
     Readln(f,s);
     getarr(s,Dan.DifTemp);
     For i:=1 to 9 do Read(f,Dan.C[i]);
     Readln(f);
     Readln(f,Dan.Rg);
     Readln(f,Dan.Vsir);
     Readln(f,Dan.Sera);
     Readln(f,Dan.Rs);
     Readln(f,DaOtb);
     While Pos('-',DaOtb)>0 do DaOtb[Pos('-',DaOtb)]:=DateSeparator;
     Readln(f,DaReg);
     While Pos('-',DaReg)>0 do DaReg[Pos('-',DaReg)]:=DateSeparator;
     Dan.DaOt:=StrToDate(DaOtb);
     Dan.DaRe:=StrToDate(DaReg);
     except
     end;
     CloseFile(f);
End;

procedure WriteDan(Dan:TDanFile;File2:String);
Var
DaOtb,DaReg:string[10];
f:TextFile;          // PutiProgram+'\'+DataOtbora+'.bak'
i:integer;
Begin
             AssignFile(f,File2);
             ReWrite(f);
             DaOtb:=DateToStr(Dan.DaOt);
             DaReg:=DateToStr(Dan.DaRe);
             For i:=1 to ColReakt do
                 Write(f,Dan.DiClor[i]:6:2);
             If ColReakt=3 then Write(f,1);    
             Writeln(f,'       ����� ��嫮��⠭� �� ॠ��ࠬ (�-202, �-203, �-204), ��.');
             WriteLn(f,Dan.Akt:6:2, '      ��⨢����� ��⠫����� (�᫮���� ������)');
               For i:=1 to ColReakt do
                 Write(f,Dan.Pressure[i]:6:2,' ');
               If ColReakt=3 then Write(f,10);
             Writeln(f,'      �������� �� ॠ��ࠬ (�-202, �-203, �-204, �-205), ��.');
             Writeln(f,Dan.Vl:6:2,'      ��������� ���, %');
               For i:=1 to Colreakt do
                 Write(f,Dan.Temperature[i]:6:2,' ');
               If ColReakt=3 then Write(f,400);
             Writeln(f,'      ��������� �室��� �� ॠ��ࠬ (�-202, �-203, �-204, �-205), �ࠤ. �');
             For i:=1 to Colreakt do
                 Write(f,Dan.DifTemp[i]:6:2,' ');
               If ColReakt=3 then Write(f,10);  
             Writeln(f,'      ��९��� ⥬������ �� ॠ��ࠬ (�-202, �-203, �-204, �-205), �ࠤ. �');
             For i:=1 to 9 do
                 Write(f,Dan.C[i]:6:5,' ');
             Writeln(f,'         ���⠢ ��� (H2, C1, C2, C3, n-C4, i-C4, n-C5, i-C5, C6), %');
             Writeln(f,Dan.Rg:6:2,'      ���室 ���, �3/��');
             Writeln(f,Dan.Vsir:6:2,'      ���� ��᫥ ॣ����樨');
             Writeln(f,Dan.Sera:6:2,'      ��� � ���ண������');
             Writeln(f,Dan.Rs:6:2,'      ���室 �����, �3/��');
             Writeln(f,FormatDateTime('dd.mm.yy',Dan.DaOt),'             ��� �⡮�');
             Writeln(f,FormatDateTime('dd.mm.yy',Dan.DaRe),'               ��� ॣ����樨 ��⠫�����');
             CloseFile(f);

End;

procedure TForm5.N10Click(Sender: TObject);
begin
OpenDialog1.FileName:='';
     Unit4.Form4.Button1.Hide;
     Unit4.Form4.Button3.Hide;
     Unit4.Form4.Button2.Enabled:=False;
     Unit4.Form4.RadioGroup1.ItemIndex:=-1;
     Unit5.Form5.Enabled:=False;
     Unit4.Form4.Show;

end;

procedure TForm5.N6Click(Sender: TObject);
begin
     //Unit3.Form3.Show;
  unit1.Form1.Close;
  unit5.Form5.Close;

end;

procedure gopa(PolnoeIma:string;var Put,Gopen:string);
       var
         i:integer;
  begin
       i:=Length(PolnoeIma);
       repeat
            i:=i-1;
       until PolnoeIma[i]='\';
       Put:=copy(polnoeima,1,i-1);
       Gopen:=Copy(polnoeima,i+1,13);
       i:=pos('.',Gopen);
       if i<>0 then Gopen:=Copy(Gopen,1,i-1);
  end;

procedure TForm5.N12Click(Sender: TObject);
Var Basa:TextFile;
   Par:string;              {��� �������� STR}
   FrPar:array[1..12] of string;
   ParS1:string[39];
   ParS2:string[60];
   ParS3:string[39];
   ParS4:string[59];
   ParS5:string[26];

   ParS6:string[11];
   ParS7:string[6];
   ParS8:string[9];
   ParS9:string[6];
   ParS10:string[6];
   ParS11:string[19];
   ParS12:string[6];
   Skr:string[17];
   frs:string[16];
   Par1,Par2,Par3,Par4,Par5,Par6,Par7,Par8,Par9,Par10,Par11,Par12:real;

   ParP1,ParP2,ParP3,ParP4,ParP5,ParP6,ParP7,ParP8,ParP9:string;
   I:Word;
   newP4,newT4,newdT4:real;
begin
     OpenDialog1.Filter:='��������������� ������� (*.dan)|*.dan';
     OpenDialog1.Title:='�������� ����� � �������';
     OpenDialog1.InitialDir:=PathU;
     OpenDialog1.FileName:='';
     OpenDialog1.FileName:=PathS+'\Komsomol\01-09-09\01-09-09.dan';
     //if OpenDialog1.Execute  then
       begin
            PolnoeIma:=OpenDialog1.FileName;
            Puti:=ExtractFilePath(PolnoeIma);
            DataOtbora:=ChangeFileExt(ExtractFileName(PolnoeIma),'');
//            gopa(PolnoeIma,Puti,DataOtbora);
     {��������� ��������������� �������}

     AssignFile(f,Puti+DataOtbora+'.dan');
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
     While Pos('-',DaOt)>0 do DaOt[Pos('-',DaOt)]:='.';
     Readln(f,DaRe);
     if DaRe='' then DaRe:=DaOt;
     While Pos('-',DaRe)>0 do DaRe[Pos('-',DaRe)]:='.';
     If UstNum=11 then
     Readln(f,newP4,newT4,newdT4);     // ���������� ������ ��� 4 ��������


     CloseFile(f);
     Unit8.Form8.DateTimePicker1.Date:=StrToDate(DaOt);
     Unit8.Form8.DateTimePicker2.Date:=StrToDate(DaRe);
     {��� 4 ��������}
     If UstNum=11 then
      begin
       Str(newP4:6:2,Par);
       Unit8.Form8.Edit27.Text:=Par;
       Str(newT4:6:2,Par);
       Unit8.Form8.Edit28.Text:=Par;
       Str(newdT4:6:2,Par);
       Unit8.Form8.Edit29.Text:=Par;
      end;
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
            if FileExists(Puti+DataOtbora+'.sk') then
               begin
                    Unit5.Form5.Caption:=' ���������: '+Ustanovka+'                            ���� ������: '+DataOtbora;
                    Unit5.Form5.N8.Enabled:=True;
Assignfile(f,Puti+DataOtbora+'.sk');
reset(f);
readln(f,skr,par);
Unit9.Form9.Edit1.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit2.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit3.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit4.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit5.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit6.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit7.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit8.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit9.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit10.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit11.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit12.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit13.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit14.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit15.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit16.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit17.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit18.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit19.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit20.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit21.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit22.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit23.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit24.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit25.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit26.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit27.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit28.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit29.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit30.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit31.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit32.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit33.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit34.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit35.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit36.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit37.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit38.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit39.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit40.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit41.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit42.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit43.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit44.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit45.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit46.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit47.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit48.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit49.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit50.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit51.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit52.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit53.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit54.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit55.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit56.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit57.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit58.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit59.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit60.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit61.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit62.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit63.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit64.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit65.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit66.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit67.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit68.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit69.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit70.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit71.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit72.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit73.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit74.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit75.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit76.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit77.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit78.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit79.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit80.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit81.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit82.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit83.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit84.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit85.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit86.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit87.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit88.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit89.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit90.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit91.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit92.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit93.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit94.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit95.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit96.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit97.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit98.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit99.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit100.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit101.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit102.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit103.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit104.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit105.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit106.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit107.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit108.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit109.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit110.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit111.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit112.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit113.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit114.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit115.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit116.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit117.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit118.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit119.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit120.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit121.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit122.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit123.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit124.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit125.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit126.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit127.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit128.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit129.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit130.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit131.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit132.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit133.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit134.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit135.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit136.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit137.Text:=par;
readln(f,skr,par);
Unit9.Form9.Edit138.Text:=par;

Unit30.Form30.Label9.Caption:=DataOtbora;
I:=0;
While not eof(f) do
begin
inc(i);
readln(f,frs,FrPar[i]);
if FrPar[i]='' then dec(i);
end;
If I>=6 Then
 begin
 If FileExists(PathS+'\sk')Then begin
 AssignFile(Basa,PathS+'\sk');
 erase(Basa);
 end;
 CopyFile(StrPCopy(ComL,puti+dataotbora+'.sk'),StrPCopy(DirL,PathS+'\sk'),False);
 LastData:=Dataotbora;
 N16.Enabled:=True;
 Unit30.Form30.F1.Caption:=Frpar[i-5];
 Unit30.Form30.F2.Caption:=Frpar[i-4];
 Unit30.Form30.F3.Caption:=Frpar[i-3];
 Unit30.Form30.F4.Caption:=Frpar[i-2];
 Unit30.Form30.F5.Caption:=Frpar[i-1];
 Unit30.Form30.F6.Caption:=Frpar[i];


 Unit9.Form9.Edit139.Text:=Frpar[i-5];
 Unit9.Form9.Edit140.Text:=Frpar[i-4];
 Unit9.Form9.Edit142.Text:=Frpar[i-3];
 Unit9.Form9.Edit143.Text:=Frpar[i-2];
 Unit9.Form9.Edit144.Text:=Frpar[i-1];
 Unit9.Form9.Edit145.Text:=Frpar[i];
end
else
 begin
 Unit30.Form30.F1.Caption:='0';
 Unit30.Form30.F2.Caption:='0';
 Unit30.Form30.F3.Caption:='0';
 Unit30.Form30.F4.Caption:='0';
 Unit30.Form30.F5.Caption:='0';
 Unit30.Form30.F6.Caption:='0';
 Unit9.Form9.Edit139.Text:='0';
 Unit9.Form9.Edit140.Text:='0';
 Unit9.Form9.Edit142.Text:='0';
 Unit9.Form9.Edit143.Text:='0';
 Unit9.Form9.Edit144.Text:='0';
 Unit9.Form9.Edit145.Text:='0';
 end;
closefile(f);
               end
                                                 else
               begin
                    Unit7.Form7.Label3.Caption:=DataOtbora;
                    Unit7.Form7.Label5.Caption:=DataOtbora+'.dan';
                    Unit7.Form7.Label9.Caption:=DataOtbora+'.sk';
                    Unit5.Form5.Enabled:=False;
                    Unit7.Form7.Show;
               end;
       end;
Unit5.Form5.N15.Enabled:=False;
end;



procedure TForm5.CrazyProcedure;
Var DatO:String[8];
    f:TextFile;
    i:integer;
    FrPar:array[1..12] of string;
    frs:string[16];
begin

   //�������� ����������
    Form12.Label25.Caption:=DataOtbora;
    Form12.Label15.Caption:=FloatToStrF(CoolActiv.Results.akt,fffixed,7,3);
    Form12.Label16.Caption:=FloatToStrF(CoolActiv.Results.Krek,fffixed,7,3);
    Form12.Label17.Caption:=FloatToStrF(CoolActiv.Results.H2,fffixed,7,3);
    Form12.Label18.Caption:=FloatToStrF(CoolActiv.Results.GSir,fffixed,7,3);
    Form12.Label19.Caption:=FloatToStrF((CoolActiv.Results.nP_iP[1]-CoolActiv.Results.nP_iP[2])*100,fffixed,7,3);
    Form12.Label20.Caption:=FloatToStrF(CoolActiv.Results.Degidr,fffixed,7,3);
    Form12.Label22.Caption:=FloatToStrF(CoolActiv.Results.nP_iP[1],fffixed,7,3);
    Form12.Label21.Caption:=FloatToStrF(CoolActiv.Results.nP_iP[2],fffixed,7,3);
    Form12.Label23.Caption:=FloatToStrF(CoolActiv.Results.Vyh,fffixed,7,3);
    Form12.Label12.Caption:=FloatToStrF(CoolActiv.Results.sost[5,20],fffixed,7,3);
    Form12.Label29.Caption:=FloatToStrF(CoolActiv.Results.Ochi,fffixed,7,3);
    Form12.Label27.Caption:=FloatToStrF(CoolActiv.Results.Pererab,fffixed,7,3);

    //���������� � �����
        DatO:=ExtractFileName(CoolActiv.SkFile);
        Form30.Label9.Caption:=DatO;
        AssignFile(f,CoolActiv.SkFile);
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
          Form30.F1.Caption:=Frpar[i-5];
          Form30.F2.Caption:=Frpar[i-4];
          Form30.F3.Caption:=Frpar[i-3];
          Form30.F4.Caption:=Frpar[i-2];
          Form30.F5.Caption:=Frpar[i-1];
          Form30.F6.Caption:=Frpar[i];
         end
                else
         begin
          Form30.F1.Caption:='';
          Form30.F2.Caption:='';
          Form30.F3.Caption:='';
          Form30.F4.Caption:='';
          Form30.F5.Caption:='';
          Form30.F6.Caption:='';
         end;
        closefile(f);

// ������������

end;

procedure TForm5.N8Click(Sender: TObject);
var ResForm6:integer; {��������� �������� ������ ����� 6
                      �������� ������������ ��������� ����������
                      ������ ��� ���}
    ResForm8:integer;
    Fs:File of ResT;
    CurDat:PResT;
    par: string;
    i:integer;
begin
     Process:='���������';
     N_Process:=1;
     Unit6.Form6.Label8.Caption:=Process;
     Unit6.Form6.Label5.Caption:=Ustanovka;
     Unit6.Form6.Label6.Caption:=DataOtbora;
     Unit5.Form5.Enabled:=False;

     ResForm6:=Form6.ShowModal;
     If ResForm6=mrOK then

        begin
             Unit6.Form6.Hide;
             If N_Process=1 then
               begin
{               AssignFile(Fs,PathS+'\svod.'+intToStr(Form4.RadioGroup1.ItemIndex+1));
               try
               Reset(Fs);
               new(CurDat);
               CurDat^.sv.Data:=0;
               CurDat^.sv.Koks[1]:=0;
               CurDat^.sv.Koks[2]:=0;
               CurDat^.sv.Koks[3]:=0;
               Form8.koks1.Text:='0';
               Form8.koks2.Text:='0';
               Form8.koks3.Text:='0';
               w:=0;
               while not eof(Fs) do
               begin
               Read(Fs,CurDat^.sv);
               If CurDat^.sv.Data<trunc(Form8.DateTimePicker1.Date) then
                begin
                Form8.koks1.Text:=FloatTostrF(CurDat^.sv.Koks[1],fffixed,4,2);
                Form8.koks2.Text:=FloatTostrF(CurDat^.sv.Koks[2],fffixed,4,2);
                Form8.koks3.Text:=FloatTostrF(CurDat^.sv.Koks[3],fffixed,4,2);
                w:=CurDat^.sv.Pererab;
                end;
               end;
               finally
               CloseFile(Fs);
               end;  }
        //            Raschet_Riforming;
     {��������� ��������������� �������}
     ReadDan(Dan,Puti+DataOtbora+'.dan');

     {�������� ���� � ���������������� ���������
      � ������ ����������� ���������}
     Unit6.Form6.Hide;

     Unit8.Form8.DateTimePicker1.Date:=Dan.DaOt;
     Unit8.Form8.DateTimePicker2.Date:=Dan.DaRe;
     Str(Dan.Vsir:6:2,Par);
     Unit8.Form8.Edit26.Text:=Par;
     Str(Dan.Rs:4:1,Par);
     Unit8.Form8.Edit1.Text:=Par;
     Str(Dan.Rg:6:2,Par);
     Unit8.Form8.Edit2.Text:=Par;
     Try

       Str(Dan.Pressure[1]:6:2,Par);
       Unit8.Form8.Edit3.Text:=Par;
       Str(Dan.Pressure[2]:6:2,Par);
       Unit8.Form8.Edit4.Text:=Par;
       Str(Dan.Pressure[3]:6:2,Par);
       Unit8.Form8.Edit5.Text:=Par;
       Str(Dan.Temperature[1]:6:2,Par);
       Unit8.Form8.Edit7.Text:=Par;
       Str(Dan.Temperature[2]:6:2,Par);
       Unit8.Form8.Edit8.Text:=Par;
       Str(Dan.Temperature[3]:6:2,Par);
       Unit8.Form8.Edit9.Text:=Par;
       Str(Dan.DifTemp[1]:6:2,Par);
       Unit8.Form8.Edit11.Text:=Par;
       Str(Dan.DifTemp[2]:6:2,Par);
       Unit8.Form8.Edit12.Text:=Par;
       Str(Dan.DifTemp[3]:6:2,Par);
       Unit8.Form8.Edit13.Text:=Par;

     Except
     End;  //Try
     Str(Dan.C[1]:6:2,Par);
     Unit8.Form8.Edit15.Text:=Par;
     Str(Dan.C[2]:6:2,Par);
     Unit8.Form8.Edit16.Text:=Par;
     Str(Dan.C[3]:6:2,Par);
     Unit8.Form8.Edit17.Text:=Par;
     Str(Dan.C[4]:6:2,Par);
     Unit8.Form8.Edit18.Text:=Par;
     Str(Dan.C[5]:6:2,Par);
     Unit8.Form8.Edit19.Text:=Par;
     Str(Dan.C[6]:6:2,Par);
     Unit8.Form8.Edit20.Text:=Par;
     Str(Dan.C[7]:6:2,Par);
     Unit8.Form8.Edit21.Text:=Par;
     Str(Dan.C[8]:6:2,Par);
     Unit8.Form8.Edit22.Text:=Par;
     Str(Dan.C[9]:6:2,Par);
     Unit8.Form8.Edit23.Text:=Par;
     Str(Dan.Vl:6:2,Par);
     Unit8.Form8.Edit24.Text:=Par;
     Str(Dan.Sera:6:2,Par);
     Unit8.Form8.Edit25.Text:=Par;

     Unit8.Form8.Button1.Hide;
     Unit8.Form8.Button2.Hide;
     Unit8.Form8.Button3.Show;
     {Unit8.Form8.Button3.Enabled:=False;}

     ResForm8:=Form8.ShowModal;
     If ResForm8=mrOK then Begin
              Unit5.Form5.ProgressBar1.Show;
              Unit5.Form5.Label1.Caption:=' ���������� ���������.             ���� ������.';
              Unit5.Form5.Refresh;

             {������� ��������� ���� �
              ����������� ���������������� ���������}

             Val(Unit8.Form8.Edit1.Text, Dan.Rs, Code);
             Val(Unit8.Form8.Edit2.Text, Dan.Rg, Code);
             Try

             Val(Unit8.Form8.Edit3.Text, Dan.Pressure[1], Code);
             Val(Unit8.Form8.Edit4.Text, Dan.Pressure[2], Code);
             Val(Unit8.Form8.Edit5.Text, Dan.Pressure[3], Code);
             Val(Unit8.Form8.Edit7.Text, Dan.Temperature[1], Code);
             Val(Unit8.Form8.Edit8.Text, Dan.Temperature[2], Code);
             Val(Unit8.Form8.Edit9.Text, Dan.Temperature[3], Code);
             Val(Unit8.Form8.Edit11.Text, dan.DifTemp[1], Code);
             Val(Unit8.Form8.Edit12.Text, dan.DifTemp[2], Code);
             Val(Unit8.Form8.Edit13.Text, dan.DifTemp[3], Code);

             Except
             end; //Try
             Dan.C[1]:=StrToFl(Unit8.Form8.Edit15.Text);
             Dan.C[2]:=StrToFl(Unit8.Form8.Edit16.Text);
             Dan.C[3]:=StrToFl(Unit8.Form8.Edit17.Text);
             Dan.C[4]:=StrToFl(Unit8.Form8.Edit18.Text);
             Dan.C[5]:=StrToFl(Unit8.Form8.Edit19.Text);
             Dan.C[6]:=StrToFl(Unit8.Form8.Edit20.Text);
             Dan.C[7]:=StrToFl(Unit8.Form8.Edit21.Text);
             Dan.C[8]:=StrToFl(Unit8.Form8.Edit22.Text);
             Dan.C[9]:=StrToFl(Unit8.Form8.Edit23.Text);
             Val(Unit8.Form8.Edit24.Text, Dan.Vl, Code);
             Val(Unit8.Form8.Edit25.Text, Dan.Sera, Code);
             Val(Unit8.Form8.Edit26.Text, Dan.Vsir, Code);

             WriteDan(Dan,Puti+DataOtbora+'.dan');
             {���������� ������ � ����������� ���������������� ���������}

             CoolActiv.DanFile:=Puti+DataOtbora+'.dan';
             CoolActiv.RezFile:=Puti+DataOtbora+'.rez';
             CoolActiv.SkFile:=Puti+DataOtbora+'.sk';
             CoolActiv.TypeOfCalculation:=tcArom;
             CoolActiv.RefreshDanFile:=True;
             If Form4.RadioGroup1.ItemIndex=8 then CoolActiv.TypeOfProcess:=tpBenzene
             else CoolActiv.TypeOfProcess:=tpNormal;
    Case Form4.RadioGroup1.ItemIndex of
     10..12: CoolActiv.ProcessName:=PutiProgram+'\Prob.exe';
     9,16:   CoolActiv.ProcessName:=PutiProgram+'\ss99-10.exe'
     else    CoolActiv.ProcessName:=PutiProgram+'\ss99.exe';
    end; //Case
             CoolActiv.Calculation;
             Unit5.Form5.ProgressBar1.Position:=100;
             Unit5.Form5.Enabled:=True;
             Unit5.Form5.Show;
             Unit5.Form5.Label1.Caption:='';
             Unit5.Form5.ProgressBar1.Hide;
             Unit5.Form5.Updating;
             If CoolActiv.CalcComplited then Begin
                MakeSvod(CoolActiv.RezFile,PathS+'\svod.'+Form4.numU);
                CrazyProcedure;
                NewReportForm.Label1.Caption:='������ �������� �������.';
                NewReportForm.Label2.Caption:='�� ������� ���� '+DataOtbora+
                     ' ������������� '+FloatToStr(Dan.Vsir)+' ���� �����.'+#13+
                     '������� ���������� ������������ ��������� '+
                     FloatToStr(CoolActiv.Results.akt)+' �������� ������.'+#13+
                     '����� ���������: '+FloatToStr(CoolActiv.Results.Vyh)+'% ���.'+#13+
                     '��������� � ����������������� ������������ ��������� � ����������: '+
                     FloatToStr(CoolActiv.Results.Arom[1,11])+' � '+FloatToStr(CoolActiv.Results.Arom[2,11])+
                     ' % ���. ��������������.';
                If Form4.RadioGroup1.ItemIndex<>8 then
                     NewReportForm.Label2.Caption:=NewReportForm.Label2.Caption+#13+
                     '��������� ����� ����������: '+FloatToStr(CoolActiv.Results.Ochm)+' (M.M.), '+
                     FloatToStr(CoolActiv.Results.Ochi)+' (�.�.).';
               NewReportForm.ShowModal;
                                           End;

               end;   //If RezForm...


             Unit6.Form6.Hide;
             Unit5.Form5.Enabled:=True;
             N8.Enabled:=False;
             end; // if NProcess...
        end;  //If RezForm6...

Unit5.Form5.N15.Enabled:=True;
MakeSvod(Puti+DataOtbora+'.rez',PathS+'\svod.'+Form4.numU);
//GrFileMake;
//Svod.SvodMake;
end;

procedure TForm5.N4Click(Sender: TObject);
begin
     Form8.SaveDialog1.InitialDir:=PathU;
     Unit8.Form8.Button3.Hide;
     Unit8.Form8.Button1.Show;
     Unit8.Form8.Button2.Show;
    { Unit8.Form8.Button2.Enabled:=False;}
     Unit8.Form8.Show;
     Unit5.Form5.Enabled:=False;
end;

procedure TForm5.N11Click(Sender: TObject);
begin
     Unit9.Form9.Show;
     Unit5.Form5.Enabled:=False;
end;

procedure TForm5.N15Click(Sender: TObject);
begin
Frep.Rep.Font.Charset:=OEM_CHARSET;
Frep.Rep.Font.Name:='Terminal';
Frep.Rep.Font.Size:=10;
Frep.Rep.Lines.LoadFromFile(CoolActiv.RezFile);
FRep.ShowModal;
Frep.Rep.Font.Name:='Times New Roman';
Frep.Rep.Font.Charset:=Russian_CHARSET;
end;

procedure TForm5.FrClick(Sender: TObject);
Var Basa:TextFile;
    J:Word;
    Spase:string[16];
    Num:string;
    FrPar:array[1..12] of string;
begin
AssignFile(Basa,PathS+'\sk');
Reset(Basa);
For J:=1 To 138 Do ReadLn(Basa);
j:=0;
While not eof(Basa) do
begin
inc(j);
readln(Basa,spase,FrPar[j]);
If FrPar[j]='' then dec(j);
end;
CloseFile(basa);
If J>=6 then
begin
num:=Dels(Frpar[j-5]);
Frak1.Edit1.Text:=num;
Frak1.b1.Caption:=num;
num:=Dels(Frpar[j-4]);
Frak1.Edit2.Text:=num;
Frak1.b2.Caption:=num;
num:=Dels(Frpar[j-3]);
Frak1.Edit6.Text:=num;
Frak1.b3.Caption:=num;
num:=Dels(Frpar[j-2]);
Frak1.Edit10.Text:=num;
Frak1.b4.Caption:=num;
num:=Dels(Frpar[j-1]);
Frak1.Edit11.Text:=num;
Frak1.b5.Caption:=num;
num:=Dels(Frpar[j]);
Frak1.Edit12.Text:=num;
Frak1.b6.Caption:=num;
Frak1.Label5.Caption:='���� ���������� ������:  '+LastData;
frak1.Showmodal;
end
else ShowMessage('��� ������ �� ������������ �������!');
end;



{procedure TForm5.GrClick(Sender: TObject);
begin
Graph.Show;

end; }
procedure TForm5.N17Click(Sender: TObject);
begin
opendialog1.InitialDir:=PathU;
OpenDialog1.FileName:='';
opendialog1.Filter:='����� �����������|*.rez';
If openDialog1.Execute Then Begin
Frep.Rep.Font.Charset:=OEM_CHARSET;
Frep.Rep.Font.Name:='Terminal';
Frep.Rep.Font.Size:=10;
Frep.Rep.Lines.LoadFromFile(OpenDialog1.FileName);
FRep.ShowModal;
Frep.Rep.Font.Name:='Times New Roman';
Frep.Rep.Font.Charset:=Russian_CHARSET;
end
end;

procedure TForm5.N1Click(Sender: TObject);
begin
 Unit10.Form10.MemoRez.Lines.LoadFromFile(PathS+'\������.txt');
 Unit10.Form10.ShowModal;
end;

procedure TForm5.N18Click(Sender: TObject);
begin
//Svod.SFName:=PathS+'\svod.'+IntToStr(Form4.RadioGroup1.ItemIndex+1);
Svod.ShowFile(PathS+'\svod.'+IntToStr(Form4.RadioGroup1.ItemIndex+1));
end;

procedure TForm5.N20Click(Sender: TObject);
begin
graph.ShowFile(PathS+'\svod.'+IntToStr(Form4.RadioGroup1.ItemIndex+1));
end;

procedure TForm5.N19Click(Sender: TObject);
begin
RasDisAkt.DLB.Directory:=PathU;
RasDisAkt.ShowModal;
end;



procedure TForm5.N23Click(Sender: TObject);
begin
form16.show;
end;

procedure TForm5.N24Click(Sender: TObject);
begin
form17.show;
end;

procedure TForm5.N21Click(Sender: TObject);
var
ComL,DirL:array[0..79] of Char;    si : Tstartupinfo;
    p  : Tprocessinformation;
begin
FillChar( Si, SizeOf( Si ) , 0 );
with Si do
begin
 cb := SizeOf( Si);
end;
 Createprocess(nil,StrPCopy(ComL,'hlor.exe '),nil,nil,false,Create_default_error_mode,nil,StrPCopy(DirL,PathS),si,p);
               Waitforsingleobject(p.hProcess,infinite);
end;

procedure TForm5.BdanClick(Sender: TObject);
begin
Form8.Button2.OnClick:=Form8.Basa2Click;
Form5.Hide;
Unit8.Form8.Button1.Show;
Unit8.Form8.Button2.Show;
Unit8.Form8.Button3.Hide;
Form8.Show;

end;

procedure TForm5.FormActivate(Sender: TObject);
begin
If DecimalSeparator='.' then
 begin
 pp1:='.';
 pp2:=',';
 end
else
 begin
 pp1:=',';
 pp2:='.';
 end;
end;

function DelS(s: string): string;
begin
while pos(' ',s)>0 do delete(s,pos(' ',s),1);
Result:=s;
end;



{******************************************************************************}
{******************************************************************************}
{******************************************************************************}
{******************************************************************************}
{******************************************************************************}
{����������� ������ �������� � ������������}
{******************************************************************************}
{******************************************************************************}

procedure TForm5.N26Click(Sender: TObject);
begin
Treef.DirectoryListBox1.Directory:=PathU;
TreeF.ShowModal;
If Treef.ModalResult=mrOk then
 begin
 N27.Enabled:=True;
 N28.Enabled:=True;
 end;
end;


{******************************************************************************}
{******************************************************************************}
{******************************************************************************}
{******************************************************************************}
{******************************************************************************}

procedure TForm5.N27Click(Sender: TObject);
begin
//Svod.SFName:=PathS+'\svod.tmp';
with svod do
 begin
// ChP[3].Visible:=false;
// ChP[4].Visible:=false;
 ChP[14].Visible:=false;
 ChP[17].Visible:=false;
 ChP[9].Visible:=false;
 ChP[18].Visible:=false;
// ChP[3].Checked:=false;
// ChP[4].Checked:=false;
 ChP[9].Checked:=false;
 ChP[14].Checked:=false;
 ChP[17].Checked:=false;
 ChP[18].Checked:=false;
 Svod.ShowFile(PathS+'\svod.tmp');
// ChP[3].Visible:=true;
// ChP[4].Visible:=true;
 ChP[14].Visible:=true;
 ChP[17].Visible:=true;
 ChP[9].Visible:=true;
 ChP[18].Visible:=true;

 end;

end;

procedure TForm5.N28Click(Sender: TObject);
begin
Graph.ShowFile(PathS+'\svod.tmp');
end;

procedure TForm5.RasIssl;
var    i:integer;
   stroka:string;
   Par:string;
   ListRez:TstringList;     {��������� ���� "REZ"}

   s1:string [58];          {������ ��� ����������
                            ������������ ��������� �� "REZ"}
   s2:string [28];          {������ ��� ����������
                            ������ ������������ �� "REZ"}
   s3:string [38];          {������ ��� ����������
                            ������ ���������� ������������ �� "REZ"}
   s4:string [25];          {������ ��� ����������
                            ����� �� ������������ �� "REZ"}
   ResForm11:integer;
   ParS1:string[39];
   ParS2:string[60];
   ParS3:string[39];
   ParS4:string[59];
   ParS5:string[26];

   ParS6:string[11];
   ParS7:string[6];
   ParS8:string[9];
   ParS9:string[6];
   ParS10:string[6];
   ParS11:string[19];
   ParS12:string[6];
   ParS13:string;

   ParS51:string [25];
   ParS52:string [12];
   Par52:real;

   Par1,Par2,Par3,Par4,
   Par5,Par6,Par7,Par8,Par9,Par10,Par11,Par12,Par13:double;

   ParP1,ParP2,ParP3,ParP4,
   ParP5,ParP6,ParP7,ParP8,ParP9,ParP13,CopyF,DanC,SkC:string;
   ComL,DirL:array[0..79] of Char;
   si : Tstartupinfo;
   p  : Tprocessinformation;
   Go:boolean;
   WorkStr:TStringList;
   WorkFile:TFileStream;
   ss1,ss2:string;
begin
With ResF do
 begin
 OpenD.FileName:='';
 SaveR.FileName:='';
 DanF.Text:=PathU+'\';
 SkF.Text:=PathU+'\';
 RezF.Text:=PathIsl+'\';
 end;
 res.Dan:=False;
 res.Sk:=False;
 res.Rz:=False;

Repeat
 Go:=ResF.ShowModal=mrOk;
If Go then
  begin
  AssignFile(f,ResF.SkFile);
  Reset(f);
  AssignFile(ff,PutiProgram+'\'+'sirkat');
  Rewrite(ff);
  while not(eof(f)) do
    begin
    readln(f,ffs);
    writeln(ff,ffs);
    end;
  CloseFile(ff);
  CloseFile(f);


     ReadDan(Dan,ResF.DanF.Text);

     {�������� ���� � ���������������� ���������}
     Unit6.Form6.Hide;

     Unit8.Form8.DateTimePicker1.Date:=Dan.DaOt;
     Unit8.Form8.DateTimePicker2.Date:=Dan.DaRe;
     Str(Dan.Vsir:6:2,Par);
     Unit8.Form8.Edit26.Text:=Par;
     Str(Dan.Rs:4:1,Par);
     Unit8.Form8.Edit1.Text:=Par;
     Str(Dan.Rg:6:2,Par);
     Unit8.Form8.Edit2.Text:=Par;
     Try

       Str(Dan.Pressure[1]:6:2,Par);
       Unit8.Form8.Edit3.Text:=Par;
       Str(Dan.Pressure[2]:6:2,Par);
       Unit8.Form8.Edit4.Text:=Par;
       Str(Dan.Pressure[3]:6:2,Par);
       Unit8.Form8.Edit5.Text:=Par;
       Str(Dan.Temperature[1]:6:2,Par);
       Unit8.Form8.Edit7.Text:=Par;
       Str(Dan.Temperature[2]:6:2,Par);
       Unit8.Form8.Edit8.Text:=Par;
       Str(Dan.Temperature[3]:6:2,Par);
       Unit8.Form8.Edit9.Text:=Par;
       Str(Dan.DifTemp[1]:6:2,Par);
       Unit8.Form8.Edit11.Text:=Par;
       Str(Dan.DifTemp[2]:6:2,Par);
       Unit8.Form8.Edit12.Text:=Par;
       Str(Dan.DifTemp[3]:6:2,Par);
       Unit8.Form8.Edit13.Text:=Par;

     Except
     End;  //Try
     Str(Dan.C[1]:6:2,Par);
     Unit8.Form8.Edit15.Text:=Par;
     Str(Dan.C[2]:6:2,Par);
     Unit8.Form8.Edit16.Text:=Par;
     Str(Dan.C[3]:6:2,Par);
     Unit8.Form8.Edit17.Text:=Par;
     Str(Dan.C[4]:6:2,Par);
     Unit8.Form8.Edit18.Text:=Par;
     Str(Dan.C[5]:6:2,Par);
     Unit8.Form8.Edit19.Text:=Par;
     Str(Dan.C[6]:6:2,Par);
     Unit8.Form8.Edit20.Text:=Par;
     Str(Dan.C[7]:6:2,Par);
     Unit8.Form8.Edit21.Text:=Par;
     Str(Dan.C[8]:6:2,Par);
     Unit8.Form8.Edit22.Text:=Par;
     Str(Dan.C[9]:6:2,Par);
     Unit8.Form8.Edit23.Text:=Par;
     Str(Dan.Vl:6:2,Par);
     Unit8.Form8.Edit24.Text:=Par;
     Str(Dan.Sera:6:2,Par);
     Unit8.Form8.Edit25.Text:=Par;
     Unit8.Form8.Button1.Hide;
     Unit8.Form8.Button2.Hide;
     Unit8.Form8.Button3.Show;
     Form8.ShowModal;
     Form8.Label27.Visible:=True;
     Form8.koks1.Visible:=True;
     Form8.koks2.Visible:=True;
     Form8.koks3.Visible:=True;
             Val(Unit8.Form8.Edit1.Text, Dan.Rs, Code);
             Val(Unit8.Form8.Edit2.Text, Dan.Rg, Code);
             Try

             Val(Unit8.Form8.Edit3.Text, Dan.Pressure[1], Code);
             Val(Unit8.Form8.Edit4.Text, Dan.Pressure[2], Code);
             Val(Unit8.Form8.Edit5.Text, Dan.Pressure[3], Code);
             Val(Unit8.Form8.Edit7.Text, Dan.Temperature[1], Code);
             Val(Unit8.Form8.Edit8.Text, Dan.Temperature[2], Code);
             Val(Unit8.Form8.Edit9.Text, Dan.Temperature[3], Code);
             Val(Unit8.Form8.Edit11.Text, dan.DifTemp[1], Code);
             Val(Unit8.Form8.Edit12.Text, dan.DifTemp[2], Code);
             Val(Unit8.Form8.Edit13.Text, dan.DifTemp[3], Code);

             Except
             end; //Try
             Dan.C[1]:=StrToFl(Unit8.Form8.Edit15.Text);
             Dan.C[2]:=StrToFl(Unit8.Form8.Edit16.Text);
             Dan.C[3]:=StrToFl(Unit8.Form8.Edit17.Text);
             Dan.C[4]:=StrToFl(Unit8.Form8.Edit18.Text);
             Dan.C[5]:=StrToFl(Unit8.Form8.Edit19.Text);
             Dan.C[6]:=StrToFl(Unit8.Form8.Edit20.Text);
             Dan.C[7]:=StrToFl(Unit8.Form8.Edit21.Text);
             Dan.C[8]:=StrToFl(Unit8.Form8.Edit22.Text);
             Dan.C[9]:=StrToFl(Unit8.Form8.Edit23.Text);
             Val(Unit8.Form8.Edit24.Text, Dan.Vl, Code);
             Val(Unit8.Form8.Edit25.Text, Dan.Sera, Code);
             Val(Unit8.Form8.Edit26.Text, Dan.Vsir, Code);

             WriteDan(Dan,ResF.DanF.text);

              Unit5.Form5.ProgressBar1.Show;
              Unit5.Form5.Label1.Caption:='���������� ���������.             ���� ������';
              Unit5.Form5.Refresh;
             CoolActiv.DanFile:=ResF.DanF.Text;
             CoolActiv.RezFile:=ResF.RezF.Text;
             CoolActiv.SkFile:=ResF.SkF.Text;
             If (Way=1) and not(Form4.RadioGroup1.ItemIndex=8) then Begin
                InputQuery('������������ ����������','������� ��� �� '+DataOtbora,par);
                CoolActiv.ExperimentalOctan:=StrToFloat(par);
                CoolActiv.TypeOfCalculation:=tcOctan;
                                                                    End;
             If Way=1 then Begin
                ss1:='������������ ����������� ����������';
                ss2:='����������� ����������';
                           end;
             If (Way=1) and (Form4.RadioGroup1.ItemIndex=8) then Begin
                CoolActiv.TypeOfProcess:=tpBenzene;
                CoolActiv.TypeOfCalculation:=tcArom;
                                                   End
             else CoolActiv.TypeOfProcess:=tpNormal;
             If Way=2 then begin
                CoolActiv.TypeOfCalculation:=tcSingle;
                ss1:='������������ ������� ������� �����';
                ss2:='����������';
             If (Way=2) and (Form4.RadioGroup1.ItemIndex=8) then
                CoolActiv.TypeOfProcess:=tpBenzene;
                           end;
             CoolActiv.RefreshDanFile:=False;
    Case Form4.RadioGroup1.ItemIndex of
     10..12: CoolActiv.ProcessName:=PutiProgram+'\Prob.exe';
     9,16:   CoolActiv.ProcessName:=PutiProgram+'\ss99-10.exe'
     else    CoolActiv.ProcessName:=PutiProgram+'\ss99.exe';
    end; //Case
             CoolActiv.Calculation;
             Unit5.Form5.ProgressBar1.Position:=100;
             Unit5.Form5.Enabled:=True;
             Unit5.Form5.Show;
             Unit5.Form5.Label1.Caption:='';
             Unit5.Form5.ProgressBar1.Hide;
             Unit5.Form5.Updating;
             If CoolActiv.CalcComplited then Begin
                CrazyProcedure;
                NewReportForm.Label1.Caption:=ss1;
                NewReportForm.Label2.Caption:='�� ������� ���� '+DataOtbora+
                     ' ������������� '+FloatToStr(Dan.Vsir)+' ���� �����.'+#13+
                     ss2+' ������������ ��������� '+
                     FloatToStr(CoolActiv.Results.akt)+' �������� ������.';
                If Form4.RadioGroup1.ItemIndex<>8 then
                     NewReportForm.Label2.Caption:=NewReportForm.Label2.Caption+#13+
                     '��������� ����� ����������: '+FloatToStr(CoolActiv.Results.Ochm)+' (M.M.), '+
                     FloatToStr(CoolActiv.Results.Ochi)+' (�.�.).';
               NewReportForm.ShowModal;
                                           End;

             Unit5.Form5.Enabled:=True;
             Unit5.Form5.Show;
    end;
Until (not Go) or (MessageDlg('���������� ��������� � �����:'+#13+
        '���������� �������                  '+ResF.RezFile+#13+
        '���������� ������������?',mtConfirmation,[mbYes,mbNo],0)=mrNo)
end;

procedure TForm5.N30Click(Sender: TObject);
Var Report:TStringList;
begin
Report:=TStringList.Create;
Report.BeginUpdate;
Report.Add('����� �� ��������� '+Ustanovka+' ��������� �� ����� '+Form12.Label25.Caption+'/'+Form12.Label24.Caption);
{Report.Add(Form11.Label1.Caption+Form11.Label3.Caption+Form11.Label9.Caption);
Report.Add(Form11.Label2.Caption+Form11.Label4.Caption+Form11.Label10.Caption);
Report.Add(Form11.Label11.Caption+Form11.Label14.Caption);
Report.Add(' ');
Report.Add('������������');
Report.Add(Advice.Label1.Caption+' '+Advice.AKt.Caption);
Report.Add(Advice.Label3.Caption+' '+Advice.Nm.Caption);
Report.Add(Advice.reas.Caption);}
Report.Add(' ');
Report.Add('�������� ������');
Report.Add(' ');
Report.Add('���������� �������� � ���       '+Form12.Label17.Caption+'/'+Form12.C3.Caption);
Report.Add('������ �����                    '+Form12.Label18.Caption+'/'+Form12.C4.Caption);
Report.Add('��������� �-�/�-�:');
Report.Add('      -� �����                  '+Form12.Label22.Caption+'/'+Form12.C7.Caption);
Report.Add('      -� ����������             '+Form12.Label21.Caption+'/'+Form12.C8.Caption);
Report.Add('����� ��������������� �����, �  '+Form12.Label27.Caption+'/'+Form12.C11.Caption);
Report.Add(' ');
Report.Add(Form30.Label1.Caption);
Report.Add(Form30.Label2.Caption+'   '+Form30.F1.Caption+'/'+Form30.Ff1.Caption);
Report.Add(Form30.Label3.Caption+'   '+Form30.F2.Caption+'/'+Form30.Ff2.Caption);
Report.Add(Form30.Label4.Caption+'   '+Form30.F3.Caption+'/'+Form30.Ff3.Caption);
Report.Add(Form30.Label5.Caption+'   '+Form30.F4.Caption+'/'+Form30.Ff4.Caption);
Report.Add(Form30.Label6.Caption+'   '+Form30.F5.Caption+'/'+Form30.Ff5.Caption);
Report.Add(Form30.Label7.Caption+'   '+Form30.F6.Caption+'/'+Form30.Ff6.Caption);

Report.Add(' ');
Report.Add('���������� ��������');
Report.Add(' ');
//Report.Add('���� ������                     '+Form12.Label25.Caption+'/'+Form12.Label24.Caption);
Report.Add('���������� ������������         '+Form12.Label15.Caption+'/'+Form12.C1.Caption);
Report.Add('����� ��������                  '+Form12.Label16.Caption+'/'+Form12.C2.Caption);
Report.Add('������� ����������� ��������� � �������:');
Report.Add('      -������������             '+Form12.Label19.Caption+'/'+Form12.C5.Caption);
Report.Add('      -�����������������        '+Form12.Label20.Caption+'/'+Form12.C6.Caption);
Report.Add('����� ���������, %����.         '+Form12.Label23.Caption+'/'+Form12.C9.Caption);
Report.Add('���������� ��� � ����������     '+Form12.Label12.Caption+'/'+Form12.C10.Caption);
Report.Add('��������� �����, �.�.�.         '+Form12.Label29.Caption+'/'+Form12.C12.Caption);
Report.Add(Advice.Label2.Caption+' '+Advice.Label5.Caption);

Report.Add(' ');
Report.Add('������');
Report.Add(' ');
Report.Add(M_A.GroupBox1.Caption);
Report.Add(' ');
//Report.Add(M_A.Label10.Caption+'/'+M_A.Label11.Caption+' '+M_A.Comper.Caption);
Report.Add(M_A.Label1.Caption+'   '+M_A.Mb1.Caption+'/'+M_A.M1.Caption);
Report.Add(M_A.Label2.Caption+'   '+M_A.Mb2.Caption+'/'+M_A.M2.Caption);
Report.Add(M_A.Label3.Caption+',%'+'   '+M_A.Mb3.Caption+'/'+M_A.M3.Caption);
Report.Add(M_A.Label4.Caption+'   '+M_A.Mb4.Caption+'/'+M_A.M4.Caption);
Report.Add(' ');
Report.Add(M_A.GroupBox2.Caption);
Report.Add(' ');
Report.Add(M_A.Label12.Caption+'   '+M_A.Kb1.Caption+'/'+M_A.K1.Caption);
Report.Add(M_A.Label13.Caption+',%'+'   '+M_A.Kb2.Caption+'/'+M_A.K2.Caption);
Report.EndUpdate;
FRep.Rep.Lines:=Report;
Report.Free;
FRep.Vot.Preview;
end;

procedure TForm5.N31Click(Sender: TObject);
begin
RasDisAkt.ShowDizakt(Form4.RadioGroup1.ItemIndex);
end;

procedure TForm5.N29Click(Sender: TObject);
begin
PathIsl:=PathU+'\Issl';
ResF.Caption:='������������ ������� ������� �����';
If not DirectoryExists(PathIsl) then ForceDirectories(PathIsl);
RasIssl(2);
end;

procedure TForm5.N32Click(Sender: TObject);
begin
PathIsl:=PathU+'\OptAkt';
ResF.Caption:='������ ����������� ����������';
If not DirectoryExists(PathIsl) then ForceDirectories(PathIsl);
RasIssl(1);
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
CoolActiv:=TActivObj.Create;
end;

procedure TForm5.About2Click(Sender: TObject);
begin
 AboutBox.Show;
end;

end.
