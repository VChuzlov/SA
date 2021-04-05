unit Unit8Last;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Spin, Mask;

type
  TForm8Last = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Button1: TButton;
    Button2: TButton;
    SaveDialog1: TSaveDialog;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Edit24: TEdit;
    Edit25: TEdit;
    Button3: TButton;
    Edit26: TEdit;
    Label27: TLabel;
    koks1: TEdit;
    koks2: TEdit;
    koks3: TEdit;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit15Change(Sender: TObject);
    procedure Edit16Change(Sender: TObject);
    procedure Edit17Change(Sender: TObject);
    procedure Edit18Change(Sender: TObject);
    procedure Edit19Change(Sender: TObject);
    procedure Edit20Change(Sender: TObject);
    procedure Edit21Change(Sender: TObject);
    procedure Edit22Change(Sender: TObject);
    procedure Edit23Change(Sender: TObject);
    procedure Edit24Change(Sender: TObject);
    procedure Edit25Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure Edit9Change(Sender: TObject);
    procedure Edit10Change(Sender: TObject);
    procedure Edit11Change(Sender: TObject);
    procedure Edit12Change(Sender: TObject);
    procedure Edit13Change(Sender: TObject);
    procedure Edit14Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit26Change(Sender: TObject);
    procedure koks1Exit(Sender: TObject);
  published
    procedure Basa2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8Last: TForm8Last;
  C:real;       {����� ���}
  CC1,CC2,CC3,CC4,CC5,CC6,CC7,CC8,CC9:real;
  Code:integer;   {��� �������� ������������ ����� ����������}
  CodeReal:real;  {��� �������� ������������ ����� ����������}
  SummaC:string;
  mascode:array[1..9] of integer;           {������ ����� �������� ������������ �������� ��������}


implementation

Uses Unit4, Unit5, Unit6, basa;
{$R *.DFM}

procedure TForm8Last.Button1Click(Sender: TObject);
begin
     Unit8Last.Form8Last.Hide;
     Unit5.Form5.Enabled:=True;
     Unit5.Form5.Show;
     Form5.N16.Enabled:=False;
     Form8Last.Button2.OnClick:=Button2Click;
end;

     {���������� ����� � ���������������� ���������}

procedure TForm8Last.Button2Click(Sender: TObject);
var
   Ima, Put, DataOt:string;
begin
     {SaveDialog1.InitialDir:=PathU;}
     SaveDialog1.Filter:='��������������� ������� (*.dan)|*.dan';
     SaveDialog1.Title:='���������� �����';
     SaveDialog1.DefaultExt:='dan';
     SaveDialog1.InitialDir:=PathS;
     SaveDialog1.FileName:='';
     SaveDialog1.Execute;

     Ima:=SaveDialog1.FileName;
     If Ima<>'' then
        begin
             gopa(Ima,Put,DataOt);
            {
             DateTimePicker1 - ���� ������
             DateTimePicker2 - ���� ����������� ������������
             Edit26 - ����� ��������������� �����, �
             Edit1 - ������ �����
             Edit2 - ������ ���
             Edit3 - �������� � �������� �-2
             Edit4 - �������� � �������� �-3
             Edit5 - �������� � �������� �-4
             Edit6 - �������� � �������� �-5
             Edit7 - ����������� � �������� �-2
             Edit8 - ����������� � �������� �-3
             Edit9 - ����������� � �������� �-4
             Edit10 - ����������� � �������� �-5
             Edit11 - ������� ����������� � �������� �-2
             Edit12 - ������� ����������� � �������� �-3
             Edit13 - ������� ����������� � �������� �-4
             Edit14 - ������� ����������� � �������� �-5
             Edit15 - ������ ���          �2
             Edit16 -                     �1
             Edit17 -                     �2
             Edit18 -                     �3
             Edit19 -                     �-�4
             Edit20 -                     ���-�4
             Edit21 -                     �-�5
             Edit22 -                     ���-�5
             Edit23 -                     �6
             Edit24 -                     ��������� ���
             Edit25 -                     ����
              }

              AssignFile(f,Put+'\'+DataOt+'.dan');
              Rewrite(f);

              DaOt:=FormatDateTime(ShortDat,DateTimePicker1.Date);
              DaRe:=FormatDateTime(ShortDat,DateTimePicker2.Date);
              If length(DaOt)>8 then delete(DaOt,7,2);
              If length(DaRe)>8 then delete(DaRe,7,2);
              {DiClor1:=0.0; DiClor2:=0.0; DiClor3:=0.0;
              Akt:=0.0;}
              Val(Edit26.Text, Vsir, Code);
              Val(Edit1.Text, Rs, Code);
              Val(Edit2.Text, Rg, Code);
              Val(Edit3.Text, P2, Code);
              Val(Edit4.Text, P3, Code);
              Val(Edit5.Text, P4, Code);
              Val(Edit6.Text, P5, Code);
              Val(Edit7.Text, T2, Code);
              Val(Edit8.Text, T3, Code);
              Val(Edit9.Text, T4, Code);
              Val(Edit10.Text, T5, Code);
              Val(Edit11.Text, dT2, Code);
              Val(Edit12.Text, dT3, Code);
              Val(Edit13.Text, dT4, Code);
              Val(Edit14.Text, dT5, Code);
              Val(Edit15.Text, C1, Code);
              Val(Edit16.Text, C2, Code);
              Val(Edit17.Text, C3, Code);
              Val(Edit18.Text, C4, Code);
              Val(Edit19.Text, C5, Code);
              Val(Edit20.Text, C6, Code);
              Val(Edit21.Text, C7, Code);
              Val(Edit22.Text, C8, Code);
              Val(Edit23.Text, C9, Code);
              Val(Edit24.Text, Vl, Code);
              Val(Edit25.Text, Sera, Code);
              WriteLn(f,DiClor1:6:2, DiClor2:6:2, DiClor3:6:2,'     ����� ��嫮��⠭� �� ॠ��ࠬ (�-202, �-203, �-204), ��.');
              WriteLn(f,Akt:6:2, '     ��⨢����� ��⠫����� (�᫮���� ������)');
              WriteLn(f,P2:6:2,' ', P3:6:2,' ', P4:6:2,' ', P5:6:2, '     �������� �� ॠ��ࠬ (�-202, �-203, �-204, �-205), ��.');
              Writeln(f,Vl:6:2,'     ��������� ���, %');
              Writeln(f,T2:6:2,' ', T3:6:2,' ', T4:6:2,' ', T5:6:2,'     ��������� �室��� �� ॠ��ࠬ (�-202, �-203, �-204, �-205), �ࠤ. �');
              Writeln(f,dT2:6:2,' ', dT3:6:2,' ', dT4:6:2,' ', dT5:6:2,'       ��९��� ⥬������ �� ॠ��ࠬ (�-202, �-203, �-204, �-205), �ࠤ. �');
              Writeln(f,C1:6:5,' ', C2:6:5,' ', C3:6:5,' ', C4:6:5,' ', C5:6:5,' ', C6:6:5,' ', C7:6:5,' ', C8:6:5,' ',C9:6:5,'         ���⠢ ��� (H2, C1, C2, C3, n-C4, i-C4, n-C5, i-C5, C6), %');
              Writeln(f,Rg:6:2,'       ���室 ���, �3/��');
              Writeln(f,Vsir:6:2,'       ���� ��᫥ ॣ����樨');
              Writeln(f,Sera:6:2,'       ��� � ���ண������');
              Writeln(f,Rs:6:2,'       ���室 �����, �3/��');
              Writeln(f,DaOt,'       ��� �⡮�');
              Writeln(f,DaRe,'       ��� ॣ����樨 ��⠫�����');
              CloseFile(f);
     end;

     Unit8Last.Form8Last.Hide;
     Unit5.Form5.Enabled:=True;
     Unit5.Form5.Show;
end;
                    {H2}
procedure TForm8Last.Edit15Change(Sender: TObject);
begin
     Val(Edit15.Text, CC1, masCode[1]);
     Val(Edit16.Text, CC2, masCode[2]);
     Val(Edit17.Text, CC3, masCode[3]);
     Val(Edit18.Text, CC4, masCode[4]);
     Val(Edit19.Text, CC5, masCode[5]);
     Val(Edit20.Text, CC6, masCode[6]);
     Val(Edit21.Text, CC7, masCode[7]);
     Val(Edit22.Text, CC8, masCode[8]);
     Val(Edit23.Text, CC9, masCode[9]);
     C:=CC1+CC2+CC3+CC4+CC5+CC6+CC7+CC8+CC9;
     if mascode[1] <> 0 then
        begin
             summac:=Edit15.Text;
             delete(summac,mascode[1],1);
             Edit15.Text:=summac;
        end;
     Str(C:6:5, SummaC);
     Unit8Last.Form8Last.Label25.Caption:=SummaC;
    { If C=100 then
                  begin
                       Unit8Last.Form8Last.Button2.Enabled:=True;
                       Unit8Last.Form8Last.Button3.Enabled:=True;
                  end
              else
                  begin
                       Unit8Last.Form8Last.Button2.Enabled:=False;
                       Unit8Last.Form8Last.Button3.Enabled:=False;
                  end;}
end;

                      {C1}
procedure TForm8Last.Edit16Change(Sender: TObject);
begin
     Val(Edit15.Text, CC1, masCode[1]);
     Val(Edit16.Text, CC2, masCode[2]);
     Val(Edit17.Text, CC3, masCode[3]);
     Val(Edit18.Text, CC4, masCode[4]);
     Val(Edit19.Text, CC5, masCode[5]);
     Val(Edit20.Text, CC6, masCode[6]);
     Val(Edit21.Text, CC7, masCode[7]);
     Val(Edit22.Text, CC8, masCode[8]);
     Val(Edit23.Text, CC9, masCode[9]);
     C:=CC1+CC2+CC3+CC4+CC5+CC6+CC7+CC8+CC9;
     if mascode[2] <> 0 then
        begin
             summac:=Edit16.Text;
             delete(summac,mascode[2],1);
             Edit16.Text:=summac;
        end;
     Str(C:6:5, SummaC);
     Unit8Last.Form8Last.Label25.Caption:=SummaC;
{     If C=100 then
                  begin
                       Unit8Last.Form8Last.Button2.Enabled:=True;
                       Unit8Last.Form8Last.Button3.Enabled:=True;
                  end
              else
                  begin
                       Unit8Last.Form8Last.Button2.Enabled:=False;
                       Unit8Last.Form8Last.Button3.Enabled:=False;
                  end;}
end;
                         {C2}
procedure TForm8Last.Edit17Change(Sender: TObject);
begin
     Val(Edit15.Text, CC1, masCode[1]);
     Val(Edit16.Text, CC2, masCode[2]);
     Val(Edit17.Text, CC3, masCode[3]);
     Val(Edit18.Text, CC4, masCode[4]);
     Val(Edit19.Text, CC5, masCode[5]);
     Val(Edit20.Text, CC6, masCode[6]);
     Val(Edit21.Text, CC7, masCode[7]);
     Val(Edit22.Text, CC8, masCode[8]);
     Val(Edit23.Text, CC9, masCode[9]);
     C:=CC1+CC2+CC3+CC4+CC5+CC6+CC7+CC8+CC9;
     if mascode[3] <> 0 then
        begin
             summac:=Edit17.Text;
             delete(summac,mascode[3],1);
             Edit17.Text:=summac;
        end;
     Str(C:6:5, SummaC);
     Unit8Last.Form8Last.Label25.Caption:=SummaC;
{     If C=100 then
                  begin
                       Unit8Last.Form8Last.Button2.Enabled:=True;
                       Unit8Last.Form8Last.Button3.Enabled:=True;
                  end
              else
                  begin
                       Unit8Last.Form8Last.Button2.Enabled:=False;
                       Unit8Last.Form8Last.Button3.Enabled:=False;
                  end;}
end;
                   {C3}
procedure TForm8Last.Edit18Change(Sender: TObject);
begin
     Val(Edit15.Text, CC1, masCode[1]);
     Val(Edit16.Text, CC2, masCode[2]);
     Val(Edit17.Text, CC3, masCode[3]);
     Val(Edit18.Text, CC4, masCode[4]);
     Val(Edit19.Text, CC5, masCode[5]);
     Val(Edit20.Text, CC6, masCode[6]);
     Val(Edit21.Text, CC7, masCode[7]);
     Val(Edit22.Text, CC8, masCode[8]);
     Val(Edit23.Text, CC9, masCode[9]);
     C:=CC1+CC2+CC3+CC4+CC5+CC6+CC7+CC8+CC9;
     if mascode[4] <> 0 then
        begin
             summac:=Edit18.Text;
             delete(summac,mascode[4],1);
             Edit18.Text:=summac;
        end;
     Str(C:6:5, SummaC);
     Unit8Last.Form8Last.Label25.Caption:=SummaC;
{     If C=100 then
                  begin
                       Unit8Last.Form8Last.Button2.Enabled:=True;
                       Unit8Last.Form8Last.Button3.Enabled:=True;
                  end
              else
                  begin
                       Unit8Last.Form8Last.Button2.Enabled:=False;
                       Unit8Last.Form8Last.Button3.Enabled:=False;
                  end;}
end;
                       {�-C4}
procedure TForm8Last.Edit19Change(Sender: TObject);
begin
     Val(Edit15.Text, CC1, masCode[1]);
     Val(Edit16.Text, CC2, masCode[2]);
     Val(Edit17.Text, CC3, masCode[3]);
     Val(Edit18.Text, CC4, masCode[4]);
     Val(Edit19.Text, CC5, masCode[5]);
     Val(Edit20.Text, CC6, masCode[6]);
     Val(Edit21.Text, CC7, masCode[7]);
     Val(Edit22.Text, CC8, masCode[8]);
     Val(Edit23.Text, CC9, masCode[9]);
     C:=CC1+CC2+CC3+CC4+CC5+CC6+CC7+CC8+CC9;
     if mascode[5] <> 0 then
        begin
             summac:=Edit19.Text;
             delete(summac,mascode[5],1);
             Edit19.Text:=summac;
        end;
     Str(C:6:5, SummaC);
     Unit8Last.Form8Last.Label25.Caption:=SummaC;
{     If C=100 then
                  begin
                       Unit8Last.Form8Last.Button2.Enabled:=True;
                       Unit8Last.Form8Last.Button3.Enabled:=True;
                  end
              else
                  begin
                       Unit8Last.Form8Last.Button2.Enabled:=False;
                       Unit8Last.Form8Last.Button3.Enabled:=False;
                  end;}
end;
                     {���-C4}
procedure TForm8Last.Edit20Change(Sender: TObject);
begin
     Val(Edit15.Text, CC1, masCode[1]);
     Val(Edit16.Text, CC2, masCode[2]);
     Val(Edit17.Text, CC3, masCode[3]);
     Val(Edit18.Text, CC4, masCode[4]);
     Val(Edit19.Text, CC5, masCode[5]);
     Val(Edit20.Text, CC6, masCode[6]);
     Val(Edit21.Text, CC7, masCode[7]);
     Val(Edit22.Text, CC8, masCode[8]);
     Val(Edit23.Text, CC9, masCode[9]);
     C:=CC1+CC2+CC3+CC4+CC5+CC6+CC7+CC8+CC9;
     if mascode[6] <> 0 then
        begin
             summac:=Edit20.Text;
             delete(summac,mascode[6],1);
             Edit20.Text:=summac;
        end;
     Str(C:6:5, SummaC);
     Unit8Last.Form8Last.Label25.Caption:=SummaC;
{     If C=100 then
                  begin
                       Unit8Last.Form8Last.Button2.Enabled:=True;
                       Unit8Last.Form8Last.Button3.Enabled:=True;
                  end
              else
                  begin
                       Unit8Last.Form8Last.Button2.Enabled:=False;
                       Unit8Last.Form8Last.Button3.Enabled:=False;
                  end;}
end;
                  {�-C5}
procedure TForm8Last.Edit21Change(Sender: TObject);
begin
     Val(Edit15.Text, CC1, masCode[1]);
     Val(Edit16.Text, CC2, masCode[2]);
     Val(Edit17.Text, CC3, masCode[3]);
     Val(Edit18.Text, CC4, masCode[4]);
     Val(Edit19.Text, CC5, masCode[5]);
     Val(Edit20.Text, CC6, masCode[6]);
     Val(Edit21.Text, CC7, masCode[7]);
     Val(Edit22.Text, CC8, masCode[8]);
     Val(Edit23.Text, CC9, masCode[9]);
     C:=CC1+CC2+CC3+CC4+CC5+CC6+CC7+CC8+CC9;
     if mascode[7] <> 0 then
        begin
             summac:=Edit21.Text;
             delete(summac,mascode[7],1);
             Edit21.Text:=summac;
        end;
     Str(C:6:5, SummaC);
     Unit8Last.Form8Last.Label25.Caption:=SummaC;
{     If C=100 then
                  begin
                       Unit8Last.Form8Last.Button2.Enabled:=True;
                       Unit8Last.Form8Last.Button3.Enabled:=True;
                  end
              else
                  begin
                       Unit8Last.Form8Last.Button2.Enabled:=False;
                       Unit8Last.Form8Last.Button3.Enabled:=False;
                  end;}
end;
                  {���-�5}
procedure TForm8Last.Edit22Change(Sender: TObject);
begin
     Val(Edit15.Text, CC1, masCode[1]);
     Val(Edit16.Text, CC2, masCode[2]);
     Val(Edit17.Text, CC3, masCode[3]);
     Val(Edit18.Text, CC4, masCode[4]);
     Val(Edit19.Text, CC5, masCode[5]);
     Val(Edit20.Text, CC6, masCode[6]);
     Val(Edit21.Text, CC7, masCode[7]);
     Val(Edit22.Text, CC8, masCode[8]);
     Val(Edit23.Text, CC9, masCode[9]);
     C:=CC1+CC2+CC3+CC4+CC5+CC6+CC7+CC8+CC9;
     if mascode[8] <> 0 then
        begin
             summac:=Edit22.Text;
             delete(summac,mascode[8],1);
             Edit22.Text:=summac;
        end;
     Str(C:6:5, SummaC);
     Unit8Last.Form8Last.Label25.Caption:=SummaC;
{     If C=100 then
                  begin
                       Unit8Last.Form8Last.Button2.Enabled:=True;
                       Unit8Last.Form8Last.Button3.Enabled:=True;
                  end
              else
                  begin
                       Unit8Last.Form8Last.Button2.Enabled:=False;
                       Unit8Last.Form8Last.Button3.Enabled:=False;
                  end;}
end;
                  {�6}
procedure TForm8Last.Edit23Change(Sender: TObject);
begin
     Val(Edit15.Text, CC1, masCode[1]);
     Val(Edit16.Text, CC2, masCode[2]);
     Val(Edit17.Text, CC3, masCode[3]);
     Val(Edit18.Text, CC4, masCode[4]);
     Val(Edit19.Text, CC5, masCode[5]);
     Val(Edit20.Text, CC6, masCode[6]);
     Val(Edit21.Text, CC7, masCode[7]);
     Val(Edit22.Text, CC8, masCode[8]);
     Val(Edit23.Text, CC9, masCode[9]);
     C:=CC1+CC2+CC3+CC4+CC5+CC6+CC7+CC8+CC9;
     if mascode[9] <> 0 then
        begin
             summac:=Edit23.Text;
             delete(summac,mascode[9],1);
             Edit23.Text:=summac;
        end;
     Str(C:6:5, SummaC);
     Unit8Last.Form8Last.Label25.Caption:=SummaC;
{     If C=100 then
                  begin
                       Unit8Last.Form8Last.Button2.Enabled:=True;
                       Unit8Last.Form8Last.Button3.Enabled:=True;
                  end
              else
                  begin
                       Unit8Last.Form8Last.Button2.Enabled:=False;
                       Unit8Last.Form8Last.Button3.Enabled:=False;
                  end;}
end;

procedure TForm8Last.Edit24Change(Sender: TObject);
begin
     Val(Edit24.Text, CodeReal, Code);
     if code <> 0 then
        begin
             summac:=Edit24.Text;
             delete(summac,code,1);
             Edit24.Text:=summac;
        end;

end;


procedure TForm8Last.Edit25Change(Sender: TObject);
begin
     Val(Edit25.Text, CodeReal, Code);
     if code <> 0 then
        begin
             summac:=Edit25.Text;
             delete(summac,code,1);
             Edit25.Text:=summac;
        end;

end;







procedure TForm8Last.Edit1Change(Sender: TObject);
begin
     Val(Edit1.Text, CodeReal, Code);
     if code <> 0 then
        begin
             summac:=Edit1.Text;
             delete(summac,code,1);
             Edit1.Text:=summac;
        end;

end;

procedure TForm8Last.Edit2Change(Sender: TObject);
begin
     Val(Edit2.Text, CodeReal, Code);
     if code <> 0 then
        begin
             summac:=Edit2.Text;
             delete(summac,code,1);
             Edit2.Text:=summac;
        end;

end;

procedure TForm8Last.Edit3Change(Sender: TObject);
begin
     Val(Edit3.Text, CodeReal, Code);
     if code <> 0 then
        begin
             summac:=Edit3.Text;
             delete(summac,code,1);
             Edit3.Text:=summac;
        end;

end;

procedure TForm8Last.Edit4Change(Sender: TObject);
begin
     Val(Edit4.Text, CodeReal, Code);
     if code <> 0 then
        begin
             summac:=Edit4.Text;
             delete(summac,code,1);
             Edit4.Text:=summac;
        end;

end;

procedure TForm8Last.Edit5Change(Sender: TObject);
begin
     Val(Edit5.Text, CodeReal, Code);
     if code <> 0 then
        begin
             summac:=Edit5.Text;
             delete(summac,code,1);
             Edit5.Text:=summac;
        end;

end;

procedure TForm8Last.Edit6Change(Sender: TObject);
begin
     Val(Edit6.Text, CodeReal, Code);
     if code <> 0 then
        begin
             summac:=Edit6.Text;
             delete(summac,code,1);
             Edit6.Text:=summac;
        end;

end;

procedure TForm8Last.Edit7Change(Sender: TObject);
begin
     Val(Edit7.Text, CodeReal, Code);
     if code <> 0 then
        begin
             summac:=Edit7.Text;
             delete(summac,code,1);
             Edit7.Text:=summac;
        end;

end;

procedure TForm8Last.Edit8Change(Sender: TObject);
begin
     Val(Edit8.Text, CodeReal, Code);
     if code <> 0 then
        begin
             summac:=Edit8.Text;
             delete(summac,code,1);
             Edit8.Text:=summac;
        end;

end;

procedure TForm8Last.Edit9Change(Sender: TObject);
begin
     Val(Edit9.Text, CodeReal, Code);
     if code <> 0 then
        begin
             summac:=Edit9.Text;
             delete(summac,code,1);
             Edit9.Text:=summac;
        end;

end;

procedure TForm8Last.Edit10Change(Sender: TObject);
begin
     Val(Edit10.Text, CodeReal, Code);
     if code <> 0 then
        begin
             summac:=Edit10.Text;
             delete(summac,code,1);
             Edit10.Text:=summac;
        end;

end;

procedure TForm8Last.Edit11Change(Sender: TObject);
begin
     Val(Edit11.Text, CodeReal, Code);
     if code <> 0 then
        begin
             summac:=Edit11.Text;
             delete(summac,code,1);
             Edit11.Text:=summac;
        end;

end;

procedure TForm8Last.Edit12Change(Sender: TObject);
begin
     Val(Edit12.Text, CodeReal, Code);
     if code <> 0 then
        begin
             summac:=Edit12.Text;
             delete(summac,code,1);
             Edit12.Text:=summac;
        end;

end;

procedure TForm8Last.Edit13Change(Sender: TObject);
begin
     Val(Edit13.Text, CodeReal, Code);
     if code <> 0 then
        begin
             summac:=Edit13.Text;
             delete(summac,code,1);
             Edit13.Text:=summac;
        end;

end;

procedure TForm8Last.Edit14Change(Sender: TObject);
begin
     Val(Edit14.Text, CodeReal, Code);
     if code <> 0 then
        begin
             summac:=Edit14.Text;
             delete(summac,code,1);
             Edit14.Text:=summac;
        end;

end;


procedure TForm8Last.Button3Click(Sender: TObject);
begin
     ModalResult:=mrOk;
end;

procedure TForm8Last.FormCreate(Sender: TObject);
begin
     Val(Edit15.Text, CC1, masCode[1]);
     Val(Edit16.Text, CC2, masCode[2]);
     Val(Edit17.Text, CC3, masCode[3]);
     Val(Edit18.Text, CC4, masCode[4]);
     Val(Edit19.Text, CC5, masCode[5]);
     Val(Edit20.Text, CC6, masCode[6]);
     Val(Edit21.Text, CC7, masCode[7]);
     Val(Edit22.Text, CC8, masCode[8]);
     Val(Edit23.Text, CC9, masCode[9]);
     C:=CC1+CC2+CC3+CC4+CC5+CC6+CC7+CC8+CC9;
     Str(C:6:5, SummaC);
     Unit8Last.Form8Last.Label25.Caption:=SummaC;
  {   If C=100 then
                  begin
                       Unit8Last.Form8Last.Button2.Enabled:=True;
                       Unit8Last.Form8Last.Button3.Enabled:=True;
                  end
              else
                  begin
                       Unit8Last.Form8Last.Button2.Enabled:=False;
                       Unit8Last.Form8Last.Button3.Enabled:=False;
                  end;}
end;




procedure TForm8Last.Edit26Change(Sender: TObject);
begin
     Val(Edit26.Text, CodeReal, Code);
     if code <> 0 then
        begin
             summac:=Edit26.Text;
             delete(summac,code,1);
             Edit26.Text:=summac;
        end;

end;

procedure TForm8Last.Basa2Click(Sender: TObject);
var f:textfile;
    Ima:string;
begin
DaOt:=FormatDateTime(ShortDat,DateTimePicker1.Date);
DaRe:=FormatDateTime(ShortDat,DateTimePicker2.Date);
If length(DaOt)>8 then delete(DaOt,7,2);
If length(DaRe)>8 then delete(DaRe,7,2);
DataOt:=Daot;
while pos('.',DataOt)>0 do DataOt[pos('.',DataOt)]:='-';
putb:=PathU+'\'+DataOt;
{$I-}
MkDir(putb);
{$I+}
If IOResult<>0 then
 begin
 if MessageDlg('������ �� ��� ���� ��� ����������.'+#13+'������������?',mtWarning,mbOKCancel,0)=mrCancel then
 Exit;
 end;
ima:=putb+'\'+dataot+'.dan';
AssignFile(F,ima);
Rewrite(f);
Val(Edit26.Text, Vsir, Code);
Val(Edit1.Text, Rs, Code);
gvsg:=Rs;
Val(Edit2.Text, Rg, Code);
Val(Edit3.Text, P2, Code);
Val(Edit4.Text, P3, Code);
Val(Edit5.Text, P4, Code);
Val(Edit6.Text, P5, Code);
Val(Edit7.Text, T2, Code);
Val(Edit8.Text, T3, Code);
Val(Edit9.Text, T4, Code);
Val(Edit10.Text, T5, Code);
Val(Edit11.Text, dT2, Code);
Val(Edit12.Text, dT3, Code);
Val(Edit13.Text, dT4, Code);
Val(Edit14.Text, dT5, Code);
Val(Edit15.Text, C1, Code);
x4:=C1;
Val(Edit16.Text, C2, Code);
Val(Edit17.Text, C3, Code);
Val(Edit18.Text, C4, Code);
Val(Edit19.Text, C5, Code);
Val(Edit20.Text, C6, Code);
Val(Edit21.Text, C7, Code);
Val(Edit22.Text, C8, Code);
Val(Edit23.Text, C9, Code);
Val(Edit24.Text, Vl, Code);
x3:=Vl;
Val(Edit25.Text, Sera, Code);
WriteLn(f,DiClor1:6:2, DiClor2:6:2, DiClor3:6:2,'     ����� ��嫮��⠭� �� ॠ��ࠬ (�-202, �-203, �-204), ��.');
WriteLn(f,Akt:6:2, '     ��⨢����� ��⠫����� (�᫮���� ������)');
WriteLn(f,P2:6:2,' ', P3:6:2,' ', P4:6:2,' ', P5:6:2, '     �������� �� ॠ��ࠬ (�-202, �-203, �-204, �-205), ��.');
Writeln(f,Vl:6:2,'     ��������� ���, %');
Writeln(f,T2:6:2,' ', T3:6:2,' ', T4:6:2,' ', T5:6:2,'     ��������� �室��� �� ॠ��ࠬ (�-202, �-203, �-204, �-205), �ࠤ. �');
Writeln(f,dT2:6:2,' ', dT3:6:2,' ', dT4:6:2,' ', dT5:6:2,'       ��९��� ⥬������ �� ॠ��ࠬ (�-202, �-203, �-204, �-205), �ࠤ. �');
Writeln(f,C1:6:5,' ', C2:6:5,' ', C3:6:5,' ', C4:6:5,' ', C5:6:5,' ', C6:6:5,' ', C7:6:5,' ', C8:6:5,' ',C9:6:5,'         ���⠢ ��� (H2, C1, C2, C3, n-C4, i-C4, n-C5, i-C5, C6), %');
Writeln(f,Rg:6:2,'       ���室 ���, �3/��');
Writeln(f,Vsir:6:2,'       ���� ��᫥ ॣ����樨');
Writeln(f,Sera:6:2,'       ��� � ���ண������');
Writeln(f,Rs:6:2,'       ���室 �����, �3/��');
Writeln(f,DaOt,'       ��� �⡮�');
Writeln(f,DaRe,'       ��� ॣ����樨 ��⠫�����');
CloseFile(f);
Form8Last.Hide;
basadan.F7.Text:=Edit1.Text;
Button2.OnClick:=Button2Click;
BasaDan.Prob.Caption:=ProbName[1];
Way:=1;
BasaDan.ShowModal;
end;

procedure TForm8Last.koks1Exit(Sender: TObject);
begin
try
strToFl((Sender as TEdit).Text)
except
(Sender as TEdit).Undo
end;
(Sender as TEdit).ClearUndo;
end;

end.


