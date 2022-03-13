unit Treefind;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl;

type
       Svo=record
       Data:String[10];
       Akt,Tin,G,H2,Num,P_N,N_I,Ar,Koks,Vt,Iz,Az,Ott,vh2:Double;
       end;
       PDataS=^DataS;
       DataS=record
       sv:svo;
       NextS:PDataS;
         end;

  TTreeF = class(TForm)
    DirectoryListBox1: TDirectoryListBox;
    Button1: TButton;
    Button2: TButton;
    DriveComboBox1: TDriveComboBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DriveComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TreeF: TTreeF;
     DirFind:string;
     FirstS,CurS,NextS,FS,ListF:PDataS;
     FlagF:Boolean;
     Fd,Fm,Fy,Ld,Lm,Ly:integer;

implementation

uses Unit5, test, makeres;
{$R *.DFM}

procedure TTreeF.Button2Click(Sender: TObject);
begin
Modalresult:=mrCancel;
end;

procedure TTreeF.Button1Click(Sender: TObject);
Var F: TSearchRec;
    FN:File;
begin
DirFind:=DirectoryListBox1.Directory;
   AssignFile(FN,PathS+'\svod.tmp');
   Rewrite(FN);
   CloseFile(FN);
if FindFirst(DirFind+'\*.rez',faAnyFile,F)=0 then
   begin
   repeat
   MakeSvod(F.Name,PathS+'\svod.tmp');
   until FindNext(F)<>0;
   ModalResult:=mrOk;
   end
else
   begin
   MessageDlg('В данной директории файлов с результатами нет.',mtWarning,[mbOk],0);
   ModalResult:=mrCancel;
   end;
FindClose(F);

end;

procedure TTreeF.DriveComboBox1Change(Sender: TObject);
begin
DirectoryListBox1.Drive:=DriveComboBox1.Drive;
end;


end.
