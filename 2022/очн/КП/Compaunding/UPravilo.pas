unit UPravilo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UMath, UFlowOfVO;

type
  TFPravilo = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    ListBox1: TListBox;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    ListBox2: TListBox;
    Button8: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPravilo: TFPravilo;
  TFC: TTotalFlowCompaunding;

implementation


{$R *.dfm}

procedure TFPravilo.Button1Click(Sender: TObject);
begin
  if ((Sender as TButton).Caption[1] in ['<', '>', '=', '+', '-'])
     and
     (Edit1.Text[length(Edit1.Text)] in ['<', '>', '=', '+', '-'])
  then
    exit;
  if ((Sender as TButton).Caption[1] in ['<', '>', '=']) then
  begin
    if (pos('<', Edit1.Text)>0)
       or
       (pos('>', Edit1.Text)>0)
       or
       (pos('=', Edit1.Text)>0)
    then
      exit;
  end;

  Edit1.Text:=Edit1.Text+(Sender as TButton).Caption;
end;

procedure TFPravilo.Button7Click(Sender: TObject);
begin
  if length(Edit1.Text)=0 then
  begin
    Edit1.Text:=Edit1.Text+''''+ListBox1.Items.Strings[ListBox1.ItemIndex]+'''';
    exit;
  end;
  if Edit1.Text[length(Edit1.Text)]<>'''' then
    Edit1.Text:=Edit1.Text+''''+ListBox1.Items.Strings[ListBox1.ItemIndex]+'''';
end;

procedure TFPravilo.Button18Click(Sender: TObject);
begin
  if not (pos(DecimalSeparator, Edit1.Text)>0) then
    Edit1.Text:=Edit1.Text+DecimalSeparator;
end;

procedure TFPravilo.FormShow(Sender: TObject);
begin
  if ListBox1.Items.Count>0 then
    ListBox1.ItemIndex:=0;

  if ListBox2.Items.Count>0 then
    ListBox2.ItemIndex:=0;
  ListBox2Click(Sender);
end;

procedure TFPravilo.Button20Click(Sender: TObject);
var
  s: string;
begin
  s:=Edit1.Text;
  if s='' then exit;
  if s[Length(s)] in ['<','>','=','+','-','*','/','0'..'9',DecimalSeparator]
  then
  begin
    delete(s,Length(s),1);
    Edit1.Text:=s;
    exit;
  end;        

  if s[Length(s)]='''' then
  begin
    delete(s,Length(s),1);
    while Length(s)>=1 do
    begin
      if s[Length(s)]<>'''' then
        delete(s,Length(s),1)
      else
      begin
        delete(s,Length(s),1);
        Edit1.Text:=s;
        exit;
      end;
    end;
  end;
  
  Edit1.Text:=s;
end;

procedure TFPravilo.ListBox2Click(Sender: TObject);
begin
  if ListBox2.Items.Count=0 then exit;
  if ListBox2.ItemIndex>-1 then
    Edit1.Text:=TFC.TotalFlowPravila.GetPraviloOfName(
                   ListBox2.Items.Strings[ListBox2.ItemIndex]).Pravilo;
end;

procedure TFPravilo.Button6Click(Sender: TObject);
var
  MyPravilo: TPravilo;
begin
  if Edit1.Text<>'' then
  begin
    ModalResult:=mrOk;
    if (ListBox2.Items.Count>0) and (ListBox2.ItemIndex>-1) then
    begin
      MyPravilo:=TFC.TotalFlowPravila.GetPraviloOfName(
             ListBox2.Items.Strings[ListBox2.ItemIndex]);
      MyPravilo.Pravilo:=Edit1.Text;
      ModalResult:=mrNo;
    end;    
  end
  else
    ModalResult:=mrCancel;


end;

procedure TFPravilo.Button8Click(Sender: TObject);
begin
  ListBox2.ItemIndex:=-1;
  Edit1.Text:='';
end;

procedure TFPravilo.Button21Click(Sender: TObject);

begin
  if ListBox2.Items.Count=0 then exit;
  with TFC.TotalFlowPravila do
    DelPravilo(GetPraviloIndexOfName(
             ListBox2.Items.Strings[ListBox2.ItemIndex]));
  ListBox2.DeleteSelected;
  Edit1.Text:='';

end;

procedure TFPravilo.Button22Click(Sender: TObject);
begin
  if length(Edit1.Text)=0 then
  begin
    Edit1.Text:=Edit1.Text+''''+'ÄÍÏ_'+ListBox1.Items.Strings[ListBox1.ItemIndex]+'''';
    exit;
  end;
  if Edit1.Text[length(Edit1.Text)]<>'''' then
    Edit1.Text:=Edit1.Text+''''+'ÄÍÏ_'+ListBox1.Items.Strings[ListBox1.ItemIndex]+'''';
end;

procedure TFPravilo.Button23Click(Sender: TObject);
begin
   if length(Edit1.Text)=0 then
  begin
    Edit1.Text:=Edit1.Text+''''+'ÄÍÏ_Îáù.'+'''';
    exit;
  end;
  if Edit1.Text[length(Edit1.Text)]<>'''' then
    Edit1.Text:=Edit1.Text+''''+'ÄÍÏ_Îáù.'+'''';
end;

end.
