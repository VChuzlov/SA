unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.OleServer, Excel2000, Vcl.Menus, UBlending;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    Panel2: TPanel;
    Label2: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Panel3: TPanel;
    Label3: TLabel;
    StringGrid2: TStringGrid;
    ExcelApplication1: TExcelApplication;
    Label4: TLabel;
    Edit2: TEdit;
    Label5: TLabel;
    Edit3: TEdit;
    procedure get_data(comp_RON:TArrOfDouble; flow_composition: TArrOfArrOfDouble;
                       var treb_RON, h, eps: double);
    procedure get_result(mix_composition: TArrOfDouble; RONc: double);
    procedure N2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  flow_count = 6;
  comp_count = 64;

var
  Form1: TForm1;


implementation

{$R *.dfm}


procedure TForm1.get_data(comp_RON:TArrOfDouble; flow_composition: TArrOfArrOfDouble;
                          var treb_RON, h, eps: double);
var
  i, j: integer;
begin
  with StringGrid1 do
    begin
      for i := 0 to comp_count-1 do
        begin
          comp_RON[i] := StrToFloat(Cells[1, i+1]);
          for j := 0 to flow_count-1 do
            flow_composition[i, j] := StrToFloat(Cells[j+2, i+1]);
        end;
    end;
  treb_RON := StrToFloat(Edit1.Text);
  h := StrToFloat(Edit2.Text);
  eps := StrToFloat(Edit3.Text)
end;

procedure TForm1.get_result(mix_composition: TArrOfDouble; RONc: Double);
var
  i: integer;
begin
  With StringGrid2 do
    begin
      Cells[0, 0] := 'Номер потока';
      Cells[1, 0] := 'Доля потока, %';
      Cells[0, 7] := 'ОЧ смешения';
      for i := 1 to RowCount-2 do
        begin
          Cells[0, i] := IntToStr(i);
          Cells[1, i] := FloatToStrF(mix_composition[i-1] * 100, fffixed, 8, 2);
        end;
      Cells[1, 7] := FloatToStrF(RONc, fffixed, 8, 2)
    end;
end;

procedure TForm1.N2Click(Sender: TObject);
var
  i, j: integer;
begin
  ExcelApplication1.Connect;
  ExcelApplication1.Visible[0] := False;
  ExcelApplication1.DisplayAlerts[0] := False;
  ExcelApplication1.Workbooks.Open(ExtractFilePath(Application.ExeName)+'Исходные данные.xlsx',
                                   EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                                   EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                                   EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0
                                   );
  for i := 0 to comp_count+1 do
    for j := 0 to flow_count+2 do
      StringGrid1.Cells[j, i] := ExcelApplication1.Cells.Item[i+1, j+1];
  ExcelApplication1.Quit;
  ExcelApplication1.Disconnect;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  comp_RON: TArrOfDouble;
  flow_composition: TArrOfArrOfDouble;
  mix_composition: TArrOfDouble;
  RONc: double;
  treb_RON: double;
  i: integer;
  h: double;
  eps: double;
begin
  SetLength(comp_RON, comp_count);
  SetLength(flow_composition, comp_count);
  for i := 0 to comp_count-1 do
    SetLength(flow_composition[i], flow_count);
  SetLength(mix_composition, flow_count);

  get_data(comp_RON, flow_composition, treb_RON, h, eps);

  blending(comp_count, flow_count, comp_RON, flow_composition, treb_RON,
           eps, h, mix_composition, RONc);

  get_result(mix_composition, RONc);
end;

end.
