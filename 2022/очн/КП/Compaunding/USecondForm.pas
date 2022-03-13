unit USecondForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TSecondForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    EditResult: TEdit;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure EditResultKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SecondForm: TSecondForm;

implementation

{$R *.dfm}

procedure TSecondForm.FormShow(Sender: TObject);
begin
  EditResult.SetFocus;

end;

procedure TSecondForm.EditResultKeyPress(Sender: TObject; var Key: Char);
begin
  if (Label1.Caption <> 'Введите название потока')
  and (Label1.Caption <> 'Название элемента')
  and (Label1.Caption <> 'Название присадки') then
  begin
    if not (Key in ['0'..'9', DecimalSeparator, char(8), char(#13)]) then
       Key:=#0;
    if (pos(DecimalSeparator,EditResult.Text)>0) and (Key=DecimalSeparator) then
       Key:=#0;
  end;
    
  if Key=#13 then Button1.Click;
end;

procedure TSecondForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (EditResult.Text='') and (ModalResult=mrOk) then Action:=caNone;
end;

procedure TSecondForm.Button2Click(Sender: TObject);
begin
  //Caption:='Отмена';
end;

end.
