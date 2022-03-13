unit UFlowOfVO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, TeeProcs, TeEngine, Chart, Math,
  UMath, IniFiles, ComCtrls, Series, Menus, XPMan, clipbrd, OleServer,
  ExcelXP;

type
  TFormFlowofOV = class(TForm)
    NB: TNotebook;
    Panel1: TPanel;
    BitBtnBack: TBitBtn;
    BitBtnForward: TBitBtn;
    BitBtnCancelOrReady: TBitBtn;
    Panel2: TPanel;
    Panel4: TPanel;
    ListBoxEndSelectFlow: TListBox;
    Panel5: TPanel;
    ListBoxAllFlow: TListBox;
    Panel3: TPanel;
    SpeedButtonInSelectFlow: TSpeedButton;
    SpeedButtonInAllFlow: TSpeedButton;
    ListBoxSelectFlow: TListBox;
    Panel6: TPanel;
    ListBoxAllAdditive: TListBox;
    Panel7: TPanel;
    SpeedButtonInSelectAdditive: TSpeedButton;
    SpeedButtonInAllAdditive: TSpeedButton;
    ListBoxSelectAdditive: TListBox;
    Label2: TLabel;
    Panel8: TPanel;
    ListBoxEndSelectAdditive: TListBox;
    Panel9: TPanel;
    Label10: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    EditValueAdditive: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    EditFirstValueAdditive: TEdit;
    Label14: TLabel;
    EditLastValueAdditive: TEdit;
    Panel10: TPanel;
    Panel11: TPanel;
    Label3: TLabel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    BitBtn1: TBitBtn;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    OD1: TOpenDialog;
    Panel25: TPanel;
    Panel26: TPanel;
    btCreate: TButton;
    btSave: TButton;
    SD1: TSaveDialog;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    Label5: TLabel;
    EditExpendFlow: TEdit;
    Button1: TButton;
    Label1: TLabel;
    EditP: TEdit;
    EditdeltaOVmax: TEdit;
    Label6: TLabel;
    EditKeff: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    EditCmaxAdditive: TEdit;
    StatusBar1: TStatusBar;
    Label9: TLabel;
    EditStep: TEdit;
    PM1: TPopupMenu;
    Copy1: TMenuItem;
    EditNeedOV: TEdit;
    Label15: TLabel;
    RG_ON: TRadioGroup;
    PageControl1: TPageControl;
    TabSheet4: TTabSheet;
    StringGridResult: TStringGrid;
    TabSheet5: TTabSheet;
    StringGridItogSostav: TStringGrid;
    PMStrFlow: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    PMFlow: TPopupMenu;
    MenuItem4: TMenuItem;
    XPManifest1: TXPManifest;
    BitBtn3: TBitBtn;
    PrBar: TProgressBar;
    ChartResult: TChart;
    PCStrFlow: TPageControl;
    TabSheet1: TTabSheet;
    StringGridStructureOfFlow: TStringGrid;
    TabSheet2: TTabSheet;
    StringGridMotON: TStringGrid;
    TabSheet3: TTabSheet;
    StringGridResON: TStringGrid;
    TabSheet6: TTabSheet;
    StringGridGOST: TStringGrid;
    TabSheet7: TTabSheet;
    StringGridCoefB: TStringGrid;
    TabSheet8: TTabSheet;
    StringGridRo20: TStringGrid;
    TabSheet9: TTabSheet;
    StringGridTemKip: TStringGrid;
    TabSheet10: TTabSheet;
    StringGridDNP_A: TStringGrid;
    TabSheet11: TTabSheet;
    StringGridDNP_B: TStringGrid;
    TabSheet12: TTabSheet;
    StringGridDNP_C: TStringGrid;
    EditTempFlow: TEdit;
    Label16: TLabel;
    TabSheet13: TTabSheet;
    StringGridMolarMass: TStringGrid;
    PMSave: TPopupMenu;
    InFile1: TMenuItem;
    InBase1: TMenuItem;
    BtSaveAs: TBitBtn;
    ButtonStructure: TBitBtn;
    BtPravilo: TBitBtn;
    TabSheet14: TTabSheet;
    StringGridMuA: TStringGrid;
    TabSheet15: TTabSheet;
    StringGridMuB: TStringGrid;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    ListBoxUslov: TListBox;
    Panel31: TPanel;
    Label17: TLabel;
    BtSetCondition: TButton;
    Edit1: TEdit;
    Label18: TLabel;
    Edit2: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label21: TLabel;
    Edit5: TEdit;
    Label22: TLabel;
    Button2: TButton;
    Button3: TButton;
    Label23: TLabel;
    Edit6: TEdit;
    Label24: TLabel;
    Edit7: TEdit;
    Button4: TButton;
    RadioGroup1: TRadioGroup;
    Edit8: TEdit;
    Button5: TButton;
    Label25: TLabel;
    Edit9: TEdit;
    Label26: TLabel;
    Edit10: TEdit;
    Label27: TLabel;
    Edit11: TEdit;
    SG1Itog: TStringGrid;
    Splitter1: TSplitter;
    PM5: TPopupMenu;
    InBufer: TMenuItem;
    Label28: TLabel;
    Edit12: TEdit;
    Button6: TButton;
    RGVidDolej: TRadioGroup;
    BitBtnRVS: TBitBtn;
    BtPIMS: TButton;
    EA1: TExcelApplication;
    Label29: TLabel;
    EdPrice: TEdit;
    Edit13: TEdit;
    Label30: TLabel;
    BtNull: TButton;
    procedure BitBtnCancelOrReadyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnBackClick(Sender: TObject);
    procedure BitBtnForwardClick(Sender: TObject);
    procedure SpeedButtonInSelectFlowClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButtonInAllFlowClick(Sender: TObject);
    procedure ButtonStructureClick(Sender: TObject);
    procedure ListBoxEndSelectFlowClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButtonInSelectAdditiveClick(Sender: TObject);
    procedure SpeedButtonInAllAdditiveClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btCreateClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure EditExpendFlowChange(Sender: TObject);
    procedure EditExpendFlowKeyPress(Sender: TObject; var Key: Char);
    procedure ListBoxEndSelectAdditiveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure BtInfileClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure StringGridStructureOfFlowSetEditText(Sender: TObject; ACol,
      ARow: Integer; const Value: String);
    procedure BitBtn3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure BtPraviloClick(Sender: TObject);
    procedure BtSaveAsClick(Sender: TObject);
    procedure InBase1Click(Sender: TObject);
    procedure GetTotalFlow(var TotalFlow: TTotalFlowCompaunding);
    procedure GetTotalFlowOfArr(var TotalFlow: TTotalFlowCompaunding; Ind: integer);

    procedure EditTempFlowChange(Sender: TObject);
    procedure ListBoxUslovDblClick(Sender: TObject);
    procedure BtSetConditionClick(Sender: TObject);
    procedure ListBoxUslovClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure DefaultSetData;
    procedure InBuferClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure RGVidDolejClick(Sender: TObject);
    procedure BitBtnRVSClick(Sender: TObject);
    procedure BtPIMSClick(Sender: TObject);
    procedure ExportToExcelArrTotalFlow;
    procedure EdPriceChange(Sender: TObject);
    procedure EdPriceKeyPress(Sender: TObject; var Key: Char);
    procedure BtNullClick(Sender: TObject);
  private
    TotalFlowCompaunding: TTotalFlowCompaunding;
    TotalFlowCompaundingInside: TTotalFlowCompaunding;{ Private declarations }
    ArrTotalFlowCompaunding: TArrTotalFlowCompaunding;  // ��� ������ � PIMS

  public
    { Public declarations }
  end;

var
  FormFlowofOV: TFormFlowofOV;

implementation

uses USecondForm, UPravilo, UParam, UMainCompaunding, UCondition,
   UGrupp, MashaStyle1, URezervuar, UPIMS;


{$R *.dfm}

procedure TFormFlowofOV.BitBtnCancelOrReadyClick(Sender: TObject);
var
  i: integer;
begin
  if (StatusBar1.Panels[1].Text='�����: PIMS')
     and (BitBtnCancelOrReady.Caption='������') then
  begin
    TotalFlowCompaunding._StringGridResult:=StringGridResult;
    TotalFlowCompaunding._SG1Itog:=SG1Itog;
    ArrTotalFlowCompaunding.AddItem(TotalFlowCompaunding);
    for i:=0 to Length(TotalFlowCompaunding.Flows)-1 do
    begin
      TotalFlowCompaunding.Flows[i].ExistExpenditure2:=
        TotalFlowCompaunding.Flows[i].ExistExpenditure+
        TotalFlowCompaunding.Flows[i].ExpenditureOfDay;
    end;
    ExportToExcelArrTotalFlow;
  end;
  Close;
end;

procedure TFormFlowofOV.FormShow(Sender: TObject);
var
  i: integer;
begin
  // ������ �������� � �������
  NB.PageIndex:=0;
  PCStrFlow.TabIndex:=0;
  StringGridStructureOfFlow.Cells[0,0]:='���������';
  StringGridStructureOfFlow.Cells[1,0]:='����., %���.';
  StringGridStructureOfFlow.ColWidths[0]:=160;
  StringGridStructureOfFlow.ColWidths[1]:=80;
  StringGridResult.ColWidths[0]:=160;
  StringGridResult.ColWidths[1]:=80;
  StringGridMotON.Cells[0,0]:='���������';
  StringGridMotON.Cells[1,0]:='�� �� ��';
  StringGridMotON.ColWidths[0]:=160;
  StringGridMotON.ColWidths[1]:=80;
  StringGridResON.Cells[0,0]:='���������';
  StringGridResON.Cells[1,0]:='�� �� ��';
  StringGridResON.ColWidths[0]:=160;
  StringGridResON.ColWidths[1]:=80;
  StringGridItogSostav.Cells[0,0]:='���������';
  StringGridItogSostav.Cells[1,0]:='����., %���.';
  StringGridItogSostav.Cells[2,0]:='����., %���.';
  StringGridItogSostav.ColWidths[0]:=160;
  StringGridItogSostav.ColWidths[1]:=80;
  //StringGridItogSostav.ColWidths[2]:=80;

  StringGridGOST.Cells[0,0]:='���������';
  StringGridGOST.Cells[1,0]:='����., %���.';
  StringGridGOST.ColWidths[0]:=160;
  StringGridGOST.ColWidths[1]:=80;

  StringGridCoefB.Cells[0,0]:='���������';
  StringGridCoefB.Cells[1,0]:='��������';
  StringGridCoefB.ColWidths[0]:=160;
  StringGridCoefB.ColWidths[1]:=80;

  StringGridRo20.Cells[0,0]:='���������';
  StringGridRo20.Cells[1,0]:='��������';
  StringGridRo20.ColWidths[0]:=160;
  StringGridRo20.ColWidths[1]:=80;

  StringGridTemKip.Cells[0,0]:='���������';
  StringGridTemKip.Cells[1,0]:='��������';
  StringGridTemKip.ColWidths[0]:=160;
  StringGridTemKip.ColWidths[1]:=80;

  StringGridDNP_A.Cells[0,0]:='���������';
  StringGridDNP_A.Cells[1,0]:='��������';
  StringGridDNP_A.ColWidths[0]:=160;
  StringGridDNP_A.ColWidths[1]:=80;

  StringGridDNP_B.Cells[0,0]:='���������';
  StringGridDNP_B.Cells[1,0]:='��������';
  StringGridDNP_B.ColWidths[0]:=160;
  StringGridDNP_B.ColWidths[1]:=80;

  StringGridDNP_C.Cells[0,0]:='���������';
  StringGridDNP_C.Cells[1,0]:='��������';
  StringGridDNP_C.ColWidths[0]:=160;
  StringGridDNP_C.ColWidths[1]:=80;

  StringGridMolarMass.Cells[0,0]:='���������';
  StringGridMolarMass.Cells[1,0]:='��������';
  StringGridMolarMass.ColWidths[0]:=160;
  StringGridMolarMass.ColWidths[1]:=80;

  StringGridMuA.Cells[0,0]:='���������';
  StringGridMuA.Cells[1,0]:='��������';
  StringGridMuA.ColWidths[0]:=160;
  StringGridMuA.ColWidths[1]:=80;

  StringGridMuB.Cells[0,0]:='���������';
  StringGridMuB.Cells[1,0]:='��������';
  StringGridMuB.ColWidths[0]:=160;
  StringGridMuB.ColWidths[1]:=80;

  FormFlowofOV.OD1.InitialDir:=ExtractFilePath(Application.ExeName)+'������';
  FormFlowofOV.SD1.InitialDir:=ExtractFilePath(Application.ExeName)+'������';

 { for i:=5 to 10 do
    PCStrFlow.Pages[i].TabVisible:=false;
  for i:=7 to 9 do
    PCStrFlow.Pages[i].TabVisible:=true;  }

  DefaultSetData;
end;

procedure TFormFlowofOV.BitBtnBackClick(Sender: TObject);
begin
  NB.PageIndex:=NB.PageIndex-1;
  BitBtnForward.Enabled:=true;
  BitBtnCancelOrReady.Caption:='������';
  if NB.PageIndex=0 then BitBtnBack.Enabled:=false
  else
    BitBtnBack.Enabled:=true;



  if (Length(TotalFlowCompaunding.Additives)=0) and
     (NB.ActivePage='���������� ��������') then
    begin
      NB.PageIndex:=NB.PageIndex-1;

    end;
  if NB.ActivePage='������� ��������' then
    NB.PageIndex:=NB.PageIndex-1;

  if NB.ActivePage='������� ���������� ��������� �������' then
    ListBoxEndSelectFlowClick(Self);

end;

procedure TFormFlowofOV.BitBtnForwardClick(Sender: TObject);
var
  i, j{, multi}: integer;
  //MassAdditives: array of array of double;
  //MyLineSeries: TLineSeries;
  MyFlow:TFlowCompaunding;
  str: string;
  myarr:TArrOfDouble;
begin

  if (NB.PageIndex=NB.Pages.Count-1) and
    (StatusBar1.Panels[1].Text='�����: PIMS') then
  begin
    NB.PageIndex:=NB.Pages.Count-3;
    TotalFlowCompaunding._StringGridResult:=StringGridResult;
    TotalFlowCompaunding._SG1Itog:=SG1Itog;
    ArrTotalFlowCompaunding.AddItem(TotalFlowCompaunding);
    for i:=0 to Length(TotalFlowCompaunding.Flows)-1 do
    begin
      TotalFlowCompaunding.Flows[i].ExistExpenditure2:=
        TotalFlowCompaunding.Flows[i].ExistExpenditure+
        TotalFlowCompaunding.Flows[i].ExpenditureOfDay;
    end;
    StatusBar1.Panels[2].Text:=FloatToStr(StrToFloat(StatusBar1.Panels[2].Text)+1);


  end;

  if ListBoxSelectFlow.Items.Count=0 then
  begin
    StatusBar1.Panels.Items[0].Text:='�������� ���� �� ���� �����!';
    exit;
  end;

  StatusBar1.Panels.Items[0].Text:='';

  NB.PageIndex:=NB.PageIndex+1;
  BitBtnBack.Enabled:=true;



  // ��������������� ��������� ������� � �������� ����������� �������
  If NB.ActivePage='������� ���������� ��������� �������' then
  begin

    ListBoxEndSelectFlow.Clear;
    ListBoxEndSelectFlow.Items.AddStrings(ListBoxSelectFlow.Items);
    ListBoxEndSelectFlow.Selected[0]:=true;
    //SetLength(TotalFlowCompaunding.Flows,0);
    SetLength(TotalFlowCompaunding.Flows, ListBoxEndSelectFlow.Items.Count);
    for i:=0 to Length(TotalFlowCompaunding.Flows)-1 do
    begin
      // ��������, ���� �� ��� ��������� ������ � ����� ������
      if TotalFlowCompaunding.GetFlowOfName(
         ListBoxEndSelectFlow.Items.Strings[i])=nil then
      begin
        TotalFlowCompaunding.Flows[i]:=TFlowCompaunding.Create;
        with TotalFlowCompaunding do
        begin
          Flows[i]:=TotalFlowCompaundingInside.GetFlowOfName(
                                 ListBoxEndSelectFlow.Items.Strings[i]);
        end;
        TotalFlowCompaunding.Flows[i].VidDolej:=0;  // 27/03/2015
        
      end;
    end;
    ListBoxEndSelectFlowClick(Sender);
  end;

  If NB.ActivePage='������� ��������' then
  begin
    TotalFlowCompaunding.NeedOV:=StrToFloat(EditNeedOV.Text);
    NB.PageIndex:=NB.PageIndex+1;
    
  end;

  If NB.ActivePage='���������� ��������' then
  begin
    // �������� ����� �������� ��� �����������������
    TotalFlowCompaunding.FlowTemp:=StrToFloat(EditTempFlow.Text);
    for j:=0 to ListBoxEndSelectFlow.Items.Count-1 do
    begin
      MyFlow:=TotalFlowCompaunding.GetFlowOfName(
              ListBoxEndSelectFlow.Items.Strings[j]);
      for i:=0 to Length(MyFlow.Components)-1 do
      begin
        case RG_ON.ItemIndex of
          0:MyFlow.Components[i].OctaneValue:=MyFlow.Components[i].MotON;
          1:MyFlow.Components[i].OctaneValue:=MyFlow.Components[i].ResON;
        end;
      end;
    end;

    ListBoxEndSelectAdditive.Clear;
    ListBoxEndSelectAdditive.Items.AddStrings(ListBoxSelectAdditive.Items);

    SetLength(TotalFlowCompaunding.Additives, ListBoxEndSelectAdditive.Items.Count);
    if (Length(TotalFlowCompaunding.Additives)=0) and
     (NB.ActivePage='���������� ��������') then
    begin
      NB.PageIndex:=NB.PageIndex+1;

    end;

    for i:=0 to Length(TotalFlowCompaunding.Additives)-1 do
    begin
      // �������������� ��������, ������� ��������� � ������� ����� ��������������
      TotalFlowCompaunding.Additives[i]:=TAdditiveCompaunding.Create;
      TotalFlowCompaunding.Additives[i]:=
          TotalFlowCompaundingInside.GetAdditivesOfName(
                       ListBoxEndSelectAdditive.Items.Strings[i]);

    end;
    if ListBoxEndSelectAdditive.Items.Count>0 then
    begin
      ListBoxEndSelectAdditive.Selected[0]:=true;
    end;
    ListBoxEndSelectAdditiveClick(Sender);
  end;
  {----------16/09/14-------------}

  If NB.ActivePage='����������' then
  begin
    TotalFlowCompaunding.FlowRatioCalculation(StringGridResult, SG1Itog);
    //for i:=0 to length(TotalFlowCompaunding.ArrConditions.Conditions)-1 do
      //ProcMashaStyle(TotalFlowCompaunding, i);
    //  Nikotin(TotalFlowCompaunding, i);
   // NB.PageIndex:=NB.PageIndex+1;
  end;

  {------------------------------}
  (*
  If NB.ActivePage='����������' then
  begin

    with StringGridResult do
    begin
      Cells[0,0]:='��������';
      Cells[1,0]:='��������';
      // �����

      if RadioButton1.Checked then
      begin
        RowCount:=3;
        Cells[0,1]:='��';
        {myarr:=TotalFlowCompaunding.RatioFlows;
        if myarr<>nil then
          Cells[1,1]:=FloatToStr(roundto(myarr[length(myarr)-1],-2))
        else }
          Cells[1,1]:='���������';
        {str:='';
        for i:=0 to length(myarr)-2 do
        begin
          str:=str+':'+FloatToStr(myarr[i]);
        end;
        delete(str,1,1);
        Cells[0,2]:='�����.';
        Cells[1,2]:=str; }

      end;

      // ������ �����
      {if RadioButton2.Checked then
      begin
        // ��� ��� ������� �������
        ChartResult.SeriesList.Clear;
        for j:=0 to length(TotalFlowCompaunding.Additives)-1 do
        begin
          for i:=0 to length(TotalFlowCompaunding.Additives)-1 do
            TotalFlowCompaunding.Additives[i].ConcentrAdditive:=0;
          with TotalFlowCompaunding.Additives[j] do
          begin
            MyLineSeries:= TLineSeries.Create(self);
            for i:=1 to Trunc((LastConcentrAdditive-FirstConcentrAdditive)/StepConcentrAdditive) do
            begin
              ConcentrAdditive:=FirstConcentrAdditive+i*StepConcentrAdditive;
              Cells[0,RowCount-1]:='�� ��� '+Name+'='+FloatToStr(ConcentrAdditive);
              Cells[1,RowCount-1]:=FloatToStr(TotalFlowCompaunding.TotalFlowOctaneValue);
              RowCount:=RowCount+1;
              MyLineSeries.AddXY(ConcentrAdditive,TotalFlowCompaunding.TotalFlowOctaneValue);
            end;
            ConcentrAdditive:=0;
            MyLineSeries.Title:=Name;
            ChartResult.AddSeries(MyLineSeries);
          end;
        end;
        RowCount:=RowCount-1;
      end;}

    end;

    with StringGridItogSostav do
    begin
      RowCount:=Length(TotalFlowCompaunding.Components)+1;
      for i:=1 to RowCount-1 do
      begin
        Cells[0,i]:=TotalFlowCompaunding.Components[i-1].Name;
        Cells[1,i]:=FloatToStr(RoundTo(
                    TotalFlowCompaunding.Components[i-1].ConcentrComp,-2));
        Cells[2,i]:=FloatToStr(RoundTo(
                    TotalFlowCompaunding.Components[i-1].ConcentrCompMol,-2));
      // ��� �������������� �����������
        Cells[3,i]:=FloatToStr(RoundTo(
                    TotalFlowCompaunding.Components[i-1].GetDNP(TotalFlowCompaunding.FlowTemp),-2));
        //��������� ��� �������� �����������
        Cells[4,i]:=FloatToStr(RoundTo(
                    TotalFlowCompaunding.Components[i-1].GetRoT(TotalFlowCompaunding.FlowTemp),-2));
        //�������� ��� �������� �����������
        Cells[5,i]:=FloatToStr(RoundTo(
                    TotalFlowCompaunding.Components[i-1].GetMuT(TotalFlowCompaunding.FlowTemp),-2));

      end;
    end;

  end;

  with StringGridResult do
  begin
    RowCount:=RowCount+1;
    Cells[0,RowCount-1]:='��� ������';
    Cells[1,RowCount-1]:=FloatToStr(RoundTo(
                 myflow.GetDNP(TotalFlowCompaunding.Components,TotalFlowCompaunding.FlowTemp),-2));
    // ��������� ������
    RowCount:=RowCount+1;
    Cells[0,RowCount-1]:='��������� ������, ��/�3';
    Cells[1,RowCount-1]:=FloatToStr(RoundTo(
                 myflow.GetRoT(TotalFlowCompaunding.Components,TotalFlowCompaunding.FlowTemp),-2));
    //��������
    RowCount:=RowCount+1;
    Cells[0,RowCount-1]:='�������� ������, c*��';
    Cells[1,RowCount-1]:=FloatToStr(RoundTo(
                 myflow.GetMuT(TotalFlowCompaunding.Components,TotalFlowCompaunding.FlowTemp),-2));
  end;
  *)
  if (NB.PageIndex=NB.Pages.Count-1) and
    (StatusBar1.Panels[1].Text='�����: ����.') then
  begin
    BitBtnForward.Enabled:=false;
    BitBtnCancelOrReady.Caption:='������';
  end
  else
  begin
    if (NB.PageIndex=NB.Pages.Count-1) and
      (StatusBar1.Panels[1].Text='�����: PIMS')then
    begin
      if (StrToFloat(StatusBar1.Panels[2].Text)<ParamCompPIMS._CountDay) then
      begin
        BitBtnForward.Enabled:=true;
      end
      else
      begin
        BitBtnForward.Enabled:=false;
        BitBtnCancelOrReady.Caption:='������';
      end;
    end;
  end;
  if (StatusBar1.Panels[1].Text='�����: PIMS')then
    BitBtnBack.Enabled:=false;
end;

procedure TFormFlowofOV.SpeedButtonInSelectFlowClick(Sender: TObject);
begin
  if ListBoxAllFlow.ItemIndex>-1 then
  begin
    if ListBoxSelectFlow.Items.IndexOf(
        ListBoxAllFlow.Items[ListBoxAllFlow.ItemIndex])=-1 then
    begin
      ListBoxSelectFlow.Items.Add(ListBoxAllFlow.Items[ListBoxAllFlow.ItemIndex]);
      ListBoxAllFlow.Items.Delete(ListBoxAllFlow.ItemIndex);
    end;
  end;
end;

procedure TFormFlowofOV.BitBtn1Click(Sender: TObject);
begin

  if OD1.Execute then
  begin
    case OD1.FilterIndex of
      1: begin
           TotalFlowCompaundingInside.LoadFromSFC(
                  od1.FileName, ListBoxAllFlow, FormParam.RGSourse.ItemIndex);
         end;
      2: begin
           TotalFlowCompaundingInside.LoadFromSK(
                  od1.FileName, ListBoxAllFlow, Index_Sir_Riforming, FormParam.RGSourse.ItemIndex);
         end;
      3: begin
           TotalFlowCompaundingInside.LoadFromSK(
                  od1.FileName, ListBoxAllFlow, Index_Kat_Riforming, FormParam.RGSourse.ItemIndex);
         end;
    end;


  end;
 
end;

procedure TFormFlowofOV.SpeedButtonInAllFlowClick(Sender: TObject);
begin
  if ListBoxSelectFlow.ItemIndex>-1 then
  begin
    ListBoxAllFlow.Items.Add(ListBoxSelectFlow.Items[ListBoxSelectFlow.ItemIndex]);
    ListBoxSelectFlow.Items.Delete(ListBoxSelectFlow.ItemIndex);
  end;
end;

procedure TFormFlowofOV.ButtonStructureClick(Sender: TObject);
var
  MyFlow: TFlowCompaunding;
  MyIniFile, _MyIniFile: TIniFile;
  i, CountObject: integer;
begin
  if ListBoxEndSelectFlow.ItemIndex>-1 then
  begin
    OD1.Filter:='������ ������ (*.sfc)|*.sfc';
    if OD1.Execute then
    begin
      with TotalFlowCompaunding do
      begin
        MyFlow:=GetFlowOfName(ListBoxEndSelectFlow.Items[ListBoxEndSelectFlow.ItemIndex]);
        MyIniFile:=TIniFile.Create(OD1.FileName);
        CountObject:=MyIniFile.ReadInteger('Subst', 'CountObject', 0);
        DecimalSeparator:=MyIniFile.ReadString('Subst', 'DS', ',')[1];
        SetLength(MyFlow.Components, CountObject);
        for i:=0 to CountObject-1 do
        begin
          MyFlow.Components[i]:=TComponentCompaunding.Create;
          MyFlow.Components[i].Name:=MyIniFile.ReadString('Subst', 'Name'+IntToStr(i+1), '');
          MyFlow.Components[i].ConcentrComp:=MyIniFile.ReadFloat('Concentr', MyFlow.Components[i].Name, 0);
          MyFlow.Components[i].OctaneValue:=0;
          // ��������� �������������
          case FormParam.RGSourse.ItemIndex of
            0:begin
                MyFlow.Components[i].MotON:=MyIniFile.ReadFloat('MotON', MyFlow.Components[i].Name, 0);
                MyFlow.Components[i].ResON:=MyIniFile.ReadFloat('ResON', MyFlow.Components[i].Name, 0);
                MyFlow.Components[i].CoefB:=MyIniFile.ReadFloat('CoefB', MyFlow.Components[i].Name, 0);
                MyFlow.Components[i].limit:=MyIniFile.ReadFloat('limit', MyFlow.Components[i].Name, 0);

                MyFlow.Components[i].Ro20:=MyIniFile.ReadFloat('Ro20', MyFlow.Components[i].Name, 0);
                MyFlow.Components[i].TemKip:=MyIniFile.ReadFloat('TemKip', MyFlow.Components[i].Name, 0);
                MyFlow.Components[i].DNP_A:=MyIniFile.ReadFloat('DNP_A', MyFlow.Components[i].Name, 0);
                MyFlow.Components[i].DNP_B:=MyIniFile.ReadFloat('DNP_B', MyFlow.Components[i].Name, 0);
                MyFlow.Components[i].DNP_C:=MyIniFile.ReadFloat('DNP_C', MyFlow.Components[i].Name, 0);
                MyFlow.Components[i].MolarMass:=MyIniFile.ReadFloat('MolarMass', MyFlow.Components[i].Name, 0);
                MyFlow.Components[i].MuA:=MyIniFile.ReadFloat('MuA', MyFlow.Components[i].Name, 0);
                MyFlow.Components[i].MuB:=MyIniFile.ReadFloat('MuB', MyFlow.Components[i].Name, 0);

              end;
            1:begin
                _MyIniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'Base.ini');
                MyFlow.Components[i].MotON:=_MyIniFile.ReadFloat('MotON', MyFlow.Components[i].Name, 0);
                MyFlow.Components[i].ResON:=_MyIniFile.ReadFloat('ResON', MyFlow.Components[i].Name, 0);
                MyFlow.Components[i].CoefB:=_MyIniFile.ReadFloat('CoefB', MyFlow.Components[i].Name, 0);
                MyFlow.Components[i].limit:=_MyIniFile.ReadFloat('limit', MyFlow.Components[i].Name, 0);

                MyFlow.Components[i].Ro20:=_MyIniFile.ReadFloat('Ro20', MyFlow.Components[i].Name, 0);
                MyFlow.Components[i].TemKip:=_MyIniFile.ReadFloat('TemKip', MyFlow.Components[i].Name, 0);
                MyFlow.Components[i].DNP_A:=_MyIniFile.ReadFloat('DNP_A', MyFlow.Components[i].Name, 0);
                MyFlow.Components[i].DNP_B:=_MyIniFile.ReadFloat('DNP_B', MyFlow.Components[i].Name, 0);
                MyFlow.Components[i].DNP_C:=_MyIniFile.ReadFloat('DNP_C', MyFlow.Components[i].Name, 0);
                MyFlow.Components[i].MolarMass:=_MyIniFile.ReadFloat('MolarMass', MyFlow.Components[i].Name, 0);
                MyFlow.Components[i].MuA:=_MyIniFile.ReadFloat('MuA', MyFlow.Components[i].Name, 0);
                MyFlow.Components[i].MuB:=_MyIniFile.ReadFloat('MuB', MyFlow.Components[i].Name, 0);

              end;
          end;
        end;
      end;
    end;
    OD1.Filter:='';
    ListBoxEndSelectFlowClick(Sender);
  end;
end;

procedure TFormFlowofOV.ListBoxEndSelectFlowClick(Sender: TObject);
var
  MyFlow: TFlowCompaunding;
  i: integer;
begin
  MyFlow:=TotalFlowCompaunding.GetFlowOfName(
          ListBoxEndSelectFlow.Items[ListBoxEndSelectFlow.ItemIndex]);
  EditExpendFlow.Text:=FloatToStr(MyFlow.Expenditure);
  RGVidDolej.ItemIndex:=MyFlow.VidDolej;
  EdPrice.Text:=FloatToStr(MyFlow.Price);

  if Length(MyFlow.Components)>0 then
  begin
    with StringGridStructureOfFlow do
    begin
      RowCount:=Length(MyFlow.Components)+1;
      for i:=1 to RowCount-1 do
      begin
        Cells[0,i]:=MyFlow.Components[i-1].Name;
        Cells[1,i]:=FloatToStr(MyFlow.Components[i-1].ConcentrComp);
      end;
    end;

    with StringGridMotON do
    begin
      RowCount:=Length(MyFlow.Components)+1;
      for i:=1 to RowCount-1 do
      begin
        Cells[0,i]:=MyFlow.Components[i-1].Name;
        Cells[1,i]:=FloatToStr(MyFlow.Components[i-1].MotON);
      end;
    end;

    with StringGridResON do
    begin
      RowCount:=Length(MyFlow.Components)+1;
      for i:=1 to RowCount-1 do
      begin
        Cells[0,i]:=MyFlow.Components[i-1].Name;
        Cells[1,i]:=FloatToStr(MyFlow.Components[i-1].ResON);
      end;
    end;

    with StringGridGOST do
    begin
      RowCount:=Length(MyFlow.Components)+1;
      for i:=1 to RowCount-1 do
      begin
        Cells[0,i]:=MyFlow.Components[i-1].Name;
        Cells[1,i]:=FloatToStr(MyFlow.Components[i-1].limit);
      end;
    end;

    with StringGridCoefB do
    begin
      RowCount:=Length(MyFlow.Components)+1;
      for i:=1 to RowCount-1 do
      begin
        Cells[0,i]:=MyFlow.Components[i-1].Name;
        Cells[1,i]:=FloatToStr(MyFlow.Components[i-1].CoefB);
      end;
    end;

    with StringGridRo20 do
    begin
      RowCount:=Length(MyFlow.Components)+1;
      for i:=1 to RowCount-1 do
      begin
        Cells[0,i]:=MyFlow.Components[i-1].Name;
        Cells[1,i]:=FloatToStr(MyFlow.Components[i-1].Ro20);
      end;
    end;

    with StringGridTemKip do
    begin
      RowCount:=Length(MyFlow.Components)+1;
      for i:=1 to RowCount-1 do
      begin
        Cells[0,i]:=MyFlow.Components[i-1].Name;
        Cells[1,i]:=FloatToStr(MyFlow.Components[i-1].TemKip);
      end;
    end;

    with StringGridDNP_A do
    begin
      RowCount:=Length(MyFlow.Components)+1;
      for i:=1 to RowCount-1 do
      begin
        Cells[0,i]:=MyFlow.Components[i-1].Name;
        Cells[1,i]:=FloatToStr(MyFlow.Components[i-1].DNP_A);
      end;
    end;

    with StringGridDNP_B do
    begin
      RowCount:=Length(MyFlow.Components)+1;
      for i:=1 to RowCount-1 do
      begin
        Cells[0,i]:=MyFlow.Components[i-1].Name;
        Cells[1,i]:=FloatToStr(MyFlow.Components[i-1].DNP_B);
      end;
    end;

    with StringGridDNP_C do
    begin
      RowCount:=Length(MyFlow.Components)+1;
      for i:=1 to RowCount-1 do
      begin
        Cells[0,i]:=MyFlow.Components[i-1].Name;
        Cells[1,i]:=FloatToStr(MyFlow.Components[i-1].DNP_C);
      end;
    end;

    with StringGridMolarMass do
    begin
      RowCount:=Length(MyFlow.Components)+1;
      for i:=1 to RowCount-1 do
      begin
        Cells[0,i]:=MyFlow.Components[i-1].Name;
        Cells[1,i]:=FloatToStr(MyFlow.Components[i-1].MolarMass);
      end;
    end;

    with StringGridMuA do
    begin
      RowCount:=Length(MyFlow.Components)+1;
      for i:=1 to RowCount-1 do
      begin
        Cells[0,i]:=MyFlow.Components[i-1].Name;
        Cells[1,i]:=FloatToStr(MyFlow.Components[i-1].MuA);
      end;
    end;

    with StringGridMuB do
    begin
      RowCount:=Length(MyFlow.Components)+1;
      for i:=1 to RowCount-1 do
      begin
        Cells[0,i]:=MyFlow.Components[i-1].Name;
        Cells[1,i]:=FloatToStr(MyFlow.Components[i-1].MuB);
      end;
    end;

  end
  else
  begin
    with StringGridStructureOfFlow do
    begin
      RowCount:=2;
      Cells[0,1]:='';
      Cells[1,1]:='';
    end;

    with StringGridMotON do
    begin
      RowCount:=2;
      Cells[0,1]:='';
      Cells[1,1]:='';
    end;

    with StringGridResON do
    begin
      RowCount:=2;
      Cells[0,1]:='';
      Cells[1,1]:='';
    end;

    with StringGridGOST do
    begin
      RowCount:=2;
      Cells[0,1]:='';
      Cells[1,1]:='';
    end;

    with StringGridCoefB do
    begin
      RowCount:=2;
      Cells[0,1]:='';
      Cells[1,1]:='';
    end;

    with StringGridRo20 do
    begin
      RowCount:=2;
      Cells[0,1]:='';
      Cells[1,1]:='';
    end;

    with StringGridTemKip do
    begin
      RowCount:=2;
      Cells[0,1]:='';
      Cells[1,1]:='';
    end;

    with StringGridDNP_A do
    begin
      RowCount:=2;
      Cells[0,1]:='';
      Cells[1,1]:='';
    end;

    with StringGridDNP_B do
    begin
      RowCount:=2;
      Cells[0,1]:='';
      Cells[1,1]:='';
    end;

    with StringGridDNP_C do
    begin
      RowCount:=2;
      Cells[0,1]:='';
      Cells[1,1]:='';
    end;

    with StringGridMolarMass do
    begin
      RowCount:=2;
      Cells[0,1]:='';
      Cells[1,1]:='';
    end;

    with StringGridMuA do
    begin
      RowCount:=2;
      Cells[0,1]:='';
      Cells[1,1]:='';
    end;

    with StringGridMuB do
    begin
      RowCount:=2;
      Cells[0,1]:='';
      Cells[1,1]:='';
    end;
  end;
end;

procedure TFormFlowofOV.BitBtn2Click(Sender: TObject);
var
  i: integer;
  CountObject: integer;
  MyIniFile: TIniFile;
begin
  OD1.Filter:='�������� (*.add)|*.add';
  if OD1.Execute then
  begin
    ListBoxAllAdditive.Clear;
    MyIniFile:=TIniFile.Create(OD1.FileName);
    CountObject:=MyIniFile.ReadInteger('Additives','CountObject', 0);
    DecimalSeparator:=MyIniFile.ReadString('Subst', 'DS', ',')[1];
    for i:=1 to CountObject do
    begin
      ListBoxAllAdditive.Items.Add(MyIniFile.ReadString('Additives',
                    'Name'+IntToStr(i), '��� ������'));
    end;
    SetLength(TotalFlowCompaundingInside.Additives, ListBoxAllAdditive.Items.Count);
    for i:=0 to Length(TotalFlowCompaundingInside.Additives)-1 do
    begin
      TotalFlowCompaundingInside.Additives[i]:=TAdditiveCompaunding.Create;
      with TotalFlowCompaundingInside.Additives[i] do
      begin
        Name:=MyIniFile.ReadString('Additives',
                    'Name'+IntToStr(i+1), '��� ������');
        P:=MyIniFile.ReadFloat('Property_P',
                    'Name'+IntToStr(i+1), 0);
        deltaOVmax:=MyIniFile.ReadFloat('Property_deltaOVmax',
                    'Name'+IntToStr(i+1), 0);
        Keff:=MyIniFile.ReadFloat('Property_Keff',
                    'Name'+IntToStr(i+1), 0);
        CmaxAdditive:=MyIniFile.ReadFloat('Property_CmaxAdditive',
                    'Name'+IntToStr(i+1), 0);
        ConcentrAdditive:=MyIniFile.ReadFloat('Property_ConcentrAdditive',
                    'Name'+IntToStr(i+1), 0);
        ChangeConcentrAdditive:=False;
      end;
    end;
  end;
  OD1.Filter:='';

end;

procedure TFormFlowofOV.SpeedButtonInSelectAdditiveClick(Sender: TObject);
begin
  if ListBoxAllAdditive.ItemIndex>-1 then
  begin
    if ListBoxSelectAdditive.Items.IndexOf(
        ListBoxAllAdditive.Items[ListBoxAllAdditive.ItemIndex])=-1 then
    begin
      ListBoxSelectAdditive.Items.Add(ListBoxAllAdditive.Items[ListBoxAllAdditive.ItemIndex]);
      ListBoxAllAdditive.Items.Delete(ListBoxAllAdditive.ItemIndex);
    end;
  end;
end;

procedure TFormFlowofOV.SpeedButtonInAllAdditiveClick(Sender: TObject);
begin
  if ListBoxSelectAdditive.ItemIndex>-1 then
  begin
    ListBoxAllAdditive.Items.Add(ListBoxSelectAdditive.Items[ListBoxSelectAdditive.ItemIndex]);
    ListBoxSelectAdditive.Items.Delete(ListBoxSelectAdditive.ItemIndex);
  end;
end;

procedure TFormFlowofOV.RadioButton1Click(Sender: TObject);
begin
  EditValueAdditive.Enabled:=true;
  EditFirstValueAdditive.Enabled:=false;
  EditLastValueAdditive.Enabled:=false;
  EditStep.Enabled:=false;
  ChartResult.Visible:=false;
end;

procedure TFormFlowofOV.RadioButton2Click(Sender: TObject);
begin
  EditValueAdditive.Enabled:=false;
  EditFirstValueAdditive.Enabled:=true;
  EditLastValueAdditive.Enabled:=true;
  EditStep.Enabled:=true;
  ChartResult.Visible:=true;
end;

procedure TFormFlowofOV.Button1Click(Sender: TObject);
var
  MyAdditives: TAdditiveCompaunding;
begin
  if ListBoxEndSelectAdditive.Items.Count=0 then exit;

  MyAdditives:=TotalFlowCompaunding.GetAdditivesOfName(
    ListBoxEndSelectAdditive.Items.Strings[ListBoxEndSelectAdditive.ItemIndex]);
  with MyAdditives do
  begin
    ConcentrAdditive:=StrToFloat(EditValueAdditive.Text);
    P:=StrToFloat(EditP.Text);
    deltaOVmax:=StrToFloat(EditdeltaOVmax.Text);
    Keff:=StrToFloat(EditKeff.Text);
    CmaxAdditive:=StrToFloat(EditCmaxAdditive.Text);
    FirstConcentrAdditive:=StrToFloat(EditFirstValueAdditive.Text);
    LastConcentrAdditive:=StrToFloat(EditLastValueAdditive.Text);
    StepConcentrAdditive:=StrToFloat(EditStep.Text);
    ChangeConcentrAdditive:=RadioButton2.Checked;
  end;
end;

procedure TFormFlowofOV.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormFlowofOV.btCreateClick(Sender: TObject);
begin
  SecondForm.Label1.Caption:='������� �������� ������';
  if SecondForm.ShowModal=mrOk then
  begin
    ListBoxAllFlow.Items.Add(SecondForm.EditResult.Text);
    ListBoxAllFlow.Selected[
                     ListBoxAllFlow.Items.Count-1]:=true;
    //������ ������� ������ ����� ���������� �������
    with TotalFlowCompaundingInside do
    begin
      SetLength(Flows, length(Flows)+1);
      Flows[length(Flows)-1]:=TFlowCompaunding.Create;
      Flows[length(Flows)-1].Name:=SecondForm.EditResult.Text;
    end;
    SecondForm.EditResult.Clear;
  end
  else
    SecondForm.Close;
end;

procedure TFormFlowofOV.btSaveClick(Sender: TObject);
var
  i,CountObject: integer;
  MyIniFile: TIniFile;
  MyFlow: TFlowCompaunding;

begin

  if ListBoxAllFlow.Items.Count=0 then
  begin
    ShowMessage('���������� ��������� �����');
    exit;
  end;
  SD1.Filter:='������ (*.sfc)|*.sfc';

  if SD1.Execute then
  begin
    StatusBar1.SimpleText:='���� ���������� ������...';
    with TotalFlowCompaundingInside do
      begin
        if pos('.sfc',SD1.FileName)>0 then
          SD1.FileName:=copy(SD1.FileName,1,pos('.sfc',SD1.FileName)-1);

        MyFlow:=TFlowCompaunding.Create;
        MyFlow:=TotalFlowCompaundingInside.GetFlowOfName(
             ListBoxAllFlow.Items.Strings[ListBoxAllFlow.ItemIndex]);
        MyIniFile:=TIniFile.Create(SD1.FileName+'.sfc');
        CountObject:=Length(MyFlow.Components);
        PrBar.Max:=CountObject+1;
        PrBar.Position:=1;
        MyIniFile.WriteInteger('Subst', 'CountObject', CountObject);
        MyIniFile.WriteString('Subst', 'DS', DecimalSeparator);
        MyIniFile.WriteString('Subst', 'NameFlow', ExtractFileName(SD1.FileName));
        MyIniFile.WriteFloat('Subst', 'Expenditure', MyFlow.Expenditure);
        for i:=0 to CountObject-1 do
        begin
          MyIniFile.WriteString('Subst', 'Name'+IntToStr(i+1), MyFlow.Components[i].Name);
          MyIniFile.WriteFloat('Concentr', MyFlow.Components[i].Name, MyFlow.Components[i].ConcentrComp);
          MyIniFile.WriteFloat('CoefB', MyFlow.Components[i].Name, MyFlow.Components[i].CoefB);
          MyIniFile.WriteFloat('MotON', MyFlow.Components[i].Name, MyFlow.Components[i].MotON);
          MyIniFile.WriteFloat('ResON', MyFlow.Components[i].Name, MyFlow.Components[i].ResON);
          MyIniFile.WriteFloat('limit', MyFlow.Components[i].Name, MyFlow.Components[i].limit);

          MyIniFile.WriteFloat('Ro20',   MyFlow.Components[i].Name, MyFlow.Components[i].Ro20);
          MyIniFile.WriteFloat('TemKip', MyFlow.Components[i].Name, MyFlow.Components[i].TemKip);
          MyIniFile.WriteFloat('DNP_A',  MyFlow.Components[i].Name, MyFlow.Components[i].DNP_A);
          MyIniFile.WriteFloat('DNP_B',  MyFlow.Components[i].Name, MyFlow.Components[i].DNP_B);
          MyIniFile.WriteFloat('DNP_C',  MyFlow.Components[i].Name, MyFlow.Components[i].DNP_C);
          MyIniFile.WriteFloat('MolarMass',  MyFlow.Components[i].Name, MyFlow.Components[i].MolarMass);
          MyIniFile.WriteFloat('MuA', MyFlow.Components[i].Name, MyFlow.Components[i].MuA);
          MyIniFile.WriteFloat('MuB', MyFlow.Components[i].Name, MyFlow.Components[i].MuB);

          PrBar.Position:=PrBar.Position+1;
        end;
        PrBar.Position:=0;
      end;
    StatusBar1.SimpleText:='';
  end;
  SD1.Filter:='';
end;

procedure TFormFlowofOV.BitBtn4Click(Sender: TObject);
const
  ArrLabelCaption: array [1..6] of string = ('�������� ��������',
  '������������ ��������', '������������ ���������� ���������� �����',
  '��������� �������������', '������������ ������������ ��������',
  '������������ ��������');
var
  i: integer;
  MyAdditive: TAdditiveCompaunding;
begin
  MyAdditive:= TAdditiveCompaunding.Create;
  for i:=1 to 6 do
  begin
    SecondForm.Label1.Caption:=ArrLabelCaption[i];
    if i=1 then SecondForm.EditResult.Text:=ArrLabelCaption[i]
    else
      SecondForm.EditResult.Text:='1';

    if SecondForm.ShowModal=mrOk then
    begin
      with MyAdditive do
      begin
        case i of
        1: begin
             Name:=SecondForm.EditResult.Text;
             ListBoxAllAdditive.Items.Add(SecondForm.EditResult.Text);
           end;
        2: P:=StrToFloat(SecondForm.EditResult.Text);
        3: deltaOVmax:=StrToFloat(SecondForm.EditResult.Text);
        4: Keff:=StrToFloat(SecondForm.EditResult.Text);
        5: CmaxAdditive:=StrToFloat(SecondForm.EditResult.Text);
        6: ConcentrAdditive:=StrToFloat(SecondForm.EditResult.Text);
        end;
        ChangeConcentrAdditive:=false;
      end;
      SecondForm.EditResult.Clear;
    end
    else
    begin
      exit;
    end;
  end;

  with TotalFlowCompaundingInside do
  begin
    SetLength(Additives, length(Additives)+1);
    Additives[length(Additives)-1]:=TAdditiveCompaunding.Create;
    Additives[length(Additives)-1]:=MyAdditive;
  end;

end;

procedure TFormFlowofOV.EditExpendFlowChange(Sender: TObject);
var
  MyFlow: TFlowCompaunding;
begin
  if EditExpendFlow.Text='' then exit;

  if ListBoxEndSelectFlow.ItemIndex>-1 then
  begin
    MyFlow:=TotalFlowCompaunding.GetFlowOfName(
            ListBoxEndSelectFlow.Items[ListBoxEndSelectFlow.ItemIndex]);
    MyFlow.Expenditure:=StrToFloat(EditExpendFlow.Text);
    MyFlow.ExistExpenditure:=StrToFloat(EditExpendFlow.Text);
    MyFlow.ExistExpenditure2:=StrToFloat(EditExpendFlow.Text);

  end
  else
    EditExpendFlow.Text:='0';
end;

procedure TFormFlowofOV.EditExpendFlowKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (not (Key in ['0'..'9', DecimalSeparator, '-', char(8), char(#13)]))
    and (ord(Key)>25) then Key:=#0;
end;

procedure TFormFlowofOV.ListBoxEndSelectAdditiveClick(Sender: TObject);
var
  MyAdditives: TAdditiveCompaunding;
begin
  if ListBoxEndSelectAdditive.Items.Count=0 then exit;

  MyAdditives:=TotalFlowCompaunding.GetAdditivesOfName(
    ListBoxEndSelectAdditive.Items.Strings[ListBoxEndSelectAdditive.ItemIndex]);
  with MyAdditives do
  begin
    EditValueAdditive.Text:=FloatToStr(ConcentrAdditive);
    EditP.Text:=FloatToStr(P);
    EditdeltaOVmax.Text:=FloatToStr(deltaOVmax);
    EditKeff.Text:=FloatToStr(Keff);
    EditCmaxAdditive.Text:=FloatToStr(CmaxAdditive);
    EditFirstValueAdditive.Text:=FloatToStr(FirstConcentrAdditive);
    EditLastValueAdditive.Text:=FloatToStr(LastConcentrAdditive);
    EditStep.Text:=FloatToStr(StepConcentrAdditive);
    if ChangeConcentrAdditive then RadioButton2.Checked:=true
    else
      RadioButton1.Checked:=true;
  end;
end;

procedure TFormFlowofOV.FormCreate(Sender: TObject);
begin
  // ���������� �����
  TotalFlowCompaunding:=TTotalFlowCompaunding.Create;
  // ���������� ����� ��� ��������� �����
  TotalFlowCompaundingInside:=TTotalFlowCompaunding.Create;
  TotalFlowCompaunding.TotalFlowPravila:=TTotalFlowPravila.Create;
  TotalFlowCompaunding.ArrConditions:=TArrConditions.Create;
  TotalFlowCompaunding.RatioParam:=TRatioParam.Create;

end;


procedure TFormFlowofOV.Copy1Click(Sender: TObject);
begin
  (Sender as TChart).CopyToClipboardBitmap;
end;

procedure TFormFlowofOV.BtInfileClick(Sender: TObject);
var
  i, CountObject: integer;
  MyIniFile: TIniFile;
  MyFlow: TFlowCompaunding;
begin

  if ListBoxEndSelectFlow.Items.Count=0 then
  begin
    ShowMessage('���������� ��������� �����');
    exit;
  end;

  SD1.Filter:='������ ������ (*.sfc)|*.sfc';
  SD1.DefaultExt:='sfc';
  if SD1.Execute then
  begin
    StatusBar1.SimpleText:='���� ���������� ������...';
    with TotalFlowCompaunding do
    begin
      if pos('.sfc',SD1.FileName)>0 then
        SD1.FileName:=copy(SD1.FileName,1,pos('.sfc',SD1.FileName)-1);

     // MyFlow:=TFlowCompaunding.Create;
      MyFlow:=TotalFlowCompaunding.GetFlowOfName(
           ListBoxEndSelectFlow.Items.Strings[ListBoxEndSelectFlow.ItemIndex]);
      MyIniFile:=TIniFile.Create(SD1.FileName+'.sfc');
      CountObject:=length(MyFlow.Components);
      PrBar.Max:=CountObject+1;
      PrBar.Position:=1;
      MyIniFile.WriteInteger('Subst', 'CountObject', CountObject);
      MyIniFile.WriteString('Subst', 'NameFlow', ExtractFileName(SD1.FileName));
      MyIniFile.WriteString('Subst', 'DS', DecimalSeparator);
      MyIniFile.WriteFloat('Subst', 'Expenditure', MyFlow.Expenditure);   

      for i:=0 to CountObject-1 do
      begin
        MyIniFile.WriteString('Subst', 'Name'+IntToStr(i+1), MyFlow.Components[i].Name);
        MyIniFile.WriteFloat('Concentr', MyFlow.Components[i].Name, MyFlow.Components[i].ConcentrComp);
        MyIniFile.WriteFloat('CoefB', MyFlow.Components[i].Name, MyFlow.Components[i].CoefB);
        MyIniFile.WriteFloat('MotON', MyFlow.Components[i].Name, MyFlow.Components[i].MotON);
        MyIniFile.WriteFloat('ResON', MyFlow.Components[i].Name, MyFlow.Components[i].ResON);
        MyIniFile.WriteFloat('limit', MyFlow.Components[i].Name, MyFlow.Components[i].limit);

        MyIniFile.WriteFloat('Ro20',   MyFlow.Components[i].Name, MyFlow.Components[i].Ro20);
        MyIniFile.WriteFloat('TemKip', MyFlow.Components[i].Name, MyFlow.Components[i].TemKip);
        MyIniFile.WriteFloat('DNP_A',  MyFlow.Components[i].Name, MyFlow.Components[i].DNP_A);
        MyIniFile.WriteFloat('DNP_B',  MyFlow.Components[i].Name, MyFlow.Components[i].DNP_B);
        MyIniFile.WriteFloat('DNP_C',  MyFlow.Components[i].Name, MyFlow.Components[i].DNP_C);
        MyIniFile.WriteFloat('MolarMass',  MyFlow.Components[i].Name, MyFlow.Components[i].MolarMass);
        MyIniFile.WriteFloat('MuA', MyFlow.Components[i].Name, MyFlow.Components[i].MuA);
        MyIniFile.WriteFloat('MuB', MyFlow.Components[i].Name, MyFlow.Components[i].MuB);

        PrBar.Position:=PrBar.Position+1;
      end;
      PrBar.Position:=0;
    end;
    StatusBar1.SimpleText:='';
  end;
  SD1.DefaultExt:='';
  SD1.Filter:='';
end;

procedure TFormFlowofOV.StringGridStructureOfFlowSetEditText(
  Sender: TObject; ACol, ARow: Integer; const Value: String);
var
  MyRow: integer;
  MyFlow: TFlowCompaunding;
  i: integer;
  str: string;
  colDS: integer;
begin

  MyRow:=(Sender as TStringGrid).Selection.Top;
  MyFlow:=TotalFlowCompaunding.GetFlowOfName(
    ListBoxEndSelectFlow.Items.Strings[ListBoxEndSelectFlow.ItemIndex]);

  // ����� ���� ������ ���� �������
  str:=(Sender as TStringGrid).Cells[1,MyRow];
  if str='' then exit;
  colDS:=0;
  for i:=1 to length(str) do
  begin
    if str[i]=DecimalSeparator then
      colDS:=colDS+1;
  end;
  if colDS>1 then exit;

  if (Sender as TStringGrid).Name='StringGridStructureOfFlow' then
    MyFlow.Components[MyRow-1].ConcentrComp:=StrToFloat(
        (Sender as TStringGrid).Cells[1,MyRow]);

  if (Sender as TStringGrid).Name='StringGridMotON' then
    MyFlow.Components[MyRow-1].MotON:=StrToFloat(
        (Sender as TStringGrid).Cells[1,MyRow]);

  if (Sender as TStringGrid).Name='StringGridResON' then
    MyFlow.Components[MyRow-1].ResON:=StrToFloat(
        (Sender as TStringGrid).Cells[1,MyRow]);

  if (Sender as TStringGrid).Name='StringGridGOST' then
  begin
    // �������� ����� ��� ��������
    for i:=0 to length(TotalFlowCompaunding.Flows)-1 do
      TotalFlowCompaunding.Flows[i].Components[MyRow-1].limit:=StrToFloat(
        (Sender as TStringGrid).Cells[1,MyRow]);
  end;

  if (Sender as TStringGrid).Name='StringGridCoefB' then
    MyFlow.Components[MyRow-1].CoefB:=StrToFloat(
        (Sender as TStringGrid).Cells[1,MyRow]);

  if (Sender as TStringGrid).Name='StringGridRo20' then
    MyFlow.Components[MyRow-1].Ro20:=StrToFloat(
        (Sender as TStringGrid).Cells[1,MyRow]);

  if (Sender as TStringGrid).Name='StringGridTemKip' then
    MyFlow.Components[MyRow-1].TemKip:=StrToFloat(
        (Sender as TStringGrid).Cells[1,MyRow]);

  if (Sender as TStringGrid).Name='StringGridDNP_A' then
    MyFlow.Components[MyRow-1].DNP_A:=StrToFloat(
        (Sender as TStringGrid).Cells[1,MyRow]);

  if (Sender as TStringGrid).Name='StringGridDNP_B' then
    MyFlow.Components[MyRow-1].DNP_B:=StrToFloat(
        (Sender as TStringGrid).Cells[1,MyRow]);

  if (Sender as TStringGrid).Name='StringGridDNP_C' then
    MyFlow.Components[MyRow-1].DNP_C:=StrToFloat(
        (Sender as TStringGrid).Cells[1,MyRow]);

  if (Sender as TStringGrid).Name='StringGridMolarMass' then
    MyFlow.Components[MyRow-1].MolarMass:=StrToFloat(
        (Sender as TStringGrid).Cells[1,MyRow]);

  if (Sender as TStringGrid).Name='StringGridMuA' then
    MyFlow.Components[MyRow-1].MuA:=StrToFloat(
        (Sender as TStringGrid).Cells[1,MyRow]);

  if (Sender as TStringGrid).Name='StringGridMuB' then
    MyFlow.Components[MyRow-1].MuB:=StrToFloat(
        (Sender as TStringGrid).Cells[1,MyRow]);

end;


procedure TFormFlowofOV.N2Click(Sender: TObject);
var
  MyRow: integer;
  MyFlow: TFlowCompaunding;
begin

  MyRow:=StringGridStructureOfFlow.Selection.Top;

  MyFlow:=TotalFlowCompaunding.GetFlowOfName(
    ListBoxEndSelectFlow.Items.Strings[ListBoxEndSelectFlow.ItemIndex]);

  MyFlow.DelComponent(MyRow-1);
  ListBoxEndSelectFlowClick(Sender);

end;

procedure TFormFlowofOV.N1Click(Sender: TObject);
var
  Comp: TComponentCompaunding;
  MyFlow: TFlowCompaunding;
begin
  Comp:= TComponentCompaunding.Create;

  MyFlow:=TotalFlowCompaunding.GetFlowOfName(
    ListBoxEndSelectFlow.Items.Strings[ListBoxEndSelectFlow.ItemIndex]);

  SecondForm.Label1.Caption:='�������� ��������';
  SecondForm.EditResult.Text:='����� �������';
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.Name:=SecondForm.EditResult.Text;

  SecondForm.Label1.Caption:='����., % ���.';
  SecondForm.EditResult.Text:='0';
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.ConcentrComp:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='�����������';
  SecondForm.EditResult.Text:='0';
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.CoefB:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='�� �� ��';
  SecondForm.EditResult.Text:='0';
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.MotON:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='�� �� ��';
  SecondForm.EditResult.Text:='0';
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.ResON:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='����������� ����., % ���.';
  SecondForm.EditResult.Text:='0';
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.limit:=StrToFloat(SecondForm.EditResult.Text);

  {SecondForm.Label1.Caption:='Ro20';
  SecondForm.EditResult.Text:='0';
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.Ro20:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='TemKip';
  SecondForm.EditResult.Text:='0';
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.TemKip:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='DNP_A';
  SecondForm.EditResult.Text:='0';
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.DNP_A:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='DNP_B';
  SecondForm.EditResult.Text:='0';
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.DNP_B:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='DNP_�';
  SecondForm.EditResult.Text:='0';
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.DNP_C:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='MolarMass';
  SecondForm.EditResult.Text:='0';
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.MolarMass:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='MuA';
  SecondForm.EditResult.Text:='0';
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.MuA:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='MuB';
  SecondForm.EditResult.Text:='0';
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.MuB:=StrToFloat(SecondForm.EditResult.Text);}

  MyFlow.AddComponent(Comp);
  ListBoxEndSelectFlowClick(Sender);

end;

procedure TFormFlowofOV.N3Click(Sender: TObject);
var
  Comp: TComponentCompaunding;
  MyFlow: TFlowCompaunding;
  MyRow: integer;
begin
  Comp:=TComponentCompaunding.Create;


  MyFlow:=TotalFlowCompaunding.GetFlowOfName(
    ListBoxEndSelectFlow.Items.Strings[ListBoxEndSelectFlow.ItemIndex]);

  MyRow:=StringGridStructureOfFlow.Selection.Top;

  Comp:=MyFlow.GetCompOfName(StringGridStructureOfFlow.Cells[0,MyRow]);

  SecondForm.Label1.Caption:='�������� ��������';
  SecondForm.EditResult.Text:=Comp.Name;
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.Name:=SecondForm.EditResult.Text;

  SecondForm.Label1.Caption:='����., % ���.';
  SecondForm.EditResult.Text:=FloatToStr(Comp.ConcentrComp);
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.ConcentrComp:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='�����������';
  SecondForm.EditResult.Text:=FloatToStr(Comp.CoefB);
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.CoefB:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='�� �� ��';
  SecondForm.EditResult.Text:=FloatToStr(Comp.MotON);
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.MotON:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='�� �� ��';
  SecondForm.EditResult.Text:=FloatToStr(Comp.ResON);
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.ResON:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='����������� ����., % ���.';
  SecondForm.EditResult.Text:=FloatToStr(Comp.limit);
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.limit:=StrToFloat(SecondForm.EditResult.Text);

  {SecondForm.Label1.Caption:='Ro20';
  SecondForm.EditResult.Text:=FloatToStr(Comp.Ro20);
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.Ro20:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='TemKip';
  SecondForm.EditResult.Text:=FloatToStr(Comp.TemKip);
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.TemKip:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='DNP_A';
  SecondForm.EditResult.Text:=FloatToStr(Comp.DNP_A);
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.DNP_A:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='DNP_B';
  SecondForm.EditResult.Text:=FloatToStr(Comp.DNP_B);
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.DNP_B:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='DNP_C';
  SecondForm.EditResult.Text:=FloatToStr(Comp.DNP_C);
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.DNP_C:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='MolarMass';
  SecondForm.EditResult.Text:=FloatToStr(Comp.MolarMass);
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.MolarMass:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='MuA';
  SecondForm.EditResult.Text:=FloatToStr(Comp.MolarMass);
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.MuA:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='MuB';
  SecondForm.EditResult.Text:=FloatToStr(Comp.MolarMass);
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.MuB:=StrToFloat(SecondForm.EditResult.Text);}

  ListBoxEndSelectFlowClick(Sender);


end;

procedure TFormFlowofOV.BitBtn3Click(Sender: TObject);
var
  CountObject: integer;
  MyIniFile: TIniFile;
  MyAdditives: TAdditiveCompaunding;
begin

  if ListBoxAllAdditive.Items.Count=0 then
  begin
    ShowMessage('���������� ��������� ��������');
    exit;
  end;

  SD1.Filter:='�������� (*.add)|*.add';
  SD1.DefaultExt:='add';
  if SD1.Execute then
  begin
    StatusBar1.SimpleText:='���� ���������� ������...';

    if pos('.add',SD1.FileName)>0 then
      SD1.FileName:=copy(SD1.FileName,1,pos('.add',SD1.FileName)-1);

   // MyAdditives:=TAdditiveCompaunding.Create;
    MyAdditives:=TotalFlowCompaundingInside.GetAdditivesOfName(
         ListBoxAllAdditive.Items.Strings[ListBoxAllAdditive.ItemIndex]);
    MyIniFile:=TIniFile.Create(SD1.FileName+'.add');
    CountObject:=MyIniFile.ReadInteger('Additives','CountObject', 0);
    CountObject:=CountObject+1;
    MyIniFile.WriteInteger('Additives','CountObject', CountObject);
    MyIniFile.WriteString('Subst', 'DS', DecimalSeparator);
    PrBar.Max:=CountObject+1;
    PrBar.Position:=1;
    MyIniFile.WriteString('Additives', 'Name'+
                     IntToStr(CountObject), MyAdditives.Name);
    MyIniFile.WriteFloat('Property_P', 'Name'+
                     IntToStr(CountObject), MyAdditives.P);
    MyIniFile.WriteFloat('Property_deltaOVmax', 'Name'+
                     IntToStr(CountObject), MyAdditives.deltaOVmax);
    MyIniFile.WriteFloat('Property_Keff', 'Name'+
                     IntToStr(CountObject), MyAdditives.Keff);
    MyIniFile.WriteFloat('Property_CmaxAdditive', 'Name'+
                     IntToStr(CountObject), MyAdditives.CmaxAdditive);
    MyIniFile.WriteFloat('Property_ConcentrAdditive', 'Name'+
                     IntToStr(CountObject), MyAdditives.ConcentrAdditive);

    PrBar.Position:=0;
    StatusBar1.SimpleText:='';
  end;
  SD1.DefaultExt:='';
  SD1.Filter:='';
end;

procedure TFormFlowofOV.MenuItem4Click(Sender: TObject);
var
  IndexDel: integer;
begin
  if ListBoxAllFlow.Items.Count=0 then exit;

  with TotalFlowCompaundingInside do
  begin
    IndexDel:=-1;
    if ListBoxAllFlow.ItemIndex>-1 then
      IndexDel:=GetFlowIndexOfName(
                ListBoxAllFlow.Items.Strings[ListBoxAllFlow.ItemIndex]);
    if IndexDel>-1 then
    begin
      DelFlow(IndexDel);
      ListBoxAllFlow.DeleteSelected;
    end;
  end;

end;

procedure TFormFlowofOV.BtPraviloClick(Sender: TObject);
var
  i: integer;
  MyFlow: TFlowCompaunding;
  MyListBox:TListBox;
begin


  Application.CreateForm(TFPravilo, FPravilo);
  UPravilo.TFC:=TotalFlowCompaunding;

  MyListBox:=((Sender as TButton).GetParentComponent.GetParentComponent.GetParentComponent.GetParentComponent.GetParentComponent.GetParentComponent as TFormFlowofOV).ListBoxEndSelectFlow;

  MyFlow:=TotalFlowCompaunding.GetFlowOfName(
      MyListBox.Items[MyListBox.ItemIndex]);


  with FPravilo do
  begin

    ListBox1.Clear;
    ListBox2.Clear;
    Edit1.Text:='';
    
    for i:= 0 to Length(MyFlow.Components)-1 do
    begin
      ListBox1.Items.Add(MyFlow.Components[i].Name);
    end;
    with TotalFlowCompaunding.TotalFlowPravila do
    begin
      for i:= 0 to Length(Pravila)-1 do
      begin
        ListBox2.Items.Add(Pravila[i].Name);
      end;

      if ShowModal=mrOK then
      begin
        SetLength(Pravila, Length(Pravila)+1);
        Pravila[Length(Pravila)-1]:=TPravilo.Create;
        Pravila[Length(Pravila)-1].Pravilo:=Edit1.Text;
        Pravila[Length(Pravila)-1].Name:='�������'+IntToStr(Length(Pravila));
      end;
    end;
  end;
end;

procedure TFormFlowofOV.BtSaveAsClick(Sender: TObject);
begin
  BtSaveAs.PopupMenu.Popup(Left+Panel16.Left+BtSaveAs.Left,
    Top+160);
end;

procedure TFormFlowofOV.InBase1Click(Sender: TObject);
  function ExistInBase(NameComp: string): boolean;
  var
    MyIniFile: TIniFile;
    i, CountObject: integer;
  begin
    result:=false;
    MyIniFile:= TIniFile.Create(ExtractFilePath(Application.ExeName)+'Base.ini');
    CountObject:=MyIniFile.ReadInteger('Subst', 'CountObject', 0);
    for i:=1 to CountObject do
    begin
      if MyIniFile.ReadString('Subst', 'Name'+IntToStr(i), '')=NameComp then
      begin
        result:=true;
        exit;
      end;
    end;
    MyIniFile.Free;
  end;

var
  i, CountObject: integer;
  MyIniFile: TIniFile;
  MyFlow: TFlowCompaunding;
begin
  StatusBar1.SimpleText:='���� ���������� ������ � ����...';
  with TotalFlowCompaunding do
  begin

    MyFlow:=TFlowCompaunding.Create;
    MyFlow:=TotalFlowCompaunding.GetFlowOfName(
         ListBoxEndSelectFlow.Items.Strings[ListBoxEndSelectFlow.ItemIndex]);

    MyIniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'\Base.ini');
    CountObject:=MyIniFile.ReadInteger('Subst', 'CountObject', 0);
    PrBar.Max:=Length(MyFlow.Components)+1;
    PrBar.Position:=1;

    for i:=0 to Length(MyFlow.Components)-1 do
    begin
      Refresh;
      if not ExistInBase(MyFlow.Components[i].Name) then
      begin

        MyIniFile.WriteString('Subst', 'Name'+IntToStr(CountObject+1), MyFlow.Components[i].Name);
        CountObject:=CountObject+1;
        MyIniFile.WriteInteger('Subst', 'CountObject', CountObject);

      end;
      MyIniFile.WriteFloat('CoefB', MyFlow.Components[i].Name, MyFlow.Components[i].CoefB);
      MyIniFile.WriteFloat('MotON', MyFlow.Components[i].Name, MyFlow.Components[i].MotON);
      MyIniFile.WriteFloat('ResON', MyFlow.Components[i].Name, MyFlow.Components[i].ResON);

      MyIniFile.WriteFloat('Ro20',   MyFlow.Components[i].Name, MyFlow.Components[i].Ro20);
      MyIniFile.WriteFloat('TemKip', MyFlow.Components[i].Name, MyFlow.Components[i].TemKip);
      MyIniFile.WriteFloat('DNP_A',  MyFlow.Components[i].Name, MyFlow.Components[i].DNP_A);
      MyIniFile.WriteFloat('DNP_B',  MyFlow.Components[i].Name, MyFlow.Components[i].DNP_B);
      MyIniFile.WriteFloat('DNP_C',  MyFlow.Components[i].Name, MyFlow.Components[i].DNP_C);
      MyIniFile.WriteFloat('MolarMass', MyFlow.Components[i].Name, MyFlow.Components[i].MolarMass);
      MyIniFile.WriteFloat('MuA', MyFlow.Components[i].Name, MyFlow.Components[i].MuA);
      MyIniFile.WriteFloat('MuB', MyFlow.Components[i].Name, MyFlow.Components[i].MuB);


      PrBar.Position:=PrBar.Position+1;
    end;
    PrBar.Position:=0;
  end;
  StatusBar1.SimpleText:='';
end;
procedure TFormFlowofOV.GetTotalFlow(var TotalFlow: TTotalFlowCompaunding);
begin
  TotalFlow:=TotalFlowCompaunding;
end;

procedure TFormFlowofOV.EditTempFlowChange(Sender: TObject);
begin
  if EditExpendFlow.Text='' then exit;
  TotalFlowCompaunding.FlowTemp:=StrToFloat(EditExpendFlow.Text);
end;

procedure TFormFlowofOV.ListBoxUslovDblClick(Sender: TObject);
begin
  ListBoxUslovClick(Sender);
  Button3Click(Sender);
end;

procedure TFormFlowofOV.BtSetConditionClick(Sender: TObject);
var
  Cond: TCondition;
  i: integer;
  arr: TArrOfDouble;
begin
  for i:=0 to form20.ComponentCount-1 do
    begin
      if (form20.Components[i] is TEdit) then
      begin
        //(form20.Components[i] as TEdit).Text:='0';
      end;
    end;
  if form20.ShowModal = mrOk then
  begin
    SetLength(arr, 10);
    arr[0]:= StrToFloat(edit3.Text);
    arr[1]:= StrToFloat(edit4.Text);
    arr[2]:= StrToFloat(edit5.Text);
    arr[3]:= StrToFloat(edit6.Text);
    arr[4]:= StrToFloat(edit7.Text);
    arr[5]:= StrToFloat(edit9.Text);
    arr[6]:= StrToFloat(edit10.Text);
    arr[7]:= StrToFloat(edit11.Text);
    arr[8]:= StrToFloat(edit12.Text);
    arr[9]:= StrToFloat(edit13.Text);

    Cond:=TotalFlowCompaunding.ArrConditions.CreateCondition(edit1.Text,
       StrToFloat(edit2.Text), arr);
    TotalFlowCompaunding.ArrConditions.AddCondition(Cond);
    ListBoxUslov.Items.Add(Cond.Name);
    ListBoxUslov.ItemIndex:=ListBoxUslov.Items.Count-1;
    ListBoxUslovClick(Sender);
  end;
end;

procedure TFormFlowofOV.ListBoxUslovClick(Sender: TObject);
var
  Cond: TCondition;
begin
  if ListBoxUslov.ItemIndex>-1 then
  begin
    Cond:=TotalFlowCompaunding.ArrConditions.GetConditionOfName(
      ListBoxUslov.Items[ListBoxUslov.ItemIndex]);
    Edit1.Text:=Cond.Name;
    Edit2.Text:=FloatToStr(Cond.OV);
    Edit3.Text:=FloatToStr(Cond.restrictions[0]);
    Edit4.Text:=FloatToStr(Cond.restrictions[1]);
    Edit5.Text:=FloatToStr(Cond.restrictions[2]);
    Edit6.Text:=FloatToStr(Cond.restrictions[3]);
    Edit7.Text:=FloatToStr(Cond.restrictions[4]);
    Edit9.Text:=FloatToStr(Cond.restrictions[5]);
    Edit10.Text:=FloatToStr(Cond.restrictions[6]);
    Edit11.Text:=FloatToStr(Cond.restrictions[7]);
    Edit12.Text:=FloatToStr(Cond.restrictions[8]);
    Edit13.Text:=FloatToStr(Cond.restrictions[9]);

  end;
end;

procedure TFormFlowofOV.Button2Click(Sender: TObject);
begin
  if ListBoxUslov.ItemIndex>-1 then
  begin
    if CreateMessageDialog('�� ������������� ������ ������� �������?',
        mtConfirmation, [mbYes, mbNo]).ShowModal = mrYes then
    begin
      TotalFlowCompaunding.ArrConditions.DelCondition(
        ListBoxUslov.Items[ListBoxUslov.ItemIndex]);
      ListBoxUslov.Items.Delete(ListBoxUslov.ItemIndex);
      ListBoxUslov.Update;
      ListBoxUslov.ItemIndex:=0;
    end;
  end;
end;

procedure TFormFlowofOV.Button3Click(Sender: TObject);
var
  Cond: TCondition;
  i: integer;
begin
  if ListBoxUslov.ItemIndex>-1 then
  begin
    Cond:=TotalFlowCompaunding.ArrConditions.GetConditionOfName(
          ListBoxUslov.Items[ListBoxUslov.ItemIndex]);

    form20.Edit1.Text:= Cond.Name;

    form20.ComboBox1.ItemIndex:=form20.ComboBox1.Items.IndexOf(FloatToStr(Cond.OV));

    form20.Edit3.Text:= FloatToStr(Cond.restrictions[0]);
    form20.Edit4.Text:= FloatToStr(Cond.restrictions[1]);
    form20.Edit5.Text:= FloatToStr(Cond.restrictions[2]);
    form20.Edit6.Text:= FloatToStr(Cond.restrictions[3]);
    form20.Edit7.Text:= FloatToStr(Cond.restrictions[4]);
    form20.Edit9.Text:= FloatToStr(Cond.restrictions[5]);
    form20.Edit10.Text:= FloatToStr(Cond.restrictions[6]);
    form20.Edit11.Text:= FloatToStr(Cond.restrictions[7]);
    form20.Edit12.Text:= FloatToStr(Cond.restrictions[8]);
    form20.Edit13.Text:= FloatToStr(Cond.restrictions[9]);


    if form20.ShowModal= mrOk then
    begin
      Cond.Name:=form20.Edit1.Text;
      Cond.OV:=StrToFloat(form20.ComboBox1.Text);
      Cond.restrictions[0]:=StrToFloat(form20.Edit3.Text);
      Cond.restrictions[1]:=StrToFloat(form20.Edit4.Text);
      Cond.restrictions[2]:=StrToFloat(form20.Edit5.Text);
      Cond.restrictions[3]:=StrToFloat(form20.Edit6.Text);
      Cond.restrictions[4]:=StrToFloat(form20.Edit7.Text);
      Cond.restrictions[5]:=StrToFloat(form20.Edit9.Text);
      Cond.restrictions[6]:=StrToFloat(form20.Edit10.Text);
      Cond.restrictions[7]:=StrToFloat(form20.Edit11.Text);
      Cond.restrictions[8]:=StrToFloat(form20.Edit12.Text);
      Cond.restrictions[9]:=StrToFloat(form20.Edit13.Text);

      ListBoxUslov.Items[ListBoxUslov.ItemIndex]:=Cond.Name;
    end;
  end;
end;

procedure TFormFlowofOV.Button4Click(Sender: TObject);

function ExistNameInList(Name: String; ListBox: TListBox): boolean;
  var
    i: integer;
  begin
    result:=false;
    for i:=0 to ListBox.Items.Count-1 do
    begin
      if ListBox.Items.Strings[i]=Name then
      begin
        result:=true;
        break;
      end;
    end;
  end;
var
  MyFlow: TFlowCompaunding;
begin
  if Fgrupp.ShowModal=mrOk then
  begin

    if ExistNameInList(SumFlow.Name, ListBoxAllFlow) then
    begin
      if CreateMessageDialog('����� ����� ��� ����������! �������� ���?',
       mtWarning, [mbYes,mbNo]).ShowModal=mrYes then
      begin
        with ListBoxAllFlow.Items do
        begin
          MyFlow:=TotalFlowCompaundingInside.GetFlowOfName(
                            Strings[IndexOf(SumFlow.Name)]);
          MyFlow:=SumFlow;
          ListBoxAllFlow.Selected[IndexOf(SumFlow.Name)]:=true;
        end;
      end
      else
      begin
        exit;
      end;
    end
    else
    begin
      TotalFlowCompaundingInside.AddFlow(UGrupp.SumFlow);
      ListBoxAllFlow.Items.Add(SumFlow.Name);
      ListBoxAllFlow.Selected[ListBoxAllFlow.Items.Count-1]:=true;

    end;
  end;

end;

procedure TFormFlowofOV.RadioGroup1Click(Sender: TObject);
begin
 case RadioGroup1.ItemIndex of
   0:begin
      Edit8.Enabled:=false;
     end;
   1:begin
      Edit8.Enabled:=true; 
     end;

 end;
end;

procedure TFormFlowofOV.Button5Click(Sender: TObject);

var
  s: string;
  i, j: integer;

  f1:textFile;      //��� ���������� �����������
  l: OleVariant;

  z:textfile;

begin

  s:='';
  for i:=0 to StringGridStructureOfFlow.RowCount-1 do
  begin
    for j:=0 to StringGridStructureOfFlow.ColCount-1 do
      begin
        s:=s+StringGridStructureOfFlow.Cells[j,i]+Char(VK_TAB);
      end;
    s:=s+#13;
  end;
  clipboard.AsText:=s;

   //������� ��� ���������� ����������� � txt ����� ��� � �� ����... Nikotin


begin

    assignFile(z,ExtractFilePath(Application.ExeName)+'\Vxod\'+ListBoxEndSelectFlow.Items[ListBoxEndSelectFlow.Itemindex]+'.sfc');
    rewrite(z);
      //��� ��� ������ ���� ������, ��� ������� ����������� ���, ��� ������ ������ ������������ ������ ������� �� ������ �������,� ����� �������� ����� �� �������

Writeln(z,'[Subst]');                           {����������� ���� ������ ���� ����������� ���������, ����� ��� �������������}
Writeln(z,'CountObject=',110);
Writeln(z,'NameFlow=',ListBoxEndSelectFlow.Items[ListBoxEndSelectFlow.Itemindex]);
Writeln(z,'DS=,');
Writeln(z,'Expenditure=0');

For i:=1 to 110 do
 Writeln(z,'Name',i,'=',StringGridStructureOfFlow.Cells[0,i]);
 Writeln(z,'[Concentr]');
For i:=1 to 110 do
 Writeln(z,StringGridStructureOfFlow.Cells[0,i],'=',StringGridStructureOfFlow.Cells[1,i]);



  closefile(z);
end;






end;







procedure TFormFlowofOV.DefaultSetData;  
var
  i: integer;
  R: TSearchRec;
begin
  CreateMessageDialog('���������, ���� �������� �������..', mtInformation, []).Show;
  Application.ProcessMessages;
  FindFirst(ExtractFilePath(Application.ExeName)+'\Data\*.sfc',faAnyFile, R);
  TotalFlowCompaundingInside.LoadFromSFC(
                  ExtractFilePath(Application.ExeName)+'Data\'+R.Name, ListBoxAllFlow, FormParam.RGSourse.ItemIndex);
  while FindNext(R)=0 do
    TotalFlowCompaundingInside.LoadFromSFC(
                  ExtractFilePath(Application.ExeName)+'Data\'+R.Name, ListBoxAllFlow, FormParam.RGSourse.ItemIndex);

  for i:=0 to ListBoxAllFlow.Items.Count-1 do
  begin
    ListBoxAllFlow.ItemIndex:=0;
    SpeedButtonInSelectFlowClick(Self);
  end;

  BitBtnForwardClick(Self);

  CreateMessageDialog('���������, ���� �������� �������..', mtInformation, []).Close;

end;

procedure TFormFlowofOV.InBuferClick(Sender: TObject);
var
  i, j: integer;
  StrGrid: TStringGrid;
  s: string;
begin
  Clipboard.Open;
  s:='';
  StrGrid:=StringGridResult;
  for i:=0 to StrGrid.RowCount-1 do
  begin
    for j:=0 to StrGrid.ColCount-1 do
    begin
      s:=s+StrGrid.Cells[j, i]+Char(VK_TAB);
    end;

    s:=s+char(#13);
  end;

  s:=s+char(#13);
  s:=s+char(#13);
  StrGrid:=SG1Itog;
  for i:=0 to StrGrid.RowCount-1 do
  begin
    for j:=0 to StrGrid.ColCount-1 do
    begin
      s:=s+StrGrid.Cells[j, i]+Char(VK_TAB);
    end;

    s:=s+char(#13);
  end;
  Clipboard.AsText:=s;
  Clipboard.Close;
end;

procedure TFormFlowofOV.Button6Click(Sender: TObject);
var
  Cond1, Cond2, Cond3: TCondition;

  arr: TArrOfDouble;
begin
  SetLength(arr, 10);
    arr[0]:= StrToFloat('46,1');
    arr[1]:= StrToFloat('100');
    arr[2]:= StrToFloat('1');
    arr[3]:= StrToFloat('35');
    arr[4]:= StrToFloat('18');
    arr[5]:= StrToFloat('0,001');
    arr[6]:= StrToFloat('9516');
    arr[7]:= StrToFloat('15');
    arr[8]:= StrToFloat('92');
    arr[9]:= StrToFloat('23402');

    Cond1:=TotalFlowCompaunding.ArrConditions.CreateCondition('������ 92',
       StrToFloat('92'), arr);
    TotalFlowCompaunding.ArrConditions.AddCondition(Cond1);
    ListBoxUslov.Items.Add(Cond1.Name);
    ListBoxUslov.ItemIndex:=ListBoxUslov.Items.Count-1;

    arr[6]:= StrToFloat('3810');
    arr[8]:= StrToFloat('50');
    arr[9]:= StrToFloat('24673');

    Cond2:=TotalFlowCompaunding.ArrConditions.CreateCondition('������ 95',
       StrToFloat('95'), arr);
    TotalFlowCompaunding.ArrConditions.AddCondition(Cond2);
    ListBoxUslov.Items.Add(Cond2.Name);
    ListBoxUslov.ItemIndex:=ListBoxUslov.Items.Count-1;

    arr[6]:= StrToFloat('149');
    arr[8]:= StrToFloat('80');
    arr[9]:= StrToFloat('25623');

    Cond3:=TotalFlowCompaunding.ArrConditions.CreateCondition('������ 98',
       StrToFloat('98'), arr);
    TotalFlowCompaunding.ArrConditions.AddCondition(Cond3);
    ListBoxUslov.Items.Add(Cond3.Name);
    ListBoxUslov.ItemIndex:=ListBoxUslov.Items.Count-1;

    arr[0]:= StrToFloat('35');
    arr[5]:= StrToFloat('0,005');
    arr[6]:= StrToFloat('10000');
    arr[8]:= StrToFloat('80');
    arr[9]:= StrToFloat('18200');

    Cond3:=TotalFlowCompaunding.ArrConditions.CreateCondition('������ 80',
       StrToFloat('80'), arr);
    TotalFlowCompaunding.ArrConditions.AddCondition(Cond3);
    ListBoxUslov.Items.Add(Cond3.Name);
    ListBoxUslov.ItemIndex:=ListBoxUslov.Items.Count-1;
    ListBoxUslovClick(Sender);
end;

procedure TFormFlowofOV.RGVidDolejClick(Sender: TObject);
var
  MyFlow:TFlowCompaunding;
begin
  if ListBoxEndSelectFlow.ItemIndex>-1 then
  begin
    MyFlow:=TotalFlowCompaunding.GetFlowOfName(
      ListBoxEndSelectFlow.Items.Strings[ListBoxEndSelectFlow.ItemIndex]);
    MyFlow.VidDolej:=RGVidDolej.ItemIndex;
  end;

end;

procedure TFormFlowofOV.BitBtnRVSClick(Sender: TObject);
begin
  if FRezervuar.ShowModal=mrOk then
  begin
    _ParamRezerv.SetToTotalComp(TotalFlowCompaunding);
    // ������ �������� �������� � ������ �� _RVS: TRezervuars
  end;

end;

procedure TFormFlowofOV.BtPIMSClick(Sender: TObject);
var
  i: integer;
  _MyFlow: TFlowCompaunding;
begin
  if FPIMS.ShowModal=mrOk then
  begin
    for i:=0 to Length(ParamCompPIMS.ValueParam)-1 do
    begin

      _MyFlow:=TotalFlowCompaunding.GetFlowOfIndexOfCondition(StrToInt(ParamCompPIMS.FlowCondInd[i]));
      _MyFlow.Expenditure:=_MyFlow.Expenditure+ParamCompPIMS.ValueParam[i];
      _MyFlow.ExpenditureOfDay:=ParamCompPIMS.ValueParam[i];
      _MyFlow.ExistExpenditure:=_MyFlow.Expenditure;
      _MyFlow.ExistExpenditure2:=_MyFlow.Expenditure;
      ListBoxEndSelectFlowClick(sender);
      StatusBar1.Panels[1].Text:='�����: PIMS';
      StatusBar1.Panels[2].Text:='1';
      StatusBar1.Panels[3].Text:='�� '+IntToStr(ParamCompPIMS._CountDay)+' ����';
      ArrTotalFlowCompaunding:=TArrTotalFlowCompaunding.Create;
    end;
  end;
end;

procedure TFormFlowofOV.ExportToExcelArrTotalFlow;
var
  i, j, k, n: integer;
begin
  ea1.Connect;
  ea1.Workbooks.Add(EmptyParam, 0);
  ea1.Cells.NumberFormat:='#######0,000';
  n:=0;
  for k:=0 to Length(ArrTotalFlowCompaunding.Items)-1 do
  begin

      with ArrTotalFlowCompaunding.Items[k] do
      begin
        if _StringGridResult.RowCount>_SG1Itog.RowCount then
          n:=k*_StringGridResult.RowCount
        else
          n:=k*_SG1Itog.RowCount;

        for i:=0 to _StringGridResult.RowCount-1 do
        begin
          for j:=0 to _StringGridResult.ColCount-1 do
          begin
            if (i=0) or (j=0) then
              ea1.Cells.Item[n+i+1,j+1]:=_StringGridResult.Cells[j,i]
            else
              ea1.Cells.Item[n+i+1,j+1]:=StrToFloat(_StringGridResult.Cells[j,i]);
          end;
        end;
        for i:=0 to _SG1Itog.RowCount-1 do
        begin
          for j:=0 to _SG1Itog.ColCount-1 do
          begin
            if (j=_SG1Itog.ColCount-1) and (i>0) and
              (_SG1Itog.Cells[j,i]<>'') then
              ea1.Cells.Item[n+i+1,j+1+_StringGridResult.ColCount]:=StrToFloat(_SG1Itog.Cells[j,i])
            else
              ea1.Cells.Item[n+i+1,j+1+_StringGridResult.ColCount]:=_SG1Itog.Cells[j,i];
          end;
        end;

        
      end;
  end;
  ea1.Visible[0]:=true;

end;

procedure TFormFlowofOV.GetTotalFlowOfArr(
  var TotalFlow: TTotalFlowCompaunding; Ind: integer);
begin
  TotalFlow:=ArrTotalFlowCompaunding.Items[ind];
end;


procedure TFormFlowofOV.EdPriceChange(Sender: TObject);
var
  MyFlow: TFlowCompaunding;
begin
  if EdPrice.Text='' then exit;

  if ListBoxEndSelectFlow.ItemIndex>-1 then
  begin
    MyFlow:=TotalFlowCompaunding.GetFlowOfName(
            ListBoxEndSelectFlow.Items[ListBoxEndSelectFlow.ItemIndex]);
    MyFlow.Price:=StrToFloat(EdPrice.Text);

  end
  else
    EdPrice.Text:='0';
end;

procedure TFormFlowofOV.EdPriceKeyPress(Sender: TObject; var Key: Char);
begin
  if (not (Key in ['0'..'9', DecimalSeparator, char(8), char(#13)]))
    and (ord(Key)>25) then Key:=#0;
end;

procedure TFormFlowofOV.BtNullClick(Sender: TObject);
var
  i: integer;
begin
  for i:=0 to ListBoxEndSelectFlow.Items.Count-1 do
  begin
    ListBoxEndSelectFlow.ItemIndex:=i;
    ListBoxEndSelectFlowClick(Sender);
    EditExpendFlow.Text:='0';
    EditExpendFlowChange(Sender);
  end;
end;

end.
