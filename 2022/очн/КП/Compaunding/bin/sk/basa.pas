unit basa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, StdCtrls, ComCtrls, Buttons, Unit4, ExtCtrls;

type
  Tbasadan = class(TForm)
    List: TListBox;
    Subst: TEdit;
    weight: TEdit;
    Next: TButton;
    Prob: TLabel;
    F1: TEdit;
    F2: TEdit;
    F3: TEdit;
    F4: TEdit;
    F5: TEdit;
    F6: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    F7: TEdit;
    Animate1: TAnimate;
    OpenDialog1: TOpenDialog;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Label14: TLabel;
    Sum: TLabel;
    BitBtn2: TBitBtn;
    cans: TButton;
    Sav: TSaveDialog;
    Cod: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure ListClick(Sender: TObject);
    procedure weightexit(Sender: TObject);
    procedure NextClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SubstChange(Sender: TObject);
    procedure SubstEnter(Sender: TObject);
    procedure weightClick(Sender: TObject);
    procedure ListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure cansClick(Sender: TObject);
    procedure CodClick(Sender: TObject);
   published
    procedure OnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SubstExit(Sender: TObject);
    procedure SubstOnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure  SetCode(CP:TFontCharset);
    property ChSet:TFontCharset write SetCode default Russian_CharSet;
  private
    { Private declarations }
    procedure TexMake;
    function index(sub: string): integer;
    function norm(s:string):string;
    function MakeSir(FN:string):string;
    function MakeSurgut(FN:string):string;

  public
    { Public declarations }
  end;

var
  basadan: Tbasadan;
  Newb:boolean;
  Putb,DataOt:string;
  OldValue,summa:Double;
  Tex:array[1..3,6..7] of double;
  Gvsg,Gbp,Gk1,Gk2,G,Ps,Pk,Pbp,Gs:double;
  x1,x2:double;
  x3:double;
  x4:double;
  x5:double;
  w:double;     Way:word=1;
Const ProbName:array[1..3] of string[15]=('Сырьё','Катализат','Боковой погон');
      FileRas:array[1..3] of string[4]=('.SIR','.KAT','.BOK');
      
      SubstName:array[1..5] of string=('Par','IPar','Naf5','Naf6','Arom');
      ResName:array[3..13] of string=('.3','.4','.5','.6','.7','.8','.9','.10','.11','.12','.13');
implementation

uses Unit5, basa_tv,dbtables, Unitb2, Unitb3, Unitb4, ChekSub, Unit30;

{$R *.DFM}

function Tbasadan.MakeSurgut;
var F,SF:TextFile;
    s,wiegth,sub:string;
    sir:string;
    i,long:word;
begin
AssignFile(F,FN);
FN:=ChangeFileExt(FN,FileRas[way]);
AssignFile(SF,FN);
Reset(F);
Rewrite(SF);
Repeat
Readln(F,s);
until pos('Components Listed in Chromatographic Order',s)>0;
ReadLn(F);
ReadLn(F);
While not eof(F) do
begin
ReadLn(F,s);
wiegth:=copy(s,55,6);
sub:=copy(s,20,54);
Setlength(sir,49);
sir:='                                           00.000';
For i:=1 to 35 do sir[i]:=sub[i];
For i:=1 to 6 do sir[43+i]:=wiegth[i];
WriteLn(SF,sir);
end;
CloseFile(F);
CloseFile(SF);
Result:=FN;
end;

function Tbasadan.MakeSir;
var F,SF:TextFile;
    s,wiegth,sub:string;
    sir:string;
    i,long:word;
begin
AssignFile(F,FN);
FN:=ChangeFileExt(FN,FileRas[way]);
AssignFile(SF,FN);
Reset(F);
Rewrite(SF);
Repeat
Readln(F,s);
until pos('************',s)>0;
ReadLn(F);
ReadLn(F,s);
setlength(sir,49);
Repeat
long:=length(s);
wiegth:=copy(s,22,6);
sub:=copy(s,29,long-28);
If length(sub)>43 then while pos('’ђЂЌ‘',sub)>0 do delete(sub,pos('’ђЂЌ‘',sub)+1,4);
sir:='                                           00.000';
For i:=1 to length(sub) do sir[i]:=sub[i];
For i:=1 to 6 do sir[43+i]:=wiegth[i];
WriteLn(SF,sir);
ReadLn(F,s);
until pos('--------------------',s)>0;
CloseFile(F);
CloseFile(SF);
Result:=FN;
Cod.ItemIndex:=1;
Cod.OnClick(nil);
end;

procedure Tbasadan.FormShow(Sender: TObject);
Var   CurS:string;
      Sub:string[42];
      i,j:word;
      F:TextFile;
begin
List.Items.Clear;
{For I:=3 to 13 do
  For J:=1 to 5 do
   begin
   AssignFile(F,PathS+'\Basa\'+SubstName[j]+ResName[i]);
   Reset(F);
   While not eof(F) do
    begin
    ReadLn(F,Sub);
    CurS:=Sub+' 00.000';
    List.Items.Add(CurS);
    end;
   CloseFile(F);
   end;     }
   AssignFile(F,PathS+'\Basa\shablon.'+inttostr(Form4.RadioGroup1.ItemIndex+1));
   Reset(F);
   While not eof(F) do
    begin
    ReadLn(F,Sub);
    CurS:=Sub+' 00.000';
    List.Items.Add(CurS);
    end;
   CloseFile(F);
summa:=0;
Sum.Font.Color:=ClRed;
Sum.Caption:='00,000';
//Next.Enabled:=False;
//List.Items.LoadFromFile(PathS+'\Basa'+FileRas[Way]);
List.ItemIndex:=0;
List.OnDblClick(Sender);
end;

procedure Tbasadan.ListClick(Sender: TObject);
var s:string;
begin
Subst.Text:=copy(List.Items.Strings[list.ItemIndex],0,43);
s:=copy(List.Items.Strings[list.ItemIndex],44,6);
Weight.Text:=s;
OldValue:=StrToFl(s);
weight.SetFocus;
end;

procedure Tbasadan.weightexit(Sender: TObject);
Var s:string[49];
    w:string;
begin
s:=List.Items.Strings[list.ItemIndex];
w:=norm(weight.Text);
insert(w,s,44);
List.Items.Strings[list.ItemIndex]:=s;
summa:=summa+StrToFl(w)-OldValue;
If abs(Summa-100)>1 then
 begin
 Sum.Font.Color:=ClRed;
// Next.Enabled:=False;
 end
else
 begin
 Sum.Font.Color:=ClBlack;
// Next.Enabled:=True;
 end;
Sum.Caption:=FloatToStrF(summa,fffixed,5,3);
{if list.ItemIndex<list.Items.Count then
 begin
 list.ItemIndex:=list.ItemIndex+1;
 Subst.Text:=copy(List.Items.Strings[list.ItemIndex],0,48);
 weight.Text:=copy(List.Items.Strings[list.ItemIndex],49,6);
 end;}
end;

procedure Tbasadan.NextClick(Sender: TObject);
begin
Button1.Click;
try
List.Items.SaveToFile(Putb+'\'+DataOt+FileRas[Way]);
{Tex[way,1]:=StrToFl(F1.Text);
Tex[way,2]:=StrToFl(F2.Text);
Tex[way,3]:=StrToFl(F3.Text);
Tex[way,4]:=StrToFl(F4.Text);
Tex[way,5]:=StrToFl(F5.Text);}
Tex[way,6]:=StrToFl(F6.Text);
Tex[way,7]:=StrToFl(F7.Text);
If Way=1 then
  begin F1.Hide;F2.Hide;F3.Hide;F4.Hide;F5.Hide;
  Label1.Hide;Label2.Hide;Label3.Hide;Label4.Hide;Label5.Hide;Label6.Hide;
  end;
inc(Way);
If Way<4 then
 begin
 If (Form4.RadioGroup1.ItemIndex in [3,9,10,11,12,16]) and (Way=3) then
  begin
  F7.Text:='0';
  Next.OnClick(Sender);
  end
 else
  begin
  Prob.Caption:=ProbName[way];
  BasaDan.OnShow(sender);
  end;
 end
else
 begin
 Way:=1;
 Animate1.show;
 Animate1.Active:=True;
 try
 TexMake;
 Form5.OpenDialog1.FileName:=Putb+'\'+DataOt+'.dan';
 Unit5.Puti:=Putb;
 Unit5.DataOtbora:=DataOt;
 Unit5.Form5.Caption:=' Установка: '+Ustanovka+'                            Дата отбора: '+DataOtbora;
 Unit30.Form30.Label9.Caption:=DataOtbora;
 finally
 begin
 Animate1.Active:=False;
 Animate1.Hide;
 Close;
 F1.Show;F2.Show;F3.Show;F4.Show;F5.Show;
 Label1.Show;Label2.Show;Label3.Show;Label4.Show;Label5.Show;Label6.Show;
 Form5.show;
 end
 end
 end;
except
showmessage('Проверте правильность ввода данных.');
end
end;

procedure Tbasadan.OnKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var s:string[49];
    w:string;
begin
Case Key of
VK_DOWN:begin
 List.SetFocus;
 list.ItemIndex:=list.ItemIndex+1;
                 end;
VK_UP:begin
 List.SetFocus;
 list.ItemIndex:=list.ItemIndex-1;
      end;
VK_RETURN: List.SetFocus;
end
end;


procedure Tbasadan.SubstExit(Sender: TObject);
Var i:Word;
    p:integer;
    s:string[49];
begin
i:=0;
Newb:=True;
P:=Index(Subst.Text);
If P=-1 then
 begin
 s:='                                                ';
 insert(Subst.text,s,1);;
 insert('00.000',s,44);
 List.Items.Add(s);
 weight.Text:='00.000';
 OldValue:=0;
 weight.SetFocus;
 list.ItemIndex:=List.Items.IndexOf(s);
 end
else
 begin
 list.ItemIndex:=p;
 List.OnDblClick(sender);
 end;
end;

procedure TBasaDan.SubstOnKeyDown;
begin
If Key=VK_RETURN then Subst.OnExit(sender);
end;

procedure TBasaDan.TexMake;
begin
gs:=Tex[1,7];
Gbp:=Tex[3,7];
Gk1:=Tex[2,7];
Tn1:=0;Tk1:=0;dT1:=0;
Tn2:=0;Tk2:=0;dT2:=0;
Tn3:=0;Tk3:=0;dT3:=0;
Tn4:=0;Tk4:=0;dT4:=0;
Ps:=Tex[1,6];
Pk:=Tex[2,6];
Pbp:=Tex[3,6];
x5:=0;
InitPath:=PathS+'\Basa';
BasaMake;
end;

procedure Tbasadan.BitBtn1Click(Sender: TObject);
Var s,FN:string;
    tab,i:word;

begin
OpenDialog1.InitialDir:=Putb;
OpenDialog1.FileName:='';
OpenDialog1.Filter:=ProbName[way]+'|*'+FileRas[way];
If (Form4.RadioGroup1.ItemIndex in [10,11,12]) then OpenDialog1.Filter:='Таблица УВ состава|*.txt|'+ProbName[way]+'|*'+FileRas[way];
OpenDialog1.Filter:=OpenDialog1.Filter+'|Detailed Hydrocarbon Analysis|*.dha|';

if Sender=basadan.Next then
  OpenDialog1.FileName:=PathS+'\Komsomol\01-09-09\01-09-09.SIR'
else
   OpenDialog1.FileName:=PathS+'\Komsomol\01-09-09\01-09-09.KAT';
 begin
 FN:=OpenDialog1.FileName;
 If AnsiUpperCase(ExtractFileExt(FN))='.TXT' then FN:=MakeSir(FN);
 If AnsiUpperCase(ExtractFileExt(FN))='.DHA' then FN:=MakeSurgut(FN);
 List.Items.BeginUpdate;
 List.Items.Clear;
 List.Items.LoadFromFile(FN);
 I:=0;
 Repeat
 tab:=pos(#9,List.Items.Strings[i]);
 if tab>0 then
  begin
  s:=List.Items.Strings[i];
  delete(s,tab,1);
  while length(s)<49 do insert(' ',s,tab);
  List.Items.Strings[i]:=s;
  end;
 If length(List.Items.Strings[i])<48 then List.Items.Delete(i)
  else inc(i);
 Until i=List.Items.Count;
 If length(List.Items.Strings[0])>49 then
  begin
  For i:=0 to List.Items.Count-1 do
   begin
   S:=List.Items.Strings[i];
   delete(s,1,5);
   List.Items.Strings[i]:=s;
   end;
  end;
summa:=0;
For i:=0 to List.Items.Count-1 do summa:=summa+StrToFl(copy(List.Items.Strings[i],44,6));
If abs(Summa-100)>1 then
 begin
 Sum.Font.Color:=ClRed;
// Next.Enabled:=False;
 end
else
 begin
 Sum.Font.Color:=ClBlack;
// Next.Enabled:=True;
 end;
Sum.Caption:=FloatToStrF(summa,fffixed,5,3);
 List.ItemIndex:=0;
 List.Items.EndUpdate;
 List.OnDblClick(sender);
 end;
end;

procedure Tbasadan.SubstChange(Sender: TObject);
var p:integer;
begin
P:=Index(Subst.Text);
if P>-1 then List.ItemIndex:=p;
end;

function Tbasadan.index(sub: string): integer;
Var p,i,f:integer;
    name:string;
begin
p:=List.Items.Count;
i:=0;
sub:=AnsiLowerCase(Sub);
f:=pos(' ',sub);
If f>1 then sub:=Copy(sub,1,f-1);
f:=0;
If sub>'' then
 Repeat
  name:=AnsiLowerCase(List.Items.Strings[i]);
  f:=pos(sub,name);
  inc(i);
 until (i=p)or(f=1);
If f=1 then Result:=i-1
else Result:=-1;
end;
function Tbasadan.norm(s:string):string;
var i:word;
begin
While pos(' ',s)>0 do delete(s,pos(' ',s),1);
if pos(',',s)>0 then s[pos(',',s)]:='.';
if pos('.',s)=0 then s:=s+'.';
if pos('.',s)>3 then delete(s,1,pos('.',s)-3);
While (pos('.',s)<3) and (pos('.',s)>0) do s:='0'+s;
If length(s)<6 then for i:=1 to 6-length(s) do S:=S+'0';
try
strTofl(s);
except
s:='00.000';
end;
result:=s;
end;
procedure Tbasadan.SubstEnter(Sender: TObject);
begin
Subst.SelectAll;
end;

procedure Tbasadan.weightClick(Sender: TObject);
begin
Weight.SelectAll
end;

procedure Tbasadan.ListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var s:string[49];
    w:string;
begin
Case Key of
VK_RETURN:begin
  Subst.Text:=copy(List.Items.Strings[list.ItemIndex],0,43);
  weight.Text:=copy(List.Items.Strings[list.ItemIndex],44,6);
  OldValue:=StrToFl(weight.Text);
  weight.SetFocus;
          end;
end
end;

procedure Tbasadan.Button1Click(Sender: TObject);
var i:word;
begin
i:=0;
List.Items.BeginUpdate;
Repeat
if strToFl(copy(List.Items.Strings[i],44,6))=0 then List.Items.Delete(i)
else inc(i);
until i=List.Items.Count;
List.Items.EndUpdate;
end;

procedure Tbasadan.SaveClick(Sender: TObject);
var Name:string;
begin
Sav.InitialDir:=Putb;
Sav.Filter:=ProbName[way]+'|*'+FileRas[way];
Sav.FileName:=Putb+'\'+DataOt+FileRas[Way];
//List.Items.SaveToFile(Putb+'\'+DataOt+FileRas[Way]);
If Sav.Execute then
 begin
 Name:=Sav.FileName;
 If Pos('.',Name)=0 then Name:=Name+FileRas[way];
 List.Items.SaveToFile(Name);
 end;
end;

procedure Tbasadan.cansClick(Sender: TObject);
begin
Close;
F1.Show;F2.Show;F3.Show;F4.Show;F5.Show;
Label1.Show;Label2.Show;Label3.Show;Label4.Show;Label5.Show;Label6.Show;
Form5.Show;
end;

procedure Tbasadan.CodClick(Sender: TObject);
begin
Case Cod.ItemIndex of
0:ChSet:=Russian_CharSet;
1:ChSet:=Oem_CharSet;
end;
end;

procedure TBasaDan.SetCode;
begin
Subst.Font.Charset:=CP;
List.Items.BeginUpdate;
List.Font.Charset:=CP;
List.Items.EndUpdate;
Formb2.Label2.Font.Charset:=CP;
Formb3.Label2.Font.Charset:=CP;
Formb4.Label4.Font.Charset:=CP;
AddSub.ima.Font.Charset:=CP;
end;

end.
