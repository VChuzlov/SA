unit Unitb3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TFormb3 = class(TForm)
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formb3: TFormb3;

implementation

uses Unitb4,basa_tv;

{$R *.DFM}

procedure TFormb3.BitBtn1Click(Sender: TObject);
begin
     If RadioButton1.Checked=True then q3:=1;
     If RadioButton2.Checked=True then q3:=2;
     If RadioButton3.Checked=True then q3:=3;
     If RadioButton4.Checked=True then q3:=4;
     If RadioButton5.Checked=True then q3:=5;
     formb3.Close;
     formb4.label4.caption:=label2.caption;
end;

end.
