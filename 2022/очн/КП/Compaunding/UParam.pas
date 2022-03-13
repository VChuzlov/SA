unit UParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, IniFiles;

type
  TFormParam = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    RGSourse: TRadioGroup;
    procedure RGSourseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormParam: TFormParam;

implementation

{$R *.dfm}

procedure TFormParam.RGSourseClick(Sender: TObject);
var
  MyIniFile: TIniFile;
begin
  MyIniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'Config.ini');
  case RGSourse.ItemIndex of
    0:MyIniFile.WriteString('Base', 'Sourse', 'FILE');
    1:MyIniFile.WriteString('Base', 'Sourse', 'SELFINI');
    2:MyIniFile.WriteString('Base', 'Sourse', 'SELFACCESS');
  end;
end;

end.
