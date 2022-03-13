unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TForm11 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Edit4: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

Uses Unit8;
{$R *.DFM}









procedure TForm11.Edit1Change(Sender: TObject);
begin
     Val(Edit1.Text, CodeReal, Code);
     if code <> 0 then
        begin
             summac:=Edit1.Text;
             delete(summac,code,1);
             Edit1.Text:=summac;
        end;
      Unit11.Form11.BitBtn2.Enabled:=True;
end;

procedure TForm11.Edit2Change(Sender: TObject);
begin
     Val(Edit2.Text, CodeReal, Code);
     if code <> 0 then
        begin
             summac:=Edit2.Text;
             delete(summac,code,1);
             Edit2.Text:=summac;
        end;
      Unit11.Form11.BitBtn2.Enabled:=True;
end;

procedure TForm11.Edit3Change(Sender: TObject);
begin
     Val(Edit3.Text, CodeReal, Code);
     if code <> 0 then
        begin
             summac:=Edit3.Text;
             delete(summac,code,1);
             Edit3.Text:=summac;
        end;
      Unit11.Form11.BitBtn2.Enabled:=True;
end;







procedure TForm11.Edit4Change(Sender: TObject);
begin
     Val(Edit4.Text, CodeReal, Code);
     if code <> 0 then
        begin
             summac:=Edit4.Text;
             delete(summac,code,1);
             Edit4.Text:=summac;
        end;
      Unit11.Form11.BitBtn2.Enabled:=True;
end;


procedure TForm11.BitBtn2Click(Sender: TObject);
begin
     ModalResult:=mrOK;
end;

procedure TForm11.BitBtn1Click(Sender: TObject);
begin
     ModalResult:=mrCancel;
end;

end.
