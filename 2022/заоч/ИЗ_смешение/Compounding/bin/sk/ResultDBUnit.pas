unit ResultDBUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TeEngine, TeeFunci, Series, ExtCtrls, TeeProcs, Chart,
  Grids, Buttons, Clipbrd, ComCtrls;

type
  TResultDBForm = class(TForm)
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
    GroupBox2: TGroupBox;
    Button4: TButton;
    Button5: TButton;
    Button9: TButton;
    finita: TButton;
    BitBtn1: TBitBtn;
    PrintDialog1: TPrintDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ResTab: TStringGrid;
    TabSheet2: TTabSheet;
    Chart1: TChart;
    Series2: TLineSeries;
    TeeFunction1: TAddTeeFunction;
    Series4: TLineSeries;
    TeeFunction2: TAddTeeFunction;
    Series5: TLineSeries;
    TeeFunction3: TAddTeeFunction;
    Series1: TLineSeries;
    TeeFunction4: TAddTeeFunction;
    Series3: TLineSeries;
    TeeFunction5: TAddTeeFunction;
    Series6: TLineSeries;
    TeeFunction6: TAddTeeFunction;
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure FinitaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure fromChange(Sender: TObject);
    procedure tillChange(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ResultDBForm: TResultDBForm;

implementation

Uses Unit5, Unit4, makeres, URasDisAkt;

{$R *.dfm}

procedure TResultDBForm.FormShow(Sender: TObject);
Var f1,f2:File of ResT;
f3:file of Diz;
Res:ResT;
DatDiz:Diz;
i:integer;
Const Head:array[0..6] of string = ('Дата',
                                    'Текущая активность',
                                    'Оптимальная активность',
                                    'Кокс на катализаторе',
                                    'Выход риформата',
                                    'Количество октанотонн',
                                    'Cкорость дезактивации');
begin
Series1.Clear;
Series2.Clear;
Series3.Clear;
Series4.Clear;
Series5.Clear;
Series6.Clear;
For i:=0 to 6 do ResTab.Cells[i,0]:=Head[i];
i:=0;
If FileExists(PathU+'\svod\svod.'+IntToStr(ZiklNum)) then Begin
AssignFile(f1,PathU+'\svod\svod.'+IntToStr(ZiklNum));
Reset(f1);
While not eof(f1) do Begin
  Inc(i);
  Read(f1,Res);
  Series2.AddXY(Res.Data,Res.akt,Res.DataS);
  Series5.AddXY(Res.Data,Res.koksNakopl,Res.DataS);
  Series3.AddXY(Res.Data,Res.Vyh,Res.DataS);
  Series6.AddXY(Res.Data,Res.Oktt,Res.DataS);
  ResTab.RowCount:=Succ(i);
  ResTab.Cells[0,i]:=Res.DataS;
  ResTab.Cells[1,i]:=FloatToStr(Res.akt);
  ResTab.Cells[3,i]:=FloatToStr(Res.koksNakopl);
  ResTab.Cells[4,i]:=FloatToStr(Res.Vyh);
  ResTab.Cells[5,i]:=FloatToStr(Res.Oktt);
                     end;
CloseFile(f1);
                                                          end;
from.Date:=StrToDate(ResTab.Cells[0,1]);
till.Date:=StrToDate(ResTab.Cells[0,i]);                                                          
i:=0;
If FileExists(PathU+'\svod\svodopt.'+IntToStr(ZiklNum)) then Begin
AssignFile(f2,PathU+'\svod\svodopt.'+IntToStr(ZiklNum));
Reset(f2);
While not eof(f2) do Begin
  Inc(i);
  Read(f2,Res);
  Series4.AddXY(Res.Data,Res.akt,Res.DataS);
  If ResTab.Cells[0,i]=Res.DataS then ResTab.Cells[2,i]:=FloatToStr(Res.akt);
                     end;
CloseFile(f2);
                                                             end;
If FileExists(PathS+'\dizakt.'+intToStr(UstNum)) then Begin
 assignFile(f3,PathS+'\dizakt.'+intToStr(UstNum));
 reset(f3);
 While not eof(f3) do
  begin
  read(f3,DatDiz);
  Series1.AddXY(DatDiz.Data,DatDiz.Diak,DateToStr(DatDiz.Data));
  end;
closefile(f3);
                                                      end;
Series2.Active:=CheckBox1.Checked;
Series4.Active:=CheckBox2.Checked;
Series5.Active:=CheckBox3.Checked;
Series1.Active:=CheckBox4.Checked;
Series3.Active:=CheckBox5.Checked;
Series6.Active:=CheckBox6.Checked;
end;

procedure TResultDBForm.CheckBox1Click(Sender: TObject);
begin
Series2.Active:=CheckBox1.Checked;
end;

procedure TResultDBForm.CheckBox2Click(Sender: TObject);
begin
Series4.Active:=CheckBox2.Checked;
end;

procedure TResultDBForm.CheckBox3Click(Sender: TObject);
begin
Series5.Active:=CheckBox3.Checked;
end;

procedure TResultDBForm.CheckBox4Click(Sender: TObject);
begin
Series1.Active:=CheckBox4.Checked;
end;

procedure TResultDBForm.CheckBox5Click(Sender: TObject);
begin
Series3.Active:=CheckBox5.Checked;
end;

procedure TResultDBForm.CheckBox6Click(Sender: TObject);
begin
Series6.Active:=CheckBox6.Checked;
end;

procedure TResultDBForm.FinitaClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TResultDBForm.BitBtn1Click(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TResultDBForm.fromChange(Sender: TObject);
begin
If from.Date<till.Date then Chart1.BottomAxis.SetMinMax(from.Date,till.Date);
end;

procedure TResultDBForm.tillChange(Sender: TObject);
begin
If from.Date<till.Date then Chart1.BottomAxis.SetMinMax(from.Date,till.Date);
end;

procedure TResultDBForm.Button9Click(Sender: TObject);
begin
Chart1.CopyToClipboardBitmap;
end;

procedure TResultDBForm.Button5Click(Sender: TObject);
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

procedure TResultDBForm.Button4Click(Sender: TObject);
var i,j,l,h:integer;
    tab,ent:char;
    s:string;
    p:PChar;
begin
h:=pred(ResTab.RowCount);
l:=pred(ResTab.ColCount);
tab:=chr(VK_TAB);
ent:=chr(VK_RETURN);
s:='';
For i:=0 to h do
 begin
 For j:=0 to l do s:=s+ResTab.Cells[j,i]+tab;
 s:=s+ent;
 end;
Clipboard.ASText:=s;
end;

end.
