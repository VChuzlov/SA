       {$x+,v-}
       {$m 5000,0,30000}
    program tf;

        uses editors,app,menus,drivers,objects,
             stddlg,views,dos,dialogs,memory,crt,kol_gr,kol_t1;

    type
        koncentr=array[1..4] of extended;

        initdata=record

        param:koncentr;

    end;

    var
       sdir:string;
       dt:initdata;

        var
           sk_sir:array [1..70] of extended;
           par1,par2,par3,par4,par5,par6,par7,par8,par9,par10:real;
           par11,par12,par13,par14,par15,par16,par17,par18,par19,par20:real;
           par21,par22,par23,par24,par25,par26:real;
           par27,par28:string [8];
           ss:string [47];
           t:file;
           dan:string;

           dan_Tex:string;
           dan_Sk:string;
           Dan_Sir:array [1..69] of extended;
           Dan_Kat:array [1..69] of extended;
           Summa:real;
           Summ:string [8];

           Ce,Cr:real;
           f,ff,fi:text;
           i:integer;
           s1:string [57];
           s2:string [61];
           simbol:string[5];
           sss:string;
           stroka:array [1..75] of string;
           strok:string;
           www1,www2:string;

           ee1:string [39];
           ee2:string [59];

           eeeee1:string [39];
           eeeee2:string [36];
           eeeee34:string [26];
           eeeee5:string [16];
           PPP1,PPP2,PPP3,PPP4,PPP5,PPP10:real;

           PP1,PP2:real;

           eee1:string [25];
           CL1,CL2,CL3:real;

           cnl:text;
           Puti,Nazvanie:string;
           ww1:string[39];
           ww2:string[35];
           ww3:string[59];

           ffs:string;

        const
           MenuLevel:Word=0;
           cmexecwas1=2000;
           cmexecwas2=2001;
           cmexecwas3=2002;
           cmexecpic1=2003;
           cmexectxt1=2007;
           cmexecwas4=2004;
           cmexecwas5=2005;
           cmexecwas6=2006;

           cmgr_akt=100;
           cmgr_koks=101;
           cmgr_krek=102;

           cm_dan_tex=103;
           cm_dan_sk=104;


        type
            tmyapp=object(tapplication)
            fname :pstring;
           constructor init;
           procedure initstatusline;virtual;
           procedure initmenubar;virtual;
           procedure handleevent(var event:tevent);virtual;
           function GetFileName:string;
           function SaveFileName_Tex:string;
           function SaveFileName_Sk:string;
           procedure d_okno;
           procedure d_okno_Sir;
           procedure d_okno_Kat;
           procedure d_okno_Tex;
           procedure okno_no_file_sk;
(*           procedure okno_summa;*)
           procedure okno1;
           procedure okno2;
           procedure okno_rec;
           procedure okno_rec1;
           procedure okno_rec2;
           procedure okno_rec3;
           procedure ViborUst;

           end;
         pdemodialog=^tdemodialog;
          tdemodialog=object(tdialog)
            end;
         pdemowindow=^tdemowindow;
          tdemowindow=object(twindow)
          end;

     procedure tmyapp.initstatusline;
        var r:trect;
        begin
          getextent(r);
          r.a.y:=r.b.y-1;
          statusline:=new(pstatusline,init(r,
          newstatusdef(0,$ffff,
          newstatuskey('        ~ALT - X   - ~  ВЫХОД',kbaltx,cmQuit,
          newstatuskey('                          ~F10   - ~  MEНЮ',kbf10,cmmenu,
                  nil)),
          nil)))
          end;



     procedure tmyapp.initmenubar;
      var r:trect;
          begin
           getextent(r);
           r.b.y:=r.a.y+1;
       menubar:=new(pmenubar,init(r,newmenu(
           newsubmenu(' ~С~ПРАВКА ',hcnocontext,newmenu(
         (*    newitem('      ~С~хема      ',' ',kbf7,cmexecpic1,hcnocontext,
                    newline(
             newitem('   ~О~ программе   ',' ',kbf6,cmexectxt1,hcnocontext,
                    newline( *)
             newitem('      ~В~ыход      ',' ',kbAltX,cmquit,hcnocontext,

           nil)),

           newsubmenu('~Н~АБОР ДАННЫХ',hcnocontext,newmenu(
             newitem('~Т~ехнологические условия',' ',kbnokey,cm_dan_tex,hcnocontext,
                    newline(
             newitem('~С~оставы сырье - катализат',' ',kbnokey,cm_dan_sk,hcnocontext,
           nil)))),

           newsubmenu(' ~Т~ЕХНОЛОГИЧЕСКИЕ    ПРОЦЕССЫ ',hcnocontext,newmenu(
             newitem('       ~И~ЗОМЕРИЗАЦИЯ       ','',kbf3,cmexecwas1,hcnocontext,
                    newline(
             newitem(' ~С~ЕЛЕКТИВНЫЙ ГИДРОКРЕКИНГ ','',kbf2,cmexecwas2,hcnocontext,
                    newline(
             newitem('    ~И~ЗОСЕЛЕКТОФОРМИНГ     ','',kbf4,cmexecwas3,hcnocontext,
                    newline(
             newitem('        ~Р~ИФОРМИНГ        ',' ',kbf4,cmexecwas4,hcnocontext,
                    NEWline(
             newitem('      ~С~ЕЛЕКТОФОРМИНГ     ','',kbf5,cmexecwas6,hcnocontext,
          nil)))))))))),

           newsubmenu('~Г~РАФИКИ',hcnocontext,newmenu(
             newitem('~А~ктивность катализатора','',kbnokey,cmgr_akt,hcnocontext,
                    newline(
             newitem('~К~окса на катализаторе','',kbnokey,cmgr_koks,hcnocontext,
                    newline(
             newitem('~Ч~исло крекинга','',kbnokey,cmgr_krek,hcnocontext,

          nil)))))),

          nil)))))));

          end;



  function tmyapp.GetFileName;
       var
          R: TRect;
          FileDialog: PFileDialog;
          TheFile: FNameStr;
     const
          FDOptions: Word = fdOKButton or fdOpenButton;

   begin
        TheFile := '*.dan';
        New(FileDialog, Init(TheFile, 'Выбор файла',
         '~И~мя файла',FDOptions, 1));
        if ExecuteDialog(FileDialog, @TheFile)<>cmCancel then
                                       GetFileName:=TheFile
                                else
                                    GetFileName:='';
   end;






  function tmyapp.SaveFileName_Tex;
       var
          R: TRect;
          FileDialog: PFileDialog;
          TheFile: FNameStr;
     const
          FDOptions: Word = fdOKButton or fdOpenButton;

   begin
        TheFile := '*.dan';
        New(FileDialog, Init(TheFile, 'Сохранение файла',
         '~И~мя файла',FDOptions, 1));
        if ExecuteDialog(FileDialog, @TheFile)<>cmCancel then
                                    SaveFileName_Tex:=TheFile
                                else
                                    SaveFileName_Tex:='';
   end;







  function tmyapp.SaveFileName_Sk;
       var
          R: TRect;
          FileDialog: PFileDialog;
          TheFile: FNameStr;
     const
          FDOptions: Word = fdOKButton or fdOpenButton;

   begin
        TheFile := '*.sk';
        New(FileDialog, Init(TheFile, 'Сохранение файла',
         '~И~мя файла',FDOptions, 1));
        if ExecuteDialog(FileDialog, @TheFile)<>cmCancel then
                                    SaveFileName_Sk:=TheFile
                                else
                                    SaveFileName_Sk:='';
   end;

   procedure tmyapp.okno_no_file_sk;

          var
                D: PDialog;
                Control: PView;
                R: TRect;

         begin
              gopa(dan,Puti,Nazvanie);
              R.Assign(0, 0, 40, 15);
              D := New(PDialog, Init(R, 'В Н И М А Н И Е !'));

              with D^ do
                        begin
                             Options := Options or ofCentered;
                             R.Grow(-1, -1);
                             Dec(R.B.Y, 3);
                             Insert(New(PStaticText, Init(R,
     #13+
     ^C'Уважаемый пользователь !' +#13 +#13 +
     ^C'Будьте очень внимательны !' +#13+#13+
     ^C'У Вас отсутствует файл '+Nazvanie+'.sk !'+#13+
     ^C'Выйдите из программы и перенесите' +#13+
     ^C'данный файл в текущий каталог !' +#13)));


              R.Assign(15, 12, 25, 14);
              Insert(New(PButton, Init(R, 'O~K', cmOk, bfDefault)));

                        end;
              Desktop^.ExecView(D);
              Dispose(D, Done);


         end;









(*   procedure tmyapp.okno_summa;

          var
                D: PDialog;
                Control: PView;
                R: TRect;

         begin
              R.Assign(0, 0, 40, 15);
              D := New(PDialog, Init(R, 'В Н И М А Н И Е !'));

              with D^ do
                        begin
                             Options := Options or ofCentered;
                             R.Grow(-1, -1);
                             Dec(R.B.Y, 3);
                             Insert(New(PStaticText, Init(R,
     #13+
     ^C'Уважаемый пользователь !' +#13 +#13 +
     ^C'Будьте очень внимательны !' +#13+#13+
     ^C'У Вас сумма равняется '+Summ+' % !'+#13+#13+
     ^C'А она должна быть равна 100 %' +#13+
     ^C'' +#13)));


              R.Assign(15, 12, 25, 14);
              Insert(New(PButton, Init(R, 'O~K', cmOk, bfDefault)));

                        end;
              Desktop^.ExecView(D);
              Dispose(D, Done);


         end;*)



   procedure tmyapp.okno1;

          var
                D: PDialog;
                Control: PView;
                R: TRect;
                aser101:string[10];
                aser102:string[10];

         begin
              STR(Ce:10:4,aser101);
              STR(Cr:10:4,aser102);

              R.Assign(0, 1, 68, 22);
              D := New(PDialog, Init(R, 'Результаты проведенных расчетов'));

              with D^ do
                        begin
                             Options := Options or ofCentered;
                             R.Grow(-1, -1);
                             Dec(R.B.Y, 3);
                             Insert(New(PStaticText, Init(R,
     #13+
     '  Экспериментальная концентрация ароматики , % вес. : ' +aser101+#13 +
     '  Расчетная концентрация ароматики         , % вес. : ' +aser102+#13+
     +#13 )));

              R.Assign(5, 10, 65, 19);
              Insert(New(PStaticText, Init(R,
      +#13+#13+
     ^C'Если Вас это не устраивает то Вам необходимо '+#13+
     ^C' внести изменения в исходные данные .')));


              R.Assign(27, 18, 37, 20);
              Insert(New(PButton, Init(R, 'O~K', cmOk, bfDefault)));

                        end;
              Desktop^.ExecView(D);
              Dispose(D, Done);


         end;









  procedure tmyapp.okno_rec;

var
              Dialog:PDialog;
              B:PView;
              R:TRect;
              Control:word;
              i,j,Code:integer;
              si:string;
              nam:string;

function MakeDialog : PDialog;
var
  Dlg : PDialog;
  R : TRect;
  Control : PView;
  as1,as2,as3,as4,as5,as10:string[10];

begin
              STR(PPP1:10:4,as1);
              STR(PPP2:10:4,as2);
              STR(PPP3:10:4,as3);
              STR(PPP4:10:4,as4);
              STR(PPP5:10:4,as5);
              STR(PPP10:10:4,as10);

R.Assign(13, 2, 67, 21);
New(Dlg, Init(R, ''));

R.Assign(3, 2, 48, 4);
Control := New(PStaticText, Init(R, 'Степень превращения парафинов'^M+
     'в реакции дегидроциклизации        '+as5));
Dlg^.Insert(Control);

R.Assign(3, 5, 48, 6);
Control := New(PStaticText, Init(R, 'Остаточное содержание циклопентанов'+as2));
Dlg^.Insert(Control);

R.Assign(3, 7, 48, 8);
Control := New(PStaticText, Init(R, 'Перепад температуры в Р-2          '+as10));
Dlg^.Insert(Control);

R.Assign(3, 9, 48, 12);
Control := New(PStaticText, Init(R, 'Отношение н-Р/i-Р : '^M+
     '          в сырье                  '+as3+^M+
     '          в продукте               '+as4));
Dlg^.Insert(Control);

R.Assign(3, 13, 48, 14);
Control := New(PStaticText, Init(R, 'Концентрация водорода в ВСГ        '+as1));
Dlg^.Insert(Control);

R.Assign(23, 15, 33, 17);
Control := New(PButton, Init(R, 'O~k~', cmOK, bfDefault));
Dlg^.Insert(Control);

Dlg^.SelectNext(False);
MakeDialog := Dlg;
end;

 begin

    Dialog:=MakeDialog;
    Dialog^.HelpCTX:=$F000;
(*    Dialog^.SetData(DataRec);*)
    Control:=DeskTop^.ExecView(Dialog);

    if Control<>cmCancel then
       begin
       (*     Dialog^.GetData(DataRec);*)
       end;
    Dialog^.Done;dispose(dialog);


  end;


















   procedure tmyapp.okno_rec1;

          var
                D: PDialog;
                Control: PView;
                R: TRect;
                aser101:string[10];
                aser102:string[10];

         begin
              STR(PP1:10:4,aser101);
              STR(PP2:10:4,aser102);

              R.Assign(0, 1, 52, 16);
              D := New(PDialog, Init(R, 'Рекомендации'));

              with D^ do
                        begin
                             Options := Options or ofCentered;
                             R.Grow(-1, -1);
                             Dec(R.B.Y, 3);
                             Insert(New(PStaticText, Init(R,
     #13+
     '  Активность катализатора  : ' +aser101+#13 +
     '  Число крекинга           : ' +aser102+#13+
     +#13 )));

              R.Assign(3, 5, 47, 11);
              Insert(New(PStaticText, Init(R,
      +#13+#13+
     ^C'Повышенная активность обусловлена низкой '+#13+
     ^C'влажностью системы.'+#13+#13+
     ^C'Рекомендуется подать воду.')));


              R.Assign(20, 12, 30, 14);
              Insert(New(PButton, Init(R, 'O~K', cmOk, bfDefault)));

                        end;
              Desktop^.ExecView(D);
              Dispose(D, Done);


         end;

   procedure tmyapp.okno_rec2;

          var
                D: PDialog;
                Control: PView;
                R: TRect;
                aser101:string[10];
                aser102:string[10];

         begin
              STR(PP1:10:4,aser101);
              STR(PP2:10:4,aser102);

              R.Assign(0, 1, 52, 16);
              D := New(PDialog, Init(R, 'Рекомендации'));

              with D^ do
                        begin
                             Options := Options or ofCentered;
                             R.Grow(-1, -1);
                             Dec(R.B.Y, 3);
                             Insert(New(PStaticText, Init(R,
     #13+
     '  Активность катализатора  : ' +aser101+#13 +
     '  Число крекинга           : ' +aser102+#13+
     +#13 )));

              R.Assign(3, 5, 47, 11);
              Insert(New(PStaticText, Init(R,
      +#13+#13+
     ^C'Повышенная активность обусловлена высокими'+#13+
     ^C'температурами.'+#13+#13+
     ^C'Рекомендуется подать хлорорганику.')));


              R.Assign(20, 12, 30, 14);
              Insert(New(PButton, Init(R, 'O~K', cmOk, bfDefault)));

                        end;
              Desktop^.ExecView(D);
              Dispose(D, Done);


         end;

   procedure tmyapp.okno_rec3;

          var
                D: PDialog;
                Control: PView;
                R: TRect;
                aser101:string[10];
                aser102:string[10];

         begin
              STR(PP1:10:4,aser101);
              STR(PP2:10:4,aser102);

              R.Assign(0, 1, 52, 16);
              D := New(PDialog, Init(R, 'Рекомендации'));

              with D^ do
                        begin
                             Options := Options or ofCentered;
                             R.Grow(-1, -1);
                             Dec(R.B.Y, 3);
                             Insert(New(PStaticText, Init(R,
     #13+
     '  Активность катализатора  : ' +aser101+#13 +
     '  Число крекинга           : ' +aser102+#13+
     +#13 )));

              R.Assign(3, 5, 47, 11);
              Insert(New(PStaticText, Init(R,
      +#13+#13+
     ^C'  Необходимо следить за повышением активности.'+#13+
     ^C''+#13+#13+
     ^C'')));


              R.Assign(20, 12, 30, 14);
              Insert(New(PButton, Init(R, 'O~K', cmOk, bfDefault)));

                        end;
              Desktop^.ExecView(D);
              Dispose(D, Done);


         end;



                 {
  procedure tmyapp.okno2;
           const
                sl=10;
                name:array [1..7] of string[50]=
                     ('Подача C2H4Cl2 в Р-202, ppm     ',
                      'Подача CCl4    в Р-202, ppm     ',
                      'Подача C2H4Cl2 в Р-203, ppm     ',
                      'Подача CCl4    в Р-203, ppm     ',
                      'Подача C2H4Cl2 в Р-204, ppm     ',
                      'Подача CCl4    в Р-204, ppm     ',
                      'Активность катализатора         ');

           type
               Data=record
               param:array[1..7] of string[sl];
           end;

           var
              Dialog:PDialog;
              B:PView;
              R:TRect;
              D:Data;
              Control:word;
              i,j,Code:integer;
              si:string;
              nam:string;

      begin
           R.Assign(5,3,74,20);
           Dialog:=New(PDialog,
           Init(R,'Параметры'));
           Dialog^.HelpCTX:=$F000;

           with Dialog^ do
                          begin

        for i:=1 to 7 do
                        begin
      R.Assign(55,i+1,67,2+i);
      B:=New(PInputLine,Init(R,sl));
      Insert(B);

      R.Assign(2,1+i,53,2+i);
      str(i,si);
      Insert(New(PLabel,Init(R,+name[i]+':',B)));R.Assign(1,5,7,6);

                        end;

      R.Assign(25,9,53,13);
      Insert(New(PStaticText,Init(R,'  (Enter)      (Esc)')));

      R.Assign(10,10,50,12);
      Insert(New(PStaticText,Init(R,'Ввести ?')));

      R.Assign(25,10,35,12);
      Insert(New(PButton,Init(R,'~Д~а',cmOk,bfDefault)));

      R.Assign(38,10,48,12);
      Insert(New(PButton,Init(R,'~Н~ет',cmCancel,bfNormal)));

      R.Assign(14,13,50,14);
      Insert(New(PStaticText,Init(R,
                                  'Для перехода используйте клавишу ')));

      R.Assign(17,14,50,15);
      Insert(New(PStaticText,Init(R,
                                   '  ~TAB~  или  ~SHIFT~ + ~TAB~')));

      SelectNext(False);

                          end;

    for i:=1 to 7 do str(dt.param[i]:10:4,d.param[i]);

    Dialog^.SetData(D);
    Control:=DeskTop^.ExecView(Dialog);

    if Control<>cmCancel then
                             begin
                                  Dialog^.GetData(D);
                             end;

    for i:=1 to 7 do val(d.param[i],dt.param[i],Code);
              end;
                }




  procedure tmyapp.okno2;
           const
                sl=10;
                name:array [1..4] of string[50]=
                     ('Подача хлорорганики в Р-202, ppm ',
                      'Подача хлорорганики в Р-203, ppm ',
                      'Подача хлорорганики в Р-204, ppm ',
                      'Активность катализатора         ');

           type
               Data=record
               param:array[1..4] of string[sl];
           end;

           var
              Dialog:PDialog;
              B:PView;
              R:TRect;
              D:Data;
              Control:word;
              i,j,Code:integer;
              si:string;
              nam:string;

      begin
           R.Assign(5,6,74,20);
           Dialog:=New(PDialog,
           Init(R,'Параметры'));
           Dialog^.HelpCTX:=$F000;

           with Dialog^ do
                          begin

        for i:=1 to 4 do
                        begin
      R.Assign(55,i+1,67,2+i);
      B:=New(PInputLine,Init(R,sl));
      Insert(B);

      R.Assign(2,1+i,53,2+i);
      str(i,si);
      Insert(New(PLabel,Init(R,+name[i]+':',B)));R.Assign(1,5,7,6);

                        end;

      R.Assign(25,6,53,10);
      Insert(New(PStaticText,Init(R,'  (Enter)      (Esc)')));

      R.Assign(10,7,50,9);
      Insert(New(PStaticText,Init(R,'Ввести ?')));

      R.Assign(25,7,35,9);
      Insert(New(PButton,Init(R,'~Д~а',cmOk,bfDefault)));

      R.Assign(38,7,48,9);
      Insert(New(PButton,Init(R,'~Н~ет',cmCancel,bfNormal)));

      R.Assign(14,10,50,11);
      Insert(New(PStaticText,Init(R,
                                  'Для перехода используйте клавишу ')));

      R.Assign(17,11,50,12);
      Insert(New(PStaticText,Init(R,
                                   '  ~TAB~  или  ~SHIFT~ + ~TAB~')));

      SelectNext(False);

                          end;

    for i:=1 to 4 do str(dt.param[i]:10:4,d.param[i]);

    Dialog^.SetData(D);
    Control:=DeskTop^.ExecView(Dialog);

    if Control<>cmCancel then
                             begin
                                  Dialog^.GetData(D);
                             end;

    for i:=1 to 4 do val(d.param[i],dt.param[i],Code);

    Dialog^.Done; Dispose(Dialog);
      end;


function MakeDialog : PDialog;
var
  Dlg : PDialog;
  R : TRect;
  Control : PView;

begin
R.Assign(2, 1, 78, 22);
New(Dlg, Init(R, 'Технологический режим'));

R.Assign(17, 1, 27, 2);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);

R.Assign(63, 1, 73, 2);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);

R.Assign(24, 3, 34, 4);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);

R.Assign(37, 3, 47, 4);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);

R.Assign(50, 3, 60, 4);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);
  {
R.Assign(63, 3, 73, 4);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);
   }
R.Assign(24, 5, 34, 6);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);

R.Assign(37, 5, 47, 6);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);

R.Assign(50, 5, 60, 6);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);
   {
R.Assign(63, 5, 73, 6);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);

R.Assign(24, 7, 34, 8);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);

R.Assign(37, 7, 47, 8);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);

R.Assign(50, 7, 60, 8);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);

R.Assign(63, 7, 73, 8);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);
    }
R.Assign(2, 10, 9, 11);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);

R.Assign(10, 10, 17, 11);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);

R.Assign(18, 10, 25, 11);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);

R.Assign(26, 10, 33, 11);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);

R.Assign(34, 10, 41, 11);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);

R.Assign(42, 10, 49, 11);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);

R.Assign(50, 10, 57, 11);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);

R.Assign(58, 10, 65, 11);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);

R.Assign(66, 10, 73, 11);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);

R.Assign(24, 12, 34, 13);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);

R.Assign(63, 12, 73, 13);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);

R.Assign(24, 14, 34, 15);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);

R.Assign(63, 14, 73, 15);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);

R.Assign(37, 16, 47, 17);
Control := New(PInputLine, Init(R, 10));
Dlg^.Insert(Control);

R.Assign(49, 17, 59, 19);
Control := New(PButton, Init(R, 'O~k~', cmOK, bfDefault));
Dlg^.Insert(Control);

R.Assign(61, 17, 71, 19);
Control := New(PButton, Init(R, '~C~ancel', cmCancel, bfNormal));
Dlg^.Insert(Control);

R.Assign(2, 3, 21, 4);
Control := New(PStaticText, Init(R, 'Давление, атм.'));
Dlg^.Insert(Control);

R.Assign(26, 2, 31, 3);
Control := New(PStaticText, Init(R, 'Р-2'));
Dlg^.Insert(Control);

R.Assign(39, 2, 44, 3);
Control := New(PStaticText, Init(R, 'Р-3'));
Dlg^.Insert(Control);

R.Assign(52, 2, 57, 3);
Control := New(PStaticText, Init(R, 'Р-4'));
Dlg^.Insert(Control);

{R.Assign(65, 2, 70, 3);
Control := New(PStaticText, Init(R, 'Р-5'));
Dlg^.Insert(Control);}

R.Assign(2, 5, 21, 6);
Control := New(PStaticText, Init(R, 'Температура, град.С'));
Dlg^.Insert(Control);

{R.Assign(2, 7, 21, 8);
Control := New(PStaticText, Init(R, 'Перепад Т  , град.С'));
Dlg^.Insert(Control);}

R.Assign(2, 18, 35, 20);
Control := New(PStaticText, Init(R, 'Для перехода используйте клавишу '^M+
     '   ~TAB~ или ~Shift~ + ~TAB~'));
Dlg^.Insert(Control);

R.Assign(33, 8, 47, 9);
Control := New(PStaticText, Init(R, 'Состав ВСГ, %'));
Dlg^.Insert(Control);

R.Assign(2, 12, 21, 13);
Control := New(PStaticText, Init(R, 'Расход ВСГ, м3/час'));
Dlg^.Insert(Control);

R.Assign(36, 12, 61, 13);
Control := New(PStaticText, Init(R, 'Влажность ВСГ, %'));
Dlg^.Insert(Control);

R.Assign(3, 9, 7, 10);
Control := New(PStaticText, Init(R, ' Н2'));
Dlg^.Insert(Control);

R.Assign(11, 9, 15, 10);
Control := New(PStaticText, Init(R, ' С1'));
Dlg^.Insert(Control);

R.Assign(19, 9, 23, 10);
Control := New(PStaticText, Init(R, ' С2'));
Dlg^.Insert(Control);

R.Assign(27, 9, 31, 10);
Control := New(PStaticText, Init(R, ' С3'));
Dlg^.Insert(Control);

R.Assign(35, 9, 39, 10);
Control := New(PStaticText, Init(R, 'n-C4'));
Dlg^.Insert(Control);

R.Assign(43, 9, 47, 10);
Control := New(PStaticText, Init(R, 'i-C4'));
Dlg^.Insert(Control);

R.Assign(51, 9, 55, 10);
Control := New(PStaticText, Init(R, 'n-C5'));
Dlg^.Insert(Control);

R.Assign(59, 9, 63, 10);
Control := New(PStaticText, Init(R, 'i-C5'));
Dlg^.Insert(Control);

R.Assign(67, 9, 71, 10);
Control := New(PStaticText, Init(R, ' C6'));
Dlg^.Insert(Control);

R.Assign(2, 14, 22, 15);
Control := New(PStaticText, Init(R, 'Расход сырья, м3/час'));
Dlg^.Insert(Control);

R.Assign(2, 1, 15, 2);
Control := New(PStaticText, Init(R, 'Дата отбора'));
Dlg^.Insert(Control);

R.Assign(31, 1, 60, 2);
Control := New(PStaticText, Init(R, 'Дата регенерации катализатора'));
Dlg^.Insert(Control);

R.Assign(36, 14, 61, 15);
Control := New(PStaticText, Init(R, 'Серы в гидрогенизате, ppm'));
Dlg^.Insert(Control);

R.Assign(2, 16, 35, 17);
Control := New(PStaticText, Init(R, 'Количество дней после регенерации'));
Dlg^.Insert(Control);

Dlg^.SelectNext(False);
MakeDialog := Dlg;

end;



  procedure tmyapp.d_okno;

var
  DataRec : record
    DataOtbora : String[10];
    DataRegeneration : String[10];
    P202 : String[10];
    P203 : String[10];
    P204 : String[10];
  {  P205 : String[10];}
    T202 : String[10];
    T203 : String[10];
    T204 : String[10];
  {  T205 : String[10];
    dT202 : String[10];
    dT203 : String[10];
    dT204 : String[10];
    dT205 : String[10];}
    C1 : String[10];
    C2 : String[10];
    C3 : String[10];
    C4 : String[10];
    C5 : String[10];
    C6 : String[10];
    C7 : String[10];
    C8 : String[10];
    C9 : String[10];
    Rvsg : String[10];
    VLvsg : String[10];
    Rs : String[10];
    Sera : String[10];
    Dney : String[10];
  end;
              Dialog:PDialog;
              B:PView;
              R:TRect;
              Control:word;
              i,j,Code:integer;
              si:string;
              nam:string;

 begin

     DataRec.DataOtbora:=par27;
     DataRec.Dataregeneration:=par28;
     str(par1:8:2,DataRec.P202);
     str(par2:8:2,DataRec.P203);
     str(par3:8:2,DataRec.P204);
    { str(par4:8:2,DataRec.P205);}
     str(par6:8:2,DataRec.T202);
     str(par7:8:2,DataRec.T203);
     str(par8:8:2,DataRec.T204);
    { str(par9:8:2,DataRec.T205);
     str(par10:8:2,DataRec.dT202);
     str(par11:8:2,DataRec.dT203);
     str(par12:8:2,DataRec.dT204);
     str(par13:8:2,DataRec.dT205);}
     str(par14:5:2,DataRec.C1);
     str(par15:5:2,DataRec.C2);
     str(par16:5:2,DataRec.C3);
     str(par17:5:2,DataRec.C4);
     str(par18:5:2,DataRec.C5);
     str(par19:5:2,DataRec.C6);
     str(par20:5:2,DataRec.C7);
     str(par21:5:2,DataRec.C8);
     str(par22:5:2,DataRec.C9);
     str(par23:8:1,DataRec.Rvsg);
     str(par5:8:2,DataRec.VLvsg);
     str(par26:8:1,DataRec.Rs);
     str(par25:8:2,DataRec.Sera);
     str(par24:8:0,DataRec.Dney);

    Dialog:=MakeDialog;
    Dialog^.HelpCTX:=$F000;
    Dialog^.SetData(DataRec);
    Control:=DeskTop^.ExecView(Dialog);

    if Control<>cmCancel then
       begin
            Dialog^.GetData(DataRec);
       end;
    Dialog^.Done;dispose(dialog);

     par27:=DataRec.DataOtbora;
     par28:=DataRec.Dataregeneration;
     val(DataRec.P202,par1,Code);
     val(DataRec.P203,par2,Code);
     val(DataRec.P204,par3,Code);
{     val(DataRec.P205,par4,Code);}
     val(DataRec.T202,par6,Code);
     val(DataRec.T203,par7,Code);
     val(DataRec.T204,par8,Code);
   {  val(DataRec.T205,par9,Code);
     val(DataRec.dT202,par10,Code);
     val(DataRec.dT203,par11,Code);
     val(DataRec.dT204,par12,Code);
     val(DataRec.dT205,par13,Code);}
     val(DataRec.C1,par14,Code);
     val(DataRec.C2,par15,Code);
     val(DataRec.C3,par16,Code);
     val(DataRec.C4,par17,Code);
     val(DataRec.C5,par18,Code);
     val(DataRec.C6,par19,Code);
     val(DataRec.C7,par20,Code);
     val(DataRec.C8,par21,Code);
     val(DataRec.C9,par22,Code);
     val(DataRec.Rvsg,par23,Code);
     val(DataRec.VLvsg,par5,Code);
     val(DataRec.Rs,par26,Code);
     val(DataRec.Sera,par25,Code);
     val(DataRec.Dney,par24,Code);

  end;

  procedure tmyapp.d_okno_Tex;

var
  DataRec : record
    DataOtbora : String[10];
    DataRegeneration : String[10];
    P202 : String[10];
    P203 : String[10];
    P204 : String[10];
{    P205 : String[10];}
    T202 : String[10];
    T203 : String[10];
    T204 : String[10];
  {  T205 : String[10];
    dT202 : String[10];
    dT203 : String[10];
    dT204 : String[10];
    dT205 : String[10];}
    C1 : String[10];
    C2 : String[10];
    C3 : String[10];
    C4 : String[10];
    C5 : String[10];
    C6 : String[10];
    C7 : String[10];
    C8 : String[10];
    C9 : String[10];
    Rvsg : String[10];
    VLvsg : String[10];
    Rs : String[10];
    Sera : String[10];
    Dney : String[10];
  end;
              Dialog:PDialog;
              B:PView;
              R:TRect;
              Control:word;
              i,j,Code:integer;
              si:string;
              nam:string;


 begin

     DataRec.DataOtbora:=par27;
     DataRec.Dataregeneration:=par28;
     str(par1:8:2,DataRec.P202);
     str(par2:8:2,DataRec.P203);
     str(par3:8:2,DataRec.P204);
{     str(par4:8:2,DataRec.P205);}
     str(par6:8:2,DataRec.T202);
     str(par7:8:2,DataRec.T203);
     str(par8:8:2,DataRec.T204);
{     str(par9:8:2,DataRec.T205);
     str(par10:8:2,DataRec.dT202);
     str(par11:8:2,DataRec.dT203);
     str(par12:8:2,DataRec.dT204);
     str(par13:8:2,DataRec.dT205);}
     str(par14:5:2,DataRec.C1);
     str(par15:5:2,DataRec.C2);
     str(par16:5:2,DataRec.C3);
     str(par17:5:2,DataRec.C4);
     str(par18:5:2,DataRec.C5);
     str(par19:5:2,DataRec.C6);
     str(par20:5:2,DataRec.C7);
     str(par21:5:2,DataRec.C8);
     str(par22:5:2,DataRec.C9);
     str(par23:8:1,DataRec.Rvsg);
     str(par5:8:2,DataRec.VLvsg);
     str(par26:8:1,DataRec.Rs);
     str(par25:8:2,DataRec.Sera);
     str(par24:8:0,DataRec.Dney);

    Dialog:=MakeDialog;
    Dialog^.HelpCTX:=$F000;
    Dialog^.SetData(DataRec);
    Control:=DeskTop^.ExecView(Dialog);

    if Control<>cmCancel then
       begin
            Dialog^.GetData(DataRec);
       end;

     par27:=DataRec.DataOtbora;
     par28:=DataRec.Dataregeneration;
     val(DataRec.P202,par1,Code);
     val(DataRec.P203,par2,Code);
     val(DataRec.P204,par3,Code);
{     val(DataRec.P205,par4,Code);}
     val(DataRec.T202,par6,Code);
     val(DataRec.T203,par7,Code);
     val(DataRec.T204,par8,Code);
{     val(DataRec.T205,par9,Code);
     val(DataRec.dT202,par10,Code);
     val(DataRec.dT203,par11,Code);
     val(DataRec.dT204,par12,Code);
     val(DataRec.dT205,par13,Code);}
     val(DataRec.C1,par14,Code);
     val(DataRec.C2,par15,Code);
     val(DataRec.C3,par16,Code);
     val(DataRec.C4,par17,Code);
     val(DataRec.C5,par18,Code);
     val(DataRec.C6,par19,Code);
     val(DataRec.C7,par20,Code);
     val(DataRec.C8,par21,Code);
     val(DataRec.C9,par22,Code);
     val(DataRec.Rvsg,par23,Code);
     val(DataRec.VLvsg,par5,Code);
     val(DataRec.Rs,par26,Code);
     val(DataRec.Sera,par25,Code);
     val(DataRec.Dney,par24,Code);

  end;





function MakeDialog_Sir : PDialog;
var
  Dlg : PDialog;
  R : TRect;
  Control : PView;

begin
R.Assign(0, 0, 80, 23);
New(Dlg, Init(R, 'Состав сырья'));

R.Assign(11, 2, 19, 3);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 3, 19, 4);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 4, 19, 5);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 5, 19, 6);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 6, 19, 7);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 7, 19, 8);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 8, 19, 9);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 9, 19, 10);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 10, 19, 11);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 11, 19, 12);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 12, 19, 13);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 13, 19, 14);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 14, 19, 15);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 15, 19, 16);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 16, 19, 17);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 17, 19, 18);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 18, 19, 19);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 2, 39, 3);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 3, 39, 4);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 4, 39, 5);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 5, 39, 6);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 6, 39, 7);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 7, 39, 8);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 8, 39, 9);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 9, 39, 10);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 10, 39, 11);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 11, 39, 12);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 12, 39, 13);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 13, 39, 14);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 14, 39, 15);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 15, 39, 16);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 16, 39, 17);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 17, 39, 18);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 18, 39, 19);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 2, 59, 3);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 3, 59, 4);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 4, 59, 5);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 5, 59, 6);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 6, 59, 7);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 7, 59, 8);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 8, 59, 9);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 9, 59, 10);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 10, 59, 11);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 11, 59, 12);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 12, 59, 13);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 13, 59, 14);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 14, 59, 15);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 15, 59, 16);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 16, 59, 17);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 17, 59, 18);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 18, 59, 19);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 2, 79, 3);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 3, 79, 4);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 4, 79, 5);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 5, 79, 6);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 6, 79, 7);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 7, 79, 8);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 8, 79, 9);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 9, 79, 10);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 10, 79, 11);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 11, 79, 12);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 12, 79, 13);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 13, 79, 14);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 14, 79, 15);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 15, 79, 16);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 16, 79, 17);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 17, 79, 18);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 18, 79, 19);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 19, 79, 20);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(45, 20, 55, 22);
Control := New(PButton, Init(R, 'O~k~', cmOK, bfDefault));
Dlg^.Insert(Control);

R.Assign(1, 2, 11, 3);
Control := New(PStaticText, Init(R, 'Этан'));
Dlg^.Insert(Control);

R.Assign(1, 3, 11, 4);
Control := New(PStaticText, Init(R, 'Пропан'));
Dlg^.Insert(Control);

R.Assign(1, 4, 11, 5);
Control := New(PStaticText, Init(R, 'и-Бутан'));
Dlg^.Insert(Control);

R.Assign(1, 5, 11, 6);
Control := New(PStaticText, Init(R, 'н-Бутан'));
Dlg^.Insert(Control);

R.Assign(1, 6, 11, 7);
Control := New(PStaticText, Init(R, 'и-Пентан'));
Dlg^.Insert(Control);

R.Assign(1, 7, 11, 8);
Control := New(PStaticText, Init(R, 'н-Пентан'));
Dlg^.Insert(Control);

R.Assign(1, 8, 11, 9);
Control := New(PStaticText, Init(R, '2,2-ДМБ'));
Dlg^.Insert(Control);

R.Assign(1, 9, 11, 10);
Control := New(PStaticText, Init(R, 'ц-Пентан'));
Dlg^.Insert(Control);

R.Assign(1, 10, 11, 11);
Control := New(PStaticText, Init(R, '2,3-ДМБ'));
Dlg^.Insert(Control);

R.Assign(1, 11, 11, 12);
Control := New(PStaticText, Init(R, '2-МП'));
Dlg^.Insert(Control);

R.Assign(1, 12, 11, 13);
Control := New(PStaticText, Init(R, '3-МП'));
Dlg^.Insert(Control);

R.Assign(1, 13, 11, 14);
Control := New(PStaticText, Init(R, 'н-Гексан'));
Dlg^.Insert(Control);

R.Assign(1, 14, 11, 15);
Control := New(PStaticText, Init(R, 'МЦП'));
Dlg^.Insert(Control);

R.Assign(1, 15, 11, 16);
Control := New(PStaticText, Init(R, '2,2-ДМП'));
Dlg^.Insert(Control);

R.Assign(1, 16, 11, 17);
Control := New(PStaticText, Init(R, '2,4-ДМП'));
Dlg^.Insert(Control);

R.Assign(1, 17, 11, 18);
Control := New(PStaticText, Init(R, 'Бензол'));
Dlg^.Insert(Control);

R.Assign(1, 18, 11, 19);
Control := New(PStaticText, Init(R, '2,2,3-ТМП'));
Dlg^.Insert(Control);

R.Assign(20, 2, 31, 3);
Control := New(PStaticText, Init(R, '3,3-ДМП'));
Dlg^.Insert(Control);

R.Assign(20, 3, 31, 4);
Control := New(PStaticText, Init(R, 'ц-Гексан'));
Dlg^.Insert(Control);

R.Assign(20, 4, 31, 5);
Control := New(PStaticText, Init(R, '2-МГ'));
Dlg^.Insert(Control);

R.Assign(20, 5, 31, 6);
Control := New(PStaticText, Init(R, '2,3-ДМП'));
Dlg^.Insert(Control);

R.Assign(20, 6, 31, 7);
Control := New(PStaticText, Init(R, '3-МГ'));
Dlg^.Insert(Control);

R.Assign(20, 7, 31, 8);
Control := New(PStaticText, Init(R, '1,3-ДМЦП(ц)'));
Dlg^.Insert(Control);

R.Assign(20, 8, 31, 9);
Control := New(PStaticText, Init(R, '1,3-ДМЦП(т)'));
Dlg^.Insert(Control);

R.Assign(20, 9, 31, 10);
Control := New(PStaticText, Init(R, '1,2-ДМЦП(т)'));
Dlg^.Insert(Control);

R.Assign(20, 10, 31, 11);
Control := New(PStaticText, Init(R, 'н-Гептан'));
Dlg^.Insert(Control);

R.Assign(20, 11, 31, 12);
Control := New(PStaticText, Init(R, '1,2-ДМЦП'));
Dlg^.Insert(Control);

R.Assign(20, 12, 31, 13);
Control := New(PStaticText, Init(R, '2,3-ДМГ'));
Dlg^.Insert(Control);

R.Assign(20, 13, 31, 14);
Control := New(PStaticText, Init(R, '1,1,3-ТМЦП'));
Dlg^.Insert(Control);

R.Assign(20, 14, 31, 15);
Control := New(PStaticText, Init(R, 'МЦГ'));
Dlg^.Insert(Control);

R.Assign(20, 15, 31, 16);
Control := New(PStaticText, Init(R, '2,5-ДМГ'));
Dlg^.Insert(Control);

R.Assign(20, 16, 31, 17);
Control := New(PStaticText, Init(R, '2,4-ДМГ'));
Dlg^.Insert(Control);

R.Assign(20, 17, 31, 18);
Control := New(PStaticText, Init(R, 'ЭЦП'));
Dlg^.Insert(Control);

R.Assign(20, 18, 31, 19);
Control := New(PStaticText, Init(R, '2,2,3-ТМП'));
Dlg^.Insert(Control);

R.Assign(40, 2, 51, 3);
Control := New(PStaticText, Init(R, '1,2,4-ТМЦП'));
Dlg^.Insert(Control);

R.Assign(40, 3, 51, 4);
Control := New(PStaticText, Init(R, '3,3-ДМГ'));
Dlg^.Insert(Control);

R.Assign(40, 4, 51, 5);
Control := New(PStaticText, Init(R, 'Толуол'));
Dlg^.Insert(Control);

R.Assign(40, 5, 51, 6);
Control := New(PStaticText, Init(R, '1,2,3-ТМЦП'));
Dlg^.Insert(Control);

R.Assign(40, 6, 51, 7);
Control := New(PStaticText, Init(R, '2,3,4-ТМП'));
Dlg^.Insert(Control);

R.Assign(40, 7, 51, 8);
Control := New(PStaticText, Init(R, '2,3-ДМГ'));
Dlg^.Insert(Control);

R.Assign(40, 8, 51, 9);
Control := New(PStaticText, Init(R, '2-М,3-ЭП'));
Dlg^.Insert(Control);

R.Assign(40, 9, 51, 10);
Control := New(PStaticText, Init(R, '1,1,2-ТМЦП'));
Dlg^.Insert(Control);

R.Assign(40, 10, 51, 11);
Control := New(PStaticText, Init(R, '2-МГП'));
Dlg^.Insert(Control);

R.Assign(40, 11, 51, 12);
Control := New(PStaticText, Init(R, '4-МГП'));
Dlg^.Insert(Control);

R.Assign(40, 12, 51, 13);
Control := New(PStaticText, Init(R, '3,4-ДМГ'));
Dlg^.Insert(Control);

R.Assign(40, 13, 51, 14);
Control := New(PStaticText, Init(R, '3-МГП'));
Dlg^.Insert(Control);

R.Assign(40, 14, 51, 15);
Control := New(PStaticText, Init(R, 'Нафт.до С8'));
Dlg^.Insert(Control);

R.Assign(40, 15, 51, 16);
Control := New(PStaticText, Init(R, 'н-Октан'));
Dlg^.Insert(Control);

R.Assign(40, 16, 51, 17);
Control := New(PStaticText, Init(R, '1,2-ДМЦГ(т)'));
Dlg^.Insert(Control);

R.Assign(40, 17, 51, 18);
Control := New(PStaticText, Init(R, '1,3-ДМЦГ(т)'));
Dlg^.Insert(Control);

R.Assign(40, 18, 51, 19);
Control := New(PStaticText, Init(R, '2,3,5-ТМГ'));
Dlg^.Insert(Control);

R.Assign(60, 2, 71, 3);
Control := New(PStaticText, Init(R, '2,2-ДМГП'));
Dlg^.Insert(Control);

R.Assign(60, 3, 71, 4);
Control := New(PStaticText, Init(R, '2,4-ДМГП'));
Dlg^.Insert(Control);

R.Assign(60, 4, 71, 5);
Control := New(PStaticText, Init(R, '2,2,3-ТМГ'));
Dlg^.Insert(Control);

R.Assign(60, 5, 71, 6);
Control := New(PStaticText, Init(R, '2-М,4-ЭГ'));
Dlg^.Insert(Control);

R.Assign(60, 6, 71, 7);
Control := New(PStaticText, Init(R, '2,6-ДМГП'));
Dlg^.Insert(Control);

R.Assign(60, 7, 71, 8);
Control := New(PStaticText, Init(R, '2,5-ДМГП'));
Dlg^.Insert(Control);

R.Assign(60, 8, 71, 9);
Control := New(PStaticText, Init(R, '3,3-ДМГП'));
Dlg^.Insert(Control);

R.Assign(60, 9, 71, 10);
Control := New(PStaticText, Init(R, 'ЭЦГ+ЭБензол'));
Dlg^.Insert(Control);

R.Assign(60, 10, 71, 11);
Control := New(PStaticText, Init(R, 'ТМЦП'));
Dlg^.Insert(Control);

R.Assign(60, 11, 71, 12);
Control := New(PStaticText, Init(R, '2,3,4-ТМГ'));
Dlg^.Insert(Control);

R.Assign(60, 12, 71, 13);
Control := New(PStaticText, Init(R, 'п-Ксилол'));
Dlg^.Insert(Control);

R.Assign(60, 13, 71, 14);
Control := New(PStaticText, Init(R, 'м-Ксилол'));
Dlg^.Insert(Control);

R.Assign(60, 14, 71, 15);
Control := New(PStaticText, Init(R, 'и-С9'));
Dlg^.Insert(Control);

R.Assign(60, 15, 71, 16);
Control := New(PStaticText, Init(R, 'о-Ксилол'));
Dlg^.Insert(Control);

R.Assign(60, 16, 71, 17);
Control := New(PStaticText, Init(R, 'Нафт.до С9'));
Dlg^.Insert(Control);

R.Assign(60, 17, 71, 18);
Control := New(PStaticText, Init(R, 'н-Нонан'));
Dlg^.Insert(Control);

R.Assign(60, 18, 71, 19);
Control := New(PStaticText, Init(R, 'С9+'));
Dlg^.Insert(Control);

R.Assign(60, 19, 71, 20);
Control := New(PStaticText, Init(R, 'в т.ч. Ар'));
Dlg^.Insert(Control);

R.Assign(7, 20, 39, 22);
Control := New(PStaticText, Init(R, 'Для перехода используйте клавишу'^M+
     '   ~TAB~ или ~SHIFT~ + ~TAB~'));
Dlg^.Insert(Control);

Dlg^.SelectNext(False);
MakeDialog_Sir := Dlg;
end;





  procedure tmyapp.d_okno_Sir;

var
  DataRec : record
    F1_Sir : String[6];
    F2_Sir : String[6];
    F3_Sir : String[6];
    F4_Sir : String[6];
    F5_Sir : String[6];
    F6_Sir : String[6];
    F7_Sir : String[6];
    F8_Sir : String[6];
    F9_Sir : String[6];
    F10_Sir : String[6];
    F11_Sir : String[6];
    F12_Sir : String[6];
    F13_Sir : String[6];
    F14_Sir : String[6];
    F15_Sir : String[6];
    F16_Sir : String[6];
    F17_Sir : String[6];
    F18_Sir : String[6];
    F19_Sir : String[6];
    F20_Sir : String[6];
    F21_Sir : String[6];
    F22_Sir : String[6];
    F23_Sir : String[6];
    F24_Sir : String[6];
    F25_Sir : String[6];
    F26_Sir : String[6];
    F27_Sir : String[6];
    F28_Sir : String[6];
    F29_Sir : String[6];
    F30_Sir : String[6];
    F31_Sir : String[6];
    F32_Sir : String[6];
    F33_Sir : String[6];
    F34_Sir : String[6];
    F35_Sir : String[6];
    F36_Sir : String[6];
    F37_Sir : String[6];
    F38_Sir : String[6];
    F39_Sir : String[6];
    F40_Sir : String[6];
    F41_Sir : String[6];
    F42_Sir : String[6];
    F43_Sir : String[6];
    F44_Sir : String[6];
    F45_Sir : String[6];
    F46_Sir : String[6];
    F47_Sir : String[6];
    F48_Sir : String[6];
    F49_Sir : String[6];
    F50_Sir : String[6];
    F51_Sir : String[6];
    F52_Sir : String[6];
    F53_Sir : String[6];
    F54_Sir : String[6];
    F55_Sir : String[6];
    F56_Sir : String[6];
    F57_Sir : String[6];
    F58_Sir : String[6];
    F59_Sir : String[6];
    F60_Sir : String[6];
    F61_Sir : String[6];
    F62_Sir : String[6];
    F63_Sir : String[6];
    F64_Sir : String[6];
    F65_Sir : String[6];
    F66_Sir : String[6];
    F67_Sir : String[6];
    F68_Sir : String[6];
    F69_Sir : String[6];
  end;
              Dialog:PDialog;
              B:PView;
              R:TRect;
              Control:word;
              i,j,Code:integer;
              si:string;
              nam:string;

 begin
     str(Dan_Sir[1]:6:3,DataRec.F1_Sir);
     str(Dan_Sir[2]:6:3,DataRec.F2_Sir);
     str(Dan_Sir[3]:6:3,DataRec.F3_Sir);
     str(Dan_Sir[4]:6:3,DataRec.F4_Sir);
     str(Dan_Sir[5]:6:3,DataRec.F5_Sir);
     str(Dan_Sir[6]:6:3,DataRec.F6_Sir);
     str(Dan_Sir[7]:6:3,DataRec.F7_Sir);
     str(Dan_Sir[8]:6:3,DataRec.F8_Sir);
     str(Dan_Sir[9]:6:3,DataRec.F9_Sir);
     str(Dan_Sir[10]:6:3,DataRec.F10_Sir);
     str(Dan_Sir[11]:6:3,DataRec.F11_Sir);
     str(Dan_Sir[12]:6:3,DataRec.F12_Sir);
     str(Dan_Sir[13]:6:3,DataRec.F13_Sir);
     str(Dan_Sir[14]:6:3,DataRec.F14_Sir);
     str(Dan_Sir[15]:6:3,DataRec.F15_Sir);
     str(Dan_Sir[16]:6:3,DataRec.F16_Sir);
     str(Dan_Sir[17]:6:3,DataRec.F17_Sir);
     str(Dan_Sir[18]:6:3,DataRec.F18_Sir);
     str(Dan_Sir[19]:6:3,DataRec.F19_Sir);
     str(Dan_Sir[20]:6:3,DataRec.F20_Sir);
     str(Dan_Sir[21]:6:3,DataRec.F21_Sir);
     str(Dan_Sir[22]:6:3,DataRec.F22_Sir);
     str(Dan_Sir[23]:6:3,DataRec.F23_Sir);
     str(Dan_Sir[24]:6:3,DataRec.F24_Sir);
     str(Dan_Sir[25]:6:3,DataRec.F25_Sir);
     str(Dan_Sir[26]:6:3,DataRec.F26_Sir);
     str(Dan_Sir[27]:6:3,DataRec.F27_Sir);
     str(Dan_Sir[28]:6:3,DataRec.F28_Sir);
     str(Dan_Sir[29]:6:3,DataRec.F29_Sir);
     str(Dan_Sir[30]:6:3,DataRec.F30_Sir);
     str(Dan_Sir[31]:6:3,DataRec.F31_Sir);
     str(Dan_Sir[32]:6:3,DataRec.F32_Sir);
     str(Dan_Sir[33]:6:3,DataRec.F33_Sir);
     str(Dan_Sir[34]:6:3,DataRec.F34_Sir);
     str(Dan_Sir[35]:6:3,DataRec.F35_Sir);
     str(Dan_Sir[36]:6:3,DataRec.F36_Sir);
     str(Dan_Sir[37]:6:3,DataRec.F37_Sir);
     str(Dan_Sir[38]:6:3,DataRec.F38_Sir);
     str(Dan_Sir[39]:6:3,DataRec.F39_Sir);
     str(Dan_Sir[40]:6:3,DataRec.F40_Sir);
     str(Dan_Sir[41]:6:3,DataRec.F41_Sir);
     str(Dan_Sir[42]:6:3,DataRec.F42_Sir);
     str(Dan_Sir[43]:6:3,DataRec.F43_Sir);
     str(Dan_Sir[44]:6:3,DataRec.F44_Sir);
     str(Dan_Sir[45]:6:3,DataRec.F45_Sir);
     str(Dan_Sir[46]:6:3,DataRec.F46_Sir);
     str(Dan_Sir[47]:6:3,DataRec.F47_Sir);
     str(Dan_Sir[48]:6:3,DataRec.F48_Sir);
     str(Dan_Sir[49]:6:3,DataRec.F49_Sir);
     str(Dan_Sir[50]:6:3,DataRec.F50_Sir);
     str(Dan_Sir[51]:6:3,DataRec.F51_Sir);
     str(Dan_Sir[52]:6:3,DataRec.F52_Sir);
     str(Dan_Sir[53]:6:3,DataRec.F53_Sir);
     str(Dan_Sir[54]:6:3,DataRec.F54_Sir);
     str(Dan_Sir[55]:6:3,DataRec.F55_Sir);
     str(Dan_Sir[56]:6:3,DataRec.F56_Sir);
     str(Dan_Sir[57]:6:3,DataRec.F57_Sir);
     str(Dan_Sir[58]:6:3,DataRec.F58_Sir);
     str(Dan_Sir[59]:6:3,DataRec.F59_Sir);
     str(Dan_Sir[60]:6:3,DataRec.F60_Sir);
     str(Dan_Sir[61]:6:3,DataRec.F61_Sir);
     str(Dan_Sir[62]:6:3,DataRec.F62_Sir);
     str(Dan_Sir[63]:6:3,DataRec.F63_Sir);
     str(Dan_Sir[64]:6:3,DataRec.F64_Sir);
     str(Dan_Sir[65]:6:3,DataRec.F65_Sir);
     str(Dan_Sir[66]:6:3,DataRec.F66_Sir);
     str(Dan_Sir[67]:6:3,DataRec.F67_Sir);
     str(Dan_Sir[68]:6:3,DataRec.F68_Sir);
     str(Dan_Sir[69]:6:3,DataRec.F69_Sir);


    Dialog:=MakeDialog_Sir;
    Dialog^.HelpCTX:=$F000;
    Dialog^.SetData(DataRec);
    Control:=DeskTop^.ExecView(Dialog);

    if Control<>cmCancel then
       begin
            Dialog^.GetData(DataRec);
       end;

     val(DataRec.F1_Sir,Dan_Sir[1],Code);
     val(DataRec.F2_Sir,Dan_Sir[2],Code);
     val(DataRec.F3_Sir,Dan_Sir[3],Code);
     val(DataRec.F4_Sir,Dan_Sir[4],Code);
     val(DataRec.F5_Sir,Dan_Sir[5],Code);
     val(DataRec.F6_Sir,Dan_Sir[6],Code);
     val(DataRec.F7_Sir,Dan_Sir[7],Code);
     val(DataRec.F8_Sir,Dan_Sir[8],Code);
     val(DataRec.F9_Sir,Dan_Sir[9],Code);
     val(DataRec.F10_Sir,Dan_Sir[10],Code);
     val(DataRec.F11_Sir,Dan_Sir[11],Code);
     val(DataRec.F12_Sir,Dan_Sir[12],Code);
     val(DataRec.F13_Sir,Dan_Sir[13],Code);
     val(DataRec.F14_Sir,Dan_Sir[14],Code);
     val(DataRec.F15_Sir,Dan_Sir[15],Code);
     val(DataRec.F16_Sir,Dan_Sir[16],Code);
     val(DataRec.F17_Sir,Dan_Sir[17],Code);
     val(DataRec.F18_Sir,Dan_Sir[18],Code);
     val(DataRec.F19_Sir,Dan_Sir[19],Code);
     val(DataRec.F20_Sir,Dan_Sir[20],Code);
     val(DataRec.F21_Sir,Dan_Sir[21],Code);
     val(DataRec.F22_Sir,Dan_Sir[22],Code);
     val(DataRec.F23_Sir,Dan_Sir[23],Code);
     val(DataRec.F24_Sir,Dan_Sir[24],Code);
     val(DataRec.F25_Sir,Dan_Sir[25],Code);
     val(DataRec.F26_Sir,Dan_Sir[26],Code);
     val(DataRec.F27_Sir,Dan_Sir[27],Code);
     val(DataRec.F28_Sir,Dan_Sir[28],Code);
     val(DataRec.F29_Sir,Dan_Sir[29],Code);
     val(DataRec.F30_Sir,Dan_Sir[30],Code);
     val(DataRec.F31_Sir,Dan_Sir[31],Code);
     val(DataRec.F32_Sir,Dan_Sir[32],Code);
     val(DataRec.F33_Sir,Dan_Sir[33],Code);
     val(DataRec.F34_Sir,Dan_Sir[34],Code);
     val(DataRec.F35_Sir,Dan_Sir[35],Code);
     val(DataRec.F36_Sir,Dan_Sir[36],Code);
     val(DataRec.F37_Sir,Dan_Sir[37],Code);
     val(DataRec.F38_Sir,Dan_Sir[38],Code);
     val(DataRec.F39_Sir,Dan_Sir[39],Code);
     val(DataRec.F40_Sir,Dan_Sir[40],Code);
     val(DataRec.F41_Sir,Dan_Sir[41],Code);
     val(DataRec.F42_Sir,Dan_Sir[42],Code);
     val(DataRec.F43_Sir,Dan_Sir[43],Code);
     val(DataRec.F44_Sir,Dan_Sir[44],Code);
     val(DataRec.F45_Sir,Dan_Sir[45],Code);
     val(DataRec.F46_Sir,Dan_Sir[46],Code);
     val(DataRec.F47_Sir,Dan_Sir[47],Code);
     val(DataRec.F48_Sir,Dan_Sir[48],Code);
     val(DataRec.F49_Sir,Dan_Sir[49],Code);
     val(DataRec.F50_Sir,Dan_Sir[50],Code);
     val(DataRec.F51_Sir,Dan_Sir[51],Code);
     val(DataRec.F52_Sir,Dan_Sir[52],Code);
     val(DataRec.F53_Sir,Dan_Sir[53],Code);
     val(DataRec.F54_Sir,Dan_Sir[54],Code);
     val(DataRec.F55_Sir,Dan_Sir[55],Code);
     val(DataRec.F56_Sir,Dan_Sir[56],Code);
     val(DataRec.F57_Sir,Dan_Sir[57],Code);
     val(DataRec.F58_Sir,Dan_Sir[58],Code);
     val(DataRec.F59_Sir,Dan_Sir[59],Code);
     val(DataRec.F60_Sir,Dan_Sir[60],Code);
     val(DataRec.F61_Sir,Dan_Sir[61],Code);
     val(DataRec.F62_Sir,Dan_Sir[62],Code);
     val(DataRec.F63_Sir,Dan_Sir[63],Code);
     val(DataRec.F64_Sir,Dan_Sir[64],Code);
     val(DataRec.F65_Sir,Dan_Sir[65],Code);
     val(DataRec.F66_Sir,Dan_Sir[66],Code);
     val(DataRec.F67_Sir,Dan_Sir[67],Code);
     val(DataRec.F68_Sir,Dan_Sir[68],Code);
     val(DataRec.F69_Sir,Dan_Sir[69],Code);

  end;






function MakeDialog_Kat : PDialog;
var
  Dlg : PDialog;
  R : TRect;
  Control : PView;

begin
R.Assign(0, 0, 80, 23);
New(Dlg, Init(R, 'Состав катализата'));

R.Assign(11, 2, 19, 3);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 3, 19, 4);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 4, 19, 5);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 5, 19, 6);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 6, 19, 7);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 7, 19, 8);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 8, 19, 9);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 9, 19, 10);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 10, 19, 11);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 11, 19, 12);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 12, 19, 13);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 13, 19, 14);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 14, 19, 15);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 15, 19, 16);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 16, 19, 17);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 17, 19, 18);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(11, 18, 19, 19);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 2, 39, 3);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 3, 39, 4);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 4, 39, 5);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 5, 39, 6);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 6, 39, 7);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 7, 39, 8);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 8, 39, 9);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 9, 39, 10);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 10, 39, 11);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 11, 39, 12);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 12, 39, 13);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 13, 39, 14);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 14, 39, 15);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 15, 39, 16);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 16, 39, 17);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 17, 39, 18);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(31, 18, 39, 19);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 2, 59, 3);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 3, 59, 4);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 4, 59, 5);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 5, 59, 6);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 6, 59, 7);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 7, 59, 8);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 8, 59, 9);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 9, 59, 10);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 10, 59, 11);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 11, 59, 12);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 12, 59, 13);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 13, 59, 14);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 14, 59, 15);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 15, 59, 16);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 16, 59, 17);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 17, 59, 18);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(51, 18, 59, 19);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 2, 79, 3);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 3, 79, 4);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 4, 79, 5);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 5, 79, 6);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 6, 79, 7);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 7, 79, 8);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 8, 79, 9);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 9, 79, 10);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 10, 79, 11);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 11, 79, 12);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 12, 79, 13);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 13, 79, 14);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 14, 79, 15);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 15, 79, 16);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 16, 79, 17);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 17, 79, 18);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 18, 79, 19);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(71, 19, 79, 20);
Control := New(PInputLine, Init(R, 6));
Dlg^.Insert(Control);

R.Assign(45, 20, 55, 22);
Control := New(PButton, Init(R, 'O~k~', cmOK, bfDefault));
Dlg^.Insert(Control);

R.Assign(1, 2, 11, 3);
Control := New(PStaticText, Init(R, 'Этан'));
Dlg^.Insert(Control);

R.Assign(1, 3, 11, 4);
Control := New(PStaticText, Init(R, 'Пропан'));
Dlg^.Insert(Control);

R.Assign(1, 4, 11, 5);
Control := New(PStaticText, Init(R, 'и-Бутан'));
Dlg^.Insert(Control);

R.Assign(1, 5, 11, 6);
Control := New(PStaticText, Init(R, 'н-Бутан'));
Dlg^.Insert(Control);

R.Assign(1, 6, 11, 7);
Control := New(PStaticText, Init(R, 'и-Пентан'));
Dlg^.Insert(Control);

R.Assign(1, 7, 11, 8);
Control := New(PStaticText, Init(R, 'н-Пентан'));
Dlg^.Insert(Control);

R.Assign(1, 8, 11, 9);
Control := New(PStaticText, Init(R, '2,2-ДМБ'));
Dlg^.Insert(Control);

R.Assign(1, 9, 11, 10);
Control := New(PStaticText, Init(R, 'ц-Пентан'));
Dlg^.Insert(Control);

R.Assign(1, 10, 11, 11);
Control := New(PStaticText, Init(R, '2,3-ДМБ'));
Dlg^.Insert(Control);

R.Assign(1, 11, 11, 12);
Control := New(PStaticText, Init(R, '2-МП'));
Dlg^.Insert(Control);

R.Assign(1, 12, 11, 13);
Control := New(PStaticText, Init(R, '3-МП'));
Dlg^.Insert(Control);

R.Assign(1, 13, 11, 14);
Control := New(PStaticText, Init(R, 'н-Гексан'));
Dlg^.Insert(Control);

R.Assign(1, 14, 11, 15);
Control := New(PStaticText, Init(R, 'МЦП'));
Dlg^.Insert(Control);

R.Assign(1, 15, 11, 16);
Control := New(PStaticText, Init(R, '2,2-ДМП'));
Dlg^.Insert(Control);

R.Assign(1, 16, 11, 17);
Control := New(PStaticText, Init(R, '2,4-ДМП'));
Dlg^.Insert(Control);

R.Assign(1, 17, 11, 18);
Control := New(PStaticText, Init(R, 'Бензол'));
Dlg^.Insert(Control);

R.Assign(1, 18, 11, 19);
Control := New(PStaticText, Init(R, '2,2,3-ТМП'));
Dlg^.Insert(Control);

R.Assign(20, 2, 31, 3);
Control := New(PStaticText, Init(R, '3,3-ДМП'));
Dlg^.Insert(Control);

R.Assign(20, 3, 31, 4);
Control := New(PStaticText, Init(R, 'ц-Гексан'));
Dlg^.Insert(Control);

R.Assign(20, 4, 31, 5);
Control := New(PStaticText, Init(R, '2-МГ'));
Dlg^.Insert(Control);

R.Assign(20, 5, 31, 6);
Control := New(PStaticText, Init(R, '2,3-ДМП'));
Dlg^.Insert(Control);

R.Assign(20, 6, 31, 7);
Control := New(PStaticText, Init(R, '3-МГ'));
Dlg^.Insert(Control);

R.Assign(20, 7, 31, 8);
Control := New(PStaticText, Init(R, '1,3-ДМЦП(ц)'));
Dlg^.Insert(Control);

R.Assign(20, 8, 31, 9);
Control := New(PStaticText, Init(R, '1,3-ДМЦП(т)'));
Dlg^.Insert(Control);

R.Assign(20, 9, 31, 10);
Control := New(PStaticText, Init(R, '1,2-ДМЦП(т)'));
Dlg^.Insert(Control);

R.Assign(20, 10, 31, 11);
Control := New(PStaticText, Init(R, 'н-Гептан'));
Dlg^.Insert(Control);

R.Assign(20, 11, 31, 12);
Control := New(PStaticText, Init(R, '1,2-ДМЦП'));
Dlg^.Insert(Control);

R.Assign(20, 12, 31, 13);
Control := New(PStaticText, Init(R, '2,3-ДМГ'));
Dlg^.Insert(Control);

R.Assign(20, 13, 31, 14);
Control := New(PStaticText, Init(R, '1,1,3-ТМЦП'));
Dlg^.Insert(Control);

R.Assign(20, 14, 31, 15);
Control := New(PStaticText, Init(R, 'МЦГ'));
Dlg^.Insert(Control);

R.Assign(20, 15, 31, 16);
Control := New(PStaticText, Init(R, '2,5-ДМГ'));
Dlg^.Insert(Control);

R.Assign(20, 16, 31, 17);
Control := New(PStaticText, Init(R, '2,4-ДМГ'));
Dlg^.Insert(Control);

R.Assign(20, 17, 31, 18);
Control := New(PStaticText, Init(R, 'ЭЦП'));
Dlg^.Insert(Control);

R.Assign(20, 18, 31, 19);
Control := New(PStaticText, Init(R, '2,2,3-ТМП'));
Dlg^.Insert(Control);

R.Assign(40, 2, 51, 3);
Control := New(PStaticText, Init(R, '1,2,4-ТМЦП'));
Dlg^.Insert(Control);

R.Assign(40, 3, 51, 4);
Control := New(PStaticText, Init(R, '3,3-ДМГ'));
Dlg^.Insert(Control);

R.Assign(40, 4, 51, 5);
Control := New(PStaticText, Init(R, 'Толуол'));
Dlg^.Insert(Control);

R.Assign(40, 5, 51, 6);
Control := New(PStaticText, Init(R, '1,2,3-ТМЦП'));
Dlg^.Insert(Control);

R.Assign(40, 6, 51, 7);
Control := New(PStaticText, Init(R, '2,3,4-ТМП'));
Dlg^.Insert(Control);

R.Assign(40, 7, 51, 8);
Control := New(PStaticText, Init(R, '2,3-ДМГ'));
Dlg^.Insert(Control);

R.Assign(40, 8, 51, 9);
Control := New(PStaticText, Init(R, '2-М,3-ЭП'));
Dlg^.Insert(Control);

R.Assign(40, 9, 51, 10);
Control := New(PStaticText, Init(R, '1,1,2-ТМЦП'));
Dlg^.Insert(Control);

R.Assign(40, 10, 51, 11);
Control := New(PStaticText, Init(R, '2-МГП'));
Dlg^.Insert(Control);

R.Assign(40, 11, 51, 12);
Control := New(PStaticText, Init(R, '4-МГП'));
Dlg^.Insert(Control);

R.Assign(40, 12, 51, 13);
Control := New(PStaticText, Init(R, '3,4-ДМГ'));
Dlg^.Insert(Control);

R.Assign(40, 13, 51, 14);
Control := New(PStaticText, Init(R, '3-МГП'));
Dlg^.Insert(Control);

R.Assign(40, 14, 51, 15);
Control := New(PStaticText, Init(R, 'Нафт.до С8'));
Dlg^.Insert(Control);

R.Assign(40, 15, 51, 16);
Control := New(PStaticText, Init(R, 'н-Октан'));
Dlg^.Insert(Control);

R.Assign(40, 16, 51, 17);
Control := New(PStaticText, Init(R, '1,2-ДМЦГ(т)'));
Dlg^.Insert(Control);

R.Assign(40, 17, 51, 18);
Control := New(PStaticText, Init(R, '1,3-ДМЦГ(т)'));
Dlg^.Insert(Control);

R.Assign(40, 18, 51, 19);
Control := New(PStaticText, Init(R, '2,3,5-ТМГ'));
Dlg^.Insert(Control);

R.Assign(60, 2, 71, 3);
Control := New(PStaticText, Init(R, '2,2-ДМГП'));
Dlg^.Insert(Control);

R.Assign(60, 3, 71, 4);
Control := New(PStaticText, Init(R, '2,4-ДМГП'));
Dlg^.Insert(Control);

R.Assign(60, 4, 71, 5);
Control := New(PStaticText, Init(R, '2,2,3-ТМГ'));
Dlg^.Insert(Control);

R.Assign(60, 5, 71, 6);
Control := New(PStaticText, Init(R, '2-М,4-ЭГ'));
Dlg^.Insert(Control);

R.Assign(60, 6, 71, 7);
Control := New(PStaticText, Init(R, '2,6-ДМГП'));
Dlg^.Insert(Control);

R.Assign(60, 7, 71, 8);
Control := New(PStaticText, Init(R, '2,5-ДМГП'));
Dlg^.Insert(Control);

R.Assign(60, 8, 71, 9);
Control := New(PStaticText, Init(R, '3,3-ДМГП'));
Dlg^.Insert(Control);

R.Assign(60, 9, 71, 10);
Control := New(PStaticText, Init(R, 'ЭЦГ+ЭБензол'));
Dlg^.Insert(Control);

R.Assign(60, 10, 71, 11);
Control := New(PStaticText, Init(R, 'ТМЦП'));
Dlg^.Insert(Control);

R.Assign(60, 11, 71, 12);
Control := New(PStaticText, Init(R, '2,3,4-ТМГ'));
Dlg^.Insert(Control);

R.Assign(60, 12, 71, 13);
Control := New(PStaticText, Init(R, 'п-Ксилол'));
Dlg^.Insert(Control);

R.Assign(60, 13, 71, 14);
Control := New(PStaticText, Init(R, 'м-Ксилол'));
Dlg^.Insert(Control);

R.Assign(60, 14, 71, 15);
Control := New(PStaticText, Init(R, 'и-С9'));
Dlg^.Insert(Control);

R.Assign(60, 15, 71, 16);
Control := New(PStaticText, Init(R, 'о-Ксилол'));
Dlg^.Insert(Control);

R.Assign(60, 16, 71, 17);
Control := New(PStaticText, Init(R, 'Нафт.до С9'));
Dlg^.Insert(Control);

R.Assign(60, 17, 71, 18);
Control := New(PStaticText, Init(R, 'н-Нонан'));
Dlg^.Insert(Control);

R.Assign(60, 18, 71, 19);
Control := New(PStaticText, Init(R, 'С9+'));
Dlg^.Insert(Control);

R.Assign(60, 19, 71, 20);
Control := New(PStaticText, Init(R, 'в т.ч. Ар'));
Dlg^.Insert(Control);

R.Assign(7, 20, 39, 22);
Control := New(PStaticText, Init(R, 'Для перехода используйте клавишу'^M+
     '   ~TAB~ или ~SHIFT~ + ~TAB~'));
Dlg^.Insert(Control);

Dlg^.SelectNext(False);
MakeDialog_Kat := Dlg;
end;





  procedure tmyapp.d_okno_Kat;

var
  DataRec : record
    F1_Kat : String[6];
    F2_Kat : String[6];
    F3_Kat : String[6];
    F4_Kat : String[6];
    F5_Kat : String[6];
    F6_Kat : String[6];
    F7_Kat : String[6];
    F8_Kat : String[6];
    F9_Kat : String[6];
    F10_Kat : String[6];
    F11_Kat : String[6];
    F12_Kat : String[6];
    F13_Kat : String[6];
    F14_Kat : String[6];
    F15_Kat : String[6];
    F16_Kat : String[6];
    F17_Kat : String[6];
    F18_Kat : String[6];
    F19_Kat : String[6];
    F20_Kat : String[6];
    F21_Kat : String[6];
    F22_Kat : String[6];
    F23_Kat : String[6];
    F24_Kat : String[6];
    F25_Kat : String[6];
    F26_Kat : String[6];
    F27_Kat : String[6];
    F28_Kat : String[6];
    F29_Kat : String[6];
    F30_Kat : String[6];
    F31_Kat : String[6];
    F32_Kat : String[6];
    F33_Kat : String[6];
    F34_Kat : String[6];
    F35_Kat : String[6];
    F36_Kat : String[6];
    F37_Kat : String[6];
    F38_Kat : String[6];
    F39_Kat : String[6];
    F40_Kat : String[6];
    F41_Kat : String[6];
    F42_Kat : String[6];
    F43_Kat : String[6];
    F44_Kat : String[6];
    F45_Kat : String[6];
    F46_Kat : String[6];
    F47_Kat : String[6];
    F48_Kat : String[6];
    F49_Kat : String[6];
    F50_Kat : String[6];
    F51_Kat : String[6];
    F52_Kat : String[6];
    F53_Kat : String[6];
    F54_Kat : String[6];
    F55_Kat : String[6];
    F56_Kat : String[6];
    F57_Kat : String[6];
    F58_Kat : String[6];
    F59_Kat : String[6];
    F60_Kat : String[6];
    F61_Kat : String[6];
    F62_Kat : String[6];
    F63_Kat : String[6];
    F64_Kat : String[6];
    F65_Kat : String[6];
    F66_Kat : String[6];
    F67_Kat : String[6];
    F68_Kat : String[6];
    F69_Kat : String[6];
  end;
              Dialog:PDialog;
              B:PView;
              R:TRect;
              Control:word;
              i,j,Code:integer;
              si:string;
              nam:string;

 begin
     str(Dan_Kat[1]:6:3,DataRec.F1_Kat);
     str(Dan_Kat[2]:6:3,DataRec.F2_Kat);
     str(Dan_Kat[3]:6:3,DataRec.F3_Kat);
     str(Dan_Kat[4]:6:3,DataRec.F4_Kat);
     str(Dan_Kat[5]:6:3,DataRec.F5_Kat);
     str(Dan_Kat[6]:6:3,DataRec.F6_Kat);
     str(Dan_Kat[7]:6:3,DataRec.F7_Kat);
     str(Dan_Kat[8]:6:3,DataRec.F8_Kat);
     str(Dan_Kat[9]:6:3,DataRec.F9_Kat);
     str(Dan_Kat[10]:6:3,DataRec.F10_Kat);
     str(Dan_Kat[11]:6:3,DataRec.F11_Kat);
     str(Dan_Kat[12]:6:3,DataRec.F12_Kat);
     str(Dan_Kat[13]:6:3,DataRec.F13_Kat);
     str(Dan_Kat[14]:6:3,DataRec.F14_Kat);
     str(Dan_Kat[15]:6:3,DataRec.F15_Kat);
     str(Dan_Kat[16]:6:3,DataRec.F16_Kat);
     str(Dan_Kat[17]:6:3,DataRec.F17_Kat);
     str(Dan_Kat[18]:6:3,DataRec.F18_Kat);
     str(Dan_Kat[19]:6:3,DataRec.F19_Kat);
     str(Dan_Kat[20]:6:3,DataRec.F20_Kat);
     str(Dan_Kat[21]:6:3,DataRec.F21_Kat);
     str(Dan_Kat[22]:6:3,DataRec.F22_Kat);
     str(Dan_Kat[23]:6:3,DataRec.F23_Kat);
     str(Dan_Kat[24]:6:3,DataRec.F24_Kat);
     str(Dan_Kat[25]:6:3,DataRec.F25_Kat);
     str(Dan_Kat[26]:6:3,DataRec.F26_Kat);
     str(Dan_Kat[27]:6:3,DataRec.F27_Kat);
     str(Dan_Kat[28]:6:3,DataRec.F28_Kat);
     str(Dan_Kat[29]:6:3,DataRec.F29_Kat);
     str(Dan_Kat[30]:6:3,DataRec.F30_Kat);
     str(Dan_Kat[31]:6:3,DataRec.F31_Kat);
     str(Dan_Kat[32]:6:3,DataRec.F32_Kat);
     str(Dan_Kat[33]:6:3,DataRec.F33_Kat);
     str(Dan_Kat[34]:6:3,DataRec.F34_Kat);
     str(Dan_Kat[35]:6:3,DataRec.F35_Kat);
     str(Dan_Kat[36]:6:3,DataRec.F36_Kat);
     str(Dan_Kat[37]:6:3,DataRec.F37_Kat);
     str(Dan_Kat[38]:6:3,DataRec.F38_Kat);
     str(Dan_Kat[39]:6:3,DataRec.F39_Kat);
     str(Dan_Kat[40]:6:3,DataRec.F40_Kat);
     str(Dan_Kat[41]:6:3,DataRec.F41_Kat);
     str(Dan_Kat[42]:6:3,DataRec.F42_Kat);
     str(Dan_Kat[43]:6:3,DataRec.F43_Kat);
     str(Dan_Kat[44]:6:3,DataRec.F44_Kat);
     str(Dan_Kat[45]:6:3,DataRec.F45_Kat);
     str(Dan_Kat[46]:6:3,DataRec.F46_Kat);
     str(Dan_Kat[47]:6:3,DataRec.F47_Kat);
     str(Dan_Kat[48]:6:3,DataRec.F48_Kat);
     str(Dan_Kat[49]:6:3,DataRec.F49_Kat);
     str(Dan_Kat[50]:6:3,DataRec.F50_Kat);
     str(Dan_Kat[51]:6:3,DataRec.F51_Kat);
     str(Dan_Kat[52]:6:3,DataRec.F52_Kat);
     str(Dan_Kat[53]:6:3,DataRec.F53_Kat);
     str(Dan_Kat[54]:6:3,DataRec.F54_Kat);
     str(Dan_Kat[55]:6:3,DataRec.F55_Kat);
     str(Dan_Kat[56]:6:3,DataRec.F56_Kat);
     str(Dan_Kat[57]:6:3,DataRec.F57_Kat);
     str(Dan_Kat[58]:6:3,DataRec.F58_Kat);
     str(Dan_Kat[59]:6:3,DataRec.F59_Kat);
     str(Dan_Kat[60]:6:3,DataRec.F60_Kat);
     str(Dan_Kat[61]:6:3,DataRec.F61_Kat);
     str(Dan_Kat[62]:6:3,DataRec.F62_Kat);
     str(Dan_Kat[63]:6:3,DataRec.F63_Kat);
     str(Dan_Kat[64]:6:3,DataRec.F64_Kat);
     str(Dan_Kat[65]:6:3,DataRec.F65_Kat);
     str(Dan_Kat[66]:6:3,DataRec.F66_Kat);
     str(Dan_Kat[67]:6:3,DataRec.F67_Kat);
     str(Dan_Kat[68]:6:3,DataRec.F68_Kat);
     str(Dan_Kat[69]:6:3,DataRec.F69_Kat);


    Dialog:=MakeDialog_Kat;
    Dialog^.HelpCTX:=$F000;
    Dialog^.SetData(DataRec);
    Control:=DeskTop^.ExecView(Dialog);

    if Control<>cmCancel then
       begin
            Dialog^.GetData(DataRec);
       end;

     val(DataRec.F1_Kat,Dan_Kat[1],Code);
     val(DataRec.F2_Kat,Dan_Kat[2],Code);
     val(DataRec.F3_Kat,Dan_Kat[3],Code);
     val(DataRec.F4_Kat,Dan_Kat[4],Code);
     val(DataRec.F5_Kat,Dan_Kat[5],Code);
     val(DataRec.F6_Kat,Dan_Kat[6],Code);
     val(DataRec.F7_Kat,Dan_Kat[7],Code);
     val(DataRec.F8_Kat,Dan_Kat[8],Code);
     val(DataRec.F9_Kat,Dan_Kat[9],Code);
     val(DataRec.F10_Kat,Dan_Kat[10],Code);
     val(DataRec.F11_Kat,Dan_Kat[11],Code);
     val(DataRec.F12_Kat,Dan_Kat[12],Code);
     val(DataRec.F13_Kat,Dan_Kat[13],Code);
     val(DataRec.F14_Kat,Dan_Kat[14],Code);
     val(DataRec.F15_Kat,Dan_Kat[15],Code);
     val(DataRec.F16_Kat,Dan_Kat[16],Code);
     val(DataRec.F17_Kat,Dan_Kat[17],Code);
     val(DataRec.F18_Kat,Dan_Kat[18],Code);
     val(DataRec.F19_Kat,Dan_Kat[19],Code);
     val(DataRec.F20_Kat,Dan_Kat[20],Code);
     val(DataRec.F21_Kat,Dan_Kat[21],Code);
     val(DataRec.F22_Kat,Dan_Kat[22],Code);
     val(DataRec.F23_Kat,Dan_Kat[23],Code);
     val(DataRec.F24_Kat,Dan_Kat[24],Code);
     val(DataRec.F25_Kat,Dan_Kat[25],Code);
     val(DataRec.F26_Kat,Dan_Kat[26],Code);
     val(DataRec.F27_Kat,Dan_Kat[27],Code);
     val(DataRec.F28_Kat,Dan_Kat[28],Code);
     val(DataRec.F29_Kat,Dan_Kat[29],Code);
     val(DataRec.F30_Kat,Dan_Kat[30],Code);
     val(DataRec.F31_Kat,Dan_Kat[31],Code);
     val(DataRec.F32_Kat,Dan_Kat[32],Code);
     val(DataRec.F33_Kat,Dan_Kat[33],Code);
     val(DataRec.F34_Kat,Dan_Kat[34],Code);
     val(DataRec.F35_Kat,Dan_Kat[35],Code);
     val(DataRec.F36_Kat,Dan_Kat[36],Code);
     val(DataRec.F37_Kat,Dan_Kat[37],Code);
     val(DataRec.F38_Kat,Dan_Kat[38],Code);
     val(DataRec.F39_Kat,Dan_Kat[39],Code);
     val(DataRec.F40_Kat,Dan_Kat[40],Code);
     val(DataRec.F41_Kat,Dan_Kat[41],Code);
     val(DataRec.F42_Kat,Dan_Kat[42],Code);
     val(DataRec.F43_Kat,Dan_Kat[43],Code);
     val(DataRec.F44_Kat,Dan_Kat[44],Code);
     val(DataRec.F45_Kat,Dan_Kat[45],Code);
     val(DataRec.F46_Kat,Dan_Kat[46],Code);
     val(DataRec.F47_Kat,Dan_Kat[47],Code);
     val(DataRec.F48_Kat,Dan_Kat[48],Code);
     val(DataRec.F49_Kat,Dan_Kat[49],Code);
     val(DataRec.F50_Kat,Dan_Kat[50],Code);
     val(DataRec.F51_Kat,Dan_Kat[51],Code);
     val(DataRec.F52_Kat,Dan_Kat[52],Code);
     val(DataRec.F53_Kat,Dan_Kat[53],Code);
     val(DataRec.F54_Kat,Dan_Kat[54],Code);
     val(DataRec.F55_Kat,Dan_Kat[55],Code);
     val(DataRec.F56_Kat,Dan_Kat[56],Code);
     val(DataRec.F57_Kat,Dan_Kat[57],Code);
     val(DataRec.F58_Kat,Dan_Kat[58],Code);
     val(DataRec.F59_Kat,Dan_Kat[59],Code);
     val(DataRec.F60_Kat,Dan_Kat[60],Code);
     val(DataRec.F61_Kat,Dan_Kat[61],Code);
     val(DataRec.F62_Kat,Dan_Kat[62],Code);
     val(DataRec.F63_Kat,Dan_Kat[63],Code);
     val(DataRec.F64_Kat,Dan_Kat[64],Code);
     val(DataRec.F65_Kat,Dan_Kat[65],Code);
     val(DataRec.F66_Kat,Dan_Kat[66],Code);
     val(DataRec.F67_Kat,Dan_Kat[67],Code);
     val(DataRec.F68_Kat,Dan_Kat[68],Code);
     val(DataRec.F69_Kat,Dan_Kat[69],Code);

  end;




















  procedure tmyapp.ViborUst;
var
  Dialog:PDialog;
  B:PView;
  R:TRect;
  Control:word;
  Code:integer;
  F:word;
function MakeDialog : PDialog;
var
  Dlg : PDialog;
  R : TRect;
  Control : PView;

begin
R.Assign(14, 2, 66, 21);
New(Dlg, Init(R, 'Выбор установки'));
Dlg^.Palette := dpCyanDialog;

R.Assign(3, 2, 49, 15);
Control := New(PRadioButtons, Init(R,
  NewSItem('1.  Ачинский НПЗ (ЛК-6У)',
  NewSItem('2.  MAZEIKIU NAFTA (LK-6U Nr.1 S-200)',
  NewSItem('3.  MAZEIKIU NAFTA (LK-6U Nr.2 S-200)',
  NewSItem('4.  Омский НПЗ (Л-35-11/1000)',
  NewSItem('5.  Ангарский НПЗ (Л-35-11/1000)',
  NewSItem('6.  КИНЕФ (ЛЧ-35-11/1000)',
  NewSItem('7.  КИНЕФ (ЛЧ-35-11/600)',
  NewSItem('8.  КИНЕФ (Л-35-11/600)',
  NewSItem('9.  КИНЕФ (ЛГ-35-8/300Б)',
  NewSItem('10. Салаватнефтеоргсинтез (Л-35-11/1000)',
  NewSItem('11. Уфимский НПЗ (Л-35-11/300)',
  NewSItem('12. Рязанский НПЗ (Л-35-6/300)',
  NewSItem('13. Рязанский НПЗ (ЛЧ-35-11/600)',

  Nil)))))))))))))));
Dlg^.Insert(Control);

R.Assign(21, 16, 31, 18);
Control := New(PButton, Init(R, 'O~k~', cmOK, bfDefault));
Dlg^.Insert(Control);

Dlg^.SelectNext(False);
MakeDialog := Dlg;
end;


           { 1.  Ачинский НПЗ (ЛК-6У)                 -  GR_AKT.1, L90.1
             2.  MAZEIKIU NAFTA (LK-6U Nr.1 S-200)    -  GR_AKT.2, L90.2
             3.  MAZEIKIU NAFTA (LK-6U Nr.2 S-200)    -  GR_AKT.3, L90.3
             4.  Омский НПЗ (Л-35-11/1000)            -  GR_AKT.4, L90.4
             5.  Ангарский НПЗ (Л-35-11/1000)         -  GR_AKT.5, L90.5
             6.  КИНЕФ (ЛЧ-35-11/1000)                -  GR_AKT.6, L90.6
             7.  КИНЕФ (ЛЧ-35-11/600)                 -  GR_AKT.7, L90.7
             8.  КИНЕФ (Л-35-11/600)                  -  GR_AKT.8, L90.8
             9.  КИНЕФ (ЛГ-35-8/300Б)                 -  GR_AKT.9, L90.9
             10. Салаватнефтеоргсинтез (Л-35-11/1000) -  GR_AKT.10, L90.10
             11. Уфимский НПЗ (Л-35-11/300)           -  GR_AKT.11, L90.11
           }

 begin
    F:=Ust-1;
    repeat
    Dialog:=MakeDialog;
    Dialog^.HelpCTX:=$F000;
    Dialog^.SetData(F);
    Control:=DeskTop^.ExecView(Dialog);


    if Control<>cmCancel then
       begin
            Dialog^.GetData(F);
            Ust:=F+1;
       end;
    until Control<>cmCancel;

  end;




















procedure tmyapp.handleevent(var event:tevent);
procedure ExecProgram(Prg,com:String);
begin
  DoneSysError;
  DoneEvents;
  DoneVideo;
  DoneMemory;
  SetMemTop(HeapPtr);
  SwapVectors;
  Exec(Prg,com);
  SwapVectors;
  SetMemTop(HeapEnd);
  InitMemory;
  InitVideo;
  InitEvents;
  InitSysError;
  TextAttr:=7;
  ClrScr;
  Redraw;
end;
(*
   procedure txt1;
   begin
   execprogram('speak.exe','информацияопрограме');
    execprogram('rek.exe','rek');
    end;      *)

 procedure  was1;
          begin
               {execprogram('videorus.exe','');}
               execprogram('speak.exe','процес изомеризации');
               execprogram('loadpic.exe','izomer.scr');
               execprogram('obana.exe','1-pusk');
               execprogram('001.exe','001.res');
          end;

    procedure  was2;
             begin
                  execprogram('speak.exe','Процес селективногогидрокрекинга');
                  execprogram('pec.exe','a--1');
                  execprogram('obana.exe','2-pusk');
                  execprogram('001.exe','001.res');
             end;
     procedure was22;
              begin
                   execprogram('opa.exe','2-pusk');
                   execprogram('001.exe','001.res');
              end;
      procedure was3;
               begin
                    execprogram('speak.exe','процес изоселектоформинга');
                    execprogram('loadpic.exe','izoselec.scr');
                    execprogram('pec.exe','b--1');
                    execprogram('obana.exe','3-pusk');
                    execprogram('001.exe','001.res');
            end;

 (*     procedure pic1;
               begin
                    execprogram('speak.exe','обобщенаясхемапревращения');
                    execprogram('loadpic.exe','2001.scr');
               end;   *)

      procedure was5;
               begin
                    execprogram('pro33.exe','');
                    execprogram('xxx.exe','xxx.rez');
               end;

 procedure was4;

        var ddd:searchrec;
            Chislo1,Chislo2,Chislo3,Chislo4,
            Ok1,Ok2,Ok3,Ok4:extended;
            f,ff:text;
            gop:string;

         begin

{  execprogram('loadpic.exe','rif.scr');}
  dan:=GetFileName;

  gopa(dan,Puti,Nazvanie);


  assign(f,Puti+'\'+Nazvanie+'.sk');

  {$I-}
  reset(f);
  {$I+}

  if IOResult=0 then
    begin
       assign(ff,'sirkat');rewrite(ff);
       while not(eof(f)) do
       begin
            readln(f,strok);
            writeln(ff,strok);
       end;
       close(ff);
       close(f);

    end

    else
    begin
         okno_no_file_sk;
         DAN:='';
    end;







           if dan<>'' then
               begin
                     findfirst('rez',AnyFile,Ddd);
                     if DosError=0 then begin
                     assign(f,'rez');erase(f); end;


  assign(f,Puti+'\'+Nazvanie+'.dan');reset(f);
  readln(f,www1);readln(f,www2);
  readln(f,par1,par2,par3,par4);          { P202,P203,P204,P205        }
  readln(f,par5);                         {  VLvsg                     }
  readln(f,par6,par7,par8,par9);          { T202,T203,T204,T205        }
  readln(f,par10,par11,par12,par13);      { dT202,dT203,dT204,dT205    }
  readln(f,par14,par15,par16,par17
        ,par18,par19,par20,par21,par22);  { C1,C2,C3,C4,C5,C6,C7,C8,C9 }
  readln(f,par23);                        { Rvsg                       }
  readln(f,par24);                        { Dney                       }
  readln(f,par25);                        { Sera                       }
  readln(f,par26);                        { Rs                         }
  readln(f,par27);                        { DataOtbora                 }
  readln(f,par28);                        { DataRegeneration           }
  close(f);

  d_okno;


  assign(f,Puti+'\'+'bak');rewrite(f);
  assign(ff,Puti+'\'+Nazvanie+'.dan');reset(ff);
  while not(eof(ff)) do
  begin readln(ff,strok); writeln(f,strok);end;
  close(ff);
  close(f);

  assign(f,Puti+'\'+Nazvanie+'.dan');rewrite(f);
  writeln(f,www1);writeln(f,www2);
  writeln(f,par1,par2,par3,par4);          { P202,P203,P204,P205        }
  writeln(f,par5);                         {  VLvsg                     }
  writeln(f,par6,par7,par8,par9);          { T202,T203,T204,T205        }
  writeln(f,par10,par11,par12,par13);      { dT202,dT203,dT204,dT205    }
  writeln(f,par14,par15,par16,par17
        ,par18,par19,par20,par21,par22);  { C1,C2,C3,C4,C5,C6,C7,C8,C9 }
  writeln(f,par23);                        { Rvsg                       }
  writeln(f,par24);                        { Dney                       }
  writeln(f,par25);                        { Sera                       }
  writeln(f,par26);                        { Rs                         }
  writeln(f,par27);                        { DataOtbora                 }
  writeln(f,par28);                        { DataRegeneration           }
  close(f);


                  repeat
                    swapvectors;
                    exec('ss99.exe',dan);
                    swapvectors;

{                     execprogram('ss99.exe',dan);}

                if Ust=9 then
                  begin
                     assign(f,'rez');reset(f);
                     assign(ff,'rezz');rewrite(ff);
                     for i:=1 to 23 do
                       begin
                         readln(f,gop);
                         writeln(ff,gop);
                       end;
                         writeln(ff);
                         writeln(ff);
                     for i:=1 to 37 do
                       begin
                         readln(f,gop);
                         writeln(ff,gop);
                       end;
                         writeln(ff);
                         writeln(ff);
                     for i:=1 to 5 do
                       begin
                         readln(f,gop);
                         writeln(ff,gop);
                       end;
                     close(f);close(ff);
                      erase(f);
                      rename(ff,'rez');
                  end;


                if Ust=12 then
                  begin
                     assign(f,'rez');reset(f);
                     assign(ff,'rezz');rewrite(ff);
                     for i:=1 to 23 do
                       begin
                         readln(f,gop);
                         writeln(ff,gop);
                       end;
                         writeln(ff);
                         writeln(ff);
                     for i:=1 to 37 do
                       begin
                         readln(f,gop);
                         writeln(ff,gop);
                       end;
                         writeln(ff);
                         writeln(ff);
                     for i:=1 to 5 do
                       begin
                         readln(f,gop);
                         writeln(ff,gop);
                       end;
                     close(f);close(ff);
                      erase(f);
                      rename(ff,'rez');
                  end;


                     gopa(dan,Puti,Nazvanie);
                     findfirst('rez',AnyFile,Ddd);
                     if DosError<>0 then exit;
                     execprogram('rez.exe','rez');

                     assign(f,Puti+'\'+Nazvanie+'.dan');
                     reset(f);
                     readln(f,Chislo1,Chislo2,Chislo3);
                     readln(f,Chislo4);
                     dt.param[1]:=Chislo1;
                     dt.param[2]:=Chislo2;
                     dt.param[3]:=Chislo3;
                     dt.param[4]:=Chislo4;
                     Ok1:=dt.param[1];
                     Ok2:=dt.param[2];
                     Ok3:=dt.param[3];
                     Ok4:=dt.param[4];
                     close(f);

                     assign(f,'rez');
                     reset(f);
                     for i:=1 to 25 do readln(f);
                     readln(f,s1,Cr,Ce);

                    { for i:=1 to 43 do readln(f);
                     readln(f,eee1,CL1,CL2,CL3);}

                     close(f);

                     okno1;

                     okno2;


                     assign(ff,'d');
                     rewrite(ff);
                     str(dt.param[1]:5:2,simbol);
                     write(ff,simbol);
                     str(dt.param[2]:5:2,simbol);
                     write(ff,simbol);
                     str(dt.param[3]:5:2,simbol);
                     ss:='                                               ';
                     writeln(ff,simbol,ss,' Подача дихлорэтана по реакторам (Р-202, Р-203, Р-204), ррм.');
                     str(dt.param[4]:5:2,simbol);
                     writeln(ff,simbol,ss,'           Активность катализатора (условная еденица)');

                     assign(f,Puti+'\'+Nazvanie+'.dan');
                     reset(f);
                     readln(f);readln(f);
                     while not eof(f) do
                     begin
                          readln(f,strok);
                          writeln(ff,strok);
                     end;
                     close(f);
                     close(ff);

                     erase(f);
                     rename(ff,Puti+'\'+Nazvanie+'.dan');

                 (*      assign(fi,'rez.rez');
                       assign(f,'rez');
                       reset(f);
                       rewrite(fi);
                       while (eof(f)=false) do
                                  begin
                                       readln(f,sss);
                                       writeln(fi,sss);
                                  end;
                       close(f);
                       close(fi);

                       assign(fi,'rez.rez');
                       reset(fi);
                       for i:=1 to 75 do readln(fi,stroka[i]);
                       close(fi);

                       assign(fi,'rez.rez');
                       reset(fi);
                       for i:=1 to 1 do readln(fi);
                       readln(fi,s2);
                       close(fi);
                       erase(fi);

                       assign(fi,'rez.rez');
                       rewrite(fi);
                       for i:=1 to 1 do writeln(fi,stroka[i]);
                       str(dt.param[1]:5:2,simbol);
                       writeln(fi,s2,simbol);
                       for i:=3 to 75 do writeln(fi,stroka[i]);
                       close(fi);

                       assign(fi,'rez');
                       erase(fi);

                       assign(fi,'rez.rez');
                       rename(fi,'rez');   *)



                  until (dt.param[1]=Ok1) and (dt.param[2]=Ok2)
                        and (dt.param[3]=Ok3) and  (dt.param[4]=Ok4);

                assign(f,'rez');reset(f);
                readln(f);readln(f);
                readln(f,ww1,AktKat);
                for i:=1 to 5 do readln(f);
                readln(f,ww3,KrekKat);
                for i:=1 to 56 do readln(f);
                readln(f,ww2,KoksKat);
                close(f);
                dan_gr(dan,Nazvanie,cnl);
               end

               else exit;

  assign(f,Puti+'\'+Nazvanie+'.dan');reset(f);
  readln(f,www1);readln(f,www2);
  close(f);

  assign(f,Puti+'\'+Nazvanie+'.dan');
  erase(f);

  assign(f,Puti+'\'+'bak');reset(f);
  assign(ff,Puti+'\'+'bak1');rewrite(ff);
  readln(f);readln(f);
  writeln(ff,www1);writeln(ff,www2);
  while not(eof(f)) do
   begin
        readln(f,strok);
        writeln(ff,strok);
   end;
  close(ff);close(f);

  assign(f,Puti+'\'+'bak');
  erase(f);

  assign(f,Puti+'\'+'bak1');
  rename(f,Puti+'\'+'bak');

  assign(f,Puti+'\'+'bak');
  rename(f,Puti+'\'+Nazvanie+'.dan');

  assign(f,Puti+'\'+Nazvanie+'.dan');reset(f);
  for i:=1 to 5 do readln(f);
  readln(f,PPP10);
  close(f);

  assign(f,'rez');reset(f);
  readln(f);readln(f);
  readln(f,ee1,PP1);

  readln(f);readln(f);readln(f);readln(f);
  readln(f,eeeee1,PPP1);
  readln(f,ee2,PP2);

  for i:=1 to 16 do readln(f);
  readln(f,eeeee2,PPP2);
  for i:=1 to 42 do readln(f);
  readln(f,eeeee34,PPP3,PPP4,eeeee5,PPP5);

  close(f);

  findfirst(Puti+'\'+Nazvanie+'.rez',anyfile, ddd);
  if doserror=0 then  begin assign(f,Puti+'\'+Nazvanie+'.rez');erase(f); end;
  assign(f,'rez');
  rename(f,Puti+'\'+Nazvanie+'.rez');


  if PP1<0.8 then  okno_rec3
             else
             if PP2<2.5 then okno_rec1
                        else okno_rec2;

   okno_rec;
{   okno_rec1;
   okno_rec2;
   okno_rec3;}


 end;





       procedure was8;
                begin
                     execprogram('ss99.exe','l90');
                     execprogram('rez.exe','rez');
                end;

  procedure was7;
           begin
                execprogram('kika.exe','');
           end;

      procedure was6;
               begin
                    execprogram('speak.exe','процесселектоформинга');
                    execprogram('loadpic.exe','2000.scr');
                    was8;
                    was5;
                    was22;
                    execprogram('kika.exe','');
              end;
      begin
        tapplication.handleevent(event);
     if event.what=evcommand then
         begin
            case event.command of
        cmexecwas1:was1;
        cmexecwas2:was2;
        cmexecwas3:was3;
   (*     cmexecpic1:pic1;*)
        cmexecwas4:was4;
        cmexecwas5:was5;
        cmexecwas6:was6;
    (*    cmexectxt1:txt1;*)

        cmgr_akt:
                begin
                     Interval;
                     gr_Akt;
                     Table_Akt;
                     RedRaw;
                     MenuLevel:=2;
                end;

        cmgr_koks:
                begin
                     Interval;
                     gr_koks;
                     Table_koks;
                     RedRaw;
                     MenuLevel:=2;
                end;



        cmgr_krek:
                begin
                     Interval;
                     gr_krek;
                     Table_krek;
                     RedRaw;
                     MenuLevel:=2;
                end;

        cm_dan_tex:
               begin
                    d_okno_Tex;


                    dan_tex:=SaveFileName_Tex;

if dan_Tex<>'' then
begin
                    assign(f,dan_tex);
                    rewrite(f);
  write(f,'0.00 0.00 0.00 ','                                                Подача');
                    writeln(f,' дихлорэтана по реакторам (Р-202, Р-203, Р-204), ррм.');
  writeln(f,' 0.00','                                                          Активность катализатора (условная еденица)');
  write(f,par1:5:2,' ',par2:5:2,' ',par3:5:2,' ',par4:5:2,'                                        Давление по');
                    writeln(f,'реакторам (Р-202, Р-203, Р-204, Р-205), атм.');
  writeln(f,par5:5:2,'                                                          Влажность ВСГ, %');
  write(f,par6:5:1,' ',par7:5:1,' ',par8:5:1,' ',par9:5:1,'                                        Температура входная ');
                    writeln(f,'по реакторам (Р-202, Р-203, Р-204, Р-205), град. С');
  write(f,par10:4:1,' ',par11:4:1,' ',par12:4:1,' ',par13:4:1,'                                            Перепады');
                    writeln(f,' температур по реакторам (Р-202, Р-203, Р-204, Р-205), град. С');
  writeln(f,par14:5:2,' ',par15:5:2,' ',par16:5:2,' ',par17:5:2,' ',par18:5:2,' ',par19:5:2,
          ' ',par20:5:2,' ',par21:5:2,' ',par22:5:2,'          Состав ВСГ (H2, C1, C2, C3, n-C4, i-C4, n-C5, i-C5, C6), %');
  writeln(f,par23:10:2,'                                                     Расход ВСГ, м3/час');
  writeln(f,par24:7:1,'                                                        Дней после регенерации');
  writeln(f,par25:5:2,'                                                          Сера в гидрогенизате');
  writeln(f,par26:8:2,'                                                       Расход сырья, м3/час');
  writeln(f,par27,'                                                       Дата отбора');
  writeln(f,par28,'                                                       Дата регенерации катализатора');


  close(f);
end;
               end;


        cm_dan_sk:
               begin
                    for i:=1 to 69 do Dan_Sir[i]:=0.000;
                   { repeat}
                    d_okno_Sir;
                   { Summa:=0;
                    for i:=1 to 69 do Summa:=Summa+Dan_Sir[i];
                    str(Summa:6:3,Summ);
                    if Summa<>100 then okno_Summa;
                    until Summa=100;                          }

                    for i:=1 to 69 do Dan_Kat[i]:=0.000;
                   { repeat}
                    d_okno_Kat;
                  {  Summa:=0;
                    for i:=1 to 69 do Summa:=Summa+Dan_Kat[i];
                    str(Summa:6:3,Summ);
                    if Summa<>100 then okno_Summa;
                    until Summa=100;}


                    dan_sk:=SaveFileName_Sk;
if dan_Sk<>'' then
begin
                    assign(f,dan_Sk);
                    rewrite(f);
writeln(f,' 1   этан        ',Dan_Sir[1]:6:3);
writeln(f,' 2   пpопан      ',Dan_Sir[2]:6:3);
writeln(f,' 3   и-бутан     ',Dan_Sir[3]:6:3);
writeln(f,' 4   н-бутан     ',Dan_Sir[4]:6:3);
writeln(f,' 5   и-пентан    ',Dan_Sir[5]:6:3);
writeln(f,' 6   н-пентан    ',Dan_Sir[6]:6:3);
writeln(f,' 7   2,2-дмб     ',Dan_Sir[7]:6:3);
writeln(f,' 8   ц-пентан    ',Dan_Sir[8]:6:3);
writeln(f,' 9   2,3-дмб     ',Dan_Sir[9]:6:3);
writeln(f,'10   2-мп        ',Dan_Sir[10]:6:3);
writeln(f,'11   3-мп        ',Dan_Sir[11]:6:3);
writeln(f,'12   н-гексан    ',Dan_Sir[12]:6:3);
writeln(f,'13   мцп         ',Dan_Sir[13]:6:3);
writeln(f,'14   2,2-дмп     ',Dan_Sir[14]:6:3);
writeln(f,'15   2,4-дмп     ',Dan_Sir[15]:6:3);
writeln(f,'16   бензол      ',Dan_Sir[16]:6:3);
writeln(f,'17   2,2,3-тмп   ',Dan_Sir[17]:6:3);
writeln(f,'18   3,3-дмп     ',Dan_Sir[18]:6:3);
writeln(f,'19   цгексан     ',Dan_Sir[19]:6:3);
writeln(f,'20   2-мг        ',Dan_Sir[20]:6:3);
writeln(f,'21   2,3-дмп     ',Dan_Sir[21]:6:3);
writeln(f,'22   3-мг        ',Dan_Sir[22]:6:3);
writeln(f,'23   1,3-дмцп(ц) ',Dan_Sir[23]:6:3);
writeln(f,'24   1,3-дмцп(т) ',Dan_Sir[24]:6:3);
writeln(f,'25   1,2-дмцп(т) ',Dan_Sir[25]:6:3);
writeln(f,'26   н-гептан    ',Dan_Sir[26]:6:3);
writeln(f,'27   1,2-дмцп    ',Dan_Sir[27]:6:3);
writeln(f,'28   2,3-дмг     ',Dan_Sir[28]:6:3);
writeln(f,'29   1,1,3-тмцп  ',Dan_Sir[29]:6:3);
writeln(f,'30   мцг         ',Dan_Sir[30]:6:3);
writeln(f,'31   2,5-дмг     ',Dan_Sir[31]:6:3);
writeln(f,'32   2,4-дмг     ',Dan_Sir[32]:6:3);
writeln(f,'33   эцп         ',Dan_Sir[33]:6:3);
writeln(f,'34   2,2,3-тмп   ',Dan_Sir[34]:6:3);
writeln(f,'35   1,2,4-тмцп  ',Dan_Sir[35]:6:3);
writeln(f,'36   3,3-дмг     ',Dan_Sir[36]:6:3);
writeln(f,'37   толуол      ',Dan_Sir[37]:6:3);
writeln(f,'38   1,2,3-тмцп  ',Dan_Sir[38]:6:3);
writeln(f,'39   2,3,4-тмп   ',Dan_Sir[39]:6:3);
writeln(f,'40   2,3-дмг     ',Dan_Sir[40]:6:3);
writeln(f,'41   2-м,3-эп    ',Dan_Sir[41]:6:3);
writeln(f,'42   1,1,2-тмцп  ',Dan_Sir[42]:6:3);
writeln(f,'43   2-мгп       ',Dan_Sir[43]:6:3);
writeln(f,'44   4-мгп       ',Dan_Sir[44]:6:3);
writeln(f,'45   3,4-дмг     ',Dan_Sir[45]:6:3);
writeln(f,'46   3-мгп       ',Dan_Sir[46]:6:3);
writeln(f,'47   нафт.до с8  ',Dan_Sir[47]:6:3);
writeln(f,'48   н-октан     ',Dan_Sir[48]:6:3);
writeln(f,'49   1,2-дмцг(т) ',Dan_Sir[49]:6:3);
writeln(f,'50   1,3-дмцг(т) ',Dan_Sir[50]:6:3);
writeln(f,'51   2,3,5-тмг   ',Dan_Sir[51]:6:3);
writeln(f,'52   2,2-дмгп    ',Dan_Sir[52]:6:3);
writeln(f,'53   2,4-дмгп    ',Dan_Sir[53]:6:3);
writeln(f,'54   2,2,3-тмг   ',Dan_Sir[54]:6:3);
writeln(f,'55   2-М,4-эг    ',Dan_Sir[55]:6:3);
writeln(f,'56   2,6-дмгп    ',Dan_Sir[56]:6:3);
writeln(f,'57   2,5-дмгп    ',Dan_Sir[57]:6:3);
writeln(f,'58   3,3-дмгп    ',Dan_Sir[58]:6:3);
writeln(f,'59   эцг+эбенз   ',Dan_Sir[59]:6:3);
writeln(f,'60   тмцп        ',Dan_Sir[60]:6:3);
writeln(f,'61   2,3,4-тмг   ',Dan_Sir[61]:6:3);
writeln(f,'62   п-ксилол    ',Dan_Sir[62]:6:3);
writeln(f,'63   м-ксилол    ',Dan_Sir[63]:6:3);
writeln(f,'64   и-с9        ',Dan_Sir[64]:6:3);
writeln(f,'65   о-ксилол    ',Dan_Sir[65]:6:3);
writeln(f,'66   нафт. до с9 ',Dan_Sir[66]:6:3);
writeln(f,'67   н-нонан     ',Dan_Sir[67]:6:3);
writeln(f,'68   с9+         ',Dan_Sir[68]:6:3);
writeln(f,'69   в т.ч. Аp   ',Dan_Sir[69]:6:3);
writeln(f,' 1   этан        ',Dan_Kat[1]:6:3);
writeln(f,' 2   пpопан      ',Dan_Kat[2]:6:3);
writeln(f,' 3   и-бутан     ',Dan_Kat[3]:6:3);
writeln(f,' 4   н-бутан     ',Dan_Kat[4]:6:3);
writeln(f,' 5   и-пентан    ',Dan_Kat[5]:6:3);
writeln(f,' 6   н-пентан    ',Dan_Kat[6]:6:3);
writeln(f,' 7   2,2-дмб     ',Dan_Kat[7]:6:3);
writeln(f,' 8   ц-пентан    ',Dan_Kat[8]:6:3);
writeln(f,' 9   2,3-дмб     ',Dan_Kat[9]:6:3);
writeln(f,'10   2-мп        ',Dan_Kat[10]:6:3);
writeln(f,'11   3-мп        ',Dan_Kat[11]:6:3);
writeln(f,'12   н-гексан    ',Dan_Kat[12]:6:3);
writeln(f,'13   мцп         ',Dan_Kat[13]:6:3);
writeln(f,'14   2,2-дмп     ',Dan_Kat[14]:6:3);
writeln(f,'15   2,4-дмп     ',Dan_Kat[15]:6:3);
writeln(f,'16   бензол      ',Dan_Kat[16]:6:3);
writeln(f,'17   2,2,3-тмп   ',Dan_Kat[17]:6:3);
writeln(f,'18   3,3-дмп     ',Dan_Kat[18]:6:3);
writeln(f,'19   цгексан     ',Dan_Kat[19]:6:3);
writeln(f,'20   2-мг        ',Dan_Kat[20]:6:3);
writeln(f,'21   2,3-дмп     ',Dan_Kat[21]:6:3);
writeln(f,'22   3-мг        ',Dan_Kat[22]:6:3);
writeln(f,'23   1,3-дмцп(ц) ',Dan_Kat[23]:6:3);
writeln(f,'24   1,3-дмцп(т) ',Dan_Kat[24]:6:3);
writeln(f,'25   1,2-дмцп(т) ',Dan_Kat[25]:6:3);
writeln(f,'26   н-гептан    ',Dan_Kat[26]:6:3);
writeln(f,'27   1,2-дмцп    ',Dan_Kat[27]:6:3);
writeln(f,'28   2,3-дмг     ',Dan_Kat[28]:6:3);
writeln(f,'29   1,1,3-тмцп  ',Dan_Kat[29]:6:3);
writeln(f,'30   мцг         ',Dan_Kat[30]:6:3);
writeln(f,'31   2,5-дмг     ',Dan_Kat[31]:6:3);
writeln(f,'32   2,4-дмг     ',Dan_Kat[32]:6:3);
writeln(f,'33   эцп         ',Dan_Kat[33]:6:3);
writeln(f,'34   2,2,3-тмп   ',Dan_Kat[34]:6:3);
writeln(f,'35   1,2,4-тмцп  ',Dan_Kat[35]:6:3);
writeln(f,'36   3,3-дмг     ',Dan_Kat[36]:6:3);
writeln(f,'37   толуол      ',Dan_Kat[37]:6:3);
writeln(f,'38   1,2,3-тмцп  ',Dan_Kat[38]:6:3);
writeln(f,'39   2,3,4-тмп   ',Dan_Kat[39]:6:3);
writeln(f,'40   2,3-дмг     ',Dan_Kat[40]:6:3);
writeln(f,'41   2-м,3-эп    ',Dan_Kat[41]:6:3);
writeln(f,'42   1,1,2-тмцп  ',Dan_Kat[42]:6:3);
writeln(f,'43   2-мгп       ',Dan_Kat[43]:6:3);
writeln(f,'44   4-мгп       ',Dan_Kat[44]:6:3);
writeln(f,'45   3,4-дмг     ',Dan_Kat[45]:6:3);
writeln(f,'46   3-мгп       ',Dan_Kat[46]:6:3);
writeln(f,'47   нафт.до с8  ',Dan_Kat[47]:6:3);
writeln(f,'48   н-октан     ',Dan_Kat[48]:6:3);
writeln(f,'49   1,2-дмцг(т) ',Dan_Kat[49]:6:3);
writeln(f,'50   1,3-дмцг(т) ',Dan_Kat[50]:6:3);
writeln(f,'51   2,3,5-тмг   ',Dan_Kat[51]:6:3);
writeln(f,'52   2,2-дмгп    ',Dan_Kat[52]:6:3);
writeln(f,'53   2,4-дмгп    ',Dan_Kat[53]:6:3);
writeln(f,'54   2,2,3-тмг   ',Dan_Kat[54]:6:3);
writeln(f,'55   2-М,4-эг    ',Dan_Kat[55]:6:3);
writeln(f,'56   2,6-дмгп    ',Dan_Kat[56]:6:3);
writeln(f,'57   2,5-дмгп    ',Dan_Kat[57]:6:3);
writeln(f,'58   3,3-дмгп    ',Dan_Kat[58]:6:3);
writeln(f,'59   эцг+эбенз   ',Dan_Kat[59]:6:3);
writeln(f,'60   тмцп        ',Dan_Kat[60]:6:3);
writeln(f,'61   2,3,4-тмг   ',Dan_Kat[61]:6:3);
writeln(f,'62   п-ксилол    ',Dan_Kat[62]:6:3);
writeln(f,'63   м-ксилол    ',Dan_Kat[63]:6:3);
writeln(f,'64   и-с9        ',Dan_Kat[64]:6:3);
writeln(f,'65   о-ксилол    ',Dan_Kat[65]:6:3);
writeln(f,'66   нафт. до с9 ',Dan_Kat[66]:6:3);
writeln(f,'67   н-нонан     ',Dan_Kat[67]:6:3);
writeln(f,'68   с9+         ',Dan_Kat[68]:6:3);
writeln(f,'69   в т.ч. Аp   ',Dan_Kat[69]:6:3);
close(f);
end;
               end;



            else exit;
          end;
      clearevent(event);
       end;
        end;

{   procedure about;
     var
  D: PDialog;
  Control: PView;
  R: TRect;
begin
  R.Assign(0, 0, 40, 13);
  D := New(PDialog, Init(R, 'About'));
  with D^ do
  begin
    Options := Options or ofCentered;

    R.Grow(-1, -1);
    Dec(R.B.Y, 3);
    Insert(New(PStaticText, Init(R,
      #13 +
      ^C'Расчет комплексной '#13 +
      #13 +
      ^C'переработки '#13 +
      #13 +
      ^C'бензиновой фракции'+
      #13#13 +^C'версия 2.0 от 1997')));

    R.Assign(15, 10, 25, 12);
    Insert(New(PButton, Init(R, 'O~K', cmOk, bfDefault)));
  end;
  Desktop^.ExecView(D);
  Dispose(D, Done);
end; }
(*procedure asd1;
     var
  D: PDialog;
  Control: PView;
  R: TRect;
begin
  R.Assign(0, 0, 50, 14);
  D := New(PDialog, Init(R, 'About'));
  with D^ do
  begin
    Options := Options or ofCentered;

    R.Grow(-1, -1);
    Dec(R.B.Y, 4);
    Insert(New(PStaticText, Init(R,
      #13 +
      ^C'ТОМСКИЙ ПОЛИТЕХНИЧЕСКИЙ УНИВЕРСИТЕТ '#13 +
    {  #13 + }
      ^C'ХИМИКО-ТЕХНОЛОГИЧЕСКИЙ ФАКУЛЬТЕТ '#13 +
     { #13 +}
      ^C'КАФЕДРА ХИМИЧЕСКОЙ ТЕХНОЛОГИИ ТОПЛИВА'+
      #13{#13} +^C'********************************************'#13+{)));}
     '                         РОССИЯ  '#13)));

    R.Assign(1, 7, 49, 13);
    Insert(New(PStaticText, Init(R,
  +  '                         634004, г.Томск-4,  ' +#13+
  +  '                         пр.Ленина, 30, ТПУ,  ' + #13 +
     '                         тел. (382-2) 492-443  ')));

    R.Assign(19, 11, 27, 13);
    Insert(New(PButton, Init(R, 'O~K', cmOk, bfDefault)));
       end;
  Desktop^.ExecView(D);
  Dispose(D, Done);
end;     *)


constructor TMyApp.Init;
begin
     TApplication.Init;
     FName:=NewStr('*.*');
    (* asd1;*)
    { about;}
     Ust:=1;

  ViborUst;



           { 1.  Ачинский НПЗ (ЛК-6У)                 -  GR_AKT.1, L90.1
             2.  MAZEIKIU NAFTA (LK-6U Nr.1 S-200)    -  GR_AKT.2, L90.2
             3.  MAZEIKIU NAFTA (LK-6U Nr.2 S-200)    -  GR_AKT.3, L90.3
             4.  Омский НПЗ (Л-35-11/1000)            -  GR_AKT.4, L90.4
             5.  Ангарский НПЗ (Л-35-11/1000)         -  GR_AKT.5, L90.5
             6.  КИНЕФ (ЛЧ-35-11/1000)                -  GR_AKT.6, L90.6
             7.  КИНЕФ (ЛЧ-35-11/600)                 -  GR_AKT.7, L90.7
             8.  КИНЕФ (Л-35-11/600)                  -  GR_AKT.8, L90.8
             9.  КИНЕФ (ЛГ-35-8/300Б)                 -  GR_AKT.9, L90.9
             10. Салаватнефтеоргсинтез (Л-35-11/1000) -  GR_AKT.10, L90.10
             11. Уфимский НПЗ (Л-35-11/300)           -  GR_AKT.11, L90.11
             12.
             13.

           }



str(Ust,NUst);

If Ust=1 then
    begin
         SUst:='Ачинский НПЗ (ЛК-6У)';
         assign(f,'l90');rewrite(f);
         assign(ff,'l90.1');reset(ff);

         while not(eof(ff)) do
            begin
                 readln(ff,ffs);
                 writeln(f,ffs);
            end;
         close(f); close(ff);
    end;


If Ust=2 then
    begin
         SUst:='MAZEIKIU NAFTA (LK-6U Nr.1 S-200)';
         assign(f,'L90'); rewrite(f);
         assign(ff,'l90.2');reset(ff);
         while not(eof(ff)) do
            begin
                 readln(ff,ffs);
                 writeln(f,ffs);
            end;
         close(f); close(ff);
    end;


If Ust=3 then
    begin
         SUst:='MAZEIKIU NAFTA (LK-6U Nr.2 S-200)';
         assign(f,'L90'); rewrite(f);
         assign(ff,'l90.3');reset(ff);
         while not(eof(ff)) do
            begin
                 readln(ff,ffs);
                 writeln(f,ffs);
            end;
         close(f); close(ff);
    end;


If Ust=4 then
    begin
         SUst:='Омский НПЗ (Л-35-11/1000)';
         assign(f,'L90'); rewrite(f);
         assign(ff,'l90.4');reset(ff);
         while not(eof(ff)) do
            begin
                 readln(ff,ffs);
                 writeln(f,ffs);
            end;
         close(f); close(ff);
    end;


If Ust=5 then
    begin
         SUst:='Ангарский НПЗ (Л-35-11/1000)';
         assign(f,'L90'); rewrite(f);
         assign(ff,'l90.5');reset(ff);
         while not(eof(ff)) do
            begin
                 readln(ff,ffs);
                 writeln(f,ffs);
            end;
         close(f); close(ff);
    end;


If Ust=6 then
    begin
         SUst:='КИНЕФ (ЛЧ-35-11/1000)';
         assign(f,'L90'); rewrite(f);
         assign(ff,'l90.6');reset(ff);
         while not(eof(ff)) do
            begin
                 readln(ff,ffs);
                 writeln(f,ffs);
            end;
         close(f); close(ff);
    end;


If Ust=7 then
    begin
         SUst:='КИНЕФ (ЛЧ-35-11/600)';
         assign(f,'L90'); rewrite(f);
         assign(ff,'l90.7');reset(ff);
         while not(eof(ff)) do
            begin
                 readln(ff,ffs);
                 writeln(f,ffs);
            end;
         close(f); close(ff);
    end;


If Ust=8 then
    begin
         SUst:='КИНЕФ (Л-35-11/600)';
         assign(f,'L90'); rewrite(f);
         assign(ff,'l90.8');reset(ff);
         while not(eof(ff)) do
            begin
                 readln(ff,ffs);
                 writeln(f,ffs);
            end;
         close(f); close(ff);
    end;


If Ust=9 then
    begin
         SUst:='КИНЕФ (ЛГ-35-8/300Б)';
         assign(f,'L90'); rewrite(f);
         assign(ff,'l90.9');reset(ff);
         while not(eof(ff)) do
            begin
                 readln(ff,ffs);
                 writeln(f,ffs);
            end;
         close(f); close(ff);
    end;


If Ust=10 then
    begin
         SUst:='Салаватнефтеоргсинтез (Л-35-11/1000)';
         assign(f,'L90'); rewrite(f);
         assign(ff,'l90.10');reset(ff);
         while not(eof(ff)) do
            begin
                 readln(ff,ffs);
                 writeln(f,ffs);
            end;
         close(f); close(ff);
    end;


If Ust=11 then
    begin
         SUst:='Уфимский НПЗ (Л-35-11/300)';
         assign(f,'L90'); rewrite(f);
         assign(ff,'l90.11');reset(ff);
         while not(eof(ff)) do
            begin
                 readln(ff,ffs);
                 writeln(f,ffs);
            end;
         close(f); close(ff);
    end;


If Ust=12 then
    begin
         SUst:='РНПЗ (Л-35-11/300)';
         assign(f,'L90'); rewrite(f);
         assign(ff,'l90.12');reset(ff);
         while not(eof(ff)) do
            begin
                 readln(ff,ffs);
                 writeln(f,ffs);
            end;
         close(f); close(ff);
    end;


If Ust=13 then
    begin
         SUst:='РНПЗ (Л-35-11/300)';
         assign(f,'L90'); rewrite(f);
         assign(ff,'l90.13');reset(ff);
         while not(eof(ff)) do
            begin
                 readln(ff,ffs);
                 writeln(f,ffs);
            end;
         close(f); close(ff);
    end;


end;

var
   myapp:^tmyapp;

begin
     new(Myapp);
     myapp^.init;
     myapp^.run;
     myapp^.done;
     dispose(Myapp)
end.
