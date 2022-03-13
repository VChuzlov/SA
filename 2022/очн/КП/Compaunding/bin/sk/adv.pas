unit adv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,unit5;

type
  TAdvice = class(TForm)
    Label1: TLabel;
    AKt: TLabel;
    Label3: TLabel;
    Nm: TLabel;
    reas: TLabel;
    ad: TLabel;
    Button1: TButton;
    Label2: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
  AktivnKt,NumKreck:Double;
    { Public declarations }
  end;

var
  Advice: TAdvice;

implementation

uses Unit8, Unit9, Unit4;

{$R *.DFM}

procedure TAdvice.FormCreate(Sender: TObject);
var a,b,c,d,y:double;
    w1,g1,ro1,w2,g2,ro2,g3,gcl,w3,l,i1,i2,i3,i4,i5,i6,c1,c2,hlor,t,dt:double;
    f,f2:TextFile;
    t1,t2,t3,t4:array[1..3] of double;
    i:word;
begin
AKt.Caption:=FloatToStrF(CoolActiv.Results.akt,ffGeneral,5,4);
Nm.Caption:=FloatToStrF(CoolActiv.Results.Krek,ffGeneral,5,4);
{Wsh:=strTofl(Form8.Edit24.Text);
th:=strTofl(Form8.Edit7.Text);
ggh:=strTofl(Form8.Edit1.Text);
roh:=strTofl(Form9.Edit145.Text);}
AssignFile(F,PathS+'\clor-dan.'+IntToStr(Form4.RadioGroup1.ItemIndex+1));
Reset(F);
Readln(F,w1,g1,ro1,w2,g2,ro2,g3,gcl,w3);
read(f,a,b,c,d);
CloseFile(F);
assignfile(f2,PathS+'\l90');
Reset(F2);
try
Readln(F2);
readln(F2,t1[1],t1[2],t1[3]);
w2:=StrToFl(Form8.Edit24.Text);
t2[1]:=StrToFl(Form8.Edit7.Text);
t2[2]:=StrToFl(Form8.Edit8.Text);
t2[3]:=StrToFl(Form8.Edit9.Text);
t3[1]:=StrToFl(Form8.Edit11.Text);
t3[2]:=StrToFl(Form8.Edit12.Text);
t3[3]:=StrToFl(Form8.Edit13.Text);
t:=0;
for i:=1 to 3 do t:=t+(t2[i]-t3[i]/2)*(t1[i]/(t1[1]+t1[2]+t1[3]));
G2:=StrToFl(Form8.Edit2.Text);
g3:=g2/10;
G1:=StrToFl(Form8.Edit1.Text);
finally
CloseFile(F2);
end;
w1:=(g2*ro2*w2)/(g1*ro1);
i1:=(w1*g1*ro1);
i2:=(w2*g2*ro2);
i3:=(-g3*w2*ro2);
i4:=(gcl*g1*ro1);
i5:=(w3*g2*ro2);
i6:=(-g3*w3*ro2);
l:=2.16*(i1+i3)/(i4+i6);
hlor:=(a*l+b*t+c)*d;
y:=(0.16e-3*w2*g2)/(l*1.2*70/98);
l:=(1/d-b*t-c)/a;
   gcl:=((2.16*(i1+i3)/l)-i6)/(g1*ro1);
   c1:=g1*ro1*gcl*24*0.001/1.2*98/70;
   c2:=g1*ro1*gcl*24*0.001/1.6*152/140;
label5.caption:=' хлора, ppm. вес.  '+FloatToStrF(gcl,fffixed,5,2)+#13+'дихлорэтана, л/сут.  '+FloatToStrF(c1,fffixed,5,2)
                                +#13+'четыреххлористый углерод, л/сут.  '+FloatToStrF(c2,fffixed,5,2);
{If roh=0 then roh:=0.73;
bllh:=Wsh*ggh*roh/18;
Rclh:=(1+dh-ch-bh*th)/ah;
ggclh:=bllh/rclh;
ppmh:=ggclh*35.5/roh/ggh;
label5.caption:=FloatToStrF(ppmh,fffixed,5,2);
{If vl<50 then
  begin
  cclor:=9E-07*exp(4*ln(vl))+-0.0002*exp(3*ln(vl))+0.0117*exp(2*ln(vl))-0.1949*vl+1.079;
  label4.caption:=FloatToStrF(cclor,fffixed,3,2);
  end
  else if vl<100 then   begin
  cclor:=2.602*Ln(vl)-7.147;
  label4.caption:=FloatToStrF(cclor,fffixed,3,2);
  label4.caption:=FloatToStrF(cclor,fffixed,3,2)+'(снижение температуры на входе'+#13+'в реакторы до 480 С)'
    end
    else label4.caption:='5 (снижение температуры входе'+#13+'в реакторы до 460 С)';}
If CoolActiv.Results.akt<0.8 Then Begin
  reas.Caption:='Необходимо следить за повышением'+#13+'активности.';
  ad.Caption:='';
                     End
Else
  If CoolActiv.Results.Krek<2.5 Then Begin
    reas.Caption:='Повышенная активность обусловлена'+#13+'низкой влажностью системы';
    ad.Caption:='Рекомендуется подать воду'
                       End
  Else Begin
    reas.Caption:='Повышенная активность обусловлена'+#13+'высокими температурами';
    ad.Caption:='Рекомендуется подать хлорорганику'
       End;
end;

procedure TAdvice.Button1Click(Sender: TObject);
begin
ModalResult:=mrOk
end;

end.
