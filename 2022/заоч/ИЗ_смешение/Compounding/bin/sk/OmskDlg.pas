unit OmskDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ClipBrd, ExtCtrls;
    Function FlToStr(num:Extended):String;
type
  TOmskDialog = class(TForm)
    Button1: TButton;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OmskDialog: TOmskDialog;

implementation
  Uses OmskLab, Unit5, Unit9;
var    CoolPaste: TPoluboy;
{$R *.DFM}

Function FlToStr(num:Extended):String;
var str:string[10];
begin
str:=FloatToStrF(num,ffFixed,3,3);
While pos(' ',str)>0 do delete(str,pos(' ',str),1);
While pos(',',str)>0 do str[pos(',',str)]:='.';
Result:=str;
end;

procedure TOmskDialog.Button2Click(Sender: TObject);
begin
Close;
end;

procedure TOmskDialog.FormCreate(Sender: TObject);
begin
RadioButton1.Checked:=True;
RadioButton3.Checked:=True;
CoolPaste:=TPoluboy.Create;
end;


procedure TOmskDialog.RadioButton2Click(Sender: TObject);
begin
Edit1.Enabled:=true;
Button3.Enabled:=true;
If not(RadioButton4.Checked) and (Edit1.Text='') then Button3Click(Sender);
end;

procedure TOmskDialog.RadioButton1Click(Sender: TObject);
begin
Edit1.Enabled:=False;
Button3.Enabled:=False;
end;

procedure TOmskDialog.Button3Click(Sender: TObject);
begin
OpenDialog1.InitialDir:=PathU;
If OpenDialog1.Execute then Begin
   Edit1.Text:='../'+ExtractFileName(OpenDialog1.FileName);
                            End;
end;

procedure TOmskDialog.Button1Click(Sender: TObject);
Var Structure:TSkFile;
    i,j:integer;
    SostT:TstringList;
    s,FName:string;
    fl:boolean;
begin
If RadioButton3.Checked then CoolPaste.TypeOfExt:='.sir';
If RadioButton4.Checked then CoolPaste.TypeOfExt:='.kat';
Structure:=Form9.CurSk;
If RadioButton2.Checked then Begin
CoolPaste.LoadFromFile(OpenDialog1.FileName);

//For i:=1 to 69 do Structure[i]:=0;
//CoolPaste.GetData(Structure);
CoolPaste.MakeSKFiles(OpenDialog1.FileName);

If RadioButton3.Checked then CoolPaste.GetData(Structure.SostavSir);
//for i:=1 to 69 do form9.CurSk.SostavSir[i]:=Structure[i];
If RadioButton4.Checked then CoolPaste.GetData(Structure.SostavKat);
//for i:=1 to 69 do form9.CurSk.SostavKat[i]:=Structure[i];
CoolPaste.MakeSKFiles(OpenDialog1.FileName);
Form9.CurSk:=Structure;
//for i:=1 to 69 do form9.CurSk.SostavSir:=Structure[i];

                                end;

If RadioButton1.Checked then Begin
CoolPaste.LoadFromClipboard;
//For i:=1 to 69 do Structure[i]:=0;
//CoolPaste.GetData(Structure);
fl:=true;i:=0;
FName:=PathU+'\fromexcell';
While fl do Begin
If (FileExists(Fname+'.sir')) or (FileExists(Fname+'.kat')) then Begin
   Inc(i);
   FName:=PathU+'\fromexcell'+IntToStr(i);
                                                                 end
                                                            else fl:=false;
            end;
CoolPaste.MakeSKFiles(FName);
If RadioButton3.Checked then CoolPaste.GetData(Structure.SostavSir);
If RadioButton4.Checked then CoolPaste.GetData(Structure.SostavKat);
//for i:=1 to 69 do Matr[j,i].Text:=FlToStr(Structure[i]);
                             end;
Form9.FormShow(Sender);
Form9.CurSk:=Structure;
end;

end.
