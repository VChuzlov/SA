unit Unit18;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm18 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
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
  Form18: TForm18;

implementation

uses Unit17, Unit5, Unit19;

{$R *.DFM}

procedure TForm18.Button1Click(Sender: TObject);
begin
form18.close;
form17.show
end;

procedure TForm18.Button2Click(Sender: TObject);
begin
form18.close;
Start:=True;
Form5.FrClick(Sender);
//form19.show;
end;

end.
