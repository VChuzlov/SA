unit NDisakt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TNewDisakt = class(TForm)
    GroupBox2: TGroupBox;
    CurrentFile: TEdit;
    Button2: TButton;
    GroupBox1: TGroupBox;
    BeginFile: TEdit;
    Button1: TButton;
    Button4: TButton;
    Button6: TButton;
    Button5: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewDisakt: TNewDisakt;

implementation

{$R *.DFM}

end.
