unit USetUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFSetUser = class(TForm)
    BtOk: TButton;
    BtCan: TButton;
    Label1: TLabel;
    EdRash: TEdit;
    procedure BtOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSetUser: TFSetUser;

implementation

uses UPlan, Grids;

{$R *.dfm}

procedure TFSetUser.BtOkClick(Sender: TObject);
begin
  with FPlan.SGUser do
  begin
    //:=StrToFloat(Cells[Selection.Top, Selection.Left]);
  end;
end;

end.
