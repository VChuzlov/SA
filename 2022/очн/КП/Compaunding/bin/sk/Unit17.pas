unit Unit17;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TForm17 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form17: TForm17;

implementation

uses Unit5, Unit18;

{$R *.DFM}

procedure TForm17.Button1Click(Sender: TObject);
begin
form17.close;
end;

procedure TForm17.Button2Click(Sender: TObject);
begin
form17.close;
Form5.N12Click(Sender);
form18.showmodal;
{Form5.N16Click(Sender);
Form5.N8Click(Sender);
}end;

end.
