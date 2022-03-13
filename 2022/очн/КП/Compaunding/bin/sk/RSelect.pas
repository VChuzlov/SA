unit RSelect;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TRSelDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    RadioGroup1: TRadioGroup;
    procedure CancelBtnClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RSelDlg: TRSelDlg;

implementation

Uses Unit5;
{$R *.DFM}

procedure TRSelDlg.CancelBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TRSelDlg.OKBtnClick(Sender: TObject);
begin
ModalResult:=mrOK;
end;

end.
