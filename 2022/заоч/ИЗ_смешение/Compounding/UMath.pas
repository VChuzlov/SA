unit UMath;

interface

uses
  Math, Dialogs, Controls, StdCtrls, IniFiles, Forms, Classes, ExcelXP, ActiveX,
  Variants, Grids;
type
  TArrOfDouble = array of double;
  TArrOfArrOfDouble = array of TArrOfDouble;
  TArrDouble= array of double;
  TArrStr= array of string;

  TBigParam = record
    Ar: double;  // Ароматика
    B: double;   //  Бензол
    Ol: double;  //Олефины
    S: double;   //Сера
  end;
  TIndivComponent = class
     Concentr: double;
     Name: String;
     NameIndiv: array of string;
     procedure Assign(var IndivComp: TIndivComponent);
  end;

  TGpuppeComponent = class
     Concentr: double;
     Name: String;
     NameComp: array of string;
     procedure Assign(var GpuppeComp: TGpuppeComponent);
  end;

  TIUnknowComponent = class
     Concentr: double;
     Name: String;
     procedure Assign(var IUnknowComp: TIUnknowComponent);
  end;

  TArrIndivComponent = class
     Component: array of TIndivComponent;
     function ExistInIndiv(NameComponent: string): TIndivComponent;

  end;

  TArrGpuppeComponent = class
     Gruppe: array of TGpuppeComponent;
     function ExistInGruppe(NameComponent: string): TGpuppeComponent;
  end;

  TArrIUnknowComponent = class
     Component: array of TIUnknowComponent;

  end;

  TOlefin = class
     ArrIndiv: TArrIndivComponent;
     ArrGpuppe: TArrGpuppeComponent;
     ArrIUnknow: TArrIUnknowComponent;

     procedure Assign(var Olef: TOlefin);
     procedure AddGruppeComponent(NameGr: string);
     procedure AddGruppeCompComponent(NameGr: string; NameComp: string);
     procedure AddIndivComponent(NameIndiv: string);
     procedure AddIndivCompComponent(NameIndiv: string; NameComp: string);
     procedure AddIUnknowComponent(NameIUnknow: string; Concentr: double);
     procedure DelIUnknowComponent(NameIUnknow: string);
     function CalcSum: double;
     function CalcSumAll: double;
     procedure RaspredComponent;
     procedure IUnknowToIknow;
     procedure InitializeOlefin;
     procedure DeInitializeOlefin;
  end;

  TComponentCompaunding = class
      Name: string;
      ConcentrComp: double;// концентрация
      ConcentrCompMol: double;// мольная концентрация
      ConcentrCompVol: double;// объемная концентрация

      MolarMass: double; // молярная масса
      OctaneValue: double; // октановое число
      CoefB: double;       // коэффициент отклонения от аддитивности
      MotON: double;       // октановое число моторным методом
      ResON: double;       // октановое число исследовательским методом
      limit: double;       // ограничение содержания компонента по госту

      // добавлено от Фан-Фу

      Ro20: double;       // плотность
      TemKip: double;       // температура кипения
      DNP_A, DNP_B, DNP_C: double;       // коэффициенты по ДНП
      FT0, FT, P: double; // давление?
      lambda, Ro1T, Ro2T: double; // плотность?
      Ro15, K, M1, E, M2: double; //
      // добавлено от Кхань
      MuA, MuB: double;

      function GetDNPIndex(T: double; IndBool: boolean = true): double; // ДНП компонента
      procedure Calc_P_FT0_FT(T: double); // давление компонента
      procedure Calc_lambda_Ro1T_Ro2T(T: double); // плотность компонента
      procedure Calc_Ro15_K_M1_E_M2; // плотность компонента
      function GetRoT(T: double): double;
      function GetMuT(T: double): double;
      procedure Assign(var Comp: TComponentCompaunding);
  end;
  TArrComponentCompaunding= array of TComponentCompaunding;
  ArrOVclass = class
      arrOV: array of TArrOfDouble;
      Components: array of TArrComponentCompaunding;
  end;
  TAdditiveCompaunding = class
      Name: string;
      P: double; // приемистость присадки
      deltaOVmax: double; // максимальное увеличение октанового числа
      Keff: double; // константа эффективности
      CmaxAdditive: double;// максимальная концентрация присадки
      ConcentrAdditive: double; // концентрация присадки
      FirstConcentrAdditive: double; // начальная концентрация присадки
      LastConcentrAdditive: double; // конечная концентрация присадки
      StepConcentrAdditive: double; // шаг по концентрации присадки
      ChangeConcentrAdditive: boolean; // изменяется концентрация или нет
      procedure Assign(var AddComp: TAdditiveCompaunding);
  end;

  TSOAPParamQDIS = record
    DocRef: string;   //для запроса из QDIS
    NSt: string;      //для запроса из QDIS
    Test: string;    //для запроса из QDIS
    Value: string;
  end;
  TSOAPParamPI = record
    Datch: string;   // для запроса из PI
    Value: string;
  end;

  TSOAPFlowQDIS = class
    Name : string;       // названия потоков
    ParamsQDIS : array of TSOAPParamQDIS;

  end;
  TSOAPFlowPI = class
    Name : string;       // название эдитов
    ParamsPI : array of TSOAPParamPI;

  end;

  TSOAPData = class
    ObjectQDIS : array of TSOAPFlowQDIS;
    ObjectPI : array of TSOAPFlowPI;

    function GetData(_Date: TDateTime): boolean;

  end;

  TFlowCompaunding = class
      Name: string;
      BigParam: TBigParam;
      SelfOV: double;  // собственное октановое число
      Bsumar: double;  // собственная неаддитивная величина
      Components: TArrComponentCompaunding; // компоненты
      ExpenditureOfDay: double;// расход на одни сутки используем из PIMS
      Expenditure: double;// расход
      ExistExpenditure: double;// имеющийся расход в начале
      ExistExpenditure2: double;// имеющийся расход по условиям
      Price: double;            // стоимость потока
      NameOfCondition: string;  // название по условию от Никиты
      IndexOfCondition: integer;  // индекс по условию от Никиты
      VidDolej: integer; // Вид долей массовые -0, объемные -1
      _Bsum: double;  // суммарная неадитивность для собственных  нужд
      procedure SetBigParam; // собрать укрупненые параметры
      procedure RasprBigParam;  // распределение укрупненных параметров
      procedure CalcMasOfVolConz(T: double); // пересчет из объемных в массовые
      procedure CalcVolOfMassConz(T: double); // пересчет

      function FlowOctaneValue(T: double = 38): double;// октановое число
      function GetCompIndexOfName(CompName: string): integer; // индекс компонента от имени
      function GetCompOfName(CompName: string): TComponentCompaunding; // компонент от имени
      procedure AddComponent(Comp:TComponentCompaunding); // добавить компонент
      procedure DelComponent(CompIndex: integer);         // удалить компонент
      procedure Prov100(_YesToNorm: boolean = false; IsklComp: TArrStr = nil);
      function GetDNP(DNPComponents: TArrComponentCompaunding; T: double; IndBool: boolean = true): double;
      function GetRoT(RoComponents: TArrComponentCompaunding; T: double): double;
      function GetMuT(MuComponents: TArrComponentCompaunding; T: double): double;
      procedure Assign(var _Flow: TFlowCompaunding);
      procedure AddFlow(_AFlow:TFlowCompaunding); // добавить поток
  end;

  TPravilo = class
      Name: string;
      Pravilo: string;
      procedure Assign(var Prav: TPravilo);
  end;
  TTotalFlowPravila = class
      Pravila: array of TPravilo;

      function Execute(Components: TArrComponentCompaunding; FlowTemp: double{температура потока}): boolean;
      function GetPraviloOfName(Name: string): TPravilo;
      procedure DelPravilo (ind: integer);
      function GetPraviloIndexOfName(Name: string): integer;
  end;

  TCondition = class
     Name: string;
     OV: double;
     restrictions: TArrOfDouble;
     procedure Assign(var _Cond: TCondition);
  end;

  TArrConditions = class
     Name: string;
     Conditions: array of TCondition;
     StringList: array of TStrings;
     function GetConditionOfName(FindName: string): TCondition;
     procedure AddCondition(Cond: TCondition);
     function CreateCondition(_Name: string; _OV: double; _restrictions: TArrOfDouble): TCondition;
     procedure DelCondition(DelName: string);
     procedure AddRatio(Conzen: TArrOfDouble);
     procedure SaveRatioToFile(_Path: string);
     procedure Assign(var ArrCond: TArrConditions);
  end;

  TRatioParam = class
     {1	Бензин г/о БКК
2	Бензин КТ-1/1
3	Бенз. риф 35-11/1000
4	 См. бенз. 35/11-600 и с.100
5	Тол-ный концентрат
6	Изомеризат
7	Смесь изопентана
8	Алкилбензин
9	МТБЭ
10,11,12	См. бенз. прям.
     }

     Net_R600: boolean;
     Net_Toluol: boolean;
     Net_Butan: boolean;


     // 92
     FlowRatio92: array[1..13] of double;// = (31.56, 12.60, 21.68, 6.23, 0, 7.26, 9.07, 5.4, 0, 2.1, 2.1, 2.0);

     Lim_92_Sum_KT_GOBKK_max: double;
     Lim_92_Sum_KT_GOBKK_min: double;
     Lim_92_Del_KT_GOBKK_max: double;
     Lim_92_Del_KT_GOBKK_min: double;

     Curr_92_Sum_KT_GOBKK: double;
     Curr_92_Del_KT_GOBKK: double;

     H_92_Sum_KT_GOBKK: double;
     H_92_Del_KT_GOBKK: double;

     Lim_92_Sum_R600_R1000_max: double;
     Lim_92_Sum_R600_R1000_min: double;
     Lim_92_Del_R600_R1000_max: double;
     Lim_92_Del_R600_R1000_min: double;

     Curr_92_Sum_R600_R1000: double;
     Curr_92_Del_R600_R1000: double;

     H_92_Sum_R600_R1000: double;
     H_92_Del_R600_R1000: double;


     Lim_92_Toluol_max: double;
     Lim_92_Toluol_min: double;
     H_92_Toluol: double;

     Lim_92_Isomer_max: double;
     Lim_92_Isomer_min: double;
     H_92_Isomer: double;

     Lim_92_IsoPen_max: double;
     Lim_92_IsoPen_min: double;
     H_92_IsoPen: double;
     Ind_92_Isomer_IsoPen: integer;

     Lim_92_Alkil_max: double;
     Lim_92_Alkil_min: double;
     H_92_Alkil: double;

     Lim_92_MTBE_max: double;
     Lim_92_MTBE_min: double;
     H_92_MTBE: double;


     Lim_92_Prjam_max: double;
     Lim_92_Prjam_min: double;

     Curr_92_Del_n_but_IsoPen: double;

     // 95
     FlowRatio95: array[1..13] of double;// = (31.56, 12.60, 21.68, 6.23, 0, 7.26, 9.07, 5.4, 0, 2.1, 2.1, 2.0);

     Lim_95_Sum_KT_GOBKK_max: double;
     Lim_95_Sum_KT_GOBKK_min: double;
     Lim_95_Del_KT_GOBKK_max: double;
     Lim_95_Del_KT_GOBKK_min: double;

     Curr_95_Sum_KT_GOBKK: double;
     Curr_95_Del_KT_GOBKK: double;

     H_95_Sum_KT_GOBKK: double;
     H_95_Del_KT_GOBKK: double;

     Lim_95_Sum_R600_R1000_max: double;
     Lim_95_Sum_R600_R1000_min: double;
     Lim_95_Del_R600_R1000_max: double;
     Lim_95_Del_R600_R1000_min: double;

     Curr_95_Sum_R600_R1000: double;
     Curr_95_Del_R600_R1000: double;

     H_95_Sum_R600_R1000: double;
     H_95_Del_R600_R1000: double;


     Lim_95_Toluol_max: double;
     Lim_95_Toluol_min: double;
     H_95_Toluol: double;

     Lim_95_Isomer_max: double;
     Lim_95_Isomer_min: double;
     H_95_Isomer: double;

     Lim_95_IsoPen_max: double;
     Lim_95_IsoPen_min: double;
     H_95_IsoPen: double;
     Ind_95_Isomer_IsoPen: integer;

     Lim_95_Alkil_max: double;
     Lim_95_Alkil_min: double;
     H_95_Alkil: double;

     Lim_95_MTBE_max: double;
     Lim_95_MTBE_min: double;
     H_95_MTBE: double;
     Ind_95_Alkil_MTBE: integer;


     Lim_95_Prjam_max: double;
     Lim_95_Prjam_min: double;

     Curr_95_Del_n_but_IsoPen: double;

     // 98
     FlowRatio98: array[1..13] of double;// = (31.56, 12.60, 21.68, 6.23, 0, 7.26, 9.07, 5.4, 0, 2.1, 2.1, 2.0);

     Lim_98_KT_max: double;
     Lim_98_KT_min: double;
     H_98_KT: double;

     Lim_98_GOBKK_max: double;
     Lim_98_GOBKK_min: double;


     H_98_GOBKK: double;

     Lim_98_Sum_KT_GOBKK_max: double;
     Lim_98_Sum_KT_GOBKK_min: double;

     Curr_98_Sum_KT_GOBKK: double;
     H_98_Sum_KT_GOBKK: double;

     Lim_98_Del_KT_GOBKK_max: double;
     Lim_98_Del_KT_GOBKK_min: double;
     Curr_98_Del_KT_GOBKK: double;

     Lim_98_Sum_R600_R1000_max: double;
     Lim_98_Sum_R600_R1000_min: double;
     Lim_98_Del_R600_R1000_max: double;
     Lim_98_Del_R600_R1000_min: double;
     H_98_R600: double;

     Curr_98_Sum_R600_R1000: double;
     Curr_98_Del_R600_R1000: double;

     H_98_Sum_R600_R1000: double;
     H_98_Del_R600_R1000: double;


     Lim_98_Toluol_max: double;
     Lim_98_Toluol_min: double;
     H_98_Toluol: double;

     Lim_98_Isomer_max: double;
     Lim_98_Isomer_min: double;
     H_98_Isomer: double;

     Lim_98_IsoPen_max: double;
     Lim_98_IsoPen_min: double;
     H_98_IsoPen: double;
     Ind_98_Isomer_IsoPen: integer;

     Lim_98_Alkil_max: double;
     Lim_98_Alkil_min: double;
     H_98_Alkil: double;

     Lim_98_MTBE_max: double;
     Lim_98_MTBE_min: double;
     H_98_MTBE: double;

     Curr_98_Del_n_but_IsoPen: double;

     // 80
     FlowRatio80: array[1..13] of double;

     Lim_80_R600_min: double;
     Lim_80_KT_max: double;
     Lim_80_KT_min: double;

     Lim_80_Prjam_max: double;
     Lim_80_Prjam_min: double;

     H_80_R600: double;
     H_80_Isomer: double;
     H_80_IsoPen: double;

     Ind_80_KT_Prjam_R600: integer;
     Ind_80_KT_Prjam_Isomer: integer;
     Ind_80_KT_Prjam_IsoPen: integer;

     Lim_80_Isomer_min: double;
     Lim_80_Isomer_max: double;
     Lim_80_IsoPen_min: double;
     Lim_80_IsoPen_max: double;

     H_80_KT: double;

     Curr_80_Del_n_but_IsoPen: double;
     //92
     Procedure InitializationParam;
     procedure RecalcParam_92;
     function Step_92_Sum_KT_GOBKK_Plus: boolean;
     function Step_92_Sum_KT_GOBKK_Minus: boolean;
     function Step_92_Del_KT_GOBKK_Plus: boolean;
     function Step_92_Del_KT_GOBKK_Minus: boolean;

     function Step_92_Sum_R600_R1000_Plus: boolean;
     function Step_92_Sum_R600_R1000_Minus: boolean;
     function Step_92_Del_R600_R1000_Plus: boolean;
     function Step_92_Del_R600_R1000_Minus: boolean;

     function Step_92_Sum_Isomer_IsoPen_Plus: boolean;
     function Step_92_Sum_Isomer_IsoPen_Minus: boolean;

     function Step_92_Sum_Alkil_Plus: boolean;
     function Step_92_Sum_Alkil_Minus: boolean;

     function Step_92_Sum_Toluol_Plus: boolean;
     function Step_92_Sum_Toluol_Minus: boolean;

     function Step_92_Sum_MTBE_Plus: boolean;
     function Step_92_Sum_MTBE_Minus: boolean;

     //95

     procedure RecalcParam_95;
     function Step_95_Sum_KT_GOBKK_Plus: boolean;
     function Step_95_Sum_KT_GOBKK_Minus: boolean;
     function Step_95_Del_KT_GOBKK_Plus: boolean;
     function Step_95_Del_KT_GOBKK_Minus: boolean;

     function Step_95_Sum_R600_R1000_Plus: boolean;
     function Step_95_Sum_R600_R1000_Minus: boolean;
     function Step_95_Del_R600_R1000_Plus: boolean;
     function Step_95_Del_R600_R1000_Minus: boolean;

     function Step_95_Sum_Isomer_IsoPen_Plus: boolean;
     function Step_95_Sum_Isomer_IsoPen_Minus: boolean;

     function Step_95_Sum_Alkil_MTBE_Plus: boolean;
     function Step_95_Sum_Alkil_MTBE_Minus: boolean;

     function Step_95_Sum_Toluol_Plus: boolean;
     function Step_95_Sum_Toluol_Minus: boolean;

     // 98
     procedure RecalcParam_98;
     function Step_98_KT_Plus: boolean;
     function Step_98_R600_Plus: boolean;
     function Step_98_R1000_Plus: boolean;

     function Step_98_Sum_R600_R1000_Minus: boolean;

     function Step_98_Sum_Toluol_Minus: boolean;
     function Step_98_GOBKK_Minus: boolean;

     function Step_98_MTBE_Plus: boolean;
     function Step_98_MTBE_Minus: boolean;

     //80
     procedure SetFlowRatio80(Fl_GOBKK, Fl_KT, Fl_R600, Fl_Isomer, Fl_IsoPen, Fl_Prjam1, Fl_Prjam2, Fl_Prjam3: TFlowCompaunding);
     function Step_80_KT_Prjam_Minus: boolean;

     function Step_80_Sum_Isomer_Minus: boolean;
     function Step_80_Sum_Isomer_Plus: boolean;

     function Step_80_Sum_IsoPen_Minus: boolean;
     function Step_80_Sum_IsoPen_Plus: boolean;
     function Step_80_KT_Minus: boolean;
     function Step_80_KT_Plus: boolean;

     procedure Assign(var RP: TRatioParam);
  end;

  TTotalFlowCompaunding = class
      Name: string;
      Components: TArrComponentCompaunding; // компоненты
      Expenditure: double;// расход
      Flows: array of TFlowCompaunding;  // потоки
      Additives: array of TAdditiveCompaunding; // присадки
      NeedOV: double;     // нужное октановое число
      TotalFlowPravila: TTotalFlowPravila;
      FlowTemp: double; // температура потока
      Olefin: TOlefin;

      ArrConditions: TArrConditions;
      RatioParam: TRatioParam;   //для осуществления подбора Долганов
      _StringGridResult: TStringGrid;      //для PIMS
      _SG1Itog: TStringGrid;  //для PIMS
      TotalPribl: double;  //общая прибыль
      function TotalFlowOctaneValue(boolResON: boolean = true;
        SelfOVBsum: boolean = false): double; // октановое число
      function RatioFlows: TArrOfDouble; // соотношение потоков
      function GetFlowOfName(FlowName: string): TFlowCompaunding;
      function GetFlowIndexOfName(FlowName: string): integer;
      function GetAdditivesOfName(AdditivesName: string): TAdditiveCompaunding;
      procedure DelFlow(FlowIndex: integer);
      function ExistComp(Comp: TComponentCompaunding): boolean;
      function ExistFlow(_Flow:TFlowCompaunding): boolean;
      procedure AddComponent(Comp:TComponentCompaunding);
      procedure AddFlow(_Flow:TFlowCompaunding);
      function OVOfRatio(Ratio: TArrOfDouble): double;
      function GetCompOfName(CompName: string): TComponentCompaunding; // компонент от имени
      procedure CalcMolConz(T: double); // пересчет
      procedure CalcVolOfMassConz(T: double); // пересчет

      procedure LoadFromSFC(PathSFC: string; var ListBoxAllFlow: TListBox;
             IndBaseOrFile: integer);
      procedure LoadFromSK(PathSK: string; var ListBoxAllFlow: TListBox; IndRif, IndBase: integer);
      procedure ClearFlow;
      procedure DownLoadSir(PathExcel: string; Memo1: TMemo;
         Ea1: TExcelApplication);
      procedure SravSk(Memo1, Memo2: TMemo);
      procedure WriteToSkEN(Memo1: TMemo);

      procedure Assign(var TC: TTotalFlowCompaunding);
      procedure CreateGrid(SG1, SG2: TStringGrid);

      procedure CalcOfRatios(Conzen: TArrOfDouble);
      procedure ConvertToFlow(var Flow:TFlowCompaunding; NameStr:string);
      function GetFlowOfIndexOfCondition(Index: integer): TFlowCompaunding;
      procedure FlowRatioCalculation(var StringGridResult, SG1Itog:TStringGrid);
      function  GetConcParaf: double;
      function  GetConcIzoParaf_6: double;
      function  GetConcIzoParaf_8: double;
      function  GetConcNaft: double;
      function  GetConcArom: double;
      function  GetConcOlef: double;
      function  GetConcBenzol: double;
      function  GetConcI_Pent: double;
      function  GetConcToluol: double;
      function  GetConcSera: double;
      function  GetConcMTBE: double;
      function  GetDNP(IndBool: boolean=true): double;
      function CalcPribl(Kol92, Kol95, Kol98, Kol80: double; Cena92, Cena95, Cena98, Cena80: double;
      _RatPar:TRatioParam): double;
      function CalcSebestoim: double;

  end;
  TArrTotalFlowCompaunding= class
     Items: array of TTotalFlowCompaunding;
     procedure AddItem(TC: TTotalFlowCompaunding);
  end;  // для работы с PIMS
  TBenzDay=class      // расход бензина на каждый день
     NameDay: string;
     ExpenditureDay: double;
     SetUser: boolean;    //задано пользователем true, системой - false
  end;
  TBenzCompPlan=class   // бензин на каждый день с необходимым расходом (строка в таблице)
    Name: string;
    NeedExpenditure: double;
    ArrBenzDay: array of TBenzDay;
    Rezept: TArrOfDouble;
    function GetRashSetUser: double;   //взять расходы не заданные пользователем
  end;
  TCompPlan=class                  //расходы на все дни с расходом компонентов
    ArrBenzCompPlan: array of TBenzCompPlan;   //
    RashComp:TArrOfDouble;            //сколько всего компонентов за все время
    RashCompDay:TArrOfDouble;            //сколько дополнительно компонентов за день
    RashCompOstatki:TArrOfArrOfDouble;            //сколько остатков на каждый день
    function Execute(_ArrTotal: TArrTotalFlowCompaunding): double; //выполнить расчет
    function HvatitLiRash: boolean;  //хватит ли расхода компонентов на бензины
    procedure CalcExpenditureBenz(CountDay: integer); //расчет расходов на все дни
    procedure CalcExpenditureBenzDay(IndDay: integer);  //расчитать расходы на заданный день
    function GetMRBOfDay(IndBenz, IndDay: integer; MRB: double): double; //расчет расхода, который свободный
    procedure Initialize(_ArrTotal: TArrTotalFlowCompaunding); // инициализация
  end;



const
   Index_Sir_Riforming=1;
   Index_Kat_Riforming=2;
   Index_Base_File=0;
   Index_Base_Ini=1;
   Index_Base_Access=2;

implementation

uses Types, SysUtils, UDM, UMyDB1, UMyDB3, UMyDB4, UMyDB2,
  UMainCompaunding, UFlowOfVO, UFlowOfVOLite, USOAP;

function TTotalFlowCompaunding.RatioFlows: TArrOfDouble;

  procedure IncArrOV(var arrOV: array of TArrOfDouble;
  ind: integer; myarr: TArrOfDouble);
  var
    j: integer;
  begin
    {тут все совсем интересно, я создаю массив соотношений для
    потоков}
    myarr[0]:=myarr[0]+1;
    for j:=0 to length(myarr)-2 do
    begin
      if (myarr[j]=10) and (j<length(myarr)) then
      begin
        myarr[j]:=0;
        myarr[j+1]:=myarr[j+1]+1;
      end;
    end;
    for j:=0 to length(myarr)-2 do
    begin
      arrOV[ind][j]:=myarr[j];
    end;

    if ind<length(arrOV)-1 then
      IncArrOV(arrOV, ind+1, myarr);

  end;

  function CheckLimit(Components: TArrComponentCompaunding; FlowTemp: double): boolean;
  var
    i: integer;
  begin
    result:=true;
    for i:=0 to length(Components)-1 do
    begin
      // 0 - ограничений нет
      if Components[i].limit=0 then continue;
      // надо проверять
      if Components[i].ConcentrComp>Components[i].limit then
      begin
        result:=false;
        break;
      end;
    end;
    if not TotalFlowPravila.Execute(Components, FlowTemp) then
      result:=false;
  end;
var
  i, j: integer;
  arrOVComp: ArrOVclass;
  myarr: TArrOfDouble;
  myarrIN: array of TArrOfDouble;
begin
  arrOVComp:=ArrOVclass.Create;
  {думаю, что надо искать по соотношениям
  от 0 до 9 частей для каждого потока}
  Result:=nil;
  if Length(Flows)=0 then exit;
  SetLength(Result, Length(Flows)+1);// 1 - т.к. еще ОЧ
  SetLength(myarr, Length(Flows)+1);
  // массив из возможных вариантов соотношений потоков и ОЧ
  SetLength(arrOVComp.arrOV, trunc(power(10, Length(Flows))), Length(Flows)+1);
  SetLength(arrOVComp.Components, Length(arrOVComp.arrOV));
  for i:=0 to Length(myarr)-1 do
    myarr[i]:=0;

  {забиваем возможными соотношениями}
  IncArrOV(arrOVComp.arrOV, 0, myarr);

  for i:=0 to length(arrOVComp.arrOV)-1 do
  begin
    {можно поменять на
    OVOfRatio(arrOV[i]); но необязательно}

    for j:=0 to length(Flows)-1 do
    begin
      Flows[j].Expenditure:=arrOVComp.arrOV[i][j];
    end;
    {расчитываем возможные соотношения}
    arrOVComp.arrOV[i][length(arrOVComp.arrOV[i])-1]:=TotalFlowOctaneValue;
    arrOVComp.Components[i]:=Components;
  end;
  {теперь выбираем наиболее подходящее
  по ограничениям, а потом проверяем на ближее}

  if FlowTemp<1 then FlowTemp:=293;

  for i:=0 to length(arrOVComp.arrOV)-1 do
  begin
    if CheckLimit(arrOVComp.Components[i], FlowTemp) then
    begin
      SetLength(myarrIN, Length(myarrIN)+1);
      myarrIN[Length(myarrIN)-1]:=arrOVComp.arrOV[i];
    end;
  end;

  if length(myarrIN)=0 then
  begin
    ShowMessage('Смягчите, пожалуйста, условия. Ни один вариант не подходит.');
    exit;
  end;
  myarr:=myarrIN[0];
  for i:=0 to length(myarrIN)-1 do
  begin
    if (abs(myarr[length(myarr)-1]-NeedOV)/NeedOV>
       abs(myarrIN[i][length(myarrIN[i])-1]-NeedOV)/NeedOV)    
    then
    begin
      myarr:=myarrIN[i];
    end;
  end;
  // нужно, чтобы итоговый состав расчитался, а не был просто последний расчитанный
  OVOfRatio(myarr);
  
  result:=myarr;
end;

function TTotalFlowCompaunding.GetAdditivesOfName(AdditivesName: string): TAdditiveCompaunding;
var
  i: integer;
begin
  result:=nil;
  for i:=0 to length(Additives)-1 do
  begin
    if Additives[i]=nil then exit;
    if Additives[i].Name=AdditivesName then
    begin
      result:=Additives[i];
      exit;
    end;
  end;
end;

function TTotalFlowCompaunding.GetFlowOfName(FlowName: string): TFlowCompaunding;
var
  i: integer;
begin
  result:=nil;
  for i:=0 to length(Flows)-1 do
  begin
    if Flows[i]=nil then exit;
    if Flows[i].Name=FlowName then
    begin
      result:=Flows[i];
      exit;
    end;
  end;
end;

function TFlowCompaunding.GetCompOfName(CompName: string): TComponentCompaunding;
var
  i: integer;
begin
  result:=nil;
  for i:=0 to length(Components)-1 do
  begin
    if Components[i]=nil then exit;
    if Components[i].Name=CompName then
    begin
      result:=Components[i];
      exit;
    end;
  end;
end;

function TFlowCompaunding.GetCompIndexOfName(CompName: string): integer;
var
  i: integer;
begin
  result:=-1;
  for i:=0 to length(Components)-1 do
  begin
    if Components[i]=nil then exit;
    if Components[i].Name=CompName then
    begin
      result:=i;
      exit;
    end;
  end;
end;

function TFlowCompaunding.FlowOctaneValue(T: double = 38): double;

function Kroneker(i,j:integer): integer;
  begin
    result:=1;
    if i=j then result:=0;
  end;

var
  i, j: integer;
  TotalOV: double;
  Bsum: double;
begin
  TotalOV:=0;
  // CoefB=сумм(i=0 to 67)сумм(j=i+1 to 68) Bi*Bj*Ci*Cj
  Bsum:=0;
  if VidDolej=1 then
  begin
    CalcMasOfVolConz(T);
  end;
  for i:=0 to Length(Components)-2 do
    for j:=i+1 to Length(Components)-1 do
      Bsum:=Bsum+Components[i].ConcentrComp*Components[i].CoefB*
                 Components[j].ConcentrComp*Components[j].CoefB/100*
                 Kroneker(i,j);
  _Bsum:=Bsum;
  // влияние компонентов
  for i:= 0 to Length(Components)-1 do
  begin
    with Components[i] do
      TotalOV:=TotalOV+ConcentrComp*OctaneValue/100;
      {ОЧсм=Ci*ОЧi}
  end;
  TotalOV:=TotalOV+Bsum;

  (*// влияние присадок
  for i:=0 to Length(Additives)-1 do
    with Additives[i] do
      TotalOV:= TotalOV+P*deltaOVmax*(1-exp(-Keff*ConcentrAdditive/CmaxAdditive));
      {ОЧсм=ОЧсм0+П*dОЧmax*(1-e(-Keff*Cпр))
      Спр=Сi/Cmax}
      *)
  result:=TotalOV;

end;

function TTotalFlowCompaunding.TotalFlowOctaneValue(boolResON: boolean = true;
   SelfOVBsum: boolean = false): double;

  function Kroneker(i,j:integer): integer;
  begin
    result:=1;
    if i=j then result:=0;
  end;

var
  i, j: integer;
  TotalOV: double;
  Bsum: double;
  flag: boolean;
  Sum: double;
begin
  for i:=0 to Length(Flows)-1 do
  begin
    if not(ArrConditions=nil) and (Length(ArrConditions.Conditions)=0) then
      Flows[i].Prov100;
  end;


  Expenditure:=0;
  flag:=false;
  for i:=0 to Length(Flows)-1 do
    Expenditure:=Expenditure+Flows[i].Expenditure;
  if Expenditure=0 then
  begin
    if not(ArrConditions=nil) and (Length(ArrConditions.Conditions)=0) then
    begin
      result:=0;
      exit;
    end
    else
    begin
      for i:=0 to Length(Flows)-1 do
      begin
        Flows[i].Expenditure:=1;
        Expenditure:=Expenditure+Flows[i].Expenditure;
      end;
      flag:=true;
    end;
  end;


  for j:=0 to Length(Components)-1 do
  begin
    Components[j].Destroy;
  end;
  //Components:=nil;

  SetLength(Components,0);

  for i:=0 to Length(Flows)-1 do
    for j:=0 to Length(Flows[i].Components)-1 do
      if not ExistComp(Flows[i].Components[j]) then
      begin
        SetLength(Components, Length(Components)+1);
        Components[Length(Components)-1]:=TComponentCompaunding.Create;
        Components[Length(Components)-1].Name:= Flows[i].Components[j].Name;
        if boolResON then
          Components[Length(Components)-1].OctaneValue:= Flows[i].Components[j].ResON
        else
          Components[Length(Components)-1].OctaneValue:= Flows[i].Components[j].MotON;

        Components[Length(Components)-1].CoefB:= Flows[i].Components[j].CoefB;
        Components[Length(Components)-1].limit:= Flows[i].Components[j].limit;
        Components[Length(Components)-1].Ro20:= Flows[i].Components[j].Ro20;
        Components[Length(Components)-1].TemKip:= Flows[i].Components[j].TemKip;
        Components[Length(Components)-1].DNP_A:= Flows[i].Components[j].DNP_A;
        Components[Length(Components)-1].DNP_B:= Flows[i].Components[j].DNP_B;
        Components[Length(Components)-1].DNP_C:= Flows[i].Components[j].DNP_C;
        Components[Length(Components)-1].MolarMass:= Flows[i].Components[j].MolarMass;
        Components[Length(Components)-1].MuA:= Flows[i].Components[j].MuA;  //ied
        Components[Length(Components)-1].MuB:= Flows[i].Components[j].MuB;
      end;
  // расчитываю массовые концентрации компонентов
  for i:=0 to Length(Flows)-1 do
  begin
    if Flows[i].VidDolej=1 then             // 29/03/2015
    begin
      Flows[i].CalcMasOfVolConz(FlowTemp);
    end;
    for j:=0 to Length(Components)-1 do
      if Flows[i].GetCompOfName(Components[j].Name)<>nil then
        Components[j].ConcentrComp:=Components[j].ConcentrComp+
          Flows[i].GetCompOfName(Components[j].Name).ConcentrComp*
                                      Flows[i].Expenditure/Expenditure;

  end;
  // расчитываю мольные концентрации компонентов
  CalcMolConz(FlowTemp);

  TotalOV:=0;
  // CoefB=сумм(i=0 to 67)сумм(j=i+1 to 68) Bi*Bj*Ci*Cj
  Bsum:=0;
  for i:=0 to Length(Components)-2 do
    for j:=i+1 to Length(Components)-1 do
      Bsum:=Bsum+Components[i].ConcentrComp*Components[i].CoefB*
                 Components[j].ConcentrComp*Components[j].CoefB/100*
                 Kroneker(i,j);

  // влияние компонентов
  for i:= 0 to Length(Components)-1 do
  begin
    with Components[i] do
      TotalOV:=TotalOV+ConcentrComp*OctaneValue/100;
      {ОЧсм=Ci*ОЧi}
  end;
  TotalOV:=TotalOV+Bsum;

  //если считать по собственным октановым числам
  if SelfOVBsum then
  begin
    TotalOV:=0;
    Sum:=0;
    for i:=0 to Length(Flows)-1 do
    begin
      TotalOV:=TotalOV+(Flows[i].SelfOV+Flows[i].Bsumar)*Flows[i].Expenditure;
      Sum:=Sum+Flows[i].Expenditure;
    end;
    TotalOV:=roundto(TotalOV/Sum, -2);

  end;

  // влияние присадок
  for i:=0 to Length(Additives)-1 do
    with Additives[i] do
      TotalOV:= TotalOV+P*deltaOVmax*(1-exp(-Keff*ConcentrAdditive/CmaxAdditive));
      {ОЧсм=ОЧсм0+П*dОЧmax*(1-e(-Keff*Cпр))
      Спр=Сi/Cmax}
  result:=TotalOV;

  if flag then
  begin
    for i:=0 to Length(Flows)-1 do
    begin
      Flows[i].Expenditure:=0;
      Expenditure:=Expenditure+Flows[i].Expenditure;
    end;
  end;

end;

procedure TFlowCompaunding.AddComponent(Comp: TComponentCompaunding);
begin

  SetLength(Components, Length(Components)+1);
  Components[Length(Components)-1]:=TComponentCompaunding.Create;
  Components[Length(Components)-1]:=Comp;
end;

procedure TFlowCompaunding.DelComponent(CompIndex: integer);
var
  i, j: integer;
  MyComponents: array of TComponentCompaunding;
begin
  if Length(Components)=1 then
  begin
    SetLength(Components, 0);
    exit;
  end;

  Components[CompIndex]:=nil;
  SetLength(MyComponents, Length(Components)-1);
  i:=0;
  j:=0;
  while i<=Length(Components)-2 do
  begin  
    if Components[i]<>nil then
    begin
      MyComponents[j]:=Components[i];
      j:=j+1;
    end;
    i:=i+1;
  end;

  SetLength(Components, Length(MyComponents));
  for i:=0 to Length(Components)-1 do
  begin
    Components[i]:=MyComponents[i];
  end;
end;

procedure TTotalFlowCompaunding.DelFlow(FlowIndex: integer);
var
  i, j: integer;
  MyFlows: array of TFlowCompaunding;
begin

  if Length(Flows)=1 then
  begin
    SetLength(Flows,0);
    exit;
  end;

  Flows[FlowIndex]:=nil;
  SetLength(MyFlows, Length(Flows)-1);
  i:=0;
  j:=0;
  while i<=Length(Flows)-1 do
  begin
    if Flows[i]<>nil then
    begin
      MyFlows[j]:=Flows[i];
      j:=j+1;
    end;
    i:=i+1;
  end;

  if Length(MyFlows)>0 then
  begin
    SetLength(Flows, Length(MyFlows));
    for i:=0 to Length(Flows)-1 do
    begin
      Flows[i]:=MyFlows[i];
    end;
  end;
end;

function TTotalFlowCompaunding.GetFlowIndexOfName(
  FlowName: string): integer;
var
  i: integer;
begin
  result:=-1;
  for i:=0 to length(Flows)-1 do
  begin
    if Flows[i]=nil then continue;
    if Flows[i].Name=FlowName then
    begin
      result:=i;
      exit;
    end;
  end;
end;

function TTotalFlowCompaunding.ExistComp(
  Comp: TComponentCompaunding): boolean;
var
  i:integer;
begin
  result:=false;
  for i:=0 to length(Components)-1 do
  begin
    if Comp.Name=Components[i].Name then
    begin
      result:=true;
      exit;
    end;
  end;
end;

procedure TTotalFlowCompaunding.AddComponent(Comp: TComponentCompaunding);
begin
  if not ExistComp(Comp) then
  begin
    SetLength(Components, Length(Components)+1);
    Components[Length(Components)-1]:=TComponentCompaunding.Create;
    Components[Length(Components)-1]:=Comp;
  end
  else
    ShowMessage('Такой элемент существует!');
end;

function TTotalFlowCompaunding.OVOfRatio(
  Ratio: TArrOfDouble): double;
var
  i: integer;
begin
  for i:=0 to length(Flows)-1 do
    Flows[i].Expenditure:=Ratio[i];

  Result:=TotalFlowOctaneValue;
end;

{ TTotalFlowPravila }

procedure TTotalFlowPravila.DelPravilo(ind: integer);
var
  i, j: integer;
  MyPravila: array of TPravilo;
begin

  if Length(Pravila)=1 then
  begin
    SetLength(Pravila, 0);
    exit;
  end;
  Pravila[ind]:=nil;

  SetLength(MyPravila, Length(Pravila)-1);
  i:=0;
  j:=0;
  while i<=Length(Pravila)-2 do
  begin
    if Pravila[i]<>nil then
    begin
      MyPravila[j]:=Pravila[i];
      j:=j+1;
    end;
    i:=i+1;
  end;

  if Length(MyPravila)>0 then
  begin
    SetLength(Pravila, Length(MyPravila));
    for i:=0 to Length(Pravila)-1 do
    begin
      Pravila[i]:=MyPravila[i];
    end;
  end;
end;

function TTotalFlowPravila.Execute(Components: TArrComponentCompaunding;
                  FlowTemp: double): boolean;

  procedure DelSpace(var Str:string);
  var
    i: integer;
  begin
    for i:=1 to length(str) do
      if str[i]=' ' then
        delete(str, i, 1);
  end;

  function IsFloat(Str:string): boolean;
  var
    i: integer;
  begin
    result:=true;
    for i:=1 to Length(str) do
      if not (str[i] in ['0'..'9', DecimalSeparator]) then
      begin
        result:=false;
        break;
      end;
  end;

var
  ArrStr: array of string;
  ArrChisla: array of double;
  Znaki: array of integer; {1-'+', 2-'-', 3-'*', 4-'/', 5-'='}
  i, ind, j, k, NumInd1, NumInd2, NumInd3: integer;
  pravo, levo: double;
  MyPravilo: string;
  MyFlow: TFlowCompaunding; // надо для общего днп
begin
  Result:= true;
  MyFlow:= TFlowCompaunding.Create;
  for k:=0 to length(Pravila)-1 do
  with Pravila[k] do
  begin
    //DelSpace(Pravilo);
    MyPravilo:=Pravilo;
    for j:=Length(Components)-1 downto 0 do
    begin
      NumInd1:=pos(''''+Components[j].Name+'''',MyPravilo);
      if NumInd1>0 then
      begin
        delete(MyPravilo, NumInd1, length(Components[j].Name)+2);
        insert(FloatToStr(Components[j].ConcentrComp),
                     MyPravilo, NumInd1);
      end;

      NumInd2:=pos(''''+'ДНП_'+Components[j].Name+'''',MyPravilo);
      if NumInd2>0 then
      begin
        delete(MyPravilo, NumInd2, length('ДНП_'+Components[j].Name)+2);
        insert(FloatToStr(Components[j].GetDNPIndex(FlowTemp)),
                     MyPravilo, NumInd2);
      end;

    end;
    {для общего давления }

    NumInd3:=pos(''''+'ДНП_Общ.'+'''',MyPravilo);
    if NumInd3>0 then
    begin
      delete(MyPravilo, NumInd3, length('ДНП_Общ.')+2);
      insert(FloatToStr(MyFlow.GetDNP(Components, FlowTemp)),
                   MyPravilo, NumInd3);
    end;

    ind:=1;
    for i:=1 to length(MyPravilo) do
    begin
      if (MyPravilo[i] in ['+','-','*','/','=','>','<'])
      then
      begin
        SetLength(ArrStr, Length(ArrStr)+1);
        SetLength(Znaki, Length(Znaki)+1);
        case MyPravilo[i] of
          '+':Znaki[Length(Znaki)-1]:=1;
          '-':Znaki[Length(Znaki)-1]:=2;
          //'*':Znaki[Length(Znaki)-1]:=3;
          //'/':Znaki[Length(Znaki)-1]:=4;
          '=':Znaki[Length(Znaki)-1]:=5;
          '>':Znaki[Length(Znaki)-1]:=6;
          '<':Znaki[Length(Znaki)-1]:=7;
        end;
        ArrStr[Length(ArrStr)-1]:=copy(MyPravilo,ind,i-1);
        ind:=i+1;
      end;
    end;
    SetLength(ArrStr, Length(ArrStr)+1);
    ArrStr[Length(ArrStr)-1]:=copy(MyPravilo,ind,length(MyPravilo));

    SetLength(ArrChisla, Length(ArrStr));

    for i:=0 to Length(ArrStr)-1 do
    begin
      ArrChisla[i]:=0;
      if IsFloat(ArrStr[i]) then ArrChisla[i]:=StrToFloat(ArrStr[i]);
    end;

    levo:=ArrChisla[0];
    pravo:=0;
    for i:=0 to Length(Znaki)-1 do
    begin
      if Znaki[i]<5 then
      begin
        case Znaki[i] of
          1:levo:=levo+ArrChisla[i+1];
          2:levo:=levo-ArrChisla[i+1];
          //3:levo:=levo*ArrChisla[i+1];
         // 4:levo:=levo/ArrChisla[i+1];
        end;
      end
      else
      begin
        pravo:=ArrChisla[i+1];
        for j:=i+1 to Length(Znaki)-1 do
        begin
          case Znaki[j] of
            1:pravo:=pravo+ArrChisla[j+1];
            2:pravo:=pravo-ArrChisla[j+1];
            //3:pravo:=pravo*ArrChisla[j+1];
            //4:pravo:=pravo/ArrChisla[j+1];
          end;
        end;
        break;
      end;
    end;

    for i:=0 to Length(Znaki)-1 do
      case Znaki[i] of
        5:begin
            if not(levo=pravo) then result:=false;
          end;
        6:begin
            if not(levo>pravo) then result:=false;
          end;
        7:begin
            if not(levo<pravo) then result:=false;
          end;
      end;
    
  end;
end;

function TTotalFlowPravila.GetPraviloIndexOfName(Name: string): integer;
var
  i: integer;
begin
  result:=-1;
  for i:=0 to length(Pravila)-1 do
  begin
    if Pravila[i]=nil then continue;
    if Pravila[i].Name=Name then
    begin
      result:=i;
      exit;
    end;
  end;
end;

function TTotalFlowPravila.GetPraviloOfName(Name: string): TPravilo;
var
  i:integer;

begin
  result:=nil;
  for i:=0 to length(Pravila)-1 do
  begin
    if Name=Pravila[i].Name then
    begin
      Result:=Pravila[i];
      break;
    end;
  end;
end;

procedure TTotalFlowCompaunding.AddFlow(_Flow: TFlowCompaunding);
begin
  if not ExistFlow(_Flow) then
  begin
    SetLength(Flows, Length(Flows)+1);
    Flows[Length(Flows)-1]:=TFlowCompaunding.Create;
    Flows[Length(Flows)-1]:=_Flow;
  end
  else
    ShowMessage('Такой поток существует!');
end;

function TTotalFlowCompaunding.ExistFlow(_Flow: TFlowCompaunding): boolean;
var
  i:integer;
begin
  result:=false;
  for i:=0 to length(Flows)-1 do
  begin
    if _Flow.Name=Flows[i].Name then
    begin
      result:=true;
      exit;
    end;
  end;
end;

{ TComponentCompaunding }

function TComponentCompaunding.GetDNPIndex(T: double; IndBool: boolean = true): double;
begin
  Result:=exp(DNP_A-DNP_B/(DNP_C+T+273))*0.1335;
  if IndBool then
    Result:=power(Result/6.8947, 1.25);
end;

procedure TComponentCompaunding.Calc_Ro15_K_M1_E_M2;
begin
  Ro15:=(0.994*Ro20+0.0093);
  K:=1.216*exp((1/3)*ln(TemKip))/Ro15;
  M1:= (7*K-21.5)+(0.76-0.04*K)*(TemKip-273)+((0.0003*K)-0.00242)*(TemKip-273)*(TemKip-273);
  E:= exp(3.1612+(1.3014*100/TemKip)+(0.0287*TemKip/100)-(2.3986*Ro20)+(1.0844*Ro20)*(ln(TemKip/100)));
  M2:= 3.9802 * E;
end;

procedure TComponentCompaunding.Calc_P_FT0_FT(T: double);
begin
  FT0:=1250/(sqrt(sqr(TemKip)+108000)-307.6)-1;
  FT:=1250/(sqrt(sqr(T)+108000)-307.6)-1;
  P:=7.6715-(2.68*FT/FT0);
  P:=(exp(P*ln(10))+3158)*0.000001;
end;

procedure TComponentCompaunding.Calc_lambda_Ro1T_Ro2T(T: double);
begin
  if Ro20=0 then Ro20:=0.739; 
  lambda:=0.001828-(0.001232*Ro20);
  Ro1T:=Ro20-(lambda*(T-20));
  Ro2T:=(1000*Ro20-((0.58/Ro20)*(T-20))-((T-1200*(Ro20-0.68))/1000)*(T-20))/1000;
end;

function TTotalFlowCompaunding.GetCompOfName(
  CompName: string): TComponentCompaunding;
var
  i: integer;
begin
  result:=nil;
  for i:=0 to length(Components)-1 do
  begin
    if Components[i]=nil then exit;
    if Components[i].Name=CompName then
    begin
      result:=Components[i];
      exit;
    end;
  end;
end;

procedure TFlowCompaunding.Prov100(_YesToNorm: boolean = false; IsklComp: TArrStr = nil);
var
  i, j: integer;
  Sum, Sum1: double;
  res: boolean;
begin
  Sum:=0;
  for i:=0 to Length(Components)-1 do
  begin
    Sum:=Sum+Components[i].ConcentrComp;
  end;

  //ShowMessage(FloatToStr(Sum)+ '   2');

  if (roundto(Sum, -1)<>100.0) and (not _YesToNorm) then
  begin
    if CreateMessageDialog('В потоке '+Name+#13+
      ' сумма концентраций компонентов'+#13+
      ' не равна 100 % и составляет '+FloatToStr(Sum)+' %.'+#13+
      'Произвести нормирование на 100%?',
      mtWarning,  [mbYes, mbCancel]).ShowModal=mrYes then
    begin
      for i:=0 to Length(Components)-1 do
      begin
        Components[i].ConcentrComp:=roundto(
                                       Components[i].ConcentrComp*100/Sum, -2);
      end;
      ShowMessage('Нормирование произведено!');
    end;
  end
  else
  if _YesToNorm then
  begin
    Sum:=0;

      for i:=0 to Length(Components)-1 do
      begin
        for j:=0 to Length(IsklComp)-1 do
        begin
          if IsklComp[j]=Components[i].Name then
          begin
            Sum:=Sum+Components[i].ConcentrComp;
            break;
          end
        end;


      end;
      //ShowMessage(FloatToStr(Sum)+ '   1');
      Sum1:=0;
      for i:=0 to Length(Components)-1 do
      begin
        res:=false;
        for j:=0 to Length(IsklComp)-1 do
        begin
          if IsklComp[j]=Components[i].Name then
          begin
            res:=true;
            break;
          end
        end;
        if res then break;

        Sum1:=Sum1+Components[i].ConcentrComp;

      end;
      for i:=0 to Length(Components)-1 do
      begin
        res:=false;
        for j:=0 to Length(IsklComp)-1 do
        begin
          if IsklComp[j]=Components[i].Name then
          begin
            res:=true;
            break;
          end
        end;
        if res then break;
        if sum1>0 then
        Components[i].ConcentrComp:=roundto(
                                       Components[i].ConcentrComp*(100-Sum)/Sum1, -2);
      end;

  end;
  Sum:=0;

      for i:=0 to Length(Components)-1 do
      begin
        Sum:=Sum+Components[i].ConcentrComp;
      end;
  //ShowMessage(FloatToStr(Sum));
end;

function TFlowCompaunding.GetDNP(DNPComponents: TArrComponentCompaunding;
  T: double; IndBool: boolean = true): double;
var
  i: integer;
begin
  result:=0;
  //CalcVolOfMassConz(T);
  for i:=0 to Length(DNPComponents)-1 do
  begin
    result:=result+DNPComponents[i].GetDNPIndex(T, IndBool)*DNPComponents[i].ConcentrComp{здесь массовые концентрации}
  end;
  if IndBool then
    result:=power(result/100, 1/1.25)*6.8947;
end;

procedure TTotalFlowCompaunding.CalcMolConz(T: double);
var
  i: integer;
  sum: double;
begin
  sum:=0;
  for i:=0 to Length(Components)-1 do
  begin
    Components[i].Calc_lambda_Ro1T_Ro2T(T);
    sum:=sum+Components[i].ConcentrComp*Components[i].Ro1T;
  end;

  for i:=0 to Length(Components)-1 do
  begin
    if sum>0 then
      Components[i].ConcentrCompMol:=Components[i].ConcentrComp*Components[i].Ro1T/sum*100;
  end;
end;

procedure TTotalFlowCompaunding.LoadFromSFC(PathSFC: string;
  var ListBoxAllFlow: TListBox; IndBaseOrFile: integer);

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
  i,CountObject, jj: integer;
  MyIniFile, _MyIniFile: TIniFile;
  MyFlow: TFlowCompaunding;
  NameFlow: string;
  Paraf, IzoParaf_6, IzoParaf_8, Naft, Arom, Olef, Benzol, I_Pent, Toluol, n_but: double;
begin
  MyIniFile:=TIniFile.Create(PathSFC);
  NameFlow:=MyIniFile.ReadString('Subst', 'NameFlow', 'Новый поток');
  if ExistNameInList(NameFlow, ListBoxAllFlow) then
  begin
    if CreateMessageDialog('Такой поток уже существует! Заменить его?',
       mtWarning, [mbYes,mbNo]).ShowModal=mrYes then
    begin
      with ListBoxAllFlow.Items do
      begin
        MyFlow:=GetFlowOfName(Strings[IndexOf(NameFlow)]);
        ListBoxAllFlow.Selected[IndexOf(NameFlow)]:=true;
      end;
    end
    else
    begin
      exit;
    end;
  end
  else
  begin
    MyFlow:=TFlowCompaunding.Create;
    ListBoxAllFlow.Items.Add(NameFlow);
    ListBoxAllFlow.Selected[ListBoxAllFlow.Items.Count-1]:=true;
    MyFlow.Name:=NameFlow;
  end;
  CountObject:=MyIniFile.ReadInteger('Subst', 'CountObject', 0);
  DecimalSeparator:=MyIniFile.ReadString('Subst', 'DS', ',')[1];
  MyFlow.Expenditure:=MyIniFile.ReadFloat('Subst', 'Expenditure', 0);
  MyFlow.Price:=MyIniFile.ReadFloat('Subst', 'Price', 15000);
  MyFlow.SelfOV:=MyIniFile.ReadFloat('Subst', 'OV', 90);
  MyFlow.Bsumar:=MyIniFile.ReadFloat('Subst', 'Bsum', 0);

  MyFlow.ExistExpenditure:=MyFlow.Expenditure;
  MyFlow.ExistExpenditure2:=MyFlow.Expenditure;
  SetLength(MyFlow.Components, CountObject);
  for i:=0 to CountObject-1 do
  begin
    MyFlow.Components[i]:=TComponentCompaunding.Create;
    MyFlow.Components[i].Name:=MyIniFile.ReadString('Subst', 'Name'+IntToStr(i+1), '');
    MyFlow.Components[i].ConcentrComp:=MyIniFile.ReadFloat('Concentr', MyFlow.Components[i].Name, 0);
    MyFlow.Components[i].OctaneValue:=0;
  // внутренее использование
    case IndBaseOrFile of
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
          // правка от Никиты - считаем только по исследовательскому ОЧ
          MyFlow.Components[i].OctaneValue:=MyFlow.Components[i].ResON;
        end;
    end;
  end;

  if Length(MyFlow.Components)>100 then
  for i:=0 to Length(MyFlow.Components)-1 do
  begin
    with MyFlow do
    begin
      Paraf:=0;
      for jj:=1 to 10 do
      begin
        Paraf:=Paraf+Components[jj-1].ConcentrComp;
      end;
      IzoParaf_6:=0;
      for jj:=11 to 19 do     // надо уточнить у Никиты
      begin
        IzoParaf_6:=IzoParaf_6+Components[jj-1].ConcentrComp;
      end;
      IzoParaf_8:=0;
      for jj:=20 to 49 do
      begin
        IzoParaf_8:=IzoParaf_8+Components[jj-1].ConcentrComp;
      end;
      Naft:=0;
      for jj:=50 to 64 do
      begin
        Naft:=Naft+Components[jj-1].ConcentrComp;
      end;
      Arom:=0;
      for jj:=65 to 78 do
      begin
        Arom:=Arom+Components[jj-1].ConcentrComp;
      end;
      Olef:=0;
      for jj:=79 to 110 do
      begin
        Olef:=Olef+Components[jj-1].ConcentrComp;
      end;
      Benzol:=0;
      for jj:=65 to 65 do
      begin
        Benzol:=Benzol+Components[jj-1].ConcentrComp;
      end;
      I_Pent:=0;
      for jj:=12 to 12 do
      begin
        I_Pent:=I_Pent+Components[jj-1].ConcentrComp;
      end;
      Toluol:=0;
      for jj:=66 to 66 do
      begin
        Toluol:=Toluol+Components[jj-1].ConcentrComp;
      end;
      n_but:=0;
      for jj:=3 to 3 do
      begin
        n_but:=n_but+Components[jj-1].ConcentrComp;
      end;
    end;
  end;

  if (Olef>=15) and (Olef<=25) then
  begin
    MyFlow.NameOfCondition:='КТ-1/1';
    MyFlow.IndexOfCondition:=2;
    MyFlow.Price:=12555;
  end;

  if (Arom>70) and (Benzol>1) and (MyFlow.FlowOctaneValue>100) then
  begin
    MyFlow.NameOfCondition:='Риф.1000';
    MyFlow.IndexOfCondition:=3;
    MyFlow.Price:=21521;
  end;
  if (Arom>50) and (Benzol>2) and (MyFlow.FlowOctaneValue<100) then  // добавили условие по ОЧ
  begin
    MyFlow.NameOfCondition:='Риф.600';
    MyFlow.IndexOfCondition:=4;
    MyFlow.Price:=18494;
  end;
  if (Toluol>90) then
  begin
    MyFlow.NameOfCondition:='Толуол';
    MyFlow.IndexOfCondition:=5;
    MyFlow.Price:=37754;
  end;
  if (IzoParaf_6>85) then
  begin
    MyFlow.NameOfCondition:='Изомеризат';
    MyFlow.IndexOfCondition:=6;
    MyFlow.Price:=22402;
  end;
  if (I_Pent>90) then
  begin
    MyFlow.NameOfCondition:='Изопентан';
    MyFlow.IndexOfCondition:=7;
    MyFlow.Price:=21590;
  end;
  if (IzoParaf_8>55) then
  begin
    MyFlow.NameOfCondition:='Алкилат';
    MyFlow.IndexOfCondition:=8;
    MyFlow.Price:=24673;
  end;
  if (MyFlow.FlowOctaneValue>=125) then
  //if (MyFlow.Name='MTБE') then
  begin
    MyFlow.NameOfCondition:='МТБЭ';
    MyFlow.IndexOfCondition:=9;
    MyFlow.Price:=53000;
  end;
  if (MyFlow.FlowOctaneValue<70) and (Arom>3) and (Olef<15) then  // добавили условие по олефинам
  begin
    MyFlow.NameOfCondition:='фр.62-85 АВТ-10';
    MyFlow.IndexOfCondition:=10;
    MyFlow.Price:=15534;
  end;
  if (Olef>25) then
  begin
    MyFlow.NameOfCondition:='ГОБКК';
    MyFlow.IndexOfCondition:=1;
    MyFlow.Price:=14555;
  end;
  if (MyFlow.FlowOctaneValue<70) and (Naft>50) then
  begin
    MyFlow.NameOfCondition:='фр.62-85 С100 КПА';
    MyFlow.IndexOfCondition:=11;
    MyFlow.Price:=15369;
  end;
  if (MyFlow.FlowOctaneValue<70) and (IzoParaf_8>20) then
  begin
    MyFlow.NameOfCondition:='Рафинат С400 КПА';
    MyFlow.IndexOfCondition:=12;
    MyFlow.Price:=15723;
  end;
  if (n_but>=90) and (n_but<=100) then
  begin
    MyFlow.NameOfCondition:='н-бутан';
    MyFlow.IndexOfCondition:=13;
    MyFlow.Price:=21590;
  end;
  AddFlow(MyFlow);
  MyFlow.SetBigParam; // для укрупненых показателей
end;

procedure TTotalFlowCompaunding.LoadFromSK(PathSK: string;
  var ListBoxAllFlow: TListBox; IndRif, IndBase: integer);

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

  function GetCountObject(StrList: TStringList): integer;
    procedure DelSpace(var str:string);
    begin
      while pos(' ', str)>0 do
        delete(str, pos(' ', str), 1);
    end;
  var

    str: string;
  begin
    str:=StrList.Strings[StrList.Count-1];
    str:=copy(str, 1, 4);
    DelSpace(str);

    // потом надо подумать как дальше сделать
    try
      result:=StrToInt(str);
    except
      result:=69;
    end;

  end;

  function GetDS(StrList: TStringList): char;

  begin
    result:=#0;
    if pos('.', StrList.Strings[0])>0 then
    begin
      result:='.';
    end;

  end;

  function GetSubstName(StrList: TStringList; ind: integer): string;
    procedure DelSpace(var str:string);

    begin
      while pos(' ', str)>0 do
        delete(str, pos(' ', str), 1);   
    end;
  var
    str: string;
  begin

    str:=copy(StrList.Strings[ind], 3, 15);
    str:=AnsiUpperCase(str);
    DelSpace(str);
    result:=str;

  end;

  function GetConcentr(StrList: TStringList; ind: integer): double;

    procedure DelSpace(var str:string);
    begin
      while pos(' ', str)>0 do
        delete(str, pos(' ', str), 1);
    end;

  var

    oldDS: char;
    str: string;
  begin
    oldDS:=DecimalSeparator;
    DecimalSeparator:='.';

    str:=copy(StrList.Strings[ind], 18, 6);
    DelSpace(str);
    result:=StrToFloat(str);
    DecimalSeparator:=oldDS;
  end;

var
  i,CountObject: integer;
  _MyIniFile: TIniFile;
  MyFlow: TFlowCompaunding;
  MyComp: TComponentCompaunding;
  NameFlow: string;
  FirstIndex, LastIndex: integer;
  StrList: TStringList;
begin

  NameFlow:=ExtractFileName(PathSK);

  if ExistNameInList(NameFlow, ListBoxAllFlow) then
  begin
    if CreateMessageDialog('Такой поток уже существует! Заменить его?',
       mtWarning, [mbYes,mbNo]).ShowModal=mrYes then
    begin
      with ListBoxAllFlow.Items do
      begin
        MyFlow:=GetFlowOfName(Strings[IndexOf(NameFlow)]);
        ListBoxAllFlow.Selected[IndexOf(NameFlow)]:=true;
      end;
    end
    else
    begin
      exit;
    end;
  end
  else
  begin
    MyFlow:=TFlowCompaunding.Create;
    ListBoxAllFlow.Items.Add(NameFlow);
    ListBoxAllFlow.Selected[ListBoxAllFlow.Items.Count-1]:=true;
    MyFlow.Name:=NameFlow;
  end;
  StrList:= TStringList.Create;
  StrList.LoadFromFile(PathSK);
  for i:=1 to 6 do
    StrList.Delete(138);
  CountObject:=GetCountObject(StrList);
  DecimalSeparator:=GetDS(StrList);
  MyFlow.Expenditure:=0;
  SetLength(MyFlow.Components, CountObject);
  {indrif=1 сырье
  indrif=2 катализат}
  case IndRif of
    1:begin
        FirstIndex:=0;
        LastIndex:=68;
      end;
    2:begin
        FirstIndex:=69;
        LastIndex:=69+CountObject-1;
      end;
  end;
  for i:=FirstIndex to LastIndex do
  begin
    MyFlow.Components[i-FirstIndex]:=TComponentCompaunding.Create;
    MyFlow.Components[i-FirstIndex].Name:=GetSubstName(StrList, i);
    MyFlow.Components[i-FirstIndex].ConcentrComp:=GetConcentr(StrList, i);
    MyFlow.Components[i-FirstIndex].OctaneValue:=0;
    case IndBase of
    Index_Base_Ini:
      begin
        _MyIniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'\Base.ini');
        DecimalSeparator:=',';
        with MyFlow.Components[i-FirstIndex] do
        begin                
          MotON:=_MyIniFile.ReadFloat('MOTON', Name, 0);
          ResON:=_MyIniFile.ReadFloat('RESON', Name, 0);
          CoefB:=_MyIniFile.ReadFloat('CoefB', Name, 0);
          limit:=_MyIniFile.ReadFloat('limit', Name, 0);
          Ro20:=_MyIniFile.ReadFloat('Ro20', Name, 0);
          TemKip:=_MyIniFile.ReadFloat('TemKip', Name, 0);
          DNP_A:=_MyIniFile.ReadFloat('DNP_A', Name, 0);
          DNP_B:=_MyIniFile.ReadFloat('DNP_B', Name, 0);
          DNP_C:=_MyIniFile.ReadFloat('DNP_C', Name, 0);
          MolarMass:=_MyIniFile.ReadFloat('MolarMass', Name, 0);
          MuA:=_MyIniFile.ReadFloat('MuA', Name, 0);
          MuB:=_MyIniFile.ReadFloat('MuB', Name, 0);
        end;
      end;
    Index_Base_Access:
      begin
        MyComp:=UDM.DM.GetCompFromName(MyFlow.Components[i-FirstIndex].Name);
        MyFlow.Components[i-FirstIndex].MotON:=MyComp.MotON;
        MyFlow.Components[i-FirstIndex].ResON:=MyComp.ResON;
        MyFlow.Components[i-FirstIndex].CoefB:=MyComp.CoefB;
        MyFlow.Components[i-FirstIndex].Ro20:=MyComp.Ro20;
        MyFlow.Components[i-FirstIndex].TemKip:=MyComp.TemKip;
        MyFlow.Components[i-FirstIndex].DNP_A:=MyComp.DNP_A;
        MyFlow.Components[i-FirstIndex].DNP_B:=MyComp.DNP_B;
        MyFlow.Components[i-FirstIndex].DNP_C:=MyComp.DNP_C;
        MyFlow.Components[i-FirstIndex].MolarMass:=MyComp.MolarMass;
        MyFlow.Components[i-FirstIndex].MuA:=MyComp.MuA;
        MyFlow.Components[i-FirstIndex].MuB:=MyComp.MuB;
        MyComp.Free;
      end;
    end;
  end;
  {вставка нужной концентрации}
  MyFlow.Components[67].ConcentrComp:=roundto(
  MyFlow.Components[67].ConcentrComp-
  MyFlow.Components[68].ConcentrComp, -3);

  AddFlow(MyFlow);
  StrList.Free;
end;

procedure TTotalFlowCompaunding.ClearFlow;
begin
  SetLength(Flows, 0);
end;

procedure TTotalFlowCompaunding.DownLoadSir(PathExcel: string; Memo1: TMemo;
Ea1: TExcelApplication);

function IsEN(str: string): boolean;
const
  NameEN: array[1..4] of string =
    ('EN-','ЕН-','DIEN','ДИЕН');
var
  i: integer;

begin
  result:=false;
  for i:=1 to length(NameEN) do
    if pos(NameEN[i], AnsiUpperCase(str))>0 then
    begin
       result:= true;
       exit;
    end;
end;

function IsFloat( var str: string): boolean;
var
  i: integer;
  Decim: Char;
begin
  result:=true;
  for i:=1 to length(str) do
    if not (str[i] in ['0'..'9', '.', ',','E' ,'-']) then
      result:=false;
  Decim:=#0;
  if result then
  begin

    if DecimalSeparator='.' then Decim:=',';
    if DecimalSeparator=',' then Decim:='.';
    if pos(Decim, str)>0 then
      str[pos(Decim, str)]:=DecimalSeparator;

    str:=FloatToStr(roundto(StrToFloat(str), -3));
  end;

end;

var
  WS: _Worksheet;
  WorkBook: _WorkBook;
  i, j, n, stolb,stolb1: integer;
  str, str1: string;

begin
  Olefin:=TOlefin.Create;
  Olefin.ArrIndiv:=TArrIndivComponent.Create;
  Olefin.ArrGpuppe:=TArrGpuppeComponent.Create;
  Olefin.ArrIUnknow:=TArrIUnknowComponent.Create;
  Memo1.Lines.Clear;

  {Ea1.DisplayAlerts[0]:=false;
  Ea1.Quit;
  Ea1.Disconnect;   }

  CoInitialize(nil);

  Ea1.Connect;

  Ea1.Workbooks.Open(PathExcel, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
        EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
        EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0);

  WorkBook:= Ea1.Workbooks.Item[1] as _WorkBook;

  WS :=(Ea1.Workbooks.Item[1].Worksheets.Item[1] as _Worksheet);

  Stolb:=1;
  Stolb1:=2;

  i:=1;
  n:=0;
  while (i<500) and (n<100) do
  begin
    str:=WS.Cells.Item[i,stolb];
    if str='' then
    begin
      WS.Range['A'+IntToStr(i),'B'+IntToStr(i)].Delete(2);
      n:=n+1;
      Continue;
    end;

    if IsEN(str) then
    begin
      str1:=WS.Cells.Item[i,stolb1];
      IsFloat(str1);
      Olefin.AddIUnknowComponent(str, StrToFloat(str1));

      WS.Range['A'+IntToStr(i),'B'+IntToStr(i)].Delete(2);
      n:=n+1;
      Continue;
    end;

    str1:='';
    if length(str)>30 then
    begin
      for j:=1 to 30 do
        str1:=str1+str[j];
      WS.Cells.Item[i,stolb]:=str1;
    end;

    str:=WS.Cells.Item[i,stolb1];
    if (str='') then
    begin
      WS.Range['A'+IntToStr(i),'B'+IntToStr(i)].Delete(2);
      n:=n+1;
      Continue;
    end;

    if (not IsFloat(str)) then
    begin
      WS.Range['A'+IntToStr(i),'B'+IntToStr(i)].Delete(2);
      n:=n+1;
      Continue;
    end;

    if IsFloat(str) then
    begin
      WS.Cells.Item[i,stolb1]:=StrToFloat(str);
    end;
    if StrToFloat(str)=0 then
    begin
      WS.Range['A'+IntToStr(i),'B'+IntToStr(i)].Delete(2);
      n:=n+1;
      Continue;
    end;

    if StrToFloat(str)>35 then
      if CreateMessageDialog('Продолжаем?', mtWarning, [mbOk, mbCancel]).ShowModal=mrCancel
      then
        begin
          ShowMessage('Выберите другой файл');
          Ea1.DisplayAlerts[0]:=false;
          Ea1.Quit;
          Ea1.Disconnect;
          exit;
        end;

    if (StrToFloat(str)>80) then
    begin
      WS.Range['A'+IntToStr(i),'B'+IntToStr(i)].Delete(2);
      n:=n+1;
      Continue;
    end;

    str1:=AnsiUpperCase(WS.Cells.Item[i,stolb]);

    i:=i+1;
    n:=0;

  end;

  for i:=1 to 500 do
  begin
    if String(WS.Cells.Item[i,stolb])<>'' then
    begin
      str:=WS.Cells.Item[i,stolb];
      if length(str)< 43 then
      begin
        for j:= 1 to 43-length(str) do
          str:=str+' ';
      end;
      str1:=FloatToStr(WS.Cells.Item[i,stolb1]);
      for j:=1 to length(str1) do
        if str1[j]=',' then str1[j]:='.';
      str:=str+str1;
      Memo1.Lines.Add(str);
    end
    else
      break;

  end;
  Ea1.DisplayAlerts[0]:=false;
  Ea1.Quit;
  Ea1.Disconnect;


  for i:=0 to Memo1.Lines.Count-1 do
  begin
    str:=Copy(Memo1.Lines.Strings[i], 1, 43);
    str1:=Copy(Memo1.Lines.Strings[i], 44,6);
    if pos('.', Str1)=0 then
      str1:=str1+'.000';
    if pos('.', Str1)=2 then
      str1:=' '+str1;
     while length(str1)<6 do
     begin
       str1:=str1+'0';
     end;
     str:=str+str1;
     Memo1.Lines.Strings[i]:=str;

  end;
  Memo1.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+
                          'bin\sk\Komsomol\01-09-09\01-09-09.kat');
  Olefin.InitializeOlefin;
  Olefin.IUnknowToIknow;
  Olefin.DeInitializeOlefin;
end;

procedure TTotalFlowCompaunding.SravSk(Memo1, Memo2: TMemo);

function GetConcentr(InStr: string): double;
var
  str: string;
  Decim: Char;
begin
  str:=copy(InStr, 18, 6);
  while pos(' ', str)>0 do
    delete(str, pos(' ', str), 1);

  Decim:=',';
  if DecimalSeparator='.' then Decim:=',';
  if DecimalSeparator=',' then Decim:='.';

  if pos(Decim, str)>0 then
    str[pos(Decim, str)]:=DecimalSeparator;

  result:=StrToFloat(str);
end;

function CalcOtklon(InStr1, InStr2: string): double;
var
  Concentr1, Concentr2: double;
begin

  Concentr1:=GetConcentr(InStr1);
  if Concentr1=0 then
  begin
    result:=-1;
    exit;
  end;
  Concentr2:=GetConcentr(InStr2);
  result:=power( (Concentr1-Concentr2)/Concentr1, 2);
end;

function CalcSummOtkl(List1, List2: TStrings; FirstIndex, Count: integer): double;
var
  i: integer;
  Otklon: double;
  CountOtklon: integer;
begin
  result:=0;
  CountOtklon:=0;
  for i:=FirstIndex to FirstIndex+Count-1 do
  begin
    Otklon:=CalcOtklon(List1.Strings[i], List2.Strings[i]);
    if Otklon>-1 then
    begin
      result:=result+Otklon;
      CountOtklon:=CountOtklon+1;
    end;
  end;
  result:=result/CountOtklon;
end;
function FloatToFormatStr(Chislo: double): string;
var
  Str: string;
begin
  Str:=FloatToStr(roundto(Chislo,-3));

  if pos(',', Str)>0 then
    str[pos(',', Str)]:='.';

  if pos('.', Str)=0 then
    str:=str+'.000';

  if pos('.', Str)=2 then
    str:=' '+str;

  while length(str)<6 do
  begin
    str:=str+'0';
  end;

  result:=str;
end;

function CalcSumConcentr(List1: TStrings): double;
var
  i: integer;
  Summ: double;
begin
  Summ:=0;
  for i:=69 to 137 do
  begin
    Summ:=Summ+GetConcentr(List1.Strings[i]);
  end;

  result:=Summ;
end;

function CalcIsklSumConcentr(List1: TStrings;
  Iskl: TArrDouble; delta: double): double;
var
  i, j: integer;
  Summ: double;
  b: boolean;
begin
  Summ:=0;
  for i:=69 to 137 do
  begin
    b:=false;
    for j:=0 to length(Iskl)-1 do
      if i=Iskl[j] then
        b:=true;
    if not b then
      Summ:=Summ+GetConcentr(List1.Strings[i]);
  end;

  result:=Summ-delta;
end;

function GetIskl(List1: TStrings): TArrDouble;
var
  i: integer;
  Iskl: TArrDouble;
begin
  SetLength(Iskl, 0);
  for i:=69 to 137 do
    if GetConcentr(List1.Strings[i])>0 then
    begin
      SetLength(Iskl, length(Iskl)+1);
      Iskl[length(Iskl)-1]:=i;
    end;
   result:=Iskl;
end;

function InsertInListNewValue(List1: TStrings; List2: TStrings;
  Otnosh: double; Iskl: TArrDouble): TStrings;
var
  i, j: integer;
  b: boolean;
  str1: string;
begin
  for i:=69 to 137 do
  begin
    b:=false;
    for j:=0 to length(Iskl)-1 do
      if i=Iskl[j] then
        b:=true;
    if not b then
    begin
      str1:=List1.Strings[i];
      Delete(str1, 18, 6);
      Insert(FloatToFormatStr(GetConcentr(List2.Strings[i])*Otnosh),
             str1, 18);
      List1.Strings[i]:=str1;
    end;
  end;
  result:=List1;
end;

var
  NameMin: string;
  RasOtklon: double;
  OtklonMin: double;
  F: TSearchRec;
  Ostatok1, Ostatok2, Otnosh: double;
begin
  OtklonMin:=1000000;

  Memo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+
      'bin\Test.sk');
   

  if FindFirst(ExtractFilePath(Application.ExeName)+
      'bin\Base sk\*.sk', faAnyFile, F)=0 then
  repeat
    Memo2.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+
      'bin\Base sk\'+F.Name);
    RasOtklon:=CalcSummOtkl(Memo1.Lines, Memo2.Lines, 69, 69);

    if OtklonMin>RasOtklon then
    begin
      OtklonMin:=RasOtklon;
      NameMin:=F.Name;
    end;
  until FindNext(F)<>0;

  {----------------------}
  Memo2.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+
      'bin\Base sk\'+NameMin);

  Ostatok1:=100-CalcSumConcentr(Memo1.Lines);
  Ostatok2:=CalcIsklSumConcentr(Memo2.Lines, GetIskl(Memo1.Lines), olefin.CalcSum);

  If (Ostatok1=0) or (Ostatok2=0) then
    Otnosh:=1
  else
    Otnosh:=Ostatok1/Ostatok2;

  InsertInListNewValue(Memo1.Lines, Memo2.Lines, Otnosh, GetIskl(Memo1.Lines));
  WriteToSkEN(Memo1);

end;

function TComponentCompaunding.GetRoT(T: double): double;
var
  deltaT: double;
begin
  deltaT:=(18.310-13.233*Ro20)*1e-4;
  result:=Ro20-deltaT*(T-20);
end;

function TComponentCompaunding.GetMuT(T: double): double;
{var
a:real; }
begin
  If MuB<>0 then
  result:=exp(2.3*MuA*(1/(T+273)-1/MuB));
  If MuB=0 then
     result:=0;
 // result:=exp(MuA+MuB/T)*Ro20*MolarMass    старая формула //до конца проверки не изменять
end;

procedure TComponentCompaunding.Assign(var Comp: TComponentCompaunding);
begin
  Comp.Name:=Name;
  Comp.ConcentrComp:=ConcentrComp;
  Comp.ConcentrCompMol:=ConcentrCompMol;
  Comp.ConcentrCompVol:=ConcentrCompVol;
  Comp.MolarMass:=MolarMass;
  Comp.OctaneValue:=OctaneValue;
  Comp.CoefB:=CoefB;
  Comp.MotON:=MotON;
  Comp.ResON:=ResON;
  Comp.limit:=limit;
  Comp.Ro20:=Ro20;
  Comp.TemKip:=TemKip;
  Comp.DNP_A:=DNP_A;
  Comp.DNP_B:=DNP_B;
  Comp.DNP_C:=DNP_C;
  Comp.FT0:=FT0;
  Comp.FT:=FT;
  Comp.lambda:=lambda;
  Comp.Ro1T:=Ro1T;
  Comp.Ro2T:=Ro2T;
  Comp.Ro15:=Ro15;
  Comp.K:=K;
  Comp.M1:=M1;
  Comp.E:=E;
  Comp.M2:=M2;
  Comp.MuA:=MuA;
  Comp.MuB:=MuB;
  Comp.MuA:=MuA;
end;

{ TOlefin }

procedure TOlefin.AddGruppeCompComponent(NameGr: string; NameComp: string);
var
  MyGruppe: TGpuppeComponent;
begin
  with ArrGpuppe do
  begin
    MyGruppe:=ExistInGruppe(NameGr);
    if MyGruppe.Concentr>-1 then
    begin
      SetLength(MyGruppe.NameComp,Length(MyGruppe.NameComp)+1);
      MyGruppe.NameComp[Length(MyGruppe.NameComp)-1]:=NameComp;
    end;
  end;
end;

procedure TOlefin.AddGruppeComponent(NameGr: string);
begin
  with ArrGpuppe do
  begin
    SetLength(Gruppe, Length(Gruppe)+1);
    Gruppe[Length(Gruppe)-1]:=TGpuppeComponent.Create;
    Gruppe[Length(Gruppe)-1].Name:=NameGr;
  end;
end;

procedure TOlefin.AddIndivCompComponent(NameIndiv: string; NameComp: string);
var
  MyIndiv: TIndivComponent;
begin
  with ArrIndiv do
  begin
    MyIndiv:=ExistInIndiv(NameIndiv);
    SetLength(MyIndiv.NameIndiv, Length(MyIndiv.NameIndiv)+1);
    MyIndiv.NameIndiv[Length(MyIndiv.NameIndiv)-1]:=NameComp;
  end;
end;

procedure TOlefin.AddIndivComponent(NameIndiv: string);
begin
  with ArrIndiv do
  begin
    SetLength(Component, Length(Component)+1);
    Component[Length(Component)-1]:=TIndivComponent.Create;
    Component[Length(Component)-1].Name:=NameIndiv;
  end;

end;

procedure TOlefin.AddIUnknowComponent(NameIUnknow: string;
  Concentr: double);
begin
  with ArrIUnknow do
  begin
    SetLength(Component, Length(Component)+1);
    Component[Length(Component)-1]:=TIUnknowComponent.Create;
    Component[Length(Component)-1].Name:=NameIUnknow;
    Component[Length(Component)-1].Concentr:=Concentr;
  end;
end;

procedure TOlefin.Assign(var Olef: TOlefin);
var
  i: integer;
begin
  if Self=nil then exit;
  Olef.ArrIndiv:=TArrIndivComponent.Create;
  Olef.ArrGpuppe:=TArrGpuppeComponent.Create;
  Olef.ArrIUnknow:=TArrIUnknowComponent.Create;
  if ArrIndiv<>nil then
  begin
    SetLength(Olef.ArrIndiv.Component, Length(ArrIndiv.Component));
    for i:=0 to Length(ArrIndiv.Component)-1 do
      ArrIndiv.Component[i].Assign(Olef.ArrIndiv.Component[i]);
  end;
  if ArrGpuppe<>nil then
  begin
    SetLength(Olef.ArrGpuppe.Gruppe, Length(ArrGpuppe.Gruppe));
    for i:=0 to Length(ArrGpuppe.Gruppe)-1 do
      ArrGpuppe.Gruppe[i].Assign(Olef.ArrGpuppe.Gruppe[i]);
  end;
  if ArrIUnknow<>nil then
  begin
    SetLength(Olef.ArrIUnknow.Component, Length(ArrIUnknow.Component));
    for i:=0 to Length(ArrIUnknow.Component)-1 do
      ArrIUnknow.Component[i].Assign(Olef.ArrIUnknow.Component[i]);
  end;
end;

function TOlefin.CalcSum: double;
var
  sum: double;
  i: integer;
begin
  sum:=0;
  for i:=0 to length(ArrIndiv.Component)-1 do
  begin
    sum:=sum+ArrIndiv.Component[i].Concentr;
  end;

  for i:=0 to length(ArrGpuppe.Gruppe)-1 do
  begin
    sum:=sum+ArrGpuppe.Gruppe[i].Concentr;
  end;

  result:=sum;
end;

function TOlefin.CalcSumAll: double;
var
  sum: double;
  i: integer;
begin
  sum:=CalcSum;

  for i:=0 to length(ArrIUnknow.Component)-1 do
  begin
    sum:=sum+ArrIUnknow.Component[i].Concentr;
  end;
  result:=sum;
end;

procedure TOlefin.DeInitializeOlefin;
var
  i, j: integer;
  MyIni: TIniFile;
  COUNTINDIV, COUNTGRUPPE: integer;
  COUNTINDIVCOMP, COUNTGRUPPECOMP: integer;
begin
  MyIni:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'bin\IndivGruppe.ini');
  COUNTINDIV:=length(ArrIndiv.Component);
  MyIni.WriteInteger('INDIV', 'COUNTINDIV', COUNTINDIV);

  for i:=1 to COUNTINDIV do
  begin
    //MyIni.WriteString('INDIV', 'NAME'+IntToStr(i), ArrIndiv.Component[i-1].Name);
    COUNTINDIVCOMP:=length(ArrIndiv.Component[i-1].NameIndiv);
    MyIni.WriteInteger('INDIV', 'COUNTINDIV'+IntToStr(i)+'COMP', COUNTINDIVCOMP);
    for j:=1 to COUNTINDIVCOMP do
    begin
      MyIni.WriteString('INDIV', 'NAME'+IntToStr(i)+'COMP'+IntToStr(j),
        ArrIndiv.Component[i-1].NameIndiv[j-1]);
    end;
  end;     

end;

procedure TOlefin.DelIUnknowComponent(NameIUnknow: string);
var
  i, j: integer;
begin
  for i:=0 to length(ArrIUnknow.Component)-1 do
    if ArrIUnknow.Component[i].Name=NameIUnknow then
    begin
      for j:=i to length(ArrIUnknow.Component)-2 do
        ArrIUnknow.Component[j]:=ArrIUnknow.Component[j+1];

      SetLength(ArrIUnknow.Component, Length(ArrIUnknow.Component)-1);
      break;
    end;

end;

procedure TOlefin.InitializeOlefin;
var
  i, j: integer;
  MyIni: TIniFile;
  COUNTINDIV: integer;
  COUNTINDIVCOMP: integer;
begin
  MyIni:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'bin\IndivGruppe.ini');
  COUNTINDIV:=MyIni.ReadInteger('INDIV', 'COUNTINDIV', 0);
  SetLength(ArrIndiv.Component, 0);
  for i:=1 to COUNTINDIV do
  begin
    AddIndivComponent(MyIni.ReadString('INDIV', 'NAME'+IntToStr(i), ''));
    COUNTINDIVCOMP:=MyIni.ReadInteger('INDIV', 'COUNTINDIV'+IntToStr(i)+'COMP', 0);
    for j:=1 to COUNTINDIVCOMP do
    begin
      AddIndivCompComponent(MyIni.ReadString('INDIV', 'NAME'+IntToStr(i), '') ,
      MyIni.ReadString('INDIV', 'NAME'+IntToStr(i)+'COMP'+IntToStr(j), ''));
    end;
  end;   
end;

procedure TOlefin.IUnknowToIknow;
var
  i, j, k: integer;
  MyIndiv: TIndivComponent;
  MyGruppe: TGpuppeComponent;
  sumOlef: double;
begin
  RaspredComponent;
  sumOlef:=CalcSumAll;
  i:=0;
  if sumOlef>=Max_Olefin then
  begin
    while i<=length(ArrIUnknow.Component)-1 do
    begin
      FMyDb1.label2.caption:=ArrIUnknow.Component[i].Name;

      If FMyDb1.ShowModal=mrYes then
      begin
        FMyDB2.Label2.Caption:=FMyDb1.label2.Caption;
        FMyDB2.ListBox1.Clear;
        for j:=0 to length(ArrIndiv.Component)-1 do
        begin
          FMyDB2.ListBox1.Items.Add(ArrIndiv.Component[j].Name);
        end;
        FMyDB2.ListBox1.Selected[0]:=true;
        if FMyDb2.ShowModal=mrYes then
        begin
          MyIndiv:=ArrIndiv.ExistInIndiv(FMyDB2.ListBox1.Items[FMyDB2.ListBox1.ItemIndex]);
          if MyIndiv.Concentr>-1 then
          begin
            MyIndiv.Concentr:=MyIndiv.Concentr+ArrIUnknow.Component[i].Concentr;
            SetLength(MyIndiv.NameIndiv,length(MyIndiv.NameIndiv)+1);
            MyIndiv.NameIndiv[length(MyIndiv.NameIndiv)-1]:=ArrIUnknow.Component[i].Name;
            DelIUnknowComponent(ArrIUnknow.Component[i].Name);
            continue;
          end;
        end;
      end;
      i:=i+1;
    end;
  end;
end;

procedure TOlefin.RaspredComponent;
var
  i: integer;
  MyIndiv: TIndivComponent;
  MyGruppe: TGpuppeComponent;
begin
  i:=0;
  while i<=length(ArrIUnknow.Component)-1 do
  begin
    MyIndiv:=ArrIndiv.ExistInIndiv(ArrIUnknow.Component[i].Name);
    if MyIndiv.Concentr>-1 then
    begin
      MyIndiv.Concentr:=MyIndiv.Concentr+ArrIUnknow.Component[i].Concentr;

      DelIUnknowComponent(ArrIUnknow.Component[i].Name);
      continue;
    end;
    i:=i+1;
  end;
end;

{ TArrGpuppeComponent }

function TArrGpuppeComponent.ExistInGruppe(NameComponent: string): TGpuppeComponent;
var
  i, j: integer;
begin


  // по группам
  for i:=0 to length(Gruppe)-1 do
  begin
   { if Gruppe[i].Name=NameComponent then
    begin
      result:=Gruppe[i];
      exit;
    end;}
    // по именам компонентов в группе
    for j:=0 to length(Gruppe[i].NameComp)-1 do
      if Gruppe[i].NameComp[j]=NameComponent then
      begin
        result:=Gruppe[i];
        exit;
      end;
  end;
  result:=TGpuppeComponent.Create;
  result.Concentr:=-1;
  result.Name:='';
  result.NameComp:=nil;
end;

{ TArrIndivComponent }

function TArrIndivComponent.ExistInIndiv(
  NameComponent: string): TIndivComponent;
var
  i, j: integer;
begin

  
  for i:=0 to length(Component)-1 do
  begin
    if Component[i].Name=NameComponent then
    begin
      result:=Component[i];
      exit;
    end;
    for j:=0 to length(Component[i].NameIndiv)-1 do
      if Component[i].NameIndiv[j]=NameComponent then
      begin
        result:=Component[i];
        exit;
      end;   
  end;
  result:=TIndivComponent.Create;
  result.Concentr:=-1;
  result.Name:='';
end;

procedure TTotalFlowCompaunding.WriteToSkEN(Memo1: TMemo);

function FloatToFormatStr(Chislo: double): string;
var
  Str: string;
begin
  Str:=FloatToStr(roundto(Chislo,-3));
  if pos(',', Str)>0 then
    str[pos(',', Str)]:='.';
  if pos('.', Str)=0 then
    str:=str+'.000';
  if pos('.', Str)=2 then
    str:=' '+str;
  while length(str)<6 do
  begin
    str:=str+'0';
  end;
  result:=str;
end;

function StrToFormatStr(str: string): string;
var
  i: integer;
begin
  if length(str)>13 then
    delete(str, 14, length(str)-13);
  if length(str)<13 then
    for i:=1 to 12-length(str) do
    str:=str+' ';

  result:=str;
end;

function IndToFormatStr(index: integer): string;
var
  Str: string;
begin
  str:=IntToStr(index);
  if length(str)=2 then
    str:=str+'   ';
  if length(str)=3 then
    str:=str+'  ';

  result:=str;
end;

var
  i, k: integer;
begin
  {for i:=1 to 6 do
    memo1.Lines.Delete(memo1.Lines.Count-1);}
  with Olefin do
  begin
    k:=70;
    for i:=0 to Length(ArrIndiv.Component)-1 do
      with ArrIndiv.Component[i] do
        memo1.Lines.Add(IndToFormatStr(k+i)+StrToFormatStr(Name)+FloatToFormatStr(Concentr));
    k:=k+Length(ArrIndiv.Component);
    for i:=0 to Length(ArrGpuppe.Gruppe)-1 do
      with ArrGpuppe.Gruppe[i] do
        memo1.Lines.Add(IndToFormatStr(k+i)+StrToFormatStr(Name)+FloatToFormatStr(Concentr));
   end;

end;

function TFlowCompaunding.GetRoT(RoComponents: TArrComponentCompaunding;
  T: double): double;
var
  i: integer;
begin
  result:=0;
  for i:=0 to Length(RoComponents)-1 do
  begin
    result:=result+RoComponents[i].GetRoT(T)*RoComponents[i].ConcentrComp;{здесь массовые концентрации}
  end;
  result:=result*1000/100; // перевод из процентов
end;

function TFlowCompaunding.GetMuT(MuComponents: TArrComponentCompaunding;
  T: double): double;
var
  i: integer;
begin
  result:=0;
  for i:=0 to Length(MuComponents)-1 do
  begin
    result:=result+MuComponents[i].GetMuT(T)*MuComponents[i].ConcentrComp;{здесь массовые концентрации}
  end;
  {result:=result*1000/100; // перевод из процентов }
end;

{ TArrConditions }

procedure TArrConditions.AddCondition(Cond: TCondition);
begin
  SetLength(Conditions, length(Conditions)+1);
  Conditions[length(Conditions)-1]:=Cond;

  SetLength(StringList, Length(StringList)+1);
  StringList[Length(StringList)-1]:=TStrings.Create;
  
end;



procedure TArrConditions.AddRatio(Conzen: TArrOfDouble);

function SetStr(Conzen: TArrOfDouble): string;
var
  i: integer;
begin
  result:='';
  for i:=0 to length(Conzen)-1 do
  begin
    result:=result+':'+FloatToStr(Conzen[i]);
  end;
  delete(Result, 1, 1);

end;
var
  i: integer;
begin
  for i:=0 to Length(Conditions)-1 do
  begin
   // Примечание: список создается автоматом, когда создаются условия
   // забиваем новое соотношение
    StringList[i].Add(SetStr(Conzen));
  end;
end;

procedure TArrConditions.Assign(var ArrCond: TArrConditions);
var
  i: integer;
begin
  ArrCond.Name:=Name;
  SetLength(ArrCond.Conditions, Length(Conditions));
  for i:=0 to Length(Conditions)-1 do
  begin
    ArrCond.Conditions[i]:=TCondition.Create;
    Conditions[i].Assign(ArrCond.Conditions[i]);
  end;
  for i:=0 to Length(ArrCond.StringList)-1 do
  begin

    ArrCond.StringList[i]:=StringList[i];
  end;
end;

function TArrConditions.CreateCondition(_Name: string; _OV: double; _restrictions: TArrOfDouble): TCondition;
var
  Cond: TCondition;
  i: integer;
begin
  result:=nil;
  Cond:= TCondition.Create;
  with Cond do
  begin
    Name:=_Name;
    OV:=_OV;
    SetLength(restrictions, Length(_restrictions));
    for i:=low(_restrictions) to High(_restrictions) do
      restrictions[i]:=_restrictions[i];
  end;
  result:=Cond;
end;

procedure TArrConditions.DelCondition(DelName: string);
var
  i, k, j: integer;   
begin
  for i:=0 to Length(Conditions)-1 do
  begin
    if DelName = Conditions[i].Name then
    begin
      k:=i;
      break;
    end;
  end;

  for i:=k to Length(Conditions)-2 do
  begin
    Conditions[i].Name:=Conditions[i+1].Name;
    Conditions[i].OV:=Conditions[i+1].OV;
    for j:=0 to Length(Conditions[i].restrictions)-1 do
      Conditions[i].restrictions[j]:=Conditions[i+1].restrictions[j];

  end;
  Conditions[Length(Conditions)-1]:=nil;
  SetLength(Conditions, Length(Conditions)-1);

end;

function TArrConditions.GetConditionOfName(FindName: string): TCondition;
var
  i: integer;
begin
  result:=nil;
  for i:=0 to length(Conditions)-1 do
  begin
    if FindName=Conditions[i].Name then
    begin
      result:=Conditions[i];
      exit;
    end;
  end;
end;

procedure TTotalFlowCompaunding.CalcOfRatios(Conzen: TArrOfDouble);  
var
 j: integer;

begin

  for j:=0 to length(Flows)-1 do
  begin
   // по идее их размеры должны быть одинаковы
    Flows[j].Expenditure:=Conzen[j];
  end; 

end;

procedure TArrConditions.SaveRatioToFile(_Path: string);
var
  i: integer;
begin
  for i:= 0 to Length(Conditions)-1 do
  begin
    StringList[i].SaveToFile(_Path+'\'+Conditions[i].Name);
  end;
  
end;

procedure TTotalFlowCompaunding.ConvertToFlow(var Flow: TFlowCompaunding; NameStr:string);
begin
  Flow.Components:=Self.Components;
  Flow.Expenditure:=Self.Expenditure;
  Flow.Name:=NameStr;
end;

function TTotalFlowCompaunding.GetFlowOfIndexOfCondition(
  Index: integer): TFlowCompaunding;
var
  i: integer;
begin
  result:=nil;
  for i:=0 to length(Flows)-1 do
  begin
    if Index=Flows[i].IndexOfCondition then
    begin
      result:=Flows[i];
    end;
  end;
end;

{procedure TTotalFlowCompaunding.SetDefaultSoot;
const
  Sootn92: array [1..12] of double = (30.829, 12.606, 21.338, 6.491, 0, 7.477, 9.223, 5.691, 0, 2.115, 2.115, 2.115);
  Sootn92_max: array [1..12] of double = (51.333, 23.044, 37.369, 18.564, 0, 12.558, 14.194, 13.815, 0, 6.08933333333333, 6.08933333333333, 6.08933333333333);
  Sootn92_min: array [1..12] of double = (20.978, 2.264, 13.018, 0.178, 0, 2.843, 4.307, 0.518, 0, 0.249333333333333, 0.249333333333333, 0.249333333333333);

  Sootn95: array [1..12] of double = (24.829, 11.794, 23.11, 4.839, 3.485, 8.345, 9.885, 7.718, 2.87, 1.042, 1.042, 1.042);
  Sootn95_max: array [1..12] of double = (43.642, 20.08, 33.882, 13.301, 8.251, 14.83, 16.66, 15.884, 6.836, 2.656, 2.656, 2.656);
  Sootn95_min: array [1..12] of double = (15.312, 0.387, 16.659, 0.407, 0.636, 5.685, 6.115, 3.863, 0.782, 0.084, 0.084, 0.084);

  Sootn98: array [1..12] of double = (11.557, 8.782, 25.678, 4.502, 7.597, 11.199, 11.334, 12.055, 7.297, 0, 0, 0);
  Sootn98_max: array [1..12] of double = (22.396, 17.325, 42.05, 7.751, 13.816, 22.654, 22.288, 20.263, 12.339, 0, 0, 0);
  Sootn98_min: array [1..12] of double = (3.49, 4.348, 21.473, 1.309, 4.455, 7.479, 5.354, 5.73, 3.526, 0, 0, 0);
var
  i: integer;
  myFlow: TFlowCompaunding;
begin
  // создаем исходные значения по соотношениям
  for i:=1 to 12 do
  begin
    myFlow:=GetFlowOfIndexOfCondition(i);
    if myFlow<>nil then
      myFlow.Expenditure:=Sootn92[i];

  end;

end;   }

{ TRatioParam }

procedure TRatioParam.Assign(var RP: TRatioParam);
var
  i: integer;
begin
  RP.Net_R600:=Net_R600;
  RP.Net_Toluol:=Net_Toluol;
  RP.Net_Butan:=Net_Butan;

  for i:=Low(FlowRatio92) to High(FlowRatio92) do
    RP.FlowRatio92:=FlowRatio92;
  RP.Lim_92_Sum_KT_GOBKK_max:=Lim_92_Sum_KT_GOBKK_max;
  RP.Lim_92_Sum_KT_GOBKK_min:=Lim_92_Sum_KT_GOBKK_min;
  RP.Lim_92_Del_KT_GOBKK_max:=Lim_92_Del_KT_GOBKK_max;
  RP.Lim_92_Del_KT_GOBKK_min:=Lim_92_Del_KT_GOBKK_min;
  RP.Curr_92_Sum_KT_GOBKK:=Curr_92_Sum_KT_GOBKK;
  RP.Curr_92_Del_KT_GOBKK:=Curr_92_Del_KT_GOBKK;
  RP.H_92_Sum_KT_GOBKK:=H_92_Sum_KT_GOBKK;
  RP.H_92_Del_KT_GOBKK:=H_92_Del_KT_GOBKK;
  RP.Lim_92_Sum_R600_R1000_max:=Lim_92_Sum_R600_R1000_max;
  RP.Lim_92_Sum_R600_R1000_min:=Lim_92_Sum_R600_R1000_min;
  RP.Lim_92_Del_R600_R1000_max:=Lim_92_Del_R600_R1000_max;
  RP.Lim_92_Del_R600_R1000_min:=Lim_92_Del_R600_R1000_min;
  RP.Curr_92_Sum_R600_R1000:=Curr_92_Sum_R600_R1000;
  RP.Curr_92_Del_R600_R1000:=Curr_92_Del_R600_R1000;
  RP.H_92_Sum_R600_R1000:=H_92_Sum_R600_R1000;
  RP.H_92_Del_R600_R1000:=H_92_Del_R600_R1000;

  RP.Lim_92_Toluol_max:= Lim_92_Toluol_max;
  RP.Lim_92_Toluol_min:= Lim_92_Toluol_min;
  RP.H_92_Toluol:= H_92_Toluol;

  RP.Lim_92_Isomer_max:= Lim_92_Isomer_max;
  RP.Lim_92_Isomer_min:= Lim_92_Isomer_min;
  RP.H_92_Isomer:= H_92_Isomer;

  RP.Lim_92_IsoPen_max:= Lim_92_IsoPen_max;
  RP.Lim_92_IsoPen_min:= Lim_92_IsoPen_min;
  RP.H_92_IsoPen:= H_92_IsoPen;
  RP.Ind_92_Isomer_IsoPen:= Ind_92_Isomer_IsoPen;

  RP.Lim_92_Alkil_max:= Lim_92_Alkil_max;
  RP.Lim_92_Alkil_min:= Lim_92_Alkil_min;
  RP.H_92_Alkil:= H_92_Alkil;

  RP.Lim_92_MTBE_max:= Lim_92_MTBE_max;
  RP.Lim_92_MTBE_min:= Lim_92_MTBE_min;
  RP.H_92_MTBE:= H_92_MTBE;


  RP.Lim_92_Prjam_max:= Lim_92_Prjam_max;
  RP.Lim_92_Prjam_min:= Lim_92_Prjam_min;
  RP.Curr_92_Del_n_but_IsoPen:= Curr_92_Del_n_but_IsoPen;
  // 95
  for i:=Low(FlowRatio95) to High(FlowRatio95) do
    RP.FlowRatio95[i]:=FlowRatio95[i];

  RP.Lim_95_Sum_KT_GOBKK_max:= Lim_95_Sum_KT_GOBKK_max;
  RP.Lim_95_Sum_KT_GOBKK_min:= Lim_95_Sum_KT_GOBKK_min;
  RP.Lim_95_Del_KT_GOBKK_max:= Lim_95_Del_KT_GOBKK_max;
  RP.Lim_95_Del_KT_GOBKK_min:= Lim_95_Del_KT_GOBKK_min;
  RP.Curr_95_Sum_KT_GOBKK:= Curr_95_Sum_KT_GOBKK;
  RP.Curr_95_Del_KT_GOBKK:= Curr_95_Del_KT_GOBKK;
  RP.H_95_Sum_KT_GOBKK:= H_95_Sum_KT_GOBKK;
  RP.H_95_Del_KT_GOBKK:= H_95_Del_KT_GOBKK;
  RP.Lim_95_Sum_R600_R1000_max:= Lim_95_Sum_R600_R1000_max;
  RP.Lim_95_Sum_R600_R1000_min:= Lim_95_Sum_R600_R1000_min;
  RP.Lim_95_Del_R600_R1000_max:= Lim_95_Del_R600_R1000_max;
  RP.Lim_95_Del_R600_R1000_min:= Lim_95_Del_R600_R1000_min;

  RP.Curr_95_Sum_R600_R1000:= Curr_95_Sum_R600_R1000;
  RP.Curr_95_Del_R600_R1000:= Curr_95_Del_R600_R1000;
  RP.H_95_Sum_R600_R1000:= H_95_Sum_R600_R1000;
  RP.H_95_Del_R600_R1000:= H_95_Del_R600_R1000;

  RP.Lim_95_Toluol_max:= Lim_95_Toluol_max;
  RP.Lim_95_Toluol_min:= Lim_95_Toluol_min;
  RP.H_95_Toluol:= H_95_Toluol;
  RP.Lim_95_Isomer_max:= Lim_95_Isomer_max;
  RP.Lim_95_Isomer_min:= Lim_95_Isomer_min;
  RP.H_95_Isomer:= H_95_Isomer;

  RP.Lim_95_IsoPen_max:= Lim_95_IsoPen_max;
  RP.Lim_95_IsoPen_min:= Lim_95_IsoPen_min;
  RP.H_95_IsoPen:= H_95_IsoPen;
  RP.Ind_95_Isomer_IsoPen:= Ind_95_Isomer_IsoPen;
  RP.Lim_95_Alkil_max:= Lim_95_Alkil_max;
  RP.Lim_95_Alkil_min:= Lim_95_Alkil_min;
  RP.H_95_Alkil:= H_95_Alkil;

  RP.Lim_95_MTBE_max:= Lim_95_MTBE_max;
  RP.Lim_95_MTBE_min:= Lim_95_MTBE_min;
  RP.H_95_MTBE:= H_95_MTBE;
  RP.Ind_95_Alkil_MTBE:= Ind_95_Alkil_MTBE;


  RP.Lim_95_Prjam_max:= Lim_95_Prjam_max;
  RP.Lim_95_Prjam_min:= Lim_95_Prjam_min;

  RP.Curr_95_Del_n_but_IsoPen:= Curr_95_Del_n_but_IsoPen;
   // 98

  for i:=Low(FlowRatio98) to High(FlowRatio98) do
    RP.FlowRatio98[i]:= FlowRatio98[i];
  RP.Lim_98_KT_max:= Lim_98_KT_max;
  RP.Lim_98_KT_min:= Lim_98_KT_min;
  RP.H_98_KT:= H_98_KT;
  RP.Lim_98_GOBKK_max:= Lim_98_GOBKK_max;
  RP.Lim_98_GOBKK_min:= Lim_98_GOBKK_min;

  RP.H_98_GOBKK:= H_98_GOBKK;
  RP.Lim_98_Sum_KT_GOBKK_max:= Lim_98_Sum_KT_GOBKK_max;
  RP.Lim_98_Sum_KT_GOBKK_min:= Lim_98_Sum_KT_GOBKK_min;
  RP.Curr_98_Sum_KT_GOBKK:= Curr_98_Sum_KT_GOBKK;
  RP.H_98_Sum_KT_GOBKK:= H_98_Sum_KT_GOBKK;

  RP.Lim_98_Del_KT_GOBKK_max:= Lim_98_Del_KT_GOBKK_max;
  RP.Lim_98_Del_KT_GOBKK_min:= Lim_98_Del_KT_GOBKK_min;
  RP.Curr_98_Del_KT_GOBKK:= Curr_98_Del_KT_GOBKK;
  RP.Lim_98_Sum_R600_R1000_max:= Lim_98_Sum_R600_R1000_max;
  RP.Lim_98_Sum_R600_R1000_min:= Lim_98_Sum_R600_R1000_min;
  RP.Lim_98_Del_R600_R1000_max:= Lim_98_Del_R600_R1000_max;
  RP.Lim_98_Del_R600_R1000_min:= Lim_98_Del_R600_R1000_min;
  RP.H_98_R600:= H_98_R600;
  RP.Curr_98_Sum_R600_R1000:= Curr_98_Sum_R600_R1000;
  RP.Curr_98_Del_R600_R1000:= Curr_98_Del_R600_R1000;

  RP.H_98_Sum_R600_R1000:= H_98_Sum_R600_R1000;
  RP.H_98_Del_R600_R1000:= H_98_Del_R600_R1000;

  RP.Lim_98_Toluol_max:= Lim_98_Toluol_max;
  RP.Lim_98_Toluol_min:= Lim_98_Toluol_min;
  RP.H_98_Toluol:= H_98_Toluol;
  RP.Lim_98_Isomer_max:= Lim_98_Isomer_max;
  RP.Lim_98_Isomer_min:= Lim_98_Isomer_min;
  RP.H_98_Isomer:= H_98_Isomer;
  RP.Lim_98_IsoPen_max:= Lim_98_IsoPen_max;
  RP.Lim_98_IsoPen_min:= Lim_98_IsoPen_min;
  RP.H_98_IsoPen:= H_98_IsoPen;
  RP.Ind_98_Isomer_IsoPen:= Ind_98_Isomer_IsoPen;

  RP.Lim_98_Alkil_max:= Lim_98_Alkil_max;
  RP.Lim_98_Alkil_min:= Lim_98_Alkil_min;
  RP.H_98_Alkil:= H_98_Alkil;

  RP.Lim_98_MTBE_max:= Lim_98_MTBE_max;
  RP.Lim_98_MTBE_min:= Lim_98_MTBE_min;
  RP.H_98_MTBE:= H_98_MTBE;

  RP.Curr_98_Del_n_but_IsoPen:= Curr_98_Del_n_but_IsoPen;

     // 80
  for i:=Low(FlowRatio80) to High(FlowRatio80) do
    RP.FlowRatio80[i]:= FlowRatio80[i];
  RP.Lim_80_R600_min:= Lim_80_R600_min;
  RP.Lim_80_KT_max:= Lim_80_KT_max;
  RP.Lim_80_KT_min:= Lim_80_KT_min;
  RP.Lim_80_Prjam_max:= Lim_80_Prjam_max;
  RP.Lim_80_Prjam_min:= Lim_80_Prjam_min;

  RP.H_80_R600:= H_80_R600;
  RP.H_80_Isomer:= H_80_Isomer;
  RP.H_80_IsoPen:= H_80_IsoPen;

  RP.Ind_80_KT_Prjam_R600:= Ind_80_KT_Prjam_R600;
  RP.Ind_80_KT_Prjam_Isomer:= Ind_80_KT_Prjam_Isomer;
  RP.Ind_80_KT_Prjam_IsoPen:= Ind_80_KT_Prjam_IsoPen;

  RP.Lim_80_Isomer_min:= Lim_80_Isomer_min;
  RP.Lim_80_Isomer_max:= Lim_80_Isomer_max;
  RP.Lim_80_IsoPen_min:= Lim_80_IsoPen_min;
  RP.Lim_80_IsoPen_max:= Lim_80_IsoPen_max;

  RP.H_80_KT:= H_80_KT;

  RP.Curr_80_Del_n_but_IsoPen:= Curr_80_Del_n_but_IsoPen;

end;

procedure TRatioParam.InitializationParam;
const
  Sootn92: array [1..13] of double = (31.56, 12.60, 21.68, 6.23, 0, 7.26, 9.07, 5.4, 0, 2.1, 2.1, 2.0, 0);

  Sootn95: array [1..13] of double = (24.86, 11.79, 23.14, 4.87, 3.44, 8.33, 9.89, 7.68, 2.87, 1.044, 1.043, 1.043, 0);

  Sootn98: array [1..13] of double = (11.56, 8.78, 25.68, 4.50, 7.3, 11.20, 11.33, 12.06, 7.3, 0, 0, 0, 0);

var
  i: integer;
  MyIniFile: TIniFile;
begin
  // 92
  for i:=1 to 13 do
    FlowRatio92[i]:=Sootn92[i];

  Lim_92_Sum_KT_GOBKK_max:=49;
  Lim_92_Sum_KT_GOBKK_min:=40;
  Lim_92_Del_KT_GOBKK_max:=0.45;
  Lim_92_Del_KT_GOBKK_min:=0.35;

  Curr_92_Sum_KT_GOBKK:=44;
  Curr_92_Del_KT_GOBKK:=0.4;

  H_92_Sum_KT_GOBKK:=0.1;
  H_92_Del_KT_GOBKK:=0.001;


  Lim_92_Sum_R600_R1000_max:=35;
  Lim_92_Sum_R600_R1000_min:=22;
  Lim_92_Del_R600_R1000_max:=0.37;
  Lim_92_Del_R600_R1000_min:=0.2;

  Curr_92_Sum_R600_R1000:=27.91;
  Curr_92_Del_R600_R1000:=0.29;

  H_92_Sum_R600_R1000:=0.1;
  H_92_Del_R600_R1000:=0.001;


  Lim_92_Toluol_max:=3;
  Lim_92_Toluol_min:=0;
  H_92_Toluol:=0.01;

  Lim_92_Isomer_max:=10;
  Lim_92_Isomer_min:=5;
  H_92_Isomer:=0.1;

  Lim_92_IsoPen_max:=11;
  Lim_92_IsoPen_min:=5;
  H_92_IsoPen:=0.1;
  Ind_92_Isomer_IsoPen:=0;

  Lim_92_Alkil_max:=10;
  Lim_92_Alkil_min:=4.5;
  H_92_Alkil:=0.1;

  Lim_92_MTBE_max:=0;
  Lim_92_MTBE_min:=0;
  H_92_MTBE:=0.1;

  Lim_92_Prjam_max:=12;
  Lim_92_Prjam_min:=0;

  Curr_92_Del_n_but_IsoPen:=0.6;

  // 95
  for i:=1 to 13 do
    FlowRatio95[i]:=Sootn95[i];

  Lim_95_Sum_KT_GOBKK_max:=45;
  Lim_95_Sum_KT_GOBKK_min:=31;
  Lim_95_Del_KT_GOBKK_max:=0.55;
  Lim_95_Del_KT_GOBKK_min:=0.42;

  Curr_95_Sum_KT_GOBKK:=36.7;
  Curr_95_Del_KT_GOBKK:=0.48;

  H_95_Sum_KT_GOBKK:=0.1;
  H_95_Del_KT_GOBKK:=0.001;


  Lim_95_Sum_R600_R1000_max:=35;
  Lim_95_Sum_R600_R1000_min:=22;
  Lim_95_Del_R600_R1000_max:=0.35;
  Lim_95_Del_R600_R1000_min:=0.1;

  Curr_95_Sum_R600_R1000:=28;
  Curr_95_Del_R600_R1000:=0.20;

  H_95_Sum_R600_R1000:=0.1;
  H_95_Del_R600_R1000:=0.001;


  Lim_95_Toluol_max:=7;
  Lim_95_Toluol_min:=0;
  H_95_Toluol:=0.01;

  Lim_95_Isomer_max:=13;
  Lim_95_Isomer_min:=5;
  H_95_Isomer:=0.1;

  Lim_95_IsoPen_max:=13;
  Lim_95_IsoPen_min:=5;
  H_95_IsoPen:=0.1;
  Ind_95_Isomer_IsoPen:=0;

  Lim_95_Alkil_max:=10;
  Lim_95_Alkil_min:=4.5;
  H_95_Alkil:=0.1;

  Lim_95_MTBE_max:=4;
  Lim_95_MTBE_min:=0;
  H_95_MTBE:=0.01;

  Ind_95_Alkil_MTBE:=0;

  Lim_95_Prjam_max:=12;
  Lim_95_Prjam_min:=0;

  Curr_95_Del_n_but_IsoPen:=0.6;

    // 98
  for i:=1 to 13 do
    FlowRatio98[i]:=Sootn98[i];

  Lim_98_KT_max:=35;
  Lim_98_KT_min:=15;
  Lim_98_Sum_KT_GOBKK_max:=30;
  Lim_98_Sum_KT_GOBKK_min:=18;
  Lim_98_Del_KT_GOBKK_max:=0.93;
  Lim_98_Del_KT_GOBKK_min:=0.5;

  Curr_98_Sum_KT_GOBKK:=20.34;
  H_98_Sum_KT_GOBKK:=0.1;
  Curr_98_Del_KT_GOBKK:=0.76;

  H_98_KT:=0.1;

  Lim_98_GOBKK_max:=30;
  Lim_98_GOBKK_min:=15;
  H_98_GOBKK:=0.1;

  Lim_98_Sum_R600_R1000_max:=35;
  Lim_98_Sum_R600_R1000_min:=22;
  Lim_98_Del_R600_R1000_max:=0.35;
  Lim_98_Del_R600_R1000_min:=0.1;

  H_98_R600:=0.1;
  Curr_98_Sum_R600_R1000:=30.18;
  Curr_98_Del_R600_R1000:=0.18;

  H_98_Sum_R600_R1000:=0.1;
  H_98_Del_R600_R1000:=0.001;


  Lim_98_Toluol_max:=10;
  Lim_98_Toluol_min:=0;
  H_98_Toluol:=0.01;

  Lim_98_Isomer_max:=12.5;
  Lim_98_Isomer_min:=5;
  H_98_Isomer:=0.1;

  Lim_98_IsoPen_max:=14;
  Lim_98_IsoPen_min:=5;
  H_98_IsoPen:=0.1;
  Ind_98_Isomer_IsoPen:=0;

  Lim_98_Alkil_max:=17;
  Lim_98_Alkil_min:=5;
  H_98_Alkil:=0.01;

  Lim_98_MTBE_max:=12;
  Lim_98_MTBE_min:=0;

  Curr_98_Del_n_but_IsoPen:=0;

  MyIniFile:= TIniFile.Create(ExtractFilePath(Application.ExeName)+'ConfigRatio.ini');

  if Net_R600 then
    MyIniFile:= TIniFile.Create(ExtractFilePath(Application.ExeName)+'ConfigRatio_Net_R600.ini');

  if Net_Toluol then
    MyIniFile:= TIniFile.Create(ExtractFilePath(Application.ExeName)+'ConfigRatio_Net_Toluol.ini');

  if Net_Butan then
    MyIniFile:= TIniFile.Create(ExtractFilePath(Application.ExeName)+'ConfigRatio_Net_Butan.ini');

  // 92
  for i:=1 to 13 do
    FlowRatio92[i]:=MyIniFile.ReadFloat('FlowRatio92', 'Conc'+IntToStr(i), 0);

  Lim_92_Sum_KT_GOBKK_max:=MyIniFile.ReadFloat('FlowRatio92', 'Lim_92_Sum_KT_GOBKK_max', 0);
  Lim_92_Sum_KT_GOBKK_min:=MyIniFile.ReadFloat('FlowRatio92', 'Lim_92_Sum_KT_GOBKK_min', 0);
  Lim_92_Del_KT_GOBKK_max:=MyIniFile.ReadFloat('FlowRatio92', 'Lim_92_Del_KT_GOBKK_max', 0);
  Lim_92_Del_KT_GOBKK_min:=MyIniFile.ReadFloat('FlowRatio92', 'Lim_92_Del_KT_GOBKK_min', 0);

  Curr_92_Sum_KT_GOBKK:=MyIniFile.ReadFloat('FlowRatio92', 'Curr_92_Sum_KT_GOBKK', 0);
  Curr_92_Del_KT_GOBKK:=MyIniFile.ReadFloat('FlowRatio92', 'Curr_92_Del_KT_GOBKK', 0);

  H_92_Sum_KT_GOBKK:=MyIniFile.ReadFloat('FlowRatio92', 'H_92_Sum_KT_GOBKK', 0);
  H_92_Del_KT_GOBKK:=MyIniFile.ReadFloat('FlowRatio92', 'H_92_Del_KT_GOBKK', 0);


  Lim_92_Sum_R600_R1000_max:=MyIniFile.ReadFloat('FlowRatio92', 'Lim_92_Sum_R600_R1000_max', 0);
  Lim_92_Sum_R600_R1000_min:=MyIniFile.ReadFloat('FlowRatio92', 'Lim_92_Sum_R600_R1000_min', 0);
  Lim_92_Del_R600_R1000_max:=MyIniFile.ReadFloat('FlowRatio92', 'Lim_92_Del_R600_R1000_max', 0);
  Lim_92_Del_R600_R1000_min:=MyIniFile.ReadFloat('FlowRatio92', 'Lim_92_Del_R600_R1000_min', 0);

  Curr_92_Sum_R600_R1000:=MyIniFile.ReadFloat('FlowRatio92', 'Curr_92_Sum_R600_R1000', 0);
  Curr_92_Del_R600_R1000:=MyIniFile.ReadFloat('FlowRatio92', 'Curr_92_Del_R600_R1000', 0);

  H_92_Sum_R600_R1000:=MyIniFile.ReadFloat('FlowRatio92', 'H_92_Sum_R600_R1000', 0);
  H_92_Del_R600_R1000:=MyIniFile.ReadFloat('FlowRatio92', 'H_92_Del_R600_R1000', 0);


  Lim_92_Toluol_max:=MyIniFile.ReadFloat('FlowRatio92', 'Lim_92_Toluol_max', 0);
  Lim_92_Toluol_min:=MyIniFile.ReadFloat('FlowRatio92', 'Lim_92_Toluol_min', 0);
  H_92_Toluol:=MyIniFile.ReadFloat('FlowRatio92', 'H_92_Toluol', 0);

  Lim_92_Isomer_max:=MyIniFile.ReadFloat('FlowRatio92', 'Lim_92_Isomer_max', 0);
  Lim_92_Isomer_min:=MyIniFile.ReadFloat('FlowRatio92', 'Lim_92_Isomer_min', 0);
  H_92_Isomer:=MyIniFile.ReadFloat('FlowRatio92', 'H_92_Isomer', 0);

  Lim_92_IsoPen_max:=MyIniFile.ReadFloat('FlowRatio92', 'Lim_92_IsoPen_max', 0);
  Lim_92_IsoPen_min:=MyIniFile.ReadFloat('FlowRatio92', 'Lim_92_IsoPen_min', 0);
  H_92_IsoPen:=MyIniFile.ReadFloat('FlowRatio92', 'H_92_IsoPen', 0);
  Ind_92_Isomer_IsoPen:=MyIniFile.ReadInteger('FlowRatio92', 'Ind_92_Isomer_IsoPen', 0);

  Lim_92_Alkil_max:=MyIniFile.ReadFloat('FlowRatio92', 'Lim_92_Alkil_max', 0);
  Lim_92_Alkil_min:=MyIniFile.ReadFloat('FlowRatio92', 'Lim_92_Alkil_min', 0);
  H_92_Alkil:=MyIniFile.ReadFloat('FlowRatio92', 'H_92_Alkil', 0);

  Lim_92_MTBE_max:=MyIniFile.ReadFloat('FlowRatio92', 'Lim_92_MTBE_max', 0);
  Lim_92_MTBE_min:=MyIniFile.ReadFloat('FlowRatio92', 'Lim_92_MTBE_min', 0);

  H_92_MTBE:=MyIniFile.ReadFloat('FlowRatio92', 'H_92_MTBE', 0);

  Lim_92_Prjam_max:=MyIniFile.ReadFloat('FlowRatio92', 'Lim_92_Prjam_max', 0);
  Lim_92_Prjam_min:=MyIniFile.ReadFloat('FlowRatio92', 'Lim_92_Prjam_min', 0);

  Curr_92_Del_n_but_IsoPen:=MyIniFile.ReadFloat('FlowRatio92', 'Curr_92_Del_n_but_IsoPen', 0);


  // 95
  for i:=1 to 13 do
    FlowRatio95[i]:=MyIniFile.ReadFloat('FlowRatio95', 'Conc'+IntToStr(i), 0);

  Lim_95_Sum_KT_GOBKK_max:=MyIniFile.ReadFloat('FlowRatio95', 'Lim_95_Sum_KT_GOBKK_max', 0);
  Lim_95_Sum_KT_GOBKK_min:=MyIniFile.ReadFloat('FlowRatio95', 'Lim_95_Sum_KT_GOBKK_min', 0);
  Lim_95_Del_KT_GOBKK_max:=MyIniFile.ReadFloat('FlowRatio95', 'Lim_95_Del_KT_GOBKK_max', 0);
  Lim_95_Del_KT_GOBKK_min:=MyIniFile.ReadFloat('FlowRatio95', 'Lim_95_Del_KT_GOBKK_min', 0);

  Curr_95_Sum_KT_GOBKK:=MyIniFile.ReadFloat('FlowRatio95', 'Curr_95_Sum_KT_GOBKK', 0);
  Curr_95_Del_KT_GOBKK:=MyIniFile.ReadFloat('FlowRatio95', 'Curr_95_Del_KT_GOBKK', 0);

  H_95_Sum_KT_GOBKK:=MyIniFile.ReadFloat('FlowRatio95', 'H_95_Sum_KT_GOBKK', 0);
  H_95_Del_KT_GOBKK:=MyIniFile.ReadFloat('FlowRatio95', 'H_95_Del_KT_GOBKK', 0);


  Lim_95_Sum_R600_R1000_max:=MyIniFile.ReadFloat('FlowRatio95', 'Lim_95_Sum_R600_R1000_max', 0);
  Lim_95_Sum_R600_R1000_min:=MyIniFile.ReadFloat('FlowRatio95', 'Lim_95_Sum_R600_R1000_min', 0);
  Lim_95_Del_R600_R1000_max:=MyIniFile.ReadFloat('FlowRatio95', 'Lim_95_Del_R600_R1000_max', 0);
  Lim_95_Del_R600_R1000_min:=MyIniFile.ReadFloat('FlowRatio95', 'Lim_95_Del_R600_R1000_min', 0);

  Curr_95_Sum_R600_R1000:=MyIniFile.ReadFloat('FlowRatio95', 'Curr_95_Sum_R600_R1000', 0);
  Curr_95_Del_R600_R1000:=MyIniFile.ReadFloat('FlowRatio95', 'Curr_95_Del_R600_R1000', 0);

  H_95_Sum_R600_R1000:=MyIniFile.ReadFloat('FlowRatio95', 'H_95_Sum_R600_R1000', 0);
  H_95_Del_R600_R1000:=MyIniFile.ReadFloat('FlowRatio95', 'H_95_Del_R600_R1000', 0);


  Lim_95_Toluol_max:=MyIniFile.ReadFloat('FlowRatio95', 'Lim_95_Toluol_max', 0);
  Lim_95_Toluol_min:=MyIniFile.ReadFloat('FlowRatio95', 'Lim_95_Toluol_min', 0);
  H_95_Toluol:=MyIniFile.ReadFloat('FlowRatio95', 'H_95_Toluol', 0);

  Lim_95_Isomer_max:=MyIniFile.ReadFloat('FlowRatio95', 'Lim_95_Isomer_max', 0);
  Lim_95_Isomer_min:=MyIniFile.ReadFloat('FlowRatio95', 'Lim_95_Isomer_min', 0);
  H_95_Isomer:=MyIniFile.ReadFloat('FlowRatio95', 'H_95_Isomer', 0);

  Lim_95_IsoPen_max:=MyIniFile.ReadFloat('FlowRatio95', 'Lim_95_IsoPen_max', 0);
  Lim_95_IsoPen_min:=MyIniFile.ReadFloat('FlowRatio95', 'Lim_95_IsoPen_min', 0);
  H_95_IsoPen:=MyIniFile.ReadFloat('FlowRatio95', 'H_95_IsoPen', 0);
  Ind_95_Isomer_IsoPen:=MyIniFile.ReadInteger('FlowRatio95', 'Ind_95_Isomer_IsoPen', 0);

  Lim_95_Alkil_max:=MyIniFile.ReadFloat('FlowRatio95', 'Lim_95_Alkil_max', 0);
  Lim_95_Alkil_min:=MyIniFile.ReadFloat('FlowRatio95', 'Lim_95_Alkil_min', 0);
  H_95_Alkil:=MyIniFile.ReadFloat('FlowRatio95', 'H_95_Alkil', 0);

  Lim_95_MTBE_max:=MyIniFile.ReadFloat('FlowRatio95', 'Lim_95_MTBE_max', 0);
  Lim_95_MTBE_min:=MyIniFile.ReadFloat('FlowRatio95', 'Lim_95_MTBE_min', 0);
  H_95_MTBE:=MyIniFile.ReadFloat('FlowRatio95', 'H_95_MTBE', 0);

  Ind_95_Alkil_MTBE:=MyIniFile.ReadInteger('FlowRatio95', 'Ind_95_Alkil_MTBE', 0);

  Lim_95_Prjam_max:=MyIniFile.ReadFloat('FlowRatio95', 'Lim_95_Prjam_max', 0);
  Lim_95_Prjam_min:=MyIniFile.ReadFloat('FlowRatio95', 'Lim_95_Prjam_min', 0);

  Curr_95_Del_n_but_IsoPen:=MyIniFile.ReadFloat('FlowRatio95', 'Curr_95_Del_n_but_IsoPen', 0);

    // 98
  for i:=1 to 13 do
    FlowRatio98[i]:=MyIniFile.ReadFloat('FlowRatio98', 'Conc'+IntToStr(i), 0);

  Lim_98_KT_max:=MyIniFile.ReadFloat('FlowRatio98', 'Lim_98_KT_max', 0);
  Lim_98_KT_min:=MyIniFile.ReadFloat('FlowRatio98', 'Lim_98_KT_min', 0);
  Lim_98_Sum_KT_GOBKK_max:=MyIniFile.ReadFloat('FlowRatio98', 'Lim_98_Sum_KT_GOBKK_max', 0);
  Lim_98_Sum_KT_GOBKK_min:=MyIniFile.ReadFloat('FlowRatio98', 'Lim_98_Sum_KT_GOBKK_min', 0);

  Curr_98_Sum_KT_GOBKK:=MyIniFile.ReadFloat('FlowRatio98', 'Curr_98_Sum_KT_GOBKK', 0);
  H_98_Sum_KT_GOBKK:=MyIniFile.ReadFloat('FlowRatio98', 'H_98_Sum_KT_GOBKK', 0);
  Curr_98_Del_KT_GOBKK:=MyIniFile.ReadFloat('FlowRatio98', 'Curr_98_Del_KT_GOBKK', 0);

  Lim_98_Del_KT_GOBKK_max:=MyIniFile.ReadFloat('FlowRatio98', 'Lim_98_Del_KT_GOBKK_max', 0);
  Lim_98_Del_KT_GOBKK_min:=MyIniFile.ReadFloat('FlowRatio98', 'Lim_98_Del_KT_GOBKK_min', 0);


  H_98_KT:=MyIniFile.ReadFloat('FlowRatio98', 'H_98_KT', 0);

  Lim_98_GOBKK_max:=MyIniFile.ReadFloat('FlowRatio98', 'Lim_98_GOBKK_max', 0);
  Lim_98_GOBKK_min:=MyIniFile.ReadFloat('FlowRatio98', 'Lim_98_GOBKK_min', 0);

  H_98_GOBKK:=MyIniFile.ReadFloat('FlowRatio98', 'H_98_GOBKK', 0);

  Lim_98_Sum_R600_R1000_max:=MyIniFile.ReadFloat('FlowRatio98', 'Lim_98_Sum_R600_R1000_max', 0);
  Lim_98_Sum_R600_R1000_min:=MyIniFile.ReadFloat('FlowRatio98', 'Lim_98_Sum_R600_R1000_min', 0);
  Lim_98_Del_R600_R1000_max:=MyIniFile.ReadFloat('FlowRatio98', 'Lim_98_Del_R600_R1000_max', 0);
  Lim_98_Del_R600_R1000_min:=MyIniFile.ReadFloat('FlowRatio98', 'Lim_98_Del_R600_R1000_min', 0);

  H_98_R600:=MyIniFile.ReadFloat('FlowRatio98', 'H_98_R600', 0);

  Curr_98_Sum_R600_R1000:=MyIniFile.ReadFloat('FlowRatio98', 'Curr_98_Sum_R600_R1000', 0);
  Curr_98_Del_R600_R1000:=MyIniFile.ReadFloat('FlowRatio98', 'Curr_98_Del_R600_R1000', 0);

  H_98_Sum_R600_R1000:=MyIniFile.ReadFloat('FlowRatio98', 'H_98_Sum_R600_R1000', 0);
  H_98_Del_R600_R1000:=MyIniFile.ReadFloat('FlowRatio98', 'H_98_Del_R600_R1000', 0);


  Lim_98_Toluol_max:=MyIniFile.ReadFloat('FlowRatio98', 'Lim_98_Toluol_max', 0);
  Lim_98_Toluol_min:=MyIniFile.ReadFloat('FlowRatio98', 'Lim_98_Toluol_min', 0);
  H_98_Toluol:=MyIniFile.ReadFloat('FlowRatio98', 'H_98_Toluol', 0);

  Lim_98_Isomer_max:=MyIniFile.ReadFloat('FlowRatio98', 'Lim_98_Isomer_max', 0);
  Lim_98_Isomer_min:=MyIniFile.ReadFloat('FlowRatio98', 'Lim_98_Isomer_min', 0);
  H_98_Isomer:=MyIniFile.ReadFloat('FlowRatio98', 'H_98_Isomer', 0);

  Lim_98_IsoPen_max:=MyIniFile.ReadFloat('FlowRatio98', 'Lim_98_IsoPen_max', 0);
  Lim_98_IsoPen_min:=MyIniFile.ReadFloat('FlowRatio98', 'Lim_98_IsoPen_min', 0);
  H_98_IsoPen:=MyIniFile.ReadFloat('FlowRatio98', 'H_98_IsoPen', 0);
  Ind_98_Isomer_IsoPen:=MyIniFile.ReadInteger('FlowRatio98', 'Ind_98_Isomer_IsoPen', 0);

  Lim_98_Alkil_max:=MyIniFile.ReadFloat('FlowRatio98', 'Lim_98_Alkil_max', 0);
  Lim_98_Alkil_min:=MyIniFile.ReadFloat('FlowRatio98', 'Lim_98_Alkil_min', 0);
  H_98_Alkil:=MyIniFile.ReadFloat('FlowRatio98', 'H_98_Alkil', 0);

  Lim_98_MTBE_max:=MyIniFile.ReadFloat('FlowRatio98', 'Lim_98_MTBE_max', 0);
  Lim_98_MTBE_min:=MyIniFile.ReadFloat('FlowRatio98', 'Lim_98_MTBE_min', 0);

  Curr_98_Del_n_but_IsoPen:=MyIniFile.ReadFloat('FlowRatio98', 'Curr_98_Del_n_but_IsoPen', 0);

  //80
  Lim_80_R600_min:=MyIniFile.ReadFloat('FlowRatio80', 'Lim_80_R600_min', 0);
  Lim_80_KT_max:=MyIniFile.ReadFloat('FlowRatio80', 'Lim_80_KT_max', 0);
  Lim_80_KT_min:=MyIniFile.ReadFloat('FlowRatio80', 'Lim_80_KT_min', 0);

  Lim_80_Prjam_max:=MyIniFile.ReadFloat('FlowRatio80', 'Lim_80_Prjam_max', 0);
  Lim_80_Prjam_min:=MyIniFile.ReadFloat('FlowRatio80', 'Lim_80_Prjam_min', 0);

  H_80_R600:=MyIniFile.ReadFloat('FlowRatio80', 'H_80_R600', 0);
  H_80_Isomer:=MyIniFile.ReadFloat('FlowRatio80', 'H_80_Isomer', 0);
  H_80_IsoPen:=MyIniFile.ReadFloat('FlowRatio80', 'H_80_IsoPen', 0);

  Ind_80_KT_Prjam_R600:=MyIniFile.ReadInteger('FlowRatio80', 'Ind_80_KT_Prjam_R600', 0);
  Ind_80_KT_Prjam_Isomer:=MyIniFile.ReadInteger('FlowRatio80', 'Ind_80_KT_Prjam_Isomer', 0);
  Ind_80_KT_Prjam_IsoPen:=MyIniFile.ReadInteger('FlowRatio80', 'Ind_80_KT_Prjam_IsoPen', 0);


  Lim_80_Isomer_min:=MyIniFile.ReadFloat('FlowRatio80', 'Lim_80_Isomer_min', 0);
  Lim_80_Isomer_max:=MyIniFile.ReadFloat('FlowRatio80', 'Lim_80_Isomer_max', 0);
  Lim_80_IsoPen_min:=MyIniFile.ReadFloat('FlowRatio80', 'Lim_80_IsoPen_min', 0);


  Lim_80_IsoPen_max:=MyIniFile.ReadFloat('FlowRatio80', 'Lim_80_IsoPen_max', 0);
  H_80_KT:=MyIniFile.ReadFloat('FlowRatio80', 'H_80_KT', 0);
  Curr_80_Del_n_but_IsoPen:=MyIniFile.ReadFloat('FlowRatio80', 'Curr_80_Del_n_but_IsoPen', 0);


end;

procedure TTotalFlowCompaunding.FlowRatioCalculation(var StringGridResult, SG1Itog: TStringGrid);
var
  Fl_GOBKK, Fl_KT, Fl_R1000, Fl_R600, Fl_Toluol,Fl_Isomer, Fl_IsoPen,
  Fl_Alkil, Fl_MTBE, Fl_Prjam1, Fl_Prjam2, Fl_Prjam3,
  Fl_n_but: TFlowCompaunding;
  j, i, k, ind_92, ind_95, ind_98, ind_80: integer;
  bool1, bool2: boolean;
  i_92, i_95, i_98, i_80: integer;
  _Kol_92, _Kol_95, _Kol_98, _Kol_80: double;
  _Cena_92, _Cena_95, _Cena_98, _Cena_80: double;

procedure UpDateFlows_92;
begin
  Fl_GOBKK.Expenditure:= RatioParam.FlowRatio92[1];
  Fl_KT.Expenditure:= RatioParam.FlowRatio92[2];
  Fl_R1000.Expenditure:= RatioParam.FlowRatio92[3];
  Fl_R600.Expenditure:= RatioParam.FlowRatio92[4];
  Fl_Toluol.Expenditure:= RatioParam.FlowRatio92[5];
  Fl_Isomer.Expenditure:= RatioParam.FlowRatio92[6];
  Fl_IsoPen.Expenditure:= RatioParam.FlowRatio92[7];
  Fl_Alkil.Expenditure:= RatioParam.FlowRatio92[8];
  Fl_MTBE.Expenditure:= RatioParam.FlowRatio92[9];
  Fl_Prjam1.Expenditure:= RatioParam.FlowRatio92[10];
  Fl_Prjam2.Expenditure:= RatioParam.FlowRatio92[11];
  Fl_Prjam3.Expenditure:= RatioParam.FlowRatio92[12];
  Fl_n_but.Expenditure:= RatioParam.FlowRatio92[13];

  TotalFlowOctaneValue;
end;

procedure UpDateFlows_95;
begin
  Fl_GOBKK.Expenditure:= RatioParam.FlowRatio95[1];
  Fl_KT.Expenditure:= RatioParam.FlowRatio95[2];
  Fl_R1000.Expenditure:= RatioParam.FlowRatio95[3];
  Fl_R600.Expenditure:= RatioParam.FlowRatio95[4];
  Fl_Toluol.Expenditure:= RatioParam.FlowRatio95[5];
  Fl_Isomer.Expenditure:= RatioParam.FlowRatio95[6];
  Fl_IsoPen.Expenditure:= RatioParam.FlowRatio95[7];
  Fl_Alkil.Expenditure:= RatioParam.FlowRatio95[8];
  Fl_MTBE.Expenditure:= RatioParam.FlowRatio95[9];
  Fl_Prjam1.Expenditure:= RatioParam.FlowRatio95[10];
  Fl_Prjam2.Expenditure:= RatioParam.FlowRatio95[11];
  Fl_Prjam3.Expenditure:= RatioParam.FlowRatio95[12];
  Fl_n_but.Expenditure:= RatioParam.FlowRatio95[13];

  TotalFlowOctaneValue;
end;
procedure UpDateFlows_98;
begin
  Fl_GOBKK.Expenditure:= RatioParam.FlowRatio98[1];
  Fl_KT.Expenditure:= RatioParam.FlowRatio98[2];
  Fl_R1000.Expenditure:= RatioParam.FlowRatio98[3];
  Fl_R600.Expenditure:= RatioParam.FlowRatio98[4];
  Fl_Toluol.Expenditure:= RatioParam.FlowRatio98[5];
  Fl_Isomer.Expenditure:= RatioParam.FlowRatio98[6];
  Fl_IsoPen.Expenditure:= RatioParam.FlowRatio98[7];
  Fl_Alkil.Expenditure:= RatioParam.FlowRatio98[8];
  Fl_MTBE.Expenditure:= RatioParam.FlowRatio98[9];
  Fl_Prjam1.Expenditure:= RatioParam.FlowRatio98[10];
  Fl_Prjam2.Expenditure:= RatioParam.FlowRatio98[11];
  Fl_Prjam3.Expenditure:= RatioParam.FlowRatio98[12];
  Fl_n_but.Expenditure:= RatioParam.FlowRatio98[13];

  TotalFlowOctaneValue;
end;

procedure UpDateFlows_80;
begin
  Fl_GOBKK.Expenditure:= RatioParam.FlowRatio80[1];
  Fl_KT.Expenditure:= RatioParam.FlowRatio80[2];
  Fl_R1000.Expenditure:= RatioParam.FlowRatio80[3];
  Fl_R600.Expenditure:= RatioParam.FlowRatio80[4];
  Fl_Toluol.Expenditure:= RatioParam.FlowRatio80[5];
  Fl_Isomer.Expenditure:= RatioParam.FlowRatio80[6];
  Fl_IsoPen.Expenditure:= RatioParam.FlowRatio80[7];
  Fl_Alkil.Expenditure:= RatioParam.FlowRatio80[8];
  Fl_MTBE.Expenditure:= RatioParam.FlowRatio80[9];
  Fl_Prjam1.Expenditure:= RatioParam.FlowRatio80[10];
  Fl_Prjam2.Expenditure:= RatioParam.FlowRatio80[11];
  Fl_Prjam3.Expenditure:= RatioParam.FlowRatio80[12];
  Fl_n_but.Expenditure:= RatioParam.FlowRatio80[13];

  TotalFlowOctaneValue;
end;

procedure BackExpenditure;
begin
  Fl_GOBKK.ExistExpenditure:=Fl_GOBKK.ExistExpenditure2;

  Fl_KT.ExistExpenditure:=Fl_KT.ExistExpenditure2;

  Fl_R1000.ExistExpenditure:=Fl_R1000.ExistExpenditure2;

  Fl_R600.ExistExpenditure:=Fl_R600.ExistExpenditure2;

  Fl_Toluol.ExistExpenditure:=Fl_Toluol.ExistExpenditure2;

  Fl_Isomer.ExistExpenditure:=Fl_Isomer.ExistExpenditure2;

  Fl_IsoPen.ExistExpenditure:=Fl_IsoPen.ExistExpenditure2;

  Fl_Alkil.ExistExpenditure:=Fl_Alkil.ExistExpenditure2;

  Fl_MTBE.ExistExpenditure:=Fl_MTBE.ExistExpenditure2;

  Fl_Prjam1.ExistExpenditure:=Fl_Prjam1.ExistExpenditure2;

  Fl_Prjam2.ExistExpenditure:=Fl_Prjam2.ExistExpenditure2;

  Fl_Prjam3.ExistExpenditure:=Fl_Prjam3.ExistExpenditure2;

  Fl_n_but.ExistExpenditure:=Fl_n_but.ExistExpenditure2;

end;


function GetExpenditure_92(BoolBack: boolean=true): double;
var
  Lim:double;
  I_Lim: integer;
begin
  if BoolBack then BackExpenditure;
  result:=0;
  Lim:=10000000;
  I_Lim:=1;
  if (RatioParam.FlowRatio92[1]>0) and (Fl_GOBKK.ExistExpenditure*100/RatioParam.FlowRatio92[1]<Lim) then
  begin
    Lim:=Fl_GOBKK.ExistExpenditure*100/RatioParam.FlowRatio92[1];
    I_Lim:=1;
  end;
  if (RatioParam.FlowRatio92[2]>0) and (Fl_KT.ExistExpenditure*100/RatioParam.FlowRatio92[2]<Lim) then
  begin
    Lim:=Fl_KT.ExistExpenditure*100/RatioParam.FlowRatio92[2];
    I_Lim:=2;
  end;
  if (RatioParam.FlowRatio92[3]>0) and (Fl_R1000.ExistExpenditure*100/RatioParam.FlowRatio92[3]<Lim) then
  begin
    Lim:=Fl_R1000.ExistExpenditure*100/RatioParam.FlowRatio92[3];
    I_Lim:=3;
  end;
  if (not RatioParam.Net_R600) and (RatioParam.FlowRatio92[4]>0)
    and (Fl_R600.ExistExpenditure*100/RatioParam.FlowRatio92[4]<Lim) then
  begin
    Lim:=Fl_R600.ExistExpenditure*100/RatioParam.FlowRatio92[4];
    I_Lim:=4;
  end;
  if (not RatioParam.Net_Toluol) and (RatioParam.FlowRatio92[5]>0) and (Fl_Toluol.ExistExpenditure*100/RatioParam.FlowRatio92[5]<Lim) then
  begin
    Lim:=Fl_Toluol.ExistExpenditure*100/RatioParam.FlowRatio92[5];
    I_Lim:=5;
  end;
  if (RatioParam.FlowRatio92[6]>0) and (Fl_Isomer.ExistExpenditure*100/RatioParam.FlowRatio92[6]<Lim) then
  begin
    Lim:=Fl_Isomer.ExistExpenditure*100/RatioParam.FlowRatio92[6];
    I_Lim:=6;
  end;
  if (RatioParam.FlowRatio92[7]>0) and (Fl_IsoPen.ExistExpenditure*100/RatioParam.FlowRatio92[7]<Lim) then
  begin
    Lim:=Fl_IsoPen.ExistExpenditure*100/RatioParam.FlowRatio92[7];
    I_Lim:=7;
  end;
  if (RatioParam.FlowRatio92[8]>0) and (Fl_Alkil.ExistExpenditure*100/RatioParam.FlowRatio92[8]<Lim) then
  begin
    Lim:=Fl_Alkil.ExistExpenditure*100/RatioParam.FlowRatio92[8];
    I_Lim:=8;
  end;
  if (RatioParam.FlowRatio92[9]>0) and (Fl_MTBE.ExistExpenditure*100/RatioParam.FlowRatio92[9]<Lim) then
  begin
    Lim:=Fl_MTBE.ExistExpenditure*100/RatioParam.FlowRatio92[9];
    I_Lim:=9;
  end;
  if (RatioParam.FlowRatio92[10]>0) and (Fl_Prjam1.ExistExpenditure*100/RatioParam.FlowRatio92[10]<Lim) then
  begin
    Lim:=Fl_Prjam1.ExistExpenditure*100/RatioParam.FlowRatio92[10];
    I_Lim:=10;
  end;
  if (RatioParam.FlowRatio92[11]>0) and (Fl_Prjam2.ExistExpenditure*100/RatioParam.FlowRatio92[11]<Lim) then
  begin
    Lim:=Fl_Prjam2.ExistExpenditure*100/RatioParam.FlowRatio92[11];
    I_Lim:=11;
  end;
  if (RatioParam.FlowRatio92[12]>0) and (Fl_Prjam3.ExistExpenditure*100/RatioParam.FlowRatio92[12]<Lim) then
  begin
    Lim:=Fl_Prjam3.ExistExpenditure*100/RatioParam.FlowRatio92[12];
    I_Lim:=12;
  end;

  if (not RatioParam.Net_Butan) and (RatioParam.FlowRatio92[13]>0) and (Fl_n_but.ExistExpenditure*100/RatioParam.FlowRatio92[13]<Lim) then
  begin
    Lim:=Fl_n_but.ExistExpenditure*100/RatioParam.FlowRatio92[13];
    I_Lim:=13;
  end;

  result:= Lim;
  if result>ArrConditions.Conditions[ind_92].restrictions[6] then
    result:=ArrConditions.Conditions[ind_92].restrictions[6];

  Fl_GOBKK.ExistExpenditure:=Fl_GOBKK.ExistExpenditure-
             result*RatioParam.FlowRatio92[1]/100;
  Fl_KT.ExistExpenditure:=Fl_KT.ExistExpenditure-
             result*RatioParam.FlowRatio92[2]/100;
  Fl_R1000.ExistExpenditure:=Fl_R1000.ExistExpenditure-
             result*RatioParam.FlowRatio92[3]/100;
  Fl_R600.ExistExpenditure:=Fl_R600.ExistExpenditure-
             result*RatioParam.FlowRatio92[4]/100;
  Fl_Toluol.ExistExpenditure:=Fl_Toluol.ExistExpenditure-
             result*RatioParam.FlowRatio92[5]/100;
  Fl_Isomer.ExistExpenditure:=Fl_Isomer.ExistExpenditure-
             result*RatioParam.FlowRatio92[6]/100;
  Fl_IsoPen.ExistExpenditure:=Fl_IsoPen.ExistExpenditure-
             result*RatioParam.FlowRatio92[7]/100;
  Fl_Alkil.ExistExpenditure:=Fl_Alkil.ExistExpenditure-
             result*RatioParam.FlowRatio92[8]/100;
  Fl_MTBE.ExistExpenditure:=Fl_MTBE.ExistExpenditure-
             result*RatioParam.FlowRatio92[9]/100;
  Fl_Prjam1.ExistExpenditure:=Fl_Prjam1.ExistExpenditure-
             result*RatioParam.FlowRatio92[10]/100;
  Fl_Prjam2.ExistExpenditure:=Fl_Prjam2.ExistExpenditure-
             result*RatioParam.FlowRatio92[11]/100;
  Fl_Prjam3.ExistExpenditure:=Fl_Prjam3.ExistExpenditure-
             result*RatioParam.FlowRatio92[12]/100;
  Fl_n_but.ExistExpenditure:=Fl_n_but.ExistExpenditure-
             result*RatioParam.FlowRatio92[13]/100;

end;

function GetExpenditure_95: double;
var

  Lim:double;
  I_Lim: integer;
begin
  result:=0;
  Lim:=10000000;
  I_Lim:=1;
  if (RatioParam.FlowRatio95[1]>0) and (Fl_GOBKK.ExistExpenditure*100/RatioParam.FlowRatio95[1]<Lim) then
  begin
    Lim:=Fl_GOBKK.ExistExpenditure*100/RatioParam.FlowRatio95[1];
    I_Lim:=1;
  end;
  if (RatioParam.FlowRatio95[2]>0) and (Fl_KT.ExistExpenditure*100/RatioParam.FlowRatio95[2]<Lim) then
  begin
    Lim:=Fl_KT.ExistExpenditure*100/RatioParam.FlowRatio95[2];
    I_Lim:=2;
  end;
  if (RatioParam.FlowRatio95[3]>0) and (Fl_R1000.ExistExpenditure*100/RatioParam.FlowRatio95[3]<Lim) then
  begin
    Lim:=Fl_R1000.ExistExpenditure*100/RatioParam.FlowRatio95[3];
    I_Lim:=3;
  end;
  if (not RatioParam.Net_R600) and (RatioParam.FlowRatio95[4]>0)
  and (Fl_R600.ExistExpenditure*100/RatioParam.FlowRatio95[4]<Lim) then
  begin
    Lim:=Fl_R600.ExistExpenditure*100/RatioParam.FlowRatio95[4];
    I_Lim:=4;
  end;
  if (not RatioParam.Net_Toluol) and (RatioParam.FlowRatio95[5]>0) and (Fl_Toluol.ExistExpenditure*100/RatioParam.FlowRatio95[5]<Lim) then
  begin
    Lim:=Fl_Toluol.ExistExpenditure*100/RatioParam.FlowRatio95[5];
    I_Lim:=5;
  end;
  if (RatioParam.FlowRatio95[6]>0) and (Fl_Isomer.ExistExpenditure*100/RatioParam.FlowRatio95[6]<Lim) then
  begin
    Lim:=Fl_Isomer.ExistExpenditure*100/RatioParam.FlowRatio95[6];
    I_Lim:=6;
  end;
  if (RatioParam.FlowRatio95[7]>0) and (Fl_IsoPen.ExistExpenditure*100/RatioParam.FlowRatio95[7]<Lim) then
  begin
    Lim:=Fl_IsoPen.ExistExpenditure*100/RatioParam.FlowRatio95[7];
    I_Lim:=7;
  end;
  if (RatioParam.FlowRatio95[8]>0) and (Fl_Alkil.ExistExpenditure*100/RatioParam.FlowRatio95[8]<Lim) then
  begin
    Lim:=Fl_Alkil.ExistExpenditure*100/RatioParam.FlowRatio95[8];
    I_Lim:=8;
  end;
  if (RatioParam.FlowRatio95[9]>0) and (Fl_MTBE.ExistExpenditure*100/RatioParam.FlowRatio95[9]<Lim) then
  begin
    Lim:=Fl_MTBE.ExistExpenditure*100/RatioParam.FlowRatio95[9];
    I_Lim:=9;
  end;
  if (RatioParam.FlowRatio95[10]>0) and (Fl_Prjam1.ExistExpenditure*100/RatioParam.FlowRatio95[10]<Lim) then
  begin
    Lim:=Fl_Prjam1.ExistExpenditure*100/RatioParam.FlowRatio95[10];
    I_Lim:=10;
  end;
  if (RatioParam.FlowRatio95[11]>0) and (Fl_Prjam2.ExistExpenditure*100/RatioParam.FlowRatio95[11]<Lim) then
  begin
    Lim:=Fl_Prjam2.ExistExpenditure*100/RatioParam.FlowRatio95[11];
    I_Lim:=11;
  end;
  if (RatioParam.FlowRatio95[12]>0) and (Fl_Prjam3.ExistExpenditure*100/RatioParam.FlowRatio95[12]<Lim) then
  begin
    Lim:=Fl_Prjam3.ExistExpenditure*100/RatioParam.FlowRatio95[12];
    I_Lim:=12;
  end;

  if (not RatioParam.Net_Butan) and (RatioParam.FlowRatio95[13]>0) and (Fl_n_but.ExistExpenditure*100/RatioParam.FlowRatio95[13]<Lim) then
  begin
    Lim:=Fl_n_but.ExistExpenditure*100/RatioParam.FlowRatio95[13];
    I_Lim:=13;
  end;

  result:= Lim;
  if result>ArrConditions.Conditions[ind_95].restrictions[6] then
    result:=ArrConditions.Conditions[ind_95].restrictions[6];

  Fl_GOBKK.ExistExpenditure:=Fl_GOBKK.ExistExpenditure-
             result*RatioParam.FlowRatio95[1]/100;
  Fl_KT.ExistExpenditure:=Fl_KT.ExistExpenditure-
             result*RatioParam.FlowRatio95[2]/100;
  Fl_R1000.ExistExpenditure:=Fl_R1000.ExistExpenditure-
             result*RatioParam.FlowRatio95[3]/100;
  Fl_R600.ExistExpenditure:=Fl_R600.ExistExpenditure-
             result*RatioParam.FlowRatio95[4]/100;
  Fl_Toluol.ExistExpenditure:=Fl_Toluol.ExistExpenditure-
             result*RatioParam.FlowRatio95[5]/100;
  Fl_Isomer.ExistExpenditure:=Fl_Isomer.ExistExpenditure-
             result*RatioParam.FlowRatio95[6]/100;
  Fl_IsoPen.ExistExpenditure:=Fl_IsoPen.ExistExpenditure-
             result*RatioParam.FlowRatio95[7]/100;
  Fl_Alkil.ExistExpenditure:=Fl_Alkil.ExistExpenditure-
             result*RatioParam.FlowRatio95[8]/100;
  Fl_MTBE.ExistExpenditure:=Fl_MTBE.ExistExpenditure-
             result*RatioParam.FlowRatio95[9]/100;
  Fl_Prjam1.ExistExpenditure:=Fl_Prjam1.ExistExpenditure-
             result*RatioParam.FlowRatio95[10]/100;
  Fl_Prjam2.ExistExpenditure:=Fl_Prjam2.ExistExpenditure-
             result*RatioParam.FlowRatio95[11]/100;
  Fl_Prjam3.ExistExpenditure:=Fl_Prjam3.ExistExpenditure-
             result*RatioParam.FlowRatio95[12]/100;
  Fl_n_but.ExistExpenditure:=Fl_n_but.ExistExpenditure-
             result*RatioParam.FlowRatio95[13]/100;
end;

function GetExpenditure_98: double;
var

  Lim:double;
  I_Lim: integer;
begin
  result:=0;
  Lim:=10000000;
  I_Lim:=1;
  if (RatioParam.FlowRatio98[1]>0) and (Fl_GOBKK.ExistExpenditure*100/RatioParam.FlowRatio98[1]<Lim) then
  begin
    Lim:=Fl_GOBKK.ExistExpenditure*100/RatioParam.FlowRatio98[1];
    I_Lim:=1;
  end;
  if (RatioParam.FlowRatio98[2]>0) and (Fl_KT.ExistExpenditure*100/RatioParam.FlowRatio98[2]<Lim) then
  begin
    Lim:=Fl_KT.ExistExpenditure*100/RatioParam.FlowRatio98[2];
    I_Lim:=2;
  end;
  if (RatioParam.FlowRatio98[3]>0) and (Fl_R1000.ExistExpenditure*100/RatioParam.FlowRatio98[3]<Lim) then
  begin
    Lim:=Fl_R1000.ExistExpenditure*100/RatioParam.FlowRatio98[3];
    I_Lim:=3;
  end;
  if (not RatioParam.Net_R600) and (RatioParam.FlowRatio98[4]>0)
    and (Fl_R600.ExistExpenditure*100/RatioParam.FlowRatio98[4]<Lim) then
  begin
    Lim:=Fl_R600.ExistExpenditure*100/RatioParam.FlowRatio98[4];
    I_Lim:=4;
  end;
  if (not RatioParam.Net_Toluol) and (RatioParam.FlowRatio98[5]>0) and (Fl_Toluol.ExistExpenditure*100/RatioParam.FlowRatio98[5]<Lim) then
  begin
    Lim:=Fl_Toluol.ExistExpenditure*100/RatioParam.FlowRatio98[5];
    I_Lim:=5;
  end;
  if (RatioParam.FlowRatio98[6]>0) and (Fl_Isomer.ExistExpenditure*100/RatioParam.FlowRatio98[6]<Lim) then
  begin
    Lim:=Fl_Isomer.ExistExpenditure*100/RatioParam.FlowRatio98[6];
    I_Lim:=6;
  end;
  if (RatioParam.FlowRatio98[7]>0) and (Fl_IsoPen.ExistExpenditure*100/RatioParam.FlowRatio98[7]<Lim) then
  begin
    Lim:=Fl_IsoPen.ExistExpenditure*100/RatioParam.FlowRatio98[7];
    I_Lim:=7;
  end;
  if (RatioParam.FlowRatio98[8]>0) and (Fl_Alkil.ExistExpenditure*100/RatioParam.FlowRatio98[8]<Lim) then
  begin
    Lim:=Fl_Alkil.ExistExpenditure*100/RatioParam.FlowRatio98[8];
    I_Lim:=8;
  end;
  if (RatioParam.FlowRatio98[9]>0) and (Fl_MTBE.ExistExpenditure*100/RatioParam.FlowRatio98[9]<Lim) then
  begin
    Lim:=Fl_MTBE.ExistExpenditure*100/RatioParam.FlowRatio98[9];
    I_Lim:=9;
  end;
  if (RatioParam.FlowRatio98[10]>0) and (Fl_Prjam1.ExistExpenditure*100/RatioParam.FlowRatio98[10]<Lim) then
  begin
    Lim:=Fl_Prjam1.ExistExpenditure*100/RatioParam.FlowRatio98[10];
    I_Lim:=10;
  end;
  if (RatioParam.FlowRatio98[11]>0) and (Fl_Prjam2.ExistExpenditure*100/RatioParam.FlowRatio98[11]<Lim) then
  begin
    Lim:=Fl_Prjam2.ExistExpenditure*100/RatioParam.FlowRatio98[11];
    I_Lim:=11;
  end;
  if (RatioParam.FlowRatio98[12]>0) and (Fl_Prjam3.ExistExpenditure*100/RatioParam.FlowRatio98[12]<Lim) then
  begin
    Lim:=Fl_Prjam3.ExistExpenditure*100/RatioParam.FlowRatio98[12];
    I_Lim:=12;
  end;

  if (not RatioParam.Net_Butan) and (RatioParam.FlowRatio98[13]>0) and (Fl_n_but.ExistExpenditure*100/RatioParam.FlowRatio98[13]<Lim) then
  begin
    Lim:=Fl_n_but.ExistExpenditure*100/RatioParam.FlowRatio98[13];
    I_Lim:=13;
  end;

  result:= Lim;
  if result>ArrConditions.Conditions[ind_98].restrictions[6] then
    result:=ArrConditions.Conditions[ind_98].restrictions[6];

  Fl_GOBKK.ExistExpenditure:=Fl_GOBKK.ExistExpenditure-
             result*RatioParam.FlowRatio98[1]/100;
  Fl_KT.ExistExpenditure:=Fl_KT.ExistExpenditure-
             result*RatioParam.FlowRatio98[2]/100;
  Fl_R1000.ExistExpenditure:=Fl_R1000.ExistExpenditure-
             result*RatioParam.FlowRatio98[3]/100;
  Fl_R600.ExistExpenditure:=Fl_R600.ExistExpenditure-
             result*RatioParam.FlowRatio98[4]/100;
  Fl_Toluol.ExistExpenditure:=Fl_Toluol.ExistExpenditure-
             result*RatioParam.FlowRatio98[5]/100;
  Fl_Isomer.ExistExpenditure:=Fl_Isomer.ExistExpenditure-
             result*RatioParam.FlowRatio98[6]/100;
  Fl_IsoPen.ExistExpenditure:=Fl_IsoPen.ExistExpenditure-
             result*RatioParam.FlowRatio98[7]/100;
  Fl_Alkil.ExistExpenditure:=Fl_Alkil.ExistExpenditure-
             result*RatioParam.FlowRatio98[8]/100;
  Fl_MTBE.ExistExpenditure:=Fl_MTBE.ExistExpenditure-
             result*RatioParam.FlowRatio98[9]/100;
  Fl_Prjam1.ExistExpenditure:=Fl_Prjam1.ExistExpenditure-
             result*RatioParam.FlowRatio98[10]/100;
  Fl_Prjam2.ExistExpenditure:=Fl_Prjam2.ExistExpenditure-
             result*RatioParam.FlowRatio98[11]/100;
  Fl_Prjam3.ExistExpenditure:=Fl_Prjam3.ExistExpenditure-
             result*RatioParam.FlowRatio98[12]/100;
  Fl_n_but.ExistExpenditure:=Fl_n_but.ExistExpenditure-
             result*RatioParam.FlowRatio98[13]/100;

end;

function GetExpenditure_80: double;
var
  Lim:double;
  I_Lim: integer;
begin

  result:=0;
  Lim:=100000000;
  I_Lim:=1;
  if (RatioParam.FlowRatio80[1]>0) and (Fl_GOBKK.ExistExpenditure*100/RatioParam.FlowRatio80[1]<Lim) then
  begin
    Lim:=Fl_GOBKK.ExistExpenditure*100/RatioParam.FlowRatio80[1];
    I_Lim:=1;
  end;
  if (RatioParam.FlowRatio80[2]>0) and (Fl_KT.ExistExpenditure*100/RatioParam.FlowRatio80[2]<Lim) then
  begin
    Lim:=Fl_KT.ExistExpenditure*100/RatioParam.FlowRatio80[2];
    I_Lim:=2;
  end;
  if (RatioParam.FlowRatio80[3]>0) and (Fl_R1000.ExistExpenditure*100/RatioParam.FlowRatio80[3]<Lim) then
  begin
    Lim:=Fl_R1000.ExistExpenditure*100/RatioParam.FlowRatio80[3];
    I_Lim:=3;
  end;
  if (not RatioParam.Net_R600) and (RatioParam.FlowRatio80[4]>0)
    and (Fl_R600.ExistExpenditure*100/RatioParam.FlowRatio80[4]<Lim) then
  begin
    Lim:=Fl_R600.ExistExpenditure*100/RatioParam.FlowRatio80[4];
    I_Lim:=4;
  end;
  if (not RatioParam.Net_Toluol) and (RatioParam.FlowRatio80[5]>0) and (Fl_Toluol.ExistExpenditure*100/RatioParam.FlowRatio80[5]<Lim) then
  begin
    Lim:=Fl_Toluol.ExistExpenditure*100/RatioParam.FlowRatio80[5];
    I_Lim:=5;
  end;
  if (RatioParam.FlowRatio80[6]>0) and (Fl_Isomer.ExistExpenditure*100/RatioParam.FlowRatio80[6]<Lim) then
  begin
    Lim:=Fl_Isomer.ExistExpenditure*100/RatioParam.FlowRatio80[6];
    I_Lim:=6;
  end;
  if (RatioParam.FlowRatio80[7]>0) and (Fl_IsoPen.ExistExpenditure*100/RatioParam.FlowRatio80[7]<Lim) then
  begin
    Lim:=Fl_IsoPen.ExistExpenditure*100/RatioParam.FlowRatio80[7];
    I_Lim:=7;
  end;
  if (RatioParam.FlowRatio80[8]>0) and (Fl_Alkil.ExistExpenditure*100/RatioParam.FlowRatio80[8]<Lim) then
  begin
    Lim:=Fl_Alkil.ExistExpenditure*100/RatioParam.FlowRatio80[8];
    I_Lim:=8;
  end;
  if (RatioParam.FlowRatio80[9]>0) and (Fl_MTBE.ExistExpenditure*100/RatioParam.FlowRatio80[9]<Lim) then
  begin
    Lim:=Fl_MTBE.ExistExpenditure*100/RatioParam.FlowRatio80[9];
    I_Lim:=9;
  end;
  if (RatioParam.FlowRatio80[10]>0) and (Fl_Prjam1.ExistExpenditure*100/RatioParam.FlowRatio80[10]<Lim) then
  begin
    Lim:=Fl_Prjam1.ExistExpenditure*100/RatioParam.FlowRatio80[10];
    I_Lim:=10;
  end;
  if (RatioParam.FlowRatio80[11]>0) and (Fl_Prjam2.ExistExpenditure*100/RatioParam.FlowRatio80[11]<Lim) then
  begin
    Lim:=Fl_Prjam2.ExistExpenditure*100/RatioParam.FlowRatio92[11];
    I_Lim:=11;
  end;
  if (RatioParam.FlowRatio80[12]>0) and (Fl_Prjam3.ExistExpenditure*100/RatioParam.FlowRatio80[12]<Lim) then
  begin
    Lim:=Fl_Prjam3.ExistExpenditure*100/RatioParam.FlowRatio80[12];
    I_Lim:=12;
  end;
  if (not RatioParam.Net_Butan) and (RatioParam.FlowRatio80[13]>0) and (Fl_n_but.ExistExpenditure*100/RatioParam.FlowRatio80[13]<Lim) then
  begin
    Lim:=Fl_n_but.ExistExpenditure*100/RatioParam.FlowRatio80[13];
    I_Lim:=13;
  end;

  result:= Lim;
  if result>ArrConditions.Conditions[ind_80].restrictions[6] then
    result:=ArrConditions.Conditions[ind_80].restrictions[6];

  Fl_GOBKK.ExistExpenditure:=Fl_GOBKK.ExistExpenditure-
             result*RatioParam.FlowRatio80[1]/100;
  Fl_KT.ExistExpenditure:=Fl_KT.ExistExpenditure-
             result*RatioParam.FlowRatio80[2]/100;
  Fl_R1000.ExistExpenditure:=Fl_R1000.ExistExpenditure-
             result*RatioParam.FlowRatio80[3]/100;
  Fl_R600.ExistExpenditure:=Fl_R600.ExistExpenditure-
             result*RatioParam.FlowRatio80[4]/100;
  Fl_Toluol.ExistExpenditure:=Fl_Toluol.ExistExpenditure-
             result*RatioParam.FlowRatio80[5]/100;
  Fl_Isomer.ExistExpenditure:=Fl_Isomer.ExistExpenditure-
             result*RatioParam.FlowRatio80[6]/100;
  Fl_IsoPen.ExistExpenditure:=Fl_IsoPen.ExistExpenditure-
             result*RatioParam.FlowRatio80[7]/100;
  Fl_Alkil.ExistExpenditure:=Fl_Alkil.ExistExpenditure-
             result*RatioParam.FlowRatio80[8]/100;
  Fl_MTBE.ExistExpenditure:=Fl_MTBE.ExistExpenditure-
             result*RatioParam.FlowRatio80[9]/100;
  Fl_Prjam1.ExistExpenditure:=Fl_Prjam1.ExistExpenditure-
             result*RatioParam.FlowRatio80[10]/100;
  Fl_Prjam2.ExistExpenditure:=Fl_Prjam2.ExistExpenditure-
             result*RatioParam.FlowRatio80[11]/100;
  Fl_Prjam3.ExistExpenditure:=Fl_Prjam3.ExistExpenditure-
             result*RatioParam.FlowRatio80[12]/100;
  Fl_n_but.ExistExpenditure:=Fl_n_but.ExistExpenditure-
             result*RatioParam.FlowRatio80[13]/100;
end;


function GetSum(Arr: Array of double): double;
var
  i: integer;
begin
  result:=0;
  for i:=0 to 11 do
  begin
    result:=result+Arr[i];
  end;
end;

procedure Raspred_92_95_98;
var
  procent_92, procent_95: double;
  treb_kol_92, treb_kol_95, treb_kol_98, treb_kol_80: double;
  GE_92, GE_95, GE_98 : double;
  GE_92_old, GE_95_old, GE_98_old : double;
  h: double;
begin
  procent_95:=100;

  procent_92:=100;
  h:=0.01;

  if (ind_92>-1) then
    treb_kol_92:=ArrConditions.Conditions[ind_92].restrictions[6];

  if (ind_95>-1) then
    treb_kol_95:=ArrConditions.Conditions[ind_95].restrictions[6];

  if (ind_98>-1) then
    treb_kol_98:=ArrConditions.Conditions[ind_98].restrictions[6];

  if (ind_80>-1) then
    treb_kol_80:=ArrConditions.Conditions[ind_80].restrictions[6];


  // уменьшаем 92 и  увеличиваем 95
  if (ind_92>-1) and (ind_95>-1) then
  begin
    GE_92:=GetExpenditure_92;
    GE_95:=GetExpenditure_95;

    while GE_95<ArrConditions.Conditions[ind_95].restrictions[6]*
       ArrConditions.Conditions[ind_95].restrictions[8]/100  do
    begin
      GE_92_old:=GE_92;
      GE_95_old:=GE_95;
      GE_98_old:=GE_98;
      procent_92:=procent_92-h;
      if procent_92<ArrConditions.Conditions[ind_92].restrictions[8] then
        break;

      if GetExpenditure_92>treb_kol_92*
        ArrConditions.Conditions[ind_92].restrictions[8]/100
      then
      begin
        ArrConditions.Conditions[ind_92].restrictions[6]:=treb_kol_92*procent_92/100;

        GE_92:=GetExpenditure_92;
        GE_95:=GetExpenditure_95;
        if (GE_98=GE_98_old) and(GE_95=GE_95_old) then
        begin
          procent_92:=procent_92+h;
          ArrConditions.Conditions[ind_92].restrictions[6]:=treb_kol_92*procent_92/100;

          break;
        end;
      end
      else
      begin
        Break;
      end;

    end;
  end;

  // уменьшаем 92 и увеличиваем 98
  if (ind_92>-1) and (ind_95>-1) and (ind_98>-1) then
  begin

    GE_92:=GetExpenditure_92;
    GE_95:=GetExpenditure_95;
    GE_98:=GetExpenditure_98;


    while GE_98<ArrConditions.Conditions[ind_98].restrictions[6]*
       ArrConditions.Conditions[ind_98].restrictions[8]/100  do
    begin
      GE_92_old:=GE_92;
      GE_95_old:=GE_95;
      GE_98_old:=GE_98;

      procent_92:=procent_92-h;
      if procent_92<ArrConditions.Conditions[ind_92].restrictions[8] then
        break;

      if GetExpenditure_92>treb_kol_92*
        ArrConditions.Conditions[ind_92].restrictions[8]/100
      then
      begin
        ArrConditions.Conditions[ind_92].restrictions[6]:=treb_kol_92*procent_92/100;

        GE_92:=GetExpenditure_92;
        GE_95:=GetExpenditure_95;
        GE_98:=GetExpenditure_98;

        if (GE_98=GE_98_old) and(GE_95=GE_95_old) then
        begin
          procent_92:=procent_92+h;
          ArrConditions.Conditions[ind_92].restrictions[6]:=treb_kol_92*procent_92/100;

          break;
        end;
      end
      else
      begin
        Break;
      end;

    end;
  end;

  // уменьшаем 95 и увеличиваем 98
  if (ind_92>-1) and (ind_95>-1) and (ind_98>-1) then
  begin

    GE_92:=GetExpenditure_92;
    GE_95:=GetExpenditure_95;
    GE_98:=GetExpenditure_98;

    if GE_95<ArrConditions.Conditions[ind_95].restrictions[6]
    then
      procent_95:=GE_95/ArrConditions.Conditions[ind_95].restrictions[6]*100;

    while GE_98<ArrConditions.Conditions[ind_98].restrictions[6]*
       ArrConditions.Conditions[ind_98].restrictions[8]/100  do
    begin
      GE_92_old:=GE_92;
      GE_95_old:=GE_95;
      GE_98_old:=GE_98;
      procent_95:=procent_95-h;
      if procent_95<ArrConditions.Conditions[ind_95].restrictions[8] then
        break;

      GE_92:=GetExpenditure_92;
      GE_95:=GetExpenditure_95;
      if GE_95>treb_kol_95*
        ArrConditions.Conditions[ind_95].restrictions[8]/100
      then
      begin
        ArrConditions.Conditions[ind_95].restrictions[6]:=treb_kol_95*procent_95/100;

        GE_92:=GetExpenditure_92;
        GE_95:=GetExpenditure_95;
        GE_98:=GetExpenditure_98;

        if (GE_98=GE_98_old) and(GE_95=GE_95_old) then
        begin
          procent_95:=procent_95+h;
          ArrConditions.Conditions[ind_95].restrictions[6]:=treb_kol_95*procent_95/100;

          break;
        end;
      end
      else
      begin
        Break;
      end;

    end;
  end;

  // остатки на 92
  if (ind_92>-1) and (ind_95>-1) and (ind_98>-1) then
  begin
    GE_92:=GetExpenditure_92(false);
    if treb_kol_92>ArrConditions.Conditions[ind_92].restrictions[6]+GE_92
    then
    begin
      ArrConditions.Conditions[ind_92].restrictions[6]:=ArrConditions.Conditions[ind_92].restrictions[6]+
               GE_92;
    end
    else
    begin
      ArrConditions.Conditions[ind_92].restrictions[6]:=treb_kol_92;
    end;
  end;


  if (ind_92>-1) and (GetExpenditure_92<treb_kol_92)
  then
    CreateMessageDialog('Объем выпуска '+ArrConditions.Conditions[ind_92].Name+' не соответствует требуемому',
      mtInformation, [mbOK]).ShowModal;

  if (ind_95>-1) and (GetExpenditure_95<treb_kol_95)
  then
    CreateMessageDialog('Объем выпуска '+ArrConditions.Conditions[ind_95].Name+' не соответствует требуемому',
      mtInformation, [mbOK]).ShowModal;

  if (ind_98>-1) and (GetExpenditure_98<treb_kol_98)
  then
    CreateMessageDialog('Объем выпуска '+ArrConditions.Conditions[ind_98].Name+' не соответствует требуемому',
      mtInformation, [mbOK]).ShowModal;
  if (ind_80>-1) and (GetExpenditure_80<treb_kol_80)
  then
    CreateMessageDialog('Объем выпуска '+ArrConditions.Conditions[ind_80].Name+' не соответствует требуемому',
      mtInformation, [mbOK]).ShowModal;

end;



begin

  Fl_GOBKK:=GetFlowOfIndexOfCondition(1);
  Fl_KT:=GetFlowOfIndexOfCondition(2);
  Fl_R1000:=GetFlowOfIndexOfCondition(3);
  Fl_R600:=GetFlowOfIndexOfCondition(4);
  Fl_Toluol:=GetFlowOfIndexOfCondition(5);
  Fl_Isomer:=GetFlowOfIndexOfCondition(6);
  Fl_IsoPen:=GetFlowOfIndexOfCondition(7);
  Fl_Alkil:=GetFlowOfIndexOfCondition(8);
  Fl_MTBE:=GetFlowOfIndexOfCondition(9);
  Fl_Prjam1:=GetFlowOfIndexOfCondition(10);
  Fl_Prjam2:=GetFlowOfIndexOfCondition(11);
  Fl_Prjam3:=GetFlowOfIndexOfCondition(12);

  // 04.06.2015
  Fl_n_but:=GetFlowOfIndexOfCondition(13);




  BackExpenditure;

  RatioParam.Net_R600:=false;
  if Fl_R600.ExistExpenditure=0 then
  begin
    RatioParam.Net_R600:=true;

  end;

  RatioParam.Net_Toluol:=false;
  if Fl_Toluol.ExistExpenditure=0 then
  begin
    RatioParam.Net_Toluol:=true;
  end;

  RatioParam.Net_Butan:=false;
  if Fl_n_but.ExistExpenditure=0 then
  begin
    RatioParam.Net_Butan:=true;
  end;

  RatioParam.InitializationParam;



  ind_92:=-1;
  ind_95:=-1;
  ind_98:=-1;
  ind_80:=-1;

  i_92:=-1;
  i_95:=-1;
  i_98:=-1;
  i_80:=-1;

  for i:=0 to length(ArrConditions.Conditions)-1 do
  begin
    if ArrConditions.Conditions[i].OV=92 then ind_92:=i;
    if ArrConditions.Conditions[i].OV=95 then ind_95:=i;
    if ArrConditions.Conditions[i].OV=98 then ind_98:=i;
    if ArrConditions.Conditions[i].OV=80 then ind_80:=i;

  end;

  StringGridResult.RowCount:=9;
  StringGridResult.ColCount:=1;



  if ind_92>-1 then
  begin
    // подбор 92
    UpDateFlows_92;

    bool1:=false;
    bool2:=false;

    //Sera для 92
    while abs(GetConcSera-ArrConditions.Conditions[ind_92].restrictions[5])/
           ArrConditions.Conditions[ind_92].restrictions[5]>0.01 do
    begin
      if GetConcSera-ArrConditions.Conditions[ind_92].restrictions[5]>0 then
      begin
        if not RatioParam.Step_92_Del_KT_GOBKK_Minus then
        begin
          if not RatioParam.Step_92_Sum_KT_GOBKK_Minus then
            break;
       end;
        UpDateFlows_92;
        bool1:=true;
      end;
      if GetConcSera-ArrConditions.Conditions[ind_92].restrictions[5]<0 then
      begin
        if not RatioParam.Step_92_Del_KT_GOBKK_Plus then
        begin
          if not RatioParam.Step_92_Sum_KT_GOBKK_Plus then
            break;
        end;
        UpDateFlows_92;
        bool2:=true;
      end;
      if (bool1 and bool2) then
        break;
    end;
    bool1:=false;
    bool2:=false;

    //ShowMessage(FloatToStr(GetSum(RatioParam.FlowRatio92)));

    //Benzol для 92
    while abs(GetConcBenzol-ArrConditions.Conditions[ind_92].restrictions[2])/
           ArrConditions.Conditions[ind_92].restrictions[2]>0.01 do
    begin
      if GetConcBenzol-ArrConditions.Conditions[ind_92].restrictions[2]>0 then
      begin
        if RatioParam.Net_R600 then
        begin
          if not RatioParam.Step_92_Sum_R600_R1000_Minus then
              break;
        end
        else
        begin
          if not RatioParam.Step_92_Del_R600_R1000_Minus then
          begin
            if not RatioParam.Step_92_Sum_R600_R1000_Minus then
              break;
          end;
        end;
        UpDateFlows_92;
        bool1:=true;
      end;
      if GetConcBenzol-ArrConditions.Conditions[ind_92].restrictions[2]<0 then
      begin
        if RatioParam.Net_R600 then
        begin
          if not RatioParam.Step_92_Sum_R600_R1000_Plus then
              break;

        end
        else
        begin
          if not RatioParam.Step_92_Del_R600_R1000_Plus then
          begin
            if not RatioParam.Step_92_Sum_R600_R1000_Plus then
              break;
          end;
        end;
        UpDateFlows_92;
        bool2:=true;
      end;
      if (bool1 and bool2) then
        break;
    end;

    bool1:=false;
    bool2:=false;

    //ShowMessage(FloatToStr(GetSum(RatioParam.FlowRatio92)));

    //Arom для 92
    while abs(GetConcArom-ArrConditions.Conditions[ind_92].restrictions[3])/
           ArrConditions.Conditions[ind_92].restrictions[3]>0.0001 do
    begin
      if GetConcArom-ArrConditions.Conditions[ind_92].restrictions[3]>0 then
      begin

        if not RatioParam.Step_92_Sum_R600_R1000_Minus then
          break;

        UpDateFlows_92;
      end
      else
        break;

    end;

    bool1:=false;
    bool2:=false;

    //ShowMessage(FloatToStr(GetSum(RatioParam.FlowRatio92)));

    //ДНП для 92
    while abs(GetDNP+0.1-ArrConditions.Conditions[ind_92].restrictions[0])/
           ArrConditions.Conditions[ind_92].restrictions[0]>0.001 do
    begin
      if GetDNP+0.1-ArrConditions.Conditions[ind_92].restrictions[0]>0 then
      begin
        if not RatioParam.Step_92_Sum_Isomer_IsoPen_Minus then
        begin
          break;
        end;
        UpDateFlows_92;
        bool1:=true;
      end;
      if GetDNP+0.1-ArrConditions.Conditions[ind_92].restrictions[0]<0 then
      begin
        if not RatioParam.Step_92_Sum_Isomer_IsoPen_Plus then
        begin
          break;
        end;
        UpDateFlows_92;
        bool2:=true;
      end;
      if (bool1 and bool2) then
        break;
    end;

    bool1:=false;
    bool2:=false;

    //ShowMessage(FloatToStr(GetSum(RatioParam.FlowRatio92)));

    //ОЧ для 92
    while abs(TotalFlowOctaneValue-ArrConditions.Conditions[ind_92].OV)/
           ArrConditions.Conditions[ind_92].OV>0.0005 do
    begin
      if TotalFlowOctaneValue-ArrConditions.Conditions[ind_92].OV>0 then
      begin
        if not RatioParam.Step_92_Sum_MTBE_Minus then
        begin
          if not RatioParam.Step_92_Sum_Toluol_Minus then
          begin
            if not RatioParam.Step_92_Sum_Alkil_Minus then
            begin
              break;
            end;
          end;
        end;
        UpDateFlows_92;
        bool1:=true;
      end;
      if TotalFlowOctaneValue-ArrConditions.Conditions[ind_92].OV<0 then
      begin
        if not RatioParam.Step_92_Sum_Alkil_Plus then
        begin
          if not RatioParam.Step_92_Sum_Toluol_Plus then
          begin
            if not RatioParam.Step_92_Sum_MTBE_Plus then
            begin
              break;
            end;
          end;
        end;
        UpDateFlows_92;
        bool2:=true;
      end;
      if (bool1 and bool2) then
        break;
    end;

    //ShowMessage(FloatToStr(GetSum(RatioParam.FlowRatio92)));

    i:=StringGridResult.ColCount;
    StringGridResult.ColCount:=i+1;
    StringGridResult.Cells[0,0]:='Параметр';

    StringGridResult.Cells[i,0]:=ArrConditions.Conditions[ind_92].Name;
    StringGridResult.Cells[0,1]:='Факт.ОЧИ';
    StringGridResult.Cells[i,1]:=FloatToStr(roundto(TotalFlowOctaneValue,0));
    StringGridResult.Cells[0,2]:='Факт.ДНП';
    StringGridResult.Cells[i,2]:=FloatToStr(roundto(GetDNP,-2));
    StringGridResult.Cells[0,3]:='Факт.Бенз.';
    StringGridResult.Cells[i,3]:=FloatToStr(roundto(GetConcBenzol,-2));
    StringGridResult.Cells[0,4]:='Факт.Аром.';
    StringGridResult.Cells[i,4]:=FloatToStr(roundto(GetConcArom,-2));
    StringGridResult.Cells[0,5]:='Факт.Олеф.';
    StringGridResult.Cells[i,5]:=FloatToStr(roundto(GetConcOlef,-2));
    StringGridResult.Cells[0,6]:='Факт.Сера';
    StringGridResult.Cells[i,6]:=FloatToStr(roundto(GetConcSera, -4));
    StringGridResult.Cells[0,7]:='Факт.Кол-во';
    StringGridResult.Cells[i,7]:=FloatToStr(roundto(GetExpenditure_92,-2));
    StringGridResult.Cells[0,8]:='Факт.ОЧМ';
    StringGridResult.Cells[i,8]:=FloatToStr(roundto(TotalFlowOctaneValue(false),0));

    i_92:=i;
    SG1Itog.Cells[0,0]:='Поток';
    SG1Itog.ColCount:=i+1;
    SG1Itog.Cells[i,0]:=ArrConditions.Conditions[ind_92].Name;
    For j:=1 to 13 do
    begin
      if GetFlowOfIndexOfCondition(j)<>nil then
      begin
        SG1Itog.Cells[0,j]:=GetFlowOfIndexOfCondition(j).Name;
        SG1Itog.Cells[i,j]:=FloatToStr(roundto(RatioParam.FlowRatio92[j],-1));
      end;
    end;

  end;


  if ind_95>-1 then
  begin
    //подбор 95


    UpDateFlows_95;

    bool1:=false;
    bool2:=false;
    TotalFlowOctaneValue;
    //Sera для 95
    while abs(GetConcSera-ArrConditions.Conditions[ind_95].restrictions[5])/
           ArrConditions.Conditions[ind_95].restrictions[5]>0.01 do
    begin

      if GetConcSera-ArrConditions.Conditions[ind_95].restrictions[5]>0 then
      begin
        if not RatioParam.Step_95_Del_KT_GOBKK_Minus then
        begin
          if not RatioParam.Step_95_Sum_KT_GOBKK_Minus then
            break;
        end;

        UpDateFlows_95;
        bool1:=true;
      end;
      if GetConcSera-ArrConditions.Conditions[ind_95].restrictions[5]<0 then
      begin
        if not RatioParam.Step_95_Del_KT_GOBKK_Plus then
        begin
          if not RatioParam.Step_95_Sum_KT_GOBKK_Plus then
            break;
        end;
        //ShowMessage(FloatToStr(GetSum(RatioParam.FlowRatio95)));

        UpDateFlows_95;
        bool2:=true;
      end;
      if (bool1 and bool2) then
        break;


    end;
    bool1:=false;
    bool2:=false;


    //Benzol для 95
    while abs(GetConcBenzol-ArrConditions.Conditions[ind_95].restrictions[2])/
           ArrConditions.Conditions[ind_95].restrictions[2]>0.01 do
    begin
      if GetConcBenzol-ArrConditions.Conditions[ind_95].restrictions[2]>0 then
      begin
        if RatioParam.Net_R600 then
        begin
          if not RatioParam.Step_95_Sum_R600_R1000_Minus then
            break;
        end
        else
        begin
          if not RatioParam.Step_95_Del_R600_R1000_Minus then
          begin
            if not RatioParam.Step_95_Sum_R600_R1000_Minus then
              break;
          end;
        end;
        UpDateFlows_95;
        bool1:=true;
      end;
      if GetConcBenzol-ArrConditions.Conditions[ind_95].restrictions[2]<0 then
      begin
        if RatioParam.Net_R600 then
        begin
          if not RatioParam.Step_95_Sum_R600_R1000_Plus then
            break;
        end
        else
        begin
          if not RatioParam.Step_95_Del_R600_R1000_Plus then
          begin
            if not RatioParam.Step_95_Sum_R600_R1000_Plus then
              break;
          end;
        end;
        UpDateFlows_95;
        bool2:=true;
      end;
      if (bool1 and bool2) then
        break;
    end;
    bool1:=false;
    bool2:=false;

    //ShowMessage(FloatToStr(GetSum(RatioParam.FlowRatio95)));

    //Arom для 95
    while abs(GetConcArom-ArrConditions.Conditions[ind_95].restrictions[3])/
           ArrConditions.Conditions[ind_95].restrictions[3]>0.001 do
    begin
      if GetConcArom-ArrConditions.Conditions[ind_95].restrictions[3]>0 then
      begin
        if not RatioParam.Step_95_Sum_Toluol_Minus then
        begin
          break;
        end;
        UpDateFlows_95;
        bool1:=true;
      end;
      if GetConcArom-ArrConditions.Conditions[ind_95].restrictions[3]<0 then
      begin
        if not RatioParam.Step_95_Sum_Toluol_Plus then
        begin
          break;
        end;
        UpDateFlows_95;
        bool2:=true;
      end;
      if (bool1 and bool2) then
        break;
    end;

    bool1:=false;
    bool2:=false;

    //ShowMessage(FloatToStr(GetSum(RatioParam.FlowRatio95)));

    //ДНП для 95
    while abs(GetDNP+0.1-ArrConditions.Conditions[ind_95].restrictions[0])/
           ArrConditions.Conditions[ind_95].restrictions[0]>0.001 do
    begin
      if GetDNP+0.1-ArrConditions.Conditions[ind_95].restrictions[0]>0 then
      begin
        if not RatioParam.Step_95_Sum_Isomer_IsoPen_Minus then
        begin
          break;
        end;
        UpDateFlows_95;
        bool1:=true;
      end;
      if GetDNP+0.1-ArrConditions.Conditions[ind_95].restrictions[0]<0 then
      begin
        if not RatioParam.Step_95_Sum_Isomer_IsoPen_Plus then
        begin
          break;
        end;
        UpDateFlows_95;
        bool2:=true;
      end;
      if (bool1 and bool2) then
        break;
    end;
    bool1:=false;
    bool2:=false;

    //ShowMessage(FloatToStr(GetSum(RatioParam.FlowRatio95)));

    //ОЧ для 95
    while abs(TotalFlowOctaneValue-ArrConditions.Conditions[ind_95].OV)/
           ArrConditions.Conditions[ind_95].OV>0.001 do
    begin
      if TotalFlowOctaneValue-ArrConditions.Conditions[ind_95].OV>0 then
      begin
        if not RatioParam.Step_95_Sum_Alkil_MTBE_Minus then
        begin
          break;
        end;
        UpDateFlows_95;
        bool1:=true;
      end;
      if TotalFlowOctaneValue-ArrConditions.Conditions[ind_95].OV<0 then
      begin
        if not RatioParam.Step_95_Sum_Alkil_MTBE_Plus then
        begin
          break;
        end;
        UpDateFlows_95;
        bool2:=true;
      end;
      if (bool1 and bool2) then
        break;
    end;

    //ShowMessage(FloatToStr(GetSum(RatioParam.FlowRatio95)));

    i:=StringGridResult.ColCount;
    StringGridResult.ColCount:=i+1;
    StringGridResult.Cells[0,0]:='Параметр';

    StringGridResult.Cells[i,0]:=ArrConditions.Conditions[ind_95].Name;
    StringGridResult.Cells[0,1]:='Факт.ОЧ';
    StringGridResult.Cells[i,1]:=FloatToStr(roundto(TotalFlowOctaneValue,0));
    StringGridResult.Cells[0,2]:='Факт.ДНП';
    StringGridResult.Cells[i,2]:=FloatToStr(roundto(GetDNP,-2));
    StringGridResult.Cells[0,3]:='Факт.Бенз.';
    StringGridResult.Cells[i,3]:=FloatToStr(roundto(GetConcBenzol,-2));
    StringGridResult.Cells[0,4]:='Факт.Аром.';
    StringGridResult.Cells[i,4]:=FloatToStr(roundto(GetConcArom,-2));
    StringGridResult.Cells[0,5]:='Факт.Олеф.';
    StringGridResult.Cells[i,5]:=FloatToStr(roundto(GetConcOlef,-2));
    StringGridResult.Cells[0,6]:='Факт.Сера';
    StringGridResult.Cells[i,6]:=FloatToStr(roundto(GetConcSera, -4));
    StringGridResult.Cells[0,7]:='Факт.Кол-во';
    StringGridResult.Cells[i,7]:=FloatToStr(roundto(GetExpenditure_95,-2));
    StringGridResult.Cells[0,8]:='Факт.ОЧМ';
    StringGridResult.Cells[i,8]:=FloatToStr(roundto(TotalFlowOctaneValue(false),0));

    i_95:=i;
    SG1Itog.Cells[0,0]:='Поток';
    SG1Itog.ColCount:=i+1;
    SG1Itog.Cells[i,0]:=ArrConditions.Conditions[ind_95].Name;
    For j:=1 to 13 do
    begin
      if GetFlowOfIndexOfCondition(j)<>nil then
      begin
        SG1Itog.Cells[0,j]:=GetFlowOfIndexOfCondition(j).Name;
        SG1Itog.Cells[i,j]:=FloatToStr(roundto(RatioParam.FlowRatio95[j],-1));
      end;
    end;
  end;

  if ind_98>-1 then
  begin
    //подбор 98



    UpDateFlows_98;

    bool1:=false;
    bool2:=false;

    //Sera для 98
    while abs(GetConcSera-ArrConditions.Conditions[ind_98].restrictions[5])/
           ArrConditions.Conditions[ind_98].restrictions[5]>0.01 do
    begin

      if GetConcSera-ArrConditions.Conditions[ind_98].restrictions[5]<0 then
      begin
        if not RatioParam.Step_98_KT_Plus then
        begin
          break;
        end;
        UpDateFlows_98;
      end
      else
        break;

    end;

    //ShowMessage(FloatToStr(GetSum(RatioParam.FlowRatio98)));
    //Benzol для 98
    while abs(GetConcBenzol-ArrConditions.Conditions[ind_98].restrictions[2])/
           ArrConditions.Conditions[ind_98].restrictions[2]>0.01 do
    begin

      if GetConcBenzol-ArrConditions.Conditions[ind_98].restrictions[2]<0 then
      begin
        if RatioParam.Net_R600 then
        begin
          if not RatioParam.Step_98_R1000_Plus then
          begin
            break;
          end;
        end
        else
        begin
          if not RatioParam.Step_98_R600_Plus then
          begin
            break;
          end;
        end;
        UpDateFlows_98;
      end
      else
        break;

    end;
    //ShowMessage(FloatToStr(GetSum(RatioParam.FlowRatio98)));
    //ДНП для 98
    while abs(GetDNP+0.1-ArrConditions.Conditions[ind_98].restrictions[0])/
           ArrConditions.Conditions[ind_98].restrictions[0]>0.001 do
    begin
      if GetDNP+0.1-ArrConditions.Conditions[ind_98].restrictions[0]<0 then
      begin
        if not RatioParam.Step_98_Sum_R600_R1000_Minus then
        begin
          break;
        end;
        UpDateFlows_98;

      end
      else
      begin
        break;
      end;

    end;
    //ShowMessage(FloatToStr(GetSum(RatioParam.FlowRatio98)));
    //Arom для 98
    while abs(GetConcArom-ArrConditions.Conditions[ind_98].restrictions[3])/
           ArrConditions.Conditions[ind_98].restrictions[3]>0.0001 do
    begin
      if GetConcArom-ArrConditions.Conditions[ind_98].restrictions[3]>0 then
      begin
        if not RatioParam.Step_98_Sum_Toluol_Minus then
        begin

          break;

        end;
        UpDateFlows_98;

      end
      else
      begin

        break;
      end;
    end;
    //ОЧ для 98
    while abs(TotalFlowOctaneValue-ArrConditions.Conditions[ind_98].OV)/
           ArrConditions.Conditions[ind_98].OV>0.001 do
    begin
      if TotalFlowOctaneValue-ArrConditions.Conditions[ind_98].OV>0 then
      begin
        if not RatioParam.Step_98_MTBE_Minus then
        begin
          break;
        end;
        UpDateFlows_98;
        bool1:=true;
      end;
      if TotalFlowOctaneValue-ArrConditions.Conditions[ind_98].OV<0 then
      begin
        if not RatioParam.Step_98_MTBE_Plus then
        begin
          break;
        end;
        UpDateFlows_98;
        bool2:=true;
      end;
      if (bool1 and bool2) then
        break;
    end;


    i:=StringGridResult.ColCount;
    StringGridResult.ColCount:=i+1;
    StringGridResult.Cells[0,0]:='Параметр';

    StringGridResult.Cells[i,0]:=ArrConditions.Conditions[ind_98].Name;
    StringGridResult.Cells[0,1]:='Факт.ОЧ';
    StringGridResult.Cells[i,1]:=FloatToStr(roundto(TotalFlowOctaneValue,0));
    StringGridResult.Cells[0,2]:='Факт.ДНП';
    StringGridResult.Cells[i,2]:=FloatToStr(roundto(GetDNP,-2));
    StringGridResult.Cells[0,3]:='Факт.Бенз.';
    StringGridResult.Cells[i,3]:=FloatToStr(roundto(GetConcBenzol,-2));
    StringGridResult.Cells[0,4]:='Факт.Аром.';
    StringGridResult.Cells[i,4]:=FloatToStr(roundto(GetConcArom,-2));
    StringGridResult.Cells[0,5]:='Факт.Олеф.';
    StringGridResult.Cells[i,5]:=FloatToStr(roundto(GetConcOlef,-2));
    StringGridResult.Cells[0,6]:='Факт.Сера';
    StringGridResult.Cells[i,6]:=FloatToStr(roundto(GetConcSera, -4));
    StringGridResult.Cells[0,7]:='Факт.Кол-во';
    StringGridResult.Cells[i,7]:=FloatToStr(roundto(GetExpenditure_98,-2));
    StringGridResult.Cells[0,8]:='Факт.ОЧМ';
    StringGridResult.Cells[i,8]:=FloatToStr(roundto(TotalFlowOctaneValue(false),0));

    i_98:=i;
    SG1Itog.Cells[0,0]:='Поток';
    SG1Itog.ColCount:=i+1;
    SG1Itog.Cells[i,0]:=ArrConditions.Conditions[ind_98].Name;
    For j:=1 to 13 do
    begin
      if GetFlowOfIndexOfCondition(j)<>nil then
      begin
        SG1Itog.Cells[0,j]:=GetFlowOfIndexOfCondition(j).Name;
        SG1Itog.Cells[i,j]:=FloatToStr(roundto(RatioParam.FlowRatio98[j],-1));
      end;
    end;
  end;



  BackExpenditure;

  Raspred_92_95_98;

  BackExpenditure;

  if i_92>0 then
  begin
    StringGridResult.Cells[i_92,7]:=FloatToStr(roundto(GetExpenditure_92,-2));

  end;
  if i_95>0 then
  begin
    StringGridResult.Cells[i_95,7]:=FloatToStr(roundto(GetExpenditure_95,-2));
  end;
  if i_98>0 then
  begin
    StringGridResult.Cells[i_98,7]:=FloatToStr(roundto(GetExpenditure_98,-2));
  end;



  if ind_80>-1 then
  begin
    //подбор 80
    RatioParam.SetFlowRatio80(Fl_GOBKK, Fl_KT, Fl_R600, Fl_Isomer,
            Fl_IsoPen, Fl_Prjam1, Fl_Prjam2, Fl_Prjam3);

    UpDateFlows_80;

    bool1:=false;
    bool2:=false;

    //Benzol для 80
    while abs(GetConcBenzol-ArrConditions.Conditions[ind_80].restrictions[2])/
           ArrConditions.Conditions[ind_80].restrictions[2]>0.01 do
    begin

      if GetConcBenzol-ArrConditions.Conditions[ind_80].restrictions[2]>0 then
      begin
        if RatioParam.Net_R600 then
        begin
          break;
        end
        else
        begin
          if not RatioParam.Step_80_KT_Prjam_Minus then
          begin
            break;
          end;
        end;
        UpDateFlows_80;
      end
      else
        break;

    end;
    bool1:=false;
    bool2:=false;

    //ДНП для 80
    while abs(GetDNP(false)+0.1-ArrConditions.Conditions[ind_80].restrictions[0])/
           ArrConditions.Conditions[ind_80].restrictions[0]>0.001 do
    begin
      if GetDNP(false)+0.1-ArrConditions.Conditions[ind_80].restrictions[0]>0 then
      begin
        if not RatioParam.Step_80_Sum_Isomer_Minus then
        begin
          if not RatioParam.Step_80_Sum_IsoPen_Minus then
            break;
        end;
        UpDateFlows_80;
        bool1:=true;
      end;
      if GetDNP(false)+0.1-ArrConditions.Conditions[ind_80].restrictions[0]<0 then
      begin
        if not RatioParam.Step_80_Sum_IsoPen_Plus then
        begin
          if not RatioParam.Step_80_Sum_Isomer_Minus then
            break;

        end;
        UpDateFlows_80;
        bool2:=true;
      end;
      if (bool1 and bool2) then
        break;
    end;
    bool1:=false;
    bool2:=false;


    //Sera для 80
    while abs(GetConcSera-ArrConditions.Conditions[ind_80].restrictions[5])/
           ArrConditions.Conditions[ind_80].restrictions[5]>0.01 do
    begin

      if GetConcSera-ArrConditions.Conditions[ind_80].restrictions[5]>0 then
      begin
        if not RatioParam.Step_80_KT_Minus then
        begin
          break;
        end;
        UpDateFlows_80;
      end
      else
        break;

    end;

    bool1:=false;
    bool2:=false;


    //ОЧ для 80
    while abs(TotalFlowOctaneValue-ArrConditions.Conditions[ind_80].OV)/
           ArrConditions.Conditions[ind_80].OV>0.001 do
    begin
      if TotalFlowOctaneValue-ArrConditions.Conditions[ind_80].OV>0 then
      begin
        if not RatioParam.Step_80_KT_Minus then
        begin
          break;
        end;
        UpDateFlows_80;
        bool1:=true;
      end;

      if TotalFlowOctaneValue-ArrConditions.Conditions[ind_80].OV<0 then
      begin
        if not RatioParam.Step_80_KT_Plus then
        begin
          break;
        end;
        UpDateFlows_80;
        bool2:=true;
      end;

      if (bool1 and bool2) then
        break;
    end;

    i:=StringGridResult.ColCount;
    StringGridResult.ColCount:=i+1;
    StringGridResult.Cells[0,0]:='Параметр';

    StringGridResult.Cells[i,0]:=ArrConditions.Conditions[ind_80].Name;
    StringGridResult.Cells[0,1]:='Факт.ОЧ';
    StringGridResult.Cells[i,1]:=FloatToStr(roundto(TotalFlowOctaneValue,0));
    StringGridResult.Cells[0,2]:='Факт.ДНП';
    StringGridResult.Cells[i,2]:=FloatToStr(roundto(GetDNP,-2));
    StringGridResult.Cells[0,3]:='Факт.Бенз.';
    StringGridResult.Cells[i,3]:=FloatToStr(roundto(GetConcBenzol,-2));
    StringGridResult.Cells[0,4]:='Факт.Аром.';
    StringGridResult.Cells[i,4]:=FloatToStr(roundto(GetConcArom,-2));
    StringGridResult.Cells[0,5]:='Факт.Олеф.';
    StringGridResult.Cells[i,5]:=FloatToStr(roundto(GetConcOlef,-2));
    StringGridResult.Cells[0,6]:='Факт.Сера';
    StringGridResult.Cells[i,6]:=FloatToStr(roundto(GetConcSera, -4));
    StringGridResult.Cells[0,7]:='Факт.Кол-во';
    StringGridResult.Cells[i,7]:=FloatToStr(roundto(GetExpenditure_80,-2));
    StringGridResult.Cells[0,8]:='Факт.ОЧМ';
    StringGridResult.Cells[i,8]:=FloatToStr(roundto(TotalFlowOctaneValue(false),0));

    i_80:=i;
    SG1Itog.Cells[0,0]:='Поток';
    SG1Itog.ColCount:=i+1;
    SG1Itog.Cells[i,0]:=ArrConditions.Conditions[ind_80].Name;
    For j:=1 to 13 do
    begin
      if GetFlowOfIndexOfCondition(j)<>nil then
      begin
        SG1Itog.Cells[0,j]:=GetFlowOfIndexOfCondition(j).Name;
        SG1Itog.Cells[i,j]:=FloatToStr(roundto(RatioParam.FlowRatio80[j],-1));
      end;
    end;
  end;

  SG1Itog.ColCount:=SG1Itog.ColCount+1;
  i:=SG1Itog.ColCount-1;
  SG1Itog.Cells[i,0]:='Остатки';
  For j:=1 to 13 do
  begin
    if GetFlowOfIndexOfCondition(j)<>nil then
    begin
      SG1Itog.Cells[i,j]:= FloatToStr(roundto(GetFlowOfIndexOfCondition(j).ExistExpenditure, -2));
    end;
  end;



  //перевод в массы
  For j:=1 to 13 do
  begin
    if i_92>-1 then
    SG1Itog.Cells[i_92,j]:=SG1Itog.Cells[i_92,j]+' / '+
      FloatToStr(roundto(
        StrToFloat(StringGridResult.Cells[i_92,7])*
        StrToFloat(SG1Itog.Cells[i_92,j])/100,-2));
    if i_95>-1 then
    SG1Itog.Cells[i_95,j]:=SG1Itog.Cells[i_95,j]+' / '+
      FloatToStr(roundto(
        StrToFloat(StringGridResult.Cells[i_95,7])*
        StrToFloat(SG1Itog.Cells[i_95,j])/100,-2));
    if i_98>-1 then
    SG1Itog.Cells[i_98,j]:=SG1Itog.Cells[i_98,j]+' / '+
      FloatToStr(roundto(
        StrToFloat(StringGridResult.Cells[i_98,7])*
        StrToFloat(SG1Itog.Cells[i_98,j])/100,-2));
    if i_80>-1 then
    SG1Itog.Cells[i_80,j]:=SG1Itog.Cells[i_80,j]+' / '+
      FloatToStr(roundto(
        StrToFloat(StringGridResult.Cells[i_80,7])*
        StrToFloat(SG1Itog.Cells[i_80,j])/100,-2));


  end;
  //вставить расчет стоимости
  _Kol_92:=0;
  _Kol_95:=0;
  _Kol_98:=0;
  _Kol_80:=0;
  _Cena_92:=0;
  _Cena_95:=0;
  _Cena_98:=0;
  _Cena_80:=0;

  if i_92>-1 then
  begin
    _Kol_92:=StrToFloat(StringGridResult.Cells[i_92,7]);
    _Cena_92:=ArrConditions.Conditions[ind_92].restrictions[9];
  end;
  if i_95>-1 then
  begin
    _Kol_95:=StrToFloat(StringGridResult.Cells[i_95,7]);
    _Cena_95:=ArrConditions.Conditions[ind_95].restrictions[9];
  end;
  if i_98>-1 then
  begin
    _Kol_98:=StrToFloat(StringGridResult.Cells[i_98,7]);
    _Cena_98:=ArrConditions.Conditions[ind_98].restrictions[9];
  end;
  if i_80>-1 then
  begin
    _Kol_80:=StrToFloat(StringGridResult.Cells[i_80,7]);
    _Cena_80:=ArrConditions.Conditions[ind_80].restrictions[9];
  end;

  TotalPribl:= CalcPribl(_Kol_92, _Kol_95, _Kol_98, _Kol_80,
    _Cena_92, _Cena_95, _Cena_98, _Cena_80, RatioParam);

  //FormFlowofOV.SG1Itog.RowCount:=FormFlowofOV.SG1Itog.RowCount+1;
  SG1Itog.Cells[0,SG1Itog.RowCount-1]:='Прибыль всего, млн.руб.';
  SG1Itog.Cells[1,SG1Itog.RowCount-1]:=FloatToStr(roundto(TotalPribl/1e6,-2));


end;




function TTotalFlowCompaunding.GetConcParaf: double;
var
  jj: integer;
begin
  result:=0;
  for jj:=1 to 10 do
  begin
    result:=result+Components[jj-1].ConcentrComp;
  end;

end;



function TTotalFlowCompaunding.GetConcIzoParaf_6: double;
var
  jj: integer;
begin
  result:=0;
  for jj:=11 to 19 do
  begin
    result:=result+Components[jj-1].ConcentrComp;
  end;

end;

function TTotalFlowCompaunding.GetConcIzoParaf_8: double;
var
  jj: integer;
begin
  result:=0;
  for jj:=20 to 49 do
  begin
    result:=result+Components[jj-1].ConcentrComp;
  end;

end;

function TTotalFlowCompaunding.GetConcNaft: double;
var
  jj: integer;
begin
  result:=0;
  for jj:=50 to 64 do
  begin
    result:=result+Components[jj-1].ConcentrComp;
  end;

end;

function TTotalFlowCompaunding.GetConcArom: double;
var
  jj: integer;
begin
  result:=0;
  for jj:=65 to 78 do
  begin
    result:=result+Components[jj-1].ConcentrComp;
  end;

end;

function TTotalFlowCompaunding.GetConcOlef: double;
var
  jj: integer;
begin
  result:=0;
  for jj:=79 to 110 do
  begin
    result:=result+Components[jj-1].ConcentrComp;
  end;

end;

function TTotalFlowCompaunding.GetConcBenzol: double;
var
  jj: integer;
begin
  result:=0;
  for jj:=65 to 65 do
  begin
    result:=result+Components[jj-1].ConcentrComp;
  end;
end;

function TTotalFlowCompaunding.GetConcI_Pent: double;
var
  jj: integer;
begin
  result:=0;
  for jj:=12 to 12 do
  begin
    result:=result+Components[jj-1].ConcentrComp;
  end;

end;

function TTotalFlowCompaunding.GetConcToluol: double;
var
  jj: integer;
begin
  result:=0;
  for jj:=66 to 66 do
  begin
    result:=result+Components[jj-1].ConcentrComp;
  end;


end;

function TTotalFlowCompaunding.GetConcSera: double;

begin
  result:=0;
  if GetCompOfName('Sera')<>nil then
    result:=GetCompOfName('Sera').ConcentrComp;
end;

function TTotalFlowCompaunding.GetConcMTBE: double;
begin
  result:=0;
  if GetCompOfName('MTBE')<>nil then
    result:=GetCompOfName('MTBE').ConcentrComp;
end;

procedure TRatioParam.RecalcParam_92;
begin
  //go bkk
  FlowRatio92[1]:=Curr_92_Sum_KT_GOBKK/(Curr_92_Del_KT_GOBKK+1);
  //kt
  FlowRatio92[2]:=Curr_92_Del_KT_GOBKK*Curr_92_Sum_KT_GOBKK/(Curr_92_Del_KT_GOBKK+1);
  //r1000
  FlowRatio92[3]:=Curr_92_Sum_R600_R1000/(Curr_92_Del_R600_R1000+1);
  //r600
  FlowRatio92[4]:=Curr_92_Del_R600_R1000*Curr_92_Sum_R600_R1000/(Curr_92_Del_R600_R1000+1);

end;

procedure TRatioParam.RecalcParam_95;
begin
  //go bkk
  FlowRatio95[1]:=Curr_95_Sum_KT_GOBKK/(Curr_95_Del_KT_GOBKK+1);
  //kt
  FlowRatio95[2]:=Curr_95_Del_KT_GOBKK*Curr_95_Sum_KT_GOBKK/(Curr_95_Del_KT_GOBKK+1);
  //r1000
  FlowRatio95[3]:=Curr_95_Sum_R600_R1000/(Curr_95_Del_R600_R1000+1);
  //r600
  FlowRatio95[4]:=Curr_95_Del_R600_R1000*Curr_95_Sum_R600_R1000/(Curr_95_Del_R600_R1000+1);

end;

procedure TRatioParam.RecalcParam_98;
begin

  //go bkk
  FlowRatio98[1]:=Curr_98_Sum_KT_GOBKK/(Curr_98_Del_KT_GOBKK+1);
  //kt
  FlowRatio98[2]:=Curr_98_Del_KT_GOBKK*Curr_98_Sum_KT_GOBKK/(Curr_98_Del_KT_GOBKK+1);

   //r1000
  FlowRatio98[3]:=Curr_98_Sum_R600_R1000/(Curr_98_Del_R600_R1000+1);
  //r600
  FlowRatio98[4]:=Curr_98_Del_R600_R1000*Curr_98_Sum_R600_R1000/(Curr_98_Del_R600_R1000+1);

end;

procedure TRatioParam.SetFlowRatio80(Fl_GOBKK, Fl_KT, Fl_R600, Fl_Isomer,
  Fl_IsoPen, Fl_Prjam1, Fl_Prjam2, Fl_Prjam3: TFlowCompaunding);
var
  sum: double;
begin
  sum:=Fl_GOBKK.ExistExpenditure+Fl_KT.ExistExpenditure+Fl_R600.ExistExpenditure+
       Fl_Isomer.ExistExpenditure+Fl_IsoPen.ExistExpenditure+Fl_Prjam1.ExistExpenditure+
       Fl_Prjam2.ExistExpenditure+Fl_Prjam3.ExistExpenditure;
  FlowRatio80[1]:=Fl_GOBKK.ExistExpenditure/sum*100;
  FlowRatio80[2]:=Fl_KT.ExistExpenditure/sum*100;
  FlowRatio80[3]:=0;
  FlowRatio80[4]:=Fl_R600.ExistExpenditure/sum*100;
  FlowRatio80[5]:=0;
  FlowRatio80[6]:=Fl_Isomer.ExistExpenditure/sum*100;
  FlowRatio80[7]:=Fl_IsoPen.ExistExpenditure/sum*100;
  FlowRatio80[8]:=0;
  FlowRatio80[9]:=0;
  FlowRatio80[10]:=Fl_Prjam1.ExistExpenditure/sum*100;
  FlowRatio80[11]:=Fl_Prjam2.ExistExpenditure/sum*100;
  FlowRatio80[12]:=Fl_Prjam3.ExistExpenditure/sum*100;
  FlowRatio80[13]:=0;
end;

function TRatioParam.Step_80_KT_Minus: boolean;
var
  sum: double;
begin
  result:=false;

  if FlowRatio80[2]-H_80_KT<Lim_80_KT_min then
    exit;
  if (FlowRatio80[10]+FlowRatio80[11]+FlowRatio80[12]+H_80_KT>Lim_80_Prjam_max)
  then
    exit;
  FlowRatio80[2]:=FlowRatio80[2]-H_80_KT;

  sum:=(FlowRatio80[10]+FlowRatio80[11]+FlowRatio80[12]);

  if sum=0 then exit;

  FlowRatio80[10]:=FlowRatio80[10]+H_80_KT*FlowRatio80[10]/sum;
  FlowRatio80[11]:=FlowRatio80[11]+H_80_KT*FlowRatio80[11]/sum;
  FlowRatio80[12]:=FlowRatio80[12]+H_80_KT*FlowRatio80[12]/sum;

  result:=true;
end;

function TRatioParam.Step_80_KT_Plus: boolean;
var
  sum: double;
begin
  result:=false;

  if FlowRatio80[2]+H_80_KT>Lim_80_KT_max then
    exit;
  if (FlowRatio80[10]+FlowRatio80[11]+FlowRatio80[12]-H_80_KT<Lim_80_Prjam_min)
  then
    exit;
  FlowRatio80[2]:=FlowRatio80[2]+H_80_KT;

  sum:=(FlowRatio80[10]+FlowRatio80[11]+FlowRatio80[12]);

  if sum=0 then exit;

  FlowRatio80[10]:=FlowRatio80[10]-H_80_KT*FlowRatio80[10]/sum;
  FlowRatio80[11]:=FlowRatio80[11]-H_80_KT*FlowRatio80[11]/sum;
  FlowRatio80[12]:=FlowRatio80[12]-H_80_KT*FlowRatio80[12]/sum;

  result:=true;
end;

function TRatioParam.Step_80_KT_Prjam_Minus: boolean;
var
  sum: double;
begin

  result:=false;

  if FlowRatio80[4]-H_80_R600<Lim_80_R600_min then
    exit;
  if (FlowRatio80[1]+H_80_R600>Lim_80_KT_max)
  and (FlowRatio80[10]+FlowRatio80[11]+FlowRatio80[12]+H_80_R600>Lim_80_Prjam_max)
  then
    exit;

  if (FlowRatio80[1]+H_80_R600>Lim_80_KT_max)
  and (Ind_80_KT_Prjam_R600=0)
  then
    Ind_80_KT_Prjam_R600:=1;
  if (FlowRatio80[10]+FlowRatio80[11]+FlowRatio80[12]+H_80_R600>Lim_80_Prjam_max)
  and (Ind_80_KT_Prjam_R600=1)
  then
    Ind_80_KT_Prjam_R600:=0;


  if (FlowRatio80[1]+H_80_R600<=Lim_80_KT_max)
  and (Ind_80_KT_Prjam_R600=0)
  then
  begin
    FlowRatio80[1]:=FlowRatio80[1]+H_80_R600;
    FlowRatio80[4]:=FlowRatio80[4]-H_80_R600;

    Ind_80_KT_Prjam_R600:=1;
    result:=true;
    exit;
  end;

  if (FlowRatio80[10]+FlowRatio80[11]+FlowRatio80[12]+H_80_R600<=Lim_80_Prjam_max)
  and (Ind_80_KT_Prjam_R600=1)
  then
  begin

    sum:=(FlowRatio80[10]+FlowRatio80[11]+FlowRatio80[12]);

    FlowRatio80[10]:=FlowRatio80[10]+H_80_R600*FlowRatio80[10]/sum;
    FlowRatio80[11]:=FlowRatio80[11]+H_80_R600*FlowRatio80[11]/sum;
    FlowRatio80[12]:=FlowRatio80[12]+H_80_R600*FlowRatio80[12]/sum;

    FlowRatio80[4]:=FlowRatio80[4]-H_80_R600;

    Ind_80_KT_Prjam_R600:=0;
    result:=true;
    exit;
  end;
end;



function TRatioParam.Step_80_Sum_Isomer_Minus: boolean;
var
  sum: double;
begin
  result:=false;
  //isomer
  if FlowRatio80[6]=0 then
    exit;
  if (FlowRatio80[6]-H_80_Isomer<Lim_80_Isomer_min)
  then
    exit;
  if (FlowRatio80[10]+FlowRatio80[11]+FlowRatio80[12]+H_80_Isomer>Lim_80_Prjam_max)
  and (FlowRatio80[2]+H_80_Isomer>Lim_80_KT_max)
  then
    exit;

  if (FlowRatio80[2]+H_80_Isomer>Lim_80_KT_max)
  and (Ind_80_KT_Prjam_Isomer=0)
  then
    Ind_80_KT_Prjam_Isomer:=1;
  if (FlowRatio80[10]+FlowRatio80[11]+FlowRatio80[12]+H_80_Isomer>Lim_80_Prjam_max)
  and (Ind_80_KT_Prjam_Isomer=1)
  then
    Ind_80_KT_Prjam_Isomer:=0;


  if (FlowRatio80[2]+H_80_Isomer<=Lim_80_KT_max)
  and (Ind_80_KT_Prjam_Isomer=0)
  then
  begin
    FlowRatio80[2]:=FlowRatio80[2]+H_80_Isomer;
    FlowRatio80[6]:=FlowRatio80[6]-H_80_Isomer;

    Ind_80_KT_Prjam_Isomer:=1;
    result:=true;
    exit;
  end;

  if (FlowRatio80[10]+FlowRatio80[11]+FlowRatio80[12]+H_80_Isomer<=Lim_80_Prjam_max)
  and (Ind_80_KT_Prjam_Isomer=1)
  then
  begin

    sum:=(FlowRatio80[10]+FlowRatio80[11]+FlowRatio80[12]);
    if sum=0 then exit;
    FlowRatio80[10]:=FlowRatio80[10]+H_80_Isomer*FlowRatio80[10]/sum;
    FlowRatio80[11]:=FlowRatio80[11]+H_80_Isomer*FlowRatio80[11]/sum;
    FlowRatio80[12]:=FlowRatio80[12]+H_80_Isomer*FlowRatio80[12]/sum;

    FlowRatio80[6]:=FlowRatio80[6]-H_80_Isomer;

    Ind_80_KT_Prjam_Isomer:=0;
    result:=true;
    exit;
  end;
end;

function TRatioParam.Step_80_Sum_Isomer_Plus: boolean;
var
  sum: double;
begin
  result:=false;
  if FlowRatio80[6]=0 then
    exit;

  //isomer
  if (FlowRatio80[6]+H_80_Isomer>Lim_80_Isomer_max)
  then
    exit;
  if (FlowRatio80[10]+FlowRatio80[11]+FlowRatio80[12]-H_80_Isomer<Lim_80_Prjam_min)
  and (FlowRatio80[2]-H_80_Isomer<Lim_80_KT_min)
  then
    exit;

  if (FlowRatio80[2]-H_80_Isomer<Lim_80_KT_min)
  and (Ind_80_KT_Prjam_Isomer=0)
  then
    Ind_80_KT_Prjam_Isomer:=1;
  if (FlowRatio80[10]+FlowRatio80[11]+FlowRatio80[12]-H_80_Isomer<Lim_80_Prjam_min)
  and (Ind_80_KT_Prjam_Isomer=1)
  then
    Ind_80_KT_Prjam_Isomer:=0;


  if (FlowRatio80[2]-H_80_Isomer>=Lim_80_KT_min)
  and (Ind_80_KT_Prjam_Isomer=0)
  then
  begin
    FlowRatio80[2]:=FlowRatio80[2]-H_80_Isomer;
    FlowRatio80[6]:=FlowRatio80[6]+H_80_Isomer;

    Ind_80_KT_Prjam_Isomer:=1;
    result:=true;
    exit;
  end;

  if (FlowRatio80[10]+FlowRatio80[11]+FlowRatio80[12]-H_80_Isomer>=Lim_80_Prjam_min)
  and (Ind_80_KT_Prjam_Isomer=1)
  then
  begin

    sum:=(FlowRatio80[10]+FlowRatio80[11]+FlowRatio80[12]);

    if sum=0 then exit;

    FlowRatio80[10]:=FlowRatio80[10]-H_80_Isomer*FlowRatio80[10]/sum;
    FlowRatio80[11]:=FlowRatio80[11]-H_80_Isomer*FlowRatio80[11]/sum;
    FlowRatio80[12]:=FlowRatio80[12]-H_80_Isomer*FlowRatio80[12]/sum;

    FlowRatio80[6]:=FlowRatio80[6]+H_80_Isomer;

    Ind_80_KT_Prjam_Isomer:=0;
    result:=true;
    exit;
  end;
end;

function TRatioParam.Step_80_Sum_IsoPen_Minus: boolean;
var
  sum: double;
begin
  result:=false;
  if FlowRatio80[7]=0 then
    exit;
  //isoPen
  if (FlowRatio80[7]-H_80_IsoPen<Lim_80_IsoPen_min)
  then
    exit;
  if (FlowRatio80[10]+FlowRatio80[11]+FlowRatio80[12]+H_80_IsoPen>Lim_80_Prjam_max)
  and (FlowRatio80[2]+H_80_IsoPen>Lim_80_KT_max)
  then
    exit;

  if (FlowRatio80[2]+H_80_IsoPen>Lim_80_KT_max)
  and (Ind_80_KT_Prjam_IsoPen=0)
  then
    Ind_80_KT_Prjam_IsoPen:=1;
  if (FlowRatio80[10]+FlowRatio80[11]+FlowRatio80[12]+H_80_IsoPen>Lim_80_Prjam_max)
  and (Ind_80_KT_Prjam_IsoPen=1)
  then
    Ind_80_KT_Prjam_IsoPen:=0;


  if (FlowRatio80[2]+H_80_IsoPen<=Lim_80_KT_max)
  and (Ind_80_KT_Prjam_IsoPen=0)
  then
  begin
    FlowRatio80[2]:=FlowRatio80[2]+H_80_IsoPen;
    FlowRatio80[7]:=FlowRatio80[7]-H_80_IsoPen;

    Ind_80_KT_Prjam_IsoPen:=1;
    result:=true;
    exit;
  end;

  if (FlowRatio80[10]+FlowRatio80[11]+FlowRatio80[12]+H_80_IsoPen<=Lim_80_Prjam_max)
  and (Ind_80_KT_Prjam_IsoPen=1)
  then
  begin

    sum:=(FlowRatio80[10]+FlowRatio80[11]+FlowRatio80[12]);

    if sum=0 then exit;

    FlowRatio80[10]:=FlowRatio80[10]+H_80_IsoPen*FlowRatio80[10]/sum;
    FlowRatio80[11]:=FlowRatio80[11]+H_80_IsoPen*FlowRatio80[11]/sum;
    FlowRatio80[12]:=FlowRatio80[12]+H_80_IsoPen*FlowRatio80[12]/sum;

    FlowRatio80[7]:=FlowRatio80[7]-H_80_IsoPen;

    Ind_80_KT_Prjam_IsoPen:=0;
    result:=true;
    exit;
  end;
end;

function TRatioParam.Step_80_Sum_IsoPen_Plus: boolean;
var
  sum: double;
begin
  result:=false;
  if FlowRatio80[7]=0 then
    exit;
  //isoPen
  if (FlowRatio80[7]+H_80_IsoPen>Lim_80_IsoPen_max)
  then
    exit;
  if (FlowRatio80[10]+FlowRatio80[11]+FlowRatio80[12]-H_80_IsoPen<Lim_80_Prjam_min)
  and (FlowRatio80[2]-H_80_IsoPen<Lim_80_KT_min)
  then
    exit;

  if (FlowRatio80[2]-H_80_IsoPen<Lim_80_KT_min)
  and (Ind_80_KT_Prjam_IsoPen=0)
  then
    Ind_80_KT_Prjam_IsoPen:=1;
  if (FlowRatio80[10]+FlowRatio80[11]+FlowRatio80[12]-H_80_IsoPen<Lim_80_Prjam_min)
  and (Ind_80_KT_Prjam_IsoPen=1)
  then
    Ind_80_KT_Prjam_IsoPen:=0;


  if (FlowRatio80[2]-H_80_IsoPen>=Lim_80_KT_min)
  and (Ind_80_KT_Prjam_IsoPen=0)
  then
  begin
    FlowRatio80[2]:=FlowRatio80[2]-H_80_IsoPen;
    FlowRatio80[7]:=FlowRatio80[7]+H_80_IsoPen;

    Ind_80_KT_Prjam_IsoPen:=1;
    result:=true;
    exit;
  end;

  if (FlowRatio80[10]+FlowRatio80[11]+FlowRatio80[12]-H_80_IsoPen>=Lim_80_Prjam_min)
  and (Ind_80_KT_Prjam_IsoPen=1)
  then
  begin

    sum:=(FlowRatio80[10]+FlowRatio80[11]+FlowRatio80[12]);

    if sum=0 then exit;

    FlowRatio80[10]:=FlowRatio80[10]-H_80_IsoPen*FlowRatio80[10]/sum;
    FlowRatio80[11]:=FlowRatio80[11]-H_80_IsoPen*FlowRatio80[11]/sum;
    FlowRatio80[12]:=FlowRatio80[12]-H_80_IsoPen*FlowRatio80[12]/sum;

    FlowRatio80[7]:=FlowRatio80[7]+H_80_IsoPen;

    Ind_80_KT_Prjam_IsoPen:=0;
    result:=true;
    exit;
  end;
end;

function TRatioParam.Step_92_Del_KT_GOBKK_Minus: boolean;
begin
  result:=false;
  if (Curr_92_Del_KT_GOBKK-H_92_Del_KT_GOBKK<Lim_92_Del_KT_GOBKK_min)
  then
    exit;
  Curr_92_Del_KT_GOBKK:=Curr_92_Del_KT_GOBKK-H_92_Del_KT_GOBKK;
  result:=true;

  RecalcParam_92;

end;

function TRatioParam.Step_92_Del_KT_GOBKK_Plus: boolean;
begin
  result:=false;
  if (Curr_92_Del_KT_GOBKK+H_92_Del_KT_GOBKK>Lim_92_Del_KT_GOBKK_max)
  then
    exit;
  Curr_92_Del_KT_GOBKK:=Curr_92_Del_KT_GOBKK+H_92_Del_KT_GOBKK;
  result:=true;

  RecalcParam_92;
end;

function TRatioParam.Step_92_Del_R600_R1000_Minus: boolean;
begin
  result:=false;
  if (Curr_92_Del_R600_R1000-H_92_Del_R600_R1000<Lim_92_Del_R600_R1000_min)
  then
    exit;
  Curr_92_Del_R600_R1000:=Curr_92_Del_R600_R1000-H_92_Del_R600_R1000;
  result:=true;

  RecalcParam_92;
end;

function TRatioParam.Step_92_Del_R600_R1000_Plus: boolean;
begin
  result:=false;
  if (Curr_92_Del_R600_R1000+H_92_Del_R600_R1000>Lim_92_Del_R600_R1000_max)
  then
    exit;
  Curr_92_Del_R600_R1000:=Curr_92_Del_R600_R1000+H_92_Del_R600_R1000;
  result:=true;

  RecalcParam_92;
end;

function TRatioParam.Step_92_Sum_Alkil_Minus: boolean;
var
  sum: double;
begin
  result:=false;
  if (FlowRatio92[8]-H_92_Alkil<Lim_92_Alkil_min)
  then
    exit;
  if (FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]+H_92_Alkil>Lim_92_Prjam_max)
  then
    exit;


  FlowRatio92[8]:=FlowRatio92[8]-H_92_Alkil;
  sum:=(FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]);
  FlowRatio92[10]:=FlowRatio92[10]+H_92_Alkil*FlowRatio92[10]/sum;

  FlowRatio92[11]:=FlowRatio92[11]+H_92_Alkil*FlowRatio92[11]/sum;

  FlowRatio92[12]:=FlowRatio92[12]+H_92_Alkil*FlowRatio92[12]/sum;

  result:=true;

end;

function TRatioParam.Step_92_Sum_Alkil_Plus: boolean;
var
  sum: double;
begin
  result:=false;
  if (FlowRatio92[8]+H_92_Alkil>Lim_92_Alkil_max)
  then
    exit;
  if (FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]-H_92_Alkil<Lim_92_Prjam_min)
  then
    exit;


  FlowRatio92[8]:=FlowRatio92[8]+H_92_Alkil;
  sum:=(FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]);

  FlowRatio92[10]:=FlowRatio92[10]-H_92_Alkil*FlowRatio92[10]/sum;

  FlowRatio92[11]:=FlowRatio92[11]-H_92_Alkil*FlowRatio92[11]/sum;
  FlowRatio92[12]:=FlowRatio92[12]-H_92_Alkil*FlowRatio92[12]/sum;

  result:=true;
end;

function TRatioParam.Step_92_Sum_Isomer_IsoPen_Minus: boolean;
var
  sum: double;
begin
  result:=false;
  //isomer
  if (FlowRatio92[6]-H_92_Isomer<Lim_92_Isomer_min)
  and
  //isopen
  (FlowRatio92[7]-H_92_IsoPen<Lim_92_IsoPen_min)
  then
    exit;
  if (FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]+H_92_Isomer>Lim_92_Prjam_max)
  and
     (FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]+H_92_IsoPen>Lim_92_Prjam_max)
  then
    exit;

  if (FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]+H_92_Isomer>Lim_92_Prjam_max)
  and (Ind_92_Isomer_IsoPen=0)
  then
    Ind_92_Isomer_IsoPen:=1;
  if (FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]+H_92_IsoPen>Lim_92_Prjam_max)
  and (Ind_92_Isomer_IsoPen=1)
  then
    Ind_92_Isomer_IsoPen:=0;

  if (FlowRatio92[6]-H_92_Isomer>=Lim_92_Isomer_min)
  and (Ind_92_Isomer_IsoPen=0)
  then
  begin
    FlowRatio92[6]:=FlowRatio92[6]-H_92_Isomer;
    sum:=(FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]);

    FlowRatio92[10]:=FlowRatio92[10]+H_92_Isomer*FlowRatio92[10]/sum;
    FlowRatio92[11]:=FlowRatio92[11]+H_92_Isomer*FlowRatio92[11]/sum;
    FlowRatio92[12]:=FlowRatio92[12]+H_92_Isomer*FlowRatio92[12]/sum;

    Ind_92_Isomer_IsoPen:=1;
    result:=true;
    exit;
  end;

  if (FlowRatio92[7]-H_92_IsoPen>=Lim_92_IsoPen_min)
  and (Ind_92_Isomer_IsoPen=1)
  then
  begin
    
    FlowRatio92[7]:=FlowRatio92[7]-H_92_IsoPen*(1-Curr_92_Del_n_but_IsoPen);

    FlowRatio92[13]:=FlowRatio92[13]-H_92_IsoPen*Curr_92_Del_n_but_IsoPen;


    sum:=(FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]);

    FlowRatio92[10]:=FlowRatio92[10]+H_92_IsoPen*FlowRatio92[10]/sum;
    FlowRatio92[11]:=FlowRatio92[11]+H_92_IsoPen*FlowRatio92[11]/sum;
    FlowRatio92[12]:=FlowRatio92[12]+H_92_IsoPen*FlowRatio92[12]/sum;

    Ind_92_Isomer_IsoPen:=0;
    result:=true;
    exit;
  end;
end;

function TRatioParam.Step_92_Sum_Isomer_IsoPen_Plus: boolean;
var
  sum: double;
begin
  result:=false;
  //isomer
  if (FlowRatio92[6]+H_92_Isomer>Lim_92_Isomer_max)
  and
  //isopen
  (FlowRatio92[7]+H_92_IsoPen>Lim_92_IsoPen_max)
  then
    exit;
  if (FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]-H_92_Isomer<Lim_92_Prjam_min)
  and
     (FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]-H_92_IsoPen<Lim_92_Prjam_min)
  then
    exit;

  if (FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]-H_92_Isomer<Lim_92_Prjam_min)
  and (Ind_92_Isomer_IsoPen=0)
  then
    Ind_92_Isomer_IsoPen:=1;
  if (FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]-H_92_IsoPen<Lim_92_Prjam_min)
  and (Ind_92_Isomer_IsoPen=1)
  then
    Ind_92_Isomer_IsoPen:=0;

  if (FlowRatio92[6]+H_92_Isomer<=Lim_92_Isomer_max)
  and (Ind_92_Isomer_IsoPen=0)
  then
  begin
    FlowRatio92[6]:=FlowRatio92[6]+H_92_Isomer;
    sum:=(FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]);

    FlowRatio92[10]:=FlowRatio92[10]-H_92_Isomer*FlowRatio92[10]/sum;
    FlowRatio92[11]:=FlowRatio92[11]-H_92_Isomer*FlowRatio92[11]/sum;
    FlowRatio92[12]:=FlowRatio92[12]-H_92_Isomer*FlowRatio92[12]/sum;

    Ind_92_Isomer_IsoPen:=1;
    result:=true;
    exit;
  end;

  if (FlowRatio92[7]+H_92_IsoPen<=Lim_92_IsoPen_max)
  and (Ind_92_Isomer_IsoPen=1)
  then
  begin
    //делаем в соотношении с н-бутаном

    FlowRatio92[7]:=FlowRatio92[7]+H_92_IsoPen*(1-Curr_92_Del_n_but_IsoPen);

    FlowRatio92[13]:=FlowRatio92[13]+H_92_IsoPen*Curr_92_Del_n_but_IsoPen;

    sum:=(FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]);

    FlowRatio92[10]:=FlowRatio92[10]-H_92_IsoPen*FlowRatio92[10]/sum;
    FlowRatio92[11]:=FlowRatio92[11]-H_92_IsoPen*FlowRatio92[11]/sum;
    FlowRatio92[12]:=FlowRatio92[12]-H_92_IsoPen*FlowRatio92[12]/sum;

    Ind_92_Isomer_IsoPen:=0;
    result:=true;
    exit;
  end;
end;

function TRatioParam.Step_92_Sum_KT_GOBKK_Minus: boolean;
var
  sum: double;
begin
  result:=false;
  if (Curr_92_Sum_KT_GOBKK-H_92_Sum_KT_GOBKK<Lim_92_Sum_KT_GOBKK_min)
  then
    exit;
  if (FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]+H_92_Sum_KT_GOBKK)>Lim_92_Prjam_max
  then
    exit;

  Curr_92_Sum_KT_GOBKK:=Curr_92_Sum_KT_GOBKK-H_92_Sum_KT_GOBKK;
  sum:=(FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]);

  FlowRatio92[10]:=FlowRatio92[10]+H_92_Sum_KT_GOBKK*FlowRatio92[10]/sum;
  FlowRatio92[11]:=FlowRatio92[11]+H_92_Sum_KT_GOBKK*FlowRatio92[11]/sum;
  FlowRatio92[12]:=FlowRatio92[12]+H_92_Sum_KT_GOBKK*FlowRatio92[12]/sum;


  result:=true;

  RecalcParam_92;

end;

function TRatioParam.Step_92_Sum_KT_GOBKK_Plus: boolean;
var
  sum: double;
begin
  result:=false;
  if (Curr_92_Sum_KT_GOBKK+H_92_Sum_KT_GOBKK>Lim_92_Sum_KT_GOBKK_max)
  then
    exit;
  if (FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]-H_92_Sum_KT_GOBKK)<Lim_92_Prjam_min
  then
    exit;

  Curr_92_Sum_KT_GOBKK:=Curr_92_Sum_KT_GOBKK+H_92_Sum_KT_GOBKK;
  sum:=(FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]);

  FlowRatio92[10]:=FlowRatio92[10]-H_92_Sum_KT_GOBKK*FlowRatio92[10]/sum;
  FlowRatio92[11]:=FlowRatio92[11]-H_92_Sum_KT_GOBKK*FlowRatio92[11]/sum;
  FlowRatio92[12]:=FlowRatio92[12]-H_92_Sum_KT_GOBKK*FlowRatio92[12]/sum;

  result:=true;

  RecalcParam_92;
end;

function TRatioParam.Step_92_Sum_MTBE_Minus: boolean;
var
  sum: double;
begin
  result:=false;

  if (FlowRatio92[9]-H_92_MTBE<Lim_92_MTBE_min)
  then
    exit;
  if (FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]+H_92_MTBE>Lim_92_Prjam_max)
  then
    exit;


  FlowRatio92[9]:=FlowRatio92[9]-H_92_MTBE;
  sum:=(FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]);

  FlowRatio92[10]:=FlowRatio92[10]+H_92_MTBE*FlowRatio92[10]/sum;
  FlowRatio92[11]:=FlowRatio92[11]+H_92_MTBE*FlowRatio92[11]/sum;
  FlowRatio92[12]:=FlowRatio92[12]+H_92_MTBE*FlowRatio92[12]/sum;
  result:=true;

end;

function TRatioParam.Step_92_Sum_MTBE_Plus: boolean;
var
  sum: double;
begin
  result:=false;

  if (FlowRatio92[9]+H_92_MTBE>Lim_92_MTBE_max)
  then
    exit;
  if (FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]-H_92_MTBE<Lim_92_Prjam_min)
  then
    exit;


  FlowRatio92[9]:=FlowRatio92[9]+H_92_MTBE;
  sum:=(FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]);

  FlowRatio92[10]:=FlowRatio92[10]-H_92_MTBE*FlowRatio92[10]/sum;
  FlowRatio92[11]:=FlowRatio92[11]-H_92_MTBE*FlowRatio92[11]/sum;
  FlowRatio92[12]:=FlowRatio92[12]-H_92_MTBE*FlowRatio92[12]/sum;
  result:=true;
end;

function TRatioParam.Step_92_Sum_R600_R1000_Minus: boolean;
var
  sum: double;
begin
  result:=false;
  if (Curr_92_Sum_R600_R1000-H_92_Sum_R600_R1000<Lim_92_Sum_R600_R1000_min)
  then
    exit;
  if (FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]+H_92_Sum_R600_R1000)>Lim_92_Prjam_max
  then
    exit;

  Curr_92_Sum_R600_R1000:=Curr_92_Sum_R600_R1000-H_92_Sum_R600_R1000;
  sum:=(FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]);

  FlowRatio92[10]:=FlowRatio92[10]+H_92_Sum_R600_R1000*FlowRatio92[10]/sum;
  FlowRatio92[11]:=FlowRatio92[11]+H_92_Sum_R600_R1000*FlowRatio92[11]/sum;
  FlowRatio92[12]:=FlowRatio92[12]+H_92_Sum_R600_R1000*FlowRatio92[12]/sum;

  result:=true;

  RecalcParam_92;
end;

function TRatioParam.Step_92_Sum_R600_R1000_Plus: boolean;
var
  sum: double;
begin
  result:=false;
  if (Curr_92_Sum_R600_R1000+H_92_Sum_R600_R1000>Lim_92_Sum_R600_R1000_max)
  then
    exit;
  if (FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]-H_92_Sum_R600_R1000)<Lim_92_Prjam_min
  then
    exit;

  Curr_92_Sum_R600_R1000:=Curr_92_Sum_R600_R1000+H_92_Sum_R600_R1000;
  sum:=(FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]);

  FlowRatio92[10]:=FlowRatio92[10]-H_92_Sum_R600_R1000*FlowRatio92[10]/sum;
  FlowRatio92[11]:=FlowRatio92[11]-H_92_Sum_R600_R1000*FlowRatio92[11]/sum;
  FlowRatio92[12]:=FlowRatio92[12]-H_92_Sum_R600_R1000*FlowRatio92[12]/sum;

  result:=true;

  RecalcParam_92;
end;

function TRatioParam.Step_92_Sum_Toluol_Minus: boolean;
var
  sum: double;
begin
  result:=false;

  if Net_Toluol then exit;
  if (FlowRatio92[5]-H_92_Toluol<Lim_92_Toluol_min)
  then
    exit;
  if (FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]+H_92_Toluol>Lim_92_Prjam_max)
  then
    exit;


  FlowRatio92[5]:=FlowRatio92[5]-H_92_Toluol;
  sum:=(FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]);

  FlowRatio92[10]:=FlowRatio92[10]+H_92_Toluol*FlowRatio92[10]/sum;
  FlowRatio92[11]:=FlowRatio92[11]+H_92_Toluol*FlowRatio92[11]/sum;
  FlowRatio92[12]:=FlowRatio92[12]+H_92_Toluol*FlowRatio92[12]/sum;
  result:=true;

end;

function TRatioParam.Step_92_Sum_Toluol_Plus: boolean;
var
  sum: double;
begin
  result:=false;
  if Net_Toluol then exit;

  if (FlowRatio92[5]+H_92_Toluol>Lim_92_Toluol_max)
  then
    exit;
  if (FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]-H_92_Toluol<Lim_92_Prjam_min)
  then
    exit;


  FlowRatio92[5]:=FlowRatio92[5]+H_92_Toluol;
  sum:=(FlowRatio92[10]+FlowRatio92[11]+FlowRatio92[12]);

  FlowRatio92[10]:=FlowRatio92[10]-H_92_Toluol*FlowRatio92[10]/sum;
  FlowRatio92[11]:=FlowRatio92[11]-H_92_Toluol*FlowRatio92[11]/sum;
  FlowRatio92[12]:=FlowRatio92[12]-H_92_Toluol*FlowRatio92[12]/sum;
  result:=true;
end;

function TTotalFlowCompaunding.GetDNP(IndBool: boolean=true): double;
var
  i: integer;
begin
  result:=0;
  //CalcVolOfMassConz(FlowTemp); // пересчет

  for i:=0 to Length(Components)-1 do
  begin
    result:=result+Components[i].GetDNPIndex(FlowTemp, IndBool)*Components[i].ConcentrComp;{здесь массовые концентрации}
  end;
  if IndBool then
    result:=power(result/100, 1/1.25)*6.8947
  else
    result:=result/100;
end;


function TRatioParam.Step_95_Del_KT_GOBKK_Minus: boolean;
begin
  result:=false;
  if (Curr_95_Del_KT_GOBKK-H_95_Del_KT_GOBKK<Lim_95_Del_KT_GOBKK_min)
  then
    exit;
  Curr_95_Del_KT_GOBKK:=Curr_95_Del_KT_GOBKK-H_95_Del_KT_GOBKK;
  result:=true;

  RecalcParam_95;

end;

function TRatioParam.Step_95_Del_KT_GOBKK_Plus: boolean;
begin
  result:=false;
  if (Curr_95_Del_KT_GOBKK+H_95_Del_KT_GOBKK>Lim_95_Del_KT_GOBKK_max)
  then
    exit;
  Curr_95_Del_KT_GOBKK:=Curr_95_Del_KT_GOBKK+H_95_Del_KT_GOBKK;
  result:=true;

  RecalcParam_95;
end;

function TRatioParam.Step_95_Del_R600_R1000_Minus: boolean;
begin
  result:=false;
  if (Curr_95_Del_R600_R1000-H_95_Del_R600_R1000<Lim_95_Del_R600_R1000_min)
  then
    exit;
  Curr_95_Del_R600_R1000:=Curr_95_Del_R600_R1000-H_95_Del_R600_R1000;
  result:=true;

  RecalcParam_95;
end;

function TRatioParam.Step_95_Del_R600_R1000_Plus: boolean;
begin
  result:=false;
  if (Curr_95_Del_R600_R1000+H_95_Del_R600_R1000>Lim_95_Del_R600_R1000_max)
  then
    exit;
  Curr_95_Del_R600_R1000:=Curr_95_Del_R600_R1000+H_95_Del_R600_R1000;
  result:=true;

  RecalcParam_95;
end;


function TRatioParam.Step_95_Sum_Alkil_MTBE_Minus: boolean;
var
  sum: double;
begin
  result:=false;
  //alkil
  if (FlowRatio95[8]-H_95_Alkil/2<Lim_95_Alkil_min)
  and
  //mtbe
  (FlowRatio95[9]-H_95_MTBE/2<Lim_95_MTBE_min)
  then
    exit;
  if (FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]+H_95_Alkil/2>Lim_95_Prjam_max)
  and
     (FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]+H_95_MTBE/2>Lim_95_Prjam_max)
  then
  begin
    exit;
  end;



  if (FlowRatio95[8]-H_95_Alkil/2>=Lim_95_Alkil_min)

  then
  begin
    FlowRatio95[8]:=FlowRatio95[8]-H_95_Alkil/2;
    sum:=(FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]);
    FlowRatio95[10]:=FlowRatio95[10]+H_95_Alkil/2*FlowRatio95[10]/sum;
    FlowRatio95[11]:=FlowRatio95[11]+H_95_Alkil/2*FlowRatio95[11]/sum;
    FlowRatio95[12]:=FlowRatio95[12]+H_95_Alkil/2*FlowRatio95[12]/sum;

    result:=true;
    exit;
  end;

  if (FlowRatio95[9]-H_95_MTBE/2>=Lim_95_MTBE_min)

  then
  begin
    FlowRatio95[9]:=FlowRatio95[9]-H_95_MTBE/2;
    sum:=(FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]);
    FlowRatio95[10]:=FlowRatio95[10]+H_95_MTBE/2*FlowRatio95[10]/sum;
    FlowRatio95[11]:=FlowRatio95[11]+H_95_MTBE/2*FlowRatio95[11]/sum;
    FlowRatio95[12]:=FlowRatio95[12]+H_95_MTBE/2*FlowRatio95[12]/sum;

    result:=true;
    exit;
  end;
end;

function TRatioParam.Step_95_Sum_Alkil_MTBE_Plus: boolean;
var
  sum: double;
  UseGOBKK_KT: boolean;
begin
  result:=false;
  UseGOBKK_KT:=false;
  //alkil
  if (FlowRatio95[8]+H_95_Alkil/2>Lim_95_Alkil_max)
  and
  //mtbe
  (FlowRatio95[9]+H_95_MTBE/2>Lim_95_MTBE_max)
  then
    exit;


  if (FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]-H_95_Alkil/2<Lim_95_Prjam_min)
  and
  (FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]-H_95_MTBE/2<Lim_95_Prjam_min)
  then
  begin
    UseGOBKK_KT:=true;
  end;

  if not UseGOBKK_KT then
  begin
    if (FlowRatio95[8]+H_95_Alkil/2<=Lim_95_Alkil_max)
   
    then
    begin
      FlowRatio95[8]:=FlowRatio95[8]+H_95_Alkil/2;
      sum:=(FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]);
      FlowRatio95[10]:=FlowRatio95[10]-H_95_Alkil/2*FlowRatio95[10]/sum;
      FlowRatio95[11]:=FlowRatio95[11]-H_95_Alkil/2*FlowRatio95[11]/sum;
      FlowRatio95[12]:=FlowRatio95[12]-H_95_Alkil/2*FlowRatio95[12]/sum;
    end;

    if (FlowRatio95[9]+H_95_MTBE/2<=Lim_95_MTBE_max)

    then
    begin
      FlowRatio95[9]:=FlowRatio95[9]+H_95_MTBE/2;
      sum:=(FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]);
      FlowRatio95[10]:=FlowRatio95[10]-H_95_MTBE/2*FlowRatio95[10]/sum;
      FlowRatio95[11]:=FlowRatio95[11]-H_95_MTBE/2*FlowRatio95[11]/sum;
      FlowRatio95[12]:=FlowRatio95[12]-H_95_MTBE/2*FlowRatio95[12]/sum;
    end;  


    result:=true;
    exit;
  end
  else
  begin
    if (FlowRatio95[9]+H_95_MTBE/2<=Lim_95_MTBE_max)
    and
    (Curr_95_Sum_KT_GOBKK-H_95_MTBE/2>=Lim_95_Sum_KT_GOBKK_min)

    then
    begin
      FlowRatio95[9]:=FlowRatio95[9]+H_95_MTBE/2;
      Curr_95_Sum_KT_GOBKK:=Curr_95_Sum_KT_GOBKK-H_95_MTBE/2;
      RecalcParam_95;
      result:=true;
      exit;
    end;
    if (FlowRatio95[8]+H_95_Alkil/2<=Lim_95_Alkil_max)
    and
    (Curr_95_Sum_KT_GOBKK-H_95_Alkil/2>=Lim_95_Sum_KT_GOBKK_min)

    then
    begin
      FlowRatio95[8]:=FlowRatio95[8]+H_95_Alkil/2;
      Curr_95_Sum_KT_GOBKK:=Curr_95_Sum_KT_GOBKK-H_95_Alkil/2;
      RecalcParam_95;
      result:=true;
      exit;
    end
    else
    begin
      exit;
    end;
  end;

end;


function TRatioParam.Step_95_Sum_Isomer_IsoPen_Minus: boolean;
var
  sum: double;
  UseMTBE: boolean;
begin
  result:=false;
  UseMTBE:=false;
  //isomer
  if (FlowRatio95[6]-H_95_Isomer/2<Lim_95_Isomer_min)
  and
  //isopen
  (FlowRatio95[7]-H_95_IsoPen/2<Lim_95_IsoPen_min)
  then
    exit;

  if (FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]+H_95_Isomer/2>Lim_95_Prjam_max)
  and
     (FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]+H_95_IsoPen/2>Lim_95_Prjam_max)
  then
  begin
    UseMTBE:=true;
    if (FlowRatio95[9]+H_95_Isomer/2>Lim_95_MTBE_max)
    and (FlowRatio95[9]+H_95_IsoPen/2>Lim_95_MTBE_max)
    then
    begin
      exit;
    end;
  end;
  if not UseMTBE then
  begin

    if (FlowRatio95[6]-H_95_Isomer/2>=Lim_95_Isomer_min)
    then
    begin
      FlowRatio95[6]:=FlowRatio95[6]-H_95_Isomer/2;
      sum:=(FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]);

      if sum>0 then
      begin
        FlowRatio95[10]:=FlowRatio95[10]+H_95_Isomer/2*FlowRatio95[10]/sum;
        FlowRatio95[11]:=FlowRatio95[11]+H_95_Isomer/2*FlowRatio95[11]/sum;
        FlowRatio95[12]:=FlowRatio95[12]+H_95_Isomer/2*FlowRatio95[12]/sum;
      end;

      result:=true;
    end;

    if (FlowRatio95[7]-H_95_IsoPen/2>=Lim_95_IsoPen_min)
    then
    begin

      FlowRatio95[7]:=FlowRatio95[7]-H_95_IsoPen/2*(1-Curr_95_Del_n_but_IsoPen);

      FlowRatio95[13]:=FlowRatio95[13]-H_95_IsoPen/2*Curr_95_Del_n_but_IsoPen;

      sum:=(FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]);

      if sum>0 then
      begin
        FlowRatio95[10]:=FlowRatio95[10]+H_95_IsoPen/2*FlowRatio95[10]/sum;
        FlowRatio95[11]:=FlowRatio95[11]+H_95_IsoPen/2*FlowRatio95[11]/sum;
        FlowRatio95[12]:=FlowRatio95[12]+H_95_IsoPen/2*FlowRatio95[12]/sum;
      end;

      result:=true;

    end;
  end
  else
  begin
    if (FlowRatio95[6]-H_95_Isomer/2>=Lim_95_Isomer_min)
    then
    begin
      FlowRatio95[6]:=FlowRatio95[6]-H_95_Isomer/2;

      FlowRatio95[9]:=FlowRatio95[9]+H_95_Isomer/2;

      result:=true;
    end;

    if (FlowRatio95[7]-H_95_IsoPen/2>=Lim_95_IsoPen_min)
    then
    begin

      FlowRatio95[7]:=FlowRatio95[7]-H_95_IsoPen/2*(1-Curr_95_Del_n_but_IsoPen);

      FlowRatio95[13]:=FlowRatio95[13]-H_95_IsoPen/2*Curr_95_Del_n_but_IsoPen;


      FlowRatio95[9]:=FlowRatio95[9]+H_95_IsoPen/2;


      result:=true;
      
    end;
  end;
end;

function TRatioParam.Step_95_Sum_Isomer_IsoPen_Plus: boolean;
var
  sum: double;
  UseMTBE: boolean;
begin
  result:=false;
  UseMTBE:=false;

  //isomer
  if (FlowRatio95[6]+H_95_Isomer/2>Lim_95_Isomer_max)
  and
  //isopen
  (FlowRatio95[7]+H_95_IsoPen/2>Lim_95_IsoPen_max)
  then
    exit;
  if (FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]-H_95_Isomer/2<Lim_95_Prjam_min)
  and
     (FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]-H_95_IsoPen/2<Lim_95_Prjam_min)
  then
  begin
    UseMTBE:=true;
    if (FlowRatio95[9]-H_95_Isomer/2<Lim_95_MTBE_min)
    and (FlowRatio95[9]-H_95_IsoPen/2<Lim_95_MTBE_min)
    then
    begin
      exit;
    end;
  end;

  if not UseMTBE then
  begin

    if (FlowRatio95[6]+H_95_Isomer/2<=Lim_95_Isomer_max)
    then
    begin
      FlowRatio95[6]:=FlowRatio95[6]+H_95_Isomer/2;
      sum:=(FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]);
      if sum>0 then
      begin
        FlowRatio95[10]:=FlowRatio95[10]-H_95_Isomer*FlowRatio95[10]/sum;
        FlowRatio95[11]:=FlowRatio95[11]-H_95_Isomer*FlowRatio95[11]/sum;
        FlowRatio95[12]:=FlowRatio95[12]-H_95_Isomer*FlowRatio95[12]/sum;
      end;

      result:=true;

    end;

    if (FlowRatio95[7]+H_95_IsoPen/2<=Lim_95_IsoPen_max)
    then
    begin

      FlowRatio95[7]:=FlowRatio95[7]+H_95_IsoPen/2*(1-Curr_95_Del_n_but_IsoPen);

      FlowRatio95[13]:=FlowRatio95[13]+H_95_IsoPen/2*Curr_95_Del_n_but_IsoPen;

      sum:=(FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]);
      if sum>0 then
      begin
        FlowRatio95[10]:=FlowRatio95[10]-H_95_IsoPen*FlowRatio95[10]/sum;
        FlowRatio95[11]:=FlowRatio95[11]-H_95_IsoPen*FlowRatio95[11]/sum;
        FlowRatio95[12]:=FlowRatio95[12]-H_95_IsoPen*FlowRatio95[12]/sum;
      end;

      result:=true;

    end;
  end
  else
  begin
    if (FlowRatio95[6]+H_95_Isomer/2<=Lim_95_Isomer_max)
    then
    begin
      FlowRatio95[6]:=FlowRatio95[6]+H_95_Isomer/2;

      FlowRatio95[9]:=FlowRatio95[9]-H_95_Isomer/2;


      result:=true;

    end;

    if (FlowRatio95[7]+H_95_IsoPen/2<=Lim_95_IsoPen_max)
    then
    begin

      FlowRatio95[7]:=FlowRatio95[7]+H_95_IsoPen/2*(1-Curr_95_Del_n_but_IsoPen);

      FlowRatio95[13]:=FlowRatio95[13]+H_95_IsoPen/2*Curr_95_Del_n_but_IsoPen;

      FlowRatio95[9]:=FlowRatio95[9]-H_95_IsoPen/2;

      result:=true;
      
    end;
  end;
end;

function TRatioParam.Step_95_Sum_KT_GOBKK_Minus: boolean;
var
  sum: double;
  UseMTBE: boolean;
begin
  result:=false;
  UseMTBE:=false;

  if (Curr_95_Sum_KT_GOBKK-H_95_Sum_KT_GOBKK<Lim_95_Sum_KT_GOBKK_min)
  then
    exit;
  if (FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]+H_95_Sum_KT_GOBKK)>Lim_95_Prjam_max
  then
  begin
    UseMTBE:=true;

    if (FlowRatio95[9]+H_95_Sum_KT_GOBKK>Lim_95_MTBE_max)
    then
    begin
      exit;
    end;

  end;

  Curr_95_Sum_KT_GOBKK:=Curr_95_Sum_KT_GOBKK-H_95_Sum_KT_GOBKK;
  if not UseMTBE then
  begin
    sum:=(FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]);

    FlowRatio95[10]:=FlowRatio95[10]+H_95_Sum_KT_GOBKK*FlowRatio95[10]/sum;
    FlowRatio95[11]:=FlowRatio95[11]+H_95_Sum_KT_GOBKK*FlowRatio95[11]/sum;
    FlowRatio95[12]:=FlowRatio95[12]+H_95_Sum_KT_GOBKK*FlowRatio95[12]/sum;
  end
  else
  begin
    FlowRatio95[9]:=FlowRatio95[9]+H_95_Sum_KT_GOBKK;
  end;

  result:=true;

  RecalcParam_95;

end;

function TRatioParam.Step_95_Sum_KT_GOBKK_Plus: boolean;
var
  sum: double;
  UseMTBE: boolean;
begin
  result:=false;
  UseMTBE:=false;
  if (Curr_95_Sum_KT_GOBKK+H_95_Sum_KT_GOBKK>Lim_95_Sum_KT_GOBKK_max)
  then
    exit;
  if (FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]-H_95_Sum_KT_GOBKK)<Lim_95_Prjam_min
  then
  begin
    UseMTBE:=true;

    if (FlowRatio95[9]-H_95_Sum_KT_GOBKK<Lim_95_MTBE_min)
    then
    begin
      exit;
    end;

  end;
  Curr_95_Sum_KT_GOBKK:=Curr_95_Sum_KT_GOBKK+H_95_Sum_KT_GOBKK;
  if not UseMTBE then
  begin
    sum:=(FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]);

    FlowRatio95[10]:=FlowRatio95[10]-H_95_Sum_KT_GOBKK*FlowRatio95[10]/sum;
    FlowRatio95[11]:=FlowRatio95[11]-H_95_Sum_KT_GOBKK*FlowRatio95[11]/sum;
    FlowRatio95[12]:=FlowRatio95[12]-H_95_Sum_KT_GOBKK*FlowRatio95[12]/sum;
  end
  else
  begin
    FlowRatio95[9]:=FlowRatio95[9]-H_95_Sum_KT_GOBKK;
  end;

  result:=true;
  RecalcParam_95;

end;

function TRatioParam.Step_95_Sum_R600_R1000_Minus: boolean;
var
  sum: double;
  UseMTBE: boolean;
begin
  result:=false;
  UseMTBE:=false;

  if (Curr_95_Sum_R600_R1000-H_95_Sum_R600_R1000<Lim_95_Sum_R600_R1000_min)
  then
    exit;
  if (FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]+H_95_Sum_R600_R1000)>Lim_95_Prjam_max
  then
  begin
    UseMTBE:=true;

    if (FlowRatio95[9]+H_95_Sum_R600_R1000>Lim_95_MTBE_max)
    then
    begin
      exit;
    end;

  end;

  Curr_95_Sum_R600_R1000:=Curr_95_Sum_R600_R1000-H_95_Sum_R600_R1000;
  if not UseMTBE then
  begin
    sum:=(FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]);

    FlowRatio95[10]:=FlowRatio95[10]+H_95_Sum_R600_R1000*FlowRatio95[10]/sum;
    FlowRatio95[11]:=FlowRatio95[11]+H_95_Sum_R600_R1000*FlowRatio95[11]/sum;
    FlowRatio95[12]:=FlowRatio95[12]+H_95_Sum_R600_R1000*FlowRatio95[12]/sum;
  end
  else
  begin
    FlowRatio95[9]:=FlowRatio95[9]+H_95_Sum_R600_R1000;
  end;

  result:=true;

  RecalcParam_95;
end;

function TRatioParam.Step_95_Sum_R600_R1000_Plus: boolean;
var
  sum: double;
  UseMTBE: boolean;
begin
  result:=false;
  UseMTBE:=false;
  if (Curr_95_Sum_R600_R1000+H_95_Sum_R600_R1000>Lim_95_Sum_R600_R1000_max)
  then
    exit;
  if (FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]-H_95_Sum_R600_R1000)<Lim_95_Prjam_min
  then
  begin
    UseMTBE:=true;

    if (FlowRatio95[9]-H_95_Sum_R600_R1000<Lim_95_MTBE_min)
    then
    begin
      exit;
    end;

  end;

  Curr_95_Sum_R600_R1000:=Curr_95_Sum_R600_R1000+H_95_Sum_R600_R1000;
  if not UseMTBE then
  begin

    sum:=(FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]);

    FlowRatio95[10]:=FlowRatio95[10]-H_95_Sum_R600_R1000*FlowRatio95[10]/sum;
    FlowRatio95[11]:=FlowRatio95[11]-H_95_Sum_R600_R1000*FlowRatio95[11]/sum;
    FlowRatio95[12]:=FlowRatio95[12]-H_95_Sum_R600_R1000*FlowRatio95[12]/sum;
  end
  else
  begin
    FlowRatio95[9]:=FlowRatio95[9]-H_95_Sum_R600_R1000;
  end;

  result:=true;

  RecalcParam_95;
end;

function TRatioParam.Step_95_Sum_Toluol_Minus: boolean;
var
  sum: double;
  UseMTBE: boolean;

begin
  result:=false;
  UseMTBE:=false;
  if Net_Toluol then exit;
  if (FlowRatio95[5]-H_95_Toluol<Lim_95_Toluol_min)
  then
    exit;
  if (FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]+H_95_Toluol>Lim_95_Prjam_max)
  then
  begin
    UseMTBE:=true;
    if (FlowRatio95[9]+H_95_Toluol>Lim_95_MTBE_max)
    then
    begin
      exit;
    end;
  end;


  FlowRatio95[5]:=FlowRatio95[5]-H_95_Toluol;
  if not UseMTBE then
  begin

    sum:=(FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]);

    FlowRatio95[10]:=FlowRatio95[10]+H_95_Toluol*FlowRatio95[10]/sum;
    FlowRatio95[11]:=FlowRatio95[11]+H_95_Toluol*FlowRatio95[11]/sum;
    FlowRatio95[12]:=FlowRatio95[12]+H_95_Toluol*FlowRatio95[12]/sum;
  end
    else
  begin
    FlowRatio95[9]:=FlowRatio95[9]+H_95_Toluol;
  end;

  result:=true;

end;

function TRatioParam.Step_95_Sum_Toluol_Plus: boolean;
var
  sum: double;
  UseMTBE: boolean;

begin
  result:=false;
  UseMTBE:=false;
  if Net_Toluol then exit;
  
  if (FlowRatio95[5]+H_95_Toluol>Lim_95_Toluol_max)
  then
    exit;
  if (FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]-H_95_Toluol<Lim_95_Prjam_min)
  then
  begin
    UseMTBE:=true;
    if (FlowRatio95[9]-H_95_Toluol<Lim_95_MTBE_min)
    then
    begin
      exit;
    end;
  end;

  FlowRatio95[5]:=FlowRatio95[5]+H_95_Toluol;
  if not UseMTBE then
  begin
    sum:=(FlowRatio95[10]+FlowRatio95[11]+FlowRatio95[12]);

    FlowRatio95[10]:=FlowRatio95[10]-H_95_Toluol*FlowRatio95[10]/sum;
    FlowRatio95[11]:=FlowRatio95[11]-H_95_Toluol*FlowRatio95[11]/sum;
    FlowRatio95[12]:=FlowRatio95[12]-H_95_Toluol*FlowRatio95[12]/sum;
  end
  else
  begin
    FlowRatio95[9]:=FlowRatio95[9]-H_95_Toluol;
  end;

  result:=true;
end;






function TRatioParam.Step_98_GOBKK_Minus: boolean;
begin
  result:=false;
  if (FlowRatio98[1]+H_98_GOBKK>Lim_98_GOBKK_max)
  then
    exit;
  if (FlowRatio98[9]-H_98_KT<Lim_98_MTBE_min)
  then
  begin
    exit;
  end;
  // не доделано 19/02/2015
end;

function TRatioParam.Step_98_KT_Plus: boolean;
begin
  result:=false;
  if (FlowRatio98[2]+H_98_KT>Lim_98_KT_max)
  then
    exit;
  if (FlowRatio98[2]/FlowRatio98[1]>Lim_98_Del_KT_GOBKK_max)
  then
    exit;

  if (FlowRatio98[9]-H_98_KT<Lim_98_MTBE_min)
  then
  begin
    exit;
  end;

  FlowRatio98[2]:=FlowRatio98[2]+H_98_KT;
  FlowRatio98[9]:=FlowRatio98[9]-H_98_KT;
  Curr_98_Sum_KT_GOBKK:= FlowRatio98[1]+FlowRatio98[2];

  Curr_98_Del_KT_GOBKK:= FlowRatio98[2]/FlowRatio98[1];

  result:=true;


end;





function TRatioParam.Step_98_MTBE_Minus: boolean;
begin
  result:=false;

  if (Curr_98_Sum_KT_GOBKK+H_98_Sum_KT_GOBKK>Lim_98_Sum_KT_GOBKK_max)
  then
    exit;
  if (FlowRatio98[9]-H_98_Sum_KT_GOBKK<Lim_98_MTBE_min)
  then
    exit;

  Curr_98_Sum_KT_GOBKK:=Curr_98_Sum_KT_GOBKK+H_98_Sum_KT_GOBKK;
  FlowRatio98[9]:=FlowRatio98[9]-H_98_Sum_KT_GOBKK;

  RecalcParam_98;
  result:=true;

end;

function TRatioParam.Step_98_MTBE_Plus: boolean;
begin
  result:=false;

  if (Curr_98_Sum_KT_GOBKK-H_98_Sum_KT_GOBKK<Lim_98_Sum_KT_GOBKK_min)
  then
    exit;
  if (FlowRatio98[9]+H_98_Sum_KT_GOBKK>Lim_98_MTBE_max)
  then
    exit;

  Curr_98_Sum_KT_GOBKK:=Curr_98_Sum_KT_GOBKK-H_98_Sum_KT_GOBKK;
  FlowRatio98[9]:=FlowRatio98[9]+H_98_Sum_KT_GOBKK;

  RecalcParam_98;
  result:=true;
end;

function TRatioParam.Step_98_R1000_Plus: boolean;
begin
  result:=false;

  if (FlowRatio98[3]>Lim_98_Sum_R600_R1000_max)
  then
    exit;

  if (Curr_98_Sum_KT_GOBKK-H_98_R600)<Lim_98_Sum_KT_GOBKK_min then
    exit;

  if FlowRatio98[2]/(FlowRatio98[1]-H_98_R600)>Lim_98_Del_KT_GOBKK_max then
    exit;

  FlowRatio98[3]:=FlowRatio98[3]+H_98_R600;   //лень менять на H_98_R1000

  FlowRatio98[1]:=FlowRatio98[1]-H_98_R600;

  Curr_98_Sum_KT_GOBKK:= FlowRatio98[1]+FlowRatio98[2];

  Curr_98_Del_KT_GOBKK:= FlowRatio98[2]/FlowRatio98[1];

  Curr_98_Sum_R600_R1000:= FlowRatio98[3]+FlowRatio98[4];

  Curr_98_Del_R600_R1000:= FlowRatio98[4]/FlowRatio98[3];


  result:=true;

end;

function TRatioParam.Step_98_R600_Plus: boolean;
begin
begin
  result:=false;

  if (FlowRatio98[4]/FlowRatio98[3]>Lim_98_Del_R600_R1000_max)
  then
    exit;

  FlowRatio98[4]:=FlowRatio98[4]+H_98_R600;
  FlowRatio98[3]:=FlowRatio98[3]-H_98_R600;

  Curr_98_Del_R600_R1000:= FlowRatio98[4]/FlowRatio98[3];

  result:=true;


end;

end;

function TRatioParam.Step_98_Sum_R600_R1000_Minus: boolean;
begin
  result:=false;

  if (Curr_98_Sum_R600_R1000-H_98_Sum_R600_R1000<Lim_98_Sum_R600_R1000_min)
  then
    exit;
  if (FlowRatio98[6]+H_98_Sum_R600_R1000>Lim_98_Isomer_max)
  and
  //isopen
  (FlowRatio98[7]+H_98_Sum_R600_R1000>Lim_98_IsoPen_max)
  then
    exit;

  if (Curr_98_Sum_R600_R1000-H_98_Sum_R600_R1000<Lim_98_Sum_R600_R1000_min)
  and (Ind_98_Isomer_IsoPen=0)
  then
    Ind_98_Isomer_IsoPen:=1;
  if (Curr_98_Sum_R600_R1000-H_98_Sum_R600_R1000<Lim_98_Sum_R600_R1000_min)
  and (Ind_98_Isomer_IsoPen=1)
  then
    Ind_98_Isomer_IsoPen:=0;

  if (FlowRatio98[6]+H_98_Sum_R600_R1000<=Lim_98_Isomer_max)
    and (Ind_98_Isomer_IsoPen=0)
  then
  begin
    FlowRatio98[6]:=FlowRatio98[6]+H_98_Sum_R600_R1000;
    Curr_98_Sum_R600_R1000:=Curr_98_Sum_R600_R1000-H_98_Sum_R600_R1000;

  end;
  if (FlowRatio98[7]+H_98_Sum_R600_R1000<=Lim_98_IsoPen_max)
    and (Ind_98_Isomer_IsoPen=1)
  then
  begin
    FlowRatio98[7]:=FlowRatio98[7]+H_98_Sum_R600_R1000;
    Curr_98_Sum_R600_R1000:=Curr_98_Sum_R600_R1000-H_98_Sum_R600_R1000;

  end;
  Ind_98_Isomer_IsoPen:=trunc(power(2,Ind_98_Isomer_IsoPen));
  if Ind_98_Isomer_IsoPen>1 then Ind_98_Isomer_IsoPen:=0;

  result:=true;

  RecalcParam_98;

end;



function TRatioParam.Step_98_Sum_Toluol_Minus: boolean;
var
  UseMTBE: boolean;
begin
  result:=false;
  UseMTBE:=false;
  if Net_Toluol then exit;
  if (FlowRatio98[5]-H_98_Toluol<Lim_98_Toluol_min)
  then
    exit;
  if (FlowRatio98[8]+H_98_Toluol>Lim_98_Alkil_max)
  then
  begin

    UseMTBE:=true;

  end;

  if not UseMTBE then
  begin
    FlowRatio98[5]:=FlowRatio98[5]-H_98_Toluol;

    FlowRatio98[8]:=FlowRatio98[8]+H_98_Toluol;
  end
  else
  begin
    if FlowRatio98[9]+H_98_Toluol> Lim_98_MTBE_max then
      exit;
    FlowRatio98[5]:=FlowRatio98[5]-H_98_Toluol;
    FlowRatio98[9]:=FlowRatio98[9]+H_98_Toluol;
  end;

  
  result:=true;

end;


procedure TFlowCompaunding.CalcMasOfVolConz(T: double);
var
  i: integer;
  sum: double;
begin
  for i:=0 to Length(Components)-1 do
  begin
    Components[i].ConcentrCompVol:=Components[i].ConcentrComp;
  end;
  sum:=0;
  for i:=0 to Length(Components)-1 do
  begin
    Components[i].Calc_lambda_Ro1T_Ro2T(T);
    sum:=sum+Components[i].ConcentrCompVol*Components[i].Ro1T;
  end;

  for i:=0 to Length(Components)-1 do
  begin
    if sum>0 then
      Components[i].ConcentrComp:=Components[i].ConcentrCompVol*Components[i].Ro1T/sum*100;
  end;
end;

procedure TFlowCompaunding.CalcVolOfMassConz(T: double);
var
  i: integer;
  sum: double;
begin

  for i:=0 to Length(Components)-1 do
  begin
    Components[i].Calc_lambda_Ro1T_Ro2T(T);
    sum:=sum+Components[i].ConcentrComp/Components[i].Ro1T;
  end;

  for i:=0 to Length(Components)-1 do
  begin
    if sum>0 then
      Components[i].ConcentrCompVol:=Components[i].ConcentrComp*Components[i].Ro1T/sum*100;
  end;

end;

procedure TTotalFlowCompaunding.CalcVolOfMassConz(T: double);
var
  i: integer;
  sum: double;
begin

  for i:=0 to Length(Components)-1 do
  begin
    Components[i].Calc_lambda_Ro1T_Ro2T(T);
    sum:=sum+Components[i].ConcentrComp/Components[i].Ro1T;
  end;

  for i:=0 to Length(Components)-1 do
  begin
    if sum>0 then
      Components[i].ConcentrCompVol:=Components[i].ConcentrComp*Components[i].Ro1T/sum*100;
  end;

end;

{ TArrTotalFlowCompaunding }

procedure TArrTotalFlowCompaunding.AddItem(TC: TTotalFlowCompaunding);
begin

  SetLength(Items, Length(Items)+1);
  Items[Length(Items)-1]:=TTotalFlowCompaunding.Create;
  TC.Assign(Items[Length(Items)-1]);
end;

procedure TFlowCompaunding.Assign(var _Flow: TFlowCompaunding);
var
  i: integer;
begin
  _Flow.Name:=Name;
  SetLength(_Flow.Components, length(Components));
  for i:=0 to length(Components)-1 do
  begin
    _Flow.Components[i]:=TComponentCompaunding.Create;
    Components[i].Assign(_Flow.Components[i]);
  end;
  _Flow.ExpenditureOfDay:=ExpenditureOfDay;
  _Flow.Expenditure:=Expenditure;
  _Flow.ExistExpenditure:=ExistExpenditure;
  _Flow.ExistExpenditure2:=ExistExpenditure2;
  _Flow.NameOfCondition:=NameOfCondition;
  _Flow.IndexOfCondition:=IndexOfCondition;
  _Flow.VidDolej:=VidDolej;
  _Flow.Price:=Price;
end;

{ TCondition }

procedure TCondition.Assign(var _Cond: TCondition);
var
  i: integer;
begin
  _Cond.Name:=Name;
  _Cond.OV:=OV;
  SetLength(_Cond.restrictions, Length(restrictions));
  for i:=0 to Length(_Cond.restrictions)-1 do
    _Cond.restrictions[i]:=restrictions[i];
  
end;

procedure TTotalFlowCompaunding.Assign(var TC: TTotalFlowCompaunding);
var
  i: integer;
begin
  TC.Name:=Name;
  SetLength(TC.Components, Length(Components));
  for i:=0 to Length(Components)-1 do
  begin
    TC.Components[i]:=TComponentCompaunding.Create;
    Components[i].Assign(TC.Components[i]);
  end;
  TC.Expenditure:=Expenditure;
  SetLength(TC.Flows, Length(Flows));
  for i:=0 to Length(Flows)-1 do
  begin
    TC.Flows[i]:=TFlowCompaunding.Create;
    Flows[i].Assign(TC.Flows[i]);
  end;
  SetLength(TC.Additives, Length(Additives));
  for i:=0 to Length(Additives)-1 do
  begin
    TC.Additives[i]:= TAdditiveCompaunding.Create;
    Additives[i].Assign(TC.Additives[i]);
  end;
  TC.NeedOV:=NeedOV;
  TC.TotalFlowPravila:=TTotalFlowPravila.Create;
  SetLength(TC.TotalFlowPravila.Pravila, Length(TotalFlowPravila.Pravila));
  for i:=0 to Length(TotalFlowPravila.Pravila)-1 do
  begin
    TC.TotalFlowPravila.Pravila[i]:=TPravilo.Create;
    TotalFlowPravila.Pravila[i].Assign(TC.TotalFlowPravila.Pravila[i]);
  end;
  TC.FlowTemp:=FlowTemp;
  TC.Olefin:=TOlefin.Create;
  Olefin.Assign(TC.Olefin);

  TC.ArrConditions:=TArrConditions.Create;
  ArrConditions.Assign(TC.ArrConditions);
  TC.RatioParam:=TRatioParam.Create;
  RatioParam.Assign(TC.RatioParam);
  TC.CreateGrid(_StringGridResult, _SG1Itog);

  TC.TotalPribl:=TotalPribl;
end;

{ TAdditiveCompaunding }

procedure TAdditiveCompaunding.Assign(var AddComp: TAdditiveCompaunding);
begin
  AddComp.Name:=Name;
  AddComp.P:=P;
  AddComp.deltaOVmax:=deltaOVmax;
  AddComp.Keff:=Keff;
  AddComp.CmaxAdditive:=CmaxAdditive;
  AddComp.ConcentrAdditive:=ConcentrAdditive;
  AddComp.FirstConcentrAdditive:=FirstConcentrAdditive;
  AddComp.LastConcentrAdditive:=LastConcentrAdditive;
  AddComp.StepConcentrAdditive:=StepConcentrAdditive;
  AddComp.ChangeConcentrAdditive:=ChangeConcentrAdditive;

end;

{ TPravilo }

procedure TPravilo.Assign(var Prav: TPravilo);
begin
  Prav.Name:=Name;
  Prav.Pravilo:=Pravilo;

end;

{ TIndivComponent }

procedure TIndivComponent.Assign(var IndivComp: TIndivComponent);
var
  i: integer;
begin
  IndivComp.Concentr:=Concentr;
  IndivComp.Name:=Name;

  SetLength(IndivComp.NameIndiv, Length(NameIndiv));
  for i:=0 to Length(NameIndiv)-1 do
     IndivComp.NameIndiv[i]:=NameIndiv[i];

end;

{ TGpuppeComponent }

procedure TGpuppeComponent.Assign(var GpuppeComp: TGpuppeComponent);
var
  i: integer;
begin
  GpuppeComp.Concentr:=Concentr;
  GpuppeComp.Name:=Name;

  SetLength(GpuppeComp.NameComp, Length(NameComp));
  for i:=0 to Length(NameComp)-1 do
     GpuppeComp.NameComp[i]:=NameComp[i];

end;

{ TIUnknowComponent }

procedure TIUnknowComponent.Assign(var IUnknowComp: TIUnknowComponent);
begin
  IUnknowComp.Concentr:=Concentr;
  IUnknowComp.Name:=Name;

end;

procedure TTotalFlowCompaunding.CreateGrid(SG1, SG2: TStringGrid);
var
  i, j: integer;
begin
  _StringGridResult:=TStringGrid.Create(SG1);
  _SG1Itog:=TStringGrid.Create(SG2);
  _StringGridResult.RowCount:=SG1.RowCount;
  _StringGridResult.ColCount:=SG1.ColCount;
  for i:=0 to SG1.RowCount-1 do
    for j:=0 to SG1.ColCount-1 do
      _StringGridResult.Cells[j,i]:=SG1.Cells[j,i];
  _SG1Itog.RowCount:=SG2.RowCount;
  _SG1Itog.ColCount:=SG2.ColCount;
  for i:=0 to SG2.RowCount-1 do
    for j:=0 to SG2.ColCount-1 do
      _SG1Itog.Cells[j,i]:=SG2.Cells[j,i];
end;

function TTotalFlowCompaunding.CalcPribl(Kol92, Kol95, Kol98, Kol80: double; Cena92, Cena95, Cena98, Cena80: double;
_RatPar:TRatioParam): double;
var
  i: integer;
  Stoim92,Stoim95,Stoim98,Stoim80: double;
begin
  result:=0;
  Stoim92:=0;
  Stoim95:=0;
  Stoim98:=0;
  Stoim80:=0;
  for i:=1 to 13 do
  begin
    Stoim92:=Stoim92+_RatPar.FlowRatio92[i]*Kol92/100*GetFlowOfIndexOfCondition(i).Price;
    Stoim95:=Stoim95+_RatPar.FlowRatio95[i]*Kol95/100*GetFlowOfIndexOfCondition(i).Price;
    Stoim98:=Stoim98+_RatPar.FlowRatio98[i]*Kol98/100*GetFlowOfIndexOfCondition(i).Price;
    Stoim80:=Stoim80+_RatPar.FlowRatio80[i]*Kol80/100*GetFlowOfIndexOfCondition(i).Price;

  end;

  Stoim92:=Kol92*Cena92-Stoim92;
  Stoim95:=Kol95*Cena95-Stoim95;
  Stoim98:=Kol98*Cena98-Stoim98;
  Stoim80:=Kol80*Cena80-Stoim80;
  result:=Stoim92+Stoim95+Stoim98+Stoim80;
end;

function TTotalFlowCompaunding.CalcSebestoim: double;
var
  i: integer;
begin
  result:=0;
  for i:=0 to Length(Flows)-1 do
  begin
    result:=result+Flows[i].Price*Flows[i].Expenditure/100;
  end;
  result:=roundto(result, -2);
end;

procedure TFlowCompaunding.AddFlow(_AFlow:TFlowCompaunding);
var
  i: integer;
begin
  //
  for i:=0 to Length(Components)-1 do
  begin
    Components[i].ConcentrComp:=(Components[i].ConcentrComp*Expenditure+
    _AFlow.Components[i].ConcentrComp*_AFlow.Expenditure)/(Expenditure+_AFlow.Expenditure);
  end;
  Expenditure:=Expenditure+_AFlow.Expenditure;
  ExistExpenditure:=ExistExpenditure+_AFlow.ExistExpenditure;
  ExistExpenditure2:=ExistExpenditure2+_AFlow.ExistExpenditure2;

  Price:=(Price*Expenditure+_AFlow.Price*_AFlow.Expenditure)/(Expenditure+_AFlow.Expenditure);
  ExpenditureOfDay:=ExpenditureOfDay+_AFlow.ExpenditureOfDay;


end;

procedure TFlowCompaunding.SetBigParam;
var
  i: integer;
  _MyIni: TIniFile;
  Arom, Olef: double;
  ColObj: integer;
begin
  Arom:=0;
  _MyIni:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'\BigParam.ini');
  ColObj:=_MyIni.ReadInteger('Arom', 'ColObj', 0);
  for i:=1 to ColObj do
  begin
    Arom:=Arom+GetCompOfName(_MyIni.ReadString('Arom','Name'+IntToStr(i),'')).ConcentrComp;
  end;
  BigParam.Ar:=Arom;
  Olef:=0;
  ColObj:=_MyIni.ReadInteger('Olef', 'ColObj', 0);
  for i:=1 to ColObj do
  begin
    Olef:=Olef+GetCompOfName(_MyIni.ReadString('Olef','Name'+IntToStr(i),'')).ConcentrComp;
  end;
  BigParam.Ol:=Olef;

  BigParam.B:= GetCompOfName('benzene').ConcentrComp;
  if GetCompOfName('Sera')<>nil then
  BigParam.S:= GetCompOfName('Sera').ConcentrComp;
  _MyIni.Destroy;
end;

procedure TFlowCompaunding.RasprBigParam;
Var
  _MyIni: TIniFile;
  i, ColObjAr, ColObjOl: integer;
  koef: double;
  str: string;
  ArrStr: TArrStr;
  CountArrStr: integer;
begin
  //
  _MyIni:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'\BigParam.ini');

  ColObjAr:=_MyIni.ReadInteger('Arom', 'ColObj', 0);

  for i:=1 to ColObjAr do
  begin
    str:=_MyIni.ReadString('Arom', 'Name'+IntToStr(i),'');
    if str='' then continue;
    if str='benzene' then continue;
    koef:=_MyIni.ReadFloat('Ar_'+NameOfCondition, str,0);
    if koef=0 then continue;
    GetCompOfName(str).ConcentrComp:=(BigParam.Ar-BigParam.B)*koef;

  end;
  ColObjOl:=_MyIni.ReadInteger('Olef', 'ColObj', 0);

  for i:=1 to ColObjOl do
  begin
    str:=_MyIni.ReadString('Olef', 'Name'+IntToStr(i),'');
    if str='' then continue;
    koef:=_MyIni.ReadFloat('Ol_'+NameOfCondition, str,0);
    if koef=0 then continue;
    GetCompOfName(str).ConcentrComp:=BigParam.Ol*koef;

  end;

  GetCompOfName('benzene').ConcentrComp:=BigParam.B;
  if GetCompOfName('Sera')<>nil then
  GetCompOfName('Sera').ConcentrComp:=BigParam.S;


  CountArrStr:=ColObjAr+ColObjOl+1;
  SetLength(ArrStr, CountArrStr);
  for i:=1 to ColObjAr do
  begin
    ArrStr[i-1]:=_MyIni.ReadString('Arom', 'Name'+IntToStr(i),'');
  end;
  for i:=ColObjAr+1 to ColObjOl+ColObjAr do
  begin
    ArrStr[i-1]:=_MyIni.ReadString('Olef', 'Name'+IntToStr(i-ColObjAr),'');
  end;
  ArrStr[CountArrStr-1]:= 'Sera';

  Prov100(true, ArrStr);
  SetBigParam;
  _MyIni.Destroy;
end;


{ TSOAPData }

function TSOAPData.GetData(_Date: TDateTime): boolean;
var
  i, j, ColFlows, ColParam: integer;
  myIni: TIniFile;
begin
  // QDIS
  myIni:= TIniFile.Create(ExtractFilePath(Application.ExeName)+'Spisok_QDIS_1.ini');
  ColFlows:=myIni.ReadInteger('Config', 'ColFlow', 0);
  SetLength(ObjectQDIS, ColFlows);
  for i:= 0 to ColFlows-1 do
  begin
    ObjectQDIS[i]:=TSOAPFlowQDIS.Create;
    ObjectQDIS[i].Name:=myIni.ReadString('Flow'+IntToStr(i+1), 'NameFlow', '');
    ColParam:=myIni.ReadInteger('Flow'+IntToStr(i+1), 'ColParam', 0);
    SetLength(ObjectQDIS[i].ParamsQDIS, ColParam);

    for j:=0 to ColParam-1 do
    begin
      ObjectQDIS[i].ParamsQDIS[j].DocRef:=myIni.ReadString('Flow'+IntToStr(i+1),
          'Param'+IntToStr(j+1)+ '_DocRef', '');
      ObjectQDIS[i].ParamsQDIS[j].NSt:=myIni.ReadString('Flow'+IntToStr(i+1),
          'Param'+IntToStr(j+1)+ '_Nst', '');
      ObjectQDIS[i].ParamsQDIS[j].Test:=myIni.ReadString('Flow'+IntToStr(i+1),
          'Param'+IntToStr(j+1)+ '_Test', '');
    end;
  end;
  //PI
  myIni:= TIniFile.Create(ExtractFilePath(Application.ExeName)+'Spisok_PI_1.ini');
  ColFlows:=myIni.ReadInteger('Config', 'ColFlow', 0);
  SetLength(ObjectPI, ColFlows);
  for i:= 0 to ColFlows-1 do
  begin
    ObjectPI[i]:=TSOAPFlowPI.Create;
    ObjectPI[i].Name:=myIni.ReadString('Flow'+IntToStr(i+1), 'NameFlow', '');
    ColParam:=myIni.ReadInteger('Flow'+IntToStr(i+1), 'ColParam', 0);
    SetLength(ObjectPI[i].ParamsPI, ColParam);

    for j:=0 to ColParam-1 do
    begin
      ObjectPI[i].ParamsPI[j].Datch:=myIni.ReadString('Flow'+IntToStr(i+1),
          'Param'+IntToStr(j+1), '');

    end;
  end;

  //запрос через SOAP

  ExecuteReadQDIS_PI(_Date, Self);
end;




{ TCompPlan }

procedure TCompPlan.CalcExpenditureBenz(CountDay: integer);
var
  i: integer;
begin
  //SetLength(RashCompOstatki, CountDay+1, Length(RashComp));
  for i:=0 to CountDay-1 do
    CalcExpenditureBenzDay(i);

end;

procedure TCompPlan.CalcExpenditureBenzDay(IndDay: integer);
function GetCompRash(_Rezept, _CompRash: TArrOfDouble; RashBenz: double):TArrOfDouble;
var
  i: integer;
begin
  SetLength(result, Length(_CompRash));
  for i:=0 to Length(_CompRash)-1 do
  begin
    result[i]:=_CompRash[i]-_Rezept[i]/100*RashBenz;
  end;
end;
function MaxRashBenz(_Rezept, _CompRash: TArrOfDouble): double;
var
  i: integer;
  min: double;
begin
  min:=0;
  for i:=0 to Length(_Rezept)-1 do
    if _Rezept[i]>0 then
    begin
       min:=_CompRash[i]*100/_Rezept[i];
       break;
    end;
  for i:=0 to Length(_Rezept)-1 do
  begin
    if (_Rezept[i]>0) and (min>_CompRash[i]*100/_Rezept[i]) then
    begin
      min:=_CompRash[i]*100/_Rezept[i];
    end;
  end;
  result:=min;
end;


function GetPorSled(nn:integer):TArrStr;
var
  i: integer;
  str: string;
procedure pr_recurs(n:integer);
var
  i,j: byte;
  sim: Char;
begin
   for i:=1 to n do
   begin
       sim:=str[n];
       for j:=n downto 2 do
       str[j]:=str[j-1];
       str[1]:=sim;
       if i<n then
       begin
         SetLength(result, Length(result)+1);
         result[Length(result)-1]:=str;
       end;
       if n>1 then pr_recurs(n-1);
   end;
end;
begin

  str:='';
  for i:=1 to nn do
  begin
    str:=str+IntToStr(i);
  end;
  SetLength(result, Length(result)+1);
  result[Length(result)-1]:=str;
  pr_recurs(Length(str));
end;
var
  MyRashComp, SumMRB:TArrOfDouble;
  i, j, k: integer;
  MRB: double;
  PorSled: TArrStr;
  MaxSumMRB: double;
  IndMaxSum: integer;
begin
  //определяю варианты порядка следования марок бензина, чтобы определить
  //максимальную сумму расхода бензина
  PorSled:=GetPorSled(Length(ArrBenzCompPlan));
  SetLength(MyRashComp, Length(RashComp));
  SetLength(SumMRB, Length(PorSled));

  for j:=0 to Length(PorSled)-1 do
  begin
    SumMRB[j]:=0;
    //считаем количество компонентов (остатки+расход на день) на заданный день
    for i:=0 to Length(MyRashComp)-1 do
    begin
      MyRashComp[i]:=RashCompOstatki[IndDay][i]+RashCompDay[i];
    end;

    for k:=0 to Length(ArrBenzCompPlan)-1 do
    begin
      //определяем максимальный расход
      MRB:=MaxRashBenz(ArrBenzCompPlan[StrToInt(PorSled[j][k+1])-1].Rezept, MyRashComp);
      MRB:=GetMRBOfDay(StrToInt(PorSled[j][k+1])-1, IndDay, MRB);
      SumMRB[j]:=SumMRB[j]+MRB;
      //пересчет количества
      MyRashComp:=GetCompRash(ArrBenzCompPlan[StrToInt(PorSled[j][k+1])-1].Rezept, MyRashComp, MRB);
    end;
  end;

  MaxSumMRB:=SumMRB[0];
  IndMaxSum:=0;
  for j:=1 to Length(PorSled)-1 do
  begin
    if SumMRB[j]>MaxSumMRB then
    begin
      MaxSumMRB:=SumMRB[j];
      IndMaxSum:=j;
    end;
  end;

    for i:=0 to Length(MyRashComp)-1 do
    begin
      MyRashComp[i]:=RashCompOstatki[IndDay][i]+RashCompDay[i];
    end;

    for k:=0 to Length(ArrBenzCompPlan)-1 do
    begin
      MRB:=MaxRashBenz(ArrBenzCompPlan[StrToInt(PorSled[IndMaxSum][k+1])-1].Rezept, MyRashComp);
      //добавить условие по заданным пользователем
      MRB:=GetMRBOfDay(StrToInt(PorSled[IndMaxSum][k+1])-1, IndDay, MRB);
      ArrBenzCompPlan[StrToInt(PorSled[IndMaxSum][k+1])-1].ArrBenzDay[IndDay].ExpenditureDay:=MRB;
      RashCompOstatki[IndDay+1]:=GetCompRash(ArrBenzCompPlan[StrToInt(PorSled[IndMaxSum][k+1])-1].Rezept, MyRashComp, MRB);
    end;
end;

function TCompPlan.Execute(_ArrTotal: TArrTotalFlowCompaunding): double;
var
  i, j: integer;
  bool92, bool95, bool98, bool80: boolean;
  CountDay: integer;
begin

  CountDay:=length(_ArrTotal.Items);

  for j:=0 to length(_ArrTotal.Items[0].flows)-1 do
  begin
    RashComp[j]:=_ArrTotal.Items[0].GetFlowOfIndexOfCondition(j+1).ExpenditureOfDay*CountDay;
    RashCompDay[j]:=_ArrTotal.Items[0].GetFlowOfIndexOfCondition(j+1).ExpenditureOfDay;

    RashCompOstatki[0][j]:=_ArrTotal.Items[0].
       GetFlowOfIndexOfCondition(j+1).ExistExpenditure2-RashCompDay[j];


  end;
  for j:=0 to length(_ArrTotal.Items[0].flows)-1 do
  begin
    RashComp[j]:=RashComp[j]+RashCompOstatki[0][j];
  end;
  bool92:=false;
  bool95:=false;
  bool98:=false;
  bool80:=false;
  for j:=0 to length(_ArrTotal.Items)-1 do
  begin
    if not bool92 then
    begin
      for i:=0 to 12 do
      begin
        ArrBenzCompPlan[0].Rezept[i]:=
                             _ArrTotal.Items[j].RatioParam.FlowRatio92[i+1];
        ArrBenzCompPlan[0].NeedExpenditure:=
          _ArrTotal.Items[j].ArrConditions.GetConditionOfName('Бензин 92').restrictions[6];

      end;
      bool92:=true;
    end;
    if not bool95 then
    begin
      for i:=0 to 12 do
      begin
        ArrBenzCompPlan[1].Rezept[i]:=
                             _ArrTotal.Items[j].RatioParam.FlowRatio95[i+1];
        ArrBenzCompPlan[1].NeedExpenditure:=
          _ArrTotal.Items[j].ArrConditions.GetConditionOfName('Бензин 95').restrictions[6];

      end;
      bool95:=true;
    end;
    if not bool98 then
    begin
      for i:=0 to 12 do
      begin
        ArrBenzCompPlan[2].Rezept[i]:=
                               _ArrTotal.Items[j].RatioParam.FlowRatio98[i+1];
        ArrBenzCompPlan[2].NeedExpenditure:=
          _ArrTotal.Items[j].ArrConditions.GetConditionOfName('Бензин 98').restrictions[6];

      end;
      bool98:=true;
    end;
    if not bool80 then
    begin
      for i:=0 to 12 do
      begin
        ArrBenzCompPlan[3].Rezept[i]:=
                              _ArrTotal.Items[j].RatioParam.FlowRatio80[i+1];
        ArrBenzCompPlan[3].NeedExpenditure:=
          _ArrTotal.Items[j].ArrConditions.GetConditionOfName('Бензин 80').restrictions[6];

      end;
      bool80:=true;
    end;
  end;
  CalcExpenditureBenz(CountDay);
end;

function TCompPlan.GetMRBOfDay(IndBenz, IndDay: integer;
  MRB: double): double;
var
  i: integer;
begin
  result:=0;
  for i:=0 to IndDay-1 do
  begin
    result:=result+ArrBenzCompPlan[IndBenz].ArrBenzDay[i].ExpenditureDay;
  end;
  result:=result+ArrBenzCompPlan[IndBenz].GetRashSetUser;
  result:=ArrBenzCompPlan[IndBenz].NeedExpenditure-result;
  // если требуемый меньше свободного
  if result>MRB then
  begin
    result:=MRB;
  end;
end;

function TCompPlan.HvatitLiRash: boolean;
var
  NeedRashComp: TArrOfDouble;
  i, j: integer;
begin
  result:=true;
  SetLength(NeedRashComp, Length(RashComp));
  for i:=0 to Length(NeedRashComp)-1 do
  begin
    NeedRashComp[i]:=0;
    for j:=0 to Length(ArrBenzCompPlan)-1 do
    begin
      NeedRashComp[i]:=NeedRashComp[i]+ArrBenzCompPlan[j].NeedExpenditure*
                             ArrBenzCompPlan[j].Rezept[i]/100;
    end;
  end;
  for i:=0 to Length(NeedRashComp)-1 do
  begin
    if NeedRashComp[i]>RashComp[i] then
      result:=false;
  end;
end;

procedure TCompPlan.Initialize(_ArrTotal: TArrTotalFlowCompaunding);
var
  i, j: integer;
  bool92, bool95, bool98, bool80: boolean;
  CountDay: integer;

begin
  CountDay:=length(_ArrTotal.Items);

  SetLength(RashComp, Length(_ArrTotal.Items[0].Flows));
  SetLength(RashCompDay, Length(_ArrTotal.Items[0].Flows));
  SetLength(RashCompOstatki, CountDay+1, Length(_ArrTotal.Items[0].Flows));
  bool92:=false;
  bool95:=false;
  bool98:=false;
  bool80:=false;
  for j:=0 to length(_ArrTotal.Items)-1 do
  begin
    if not bool92 then
    begin

      SetLength(ArrBenzCompPlan, Length(ArrBenzCompPlan)+1);
      ArrBenzCompPlan[Length(ArrBenzCompPlan)-1]:=TBenzCompPlan.Create;
      SetLength(ArrBenzCompPlan[Length(ArrBenzCompPlan)-1].ArrBenzDay, CountDay);
      for i:=0 to Length(ArrBenzCompPlan[Length(ArrBenzCompPlan)-1].ArrBenzDay)-1 do
      begin
        ArrBenzCompPlan[Length(ArrBenzCompPlan)-1].ArrBenzDay[i]:=TBenzDay.Create;
        ArrBenzCompPlan[Length(ArrBenzCompPlan)-1].ArrBenzDay[i].SetUser:=false;
      end;
      SetLength(ArrBenzCompPlan[Length(ArrBenzCompPlan)-1].Rezept, 13);

      bool92:=true;
    end;
    if not bool95 then
    begin
      SetLength(ArrBenzCompPlan, Length(ArrBenzCompPlan)+1);
      ArrBenzCompPlan[Length(ArrBenzCompPlan)-1]:=TBenzCompPlan.Create;
      SetLength(ArrBenzCompPlan[Length(ArrBenzCompPlan)-1].ArrBenzDay, CountDay);
      for i:=0 to Length(ArrBenzCompPlan[Length(ArrBenzCompPlan)-1].ArrBenzDay)-1 do
      begin
        ArrBenzCompPlan[Length(ArrBenzCompPlan)-1].ArrBenzDay[i]:=TBenzDay.Create;
        ArrBenzCompPlan[Length(ArrBenzCompPlan)-1].ArrBenzDay[i].SetUser:=false;
      end;

      SetLength(ArrBenzCompPlan[Length(ArrBenzCompPlan)-1].Rezept, 13);
      bool95:=true;
    end;
    if not bool98 then
    begin
      SetLength(ArrBenzCompPlan, Length(ArrBenzCompPlan)+1);
      ArrBenzCompPlan[Length(ArrBenzCompPlan)-1]:=TBenzCompPlan.Create;
      SetLength(ArrBenzCompPlan[Length(ArrBenzCompPlan)-1].ArrBenzDay, CountDay);
      for i:=0 to Length(ArrBenzCompPlan[Length(ArrBenzCompPlan)-1].ArrBenzDay)-1 do
      begin
        ArrBenzCompPlan[Length(ArrBenzCompPlan)-1].ArrBenzDay[i]:=TBenzDay.Create;
        ArrBenzCompPlan[Length(ArrBenzCompPlan)-1].ArrBenzDay[i].SetUser:=false;
      end;

      SetLength(ArrBenzCompPlan[Length(ArrBenzCompPlan)-1].Rezept, 13);
      bool98:=true;
    end;
    if not bool80 then
    begin
      SetLength(ArrBenzCompPlan, Length(ArrBenzCompPlan)+1);
      ArrBenzCompPlan[Length(ArrBenzCompPlan)-1]:=TBenzCompPlan.Create;
      SetLength(ArrBenzCompPlan[Length(ArrBenzCompPlan)-1].ArrBenzDay, CountDay);
      for i:=0 to Length(ArrBenzCompPlan[Length(ArrBenzCompPlan)-1].ArrBenzDay)-1 do
      begin
        ArrBenzCompPlan[Length(ArrBenzCompPlan)-1].ArrBenzDay[i]:=TBenzDay.Create;
        ArrBenzCompPlan[Length(ArrBenzCompPlan)-1].ArrBenzDay[i].SetUser:=false;
      end;

      SetLength(ArrBenzCompPlan[Length(ArrBenzCompPlan)-1].Rezept, 13);
      bool80:=true;
    end;
  end;

end;

{ TBenzCompPlan }

function TBenzCompPlan.GetRashSetUser: double;
var
  i: integer;
begin
  result:=0;
  for i:=0 to Length(ArrBenzDay)-1 do
  begin
    if ArrBenzDay[i].SetUser then
      result:=result+ArrBenzDay[i].ExpenditureDay;
  end;
end;

end.
