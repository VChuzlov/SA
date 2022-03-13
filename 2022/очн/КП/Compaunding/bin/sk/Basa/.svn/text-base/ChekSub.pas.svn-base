unit ChekSub;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TAddSub = class(TForm)
    ima: TLabel;
    Label1: TLabel;
    List: TListBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  function FindName(Sub,NameF:string):word;
  end;

var
  AddSub: TAddSub;

implementation

{$R *.DFM}

function TAddSub.FindName;
var F:textfile;
    Pos:array[0..20] of word;
    S:string;
    i:word;
    z:char;
begin
AssignFile(F,NameF);
Reset(F);
i:=0;
List.Items.Clear;
While not eof(F) do
 begin
 Readln(F,Pos[i],z,S);
 List.Items.Append(S);
 inc(i);
 end;
CloseFile(F); 
Ima.Caption:=Sub;
ShowModal;
Result:=Pos[List.ItemIndex];
end;

procedure TAddSub.Button1Click(Sender: TObject);
begin
Close;
end;

end.
