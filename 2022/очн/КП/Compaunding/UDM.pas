unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB, UMath;

type
  TDM = class(TDataModule)
    ADOC: TADOConnection;
    ADOTable: TADOTable;
    ADOTableVarName: TADOTable;
    ADOTableVarNameKey: TAutoIncField;
    ADOTableVarNameSubst: TWideStringField;
    ADOTableVarNameVarName: TMemoField;
    ADOTableKey: TAutoIncField;
    ADOTableSubst: TMemoField;
    ADOTableCoefB: TFloatField;
    ADOTableMotON: TFloatField;
    ADOTableResON: TFloatField;
    ADOTableRo20: TFloatField;
    ADOTableTemKip: TFloatField;
    ADOTableDNP_A: TFloatField;
    ADOTableDNP_B: TFloatField;
    ADOTableDNP_C: TFloatField;
    ADOTableMolarMass: TFloatField;
    function GetCompFromName(NameComp: string): TComponentCompaunding;
    function GetSubstFromName(NameComp: string): string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

{ TDM }

function TDM.GetCompFromName(NameComp: string): TComponentCompaunding;
var
  MyComp: TComponentCompaunding;
begin
  result:=nil;

  ADOTable.Filtered:=true;

  ADOTable.Filter:='Subst='+quotedstr(NameComp);
  if ADOTable.RecordCount=0 then
  begin
    ADOTable.Filter:='Subst='+quotedstr(GetSubstFromName(NameComp));
  end;

  MyComp:= TComponentCompaunding.Create;
  MyComp.Name:=ADOTableSubst.Value;
  MyComp.CoefB:=ADOTableCoefB.Value;
  MyComp.MotON:=ADOTableMotON.Value;
  MyComp.ResON:=ADOTableResON.Value;
  MyComp.Ro20:=ADOTableRo20.Value;
  MyComp.TemKip:=ADOTableTemKip.Value;
  MyComp.DNP_A:=ADOTableDNP_A.Value;
  MyComp.DNP_B:=ADOTableDNP_B.Value;
  MyComp.DNP_C:=ADOTableDNP_C.Value;
  MyComp.MolarMass:=ADOTableMolarMass.Value;

  ADOTable.Filtered:=False;

  result:=MyComp;
end;

function TDM.GetSubstFromName(NameComp: string): string;
var
  i: integer;
begin
  Result:='';
  ADOTableVarName.First;
  for i:=1 to ADOTableVarName.RecordCount do
  begin
    if pos(NameComp,ADOTableVarNameVarName.Value)>0 then
    begin
      result:=ADOTableVarNameSubst.Value;
      exit;
    end;
    ADOTableVarName.Next;
  end;
end;

end.
