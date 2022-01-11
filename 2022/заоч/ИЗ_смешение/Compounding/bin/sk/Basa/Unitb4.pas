unit Unitb4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFormb4 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formb4: TFormb4;

implementation
uses basa_tv;
{$R *.DFM}

procedure TFormb4.BitBtn1Click(Sender: TObject);
begin
     q4:=edit1.Text;
     If (q4='3') or (q4='4') or (q4='5') or (q4='6') or (q4='7')
        or (q4='8') or (q4='9') or (q4='10') or (q4='11')
        or (q4='12') or (q4='13') then
        begin
     q5:=StrToInt(q4);   
     formb4.Close;
     end;
end;

end.
