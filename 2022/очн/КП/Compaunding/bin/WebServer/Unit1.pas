unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, PILABService, InvokeRegistry, Rio, SOAPHTTPClient, XSBuiltIns;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    HTTPRIO1: THTTPRIO;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses USOAP;

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);


var
  srv : PILABServiceSoap;
  arg : PIArg;
  res : PIResult;
  LA: LabArg;
  resLA: LabResult;
begin
  srv := GetPILABServiceSoap(false, '', nil);
  arg := PIArg.Create;
  arg.Tag := '10FT100';
  arg.TimeStamp:=TXSDateTime.Create;

  arg.TimeStamp.XSToNative(DateTimeToXMLTime(Now));

  res := srv.GetPIValue(arg);
  Memo1.Lines.Append( 'dt=' +   res.TimeStamp.NativeToXS() + ' val=' + CurrToStr( res.Value ) + ' status=' + CurrToStr( res.Status ));

  LA:= LabArg.Create;
  LA.Date:=TXSDateTime.Create;
  LA.Date.XSToNative(DateTimeToXMLTime(Now));
  LA.Test:='123';
  LA.DocumentReference:='3';
  LA.StandardNr:='1';


  resLA:=srv.GetLabValue(LA);

  Memo1.Lines.Append( 'dt=' +   resLA.Date.NativeToXS() +  resLA.Value  + ' status=' + CurrToStr( resLA.Status ));

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  TPC: TParamComp;
begin
  TPC:=ExecuteRead(now, ExtractFilePath(Application.ExeName)+'\Spisok_analiz.ini', vsArLAB);
  Memo1.Lines.Add(TPC.ValueParam[0])

end;

end.
