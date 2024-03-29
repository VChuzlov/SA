unit ActObj;

interface

uses Classes, SysUtils, Dialogs, Windows, MakeRes;

Type
 TCalculation = (tcArom,tcOctan,tcSingle);
 TProcess = (tpNormal,tpBenzene);
 TActivObj = class(TObject)
private
  ExeFile, File_dan, File_rez, File_sk, WorkPath, DataPath: String;
  OktE: double;
  Res: ResT;
  CalcType: TCalculation;
  ProcType: TProcess;
  RefreshFlag, FineCalcFlag: boolean;
  function Prepare:boolean;
public
  property ProcessName: String read ExeFile write ExeFile;
  property DanFile: String read File_dan write File_dan;
  property RezFile: String read File_rez write File_rez;
  property SkFile: String read File_sk write File_sk;
  property ExperimentalOctan: double read OktE write OktE;
  property TypeOfCalculation: TCalculation read CalcType write CalcType;
  property TypeOfProcess: TProcess read ProcType write ProcType;
  property RefreshDanFile: boolean read RefreshFlag write RefreshFlag;
  property CalcComplited: boolean read FineCalcFlag;
  property Results: ResT read Res;
  constructor Create;
  destructor Destroy;
  procedure Calculation;
  function BakupFile(Name: string): string;
  function UnBakupFile(Name: string): string;
end;

implementation

Uses Unit1, Unit4, Unit5, Unit8;

constructor TActivObj.Create;
begin
inherited Create;
FineCalcFlag:=False;
ExeFile:='';
File_dan:='';
File_sk:='';
File_rez:='';
CalcType:=tcArom;
ProcType:=tpNormal;
RefreshFlag:=True;
end;

destructor TActivObj.Destroy;
begin
inherited Destroy;
end;

function TActivObj.BakupFile(Name: string): string;
begin
BakupFile:=WorkPath+ExtractFileName(ChangeFileExt(Name,'.bak'));
end;

function TActivObj.Prepare:boolean;
var Buf:TMemoryStream;
    F:TFileStream;
begin
Result:=false;
If fileExists(ExeFile) and fileExists(File_dan) and fileExists(File_sk) then
 begin
 WorkPath:=ExtractFilePath(ExeFile);
 DataPath:=ExtractFilePath(File_Dan);
 Buf:=TMemoryStream.create;
 Buf.LoadFromFile(File_dan);
 f:=TFileStream.create(WorkPath+'dan.bak',fmCreate or fmShareDenyNone);
 Buf.SaveToStream(f);
 f.free;
 buf.clear;
 buf.LoadFromFile(File_sk);
 f:=TFileStream.create(WorkPath+'sirkat',fmCreate or fmShareDenyNone);
 Buf.SaveToStream(f);
 f.free;
 buf.free;
 result:=true;
 end;
end;

function TActivObj.UnBakupFile(Name: string): string;
begin
UnBakupFile:=DataPath+ExtractFileName(ChangeFileExt(Name,'.dan'));
end;

procedure TActivObj.Calculation;
Var
   i: integer;
   Si: TStartupInfo;
   p: TProcessInformation;
   Buf:TMemoryStream;
   Fs:TFileStream;
   WorkStr:TStringList;
   Ce,Cr,CLKat1,OktR,c: double;
   FAkt,FCl,DoCl,SingleFlag: Boolean;
   Dan: TDanFile;

   a:double;
   b:double;

   ACl:double;
   BCl:double;
//   Res:ResT;
begin
     FineCalcFlag:=False;
     If Prepare then Begin

             { �������� ��������� ������� ���������� �
             ��������� ������ BAK }
             If FileExists(File_Rez) then SysUtils.DeleteFile(File_Rez);
     DoCl:=false;        
                FillChar( Si, SizeOf( Si ) , 0 );
               with Si do begin
                cb := SizeOf( Si);
                dwFlags := startf_UseShowWindow;
                wShowWindow := SW_hide	;
               end;
         Repeat
               CreateProcess(nil,StrPCopy(ComL,ExeFile+' '+
                             {WorkPath+}'dan.bak'),nil,nil,
                             false,Create_default_error_mode,nil,
                             StrPCopy(DirL,WorkPath),si,p);
               if WaitForSingleObject(p.hProcess,2000)=WAIT_TIMEOUT then TerminateProcess(p.hProcess,0);
             if ProcType=tpBenzene
              then
               begin
                    WorkStr:=TStringList.Create;
                    WorkStr.LoadFromFile(WorkPath+'rez');
                    WorkStr.Insert(22,'');
                    WorkStr.Insert(23,'');
                    WorkStr.Insert(62,'');
                    WorkStr.Insert(63,'');
                    WorkStr.SaveToFile(WorkPath+'rez');
                    WorkStr.Free;
                  end;

             Res:=MakeRes.MakeResFile(WorkPath+'rez');
             Cr:=Res.Arom[1,11];
             Ce:=Res.Arom[2,11];
             OktR:=Res.Ochi;
             ClKat1:=Res.ClKat[1];
             SingleFlag:=False;
             ReadDan(Dan,WorkPath+'dan.bak');
             DiClor1:=Dan.DiClor[1];
             Akt:=Dan.Akt;

Case CalcType of

     tcArom: Begin
             FAkt:=abs(Ce-Cr)<=0.051;
             FCl:=(abs(ClKat1-1)<=0.01);

              If (not Fakt) and (not DoCl)then
             begin
             If a=b then If Cr<Ce then
              begin
              a:=-50;
              b:=akt;
              end
             else
              begin
              a:=akt;
              b:=100;
              end
             else If Cr<Ce then b:=c
             else a:=c;
             c:=(A+B)/2;
             akt:=c;
             ACl:=0.1;
             BCl:=20;
             end;

             If (FAkt or DoCl) and (not FCl) then
             begin
              If ClKat1>1 then
               BCl:=DiClor1
              else
               ACl:=DiClor1;
              If not DoCl then
               begin
               a:=0;
               b:=0;
               end;
              DoCl:=True;
              DiClor1:=(ACl+BCl)/2;
             end
             else DoCl:=false;
        end;

    tcOctan: Begin
             FAkt:=abs(OktE-OktR)<=0.051;
             FCl:=(abs(ClKat1-1)<=0.01);

              If (not Fakt) and (not DoCl)then
             begin
             If a=b then If OktR<OktE then
              begin
              a:=-50;
              b:=akt;
              end
             else
              begin
              a:=akt;
              b:=100;
              end
             else If OktR<OktE then b:=c
             else a:=c;
             c:=(A+B)/2;
             akt:=c;
             ACl:=0.1;
             BCl:=20;
             end;

             If (FAkt or DoCl) and (not FCl) then
             begin
              If ClKat1>1 then
               BCl:=DiClor1
              else
               ACl:=DiClor1;
              If not DoCl then
               begin
               a:=0;
               b:=0;
               end;
              DoCl:=True;
              DiClor1:=(ACl+BCl)/2;
             end
             else DoCl:=false;
             end;
   tcSingle: SingleFlag:=True;
     end;
             Dan.Akt:=Akt;
             for i:=1 to 6 do Dan.DiClor[i]:=DiClor1;
             WriteDan(Dan,WorkPath+'dan.bak');
        If Form5.ProgressBar1.Position=100 then Form5.ProgressBar1.Position:=0;
        Form5.ProgressBar1.Position:=Form5.ProgressBar1.Position+1;
        Until (FAkt and FCl) or SingleFlag;
        If FileExists(File_Rez) then sysutils.DeleteFile(File_Rez);

        Buf:=TMemoryStream.create;
        Buf.LoadFromFile(WorkPath+'rez');
        Fs:=TFileStream.create(File_Rez,fmCreate or fmShareDenyNone);
        Buf.SaveToStream(Fs);
        Fs.free;
        buf.Free;

  {���������� � ���� � ������� *.DAN
  ��������� �� ������� ������������ � ����������}

        If RefreshFlag=True then WriteDan(Dan,File_Dan);
        FineCalcFlag:=True;
        end;
end;


end.
