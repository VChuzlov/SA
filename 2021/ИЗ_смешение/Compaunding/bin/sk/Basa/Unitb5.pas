unit Unitb5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Tabnotbk, Menus;

type
  TFormb5 = class(TForm)
    TabbedNotebook1: TTabbedNotebook;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formb5: TFormb5;

implementation

uses Unitb6,basa_tv;

{$R *.DFM}


procedure TFormb5.FormShow(Sender: TObject);
Var
    Polnima,Ropen,s:String;
    i:integer;
    flag:boolean;
begin
        begin

        Polnima:=formb6.Directorylistbox1.Directory;
        i:=Length(PolnIma);
        repeat
        i:=i-1;
        until PolnIma[i]='\';
        Ropen:=Copy(polnima,i+1,13);
        If not(fileExists(Polnima+'\'+Ropen+'.tex'))
           then
           begin
           ShowMessage('Не удается найти Файл данных по технологическим условиям с именем каталога')

           end
           else
           begin
        AssignFile(FileToOpen,Polnima+'\'+Ropen+'.tex');
        Reset(FileToOpen);
        Memo1.Lines.Clear;
         while not EOF(FileToOpen) do
           begin
            Readln(FileToOpen, S);
            Memo1.Lines.Add(S);
           end;
        CloseFile(FileToOpen);
            end;
        If not(fileExists(Polnima+'\'+Ropen+'.sir'))
           then ShowMessage('Не удается найти Файл данных по сырью с именем каталога')
           else
           begin
        AssignFile(FileToOpen,Polnima+'\'+Ropen+'.sir');
        Reset(FileToOpen);
        Memo2.Lines.Clear;
         while not EOF(FileToOpen) do
           begin
            Readln(FileToOpen, S);
            Memo2.Lines.Add(S);
           end;
        CloseFile(FileToOpen);
        end;
        s:=Polnima+'\'+Ropen+'.с5 ';
        flag:=fileExists(Polnima+'\'+Ropen+'.с5 ');
        If not(fileExists(Polnima+'\'+Ropen+'.kat'))
           then ShowMessage('Не удается найти Файл данных по катализатору с именем каталога')
           else
           begin
        AssignFile(FileToOpen,Polnima+'\'+Ropen+'.kat');
        Reset(FileToOpen);
        Memo3.Lines.Clear;
         while not EOF(FileToOpen) do
           begin
            Readln(FileToOpen, S);
            Memo3.Lines.Add(S);
           end;
        CloseFile(FileToOpen);
        end;
       { s:=Polnima+'\'+Ropen+'.с5 ';
        flag:=fileExists(s);
        If not(fileExists(s))
           then ShowMessage('Не удается найти Файл данных по пентановой фракции с именем каталога')
           else  }
           begin
        AssignFile(FileToOpen,Polnima+'\'+Ropen+'.c5 ');
        Reset(FileToOpen);
        Memo4.Lines.Clear;
         while not EOF(FileToOpen) do
           begin
            Readln(FileToOpen, S);
            Memo4.Lines.Add(S);
           end;
        CloseFile(FileToOpen);
        end;
        If not(fileExists(Polnima+'\'+Ropen+'.bok'))
           then ShowMessage('Не удается найти Файл данных по боковому погону с именем каталога')
           else
           begin
        AssignFile(FileToOpen,Polnima+'\'+Ropen+'.bok');
        Reset(FileToOpen);
        Memo5.Lines.Clear;
         while not EOF(FileToOpen) do
           begin
            Readln(FileToOpen, S);
            Memo5.Lines.Add(S);
           end;
        CloseFile(FileToOpen);
      end;
      end;
end;

procedure TFormb5.N5Click(Sender: TObject);
begin
     formb5.Close;
end;

procedure TFormb5.N6Click(Sender: TObject);
begin
     formb5.Close;
     formb6.ShowModal;
end;

procedure TFormb5.N2Click(Sender: TObject);
Var
Polnima,Ropen,s:String;
    i:integer;
begin
     Polnima:=formb6.Directorylistbox1.Directory;
        i:=Length(PolnIma);
        repeat
        i:=i-1;
        until PolnIma[i]='\';
        Ropen:=Copy(polnima,i+1,13);

        AssignFile(FileToOpen,Polnima+'\'+Ropen+'m.tex');
        Rewrite(FileToOpen);
         For i:=0 to memo1.lines.Capacity do
           begin
            s:=Memo1.Lines[i];
            Writeln(FileToOpen, S);
           end;
        CloseFile(FileToOpen);
        AssignFile(FileToOpen,Polnima+'\'+Ropen+'m.sir');
        Rewrite(FileToOpen);
         For i:=0 to memo2.lines.Capacity do
           begin
            s:=Memo2.Lines[i];
            Writeln(FileToOpen, S);
           end;
        CloseFile(FileToOpen);
        AssignFile(FileToOpen,Polnima+'\'+Ropen+'m.kat');
        Rewrite(FileToOpen);
         For i:=0 to memo3.lines.Capacity do
           begin
            s:=Memo3.Lines[i];
            Writeln(FileToOpen, S);
           end;
        CloseFile(FileToOpen);
        AssignFile(FileToOpen,Polnima+'\'+Ropen+'m.c5');
        Rewrite(FileToOpen);
         For i:=0 to memo4.lines.Capacity do
           begin
            s:=Memo4.Lines[i];
            Writeln(FileToOpen, S);
           end;
        CloseFile(FileToOpen);
        AssignFile(FileToOpen,Polnima+'\'+Ropen+'m.bok');
        Rewrite(FileToOpen);
         For i:=0 to memo5.lines.Capacity do
           begin
            s:=Memo5.Lines[i];
            Writeln(FileToOpen, S);
           end;
        CloseFile(FileToOpen);
      end;


end.
