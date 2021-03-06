unit UPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, UMath, Menus;

type
  TFPlan = class(TForm)
    GroupBox1: TGroupBox;
    LBDay: TListBox;
    Panel1: TPanel;
    SG1: TStringGrid;
    SG2: TStringGrid;
    Splitter1: TSplitter;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Splitter2: TSplitter;
    GroupBox2: TGroupBox;
    ListBoxUsl: TListBox;
    Splitter3: TSplitter;
    SGUser: TStringGrid;
    procedure GetArrTotal(_ArrTotal:TArrTotalFlowCompaunding);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LBDayClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure SG1DblClick(Sender: TObject);
    procedure ListBoxUslDblClick(Sender: TObject);
    procedure SGUserDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPlan: TFPlan;
  ArrTotal:TArrTotalFlowCompaunding;
  CompPlan: TCompPlan;
implementation

uses UConditionPlan, USetUser;

{$R *.dfm}

{ TFPlan }

procedure TFPlan.GetArrTotal(_ArrTotal: TArrTotalFlowCompaunding);
begin
  ArrTotal:=TArrTotalFlowCompaunding.Create;
  ArrTotal:=_ArrTotal;
  CompPlan:= TCompPlan.Create;
  CompPlan.Initialize(ArrTotal);
end;

procedure TFPlan.FormShow(Sender: TObject);
var
  i, j, k: integer;
  bool: boolean;
begin
  SGUser.ColCount:=Length(ArrTotal.Items)+2;
  SGUser.RowCount:=2;
  for i:=0 to Length(ArrTotal.Items)-1 do
  begin
    for j:= 0 to Length(ArrTotal.Items[i].ArrConditions.Conditions)-1 do
    begin
      bool:=false;
      for k:=0 to SGUser.RowCount-1 do
      begin

        if SGUser.Cells[0,k]=ArrTotal.Items[i].ArrConditions.Conditions[j].Name then
          bool:=true;
      end;

      if not bool then
      begin

        SGUser.Cells[0,SGUser.RowCount-1]:=ArrTotal.Items[i].ArrConditions.Conditions[j].Name;
        SGUser.RowCount:=SGUser.RowCount+1;
      end;

    end;
  end;
  SGUser.RowCount:=SGUser.RowCount-1;
  for i:=0 to Length(ArrTotal.Items)-1 do
  begin
    LBDay.Items.Add(ArrTotal.Items[i].Name);
    SGUser.Cells[i+1,0]:=ArrTotal.Items[i].Name;
  end;
  SGUser.Cells[SGUser.ColCount-1,0]:='�����.���-��';
  
  SG1.DefaultColWidth:=100;
  SG2.DefaultColWidth:=100;
  SGUser.DefaultColWidth:=100;
  LBDay.ItemIndex:=0;
  LBDayClick(Sender);
end;

procedure TFPlan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ArrTotal.Free;
  LBDay.Clear;
  CompPlan.Destroy;
end;

procedure TFPlan.LBDayClick(Sender: TObject);
var
  i,j: integer;
begin
  with ArrTotal.Items[LBDay.ItemIndex] do
  begin
    SG1.RowCount:=_StringGridResult.RowCount;
    SG1.ColCount:=_StringGridResult.ColCount;
    for i:=0 to _StringGridResult.ColCount-1 do
      for j:=0 to _StringGridResult.RowCount-1 do
        SG1.Cells[i,j]:=_StringGridResult.Cells[i,j];

    SG2.RowCount:=_SG1Itog.RowCount;
    SG2.ColCount:=_SG1Itog.ColCount;
    for i:=0 to _SG1Itog.ColCount-1 do
      for j:=0 to _SG1Itog.RowCount-1 do
        SG2.Cells[i,j]:=_SG1Itog.Cells[i,j];

    ListBoxUsl.Clear;
    for i:=0 to Length(ArrConditions.Conditions)-1 do
    begin
      ListBoxUsl.Items.Add(ArrConditions.Conditions[i].Name);
    end;
  end;
end;

procedure TFPlan.N2Click(Sender: TObject);
var
  i, j: integer;
  
begin
  for i:=0 to Length(ArrTotal.Items)-2 do
  begin
    for j:=0 to Length(ArrTotal.Items[i].Flows)-1 do
    begin
      ArrTotal.Items[i].Flows[j].ExistExpenditure:=ArrTotal.Items[i].Flows[j].ExistExpenditure2;
    end;
    ArrTotal.Items[i].FlowRatioCalculation(ArrTotal.Items[i]._StringGridResult, ArrTotal.Items[i]._SG1Itog);
    for j:=0 to Length(ArrTotal.Items[i].Flows)-1 do
    begin
      ArrTotal.Items[i+1].Flows[j].ExistExpenditure2:=
        ArrTotal.Items[i].Flows[j].ExistExpenditure+
        ArrTotal.Items[i].Flows[j].ExpenditureOfDay;
    end;
  end;
  
  CompPlan.Execute(ArrTotal);

  for i:=0 to Length(CompPlan.ArrBenzCompPlan)-1 do
  begin
    for j:=0 to Length(CompPlan.ArrBenzCompPlan[i].ArrBenzDay)-1 do
    begin
      SGUser.Cells[j+1,i+1]:=FloatToStr(
            CompPlan.ArrBenzCompPlan[i].ArrBenzDay[j].ExpenditureDay);
    end;
    SGUser.Cells[Length(CompPlan.ArrBenzCompPlan[i].ArrBenzDay)+1,i+1]:=FloatToStr(
            CompPlan.ArrBenzCompPlan[i].NeedExpenditure);
  end;
  
end;

procedure TFPlan.SG1DblClick(Sender: TObject);
begin
  FormPlan.ShowModal;
end;

procedure TFPlan.ListBoxUslDblClick(Sender: TObject);
var
  Cond: TCondition;
begin
  if ListBoxUsl.ItemIndex>-1 then
  begin
    Cond:=ArrTotal.Items[LBDay.ItemIndex].ArrConditions.GetConditionOfName(
      ListBoxUsl.Items[ListBoxUsl.ItemIndex]);


    FormPlan.Edit1.Text:= Cond.Name;

    FormPlan.ComboBox1.ItemIndex:=FormPlan.ComboBox1.Items.IndexOf(FloatToStr(Cond.OV));

    FormPlan.Edit3.Text:= FloatToStr(Cond.restrictions[0]);
    FormPlan.Edit4.Text:= FloatToStr(Cond.restrictions[1]);
    FormPlan.Edit5.Text:= FloatToStr(Cond.restrictions[2]);
    FormPlan.Edit6.Text:= FloatToStr(Cond.restrictions[3]);
    FormPlan.Edit7.Text:= FloatToStr(Cond.restrictions[4]);
    FormPlan.Edit9.Text:= FloatToStr(Cond.restrictions[5]);
    FormPlan.Edit10.Text:= FloatToStr(Cond.restrictions[6]);
    FormPlan.Edit11.Text:= FloatToStr(Cond.restrictions[7]);
    FormPlan.Edit12.Text:= FloatToStr(Cond.restrictions[8]);
    FormPlan.Edit13.Text:= FloatToStr(Cond.restrictions[9]);


    if FormPlan.ShowModal= mrOk then
    begin
      Cond.Name:=FormPlan.Edit1.Text;
      Cond.OV:=StrToFloat(FormPlan.ComboBox1.Text);
      Cond.restrictions[0]:=StrToFloat(FormPlan.Edit3.Text);
      Cond.restrictions[1]:=StrToFloat(FormPlan.Edit4.Text);
      Cond.restrictions[2]:=StrToFloat(FormPlan.Edit5.Text);
      Cond.restrictions[3]:=StrToFloat(FormPlan.Edit6.Text);
      Cond.restrictions[4]:=StrToFloat(FormPlan.Edit7.Text);
      Cond.restrictions[5]:=StrToFloat(FormPlan.Edit9.Text);
      Cond.restrictions[6]:=StrToFloat(FormPlan.Edit10.Text);
      Cond.restrictions[7]:=StrToFloat(FormPlan.Edit11.Text);
      Cond.restrictions[8]:=StrToFloat(FormPlan.Edit12.Text);
      Cond.restrictions[9]:=StrToFloat(FormPlan.Edit13.Text);

      ListBoxUsl.Items[ListBoxUsl.ItemIndex]:=Cond.Name;
    end;
  end;

end;


procedure TFPlan.SGUserDblClick(Sender: TObject);
begin
  if FSetUser.ShowModal=mrOK then
  begin
    CompPlan.ArrBenzCompPlan[SGUser.Selection.Top-1].
       ArrBenzDay[SGUser.Selection.Left-1].SetUser:=true;
  end;
end;

end.
