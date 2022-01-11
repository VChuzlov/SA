unit ETVDImport;

interface

uses Classes, SysUtils, Windows, ETVDData, Unit8, Unit9;

Type

TETVDImp = class(TObject)

private
    ETVDData : TETVDData;

public
    function GetDBDan(CurDate:TDateTime):TDanFile;
    function GetDBSK(CurDate:TDateTime):TSkFile;
    function GetDBOctan(CurDate:TDateTime):double;
    function GetDBArom(CurDate:TDateTime):double;
    constructor Create;
    destructor Destroy; override;

end;

implementation

Uses Unit5;

constructor TETVDImp.Create;
begin
inherited Create;
ETVDData := TETVDData.Create;
end;

destructor TETVDImp.Destroy;
begin
inherited Destroy;
end;

function TETVDImp.GetDBDan(CurDate:TDateTime):TDanFile;
var
  ResultData : TParametersDataArray;
  i:integer;
Begin
ResultData := ETVDData.GetData(CurDate);
Result.DaOt:=ETVDData.GetParamValueByID(ResultData,2).tTime;
Result.DaRe:=StrToDate(Unit5.ZiklData);//ETVDData.GetParamValueByID(ResultData,1).dValue;
Result.Vsir:=ETVDData.GetParamValueByID(ResultData,12).dValue;
Result.Rs:=ETVDData.GetParamValueByID(ResultData,11).dValue;
Result.Rg:=ETVDData.GetParamValueByID(ResultData,13).dValue;
Result.Pressure[1]:=ETVDData.GetParamValueByID(ResultData,5).dValue;
Result.Pressure[2]:=ETVDData.GetParamValueByID(ResultData,6).dValue;
Result.Pressure[3]:=ETVDData.GetParamValueByID(ResultData,7).dValue;
Result.Temperature[1]:=ETVDData.GetParamValueByID(ResultData,2).dValue;
Result.Temperature[2]:=ETVDData.GetParamValueByID(ResultData,3).dValue;
Result.Temperature[3]:=ETVDData.GetParamValueByID(ResultData,4).dValue;
Result.DifTemp[1]:=ETVDData.GetParamValueByID(ResultData,8).dValue;
Result.DifTemp[2]:=ETVDData.GetParamValueByID(ResultData,9).dValue;
Result.DifTemp[3]:=ETVDData.GetParamValueByID(ResultData,10).dValue;
for i:=1 to 9 do Result.C[i]:=ETVDData.GetParamValueByID(ResultData,15+i).dValue;
Result.Vl:=ETVDData.GetParamValueByID(ResultData,14).dValue;
Result.Sera:=ETVDData.GetParamValueByID(ResultData,15).dValue;
end;

function TETVDImp.GetDBSK(CurDate:TDateTime):TSkFile;
var
      ResultData : TParametersDataArray;
      i:integer;
Begin
       ResultData := ETVDData.GetData(CurDate);
       For i:=1 to 52 do Begin
           Result.SostavSir[i]:=ETVDData.GetParamValueByID(ResultData,33+i).dValue;
           Result.SostavKat[i]:=ETVDData.GetParamValueByID(ResultData,101+i).dValue;
                         End;
       Result.SostavSir[53]:=ETVDData.GetParamValueByID(ResultData,170).dValue;
       Result.SostavKat[53]:=ETVDData.GetParamValueByID(ResultData,171).dValue;
       For i:=54 to 69 do Begin
           Result.SostavSir[i]:=ETVDData.GetParamValueByID(ResultData,32+i).dValue;
           Result.SostavKat[i]:=ETVDData.GetParamValueByID(ResultData,100+i).dValue;
                          End;
       for i:=1 to 6 do
        begin
        Result.SostavFr[i]:=ETVDData.GetParamValueByID(ResultData,26+i).dValue;
        end;
       result.Ochi:=ETVDData.GetParamValueByID(ResultData,25).dValue;
       Result.Arom:=ETVDData.GetParamValueByID(ResultData,26).dValue;
End;



function TETVDImp.GetDBOctan(CurDate:TDateTime):double;
var
      ResultData : TParametersDataArray;
begin
ResultData := ETVDData.GetData(CurDate,0);
result:=ETVDData.GetParamValueByID(ResultData,25).dValue;
end;

function TETVDImp.GetDBArom(CurDate:TDateTime):double;
var
      ResultData : TParametersDataArray;
begin
ResultData := ETVDData.GetData(CurDate,0);
result:=ETVDData.GetParamValueByID(ResultData,26).dValue;
end;

end.
