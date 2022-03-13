unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OleCtrls, vcf1, Menus, Gauges, ExtCtrls, StdCtrls,FileCtrl,
  Unit3;

type
  TForm4 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    RadioGroup1: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    function GetNumUst:string;
    { Private declarations }
  public
    { Public declarations }
  published
    property NumU:string read GetNumUst;
  end;

var
  Form4: TForm4;

  ItemIndex:integer;     {Номер установки}
  f,ff:text;             {Файлы для L90}
  ffs:string;            {Строка для считывания L90}
  StateLine:Integer;
  ColReakt:integer;      //Количество реакторов
  UstNum:integer;        //НомерУстановки
implementation

   Uses Unit2,Unit5, frak, makeres, Unit8;
{$R *.DFM}

function TForm4.GetNumUst;
begin
Result:=IntToStr(RadioGroup1.ItemIndex+1);
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
     Unit3.Form3.ShowModal;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
     UstNum:=RadioGroup1.ItemIndex;
     Unit5.Form5.Caption:=' Установка: '+Ustanovka+'                            Дата отбора: '+DataOtbora;
     Unit5.Form5.Label1.Caption:='';
     Unit5.Form5.ProgressBar1.Hide;
     Unit5.Form5.Enabled:=True;
     Unit5.Form5.Show;
     Unit4.Form4.Hide;
     Unit5.Form5.OpenDialog1.FileName:='';

     If UstNum=11 then
 begin
  Unit8.Form8.Label8.Visible:=true;
  Unit8.Form8.Edit27.Visible:=true;
  Unit8.Form8.Edit28.Visible:=true;
  Unit8.Form8.Edit29.Visible:=true;

  {Смена картинки на четырехреакторную}
  Form8.TexShemeImage.Picture.LoadFromFile(pathS+'\Basa\Pic\1.jpg');
 {картинки прилогаются по указанному пути,
  такое решение было предложенно, чтобы полностью программу не переделывать}
 Form8.Width:=898;
 Form8.Label24.Visible:=False;
 Form8.Button4.Visible:=True;
 end;
     If UstNum<>11 then
 begin
  Unit8.Form8.Label8.Visible:=False;
  Unit8.Form8.Edit27.Visible:=False;
  Unit8.Form8.Edit28.Visible:=False;
  Unit8.Form8.Edit29.Visible:=False;

  {Смена картинки на трехреакторную}
  Form8.TexShemeImage.Picture.LoadFromFile(pathS+'\Basa\Pic\2.jpg');
  Form8.Label24.Visible:=true;
  Form8.Button4.Visible:=False;
  Form8.Width:=722;
end;
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
    Unit3.Form3.ShowModal;
   {  Unit3.Form3.Show;
     Unit4.Form4.Hide;
}end;






procedure TForm4.RadioGroup1Click(Sender: TObject);
var FR,FT:PChar;
    st1,st2,s:string;
    l90:TextFile;
    Dcl:double;
    i,Code:integer;
begin
     Button2.Enabled:=True;
     {Выбор установки}
Case RadioGroup1.ItemIndex of
0:      Begin
             Ustanovka:='Ачинский НПЗ (ЛК-6У)                ';
             AssignFile(f,PathS+'\'+'l90');rewrite(f);
             AssignFile(ff,PathS+'\'+'l90.1');reset(ff);
             FrPath:=PathS+'\Achinsk\Fr';
             PathU:=PathS+'\Achinsk';
             while not(eof(ff)) do
                   begin
                        readln(ff,ffs);
                        writeln(f,ffs);
                   end;
             CloseFile(f); CloseFile(ff);
             frn:='fr-1.exe';
            Form5.Bdan.Enabled:=True;
             Form5.N3.Enabled:=True;
             StateLine:=0;
        end;

1:        Begin
             Ustanovka:='MAZEIKIU NAFTA (LK-6U Nr. 1 S-200)  ';
             AssignFile(f,PathS+'\'+'l90');rewrite(f);
             AssignFile(ff,PathS+'\'+'l90.2');reset(ff);
             FrPath:=PathS+'\Mazeikiu\Lk-6u-Nr1\Fr';
             PathU:=PathS+'\Mazeikiu\Lk-6u-Nr1';
             while not(eof(ff)) do
                   begin
                        readln(ff,ffs);
                        writeln(f,ffs);
                   end;
             CloseFile(f); CloseFile(ff);
             frn:='fr-1.exe';
             Form5.Bdan.Enabled:=True;
             Form5.N3.Enabled:=True;
             StateLine:=1;
        end;

2:        Begin
             Ustanovka:='MAZEIKIU NAFTA (LK-6U Nr. 2 S-200)  ';
             AssignFile(f,PathS+'\'+'l90');rewrite(f);
             AssignFile(ff,PathS+'\'+'l90.3');reset(ff);
             FrPath:=PathS+'\Mazeikiu\Lk-6u-Nr2\Fr';
             PathU:=PathS+'\Mazeikiu\Lk-6u-Nr2';
             while not(eof(ff)) do
                   begin
                        readln(ff,ffs);
                        writeln(f,ffs);
                   end;
             CloseFile(f); CloseFile(ff);
             frn:='fr-1.exe';
             Form5.Bdan.Enabled:=True;
             Form5.N3.Enabled:=True;
             StateLine:=2;
        end;

3:        Begin
             Ustanovka:='Омский НПЗ (Л-35-11/1000)           ';
             AssignFile(f,PathS+'\'+'l90');rewrite(f);
             AssignFile(ff,PathS+'\'+'l90.4');reset(ff);
             FrPath:=PathS+'\Omsk\Fr';
             PathU:=PathS+'\Omsk';
             while not(eof(ff)) do
                   begin
                        readln(ff,ffs);
                        writeln(f,ffs);
                   end;
             CloseFile(f); CloseFile(ff);
             frn:='fr-1.exe';
             Form5.Bdan.Enabled:=True;
             Form5.N3.Enabled:=True;
             StateLine:=3;
        end;

4:        Begin
             Ustanovka:='Ангарский НПЗ (Л-35-11/1000)        ';
             AssignFile(f,PathS+'\'+'l90');rewrite(f);
             AssignFile(ff,PathS+'\'+'l90.5');reset(ff);
             FrPath:=PathS+'\Angarsk\Fr';
             PathU:=PathS+'\Angarsk';
             while not(eof(ff)) do
                   begin
                        readln(ff,ffs);
                        writeln(f,ffs);
                   end;
             CloseFile(f); CloseFile(ff);
             frn:='fr-1.exe';
             Form5.Bdan.Enabled:=True;
             Form5.N3.Enabled:=True;
             StateLine:=4;
        end;

5:        Begin
             Ustanovka:='КИНЕФ (ЛЧ-35-11/1000)               ';
             AssignFile(f,PathS+'\'+'l90');rewrite(f);
             AssignFile(ff,PathS+'\'+'l90.6');reset(ff);
             FrPath:=PathS+'\Kinef\Lch-1000\Fr';
             PathU:=PathS+'\Kinef\Lch-1000';
             while not(eof(ff)) do
                   begin
                        readln(ff,ffs);
                        writeln(f,ffs);
                   end;
             CloseFile(f); CloseFile(ff);
             frn:='fr-1.exe';
             Form5.Bdan.Enabled:=True;
             Form5.N3.Enabled:=True;
             StateLine:=5;
        end;

6:        Begin
             Ustanovka:='КИНЕФ (ЛЧ-35-11/600)                ';
             AssignFile(f,PathS+'\'+'l90');rewrite(f);
             AssignFile(ff,PathS+'\'+'l90.7');reset(ff);
             FrPath:=PathS+'\Kinef\Lch-600\Fr';
             PathU:=PathS+'\Kinef\Lch-600';
             while not(eof(ff)) do
                   begin
                        readln(ff,ffs);
                        writeln(f,ffs);
                   end;
             CloseFile(f); CloseFile(ff);
             frn:='fr-1.exe';
             Form5.Bdan.Enabled:=True;
             Form5.N3.Enabled:=True;
             StateLine:=6;
        end;

7:        Begin
             Ustanovka:='КИНЕФ (Л-35-11/600)                 ';
             AssignFile(f,PathS+'\'+'l90');rewrite(f);
             AssignFile(ff,PathS+'\'+'l90.8');reset(ff);
             FrPath:=PathS+'\Kinef\L-600\Fr';
             PathU:=PathS+'\Kinef\L-600';
             while not(eof(ff)) do
                   begin
                        readln(ff,ffs);
                        writeln(f,ffs);
                   end;
             CloseFile(f); CloseFile(ff);
             frn:='fr-1.exe';
             Form5.Bdan.Enabled:=True;
             Form5.N3.Enabled:=True;
             StateLine:=7;
        end;

8:        Begin
             Ustanovka:='КИНЕФ (ЛГ-35-8/300Б)                ';
             AssignFile(f,PathS+'\'+'l90');rewrite(f);
             AssignFile(ff,PathS+'\'+'l90.9');reset(ff);
             FrPath:=PathS+'\Kinef\Lg\Fr';
             PathU:=PathS+'\Kinef\Lg';
             while not(eof(ff)) do
                   begin
                        readln(ff,ffs);
                        writeln(f,ffs);
                   end;
             CloseFile(f); CloseFile(ff);
             frn:='fr.exe';
             Form5.Bdan.Enabled:=True;
             Form5.N3.Enabled:=True;
        end;

9:        Begin
             Ustanovka:='Сургутский ЗСК (ЛКС-35-64/1000)';
             AssignFile(f,PathS+'\'+'l90');rewrite(f);
             AssignFile(ff,PathS+'\'+'l90.10');reset(ff);
             FrPath:=PathS+'\Surgut\LKS-1000\Fr';
             PathU:=PathS+'\Surgut\LKS-1000';
             while not(eof(ff)) do
                   begin
                        readln(ff,ffs);
                        writeln(f,ffs);
                   end;
             CloseFile(f); CloseFile(ff);
             frn:='fr-1.exe';
             Form5.Bdan.Enabled:=True;
             Form5.N3.Enabled:=True;
             StateLine:=8;
        end;

10:        Begin
             Ustanovka:='Новокуйбышевский НПЗ (Л-35-6)       ';
             AssignFile(f,PathS+'\'+'l90');rewrite(f);
             AssignFile(ff,PathS+'\'+'l90.11');reset(ff);
             FrPath:=PathS+'\Samara\Л-35-6\Fr';
             PathU:=PathS+'\Samara\Л-35-6';
             while not(eof(ff)) do
                   begin
                        readln(ff,ffs);
                        writeln(f,ffs);
                   end;
             CloseFile(f); CloseFile(ff);
             frn:='fr.exe';
             Form5.Bdan.Enabled:=True;
             Form5.N3.Enabled:=True;
             StateLine:=9;
        end;
11:        Begin
             Ustanovka:='Комсомольский НПЗ (Л-35-11/450К)';
             AssignFile(f,PathS+'\'+'l90');rewrite(f);
             AssignFile(ff,PathS+'\'+'l90.12');reset(ff);
             FrPath:=PathS+'\Komsomol\Fr';
             PathU:=PathS+'\Komsomol';
             while not(eof(ff)) do
                   begin
                        readln(ff,ffs);
                        writeln(f,ffs);
                   end;
             CloseFile(f); CloseFile(ff);
             frn:='fr.exe';
             Form5.Bdan.Enabled:=True;
             Form5.N3.Enabled:=True;
             StateLine:=10;
        end;
12:        Begin
             Ustanovka:='Новокуйбышевский НПЗ (Л-35-11)       ';
             AssignFile(f,PathS+'\'+'l90');rewrite(f);
             AssignFile(ff,PathS+'\'+'l90.13');reset(ff);
             FrPath:=PathS+'\Samara\Л-35-11\Fr';
             PathU:=PathS+'\Samara\Л-35-11';
             while not(eof(ff)) do
                   begin
                        readln(ff,ffs);
                        writeln(f,ffs);
                   end;
             CloseFile(f); CloseFile(ff);
             frn:='fr.exe';
             Form5.Bdan.Enabled:=True;
             Form5.N3.Enabled:=True;
             StateLine:=11;
        end;

13:        Begin
             Ustanovka:='Рязанский НПЗ (Л-35-6/300)          ';
             AssignFile(f,PathS+'\'+'l90');rewrite(f);
             AssignFile(ff,PathS+'\'+'l90.14');reset(ff);
             FrPath:=PathS+'\Рязань\Л-35-6-300\Fr';
             PathU:=PathS+'\Рязань\Л-35-6-300';
             while not(eof(ff)) do
                   begin
                        readln(ff,ffs);
                        writeln(f,ffs);
                   end;
             CloseFile(f); CloseFile(ff);
             frn:='fr-1.exe';
             Form5.Bdan.Enabled:=True;
             Form5.N3.Enabled:=True;
        end;

14:        Begin
             Ustanovka:='Рязанский НПЗ (ЛЧ-35-11/600)        ';
             AssignFile(f,PathS+'\'+'l90');rewrite(f);
             AssignFile(ff,PathS+'\'+'l90.15');reset(ff);
             FrPath:=PathS+'\Рязань\ЛЧ-35-11-600\Fr';
             PathU:=PathS+'\Рязань\ЛЧ-35-11-600';
             while not(eof(ff)) do
                   begin
                        readln(ff,ffs);
                        writeln(f,ffs);
                   end;
             CloseFile(f); CloseFile(ff);
             frn:='fr-1.exe';
             Form5.Bdan.Enabled:=True;
             Form5.N3.Enabled:=True;
             StateLine:=12;
        end;
15:        Begin
             Ustanovka:='Ангарский НПЗ (Платформинг)        ';
             AssignFile(f,PathS+'\'+'l90');rewrite(f);
             AssignFile(ff,PathS+'\'+'l90.16');reset(ff);
             FrPath:=PathS+'\Angarsk-Pl\Fr';
             PathU:=PathS+'\Angarsk-Pl';
             while not(eof(ff)) do
                   begin
                        readln(ff,ffs);
                        writeln(f,ffs);
                   end;
             CloseFile(f); CloseFile(ff);
             frn:='fr-1.exe';
             Form5.Bdan.Enabled:=True;
             Form5.N3.Enabled:=True;
        end;
16:        Begin
             Ustanovka:='Сургутский ЗСК           ';
             AssignFile(f,PathS+'\'+'l90');rewrite(f);
             AssignFile(ff,PathS+'\'+'l90.17');reset(ff);
             FrPath:=PathS+'\Surgut\Petrofak\Fr';
             PathU:=PathS+'\Surgut\Petrofak';
             while not(eof(ff)) do
                   begin
                        readln(ff,ffs);
                        writeln(f,ffs);
                   end;
             CloseFile(f); CloseFile(ff);
             frn:='fr.exe';
             Form5.Bdan.Enabled:=True;
             Form5.N3.Enabled:=True;
             StateLine:=13;
        end;
end;
PathIsl:=PathU+'\Issl';
st2:=PathS+'\kfr1';
st1:=st2+'.'+intToStr(RadioGroup1.ItemIndex+1);
FR:=StrAlloc(length(st1)+1);
FT:=StrAlloc(length(st2)+1);
FR:=StrPCopy(FR,st1);
FT:=StrPCopy(FT,st2);
CopyFile(FR,FT,false);
If not DirectoryExists(FrPath) then ForceDirectories(FrPath);
If not DirectoryExists(PathIsl) then ForceDirectories(PathIsl);
AssignFile(l90,PathS+'\l90');
Reset(l90);
Read(l90,s);
i:=0;
ColReakt:=0;
Repeat
       Val(s[43+i],ColReakt,Code);
       Inc(i);
Until Code=0;
If ColReakt<3 then ColReakt:=3;
CloseFile(l90);
end;



end.
