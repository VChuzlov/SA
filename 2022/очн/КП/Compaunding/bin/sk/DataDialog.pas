unit DataDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TDataDlg = class(TForm)
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    procedure DateTimePicker1CloseUp(Sender: TObject);
    procedure DateTimePicker1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataDlg: TDataDlg;

implementation

{$R *.dfm}

procedure TDataDlg.DateTimePicker1CloseUp(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TDataDlg.DateTimePicker1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If Key=VK_Return then ModalResult:=mrOk;
end;

end.
