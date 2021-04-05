unit UConditionPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormPlan = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel31: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Edit6: TEdit;
    Label2: TLabel;
    Edit7: TEdit;
    Edit9: TEdit;
    Label3: TLabel;
    Edit10: TEdit;
    Label4: TLabel;
    Edit11: TEdit;
    Label5: TLabel;
    ComboBox1: TComboBox;
    Edit12: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Edit13: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPlan: TFormPlan;

implementation

uses UFlowOfVO, UFlowOfVOLite, UMath, UPlan;

{$R *.dfm}

procedure TFormPlan.Button1Click(Sender: TObject);
var
  i: integer;
begin
  for i:=0 to ComponentCount-1 do
  begin
    if (Components[i] is TEdit) and ((Components[i] as TEdit).Text='') then
    begin
      (Components[i] as TEdit).Text:='0';
    end;
  end;
  if FormFlowofOV<>nil then
  begin
    FormFlowofOV.Edit1.Text:=Edit1.Text;
    FormFlowofOV.Edit2.Text:=ComboBox1.Text;
    FormFlowofOV.Edit3.Text:=Edit3.Text;
    FormFlowofOV.Edit4.Text:=Edit4.Text;
    FormFlowofOV.Edit5.Text:=Edit5.Text;
    FormFlowofOV.Edit6.Text:=Edit6.Text;
    FormFlowofOV.Edit7.Text:=Edit7.Text;
    FormFlowofOV.Edit9.Text:=Edit9.Text;
    FormFlowofOV.Edit10.Text:=Edit10.Text;
    FormFlowofOV.Edit11.Text:=Edit11.Text;
    FormFlowofOV.Edit12.Text:=Edit12.Text;
    FormFlowofOV.Edit13.Text:=Edit13.Text;
  end;
  if FormFlowofOVLite<>nil then
  begin
    FormFlowofOVLite.Edit1.Text:=Edit1.Text;
    FormFlowofOVLite.Edit2.Text:=ComboBox1.Text;
    FormFlowofOVLite.Edit3.Text:=Edit3.Text;
    FormFlowofOVLite.Edit4.Text:=Edit4.Text;
    FormFlowofOVLite.Edit5.Text:=Edit5.Text;
    FormFlowofOVLite.Edit6.Text:=Edit6.Text;
    FormFlowofOVLite.Edit7.Text:=Edit7.Text;
    FormFlowofOVLite.Edit9.Text:=Edit9.Text;
    FormFlowofOVLite.Edit10.Text:=Edit10.Text;
    FormFlowofOVLite.Edit11.Text:=Edit11.Text;
    FormFlowofOVLite.Edit12.Text:=Edit12.Text;
    FormFlowofOVLite.Edit13.Text:=Edit13.Text;
  end;

  close;
  FormPlan.ModalResult:=mrOk;
end;

procedure TFormPlan.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TFormPlan.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
 
  if not (Key in ['0'..'9', DecimalSeparator, char(#8)]) then
  begin
    Key:=#0;
  end;

end;

end.
