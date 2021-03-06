unit USOAP;

interface

uses
  PILABService, InvokeRegistry, Rio, SOAPHTTPClient, XSBuiltIns, Controls, SysUtils,
  UMath;

type
  TVidSchit = (vsPI, vsArPI, vsLAB, vsArLAB, vsPIsn, vsArPIsn);
  TArrofString=array of string;
  TParamComp = class
    _Date: TDate;
    EditParam: array of string;
    NameParam: array of string;
    ValueParam: array of string;
  end;

  function ExecuteRead(_Date: TDateTime; _FilePath: string; Vid: TVidSchit): TParamComp;
  procedure ExecuteReadQDIS_PI(_Date: TDateTime; var SOAPDATA: TSOAPDATA);

implementation

function GetResPI(_Tag: WideString; _TimeStamp: TDateTime): PIResult;
var
  srv : PILABServiceSoap;
  arg : PIArg;
begin
  srv := GetPILABServiceSoap(false, '', nil);
  arg := PIArg.Create;
  arg.Tag := _Tag;
  arg.TimeStamp:=TXSDateTime.Create;

  arg.TimeStamp.XSToNative(DateTimeToXMLTime(_TimeStamp));

  result := srv.GetPIValue(arg);
  arg.Destroy;

end;

function GetArrResPI(_Tag: ArrayOfString; _TimeStamp: TDateTime): ArrayOfPIResult;
var
  srv : PILABServiceSoap;
  arg : ArrayOfPIArg;
  i: integer;
begin
  srv := GetPILABServiceSoap(false, '', nil);
  SetLength(arg, Length(_Tag));
  for i:=0 to Length(_Tag)-1 do
  begin
    arg[i] := PIArg.Create;
    arg[i].Tag := _Tag[i];
    arg[i].TimeStamp:=TXSDateTime.Create;

    arg[i].TimeStamp.XSToNative(DateTimeToXMLTime(_TimeStamp));
  end;
  result := srv.GetPIValues(arg);
  for i:=0 to Length(_Tag)-1 do
  begin
    arg[i].Destroy;
  end;
end;

function GetResPISnapShot(_Tag: WideString): PIResult;
var
  srv : PILABServiceSoap;

begin
  srv := GetPILABServiceSoap(false, '', nil);


  result := srv.GetPISnapshotValue(_Tag);


end;

function GetArrResPISnapShot(_Tag: ArrayOfString): ArrayOfPIResult;
var
  srv : PILABServiceSoap;


begin
  srv := GetPILABServiceSoap(false, '', nil);

  result := srv.GetPISnapshotValues(_Tag);

end;

function GetResQDIS(_DocumentReference, _Test, _StandardNr: WideString; _TimeStamp: TDateTime): LabResult;
var
  srv : PILABServiceSoap;
  LA: LabArg;
begin
  srv := GetPILABServiceSoap(false, '', nil);
  LA:= LabArg.Create;
  LA.Date:=TXSDateTime.Create;
  LA.Date.XSToNative(DateTimeToXMLTime(_TimeStamp));
  LA.Test:=_Test;
  LA.DocumentReference:=_DocumentReference;
  LA.StandardNr:=_StandardNr;

  result:=srv.GetLabValue(LA);
  LA.Destroy;
end;

function GetArrResQDIS(_DocumentReference, _Test, _StandardNr: ArrayOfString; _TimeStamp: TDateTime): ArrayOfLabResult;
var
  srv : PILABServiceSoap;
  LA: ArrayOfLabArg;
  i: integer;
begin
  srv := GetPILABServiceSoap(false, '', nil);
  SetLength(LA, Length(_Test));
  for i:=0 to Length(_Test)-1 do
  begin
    LA[i]:= LabArg.Create;
    LA[i].Date:=TXSDateTime.Create;
    LA[i].Date.XSToNative(DateTimeToXMLTime(_TimeStamp));
    LA[i].Test:=_Test[i];
    LA[i].DocumentReference:=_DocumentReference[i];
    LA[i].StandardNr:=_StandardNr[i];
  end;
  result:=srv.GetLabValues(LA);
  for i:=0 to Length(_Test)-1 do
  begin
    LA[i].Destroy;
  end;
end;


//--------------------------------------------------

Procedure ReadText(s:string; var Text1:TArrofString);
var
 i:integer;
 ColResh: array of integer;
begin
 While Pos(' ',S)<>0 do
  begin
    delete(S,Pos(' ', S),1);
  end;


  SetLength(ColResh, Length(ColResh)+1);
  ColResh[Length(ColResh)-1]:=1;
  for i:=1 to length(s) do
    if s[i]='#' then
       begin
         SetLength(ColResh, Length(ColResh)+1);
         ColResh[Length(ColResh)-1]:=i;
       end;
  SetLength(ColResh, Length(ColResh)+1);
  ColResh[Length(ColResh)-1]:=length(s);

    SetLength(Text1, Length(ColResh)-1);

    Text1[0]:=Copy(S, ColResh[0], ColResh[1]-1);
    For I:=2 to Length(ColResh)-1 do

      Text1[i-1]:=Copy(S, ColResh[i-1]+1, ColResh[i]-ColResh[i-1]-1);

    
end;

function ExecuteRead(_Date: TDateTime; _FilePath: string; Vid: TVidSchit): TParamComp;
var
  i, CountObj: integer;
  s: string;
  _File: TextFile;
  Text1:TArrofString;
  ArrPIsn: ArrayOfPIResult;
  ArrPI: ArrayOfPIResult;

  ArrLAB: ArrayOfLabResult;
  _Tag: ArrayOfString;
  _DocRef: ArrayOfString;
  _Test: ArrayOfString;
  _StanN: ArrayOfString;
begin
  assign(_File, _FilePath);
  reset(_File);
  readln(_File, s);
  ReadText(s,Text1);
  CountObj:=StrToInt(Text1[1]);
  Result:=TParamComp.Create;
  SetLength(Result.EditParam, CountObj);
  SetLength(Result.NameParam, CountObj);
  SetLength(Result.ValueParam, CountObj);
  Result._Date:=_Date;


  case Vid of
    vsPI: begin

    end;

    vsArPI: begin
      SetLength(_Tag, CountObj);

      for i:=1 to CountObj do
      begin
        readln(_File, s);
        ReadText(s,Text1);
        Result.EditParam[i-1]:=Text1[0];
        Result.NameParam[i-1]:=Text1[1];
        _Tag[i-1]:=Text1[1];
      end;
      ArrPI:=GetArrResPI(_Tag, _Date);
      for i:=1 to CountObj do
      begin
        Result.ValueParam[i-1]:=CurrToStr(ArrPI[i-1].Value);
      end;
    end;

    vsPIsn: begin

    end;

    vsArPIsn: begin
      SetLength(_Tag, CountObj);

      for i:=1 to CountObj do
      begin
        readln(_File, s);
        ReadText(s,Text1);
        Result.EditParam[i-1]:=Text1[0];
        Result.NameParam[i-1]:=Text1[1];
        _Tag[i-1]:=Text1[1];
      end;
      ArrPIsn:=GetArrResPISnapShot(_Tag);
      for i:=1 to CountObj do
      begin
        Result.ValueParam[i-1]:=CurrToStr(ArrPIsn[i-1].Value);
      end;
    end;

    vsLAB: begin


    end;

    vsArLAB: begin
      SetLength(_DocRef, CountObj);
      SetLength(_Test, CountObj);
      SetLength(_StanN, CountObj);

      for i:=1 to CountObj do
      begin
        readln(_File, s);
        ReadText(s,Text1);
        Result.EditParam[i-1]:=Text1[0];
        Result.NameParam[i-1]:=Text1[1];
        _DocRef[i-1]:=Text1[1];
        _Test[i-1]:=Text1[2];
        _StanN[i-1]:=Text1[3];
      end;
      ArrLAB:=GetArrResQDIS(_DocRef, _Test, _StanN, _Date);
      for i:=1 to CountObj do
      begin
        Result.ValueParam[i-1]:=copy(ArrLAB[i-1].Value, 13, Length(ArrLAB[i-1].Value)-12);
      end;
    end;

  end;


end;

procedure ExecuteReadQDIS_PI(_Date: TDateTime; var SOAPDATA: TSOAPDATA);
var
  i, j: integer;
  ArrLAB: ArrayOfLabResult;
  _Tag: ArrayOfString;
  _DocRef: ArrayOfString;
  _Test: ArrayOfString;
  _StanN: ArrayOfString;
  ArrPI: ArrayOfPIResult;

begin
  // QDIS
  for i:= 0 to Length(SOAPDATA.ObjectQDIS)-1 do
  begin
    SetLength(_DocRef, Length(SOAPDATA.ObjectQDIS[i].ParamsQDIS));
    SetLength(_Test, Length(SOAPDATA.ObjectQDIS[i].ParamsQDIS));
    SetLength(_StanN, Length(SOAPDATA.ObjectQDIS[i].ParamsQDIS));

    for j:= 0 to Length(SOAPDATA.ObjectQDIS[i].ParamsQDIS)-1 do
    begin
      _DocRef[j]:=SOAPDATA.ObjectQDIS[i].ParamsQDIS[j].DocRef;
      _Test[j]:=SOAPDATA.ObjectQDIS[i].ParamsQDIS[j].Test;
      _StanN[j]:=SOAPDATA.ObjectQDIS[i].ParamsQDIS[j].NSt;

    end;
    ArrLAB:=GetArrResQDIS(_DocRef, _Test, _StanN, _Date);
    for j:= 0 to Length(SOAPDATA.ObjectQDIS[i].ParamsQDIS)-1 do
    begin
      SOAPDATA.ObjectQDIS[i].ParamsQDIS[j].Value:=copy(
                         ArrLAB[j].Value, 13, Length(ArrLAB[j].Value)-12);
    end;

  end;
  // PI
  for i:= 0 to Length(SOAPDATA.ObjectPI)-1 do
  begin
    SetLength(_Tag, Length(SOAPDATA.ObjectPI[i].ParamsPI));

    for j:= 0 to Length(SOAPDATA.ObjectPI[i].ParamsPI)-1 do
    begin
      _Tag[j]:=SOAPDATA.ObjectPI[i].ParamsPI[j].Datch;

    end;
    ArrPI:=GetArrResPI(_Tag, _Date);
    for j:= 0 to Length(SOAPDATA.ObjectPI[i].ParamsPI)-1 do
    begin
      SOAPDATA.ObjectPI[i].ParamsPI[j].Value:=CurrToStr(ArrPI[j].Value);
    end;

  end;


end;

end.
