unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm9 = class(TForm)
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
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Button1: TButton;
    Button2: TButton;
    SaveDialog1: TSaveDialog;
    Edit1: TEdit;
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
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    Edit29: TEdit;
    Edit30: TEdit;
    Edit31: TEdit;
    Edit32: TEdit;
    Edit33: TEdit;
    Edit34: TEdit;
    Edit35: TEdit;
    Edit36: TEdit;
    Edit37: TEdit;
    Edit38: TEdit;
    Edit39: TEdit;
    Edit40: TEdit;
    Edit41: TEdit;
    Edit42: TEdit;
    Edit43: TEdit;
    Edit44: TEdit;
    Edit45: TEdit;
    Edit46: TEdit;
    Edit47: TEdit;
    Edit48: TEdit;
    Edit49: TEdit;
    Edit50: TEdit;
    Edit51: TEdit;
    Edit52: TEdit;
    Edit53: TEdit;
    Edit54: TEdit;
    Edit55: TEdit;
    Edit56: TEdit;
    Edit57: TEdit;
    Edit58: TEdit;
    Edit59: TEdit;
    Edit60: TEdit;
    Edit61: TEdit;
    Edit62: TEdit;
    Edit63: TEdit;
    Edit64: TEdit;
    Edit65: TEdit;
    Edit66: TEdit;
    Edit67: TEdit;
    Edit68: TEdit;
    Edit69: TEdit;
    Edit70: TEdit;
    Edit71: TEdit;
    Edit72: TEdit;
    Edit73: TEdit;
    Edit74: TEdit;
    Edit75: TEdit;
    Edit76: TEdit;
    Edit77: TEdit;
    Edit78: TEdit;
    Edit79: TEdit;
    Edit80: TEdit;
    Edit81: TEdit;
    Edit82: TEdit;
    Edit83: TEdit;
    Edit84: TEdit;
    Edit85: TEdit;
    Edit86: TEdit;
    Edit87: TEdit;
    Edit88: TEdit;
    Edit89: TEdit;
    Edit90: TEdit;
    Edit91: TEdit;
    Edit92: TEdit;
    Edit93: TEdit;
    Edit94: TEdit;
    Edit95: TEdit;
    Edit96: TEdit;
    Edit97: TEdit;
    Edit98: TEdit;
    Edit99: TEdit;
    Edit100: TEdit;
    Edit101: TEdit;
    Edit102: TEdit;
    Edit103: TEdit;
    Edit104: TEdit;
    Edit105: TEdit;
    Edit106: TEdit;
    Edit107: TEdit;
    Edit108: TEdit;
    Edit109: TEdit;
    Edit110: TEdit;
    Edit111: TEdit;
    Edit112: TEdit;
    Edit113: TEdit;
    Edit114: TEdit;
    Edit115: TEdit;
    Edit116: TEdit;
    Edit117: TEdit;
    Edit118: TEdit;
    Edit119: TEdit;
    Edit120: TEdit;
    Edit121: TEdit;
    Edit122: TEdit;
    Edit123: TEdit;
    Edit124: TEdit;
    Edit125: TEdit;
    Edit126: TEdit;
    Edit127: TEdit;
    Edit128: TEdit;
    Edit129: TEdit;
    Edit130: TEdit;
    Edit131: TEdit;
    Edit132: TEdit;
    Edit133: TEdit;
    Edit134: TEdit;
    Edit135: TEdit;
    Edit136: TEdit;
    Edit137: TEdit;
    Edit138: TEdit;
    Label77: TLabel;
    Label78: TLabel;
    Edit139: TEdit;
    Label79: TLabel;
    Edit140: TEdit;
    Label81: TLabel;
    Edit142: TEdit;
    Label82: TLabel;
    Edit143: TEdit;
    Label83: TLabel;
    Edit144: TEdit;
    Label84: TLabel;
    Edit145: TEdit;
    Label80: TLabel;
    SumSir: TLabel;
    Label86: TLabel;
    SumKat: TLabel;
    Opensk: TOpenDialog;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit70Enter(Sender: TObject);
    procedure Edit70Exit(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form9: TForm9;
  SostavSir: array [1..69] of double; { Состав сырья }
  SostavKat: array [1..69] of double; { Состав катализата }
  SostavFr:array [1..6] of double;
  Matr:array[1..2,1..69] of TEdit;
  SSir,SKat:double;    Change:Boolean=False;
const 
     SostavName: array [1..69] of string[11]=
     ('Этан',
      'Пропан',
      'изо-Бутан',
      'н-Бутан',
      'изо-Пентан',
      'н-Пентан',
      '2,2-ДМБ',
      'ц-Пентан',
      '2,3-ДМБ',
      '2-МП',
      '3-МП',
      'н-Гексан',
      'МЦП',
      '2,2-ДМП',
      '2,4-ДМП',
      'Бензол',
      '2,2,3-ТМП',
      '3,3-ДМП',
      'ц-Гексан',
      '2-МГ',
      '2,3-ДМП',
      '3-МГ',
      '1,3-ДМЦП(ц)',
      '1,3-ДМЦП(т)',
      '1,2-ДМЦП(т)',
      'н-Гептан',
      '1,2-ДМЦП',
      '2,3-ДМГ',
      '1,1,3-ТМЦП',
      'МЦГ',
      '2,5-ДМГ',
      '2,4-ДМГ',
      'ЭЦП',
      '2,2,3-ТМП',
      '1,2,4-ТМЦП',
      '3,3-ДМГ',
      'Толуол',
      '1,2,3-ТМЦП',
      '2,3,4-ТМП',
      '2,3-ДМГ',
      '2-М, 3-ЭП',
      '1,1,2-ТМЦП',
      '2-МГП',
      '4-МГП',
      '3,4-ДМГ',
      '3-МГП',
      'нафт. до С8',
      'н-Октан',
      '1,2-ДМЦГ(т)',
      '1,3-ДМЦГ(т)',
      '2,3,5-ТМГ',
      '2,2-ДМГП',
      '2,4-ДМГП',
      '2,2,3-ТМГ',
      '2-М, 4-ЭГ',
      '2,6-ДМГП',
      '2,5-ДМГП',
      '3,3-ДМГП',
      'ЭЦГ+ЭБензол',
      'ТМЦП',
      '2,3,4-ТМГ',
      'п-Ксилол',
      'м-Ксилол',
      'изо-С9',
      'о-Ксилол',
      'нафт. до С9',
      'н-Нонан',
      'C9+',
      'в т. ч. Ар');
   SostavName1: array [1..6] of string[11]=
     ('НК',
      '10%',
      '50%',
      '90%',
      'КК',
      'p');
implementation

Uses Unit4, Unit5, Unit6, Unit8;

{$R *.DFM}
procedure TForm9.Button1Click(Sender: TObject);
begin
If Change then
 If MessageDlg('Сохранить изменения',mtWarning,mbOKCancel,0)=mrOk then Button2.Click;
     Unit9.Form9.Hide;
     Unit5.Form5.Enabled:=True;
     Unit5.Form5.Show;
end;
     {Формируем файл с сырьем - катализатом}
procedure TForm9.Button2Click(Sender: TObject);
var
   Ima, Put, DataOt:string;
   i:integer;

begin
     SaveDialog1.Filter:='Состав сырья и катализата (*.sk)|*.sk';
     SaveDialog1.Title:='Сохранение файла';
     SaveDialog1.DefaultExt:='sk';
     SaveDialog1.InitialDir:=PathU;
     If SaveDialog1.Execute then
        begin
             Ima:=SaveDialog1.FileName;
             gopa(Ima,Put,DataOt);

             AssignFile(f,Put+'\'+DataOt+'.sk');
             Rewrite(f);
             For i:=1 to 69 do SostavSir[i]:=StrToFl(Matr[1,i].text);
             For i:=1 to 69 do SostavKat[i]:=StrToFl(Matr[2,i].text);
             Val(Edit139.Text, SostavFr[1], Code);
             Val(Edit140.Text, SostavFr[2], Code);
             Val(Edit142.Text, SostavFr[3], Code);
             Val(Edit143.Text, SostavFr[4], Code);
             Val(Edit144.Text, SostavFr[5], Code);
             Val(Edit145.Text, SostavFr[6], Code);
             for i:=1 to 69 do WriteLn(f,i:2, '   ', SostavName[i]:11, ' ', SostavSir[i]:6:3);
             for i:=1 to 69 do WriteLn(f,i:2, '   ', SostavName[i]:11, ' ', SostavKat[i]:6:3);
             for i:=1 to 6 do  WriteLn(f,SostavName1[i]:11, '     ', SostavFr[i]:6:3);
             CloseFile(f);

        end;
Change:=False;
{     Unit9.Form9.Hide;
     Unit5.Form5.Enabled:=True;
     Unit5.Form5.Show;}
end;

procedure TForm9.Edit1Change(Sender: TObject);
begin
     With Sender as Tedit do
     begin
     Val(Text, CodeReal, Code);
     if code <> 0 then
        begin
             summac:=Text;
             delete(summac,code,1);
             Text:=summac;
        end;
     end;
Change:=True;     
end;



procedure TForm9.FormCreate(Sender: TObject);
var i:word;
begin
Matr[1,1]:=Edit1;
Matr[1,2]:=Edit2;
Matr[1,3]:=Edit3;
Matr[1,4]:=Edit4;
Matr[1,5]:=Edit5;
Matr[1,6]:=Edit6;
Matr[1,7]:=Edit7;
Matr[1,8]:=Edit8;
Matr[1,9]:=Edit9;
Matr[1,10]:=Edit10;
Matr[1,11]:=Edit11;
Matr[1,12]:=Edit12;
Matr[1,13]:=Edit13;
Matr[1,14]:=Edit14;
Matr[1,15]:=Edit15;
Matr[1,16]:=Edit16;
Matr[1,17]:=Edit17;
Matr[1,18]:=Edit18;
Matr[1,19]:=Edit19;
Matr[1,20]:=Edit20;
Matr[1,21]:=Edit21;
Matr[1,22]:=Edit22;
Matr[1,23]:=Edit23;
Matr[1,24]:=Edit24;
Matr[1,25]:=Edit25;
Matr[1,26]:=Edit26;
Matr[1,27]:=Edit27;
Matr[1,28]:=Edit28;
Matr[1,29]:=Edit29;
Matr[1,30]:=Edit30;
Matr[1,31]:=Edit31;
Matr[1,32]:=Edit32;
Matr[1,33]:=Edit33;
Matr[1,34]:=Edit34;
Matr[1,35]:=Edit35;
Matr[1,36]:=Edit36;
Matr[1,37]:=Edit37;
Matr[1,38]:=Edit38;
Matr[1,39]:=Edit39;
Matr[1,40]:=Edit40;
Matr[1,41]:=Edit41;
Matr[1,42]:=Edit42;
Matr[1,43]:=Edit43;
Matr[1,44]:=Edit44;
Matr[1,45]:=Edit45;
Matr[1,46]:=Edit46;
Matr[1,47]:=Edit47;
Matr[1,48]:=Edit48;
Matr[1,49]:=Edit49;
Matr[1,50]:=Edit50;
Matr[1,51]:=Edit51;
Matr[1,52]:=Edit52;
Matr[1,53]:=Edit53;
Matr[1,54]:=Edit54;
Matr[1,55]:=Edit55;
Matr[1,56]:=Edit56;
Matr[1,57]:=Edit57;
Matr[1,58]:=Edit58;
Matr[1,59]:=Edit59;
Matr[1,60]:=Edit60;
Matr[1,61]:=Edit61;
Matr[1,62]:=Edit62;
Matr[1,63]:=Edit63;
Matr[1,64]:=Edit64;
Matr[1,65]:=Edit65;
Matr[1,66]:=Edit66;
Matr[1,67]:=Edit67;
Matr[1,68]:=Edit68;
Matr[1,69]:=Edit69;
Matr[2,1]:=Edit70;
Matr[2,2]:=Edit71;
Matr[2,3]:=Edit72;
Matr[2,4]:=Edit73;
Matr[2,5]:=Edit74;
Matr[2,6]:=Edit75;
Matr[2,7]:=Edit76;
Matr[2,8]:=Edit77;
Matr[2,9]:=Edit78;
Matr[2,10]:=Edit79;
Matr[2,11]:=Edit80;
Matr[2,12]:=Edit81;
Matr[2,13]:=Edit82;
Matr[2,14]:=Edit83;
Matr[2,15]:=Edit84;
Matr[2,16]:=Edit85;
Matr[2,17]:=Edit86;
Matr[2,18]:=Edit87;
Matr[2,19]:=Edit88;
Matr[2,20]:=Edit89;
Matr[2,21]:=Edit90;
Matr[2,22]:=Edit91;
Matr[2,23]:=Edit92;
Matr[2,24]:=Edit93;
Matr[2,25]:=Edit94;
Matr[2,26]:=Edit95;
Matr[2,27]:=Edit96;
Matr[2,28]:=Edit97;
Matr[2,29]:=Edit98;
Matr[2,30]:=Edit99;
Matr[2,31]:=Edit100;
Matr[2,32]:=Edit101;
Matr[2,33]:=Edit102;
Matr[2,34]:=Edit103;
Matr[2,35]:=Edit104;
Matr[2,36]:=Edit105;
Matr[2,37]:=Edit106;
Matr[2,38]:=Edit107;
Matr[2,39]:=Edit108;
Matr[2,40]:=Edit109;
Matr[2,41]:=Edit110;
Matr[2,42]:=Edit111;
Matr[2,43]:=Edit112;
Matr[2,44]:=Edit113;
Matr[2,45]:=Edit114;
Matr[2,46]:=Edit115;
Matr[2,47]:=Edit116;
Matr[2,48]:=Edit117;
Matr[2,49]:=Edit118;
Matr[2,50]:=Edit119;
Matr[2,51]:=Edit120;
Matr[2,52]:=Edit121;
Matr[2,53]:=Edit122;
Matr[2,54]:=Edit123;
Matr[2,55]:=Edit124;
Matr[2,56]:=Edit125;
Matr[2,57]:=Edit126;
Matr[2,58]:=Edit127;
Matr[2,59]:=Edit128;
Matr[2,60]:=Edit129;
Matr[2,61]:=Edit130;
Matr[2,62]:=Edit131;
Matr[2,63]:=Edit132;
Matr[2,64]:=Edit133;
Matr[2,65]:=Edit134;
Matr[2,66]:=Edit135;
Matr[2,67]:=Edit136;
Matr[2,68]:=Edit137;
Matr[2,69]:=Edit138;
For i:=1 to 69 do
 begin
 Matr[1,i].Text:='00.000';
 Matr[2,i].Text:='00.000';
 end;
Edit139.Text:='0';
Edit140.Text:='0';
Edit142.Text:='0';
Edit143.Text:='0';
Edit144.Text:='0';
Edit145.Text:='0';
end;

procedure TForm9.Edit1Enter(Sender: TObject);
begin
SSir:=SSir-StrToFl((Sender as TEdit).Text);
If abs(SSir-100)>1 then SumSir.Font.Color:=ClRed
else SumSir.Font.Color:=ClBlack;
SumSir.Caption:=FloatToStrF(SSir,fffixed,6,3);
end;

procedure TForm9.FormShow(Sender: TObject);
var i:word;
begin
SSir:=0; SKat:=0;
For I:=1 to 68 do SSir:=SSir+StrToFl(Matr[1,i].Text);
For I:=1 to 68 do SKat:=SKat+StrToFl(Matr[2,i].Text);
If abs(SSir-100)>1 then SumSir.Font.Color:=ClRed
else SumSir.Font.Color:=ClBlack;
If abs(SKat-100)>1 then SumKat.Font.Color:=ClRed
else SumKat.Font.Color:=ClBlack;
SumSir.Caption:=FloatToStrF(SSir,fffixed,6,3);
SumKat.Caption:=FloatToStrF(SKat,fffixed,6,3);
end;

procedure TForm9.Edit1Exit(Sender: TObject);
begin
SSir:=SSir+StrToFl((Sender as TEdit).Text);
If abs(SSir-100)>1 then SumSir.Font.Color:=ClRed
else SumSir.Font.Color:=ClBlack;
SumSir.Caption:=FloatToStrF(SSir,fffixed,6,3);
end;

procedure TForm9.Edit70Enter(Sender: TObject);
begin
SKat:=SKat-StrToFl((Sender as TEdit).Text);
If abs(SKat-100)>1 then SumKat.Font.Color:=ClRed
else SumKat.Font.Color:=ClBlack;
SumKat.Caption:=FloatToStrF(SKat,fffixed,6,3);
end;

procedure TForm9.Edit70Exit(Sender: TObject);
begin
SKat:=SKat+StrToFl((Sender as TEdit).Text);
If abs(SKat-100)>1 then SumKat.Font.Color:=ClRed
else SumKat.Font.Color:=ClBlack;
SumKat.Caption:=FloatToStrF(SKat,fffixed,6,3);
end;

procedure TForm9.Button3Click(Sender: TObject);
var FrPar:array[1..12] of string;
    Skr:string[17];
    Par:string;
    frs:string[16];
    f:textFile;
    i:word;
begin

Opensk.InitialDir:=PathU;
If Opensk.Execute then
 begin
try
Assignfile(f,Opensk.FileName);
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


I:=0;
While not eof(f) do
begin
inc(i);
readln(f,frs,FrPar[i]);
if FrPar[i]='' then dec(i);
end;
If I>=6 Then
 begin
 Unit9.Form9.Edit139.Text:=Frpar[i-5];
 Unit9.Form9.Edit140.Text:=Frpar[i-4];
 Unit9.Form9.Edit142.Text:=Frpar[i-3];
 Unit9.Form9.Edit143.Text:=Frpar[i-2];
 Unit9.Form9.Edit144.Text:=Frpar[i-1];
 Unit9.Form9.Edit145.Text:=Frpar[i];
end
else
 begin
 Unit9.Form9.Edit139.Text:='0';
 Unit9.Form9.Edit140.Text:='0';
 Unit9.Form9.Edit142.Text:='0';
 Unit9.Form9.Edit143.Text:='0';
 Unit9.Form9.Edit144.Text:='0';
 Unit9.Form9.Edit145.Text:='0';
 end;
finally
closefile(f);
 Change:=False;
end;
Form9.DoShow;
 end;
end;

end.
