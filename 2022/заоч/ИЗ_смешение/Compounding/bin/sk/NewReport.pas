unit NewReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TNewReportForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewReportForm: TNewReportForm;

implementation

Uses Unit5, reportform, Unit12, Unit30, adv;
{$R *.DFM}

procedure TNewReportForm.Button6Click(Sender: TObject);
begin
Close;
end;

procedure TNewReportForm.FormShow(Sender: TObject);
begin
Button6.SetFocus;
end;

procedure TNewReportForm.Button1Click(Sender: TObject);
begin
Form5.N15Click(Sender);
end;

procedure TNewReportForm.Button3Click(Sender: TObject);
begin
Form12.showmodal;
end;

procedure TNewReportForm.Button4Click(Sender: TObject);
begin
Form30.ShowModal;
end;

procedure TNewReportForm.Button2Click(Sender: TObject);
begin
Advice.ShowModal;
end;

end.
