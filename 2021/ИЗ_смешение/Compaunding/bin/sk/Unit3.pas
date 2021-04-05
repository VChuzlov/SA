unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit5, Unit1;

{$R *.DFM}


procedure TForm3.BitBtn1Click(Sender: TObject);
Var F: TSearchRec;
    FN:File;
begin
if FindFirst(PathS+'\*.bak',faAnyFile,F)=0 then
   repeat
   AssignFile(FN,PathS+'\'+F.Name);
   Erase(FN);
   until FindNext(F)<>0;
form1.Close;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
     Unit3.Form3.Hide;
end;

end.
