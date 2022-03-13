unit SvodTab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, ComCtrls, makeres, Clipbrd;

type
       Svo=record
       Data:String[10];
       Akt,Tin,G,H2,Num,P_N,N_I,Ar,Koks,Vt,Iz,Az,Ott,vh2:Double;
       end;
       PDataS=^DataS;
       DataS=record
       sv:svo;
       NextS:PDataS;
         end;

  Tsvod = class(TForm)
    BitBtn1: TBitBtn;
    Button2: TButton;
    SaveDialog1: TSaveDialog;
    Stab: TStringGrid;
    Label1: TLabel;
    from: TDateTimePicker;
    till: TDateTimePicker;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    Button4: TButton;
    procedure Bittn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  published
    procedure ChangeDat(Sender: TObject);
    procedure MakeTab(List:PResT);
    procedure ShowFile(NameF:string);
    function  GetPar(Res:ResT;num:word):double;
  private
    { Private declarations }
    nakopl:boolean;
    procedure Clear(DatesList:PResT);
    procedure SaveChange;
  public
    { Public declarations }
    DatCount,ParCount:word;
    Par:array[1..18,1..2] of word;
    ParList:array[1..18] of word;
    Dates,TempD,LastList:PResT;
    ChP:array[1..18] of TCheckBox;
    SFName:string;

  end;

var
  svod: Tsvod;
  Fd,Fm,Fy,Ld,Lm,Ly:integer;
  FlagF: Boolean;

implementation
  
uses Unit5, Unit4;

Var F:File;
  i,j:word;

{$R *.DFM}

procedure TSvod.ShowFile(NameF:string);
Var F:File of ResT;
    CurDat:PResT;
    Res:ResT;
    DataRead:boolean;
begin
DatCount:=0;
DataRead:=false;
try
AssignFile(F,NameF);
nakopl:=pos('.tmp',NameF)=0;
Reset(F);
new(Dates);
CurDat:=Dates;
While not eof(F) do
 begin
 Read(F,CurDat^.sv);
 inc(DatCount);
 Dataread:=true;
 If not eof(F) then
  begin
  New(CurDat^.NextS);
  CurDat:=CurDat^.NextS
  end
 else Curdat^.NextS:=nil;
 end;
from.DateTime:=Dates^.sv.Data;
till.DateTime:=CurDat^.sv.Data;
If not Dataread then 
begin
dispose(Dates);
Dates:=nil;
DatCount:=1;
end;
LastList:=Dates;
MakeTab(Dates);
SFName:=NameF;
except
Clear(Dates);
Clear(TempD);
DatCount:=0;
end;
CloseFile(F);
ShowModal;
end;

procedure TSvod.MakeTab;
var CurDat:PResT;
begin
CurDat:=List;
STab.ColCount:=DatCount+1;
STab.RowCount:=ParCount+1;
If curDat=nil then
 begin
 For i:=1 to 18 do if ParList[i]>0 then Stab.Cells[0,i]:=ChP[ParList[i]].Caption;
 Stab.Cells[0,0]:='Дата отбора';
 For j:=0 to ParCount do Stab.Cells[1,j]:='0';
 end
else
begin
For i:=1 to 18 do if ParList[i]>0 then Stab.Cells[0,i]:=ChP[ParList[i]].Caption;
Stab.Cells[0,0]:='Дата отбора';
For i:=1 to DatCount do
 begin
  Stab.Cells[i,0]:=CurDat^.sv.DataS;
  For j:=1 to ParCount do Stab.Cells[i,j]:=FloatToStrF(GetPar(CurDat^.sv,ParList[j]),fffixed,10,2);
  CurDat:=CurDat^.NextS;
 end;
end;
If (Stab.ColCount>1)and(Stab.RowCount>1) then
 begin
 STab.FixedCols:=1;
// STab.FixedRows:=1;
 end;
end;


procedure Tsvod.Bittn1Click(Sender: TObject);
begin
SaveChange;
Clear(Dates);
Clear(TempD);
Unit5.Form5.Enabled:=True;
Unit5.Form5.Show;
Svod.Hide
end;

procedure Tsvod.Clear;
Var CurS:PResT;
begin
CurS:=DatesList;
While CurS<>nil do
 begin
 DatesList:=CurS^.NextS;
 Dispose(CurS);
 CurS:=DatesList;
 end;
end;

procedure Tsvod.SaveChange;
var sf:file of ResT;
    CurS:PRest;
begin
assignFile(SF,SFName);
rewrite(SF);
CurS:=Dates;
While CurS<>nil Do Begin
Write(SF,CurS^.sv);
CurS:=CurS^.NextS
                    end;
CloseFile(SF);
end;

procedure Tsvod.Button1Click(Sender: TObject);
var NameF:string;
    NewR,CurS,PredS:PResT;
begin
If OpenDialog1.Execute then
 begin
 NameF:=OpenDialog1.FileName;
 New(NewR);
 NewR^.sv:=MakeResFile(NameF);
 If Dates=nil then
 begin
 Dates:=NewR;
 New(Dates);
 dates^.sv:=NewR^.sv;
 Dates^.NextS:=nil;
 end;
 CurS:=Dates;
 FlagF:=True;
 If CurS^.sv.Data>NewR^.sv.Data then
   begin
   NewR^.NextS:=CurS;
   Dates:=NewR;
   From.DateTime:=Dates^.sv.Data;
   inc(DatCount);
   end
 Else
  begin
  While (CurS<>nil)and FlagF do
   begin
   If CurS^.sv.Data>NewR^.sv.Data then
    begin
    PredS^.NextS:=NewR;
    NewR^.NextS:=CurS;
    inc(DatCount);
    FlagF:=False;
    end
   Else if CurS^.sv.Data=NewR^.sv.Data then
    begin
    CurS^.sv:=NewR^.sv;
    Dispose(NewR);
    FlagF:=False;
    end;
   PredS:=CurS;
   CurS:=CurS^.NextS;
   end;
  If FlagF then
   begin
   PredS^.NextS:=NewR;
   NewR^.NextS:=nil;
   inc(Datcount);
   till.DateTime:=NewR^.sv.Data;
   end;
  end;
 LastList:=Dates; 
 MakeTab(Dates); 
 end;
end;

procedure Tsvod.Button2Click(Sender: TObject);
var NameF:string;
    S:string;
    F:TextFile;
    I,J:word;
begin
SaveDialog1.InitialDir:=PathU;
If SaveDialog1.Execute then
begin
NameF:=SaveDialog1.FileName;
AssignFile(F,NameF);
Rewrite(F);
For I:=0 to STab.RowCount-1 do
 begin
  S:='';
  For J:=0 To STab.ColCount-1 do S:=S+STab.Rows[i].Strings[j]+chr(VK_TAB);
//  S:=S+STab.Rows[i].Strings[0];
  WriteLn(F,S);
 end;
CloseFile(F); 
end
end;

procedure Tsvod.ChangeDat(Sender: TObject);
Var Datf,DatT:TDateTime;
    i,It:word;
    CurS,NextS,Fr,Tl:PResT;
begin
DatF:=From.Date;
DatT:=Till.Date;
CurS:=Dates;
NextS:=Dates;
FlagF:=True;
Fr:=nil;
Tl:=nil;
Clear(TempD);
If DatF>CurS^.sv.Data then
 begin
 While (NextS<>nil)and FlagF do
  begin
  If NextS^.sv.Data>=DatF then
   begin
   Fr:=NextS;
   FlagF:=False;
   end;
  CurS:=NextS;
  NextS:=NextS^.NextS;
  end;
 end
Else
begin
Fr:=Dates;
NextS:=NextS^.NextS;
end;
If Fr<>nil then
 begin
 FlagF:=True;
 it:=1;
 While (NextS<>nil)and FlagF do
  begin
  inc(it);
  If NextS^.sv.Data>=DatT then
   begin
   If NextS^.sv.Data>DatT then
    begin
    Tl:=CurS;
    dec(it);
    end
   else Tl:=NextS;
   FlagF:=False;
   end;
  CurS:=NextS;
  NextS:=NextS^.NextS;
  end;
 If Tl=nil then Tl:=CurS;
 New(TempD);
 TempD^.sv:=Fr^.sv;
 CurS:=TempD;
 If it>1 then
 For i:=1 to it-1 do
  begin
  Fr:=Fr^.NextS;
  New(CurS^.NextS);
  CurS:=CurS^.NextS;
  CurS^.sv:=Fr^.sv;
  CurS^.NextS:=nil;
  end
 else TempD^.NextS:=nil;
 DatCount:=it;
 LastList:=TempD;
 MakeTab(TempD);
 end;
end;

function Tsvod.GetPar(Res:ResT;num:word):double;
begin
Case num of
1: Result:=Res.akt;
2: Result:=Res.Pererab;
3: Result:=Res.Krek;
4: Result:=Res.H2;
5: Result:=Res.Sost[4,1];
6: Result:=Res.T[1];
7: Result:=Res.GSir;
8: Result:=Res.P_NAr;
9: Result:=Res.nP_iP[1];
10: Result:=Res.VSG;
11: Result:=(Res.nP_iP[1]-Res.nP_iP[2])*100;
12: Result:=Res.Degidr;
13: Result:=Res.Arom[1,11];
14: if nakopl then  Result:=Res.koksNakopl
    else Result:=Res.Koks[3];
15: Result:=Res.Ochi;
16: Result:=Res.Vyh;
17: Result:=Res.Sost[5,20];
18: Result:=Res.dT;
end;
end;

procedure Tsvod.FormCreate(Sender: TObject);
var i:word;
begin
ChP[1]:=CheckBox1;
ChP[2]:=CheckBox2;
ChP[3]:=CheckBox3;
ChP[4]:=CheckBox4;
ChP[5]:=CheckBox5;
ChP[6]:=CheckBox6;
ChP[7]:=CheckBox7;
ChP[8]:=CheckBox8;
ChP[9]:=CheckBox9;
ChP[10]:=CheckBox14;
ChP[11]:=CheckBox11;
ChP[12]:=CheckBox12;
ChP[13]:=CheckBox13;
ChP[14]:=CheckBox10;
ChP[15]:=CheckBox15;
ChP[16]:=CheckBox16;
ChP[17]:=CheckBox17;
ChP[18]:=CheckBox18;
TempD:=nil;
For i:=1 to 18 do For j:=1 to 2 do Par[i,j]:=0;
If FileExists('Activn.ini') then
  begin
  AssignFile(F,'Activn.ini');
  Reset(F,sizeof(Par));
//  For i:=1 to 18 do
//    For j:=1 to 2 do
  blockread(F,Par,1);
  CloseFile(F);
  end;
ParCount:=0;
For i:=1 to 18 do if Par[i,1]=1 then
 begin
 ChP[i].State:=cbChecked;
 ParList[Par[i,2]]:=i;
 inc(ParCount);
 end;
For i:=1 to 18 do ChP[i].OnClick:=CheckBox1Click;
end;

procedure Tsvod.FormDestroy(Sender: TObject);
begin
  AssignFile(F,PathS+'\Activn.ini');
  Rewrite(F,sizeof(Par));
//  For i:=1 to 18 do
//    For j:=1 to 2 do
  blockwrite(F,Par,1);
  CloseFile(F);
end;

procedure Tsvod.Button3Click(Sender: TObject);
var pos,i:integer;
    CurS,PredS:PResT;
begin
pos:=Stab.Selection.Left;
CurS:=LastList;
If CurS=nil then exit;
If Pos<1 then exit;
If Pos=1 then
 begin
 If LastList=Dates then Dates:=CurS^.NextS;
 If LastList=TempD then TempD:=CurS^.NextS;
 LastList:=CurS^.NextS;
 Dispose(CurS);
 If LastList<>nil then From.DateTime:=LastList^.sv.Data
// else From.DateTime:=strToDate('01.01.2002');
 end
else
 begin
 For i:=1 to pos-1 do
  begin
  PredS:=CurS;
  CurS:=CurS^.NextS;
  end;
 PredS^.NextS:=CurS^.NextS;
 Dispose(CurS);
 end;
If pos=DatCount then Till.DateTime:=PredS^.sv.Data;
If DatCount>1 then dec(DatCount);
MakeTab(LastList);
end;

procedure Tsvod.CheckBox1Click(Sender: TObject);
var  i,pos:word;
begin
With (Sender as TCheckBox) do
begin
If Checked then
 begin
 FlagF:=true;
 For i:=1 to 18 do if ParList[i]=Tag then FlagF:=False;
 If FlagF then
  begin
  inc(ParCount);
  ParList[ParCount]:=Tag;
  Par[Tag,1]:=1;
  Par[Tag,2]:=ParCount;
  MakeTab(LastList);
  end;
 end
Else
 begin
 FlagF:=False;
 For i:=1 to 18 do if ParList[i]=Tag then
  begin
  FlagF:=True;
  pos:=i;
  end;
 If FlagF then
  begin
  dec(ParCount);
  If pos=ParCount+1 then ParList[ParCount+1]:=0
  else For i:=pos to ParCount do ParList[i]:=ParList[i+1];
  ParList[ParCount+1]:=0;
  Par[Tag,1]:=0;
  Par[Tag,2]:=0;
  For i:=1 to 18 do If ParList[i]>0 then Par[ParList[i],2]:=i;
  MakeTab(LastList);
  end;
 end
end;
end;

procedure Tsvod.Button4Click(Sender: TObject);
var i,j,l,h:integer;
    tab,ent:char;
    s:string;
    p:PChar;
begin
h:=pred(Stab.RowCount);
l:=pred(Stab.ColCount);
tab:=chr(VK_TAB);
ent:=chr(VK_RETURN);
s:='';
For i:=0 to h do
 begin
 For j:=0 to l do s:=s+Stab.Cells[j,i]+tab;
 s:=s+ent;
 end;
//Clipboard.Open;
//Clipboard.Clear;
Clipboard.ASText:=s;
//Clipboard.Close;
end;

end.
