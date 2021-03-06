unit UiniExcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IniFiles, OleServer, ExcelXP, StrUtils, Grids, ActiveX;

type
  TArrofString=array of string;
  TParamComp = class
    _Date: TDate;
    EditParam: array of string;
    NameParam: array of string;
    ValueParam: array of string;
    function SearchData(_NameParam: string): string; {��������� ValueParam}
  end;
  TDataConv= class
    function ExecuteRead(_Date: TDate; _FilePath: string; _Excel: TExcelApplication): TParamComp;
    Function Find(sText:String;Var iRow:Integer;Var sCol:String;WorkSheetF:_WorkSheet):Bool;
    function FindCellDate(CBox: TComboBox; WorkSheetF:_WorkSheet;Var iRow:Integer;Var sCol:String): bool;
  end;
  TINIExcel = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    OD1: TOpenDialog;
    EA1: TExcelApplication;
    SG1: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  INIExcel: TINIExcel;
  _DataConv:TDataConv;
  _ParamComp: TParamComp;

  Procedure ReadText(s:string; var Text1:TArrofString);

implementation

uses ComObj;

{$R *.dfm}

Function TDataConv.Find(sText:String;Var iRow:Integer;Var sCol:String;WorkSheetF:_WorkSheet):Bool;
Var
 UsedRange, Range: OLEVariant;
 t,y:Integer;//????????? ??? ???????
 FirstAddress: string;
begin //?????
  Result:=False;
  UsedRange := WorkSheetF.Range['A1','DD5000'];
  Range := UsedRange.Find(What:=sText, LookIn := xlValues, LookAt := xlWhole,SearchDirection := xlNext);
  if not VarIsClear(Range) then begin
    try
      FirstAddress := Range.Address;
      //????????? ????? ?????? ?? ??????????? ??????(?????????? ??????????)
      //?? ?????????? ????? ??????? ?????? ???????
      t:=PosEx('$',FirstAddress,2);
      iRow:=StrToInt(Copy(FirstAddress,t+1,length(FirstAddress)-t));
      //????????? ????? ??????? ?? ??????????? ??????(?????????? ??????????)
      //????? ?????????? ?? ??????? ???????
      y:=PosEx('$',FirstAddress,2);
      sCol:=Copy(FirstAddress,2,y-2);
      Result:=true;
      VarClear(Range);
      VarClear(UsedRange);
    except
      Result:=False;
    end;//try-except
  end;//if
end;


procedure TINIExcel.FormShow(Sender: TObject);
var
  iRow: Integer;
  sCol: String;
begin
  OD1.FilterIndex:=1;
  If OD1.Execute then
   begin
     _DataConv:=TDataConv.Create;
     CoInitialize(nil);
     EA1.Connect;
     EA1.Workbooks.Open(Od1.FileName, EmptyParam,EmptyParam,EmptyParam,
      EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,
      EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,0);
     _DataConv.FindCellDate(ComboBox1, Ea1.ActiveSheet as _Worksheet, iRow, sCol);
   end;
end;

{ TParamComp }

function TParamComp.SearchData(_NameParam: string): string;
var
  i: integer;
begin
  result:='';
  for i:=0 to length(NameParam) do
    begin
      if _NameParam = NameParam[i] then
       begin
         result:=ValueParam[i];
         break;
       end;
    end;
  
end;

{ TDataConv }

function TDataConv.ExecuteRead(_Date: TDate; _FilePath: string;
  _Excel: TExcelApplication): TParamComp;
var
  i, CountObj: integer;
  s, sCol1, sCol2: string;
  _File: TextFile;
  Text1:TArrofString;
  iRow1, iRow2: integer;
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
  for i:=1 to CountObj do
    begin
      readln(_File, s);
      ReadText(s,Text1);
      Result.EditParam[i-1]:=Text1[0];
      Result.NameParam[i-1]:=Text1[1];
    end;

  Find(DateToStr(_Date), iRow2, sCol2, _Excel.ActiveSheet as _Worksheet);
  for i:=0 to CountObj-1 do
  begin
    sCol1:='';
    Find(Result.NameParam[i], iRow1, sCol1, _Excel.ActiveSheet as _Worksheet);
    if (iRow1>0) and (sCol1>'') then
    begin
      s:=(_Excel.ActiveSheet as _Worksheet).Range[sCol1+IntToStr(iRow2), sCol1+IntToStr(iRow2)].Item[1,1];
      Result.ValueParam[i]:=s;
    end;
  end;

end;

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


procedure TINIExcel.BitBtn2Click(Sender: TObject);
var
  i: integer;

  strIni, strExcel: string;
begin
  strIni:=ExtractFilePath(Application.ExeName)+'Spisok_datchikov.ini';

  if ComboBox1.Text<>'' then
     _ParamComp:=_DataConv.ExecuteRead(StrToDate(ComboBox1.Text), strIni, EA1);

  SG1.RowCount:=Length(_ParamComp.NameParam);
  for i:=0 to Sg1.RowCount-1 do
  begin

    SG1.Cells[0, i]:=_ParamComp.NameParam[i];
    SG1.Cells[1, i]:=_ParamComp.ValueParam[i];

  end;
end;


function TDataConv.FindCellDate(CBox: TComboBox; WorkSheetF: _WorkSheet; var iRow: Integer;
  var sCol: String): bool;
var

  i, j, _count: integer;
  old_sCol, str: String;
begin
  result:=false;
  _count:=0;
  for i:=1 to 30 do
    for j:=1 to 12 do
    begin
      if _count>2 then break;
      old_sCol:=sCol;
      str:='0'+IntToStr(i)+'.0'+IntToStr(j)+'.*';
      if (i<10) and (j<10) then
        str:='0'+IntToStr(i)+'.0'+IntToStr(j)+'.*';
      if (i>=10) and (j<10) then
        str:=IntToStr(i)+'.0'+IntToStr(j)+'.*';
      if (i<10) and (j>=10) then
        str:='0'+IntToStr(i)+'.'+IntToStr(j)+'.*';
      if (i>=10) and (j>=10) then
        str:=''+IntToStr(i)+'.'+IntToStr(j)+'.*';

      if Find(str, iRow, sCol, WorkSheetF) then
      begin
        if old_sCol=sCol then
          _count:=_count+1;
      end;

    end;
  if _count>=1 then
  begin
    result:=true;
    CBox.Items.Clear;
    for i:=1 to 1000 do
    begin
      str:=WorkSheetF.Cells.Range[sCol+IntToStr(i), sCol+IntToStr(i)].Item[1,1];
      if str<>'' then
      begin

        CBox.Items.Append(str);
      end
      
    end;

  end;
end;

procedure TINIExcel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  EA1.DisplayAlerts[0]:=false;
  EA1.Quit;
  EA1.Disconnect;

end;

end.



