unit Unit16;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TForm16 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

uses Unit5;

{$R *.DFM}



procedure TForm16.Button1Click(Sender: TObject);
begin
form16.close;
end;

procedure TForm16.Button2Click(Sender: TObject);
begin
form16.close;
Form5.N12Click(Sender);
If Form5.N8.Enabled then
Form5.N8Click(Sender);
end;

end.
