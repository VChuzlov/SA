unit test;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, TeEngine, Series, TeeProcs, Chart, TeeFunci,
  makeres;
type
  TGraph = class(TForm)
    Chart1: TChart;
    Series2: TLineSeries;
    TeeFunction1: TAddTeeFunction;
    Finita: TButton;
    Button1: TButton;
    PrintDialog1: TPrintDialog;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    GrList: TComboBox;
    Label1: TLabel;
    procedure FinitaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GrListClick(Sender: TObject);
  published
    procedure showFile(NameF: string);
//    procedure GrFileMake;
//    procedure GetD(Sd:string;var Ld,Lm,Ly:integer);
  private
    { Private declarations }
    Procedure Clear(Var Str:PResT);
  public
    { Public declarations }
  end;

var
  Graph: TGraph;
  FirstGr,CurGr,NextGr:PResT;

implementation

uses Unit4, Unit5, adv, SvodTab;


{$R *.DFM}

procedure TGraph.FinitaClick(Sender: TObject);
begin
try
Clear(Firstgr);
finally
Close;
end;
end;


procedure TGraph.Button1Click(Sender: TObject);
begin
If PrintDialog1.Execute Then
 begin
 Chart1.PrintMargins.Left := 2 ;
 Chart1.PrintMargins.Top := 10 ;
 Chart1.PrintMargins.Right:= 2 ;
 Chart1.PrintMargins.Bottom:= 30 ;
 Chart1.PrintLandscape;
 end;
end;

procedure TGraph.Button2Click(Sender: TObject);
begin
Chart1.ZoomPercent(120);
end;

procedure TGraph.Button3Click(Sender: TObject);
begin
Chart1.ZoomPercent(80);
end;

procedure TGraph.Button4Click(Sender: TObject);
begin
Chart1.UndoZoom;
end;

procedure TGraph.Button5Click(Sender: TObject);
begin
Chart1.CopyToClipboardBitmap;
end;

procedure TGraph.showFile(NameF: string);
Var F:File of ResT;
    CurDat:PResT;
    Res:ResT;
begin
try
AssignFile(F,NameF);
Reset(F);
new(FirstGr);
CurDat:=FirstGr;
While not eof(F) do
 begin
 Read(F,CurDat^.sv);
 If not eof(F) then
  begin
  New(CurDat^.NextS);
  CurDat:=CurDat^.NextS
  end
 else Curdat^.NextS:=nil;
 end;
except
Clear(FirstGr);
end;
CloseFile(F);
GrList.OnClick(self);
ShowModal;
end;

Procedure TGraph.Clear(Var Str:PResT);
var Del:PResT;
begin
while Str<>nil do
 begin
 Del:=Str;
 Str:=Str^.NextS;
 Dispose(Del);
 end;
str:=nil; 
end;

procedure TGraph.FormCreate(Sender: TObject);
begin
GrList.ItemIndex:=0;
FirstGr:=nil;
end;

procedure TGraph.GrListClick(Sender: TObject);
var Dest:Array[0..50] of char;
begin
Series2.Clear;
Chart1.Title.Text.SetText(StrPCopy(Dest,GrList.Items.Strings[GrList.ItemIndex]));
CurGr:=FirstGr;
  While CurGr<>nil do begin
  series2.AddY(Svod.GetPar(CurGr^.sv,GrList.ItemIndex+1),CurGr^.sv.DataS);
  CurGr:=CurGr^.NextS;
  end;
end;

end.
