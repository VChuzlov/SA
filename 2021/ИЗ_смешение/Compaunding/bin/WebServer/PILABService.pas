// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:54326/PILABService/PILABService.asmx?WSDL
// Encoding : utf-8
// Version  : 1.0
// (17.06.2015 9:16:24 - 1.33.2.5)
// ************************************************************************ //

unit PILABService;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"
  // !:long            - "http://www.w3.org/2001/XMLSchema"
  // !:float           - "http://www.w3.org/2001/XMLSchema"

  LabArg               = class;                 { "http://tempuri.org/" }
  LabResult            = class;                 { "http://tempuri.org/" }
  PIResult             = class;                 { "http://tempuri.org/" }
  PIArg                = class;                 { "http://tempuri.org/" }



  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  LabArg = class(TRemotable)
  private
    FDocumentReference: WideString;
    FStandardNr: WideString;
    FTest: WideString;
    FDate: TXSDateTime;
  public
    destructor Destroy; override;
  published
    property DocumentReference: WideString read FDocumentReference write FDocumentReference;
    property StandardNr: WideString read FStandardNr write FStandardNr;
    property Test: WideString read FTest write FTest;
    property Date: TXSDateTime read FDate write FDate;
  end;



  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  LabResult = class(TRemotable)
  private
    FDate: TXSDateTime;
    FValue: WideString;
    FStatus: Int64;
  public
    destructor Destroy; override;
  published
    property Date: TXSDateTime read FDate write FDate;
    property Value: WideString read FValue write FValue;
    property Status: Int64 read FStatus write FStatus;
  end;

  ArrayOfLabArg = array of LabArg;              { "http://tempuri.org/" }
  ArrayOfLabResult = array of LabResult;        { "http://tempuri.org/" }


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  PIResult = class(TRemotable)
  private
    FTimeStamp: TXSDateTime;
    FValue: Single;
    FStatus: Int64;
  public
    destructor Destroy; override;
  published
    property TimeStamp: TXSDateTime read FTimeStamp write FTimeStamp;
    property Value: Single read FValue write FValue;
    property Status: Int64 read FStatus write FStatus;
  end;

  ArrayOfString = array of WideString;          { "http://tempuri.org/" }
  ArrayOfPIResult = array of PIResult;          { "http://tempuri.org/" }


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  PIArg = class(TRemotable)
  private
    FTag: WideString;
    FTimeStamp: TXSDateTime;
  public
    destructor Destroy; override;
  published

    property Tag: WideString read FTag write FTag;
    property TimeStamp: TXSDateTime read FTimeStamp write FTimeStamp;
  end;

  ArrayOfPIArg = array of PIArg;                { "http://tempuri.org/" }

  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // soapAction: http://tempuri.org/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // binding   : PILABServiceSoap
  // service   : PILABService
  // port      : PILABServiceSoap
  // URL       : http://localhost:54326/PILABService/PILABService.asmx
  // ************************************************************************ //
  PILABServiceSoap = interface(IInvokable)
  ['{9417094D-BD9D-9824-959B-C36696B90D53}']
    function  GetLabValue(const arg: LabArg): LabResult; stdcall;
    function  GetLabValues(const arg: ArrayOfLabArg): ArrayOfLabResult; stdcall;

    function  GetPISnapshotValue(const Tag: WideString): PIResult; stdcall;
    function  GetPISnapshotValues(const Tags: ArrayOfString): ArrayOfPIResult; stdcall;

    function  GetPIValue(const arg: PIArg): PIResult; stdcall;      //
    function  GetPIValues(const arg: ArrayOfPIArg): ArrayOfPIResult; stdcall;
  end;

function GetPILABServiceSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): PILABServiceSoap;


implementation

function GetPILABServiceSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): PILABServiceSoap;
const
  defWSDL = 'http://localhost:32768/PILABService.asmx?WSDL';
  defURL  = 'http://localhost:32768/PILABService.asmx';
  defSvc  = 'PILABService';
  defPrt  = 'PILABServiceSoap';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as PILABServiceSoap);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


destructor LabArg.Destroy;
begin
  if Assigned(FDate) then
    FDate.Free;
  inherited Destroy;
end;

destructor LabResult.Destroy;
begin
  if Assigned(FDate) then
    FDate.Free;
  inherited Destroy;
end;

destructor PIResult.Destroy;
begin
  if Assigned(FTimeStamp) then
    FTimeStamp.Free;
  inherited Destroy;
end;

destructor PIArg.Destroy;
begin
  if Assigned(FTimeStamp) then
    FTimeStamp.Free;
  inherited Destroy;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(PILABServiceSoap), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(PILABServiceSoap), 'http://tempuri.org/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(PILABServiceSoap), ioDocument);
  RemClassRegistry.RegisterXSClass(LabArg, 'http://tempuri.org/', 'LabArg');
  RemClassRegistry.RegisterXSClass(LabResult, 'http://tempuri.org/', 'LabResult');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfLabArg), 'http://tempuri.org/', 'ArrayOfLabArg');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfLabResult), 'http://tempuri.org/', 'ArrayOfLabResult');
  RemClassRegistry.RegisterXSClass(PIResult, 'http://tempuri.org/', 'PIResult');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfString), 'http://tempuri.org/', 'ArrayOfString');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfPIResult), 'http://tempuri.org/', 'ArrayOfPIResult');
  RemClassRegistry.RegisterXSClass(PIArg, 'http://tempuri.org/', 'PIArg');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfPIArg), 'http://tempuri.org/', 'ArrayOfPIArg');

end. 