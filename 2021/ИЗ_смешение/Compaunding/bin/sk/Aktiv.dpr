program Aktiv;

uses
  Forms,
  Unit1 in 'UNIT1.PAS' {Form1},
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4},
  Unit5 in 'Unit5.pas' {Form5},
  Unit6 in 'Unit6.pas' {Form6},
  Unit7 in 'Unit7.pas' {Form7},
  Unit8 in 'Unit8.pas' {Form8},
  Unit9 in 'Unit9.pas' {Form9},
  Unit10 in 'Unit10.pas' {Form10},
  Unit11 in 'Unit11.pas' {Form11},
  Unit12 in 'Unit12.pas' {Form12},
  FmxUtils in 'Fmxutils.pas',
  Unit15 in 'Unit15.pas' {Form15},
  frak in 'frak.pas' {frak1},
  test in 'test.pas' {Graph},
  adv in 'adv.pas' {Advice},
  SvodTab in 'SvodTab.pas' {svod},
  Unit16 in 'Unit16.pas' {Form16},
  Unit17 in 'Unit17.pas' {Form17},
  Unit18 in 'Unit18.pas' {Form18},
  Unit19 in 'Unit19.pas' {Form19},
  basa in 'basa.pas' {basadan},
  basres2 in 'Basa\Basres2.pas',
  Unitb2 in 'Basa\Unitb2.pas' {Formb2},
  Unitb3 in 'Basa\Unitb3.pas' {Formb3},
  Unitb4 in 'Basa\Unitb4.pas' {Formb4},
  basa_tv in 'Basa\basa_tv.pas',
  Unit30 in 'Unit30.pas' {Form30},
  Treefind in 'Treefind.pas' {TreeF},
  ChekSub in 'Basa\ChekSub.pas' {AddSub},
  res in 'res.pas' {ResF},
  Me_As in 'Me_As.pas' {M_A},
  reportform in 'reportform.pas' {FRep},
  makeres in 'makeres.pas',
  URasDisAkt in 'URasDisAkt.pas' {RasDisAkt},
  ToGraph in 'ToGraph.pas' {ToGr},
  Sdel in 'Sdel.pas',
  ActObj in 'ActObj.pas',
  NewReport in 'NewReport.pas' {NewReportForm},
  Unit2Ab in 'Unit2Ab.pas' {AboutBox};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm15, Form15);
  Application.CreateForm(Tfrak1, frak1);
  Application.CreateForm(TGraph, Graph);
  Application.CreateForm(TAdvice, Advice);
  Application.CreateForm(Tsvod, svod);
  Application.CreateForm(TForm16, Form16);
  Application.CreateForm(TForm17, Form17);
  Application.CreateForm(TForm18, Form18);
  Application.CreateForm(TForm19, Form19);
  Application.CreateForm(Tbasadan, basadan);
  Application.CreateForm(TFormb2, Formb2);
  Application.CreateForm(TFormb3, Formb3);
  Application.CreateForm(TFormb4, Formb4);
  Application.CreateForm(TForm30, Form30);
  Application.CreateForm(TTreeF, TreeF);
  Application.CreateForm(TAddSub, AddSub);
  Application.CreateForm(TResF, ResF);
  Application.CreateForm(TM_A, M_A);
  Application.CreateForm(TFRep, FRep);
  Application.CreateForm(TRasDisAkt, RasDisAkt);
  Application.CreateForm(TNewReportForm, NewReportForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
