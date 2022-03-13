unit UGrupp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, UMath;

type
  TFGrupp = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StringGrid1: TStringGrid;
    Button1: TButton;
    Panel3: TPanel;
    Button2: TButton;
    Button3: TButton;
    OD1: TOpenDialog;
    SD1: TSaveDialog;
    ListBox1: TListBox;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    TotalFlowCompaundingInside: TTotalFlowCompaunding;{ Private declarations }
  public
    { Public declarations }
  end;

var
  FGrupp: TFGrupp;
  SumFlow: TFlowCompaunding;
implementation

uses UParam, DateUtils;

{$R *.dfm}

procedure TFGrupp.Button1Click(Sender: TObject);
var
  i: integer;
begin
  if OD1.Execute then
  begin
    case OD1.FilterIndex of
      1: begin
           TotalFlowCompaundingInside.LoadFromSFC(
                  od1.FileName, ListBox1, FormParam.RGSourse.ItemIndex);
         end;
      2: begin
           TotalFlowCompaundingInside.LoadFromSK(
                  od1.FileName, ListBox1, Index_Sir_Riforming, FormParam.RGSourse.ItemIndex);
         end;
      3: begin
           TotalFlowCompaundingInside.LoadFromSK(
                  od1.FileName, ListBox1, Index_Kat_Riforming, FormParam.RGSourse.ItemIndex);
         end;
    end;
    StringGrid1.RowCount:=length(TotalFlowCompaundingInside.Flows)+1;
    for i:= 0 to length(TotalFlowCompaundingInside.Flows)-1 do
    begin
      With TotalFlowCompaundingInside.Flows[i] do
      begin
        StringGrid1.Cells[0,i+1]:=Name;
        StringGrid1.Cells[1,i+1]:=FloatToStr(Expenditure);   
      end;
    end;
  end;
end;

procedure TFGrupp.Button2Click(Sender: TObject);
begin
  SumFlow:=TFlowCompaunding.Create;
  TotalFlowCompaundingInside.TotalFlowOctaneValue;
  TotalFlowCompaundingInside.ConvertToFlow(SumFlow, Edit1.Text);
  Close;
  ModalResult:=mrOk;
  TotalFlowCompaundingInside.Destroy;
end;

procedure TFGrupp.Button3Click(Sender: TObject);
begin
  Close;
  TotalFlowCompaundingInside.Destroy;
end;

procedure TFGrupp.FormShow(Sender: TObject);
begin
  StringGrid1.Cells[0,0]:='Поток';
  StringGrid1.Cells[1,0]:='Расход';
  StringGrid1.Cells[0,1]:='';
  StringGrid1.Cells[1,1]:='';
  StringGrid1.RowCount:=2;
  ListBox1.Clear;
  TotalFlowCompaundingInside:= TTotalFlowCompaunding.Create;

end;

procedure TFGrupp.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  i: integer;
begin
  for i:=0 to Length(TotalFlowCompaundingInside.Flows)-1 do
  begin
    with TotalFlowCompaundingInside do
    begin
      GetFlowOfName(StringGrid1.Cells[0,i+1]).Expenditure:=StrToFloat(StringGrid1.Cells[1, i+1]);
    end;
  end;
end;

procedure TFGrupp.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in ['0'..'9', DecimalSeparator, Char(8), Char(#13)]) then
  begin
    key:=#0;
  end;
end;

end.
