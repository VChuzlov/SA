unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls, UHTS;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    StringGrid2: TStringGrid;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    Button1: TButton;
    Label3: TLabel;
    StringGrid3: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure get_data(var flows_composition, flows_param: TArrOfArrOfDouble;
                       var heater_flow_rate, heater_flow_Temp, split_ratio: double);
    procedure show_results(flow_rate, flow_Cp, mixer_flow_Temp: double; flow_composition: TArrOfDouble;
                            _heater_flow_Temp: double; flow_rate1, flow_rate2: double);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  comp_count = 2;
  flows_count = 3;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.get_data(var flows_composition, flows_param: TArrOfArrOfDouble;
                       var heater_flow_rate, heater_flow_Temp, split_ratio: double);
var
  i, j: integer;

begin
  with StringGrid1 do
    begin
      for j := 0 to comp_count-1 do
        for i := 0 to flows_count-1 do
          begin
            flows_composition[i, j] := StrToFloat(Cells[i+1, j+3]);
            flows_param[i, j] := StrToFloat(Cells[i+1, j+1])
          end;
    end;
  with StringGrid2 do
    begin
      heater_flow_rate := StrToFloat(Cells[1, 1]);
      heater_flow_Temp := StrToFloat(Cells[1, 2]);
    end;
 split_ratio := StrToFloat(Edit1.Text)
end;

procedure TForm1.show_results(flow_rate, flow_Cp, mixer_flow_Temp: double; flow_composition: TArrOfDouble;
                            _heater_flow_Temp: double; flow_rate1, flow_rate2: double);
var
  i: integer;
begin
  with StringGrid3 do
    begin
      Cells[1, 1] := FloatToStrF(flow_rate, fffixed, 8, 2);
      for i := 0 to comp_count-1 do
        Cells[1, i+2] := FloatToStrF(flow_composition[i], fffixed, 8, 4);
      Cells[1, 4] := FloatToStrF(flow_Cp, fffixed, 8, 2);
      Cells[1, 5] := FloatToStrF(mixer_flow_Temp, fffixed, 8, 2);
      Cells[1, 6] := FloatToStrF(_heater_flow_Temp, fffixed, 8, 2);
      Cells[1, 7] := FloatToStrF(flow_rate1, fffixed, 8, 2);
      Cells[1, 8] := FloatToStrF(flow_rate2, fffixed, 8, 2);
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  flows_composition: TArrOfArrOfDouble; // ������ �������,���������� �� ��������
  flows_param: TArrOfArrOfDouble; // ��������� �������
  heater_flow_rate: double; // ������ �������� ������ ��������������
  heater_flow_Temp: double; // ��������� ����������� �������� ������ ��������������
  flow_rate: double; // ������ ������
  flow_Cp: double;  // ������������ ������
  mixer_flow_Temp: double; // ����������� ������ ����� ��������
  flow_composition: TArrOfDouble; // ������ ������ ����� ��������
  _heater_flow_Temp: double; // ����������� ��������� ������ ����� ��������������
  split_ratio: double;
  flow_rate1: double; // ������� ������ ����� ��������
  flow_rate2: double; // ������� ������ ����� ��������
  i, j: integer;
begin
  SetLength(flows_composition, flows_count, comp_count);
  SetLength(flows_param, flows_count, comp_count);
  SetLength(flow_composition, comp_count);

  get_data(flows_composition, flows_param, heater_flow_rate,
           heater_flow_Temp, split_ratio);

  mixer(comp_count, flows_count, flows_param, flows_composition, flow_rate,
        flow_Cp, mixer_flow_Temp, flow_composition);

  heater(comp_count, flows_count, heater_flow_rate, heater_flow_Temp, flow_rate,
         flow_Cp, _heater_flow_Temp);

  Splitter(split_ratio, flow_rate, flow_rate1, flow_rate2);

  show_results(flow_rate, flow_Cp, mixer_flow_Temp, flow_composition,
                            _heater_flow_Temp, flow_rate1, flow_rate2);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  with StringGrid1 do
    begin
      Cells[0, 0] := '��������';
      Cells[1, 0] := '����� 1';
      Cells[2, 0] := '����� 2';
      Cells[3, 0] := '����� 3';
      Cells[0, 1] := '������, �� / �';
      Cells[0, 2] := '�����������, ��';
      Cells[0, 3] := '���� ���������� 1';
      Cells[0, 4] := '���� ���������� 2';
      Cells[1, 1] := '2000';
      Cells[2, 1] := '2500';
      Cells[3, 1] := '3000';
      Cells[1, 2] := '300';
      Cells[2, 2] := '290';
      Cells[3, 2] := '310';
      Cells[1, 3] := '0,5';
      Cells[2, 3] := '0,6';
      Cells[3, 3] := '0,4';
      Cells[1, 4] := '0,5';
      Cells[2, 4] := '0,4';
      Cells[3, 4] := '0,6';
    end;
  with StringGrid2 do
    begin
      Cells[0, 0] := '��������';
      Cells[1, 0] := '��������';
      Cells[0, 1] := '������, �� / �';
      Cells[0, 2] := '�����������, ��';
      Cells[1, 1] := '6500';
      Cells[1, 2] := '375';
    end;
  with StringGrid3 do
    begin
      Cells[0, 0] := '��������';
      Cells[1, 0] := '��������';
      Cells[0, 1] := '������, �� / �';
      Cells[0, 2] := '���� ���������� 1';
      Cells[0, 3] := '���� ���������� 2';
      Cells[0, 4] := '������������ ������, ��� / (�� * �)';
      Cells[0, 5] := '����������� ������, �';
      Cells[0, 6] := '����������� ��������� ������, �';
      Cells[0, 7] := '������  ������ 1, �� / �';
      Cells[0, 8] := '������  ������ 2, �� / �';
    end;
end;

end.
