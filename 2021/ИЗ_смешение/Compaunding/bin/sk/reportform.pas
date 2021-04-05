unit reportform;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, QuickRpt, Qrctrls, ExtCtrls;

type
  TFRep = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Vot: TQuickRep;
    B1: TQRBand;
    Rep: TQRMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRep: TFRep;

implementation

{$R *.DFM}

procedure TFRep.Button1Click(Sender: TObject);
begin
Close;
end;

procedure TFRep.Button2Click(Sender: TObject);
begin
Vot.Preview;
end;

end.
