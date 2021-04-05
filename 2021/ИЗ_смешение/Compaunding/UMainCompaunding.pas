unit UMainCompaunding;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, IniFiles, ImgList, ComCtrls, ToolWin, ExtCtrls, StdCtrls,
  XPMan, jpeg, OleServer, ExcelXP, ShellApi;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    SaveAs1: TMenuItem;
    Composition1: TMenuItem;
    OctaneValue1: TMenuItem;
    Flowof1: TMenuItem;
    Window1: TMenuItem;
    Cascade1: TMenuItem;
    ile1: TMenuItem;
    Settings1: TMenuItem;
    Parameters1: TMenuItem;
    ToolBar1: TToolBar;
    TBSmesh: TToolButton;
    ToolButton2: TToolButton;
    TBSootn: TToolButton;
    Image1: TImage;
    ToolButton1: TToolButton;
    TBSettings: TToolButton;
    ImageList1: TImageList;
    TBExcel: TToolButton;
    EA1: TExcelApplication;
    ToolButton3: TToolButton;
    Memo1: TMemo;
    Memo2: TMemo;
    ToolButton4: TToolButton;
    TBDownLoadSK: TToolButton;
    OD1: TOpenDialog;
    SD1: TSaveDialog;
    N1: TMenuItem;
    N2: TMenuItem;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    procedure OctaneValue1Click(Sender: TObject);
    procedure Flowof1Click(Sender: TObject);
    procedure Cascade1Click(Sender: TObject);
    procedure Tile1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Parameters1Click(Sender: TObject);
    procedure TBExcelClick(Sender: TObject);
    procedure TBDownLoadSKClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  Max_Olefin = 5;  // максимальное значение олефинов, при кот. они не записываются в sk

var
  MainForm: TMainForm;

implementation

uses UOVofFlow, UFlowOfVO, UParam, UMath, Math, Unit1, Grids,
  UOVofFlowLite, UFlowOfVOLite;

{$R *.dfm}

procedure TMainForm.OctaneValue1Click(Sender: TObject);
begin
  Application.CreateForm(TFormOVofFlow, FormOVofFlow);
  // создаем дочернюю форму, когда это нужно
  
end;

procedure TMainForm.Flowof1Click(Sender: TObject);
begin
  Application.CreateForm(TFormFlowofOV, FormFlowofOV);
end;

procedure TMainForm.Cascade1Click(Sender: TObject);
begin
  Cascade;
end;

procedure TMainForm.Tile1Click(Sender: TObject);
begin
  Tile;
end;

procedure TMainForm.FormShow(Sender: TObject);
var
  MyIniFile: TIniFile;
begin
  MyIniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'Config.ini');
  if MyIniFile.ReadString('Base', 'Sourse', 'file')='FILE' then
    FormParam.RGSourse.ItemIndex:=0;
  if MyIniFile.ReadString('Base', 'Sourse', 'file')='SELFINI' then
    FormParam.RGSourse.ItemIndex:=1;
  if MyIniFile.ReadString('Base', 'Sourse', 'file')='SELFACCESS' then
    FormParam.RGSourse.ItemIndex:=1;

  
end;

procedure TMainForm.Parameters1Click(Sender: TObject);
begin
  FormParam.ShowModal;
end;

procedure TMainForm.TBExcelClick(Sender: TObject);
var
  i, j:integer;
  TotalFlow: TTotalFlowCompaunding;
  OV: double;
begin
  ea1.Connect;
  ea1.Workbooks.Add(EmptyParam, 0);
  {ea1.Range['B2', 'B113'].NumberFormat:='#######0,00';
  ea1.Range['F2', 'F13'].NumberFormat:='#######0,00';
  ea1.Range['H2', 'I113'].NumberFormat:='#######0,00';
   }
  ea1.Cells.NumberFormat:='#######0,000';
  if ActiveMDIChild is TFormOVofFlow then
  begin
    with (ActiveMDIChild as TFormOVofFlow) do
    begin
      GetTotalFlow(TotalFlow);
      with TotalFlow do
      begin
        ea1.Cells.Item[1,1]:='Компонент';
        ea1.Cells.Item[1,2]:='Конц., мас. %';
        for i:=0 to Length(Components)-1 do
        begin
          ea1.Cells.Item[i+2,1]:=Components[i].Name;
          ea1.Cells.Item[i+2,2]:=(Components[i].ConcentrComp);
        end;
        {ea1.Cells.Item[1,3]:='ОЧИ';
        ea1.Cells.Item[2,3]:='ОЧM';

        OV:=RoundTo(TotalFlowOctaneValue, -1);
        ea1.Cells.Item[1,4]:=(OV);

        OV:=RoundTo(TotalFlowOctaneValue(false), -1);
        ea1.Cells.Item[2,4]:=(OV);}

        for i:=0 to StringGridResult.RowCount-1 do
        begin
          for j:=0 to StringGridResult.ColCount-1 do
          begin
            if (i=0) or (j=0) then
              ea1.Cells.Item[i+1,j+5]:=(StringGridResult.Cells[j,i])
            else
              ea1.Cells.Item[i+1,j+5]:=StrToFloat(StringGridResult.Cells[j,i]);
          end;
        end;

        for i:=0 to StringGridItogSostav.RowCount-1 do
        begin
          for j:=0 to StringGridItogSostav.ColCount-1 do
          begin
            if (i=0) or (j=0) then
              ea1.Cells.Item[i+1,j+5+StringGridResult.ColCount]:=StringGridItogSostav.Cells[j,i]
            else
              ea1.Cells.Item[i+1,j+5+StringGridResult.ColCount]:=StrToFloat(StringGridItogSostav.Cells[j,i]);

          end;
        end;
      end;
    end;
  end;
  if ActiveMDIChild is TFormFlowofOV then
  begin
    with (ActiveMDIChild as TFormFlowofOV) do
    begin
      GetTotalFlow(TotalFlow);
      
      with TotalFlow do
      begin
        ea1.Cells.Item[1,1]:='Компонент';
        ea1.Cells.Item[1,2]:='Конц., мас. %';
        for i:=0 to Length(Components)-1 do
        begin
          ea1.Cells.Item[i+2,1]:=Components[i].Name;

          ea1.Cells.Item[i+2,2]:=(Components[i].ConcentrComp);
        end;
        {ea1.Cells.Item[1,3]:='ОЧИ';
        ea1.Cells.Item[2,3]:='ОЧM';

        OV:=RoundTo(TotalFlowOctaneValue, -1);
        ea1.Cells.Item[1,4]:=FloatToStr(OV);

        OV:=RoundTo(TotalFlowOctaneValue(false), -1);
        ea1.Cells.Item[2,4]:=FloatToStr(OV);}

        for i:=0 to StringGridResult.RowCount-1 do
        begin
          for j:=0 to StringGridResult.ColCount-1 do
          begin
            if (i=0) or (j=0) then
              ea1.Cells.Item[i+1,j+5]:=StringGridResult.Cells[j,i]
            else
              ea1.Cells.Item[i+1,j+5]:=StrToFloat(StringGridResult.Cells[j,i]);
          end;
        end;
        for i:=0 to SG1Itog.RowCount-1 do
        begin
          for j:=0 to SG1Itog.ColCount-1 do
          begin
            if (j=SG1Itog.ColCount-1) and (i>0)
              and (SG1Itog.Cells[j,i]<>'') then
              ea1.Cells.Item[i+1,j+5+StringGridResult.ColCount]:=StrToFloat(SG1Itog.Cells[j,i])
            else
              ea1.Cells.Item[i+1,j+5+StringGridResult.ColCount]:=SG1Itog.Cells[j,i];
          end;
        end;

        
      end;
    end;
  end;

  ea1.Visible[0]:=true;

  {ea1.Workbooks.Close(0);
  ea1.Quit;
  ea1.Disconnect;}
end;

procedure TMainForm.TBDownLoadSKClick(Sender: TObject);



var
  OldFilterOD, OldFilterSD: string;
  TotalFlow: TTotalFlowCompaunding;   
begin
  OldFilterOD:=OD1.Filter;
  OD1.Filter:='XLS|*.xls';
  if OD1.Execute then
  begin
   TotalFlow:= TTotalFlowCompaunding.Create;

    TotalFlow.DownLoadSir(OD1.FileName, Memo1, Ea1);
    ShowMessage('Произведена идентификация олефинов!');
    Form1.Button1.Click;


    // пришлось немного извратиться, чтобы полученный sk файл опять загружался в мемо и лишь потом сохранялся....
    Memo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+
                   'bin\sk\Komsomol\01-09-09\01-09-09.sk');



    if TotalFlow.Olefin.CalcSumAll>=Max_Olefin then
       TotalFlow.WriteToSkEN(Memo1);

    OldFilterSD:=SD1.Filter;
    SD1.Filter:='SK|*.SK';
    SD1.DefaultExt:='SK';
    if SD1.Execute then
    begin
      Memo1.Lines.SaveToFile(SD1.FileName);
    end;
    SD1.Filter:=OldFilterSD;
  end;
  OD1.Filter:=OldFilterOD;
  Memo1.Clear;
  Memo2.Clear;
end;

procedure TMainForm.N2Click(Sender: TObject);
begin
  ShellExecute(Form1.Handle, nil, 'Instruction.docx', nil, PChar(ExtractFilePath(Application.ExeName)) , SW_SHOWMAXIMIZED);
end;

procedure TMainForm.ToolButton5Click(Sender: TObject);
begin
  Application.CreateForm(TFormOVofFlowLite, FormOVofFlowLite);
  // создаем дочернюю форму, когда это нужно

end;

procedure TMainForm.ToolButton6Click(Sender: TObject);
begin
  Application.CreateForm(TFormFlowofOVLite, FormFlowofOVLite);
end;

end.
