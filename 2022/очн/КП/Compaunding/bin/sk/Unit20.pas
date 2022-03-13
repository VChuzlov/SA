unit Unit20;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, test, unit4, unit5;

type
  TGrnum = class(TForm)
    LB1: TListBox;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Grnum: TGrnum;

implementation

{$R *.DFM}

procedure TGrnum.Button2Click(Sender: TObject);
begin
Close;
end;

procedure TGrnum.Button1Click(Sender: TObject);
var I,P:Word;
    Fgr:file of DataGr;
    NameF:String;
begin
P:=Lb1.ItemIndex;
Lb1.Items.Delete(P);
CurGr:=FirstGr;
Case P of
0: Begin FirstGr:=CurGr^.NextGr; dispose(CurGr) end;
1: begin CurGr:=CurGr^.NextGr^.NextGr; Dispose(FirstGr^.NextGr);
   FirstGr^.NextGr:=CurGr end;
else begin For I:=2 To P Do CurGr:=CurGr^.NextGr;
     NextGr:=CurGr^.NextGr^.NextGr;
     Dispose(CurGr^.NextGr);
     CurGr^.NextGr:=NextGr;
     end;
end;
NameF:=PathS+'\gr_akt.'+IntToStr(Form4.RadioGroup1.ItemIndex+1);
AssignFile(FGr,NameF);
Rewrite(Fgr);
CurGr:=FirstGr;
While CurGr<>nil Do
  begin
  Write(Fgr,CurGr^);
  CurGr:=CurGr^.NextGr;
  end;
CloseFile(FGR);
end;

end.
