unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TForm10 = class(TForm)
    MemoRez: TMemo;
    BitBtn1: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

Uses Unit5;

{$R *.DFM}

procedure TForm10.Button1Click(Sender: TObject);
begin
     Unit10.Form10.Hide;
     Unit5.Form5.Enabled:=True;
     Unit5.Form5.Show;
end;

procedure TForm10.BitBtn1Click(Sender: TObject);
begin
     Unit5.Form5.Enabled:=True;
     Unit5.Form5.Show;
     Unit10.Form10.Hide;
     If length(Sav)>1 Then Begin
     MemoRez.Lines.SaveToFile(Sav);
     Unit10.Form10.MemoRez.Modified:=False;
     Sav:='';
                 End;
end;

end.
