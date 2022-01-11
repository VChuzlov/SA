unit Unit1;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Unit4, Unit3, jpeg, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  PutiProgram:string;

implementation

Uses Unit5, basa, Unit8;
{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
 GetDir(0,PutiProgram);
 PutiProgram:=ExtractFilePath(Application.ExeName)+'bin\sk';
 Form1.Hide;
 Unit5.Form5.N8.Enabled:=False;
 Unit5.Form5.N15.Enabled:=False;
 //Unit4.Form4.Show;
 {-----------------}
 Unit4.Form4.RadioGroup1.ItemIndex:=11;
 UstNum:=11;
 Unit4.Form4.Button2.Click;
 Form5.N12Click(Sender);
 Form5.BdanClick(Sender);
 form8.Button2.Click;
 basadan.BitBtn1Click(basadan.Next);
 basadan.Next.Click;
 basadan.BitBtn1Click(basadan.BitBtn1);
 basadan.Next.Click;
 Form3.BitBtn1Click(Sender);
 unit1.Form1.Close;
 unit5.Form5.Close;
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
Unit3.Form3.ShowModal;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
GetDir(0,PathS);
PathS:=ExtractFilePath(Application.ExeName)+'bin\sk';
end;

end.
