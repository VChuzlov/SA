unit URasDisAkt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, FileCtrl, makeres, Menus, ComCtrls, ExtCtrls;
  
type PDiz=^Diz;
     Diz=record
     Data:TDate;
     Diak:double;
          end;

  TRasDisAkt = class(TForm)
    GroupBox1: TGroupBox;
    DLB: TDirectoryListBox;
    Label1: TLabel;
    FL: TFileListBox;
    Label2: TLabel;
    LFB: TListBox;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Lp: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    SkFileChouse: TLabel;
    Deakt: TLabel;
    Button3: TButton;
    Button4: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowDizakt(Num:integer);
  end;

var
  RasDisAkt: TRasDisAkt;
  da:double;
implementation

uses Unit5, res, Unit8, Unit4, reportform, adv, Unit11, Unit30, Me_As,
  Unit12, Unit1, ToGraph, test;



{$R *.DFM}

Function ViDay(M:Word):Word;
begin
CAse M OF 
 1:ViDay:=31;
 2:ViDay:=59;
 3:ViDay:=90;
 4:ViDay:=120;
 5:ViDay:=151;
 6:ViDay:=181;
 7:ViDay:=212;
 8:ViDay:=243;
 9:ViDay:=273;
 10:ViDay:=304;
 11:ViDay:=334;
 12:ViDay:=365;
end;
end;

Procedure DeltaData(Dat1,Dat2:TDateTime; var DD:word);
Var 
D1,d2,m1,m2,y1,y2,DM:Word;
T1,t2,Dt:Word;
begin
DecodeDate(Dat1,Y1,m1,d1);
DecodeDate(Dat2,Y2,m2,d2);
If Y2=Y1 then begin
T1:=ViDAy(M1);
T2:=ViDAy(M2);
Dt:=ABS(t2-t1)+Abs(d2-D1);
END else begin
if Abs(Y2-Y1)>1 then Dt:=365*Abs(Y2-Y1);
If Y1>Y2 Then begin
DM:=Y1; Y1:=Y2; Y2:=DM; 
DM:=M1; m1:=m2; m2:=DM; 
DM:=D1; d1:=d2; d2:=DM; 
end; 
DT:=365-ViDAy(M1)-D1+ViDay(M2)+D2;
end;
DD:=Dt;
end;

procedure TRasDisAkt.BitBtn1Click(Sender: TObject);
var s1:string;
begin
IF FL.FileName>'' Then   begin
IF LFB.Items.Count<2 Then
If LFB.Items.Count=1 then begin
If LFB.Items.Strings[0]<>FL.FileName then
LFB.Items.Add(FL.FileName);
end else LFB.Items.Add(FL.FileName);
If LFB.Items.Count=1 then
begin
S1:=ExtractFileName(LFB.Items.Strings[0]);
s1:=ChangeFileExt(s1,'.sk');
if FileExists(FL.Directory+'\'+s1) then
SKFileChouse.Caption:=FL.Directory+'\'+s1
else
begin
ShowMessage('Ќеобходим файла с данными по составу сырь€ и катализата:'+#13+FL.Directory+'\'+s1);
LFB.items.clear;
end;
end;
end;
end;

procedure TRasDisAkt.BitBtn2Click(Sender: TObject);
begin
Case LFB.ItemIndex Of
0:LFB.Items.Delete(0);
1:LFB.Items.Delete(1);
end;
end;

Function Ras(dan,sk:String):ResT;
var
   stroka:string;
   Par:string;
   i:integer;
   aa:ResT;
   ListRez:TstringList;     {—читывавм файл "REZ"}

   s1:string [58];          {—трока при считывании
                            концентраций ароматики из "REZ"}
   s2:string [28];          {—трока при считывании
                            подачи хлорорганики из "REZ"}
   s3:string [38];          {—трока при считывании
                            уровн€ активности катализатора из "REZ"}
   s4:string [25];          {—трока при считывании
                            хлора на катализаторе из "REZ"}
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
begin

  AssignFile(f,sk);
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
     AssignFile(f,dan);
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
     While Pos('-',DaRe)>0 do DaRe[Pos('-',DaRe)]:='.';
     CloseFile(f);

     {¬ызываем окно с технологическими услови€ми
      и вносим необходимые изменени€}

     Unit8.Form8.DateTimePicker1.Date:=StrToDate(DaOt);
     Unit8.Form8.DateTimePicker2.Date:=StrToDate(DaRe);
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
{     Form8.Label27.Visible:=False;
     Form8.koks1.Visible:=False;
     Form8.koks2.Visible:=False;
     Form8.koks3.Visible:=False;
     Form8.koks1.Text:='0';
     Form8.koks2.Text:='0';
     Form8.koks3.Text:='0';}
     Unit8.Form8.Edit25.Text:=Par;
     Unit8.Form8.Button1.Hide;
     Unit8.Form8.Button2.Hide;
     Unit8.Form8.Button3.Show;
     Form8.ShowModal;
     Repeat
              Unit5.Form5.ProgressBar1.Show;
              Unit5.Form5.ProgressBar1.Position:=20;
              Unit5.Form5.Label1.Caption:=' Please !      Wait a moment.             »дет расчет.';
              Unit5.Form5.Refresh;

             {—оздаем резервный файл с
              измененными технологическими услови€ми}
             AssignFile(f,PutiProgram+'\Ver.bak');
             ReWrite(f);
             DaOt:=FormatDateTime(ShortDat,Unit8.Form8.DateTimePicker1.Date);
             DaRe:=FormatDateTime(ShortDat,Unit8.Form8.DateTimePicker2.Date);
             Val(Unit8.Form8.Edit1.Text, Rs, Code);
             Val(Unit8.Form8.Edit2.Text, Rg, Code);
             Val(Unit8.Form8.Edit3.Text, P2, Code);
             Val(Unit8.Form8.Edit4.Text, P3, Code);
             Val(Unit8.Form8.Edit5.Text, P4, Code);
             Val(Unit8.Form8.Edit6.Text, P5, Code);
             Val(Unit8.Form8.Edit7.Text, T2, Code);
             Val(Unit8.Form8.Edit8.Text, T3, Code);
             Val(Unit8.Form8.Edit9.Text, T4, Code);
             Val(Unit8.Form8.Edit10.Text, T5, Code);
             Val(Unit8.Form8.Edit11.Text, dT2, Code);
             Val(Unit8.Form8.Edit12.Text, dT3, Code);
             Val(Unit8.Form8.Edit13.Text, dT4, Code);
             Val(Unit8.Form8.Edit14.Text, dT5, Code);
             C1:=StrToFl(Unit8.Form8.Edit15.Text);
             C2:=StrToFl(Unit8.Form8.Edit16.Text);
             C3:=StrToFl(Unit8.Form8.Edit17.Text);
             C4:=StrToFl(Unit8.Form8.Edit18.Text);
             C5:=StrToFl(Unit8.Form8.Edit19.Text);
             C6:=StrToFl(Unit8.Form8.Edit20.Text);
             C7:=StrToFl(Unit8.Form8.Edit21.Text);
             C8:=StrToFl(Unit8.Form8.Edit22.Text);
             C9:=StrToFl(Unit8.Form8.Edit23.Text);
             Val(Unit8.Form8.Edit24.Text, Vl, Code);
             Val(Unit8.Form8.Edit25.Text, Sera, Code);
             Val(Unit8.Form8.Edit26.Text, Vsir, Code);
             WriteLn(f,DiClor1:6:2, DiClor2:6:2, DiClor3:6:2,'       ПЃ§†з† §®еЂЃанв†≠† ѓЃ а•†™вЃа†ђ (Р-202, Р-203, Р-204), аађ.');
             WriteLn(f,Akt:6:2, '      А™в®Ґ≠Ѓбвм ™†в†Ђ®І†вЃа† (гбЂЃҐ≠†п •§•≠®ж†)');
             WriteLn(f,P2:6:2,' ', P3:6:2,' ', P4:6:2,' ', P5:6:2, '      Д†ҐЂ•≠®• ѓЃ а•†™вЃа†ђ (Р-202, Р-203, Р-204, Р-205), †вђ.');
             Writeln(f,Vl:6:2,'      ВЂ†¶≠Ѓбвм ВСГ, %');
             Writeln(f,T2:6:2,' ', T3:6:2,' ', T4:6:2,' ', T5:6:2,'      Т•ђѓ•а†вга† ҐеЃ§≠†п ѓЃ а•†™вЃа†ђ (Р-202, Р-203, Р-204, Р-205), £а†§. С');
             Writeln(f,dT2:6:2,' ', dT3:6:2,' ', dT4:6:2,' ', dT5:6:2,'      П•а•ѓ†§л в•ђѓ•а†вга ѓЃ а•†™вЃа†ђ (Р-202, Р-203, Р-204, Р-205), £а†§. С');
             Writeln(f,C1:6:5,' ', C2:6:5,' ', C3:6:5,' ', C4:6:5,' ', C5:6:5,' ', C6:6:5,' ', C7:6:5,' ', C8:6:5,' ',C9:6:5,'         СЃбв†Ґ ВСГ (H2, C1, C2, C3, n-C4, i-C4, n-C5, i-C5, C6), %');
             Writeln(f,Rg:6:2,'      Р†беЃ§ ВСГ, ђ3/з†б');
             Writeln(f,Vsir:6:2,'      Д≠•© ѓЃбЂ• а•£•≠•а†ж®®');
             Writeln(f,Sera:6:2,'      С•а† Ґ £®§аЃ£•≠®І†в•');
             Writeln(f,Rs:6:2,'      Р†беЃ§ бламп, ђ3/з†б');
             Writeln(f,DaOt,'             Д†в† Ѓв°Ѓа†');
             Writeln(f,DaRe,'               Д†в† а•£•≠•а†ж®® ™†в†Ђ®І†вЃа†');
             CloseFile(f);


             { ¬ызываем программу расчета риформинга с
             резервным файлом BAK }

             Unit5.Form5.ProgressBar1.Position:=40;

             AssignFile(f,PutiProgram+'\rez');
             {$I-}
             ReSet(f);
             {$I+}

             If IOResult=0 then
                               begin
                                    CloseFile(f);
                                    Erase(f);
                               end;

             Unit5.Form5.ProgressBar1.Position:=60;
               FillChar( Si, SizeOf( Si ) , 0 );
               with Si do begin
                cb := SizeOf( Si);
                dwFlags := startf_UseShowWindow;
                wShowWindow := SW_HIDE	;
               end;
               Case Form4.RadioGroup1.ItemIndex of
               10..12: Createprocess(nil,StrPCopy(ComL,'Prob.exe Ver.bak'),nil,nil,false,Create_default_error_mode,nil,StrPCopy(DirL,PathS),si,p);
               9,16:Createprocess(nil,StrPCopy(ComL,'ss99-10.exe Ver.bak'),nil,nil,false,Create_default_error_mode,nil,StrPCopy(DirL,PathS),si,p)
               else Createprocess(nil,StrPCopy(ComL,'ss99.exe Ver.bak'),nil,nil,false,Create_default_error_mode,nil,StrPCopy(DirL,PathS),si,p);
               end;
               Waitforsingleobject(p.hProcess,infinite);

             Unit5.Form5.ProgressBar1.Position:=80;

             Unit5.Form5.ProgressBar1.Position:=85;


             Unit5.Form5.ProgressBar1.Position:=95;

             if (Unit4.Form4.RadioGroup1.ItemIndex=8) or (Unit4.Form4.RadioGroup1.ItemIndex=13) then
               begin
                    WorkStr:=TStringList.Create;
                    WorkStr.LoadFromFile(PutiProgram+'\rez');
                    WorkStr.Insert(22,'');
                    WorkStr.Insert(23,'');
                    WorkStr.Insert(62,'');
                    WorkStr.Insert(63,'');
                    WorkStr.SaveToFile(PutiProgram+'\rez');
                    WorkStr.Free;
                  end;

             Unit5.Form5.ProgressBar1.Position:=100;


             Form5.Label1.Caption:='';
             Form5.ProgressBar1.Hide;
             {Unit5.Form5.Update;}

             Frep.Rep.Font.Charset:=OEM_CHARSET;
             Frep.Rep.Font.Name:='Terminal';
             Frep.Rep.Font.Size:=10;
             Frep.Rep.Lines.LoadFromFile(PutiProgram+'\rez');
             //Unit10.Form10.ShowModal;
             FRep.ShowModal;
             Frep.Rep.Font.Name:='Times New Roman';
             Frep.Rep.Font.Charset:=Russian_CHARSET;
             Unit5.Form5.Enabled:=True;
             aa:=MakeResFile(PutiProgram+'\rez');
             CeStr:=FloatToStrF(aa.Arom[2,11],fffixed,5,3);
             CrStr:=FloatToStrF(aa.Arom[1,11],fffixed,5,3);
             CLKat1Str:=FloatToStrF(aa.ClKat[1],fffixed,5,3);
             CLKat2Str:=FloatToStrF(aa.ClKat[2],fffixed,5,3);
             CLKat3Str:=FloatToStrF(aa.ClKat[3],fffixed,5,3);

             AssignFile(f,PutiProgram+'\ver.bak');
             ReSet(f);
             Readln(f,CL1,CL2,CL3);
             Readln(f,Ak);
             CloseFile(f);

             Str(CL1:7:3,CL1Str);
             Str(CL2:7:3,CL2Str);
             Str(CL3:7:3,CL3Str);
             Str(Ak:7:3,AkStr);

             Unit11.Form11.Label9.Caption:=CeStr;
             Unit11.Form11.Label10.Caption:=CrStr;
             Unit11.Form11.Label14.Caption:=CLKat1Str;
             Unit11.Form11.Label15.Caption:=CLKat2Str;
             Unit11.Form11.Label16.Caption:=CLKat3Str;

             Unit11.Form11.Edit1.Text:=CL1Str;
             Unit11.Form11.Edit2.Text:=CL2Str;
             Unit11.Form11.Edit3.Text:=CL3Str;
             Unit11.Form11.Edit4.Text:=AkStr;

             Unit11.Form11.BitBtn2.Enabled:=False;

             ResForm11:=Form11.ShowModal;

             Val(Unit11.Form11.Edit1.Text,DiClor1,Code);
             Val(Unit11.Form11.Edit2.Text,DiClor2,Code);
             Val(Unit11.Form11.Edit3.Text,DiClor3,Code);
             Val(Unit11.Form11.Edit4.Text,Akt,Code);
     Until ResForm11<>mrOK;
Result:=aa;

end;






procedure TRasDisAkt.Button2Click(Sender: TObject);
begin
Form5.Visible:=True;
Form5.Enabled:=True;
end;

procedure TRasDisAkt.Button1Click(Sender: TObject);
var 
i:word;
res:array[0..1] of ResT;
vper,vk:double;
f:textFile;
begin
If (LFB.Items.Count<2) or (SkFileChouse.Caption='') then exit;
For i:=0 to 1 do
res[i]:=Ras(LFB.Items[i],SkFileChouse.Caption);
If res[1].Data>res[0].Data then Lp.Caption:='ѕериод с '+res[0].DataS+' по '+res[1].DataS
else Lp.Caption:='ѕериод с '+res[1].DataS+' по '+res[0].DataS;
If res[1].Pererab<>res[0].Pererab then
begin
vper:=(res[1].Pererab-res[0].Pererab);
If abs(vper)<1000 then vper:=vper*res[1].GSir*24*0.7;
AssignFile(f,PathS+'\l90');
reset(f);
For i:=1 to 6 do readln(f);
Readln(f,vk);
closefile(f);
da:=(res[0].akt-res[1].akt)*100/vper*vk;
Deakt.Caption:='ƒезактиваци€ = '+floatTostrF(da,fffixed,9,4)+' град./(тонн сыр./кг кат.)';
button3.Enabled:=True;
end;
end;

procedure TRasDisAkt.ShowDizakt;
var F:file of Diz;
    Date:TDate;
    DatesL:TList;
    i:word;
    DatDiz:Diz;
    dizName:string;
begin
dizName:=PathS+'\dizakt.'+intToStr(Num);
If FileExists(dizName) then
begin
 assignFile(f,dizName);
 reset(f);
 Graph.Series2.Clear;
 While not eof(f) do
  begin
  read(f,DatDiz);
  Graph.Series2.AddY(DatDiz.Diak,DateToStr(DatDiz.Data));
  end;
 closefile(f);
 Graph.GrList.Visible:=False;
 Graph.Label1.Visible:=False;
 Graph.Chart1.Title.Text.Text:='ƒезактиваци€, град/(тонн сыр./тонн кат.)';
 Graph.ShowModal;
 Graph.GrList.Visible:=True;
 Graph.Label1.Visible:=True;
end;
end;

procedure TRasDisAkt.Button3Click(Sender: TObject);
var F:file of Diz;
    Date:TDate;
    DatesL:TList;
    i:word;
    NewD,TDiz:PDiz;
    dizName:string;
begin
Application.CreateForm(TToGr,ToGr);
If ToGr.ShowModal=MrOk then
begin
new(NewD);
NewD^.Data:=strToDate(ToGr.dt.Text);
newD^.Diak:=da;
DatesL:=TList.Create;
dizName:=PathS+'\dizakt.'+intToStr(Form4.RadioGroup1.ItemIndex);
If FileExists(dizName) then
begin
 assignFile(f,dizName);
 reset(f);
 While not eof(f) do
  begin
  New(TDiz);
  DatesL.Add(Tdiz);
  read(f,TDiz^);
  end;
 closefile(f);
 For i:=0 to pred(DatesL.Count) do
  begin
  TDiz:=datesL.Items[i];
  If TDiz^.Data>=NewD^.Data then
  begin
  If TDiz^.Data=NewD^.Data then
   begin
   TDiz^.Diak:=NewD^.Diak;
   dispose(NewD);
   end
  else
   DatesL.Insert(i,NewD);
  break;
  end;
  if i=pred(DatesL.Count) then datesL.Add(NewD);
  end;
 end
else datesL.Add(NewD);
assignFile(f,dizName);
rewrite(f);
Graph.Series2.Clear;
for i:=0 to pred(DatesL.Count) do
 begin
 TDiz:=DatesL.Items[i];
 write(f,TDiz^);
 Graph.Series2.AddY(TDiz^.Diak,DateToStr(TDiz^.Data));
 end;
closefile(f);
Graph.GrList.Visible:=False;
Graph.Label1.Visible:=False;
Graph.Chart1.Title.Text.Text:='ƒезактиваци€, град./(тонн сыр./тонн кат.)';
Graph.ShowModal;
Graph.GrList.Visible:=True;
Graph.Label1.Visible:=True;
DatesL.Free;
ToGr.free;
end;
end;

procedure TRasDisAkt.Button4Click(Sender: TObject);
begin
If MessageDlg('¬ы уверены, что хотите очистить график дезактивации на текущей установке?',mtWarning,[mbYes,mbNo],0)=mrYes then
begin
If FileExists(PathS+'\dizakt.'+intToStr(Form4.RadioGroup1.ItemIndex)) then
If not DeleteFile(PathS+'\dizakt.'+intToStr(Form4.RadioGroup1.ItemIndex)) then
ShowMessage('Ќе могу удалить файл: '+PathS+'\dizakt.'+intToStr(Form4.RadioGroup1.ItemIndex))
end;
end;

end.

