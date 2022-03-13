unit Unitb6;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, FileCtrl;

type
  TFormb6 = class(TForm)
    DirectoryListBox1: TDirectoryListBox;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formb6: TFormb6;

implementation

uses Unitb5;

{$R *.DFM}

procedure TFormb6.BitBtn1Click(Sender: TObject);
begin
     formb6.Close;
     if not Assigned(formb5) then formb5:=Tformb5.Create(Self);
     formb5.Show;
end;

end.
