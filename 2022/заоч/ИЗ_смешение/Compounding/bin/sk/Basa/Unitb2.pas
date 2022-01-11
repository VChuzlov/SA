unit Unitb2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFormb2 = class(TForm)
    label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formb2: TFormb2;

implementation
uses basa_tv, Unitb3;

{$R *.DFM}

procedure TFormb2.BitBtn2Click(Sender: TObject);
begin
     AssignFile(f,InitPath+'\nlo');
     Append(f);
     writeln(f,ima);
     CloseFile(f);
     ModalResult:=MrNo;
end;

procedure TFormb2.BitBtn1Click(Sender: TObject);
begin
    formb2.Close;
    ModalResult:=mrYes;
    Formb3.Label2.Caption:=Label2.Caption;
end;

end.
