unit URezervuar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Math, IniFiles, Buttons, UMath;

type
  TRezervuars = class
    NameRezerv: array [1..24] of string;
    D_Rezerv: array [1..24] of double;
    H_Rezerv: array [1..24] of double;
    V_Rezerv: array [1..24] of double;
    procedure CalcV;

  end;
  TParamRezerv = class
    ParamName: array of string;
    ParamValue: array of double;
    ArrEd: array of TEdit;
    procedure GetParamRezerv;
    procedure SetToTotalComp(var TC: TTotalFlowCompaunding);
    procedure SetFromSOAP(SOAPObj: TSOAPData);

  end;
  TFRezervuar = class(TForm)
    GroupBox1: TGroupBox;
    Shape1: TShape;
    Shape4: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Shape6: TShape;
    GroupBox2: TGroupBox;
    Shape2: TShape;
    Label8: TLabel;
    Shape10: TShape;
    Shape3: TShape;
    Shape5: TShape;
    Label5: TLabel;
    GroupBox3: TGroupBox;
    Shape9: TShape;
    Label6: TLabel;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Label7: TLabel;
    GroupBox4: TGroupBox;
    Shape14: TShape;
    Label9: TLabel;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Label10: TLabel;
    GroupBox5: TGroupBox;
    Shape18: TShape;
    Label11: TLabel;
    Shape19: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Label12: TLabel;
    Label13: TLabel;
    Shape22: TShape;
    Shape23: TShape;
    Label14: TLabel;
    Shape24: TShape;
    Shape25: TShape;
    GroupBox6: TGroupBox;
    Shape26: TShape;
    Shape27: TShape;
    Shape28: TShape;
    Shape30: TShape;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    GroupBox7: TGroupBox;
    Shape29: TShape;
    Label19: TLabel;
    Shape31: TShape;
    Shape32: TShape;
    Shape33: TShape;
    Label20: TLabel;
    GroupBox8: TGroupBox;
    Shape34: TShape;
    Label21: TLabel;
    Shape35: TShape;
    Shape36: TShape;
    Shape37: TShape;
    Label22: TLabel;
    GroupBox9: TGroupBox;
    Shape38: TShape;
    Label23: TLabel;
    Shape39: TShape;
    Shape40: TShape;
    Shape41: TShape;
    Label24: TLabel;
    Ed7: TEdit;
    Ed8: TEdit;
    Ed9: TEdit;
    Ed21: TEdit;
    Ed22: TEdit;
    Ed23: TEdit;
    Ed24: TEdit;
    Ed72: TEdit;
    Ed73: TEdit;
    Ed87: TEdit;
    Ed88: TEdit;
    Ed78: TEdit;
    Ed79: TEdit;
    Ed81: TEdit;
    Ed84: TEdit;
    Ed177: TEdit;
    Ed178: TEdit;
    Ed85: TEdit;
    Ed86: TEdit;
    Ed1: TEdit;
    Ed2: TEdit;
    Ed3: TEdit;
    Ed4: TEdit;
    BitBtnOk: TBitBtn;
    BitBtnCan: TBitBtn;
    CB7: TComboBox;
    CB8: TComboBox;
    CB9: TComboBox;
    CB21: TComboBox;
    CB22: TComboBox;
    CB23: TComboBox;
    CB24: TComboBox;
    CB72: TComboBox;
    CB73: TComboBox;
    CB87: TComboBox;
    CB88: TComboBox;
    CB1: TComboBox;
    CB2: TComboBox;
    CB3: TComboBox;
    CB4: TComboBox;
    CB78: TComboBox;
    CB79: TComboBox;
    CB81: TComboBox;
    CB84: TComboBox;
    CB177: TComboBox;
    CB178: TComboBox;
    CB85: TComboBox;
    CB86: TComboBox;
    Shape42: TShape;
    Shape43: TShape;
    Ed83: TEdit;
    Label25: TLabel;
    CB83: TComboBox;
    Shape44: TShape;
    Shape45: TShape;
    Ed82: TEdit;
    Label26: TLabel;
    CB82: TComboBox;
    Shape8: TShape;
    Shape7: TShape;
    Ed77: TEdit;
    Label4: TLabel;
    CB77: TComboBox;
    Shape46: TShape;
    Shape47: TShape;
    Ed76: TEdit;
    Label27: TLabel;
    CB76: TComboBox;
    Shape48: TShape;
    Shape49: TShape;
    Ed75: TEdit;
    Label28: TLabel;
    CB75: TComboBox;
    Shape50: TShape;
    Shape51: TShape;
    Ed74: TEdit;
    Label29: TLabel;
    CB74: TComboBox;
    Shape52: TShape;
    Shape53: TShape;
    Ed179: TEdit;
    Label30: TLabel;
    CB179: TComboBox;
    Shape54: TShape;
    Shape55: TShape;
    Ed71: TEdit;
    Label31: TLabel;
    CB71: TComboBox;
    GroupBox10: TGroupBox;
    Shape56: TShape;
    Label32: TLabel;
    Shape57: TShape;
    Shape58: TShape;
    Shape59: TShape;
    Label33: TLabel;
    Shape60: TShape;
    Shape61: TShape;
    Label34: TLabel;
    Shape62: TShape;
    Shape63: TShape;
    Label35: TLabel;
    Shape64: TShape;
    Shape65: TShape;
    Label36: TLabel;
    Shape66: TShape;
    Shape67: TShape;
    Label37: TLabel;
    Ed95: TEdit;
    Ed96: TEdit;
    CB95: TComboBox;
    CB96: TComboBox;
    Ed94: TEdit;
    CB94: TComboBox;
    Ed93: TEdit;
    CB93: TComboBox;
    Ed92: TEdit;
    CB92: TComboBox;
    Ed91: TEdit;
    CB91: TComboBox;
    Shape68: TShape;
    Shape69: TShape;
    Ed97: TEdit;
    Label38: TLabel;
    CB97: TComboBox;
    Shape70: TShape;
    Shape71: TShape;
    Ed98: TEdit;
    Label39: TLabel;
    CB98: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRezervuar: TFRezervuar;

  _RVS: TRezervuars;
  _ParamRezerv: TParamRezerv;
  SOAP_DATA_CONNECT: integer = 0; // ���������� �� SOAP 0 - ���, 1 - ��
implementation

uses UiniExcel, USOAP;

{$R *.dfm}

procedure TFRezervuar.FormShow(Sender: TObject);
var
  i, j: integer;
begin
  

  if SOAP_DATA_CONNECT = 1 then exit;
  if INIExcel.ShowModal= mrOK then
  begin

    for i:=0 to ComponentCount-1 do
    begin
      if Components[i].ClassName = 'TEdit' then
      begin
        for j:=0 to Length(_ParamComp.EditParam)-1 do
        begin
          if _ParamComp.EditParam[j]=(Components[i] as TEdit).Name then
          begin
            if _ParamComp.ValueParam[j]<>'' then
              (Components[i] as TEdit).Text:=
                 FloatToStr(roundto(StrToFloat(_ParamComp.ValueParam[j]), -3));
          end;
        end;
      end;
    end;
  end;
end;
{ TRezervuars }

procedure TRezervuars.CalcV;
const
  ArrStr: array [1..24] of string = ('ShR_7', 'ShR_8', 'ShR_9', 'R_77',
    'ShR_1', 'ShR_2', 'ShR_3', 'ShR_4', 'R_21', 'R_22', 'R_23', 'R_24', 'R_72',
    'R_73', 'R_87', 'R_88', 'R_78', 'R_79', 'R_81', 'R_84', 'R_177', 'R_178',
    'R_85', 'R_86');
var
  _INIFILE: TIniFile;
  i: integer;
  ArrEd: array [1..24] of TEdit;

begin
  for i:=1 to Length(NameRezerv) do
    NameRezerv[i]:=ArrStr[i];
  // � %

  with FRezervuar do
  begin
    ArrEd[1]:=Ed7; ArrEd[2]:=Ed8; ArrEd[3]:=Ed9; ArrEd[4]:=Ed77; ArrEd[5]:=Ed1;
    ArrEd[6]:=Ed2; ArrEd[7]:=Ed3; ArrEd[8]:=Ed4; ArrEd[9]:=Ed21; ArrEd[10]:=Ed22;
    ArrEd[11]:=Ed23; ArrEd[12]:=Ed24; ArrEd[13]:=Ed72; ArrEd[14]:=Ed73; ArrEd[15]:=Ed87;
    ArrEd[16]:=Ed88; ArrEd[17]:=Ed78; ArrEd[18]:=Ed79; ArrEd[19]:=Ed81; ArrEd[20]:=Ed84;
    ArrEd[21]:=Ed177; ArrEd[22]:=Ed178; ArrEd[23]:=Ed85; ArrEd[24]:=Ed86;
  end;
  _INIFILE:= TIniFile.Create(ExtractFilePath(Application.ExeName)+'RVS.ini');
  for i:=1 to Length(NameRezerv) do
  begin
    D_Rezerv[i]:=_INIFILE.ReadFloat('RVS', NameRezerv[i]+'_D', 0);
    H_Rezerv[i]:=_INIFILE.ReadFloat('RVS', NameRezerv[i]+'_H', 0);
    if ((i>=1) and (i<=3)) or ((i>=5) and (i<=8)) then
    begin

    end
    else
    begin
      V_Rezerv[i]:=pi*D_Rezerv[i]/1000*D_Rezerv[i]/1000/4*H_Rezerv[i]/1000*
          StrToFloat(ArrEd[i].Text)/100;
    end;
  end;

end;

procedure TFRezervuar.BitBtnOkClick(Sender: TObject);

begin

end;


{ TParamRezerv }

procedure TParamRezerv.GetParamRezerv;
begin
  SetLength(ParamName, 39);
  SetLength(ParamValue, 39);
  SetLength(ArrEd, 39);

  ParamName[0]:=FRezervuar.CB1.Text;
  ParamName[1]:=FRezervuar.CB2.Text;
  ParamName[2]:=FRezervuar.CB3.Text;
  ParamName[3]:=FRezervuar.CB4.Text;
  ParamName[4]:=FRezervuar.CB7.Text;
  ParamName[5]:=FRezervuar.CB8.Text;
  ParamName[6]:=FRezervuar.CB9.Text;
  ParamName[7]:=FRezervuar.CB21.Text;
  ParamName[8]:=FRezervuar.CB22.Text;
  ParamName[9]:=FRezervuar.CB23.Text;
  ParamName[10]:=FRezervuar.CB24.Text;
  ParamName[11]:=FRezervuar.CB71.Text;
  ParamName[12]:=FRezervuar.CB72.Text;
  ParamName[13]:=FRezervuar.CB73.Text;
  ParamName[14]:=FRezervuar.CB74.Text;
  ParamName[15]:=FRezervuar.CB75.Text;
  ParamName[16]:=FRezervuar.CB76.Text;
  ParamName[17]:=FRezervuar.CB77.Text;
  ParamName[18]:=FRezervuar.CB78.Text;
  ParamName[19]:=FRezervuar.CB79.Text;
  ParamName[20]:=FRezervuar.CB81.Text;
  ParamName[21]:=FRezervuar.CB82.Text;
  ParamName[22]:=FRezervuar.CB83.Text;
  ParamName[23]:=FRezervuar.CB84.Text;
  ParamName[24]:=FRezervuar.CB85.Text;
  ParamName[25]:=FRezervuar.CB86.Text;
  ParamName[26]:=FRezervuar.CB87.Text;
  ParamName[27]:=FRezervuar.CB88.Text;
  ParamName[28]:=FRezervuar.CB177.Text;
  ParamName[29]:=FRezervuar.CB178.Text;
  ParamName[30]:=FRezervuar.CB179.Text;
  ParamName[31]:=FRezervuar.CB91.Text;
  ParamName[32]:=FRezervuar.CB92.Text;
  ParamName[33]:=FRezervuar.CB93.Text;
  ParamName[34]:=FRezervuar.CB94.Text;
  ParamName[35]:=FRezervuar.CB95.Text;
  ParamName[36]:=FRezervuar.CB96.Text;
  ParamName[37]:=FRezervuar.CB97.Text;
  ParamName[38]:=FRezervuar.CB98.Text;

  ParamValue[0]:=StrToFloat(FRezervuar.Ed1.Text);
  ParamValue[1]:=StrToFloat(FRezervuar.Ed2.Text);
  ParamValue[2]:=StrToFloat(FRezervuar.Ed3.Text);
  ParamValue[3]:=StrToFloat(FRezervuar.Ed4.Text);
  ParamValue[4]:=StrToFloat(FRezervuar.Ed7.Text);
  ParamValue[5]:=StrToFloat(FRezervuar.Ed8.Text);
  ParamValue[6]:=StrToFloat(FRezervuar.Ed9.Text);
  ParamValue[7]:=StrToFloat(FRezervuar.Ed21.Text);
  ParamValue[8]:=StrToFloat(FRezervuar.Ed22.Text);
  ParamValue[9]:=StrToFloat(FRezervuar.Ed23.Text);
  ParamValue[10]:=StrToFloat(FRezervuar.Ed24.Text);
  ParamValue[11]:=StrToFloat(FRezervuar.Ed71.Text);
  ParamValue[12]:=StrToFloat(FRezervuar.Ed72.Text);
  ParamValue[13]:=StrToFloat(FRezervuar.Ed73.Text);
  ParamValue[14]:=StrToFloat(FRezervuar.Ed74.Text);
  ParamValue[15]:=StrToFloat(FRezervuar.Ed75.Text);
  ParamValue[16]:=StrToFloat(FRezervuar.Ed76.Text);
  ParamValue[17]:=StrToFloat(FRezervuar.Ed77.Text);
  ParamValue[18]:=StrToFloat(FRezervuar.Ed78.Text);
  ParamValue[19]:=StrToFloat(FRezervuar.Ed79.Text);
  ParamValue[20]:=StrToFloat(FRezervuar.Ed81.Text);
  ParamValue[21]:=StrToFloat(FRezervuar.Ed82.Text);
  ParamValue[22]:=StrToFloat(FRezervuar.Ed83.Text);
  ParamValue[23]:=StrToFloat(FRezervuar.Ed84.Text);
  ParamValue[24]:=StrToFloat(FRezervuar.Ed85.Text);
  ParamValue[25]:=StrToFloat(FRezervuar.Ed86.Text);
  ParamValue[26]:=StrToFloat(FRezervuar.Ed87.Text);
  ParamValue[27]:=StrToFloat(FRezervuar.Ed88.Text);
  ParamValue[28]:=StrToFloat(FRezervuar.Ed177.Text);
  ParamValue[29]:=StrToFloat(FRezervuar.Ed178.Text);
  ParamValue[30]:=StrToFloat(FRezervuar.Ed179.Text);
  ParamValue[31]:=StrToFloat(FRezervuar.Ed91.Text);
  ParamValue[32]:=StrToFloat(FRezervuar.Ed92.Text);
  ParamValue[33]:=StrToFloat(FRezervuar.Ed93.Text);
  ParamValue[34]:=StrToFloat(FRezervuar.Ed94.Text);
  ParamValue[35]:=StrToFloat(FRezervuar.Ed95.Text);
  ParamValue[36]:=StrToFloat(FRezervuar.Ed96.Text);
  ParamValue[37]:=StrToFloat(FRezervuar.Ed97.Text);
  ParamValue[38]:=StrToFloat(FRezervuar.Ed98.Text);

  ArrEd[0]:=(FRezervuar.Ed1);
  ArrEd[1]:=(FRezervuar.Ed2);
  ArrEd[2]:=(FRezervuar.Ed3);
  ArrEd[3]:=(FRezervuar.Ed4);
  ArrEd[4]:=(FRezervuar.Ed7);
  ArrEd[5]:=(FRezervuar.Ed8);
  ArrEd[6]:=(FRezervuar.Ed9);
  ArrEd[7]:=(FRezervuar.Ed21);
  ArrEd[8]:=(FRezervuar.Ed22);
  ArrEd[9]:=(FRezervuar.Ed23);
  ArrEd[10]:=(FRezervuar.Ed24);
  ArrEd[11]:=(FRezervuar.Ed71);
  ArrEd[12]:=(FRezervuar.Ed72);
  ArrEd[13]:=(FRezervuar.Ed73);
  ArrEd[14]:=(FRezervuar.Ed74);
  ArrEd[15]:=(FRezervuar.Ed75);
  ArrEd[16]:=(FRezervuar.Ed76);
  ArrEd[17]:=(FRezervuar.Ed77);
  ArrEd[18]:=(FRezervuar.Ed78);
  ArrEd[19]:=(FRezervuar.Ed79);
  ArrEd[20]:=(FRezervuar.Ed81);
  ArrEd[21]:=(FRezervuar.Ed82);
  ArrEd[22]:=(FRezervuar.Ed83);
  ArrEd[23]:=(FRezervuar.Ed84);
  ArrEd[24]:=(FRezervuar.Ed85);
  ArrEd[25]:=(FRezervuar.Ed86);
  ArrEd[26]:=(FRezervuar.Ed87);
  ArrEd[27]:=(FRezervuar.Ed88);
  ArrEd[28]:=(FRezervuar.Ed177);
  ArrEd[29]:=(FRezervuar.Ed178);
  ArrEd[30]:=(FRezervuar.Ed179);
  ArrEd[31]:=(FRezervuar.Ed91);
  ArrEd[32]:=(FRezervuar.Ed92);
  ArrEd[33]:=(FRezervuar.Ed93);
  ArrEd[34]:=(FRezervuar.Ed94);
  ArrEd[35]:=(FRezervuar.Ed95);
  ArrEd[36]:=(FRezervuar.Ed96);
  ArrEd[37]:=(FRezervuar.Ed97);
  ArrEd[38]:=(FRezervuar.Ed98);

end;

procedure TParamRezerv.SetToTotalComp(var TC: TTotalFlowCompaunding);
var
  i, j: integer;
  _MyFlow: TFlowCompaunding;
begin
  for i:=1 to 13 do
  begin
    _MyFlow:=TC.GetFlowOfIndexOfCondition(i);
    if _MyFlow=nil then continue;
    for j:=0 to Length(ParamName)-1 do
    begin
      if ParamName[j]=_MyFlow.Name then
        _MyFlow.Expenditure:=_MyFlow.Expenditure+ParamValue[j];
    end;
  end;

  for i:=1 to 13 do
  begin
    _MyFlow:=TC.GetFlowOfIndexOfCondition(i);
    if _MyFlow=nil then continue;
    with _MyFlow do
    begin
      ExistExpenditure:=Expenditure;
      ExistExpenditure2:=Expenditure;

    end;
  end;
end;

procedure TParamRezerv.SetFromSOAP(SOAPObj: TSOAPData);
var
  i, j: integer;
begin

  for i:=0 to Length(ParamValue)-1 do
  begin
    for j:=0 to Length(SOAPObj.ObjectPI)-1 do
    begin
      if ArrEd[i].Name=SOAPObj.ObjectPI[j].Name then
      begin
        ParamValue[i]:=StrToFloat(SOAPObj.ObjectPI[j].ParamsPI[0].Value);
        ArrEd[i].Text:=SOAPObj.ObjectPI[j].ParamsPI[0].Value;
        break;
      end;
    end;
  end;


end;

procedure TFRezervuar.FormCreate(Sender: TObject);
begin
  {_RVS:= TRezervuars.Create;
  _RVS.CalcV;}
  _ParamRezerv:=TParamRezerv.Create;
  _ParamRezerv.GetParamRezerv;
end;

end.
