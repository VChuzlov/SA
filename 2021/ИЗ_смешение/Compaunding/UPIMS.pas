unit UPIMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleServer, ExcelXP, ActiveX;

type
  TArrofString=array of string;
  TParamCompPIMS = class
    _Period: string;
    _CountDay: integer;
    FlowCondInd: array of string;
    _NameSheet: array of string;
    _ParamName: array of string;
    _IStart, _IEnd: array of integer;
    ValueParam: array of double;
  end;
  TDataConvPIMS= class
    _ArrPeriodDay: array of integer;
    _ArrPeriod: array of string;
    procedure GetArrPeriod(_EA: TExcelApplication);
    function Exec(_EA: TExcelApplication; _FilePath, _Period: string; CoutDays: integer): TParamCompPIMS;
    function GetValueExcel(_EA:TExcelApplication; _NameSheet, _ParamName, _Period: string; _IStart, _IEnd: integer): double;
    Procedure ReadText(s:string; var Text1:TArrofString);

  end;

  TFPIMS = class(TForm)
    BtOK: TButton;
    BtCancel: TButton;
    CBPeriod: TComboBox;
    Label1: TLabel;
    EA1: TExcelApplication;
    OD1: TOpenDialog;
    procedure BtOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtCancelClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPIMS: TFPIMS;
  DataConvPIMS: TDataConvPIMS;
  ParamCompPIMS: TParamCompPIMS;
implementation

uses StrUtils, ComObj;

{$R *.dfm}

procedure TFPIMS.BtOKClick(Sender: TObject);

begin
  if CBPeriod.Text>'' then
    begin
      ParamCompPIMS:=DataConvPIMS.Exec(EA1, ExtractFilePath(Application.ExeName)+
           'Spisok_datchikov PIMS.ini', CBPeriod.Text, DataConvPIMS._ArrPeriodDay[CBPeriod.ItemIndex]);
    end;
  Ea1.Workbooks.Close(0);
  Ea1.Quit;


end;


{ TDataConvPIMS }



function TDataConvPIMS.Exec(_EA: TExcelApplication; _FilePath, _Period: string; CoutDays: integer): TParamCompPIMS;
var
  i, CountObj: integer;
  s: string;
  _File: TextFile;
  Text1:TArrofString;

begin
  assign(_File, _FilePath);
  reset(_File);
  readln(_File, s);
  ReadText(s,Text1);
  CountObj:=StrToInt(Text1[1]);
  Result:=TParamCompPIMS.Create;
  SetLength(Result.FlowCondInd, CountObj);
  SetLength(Result._NameSheet, CountObj);
  SetLength(Result._ParamName, CountObj);
  SetLength(Result._IStart, CountObj);
  SetLength(Result._IEnd, CountObj);
  SetLength(Result.ValueParam, CountObj);
  Result._Period:=_Period;
  Result._CountDay:=CoutDays;
  for i:=1 to CountObj do
    begin
      readln(_File, s);
      ReadText(s,Text1);
      Result.FlowCondInd[i-1]:=Text1[0];
      Result._NameSheet[i-1]:=Text1[1];
      Result._ParamName[i-1]:=Text1[2];
      Result._IStart[i-1]:=StrToInt(Text1[3]);
      Result._IEnd[i-1]:=StrToInt(Text1[4]);

      Result.ValueParam[i-1]:=GetValueExcel(_EA, Result._NameSheet[i-1],
         Result._ParamName[i-1], _Period, Result._IStart[i-1],
         Result._IEnd[i-1])/CoutDays;   // �������� ������
    end;

end;

procedure TDataConvPIMS.GetArrPeriod(_EA: TExcelApplication);

function GetDays(str: string): integer;
var
  a, b: integer;
begin
  result:=0;
  a:=StrToInt(copy(str, 1, pos('-', str)-1));
  b:=StrToInt(copy(str, pos('-', str)+1, pos(' ', str)-pos('-', str)-1));
  result:=b-a+1;
end;

var
  i: integer;
begin
  SetLength(_ArrPeriod,0);
  SetLength(_ArrPeriodDay,0);
  for i:=1 to _EA.ActiveWorkbook.Sheets.Count do
    if AnsiLowerCase((_EA.ActiveWorkbook.Sheets.Item[i] as _Worksheet).Name)=AnsiLowerCase('�����') then
    begin
      (_EA.ActiveWorkbook.Sheets.Item[i] as _Worksheet).Activate(0);
      break;
    end;
  for i:=10 to 21 do  //�������� 12 ��������
  begin
    if String(_EA.Cells.Item[19, i])<>'' then
    begin
      SetLength(_ArrPeriod, Length(_ArrPeriod)+1);
      SetLength(_ArrPeriodDay, Length(_ArrPeriodDay)+1);
      _ArrPeriod[Length(_ArrPeriod)-1]:=_EA.Cells.Item[19, i];
      _ArrPeriodDay[Length(_ArrPeriodDay)-1]:=GetDays(_EA.Cells.Item[19, i]);

    end;
  end;
end;

function TDataConvPIMS.GetValueExcel(_EA: TExcelApplication; _NameSheet,
  _ParamName, _Period: string; _IStart, _IEnd: integer): double;
var
  i, j: integer;
  INaim: integer;
begin
  //
  result:=0;
  for i:=1 to _EA.ActiveWorkbook.Sheets.Count do
    if AnsiLowerCase((_EA.ActiveWorkbook.Sheets.Item[i] as _Worksheet).Name)=AnsiLowerCase(_NameSheet) then
    begin
      (_EA.ActiveWorkbook.Sheets.Item[i] as _Worksheet).Activate(0);
      break;
    end;

  for i:=_IStart-5 to _IEnd+5 do
  begin
    if String(_EA.Cells.Item[i, 7])='������������' then
    begin
      INaim:=i;
      break;
    end;
  end;

  for i:=_IStart to _IEnd do
  begin
    if String(_EA.Cells.Item[i, 7])=_ParamName then
    begin
      for j:=11 to 44 do //�������� 12 ��������
      begin
        if String(_EA.Cells.Item[INaim, j])=_Period then
        begin
          result:=result+StrToFloat(String(_EA.Cells.Item[i, j+2]));
          break;
        end;
      end;
      //break;
    end;
  end;
end;

procedure TDataConvPIMS.ReadText(s: string; var Text1: TArrofString);
var
 i:integer;
 ColResh: array of integer;
begin
 While Pos(' #',S)<>0 do
  begin
    delete(S,Pos(' #', S),1);
  end;
  While Pos('# ',S)<>0 do
  begin
    delete(S,Pos('# ', S)+1,1);
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

procedure TFPIMS.FormShow(Sender: TObject);
var
  
  i: integer;
begin
  if od1.Execute then
  begin
    EA1.Connect;
    Ea1.DisplayAlerts[0]:=false;
    CoInitialize(nil);
    EA1.Workbooks.Open(OD1.FileName, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam
      , EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam
      , EmptyParam, EmptyParam, 0);
    DataConvPIMS:= TDataConvPIMS.Create;
    DataConvPIMS.GetArrPeriod(EA1);
    for i:=0 to Length(DataConvPIMS._ArrPeriod)-1 do
    begin
      CBPeriod.Items.Add(DataConvPIMS._ArrPeriod[i]);
    end;
    
  end;
end;

procedure TFPIMS.BtCancelClick(Sender: TObject);
begin
  Ea1.Workbooks.Close(0);
  Ea1.Quit;
end;

end.
