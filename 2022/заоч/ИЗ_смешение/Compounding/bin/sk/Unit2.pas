unit Unit2;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls,
  Unit3, ExtCtrls  ;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label3: TLabel;
    Button2: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Image1: TImage;
    Label11: TLabel;
    Label12: TLabel;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1, Unit4, Unit14;
{$R *.DFM}

procedure TForm2.Button2Click(Sender: TObject);
begin
Unit3.Form3.ShowModal;
end;

procedure TForm2.Button1Click(Sender: TObject);
var
  ResForm14:integer;

begin
     {    Окно с информацией о программе }
Repeat
      ResForm14:=Form14.ShowModal;
Until ResForm14=mrOk;
Unit14.Form14.Hide;

Unit4.Form4.Button2.Enabled:=False;
Unit4.Form4.RadioGroup1.ItemIndex:=-1;
Unit4.Form4.Show;
Unit2.Form2.Hide;
end;



procedure TForm2.Button3Click(Sender: TObject);
begin
     Unit1.Form1.Show;
     Unit2.Form2.Hide;
end;

end.
