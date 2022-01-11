unit UOVofFlowLite;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, TeeProcs, TeEngine, Chart, Math,
  UMath, IniFiles, ComCtrls, Series, Menus, XPMan,CLipBrd, OleServer,
  ExcelXP;

type
  TFormOVofFlowLite = class(TForm)
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
    ChartResult: TChart;
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
    RG_ON: TRadioGroup;
    PrBar: TProgressBar;
    PageControl1: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    StringGridResult: TStringGrid;
    StringGridItogSostav: TStringGrid;
    BitBtn3: TBitBtn;
    PMStrFlow: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    PMFlow: TPopupMenu;
    MenuItem2: TMenuItem;
    XPManifest1: TXPManifest;
    Label15: TLabel;
    EditTempFlow: TEdit;
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
    TabSheet13: TTabSheet;
    StringGridMolarMass: TStringGrid;
    PMSave: TPopupMenu;
    InFile1: TMenuItem;
    InBase1: TMenuItem;
    BtSave2: TBitBtn;
    ButtonStructure: TBitBtn;
    TabSheet14: TTabSheet;
    StringGridMuA: TStringGrid;
    TabSheet15: TTabSheet;
    StringGridMuB: TStringGrid;
    Button2: TButton;
    SD2: TSaveDialog;
    Button3: TButton;
    OD2: TOpenDialog;
    BitBtnRVS: TBitBtn;
    EdPrice: TEdit;
    Label16: TLabel;
    Button4: TButton;
    EA1: TExcelApplication;
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
    procedure BtSave2Click(Sender: TObject);
    procedure StringGridStructureOfFlowSetEditText(Sender: TObject; ACol,
      ARow: Integer; const Value: String);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure InBase1Click(Sender: TObject);
    procedure GetTotalFlow(var TotalFlow: TTotalFlowCompaunding);
    procedure EditTempFlowChange(Sender: TObject);
    procedure Button2Exit(Sender: TObject);
    procedure DefaultSetData;
    procedure Button3Click(Sender: TObject);
    procedure BitBtnRVSClick(Sender: TObject);
    procedure EdPriceChange(Sender: TObject);
    procedure EdPriceKeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
  private
    TotalFlowCompaunding: TTotalFlowCompaunding;
    TotalFlowCompaundingInside: TTotalFlowCompaunding;{ Private declarations }
  public
    { Public declarations }
  end;

var
  FormOVofFlowLite: TFormOVofFlowLite;

implementation

uses USecondForm, UParam, URezervuar;


{$R *.dfm}

procedure TFormOVofFlowLite.BitBtnCancelOrReadyClick(Sender: TObject);
begin
  Close; 
end;

procedure TFormOVofFlowLite.FormShow(Sender: TObject);
var
  i: integer;
begin
  // всегда начинаем с первого
  NB.PageIndex:=0;
  PCStrFlow.TabIndex:=0;
  StringGridStructureOfFlow.Cells[0,0]:='Компонент';
  StringGridStructureOfFlow.Cells[1,0]:='Конц., %мас.';
  StringGridStructureOfFlow.ColWidths[0]:=160;
  StringGridStructureOfFlow.ColWidths[1]:=80;
  StringGridResult.ColWidths[0]:=160;
  StringGridResult.ColWidths[1]:=80;
  StringGridMotON.Cells[0,0]:='Компонент';
  StringGridMotON.Cells[1,0]:='ОЧ по ММ';
  StringGridMotON.ColWidths[0]:=160;
  StringGridMotON.ColWidths[1]:=80;
  StringGridResON.Cells[0,0]:='Компонент';
  StringGridResON.Cells[1,0]:='ОЧ по ИМ';
  StringGridResON.ColWidths[0]:=160;
  StringGridResON.ColWidths[1]:=80;
  StringGridItogSostav.Cells[0,0]:='Компонент';
  StringGridItogSostav.Cells[1,0]:='Конц., %мас.';
  StringGridItogSostav.Cells[2,0]:='Конц., %мол.';
  StringGridItogSostav.ColWidths[0]:=160;
  StringGridItogSostav.ColWidths[1]:=80;
  //StringGridItogSostav.ColWidths[2]:=80;

  StringGridGOST.Cells[0,0]:='Компонент';
  StringGridGOST.Cells[1,0]:='Конц., %мас.';
  StringGridGOST.ColWidths[0]:=160;
  StringGridGOST.ColWidths[1]:=80;

  StringGridCoefB.Cells[0,0]:='Компонент';
  StringGridCoefB.Cells[1,0]:='Значение';
  StringGridCoefB.ColWidths[0]:=160;
  StringGridCoefB.ColWidths[1]:=80;

  StringGridRo20.Cells[0,0]:='Компонент';
  StringGridRo20.Cells[1,0]:='Значение';
  StringGridRo20.ColWidths[0]:=160;
  StringGridRo20.ColWidths[1]:=80;

  StringGridTemKip.Cells[0,0]:='Компонент';
  StringGridTemKip.Cells[1,0]:='Значение';
  StringGridTemKip.ColWidths[0]:=160;
  StringGridTemKip.ColWidths[1]:=80;

  StringGridDNP_A.Cells[0,0]:='Компонент';
  StringGridDNP_A.Cells[1,0]:='Значение';
  StringGridDNP_A.ColWidths[0]:=160;
  StringGridDNP_A.ColWidths[1]:=80;

  StringGridDNP_B.Cells[0,0]:='Компонент';
  StringGridDNP_B.Cells[1,0]:='Значение';
  StringGridDNP_B.ColWidths[0]:=160;
  StringGridDNP_B.ColWidths[1]:=80;

  StringGridDNP_C.Cells[0,0]:='Компонент';
  StringGridDNP_C.Cells[1,0]:='Значение';
  StringGridDNP_C.ColWidths[0]:=160;
  StringGridDNP_C.ColWidths[1]:=80;

  StringGridMolarMass.Cells[0,0]:='Компонент';
  StringGridMolarMass.Cells[1,0]:='Значение';
  StringGridMolarMass.ColWidths[0]:=160;
  StringGridMolarMass.ColWidths[1]:=80;

  StringGridMuA.Cells[0,0]:='Компонент';
  StringGridMuA.Cells[1,0]:='Значение';
  StringGridMuA.ColWidths[0]:=160;
  StringGridMuA.ColWidths[1]:=80;

  StringGridMuB.Cells[0,0]:='Компонент';
  StringGridMuB.Cells[1,0]:='Значение';
  StringGridMuB.ColWidths[0]:=160;
  StringGridMuB.ColWidths[1]:=80;

  FormOVofFlowLite.OD1.InitialDir:=ExtractFilePath(Application.ExeName)+'Данные';
  FormOVofFlowLite.SD1.InitialDir:=ExtractFilePath(Application.ExeName)+'Данные';

  {for i:=5 to 10 do
    PCStrFlow.Pages[i].TabVisible:=false;
  for i:=7 to 9 do
    PCStrFlow.Pages[i].TabVisible:=true;  }


  DefaultSetData;
end;

procedure TFormOVofFlowLite.BitBtnBackClick(Sender: TObject);
begin
  NB.PageIndex:=NB.PageIndex-1;
  BitBtnForward.Enabled:=true;
  BitBtnCancelOrReady.Caption:='Отмена';
  if NB.PageIndex=0 then BitBtnBack.Enabled:=false
  else
    BitBtnBack.Enabled:=true;



  if (Length(TotalFlowCompaunding.Additives)=0) and
     (NB.ActivePage='Количество присадок') then
    begin
      NB.PageIndex:=NB.PageIndex-1;

    end;

   If NB.ActivePage='Задание присадок' then
  begin
    NB.PageIndex:=NB.PageIndex-1;
  end;

  if NB.ActivePage='Задание параметров выбранных потоков' then
    ListBoxEndSelectFlowClick(Self);
end;

procedure TFormOVofFlowLite.BitBtnForwardClick(Sender: TObject);
var
  i, j: integer;
  //MassAdditives: array of array of double;
  MyLineSeries: TLineSeries;
  MyFlow:TFlowCompaunding;
  SumArom,SumOlef, SumParaf, SumIzoParaf, SumNaft, Sera:real; // переменная для рассчета ароматики и олефиов, парафинов и др. Nikotin
begin

  if ListBoxSelectFlow.Items.Count=0 then
  begin
    StatusBar1.Panels.Items[0].Text:='Выберите хотя бы один поток!';
    exit;
  end;

  StatusBar1.Panels.Items[0].Text:='';

  NB.PageIndex:=NB.PageIndex+1;
  BitBtnBack.Enabled:=true;



  // перезаписывание выбранных потоков и создание компонентов потоков
  If NB.ActivePage='Задание параметров выбранных потоков' then
  begin

    ListBoxEndSelectFlow.Clear;
    ListBoxEndSelectFlow.Items.AddStrings(ListBoxSelectFlow.Items);
    ListBoxEndSelectFlow.Selected[0]:=true;
    SetLength(TotalFlowCompaunding.Flows, ListBoxEndSelectFlow.Items.Count);
    for i:=0 to Length(TotalFlowCompaunding.Flows)-1 do
    begin
      // проверям, есть ли уже созданные потоки с таким именем
      if TotalFlowCompaunding.GetFlowOfName(
         ListBoxEndSelectFlow.Items.Strings[i])=nil then
      begin
        TotalFlowCompaunding.Flows[i]:=TFlowCompaunding.Create;
        with TotalFlowCompaunding do
        begin
          Flows[i]:=TotalFlowCompaundingInside.GetFlowOfName(
                                 ListBoxEndSelectFlow.Items.Strings[i]);
        end;
      end;
    end;
    ListBoxEndSelectFlowClick(Sender);

  end;

  If NB.ActivePage='Задание присадок' then
  begin
    NB.PageIndex:=NB.PageIndex+1;
  end;

  If NB.ActivePage='Количество присадок' then
  begin

    if EditExpendFlow.Text='0' then EditExpendFlow.Text:='1';
    TotalFlowCompaunding.FlowTemp:=StrToFloat(EditTempFlow.Text);
    // Выбираем метод моторный или исследовательский
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
     (NB.ActivePage='Количество присадок') then
    begin
      NB.PageIndex:=NB.PageIndex+1;

    end;

    for i:=0 to Length(TotalFlowCompaunding.Additives)-1 do
    begin
      // переприсвоение присадок, которые загружены и которые будут использоваться
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


  If NB.ActivePage='Результаты' then
  begin

    with StringGridResult do
    begin
      RowCount:=2;
      Cells[0,0]:='Параметр';
      Cells[1,0]:='Значение';
      // число
      // массив чисел
      // тут все гораздо сложнее
      ChartResult.SeriesList.Clear;
      for j:=0 to length(TotalFlowCompaunding.Additives)-1 do
      begin
        with TotalFlowCompaunding.Additives[j] do
        begin
          case ChangeConcentrAdditive of
          true :begin
                  ChartResult.Visible:=true;
                  MyLineSeries:= TLineSeries.Create(self);
                  for i:=0 to Trunc((LastConcentrAdditive-FirstConcentrAdditive)/StepConcentrAdditive) do
                  begin
                    ConcentrAdditive:=FirstConcentrAdditive+i*StepConcentrAdditive;
                    Cells[0,RowCount-1]:='ОЧ при '+Name+'='+FloatToStr(ConcentrAdditive);
                    Cells[1,RowCount-1]:=FloatToStr(roundto(
                                 TotalFlowCompaunding.TotalFlowOctaneValue,-2));
                    RowCount:=RowCount+1;
                    MyLineSeries.AddXY(ConcentrAdditive,TotalFlowCompaunding.TotalFlowOctaneValue);
                  end;
                  ConcentrAdditive:=0;
                  MyLineSeries.Title:=Name;
                  ChartResult.AddSeries(MyLineSeries);
                  RowCount:=RowCount-1;
                end;
          false:begin
                  Cells[0,RowCount-1]:='ОЧ при '+Name;
                  // тут кстати еще и забивается итоговый состав общего потока
                  Cells[1,RowCount-1]:=FloatToStr(
                      RoundTo(TotalFlowCompaunding.TotalFlowOctaneValue,-2));

                end;
          end;

        end;


        {надо учитывать, что концентрация будет меняться по каждой присадке
        следовательно}

        {надо сделать двумерный массив с произведением и кол-вом присадок}
        {SetLength(MassAdditives,1);
        for j:=0 to length(TotalFlowCompaunding.Additives)-1 do
          with TotalFlowCompaunding.Additives[j] do
          begin
            if ChangeConcentrAdditive then
            begin
              multi:=trunc((LastConcentrAdditive-
                 FirstConcentrAdditive)/StepConcentrAdditive);
              SetLength(MassAdditives,length(MassAdditives)*multi);
            end;
          end;

        multi:=0;
        for i:=0 to Length(TotalFlowCompaunding.Additives)-1 do
          if TotalFlowCompaunding.Additives[i].ChangeConcentrAdditive then
            multi:=multi+1;
        for i:=0 to Length(MassAdditives)-1 do
          SetLength(MassAdditives[i], multi);

        with TotalFlowCompaunding do
        begin

        end;}
      end;

      if length(TotalFlowCompaunding.Additives)=0 then
      begin
        Cells[0,RowCount-1]:='ОЧИ';
        // тут кстати еще и забивается итоговый состав общего потока
        Cells[1,RowCount-1]:=FloatToStr(
                 RoundTo(TotalFlowCompaunding.TotalFlowOctaneValue,-2));
        RowCount:=RowCount+1;
        Cells[0,RowCount-1]:='ОЧМ';
        // тут кстати еще и забивается итоговый состав общего потока
        Cells[1,RowCount-1]:=FloatToStr(
                 RoundTo(TotalFlowCompaunding.TotalFlowOctaneValue(false),-2));
      end;

    end;




    with StringGridItogSostav do
    begin
      RowCount:=Length(TotalFlowCompaunding.Components)+1;
      for i:=1 to RowCount-1 do
      begin
        Cells[0,i]:=TotalFlowCompaunding.Components[i-1].Name;
        Cells[1,i]:=FloatToStr(RoundTo(
                    TotalFlowCompaunding.Components[i-1].ConcentrComp,-4));
        Cells[2,i]:=FloatToStr(RoundTo(
                    TotalFlowCompaunding.Components[i-1].ConcentrCompMol,-4));
        // ДНП индекс индивидуальных компонентов

        Cells[3,i]:=FloatToStr(RoundTo(
                      TotalFlowCompaunding.Components[i-1].GetDNPIndex(TotalFlowCompaunding.FlowTemp),-2));
        //Плотность при заданной температуре
        Cells[4,i]:=FloatToStr(RoundTo(
                    TotalFlowCompaunding.Components[i-1].GetRoT(TotalFlowCompaunding.FlowTemp),-2));
        //вязкость при заданной температуре
        Cells[5,i]:=FloatToStr(RoundTo(
                    TotalFlowCompaunding.Components[i-1].GetMuT(TotalFlowCompaunding.FlowTemp),-2));


      end;



    end;
  end;

  with StringGridResult do
  begin
    RowCount:=RowCount+1;
    Cells[0,RowCount-1]:='ДНП потока';
    Cells[1,RowCount-1]:=FloatToStr(RoundTo(
                 myflow.GetDNP(TotalFlowCompaunding.Components,TotalFlowCompaunding.FlowTemp),-2));
    // плотность потока
    RowCount:=RowCount+1;
    Cells[0,RowCount-1]:='Плотность потока, кг/м3';
    Cells[1,RowCount-1]:=FloatToStr(RoundTo(
                 myflow.GetRoT(TotalFlowCompaunding.Components,TotalFlowCompaunding.FlowTemp),-2));
    //Вязкость
    RowCount:=RowCount+1;
    Cells[0,RowCount-1]:='Вязкость потока, c*Па';
    Cells[1,RowCount-1]:=FloatToStr(RoundTo(
                 myflow.GetMuT(TotalFlowCompaunding.Components,TotalFlowCompaunding.FlowTemp),-2));




  end;


  if NB.PageIndex=NB.Pages.Count-1 then
  begin
    BitBtnForward.Enabled:=false;
    BitBtnCancelOrReady.Caption:='Готово';
  end
  else
    BitBtnForward.Enabled:=true;
If NB.ActivePage='Результаты' then
  begin



        IF StringGridItogSostav.RowCount>60 then   // необычная защита от дурака. Если входной фаил имеет меньшее число потоков чем 60 он не будет искать бензол, ароматику и другие компаненты в нем Nikotin
          begin
       //н-парафины //Nikotin
       StringGridResult.RowCount:=StringGridResult.RowCount+1;
       StringGridResult.Cells[0,StringGridResult.RowCount-1]:='Н-парафины, %мас';
        For j:=1 to 10 do
           SumParaf:=SumParaf+StrToFloat(StringGridItogSostav.Cells[1,j]);
           StringGridResult.Cells[1,StringGridResult.RowCount-1]:=FloatToStr(SumParaf);
      //изо-парафины //Nikotin
       StringGridResult.RowCount:=StringGridResult.RowCount+1;
       StringGridResult.Cells[0,StringGridResult.RowCount-1]:='Изо-парафины, %мас';
        For j:=11 to 49 do
           SumIzoParaf:=SumIzoParaf+StrToFloat(StringGridItogSostav.Cells[1,j]);
           StringGridResult.Cells[1,StringGridResult.RowCount-1]:=FloatToStr(SumIzoParaf);
      //нафтены //Nikotin
       StringGridResult.RowCount:=StringGridResult.RowCount+1;
       StringGridResult.Cells[0,StringGridResult.RowCount-1]:='Нафтены, %мас';
        For j:=50 to 64 do
           SumNaft:=SumNaft+StrToFloat(StringGridItogSostav.Cells[1,j]);
           StringGridResult.Cells[1,StringGridResult.RowCount-1]:=FloatToStr(SumNaft);
      // олефины не уверен что все правильно считает
      StringGridResult.RowCount:=StringGridResult.RowCount+1;
      StringGridResult.Cells[0,StringGridResult.RowCount-1]:='Олефины, %мас';
        For j:=79 to 110 do
           SumOlef:=SumOlef+StrToFloat(StringGridItogSostav.Cells[1,j]);
           StringGridResult.Cells[1,StringGridResult.RowCount-1]:=FloatToStr(SumOlef);
            end;
      // бензол //Nikotin
       StringGridResult.RowCount:= StringGridResult.RowCount+1;
       StringGridResult.Cells[0, StringGridResult.RowCount-1]:='Бензол, %мас';
        StringGridResult.Cells[1, StringGridResult.RowCount-1]:=FloatToStrF((StrToFloat(StringGridItogSostav.Cells[1,65])),fffixed,3,1);

     // ароматика не уверен что все правильно считает  Nikotin
      StringGridResult.RowCount:=StringGridResult.RowCount+1;
      StringGridResult.Cells[0,StringGridResult.RowCount-1]:='Ароматика, %мас';
        For j:=65 to 78 do
           SumArom:=SumArom+StrToFloat(StringGridItogSostav.Cells[1,j]);
           StringGridResult.Cells[1,StringGridResult.RowCount-1]:=FloatToStr(SumArom);
     // Сера
      StringGridResult.RowCount:=StringGridResult.RowCount+1;
      StringGridResult.Cells[0,StringGridResult.RowCount-1]:='Сера, %мас';
      Sera:=0;
        For j:=112 to 112 do
        if StringGridItogSostav.Cells[1,j]<>'' then
           Sera:=Sera+StrToFloat(StringGridItogSostav.Cells[1,j]);
           StringGridResult.Cells[1,StringGridResult.RowCount-1]:=FloatToStr(Sera);

     // Себестоимость
      StringGridResult.RowCount:=StringGridResult.RowCount+1;
      StringGridResult.Cells[0,StringGridResult.RowCount-1]:='Себестоимость,руб/т';
      StringGridResult.Cells[1,StringGridResult.RowCount-1]:=FloatToStr(
           TotalFlowCompaunding.CalcSebestoim);


  StringGridItogSostav.ColCount:=3; //не знаю что в эту ячейку выдается поэтому убераю Nikotin
  Button2.Visible:=True; // Делаю возможным считать данные в буффер
  end;
end;

procedure TFormOVofFlowLite.SpeedButtonInSelectFlowClick(Sender: TObject);
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

procedure TFormOVofFlowLite.BitBtn1Click(Sender: TObject);


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

procedure TFormOVofFlowLite.SpeedButtonInAllFlowClick(Sender: TObject);
begin
  if ListBoxSelectFlow.ItemIndex>-1 then
  begin
    ListBoxAllFlow.Items.Add(ListBoxSelectFlow.Items[ListBoxSelectFlow.ItemIndex]);
    ListBoxSelectFlow.Items.Delete(ListBoxSelectFlow.ItemIndex);
  end;
end;

procedure TFormOVofFlowLite.ButtonStructureClick(Sender: TObject);
var
  MyFlow: TFlowCompaunding;
  MyIniFile, _MyIniFile: TIniFile;
  i, CountObject: integer;
begin
  if ListBoxEndSelectFlow.ItemIndex>-1 then
  begin
    OD1.Filter:='Состав потока (*.sfc)|*.sfc';
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
          // внутренее использование
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
                MyFlow.Components[i].MuA:=MyIniFile.ReadFloat('MuA', MyFlow.Components[i].Name, 0);
                MyFlow.Components[i].MuB:=MyIniFile.ReadFloat('MuB', MyFlow.Components[i].Name, 0);

              end;
          end;
        end;
      end;
    end;
    OD1.Filter:='';
    ListBoxEndSelectFlowClick(Sender);
  end;
end;

procedure TFormOVofFlowLite.ListBoxEndSelectFlowClick(Sender: TObject);
var
  MyFlow: TFlowCompaunding;
  i: integer;
begin
  MyFlow:=TotalFlowCompaunding.GetFlowOfName(
          ListBoxEndSelectFlow.Items[ListBoxEndSelectFlow.ItemIndex]);
  EditExpendFlow.Text:=FloatToStr(MyFlow.Expenditure);
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

procedure TFormOVofFlowLite.BitBtn2Click(Sender: TObject);
var
  i: integer;
  CountObject: integer;
  MyIniFile: TIniFile;
begin
  OD1.Filter:='Присадки (*.add)|*.add';
  if OD1.Execute then
  begin
    ListBoxAllAdditive.Clear;
    MyIniFile:=TIniFile.Create(OD1.FileName);
    CountObject:=MyIniFile.ReadInteger('Additives','CountObject', 0);
    DecimalSeparator:=MyIniFile.ReadString('Subst', 'DS', ',')[1];
    for i:=1 to CountObject do
    begin
      ListBoxAllAdditive.Items.Add(MyIniFile.ReadString('Additives',
                    'Name'+IntToStr(i), 'Нет данных'));
    end;
    SetLength(TotalFlowCompaundingInside.Additives, ListBoxAllAdditive.Items.Count);
    for i:=0 to Length(TotalFlowCompaundingInside.Additives)-1 do
    begin
      TotalFlowCompaundingInside.Additives[i]:=TAdditiveCompaunding.Create;
      with TotalFlowCompaundingInside.Additives[i] do
      begin
        Name:=MyIniFile.ReadString('Additives',
                    'Name'+IntToStr(i+1), 'Нет данных');
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

procedure TFormOVofFlowLite.SpeedButtonInSelectAdditiveClick(Sender: TObject);
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

procedure TFormOVofFlowLite.SpeedButtonInAllAdditiveClick(Sender: TObject);
begin
  if ListBoxSelectAdditive.ItemIndex>-1 then
  begin
    ListBoxAllAdditive.Items.Add(ListBoxSelectAdditive.Items[ListBoxSelectAdditive.ItemIndex]);
    ListBoxSelectAdditive.Items.Delete(ListBoxSelectAdditive.ItemIndex);
  end;
end;

procedure TFormOVofFlowLite.RadioButton1Click(Sender: TObject);
begin
  EditValueAdditive.Enabled:=true;
  EditFirstValueAdditive.Enabled:=false;
  EditLastValueAdditive.Enabled:=false;
  EditStep.Enabled:=false;
  ChartResult.Visible:=false;
end;

procedure TFormOVofFlowLite.RadioButton2Click(Sender: TObject);
begin
  EditValueAdditive.Enabled:=false;
  EditFirstValueAdditive.Enabled:=true;
  EditLastValueAdditive.Enabled:=true;
  EditStep.Enabled:=true;

end;

procedure TFormOVofFlowLite.Button1Click(Sender: TObject);
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

procedure TFormOVofFlowLite.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormOVofFlowLite.btCreateClick(Sender: TObject);
begin
  SecondForm.Label1.Caption:='Введите название потока';
  if SecondForm.ShowModal=mrOk then
  begin
    ListBoxAllFlow.Items.Add(SecondForm.EditResult.Text);
    ListBoxAllFlow.Selected[
                     ListBoxAllFlow.Items.Count-1]:=true;
    //пробую сделать потоки через подставной элемент
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

procedure TFormOVofFlowLite.btSaveClick(Sender: TObject);
var
  i,CountObject: integer;
  MyIniFile: TIniFile;
  MyFlow: TFlowCompaunding;

begin

  if ListBoxAllFlow.Items.Count=0 then
  begin
    ShowMessage('Необходимо загрузить поток');
    exit;
  end;
  SD1.Filter:='Потоки (*.sfc)|*.sfc';

  if SD1.Execute then
  begin
    StatusBar1.SimpleText:='Идет сохранение данных...';
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
  SD1.Filter:='';
end;

procedure TFormOVofFlowLite.BitBtn4Click(Sender: TObject);
const
  ArrLabelCaption: array [1..6] of string = ('Название присадки',
  'Приемистость присадки', 'Максимальное увеличение октанового числа',
  'Константа эффективности', 'Максимальная концентрация присадки',
  'Концентрация присадки');
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

procedure TFormOVofFlowLite.EditExpendFlowChange(Sender: TObject);
var
  MyFlow: TFlowCompaunding;
begin
  if EditExpendFlow.Text='' then exit;

  if ListBoxEndSelectFlow.ItemIndex>-1 then
  begin
    MyFlow:=TotalFlowCompaunding.GetFlowOfName(
            ListBoxEndSelectFlow.Items[ListBoxEndSelectFlow.ItemIndex]);
    MyFlow.Expenditure:=StrToFloat(EditExpendFlow.Text);
  end
  else
    EditExpendFlow.Text:='0';
end;

procedure TFormOVofFlowLite.EditExpendFlowKeyPress(Sender: TObject;
  var Key: Char);
begin

  if (not (Key in ['0'..'9', DecimalSeparator, '-', char(8), char(#13)]))
    and (ord(Key)>25) then Key:=#0;
end;

procedure TFormOVofFlowLite.ListBoxEndSelectAdditiveClick(Sender: TObject);
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

procedure TFormOVofFlowLite.FormCreate(Sender: TObject);
begin
  // глобальный поток
  TotalFlowCompaunding:=TTotalFlowCompaunding.Create;
  // внутренний поток для служебных целей
  TotalFlowCompaundingInside:=TTotalFlowCompaunding.Create;
end;


procedure TFormOVofFlowLite.Copy1Click(Sender: TObject);
begin
  (Sender as TChart).CopyToClipboardBitmap;
end;

procedure TFormOVofFlowLite.BtSave2Click(Sender: TObject);
var
  i, CountObject: integer;
  MyIniFile: TIniFile;
  MyFlow: TFlowCompaunding;
begin

  if ListBoxEndSelectFlow.Items.Count=0 then
  begin
    ShowMessage('Необходимо загрузить поток');
    exit;
  end;

  SD1.Filter:='Состав потока (*.sfc)|*.sfc';
  SD1.DefaultExt:='sfc';
  if SD1.Execute then
  begin
    StatusBar1.SimpleText:='Идет сохранение данных...';
    with TotalFlowCompaunding do
    begin
      if pos('.sfc',SD1.FileName)>0 then
        SD1.FileName:=copy(SD1.FileName,1,pos('.sfc',SD1.FileName)-1);

      //MyFlow:=TFlowCompaunding.Create;
      MyFlow:=TotalFlowCompaunding.GetFlowOfName(
           ListBoxEndSelectFlow.Items.Strings[ListBoxEndSelectFlow.ItemIndex]);
      MyIniFile:=TIniFile.Create(SD1.FileName+'.sfc');
      CountObject:=Length(MyFlow.Components);
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

procedure TFormOVofFlowLite.StringGridStructureOfFlowSetEditText(
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

  // чтобы была только одна запятая
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
    // передаем через все элементы
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


procedure TFormOVofFlowLite.N2Click(Sender: TObject);
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

procedure TFormOVofFlowLite.N1Click(Sender: TObject);
var
  Comp: TComponentCompaunding;
  MyFlow: TFlowCompaunding;
begin
  Comp:= TComponentCompaunding.Create;

  MyFlow:=TotalFlowCompaunding.GetFlowOfName(
    ListBoxEndSelectFlow.Items.Strings[ListBoxEndSelectFlow.ItemIndex]);

  SecondForm.Label1.Caption:='Название элемента';
  SecondForm.EditResult.Text:='Новый элемент';
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.Name:=SecondForm.EditResult.Text;

  SecondForm.Label1.Caption:='Конц., % мас.';
  SecondForm.EditResult.Text:='0';
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.ConcentrComp:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='Коэффициент';
  SecondForm.EditResult.Text:='0';
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.CoefB:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='ОЧ по ММ';
  SecondForm.EditResult.Text:='0';
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.MotON:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='ОЧ по ИМ';
  SecondForm.EditResult.Text:='0';
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.ResON:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='Ограничение конц., % мас.';
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

  SecondForm.Label1.Caption:='DNP_С';
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

procedure TFormOVofFlowLite.N3Click(Sender: TObject);
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

  SecondForm.Label1.Caption:='Название элемента';
  SecondForm.EditResult.Text:=Comp.Name;
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.Name:=SecondForm.EditResult.Text;

  SecondForm.Label1.Caption:='Конц., % мас.';
  SecondForm.EditResult.Text:=FloatToStr(Comp.ConcentrComp);
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.ConcentrComp:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='Коэффициент';
  SecondForm.EditResult.Text:=FloatToStr(Comp.CoefB);;
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.CoefB:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='ОЧ по ММ';
  SecondForm.EditResult.Text:=FloatToStr(Comp.MotON);;
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.MotON:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='ОЧ по ИМ';
  SecondForm.EditResult.Text:=FloatToStr(Comp.ResON);;
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.ResON:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='Ограничение конц., % мас.';
  SecondForm.EditResult.Text:=FloatToStr(Comp.limit);;
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.limit:=StrToFloat(SecondForm.EditResult.Text);

  {SecondForm.Label1.Caption:='Ro20';
  SecondForm.EditResult.Text:=FloatToStr(Comp.Ro20);;
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.Ro20:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='TemKip';
  SecondForm.EditResult.Text:=FloatToStr(Comp.TemKip);;
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.TemKip:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='DNP_A';
  SecondForm.EditResult.Text:=FloatToStr(Comp.DNP_A);;
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.DNP_A:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='DNP_B';
  SecondForm.EditResult.Text:=FloatToStr(Comp.DNP_B);;
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.DNP_B:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='DNP_C';
  SecondForm.EditResult.Text:=FloatToStr(Comp.DNP_C);;
  if SecondForm.ShowModal<>mrOk then exit;
  Comp.DNP_C:=StrToFloat(SecondForm.EditResult.Text);

  SecondForm.Label1.Caption:='MolarMass';
  SecondForm.EditResult.Text:=FloatToStr(Comp.MolarMass);;
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

procedure TFormOVofFlowLite.BitBtn3Click(Sender: TObject);
var
  CountObject: integer;
  MyIniFile: TIniFile;
  MyAdditives: TAdditiveCompaunding;
begin

  if ListBoxAllAdditive.Items.Count=0 then
  begin
    ShowMessage('Необходимо загрузить присадку');
    exit;
  end;

  SD1.Filter:='Присадки (*.add)|*.add';
  SD1.DefaultExt:='add';
  if SD1.Execute then
  begin
    StatusBar1.SimpleText:='Идет сохранение данных...';

    if pos('.add',SD1.FileName)>0 then
      SD1.FileName:=copy(SD1.FileName,1,pos('.add',SD1.FileName)-1);

    MyAdditives:=TAdditiveCompaunding.Create;
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

procedure TFormOVofFlowLite.MenuItem2Click(Sender: TObject);
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

procedure TFormOVofFlowLite.Button2Click(Sender: TObject);

{  BtSave2.PopupMenu.Popup(Left+Panel16.Left+BtSave2.Left,
    Top+160); }
var
  s: string;
  i, j: integer;

  f1:textFile;      //для сохранения результатов
  l: OleVariant;
begin

  s:='';
  for i:=0 to StringGridResult.RowCount-1 do
  begin
    for j:=0 to StringGridResult.ColCount-1 do
      begin
        s:=s+StringGridResult.Cells[j,i]+Char(VK_TAB);
      end;
    s:=s+#13;
  end;
  clipboard.AsText:=s;

   //кусочек для сохранения результатов в txt может оно и не надо... Nikotin
  begin
    
    l:=od1.FileName;
    assignFile(f1,l+'.txt');
    rewrite(f1);
     for i:=0 to StringGridResult.RowCount-1 do
       Writeln(f1,StringGridResult.Cells[0,i],'                  ', StringGridResult.Cells[1,i]);
       closefile(f1);
  end;

end;

procedure TFormOVofFlowLite.InBase1Click(Sender: TObject);

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
  StatusBar1.SimpleText:='Идет сохранение данных в базу...';
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

procedure TFormOVofFlowLite.GetTotalFlow(var TotalFlow: TTotalFlowCompaunding);
begin
  TotalFlow:=TotalFlowCompaunding;
end;

procedure TFormOVofFlowLite.EditTempFlowChange(Sender: TObject);
begin

  if EditExpendFlow.Text='' then exit;
  TotalFlowCompaunding.FlowTemp:=StrToFloat(EditExpendFlow.Text);

end;

procedure TFormOVofFlowLite.Button2Exit(Sender: TObject);
begin
  Button2.Visible:=false;
end;

procedure TFormOVofFlowLite.DefaultSetData;
var
  i: integer;
  R: TSearchRec;
begin
  CreateMessageDialog('Подождите, идет загрузка потоков..', mtInformation, []).Show;
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

  CreateMessageDialog('Подождите, идет загрузка потоков..', mtInformation, []).Close;

end;

procedure TFormOVofFlowLite.Button3Click(Sender: TObject);
var
  MyIniFile: TIniFile;
  i: integer;
  Soot: double;
begin
  if OD2.Execute then
  begin
    MyIniFile:=TIniFile.Create(OD2.FileName);
    for i:=0 to ListBoxEndSelectFlow.Items.Count-1 do
    begin
      soot:=MyIniFile.ReadFloat('Flows', TotalFlowCompaunding.Flows[i].Name, 0);
      TotalFlowCompaunding.Flows[i].Expenditure:=soot;
    end;
    ListBoxEndSelectFlow.ItemIndex:=-1;

  end;
end;

procedure TFormOVofFlowLite.BitBtnRVSClick(Sender: TObject);
begin
  if FRezervuar.ShowModal=mrOk then
  begin
    _ParamRezerv.SetToTotalComp(TotalFlowCompaunding);
    // ввести передачу значений в потоки из _RVS: TRezervuars
  end;

end;

procedure TFormOVofFlowLite.EdPriceChange(Sender: TObject);
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

procedure TFormOVofFlowLite.EdPriceKeyPress(Sender: TObject; var Key: Char);
begin
  if (not (Key in ['0'..'9', DecimalSeparator, char(8), char(#13)]))
    and (ord(Key)>25) then Key:=#0;
end;

procedure TFormOVofFlowLite.Button4Click(Sender: TObject);
var
  i, j: integer;
begin
  EA1.Connect;
  EA1.Workbooks.Add(EmptyParam, 0);
  for j := 0 to Length(TotalFlowCompaunding.Flows[i].Components)-1 do
  begin
    EA1.Cells.Item[1+j,4]:=TotalFlowCompaunding.Flows[i].Components[j].Name;
  end;
  for i:=0 to Length(TotalFlowCompaunding.Flows)-1 do
  begin
    EA1.Cells.Item[i+1,1]:= TotalFlowCompaunding.Flows[i].FlowOctaneValue;
    EA1.Cells.Item[i+1,2]:= TotalFlowCompaunding.Flows[i]._Bsum;
    EA1.Cells.Item[i+1,3]:= TotalFlowCompaunding.Flows[i].Name;
    
    for j := 0 to Length(TotalFlowCompaunding.Flows[i].Components)-1 do
    begin
      EA1.Cells.Item[1+j,5+i]:=TotalFlowCompaunding.Flows[i].Components[j].ConcentrComp;
    end;

  end;
  EA1.Visible[0]:=true;
end;

end.



