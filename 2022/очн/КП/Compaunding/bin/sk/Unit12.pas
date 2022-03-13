unit Unit12;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TForm12 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
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
    Label8: TLabel;
    Label12: TLabel;
    C1: TLabel;
    C2: TLabel;
    C3: TLabel;
    C4: TLabel;
    C5: TLabel;
    C6: TLabel;
    C7: TLabel;
    C8: TLabel;
    C9: TLabel;
    C10: TLabel;
    Button2: TButton;
    OpenC: TOpenDialog;
    Label13: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    C11: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    C12: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure DateComExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

uses Unit5, makeres;

{$R *.DFM}

procedure TForm12.Button1Click(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TForm12.DateComExit(Sender: TObject);
Var {F:TextFile;
   s1:string [58];          {Строка при считывании
                            концентраций ароматики из "REZ"}
{   s2:string [28];          {Строка при считывании
                            подачи хлорорганики из "REZ"}
{   s3:string [38];          {Строка при считывании
                            уровня активности катализатора из "REZ"}
{   s4:string [26];          {Строка при считывании
                            хлора на катализаторе из "REZ"}

{   ParS1:string[39];
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
   ParS13:string[43];

   Par1,Par2,Par3,Par4,Par5,Par6,Par7,Par8,Par9,Par10,Par11,Par12,Par13:double;

   ParS51:string [25];
   ParS52:string [12];
   Par52:real;
   
   ParP1,ParP2,ParP3,ParP4,ParP5,ParP6,ParP7,ParP8,ParP9,stroka,ParP13:string;
   NameF:string;
   i:word;
   Code:integer;    }

   DatO:string [8];
   Res:ResT;
begin
OpenC.InitialDir:=PathU;
If OpenC.Execute then
 begin
        DatO:=ExtractFileName(OpenC.FileName);

        Res:=MakeResFile(OpenC.FileName);
        {Reset(f);
        Readln(f);
        Readln(f);
        Readln(f,ParS1,Par1); {39 Активность катализатора}
        {Readln(f);Readln(f);Readln(f);
        Readln(f,ParS2,Par2); { 60 Расход сырья}
        {Readln(f,ParS3,Par3); { 38 Водорода в ВСГ }
        {Readln(f,ParS4,Par4); { 59 Число крекинга }
        {For i:=1 to 41 do Readln(f);
        ReadLn(F,stroka);
        C10.Caption:=copy(stroka,57,5);
        For i:=1 to 12 do Readln(f);
        Readln(f,ParS13); { 43 о.ч.и.}
        {If Length(ParS13)<49 then par13:=0
        else par13:=StrToFl(copy(Pars13,45,6));
        Readln(f,ParS5,Par5); { 26 Выход}
        {Readln(f);Readln(f);

        Read(f,ParS51);Readln(f,ParS52);


        Readln(f,ParS6,ParS7,ParS8,ParS9,
                 ParS10,ParS11,ParS12);

        ParS7:=' '+ParS7;
        ParS9:=' '+ParS9;
        ParS10:=' '+ParS10;
        ParS12:=' '+ParS12;
        Val(ParS7,Par6,Code);
        Val(ParS9,Par7,Code);
        Val(ParS10,Par8,Code);
        Val(ParS12,Par9,Code);
        Par6:=Par7-Par8;
        Val(ParS52,Par52,Code);

        CloseFile(f);}
{        Str(Par1:7:3,ParP1);
        Str(Par2:7:3,ParP2);
        Str(Par3:7:3,ParP3);
        Str(Par4:7:3,ParP4);
        Str(Par5:7:3,ParP5);
        Str(Par13:4:1,ParP13);
        Par6:=Par6*100;
        Str(Par6:7:3,ParP6);
        Str(Par7:7:3,ParP7);
        Str(Par8:7:3,ParP8);
        Str(Par9:7:3,ParP9);
        Str(Par52:7:1,ParS52);  }

        C1.Caption:=FloatToStrF(Res.akt,fffixed,7,3);
        C2.Caption:=FloatToStrF(Res.Krek,fffixed,7,3);
        C3.Caption:=FloatToStrF(Res.H2,fffixed,7,3);
        C4.Caption:=FloatToStrF(Res.GSir,fffixed,7,3);
        C5.Caption:=FloatToStrF((Res.Np_iP[1]-Res.Np_iP[2])*100,fffixed,7,3);
        C6.Caption:=FloatToStrF(Res.Degidr,fffixed,7,3);
        C7.Caption:=FloatToStrF(Res.Np_iP[1],fffixed,7,3);
        C8.Caption:=FloatToStrF(Res.Np_iP[2],fffixed,7,3);
        C9.Caption:=FloatToStrF(Res.Vyh,fffixed,7,3);
        C10.Caption:=FloatToStrF(Res.Sost[5,20],fffixed,7,3);
        C11.Caption:=FloatToStrF(Res.Pererab,fffixed,7,3);
        C12.Caption:=FloatToStrF(Res.Ochi,fffixed,7,3);
        Label24.Caption:=DatO;


        {

        AssignFile(f,OpenCC.FileName);
        Reset(f);
        for i:=1 to 138 do Readln(f);
        Readln(f,par101);
        Readln(f,par102);
        Readln(f,par103);
        Readln(f,par104);
        Readln(f,par105);
        Readln(f,par106);

        Val(ParS101,Par101,Code);
        Val(ParS102,Par102,Code);
        Val(ParS103,Par103,Code);
        Val(ParS104,Par104,Code);
        Val(ParS105,Par105,Code);
        Val(ParS106,Par106,Code);
        CloseFile(f);

         }
 end;

end;

end.
