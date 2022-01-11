unit basres1;

interface
  var
      SirPar,KatPar0,KatPar,BpPar,PentPar:array [3..13] of double;
      SirIpar,KatIpar0,KatIpar,BpIpar,PentIpar:array [3..13] of double;
      SirNaf5,KatNaf50,KatNaf5,BpNaf5,PentNaf5:array [3..13] of double;
      SirNaf6,KatNaf60,KatNaf6,BpNaf6,PentNaf6:array [3..13] of double;
      SirArom,KatArom0,KatArom,BpArom,PentArom:array [3..13] of double;

      StrPar,StrIpar,StrNaf5,StrNaf6,StrArom:array [3..13] of string[6];
      StprPar,StprIpar,StprNaf5,StprNaf6,StprArom:string[6];

      StrPar1,StrIpar1,StrNaf51,StrNaf61,StrArom1:array [3..13] of string[6];
      StprPar1,StprIpar1,StprNaf51,StprNaf61,StprArom1:string[6];

      SPar,SIpar,SNaf5,SNaf6,SArom:double;
      KPar,KIpar,KNaf5,KNaf6,KArom:double;
      KPar0,KIpar0,KNaf50,KNaf60,KArom0:double;
      BPar,BIpar,BNaf5,BNaf6,BArom:double;
      PPar,PIpar,PNaf5,PNaf6,PArom:double;

      StPar,StIpar,StNaf5,StNaf6,StArom:array[3..13] of double;
      StpPar,StpIpar,StpNaf5,StpNaf6,StpArom:double;

      StPar1,StIpar1,StNaf51,StNaf61,StArom1:array[3..13] of double;
      StpPar1,StpIpar1,StpNaf51,StpNaf61,StpArom1:double;

      re:text;
      f1:integer;

      ivan1:string [27];

      x1,x2:double; {  Ћв­®иҐ­Ёп 1 Ё 2       }
      x3:double;    { ‚« ¦­®бвм ‚‘ѓ          }
      x4:double;    {  Љ®­жҐ­ва жЁп H2 ў ‚‘ѓ }
      x5:double;    { ЋЄв ­®ў®Ґ зЁб«®        }
      w:double;     { ‚ле®¤                  }

      Gvsg,Gbp,Gk1,G,Ps,Pk,Pbp:double;
      Gs:double;    { ђ бе®¤ бламп           }

      Tn1,Tn2,Tn3,Tn4,Tk1,Tk2,Tk3,Tk4,dT1,dT2,dT3,dT4:double;

{          Puti,Nazvanie:string;           }


   procedure rezult_o(Nazvanie:string);
   procedure rezult_par(Nazvanie:string);
   procedure rezult_ipar(Nazvanie:string);
   procedure rezult_naf5(Nazvanie:string);
   procedure rezult_naf6(Nazvanie:string);
   procedure rezult_arom(Nazvanie:string);


implementation

 procedure rezult_o(Nazvanie:string);
        begin
              assign(re,'rez\'+'basa.rez');
              rewrite(re);
              writeln(re);
              writeln(re,'       Распределение компонентов по числу атомов углерода (',Nazvanie,')');
              writeln(re);
              writeln(re,' г=====T=============T=============T=============T=============T=============¬');
              writeln(re,' ¦Число¦  н-Парафины ¦  и-Парафины ¦  Нафтены-5  ¦  Нафтены-6  ¦  Ароматика  ¦');
              writeln(re,' ¦ ато-¦======T======+======T======+======T======+======T======+======T======¦');
              writeln(re,' ¦ мов ¦ Сырье¦ Ката-¦ Сырье¦ Ката-¦ Сырье¦ Ката-¦ Сырье¦ Ката-¦ Сырье¦ Ката-¦');
              writeln(re,' ¦  С  ¦      ¦ лизат¦      ¦ лизат¦      ¦ лизат¦      ¦ лизат¦      ¦ лизат¦');
              writeln(re,' ¦=====+======+======+======+======+======+======+======+======+======+======¦');
              writeln(re,' ¦   3 ¦',SirPar[3]:6:3,'¦',KatPar[3]:6:3,'¦',SirIpar[3]:6:3,'¦',KatIpar[3]:6:3,'¦'
              ,SirNaf5[3]:6:3,'¦',KatNaf5[3]:6:3,'¦',SirNaf6[3]:6:3,'¦',KatNaf6[3]:6:3,'¦',SirArom[3]:6:3,'¦'
              ,KatArom[3]:6:3,'¦');
              writeln(re,' ¦   4 ¦',SirPar[4]:6:3,'¦',KatPar[4]:6:3,'¦',SirIpar[4]:6:3,'¦',KatIpar[4]:6:3,'¦'
              ,SirNaf5[4]:6:3,'¦',KatNaf5[4]:6:3,'¦',SirNaf6[4]:6:3,'¦',KatNaf6[4]:6:3,'¦',SirArom[4]:6:3,'¦'
              ,KatArom[4]:6:3,'¦');
              writeln(re,' ¦   5 ¦',SirPar[5]:6:3,'¦',KatPar[5]:6:3,'¦',SirIpar[5]:6:3,'¦',KatIpar[5]:6:3,'¦'
              ,SirNaf5[5]:6:3,'¦',KatNaf5[5]:6:3,'¦',SirNaf6[5]:6:3,'¦',KatNaf6[5]:6:3,'¦',SirArom[5]:6:3,'¦'
              ,KatArom[5]:6:3,'¦');
              writeln(re,' ¦   6 ¦',SirPar[6]:6:3,'¦',KatPar[6]:6:3,'¦',SirIpar[6]:6:3,'¦',KatIpar[6]:6:3,'¦'
              ,SirNaf5[6]:6:3,'¦',KatNaf5[6]:6:3,'¦',SirNaf6[6]:6:3,'¦',KatNaf6[6]:6:3,'¦',SirArom[6]:6:3,'¦'
              ,KatArom[6]:6:3,'¦');
              writeln(re,' ¦   7 ¦',SirPar[7]:6:3,'¦',KatPar[7]:6:3,'¦',SirIpar[7]:6:3,'¦',KatIpar[7]:6:3,'¦'
              ,SirNaf5[7]:6:3,'¦',KatNaf5[7]:6:3,'¦',SirNaf6[7]:6:3,'¦',KatNaf6[7]:6:3,'¦',SirArom[7]:6:3,'¦'
              ,KatArom[7]:6:3,'¦');
              writeln(re,' ¦   8 ¦',SirPar[8]:6:3,'¦',KatPar[8]:6:3,'¦',SirIpar[8]:6:3,'¦',KatIpar[8]:6:3,'¦'
              ,SirNaf5[8]:6:3,'¦',KatNaf5[8]:6:3,'¦',SirNaf6[8]:6:3,'¦',KatNaf6[8]:6:3,'¦',SirArom[8]:6:3,'¦'
              ,KatArom[8]:6:3,'¦');
              writeln(re,' ¦   9 ¦',SirPar[9]:6:3,'¦',KatPar[9]:6:3,'¦',SirIpar[9]:6:3,'¦',KatIpar[9]:6:3,'¦'
              ,SirNaf5[9]:6:3,'¦',KatNaf5[9]:6:3,'¦',SirNaf6[9]:6:3,'¦',KatNaf6[9]:6:3,'¦',SirArom[9]:6:3,'¦'
              ,KatArom[9]:6:3,'¦');
              writeln(re,' ¦  10 ¦',SirPar[10]:6:3,'¦',KatPar[10]:6:3,'¦',SirIpar[10]:6:3,'¦',KatIpar[10]:6:3,'¦'
              ,SirNaf5[10]:6:3,'¦',KatNaf5[10]:6:3,'¦',SirNaf6[10]:6:3,'¦',KatNaf6[10]:6:3,'¦',SirArom[10]:6:3,'¦'
              ,KatArom[10]:6:3,'¦');
              writeln(re,' ¦  11 ¦',SirPar[11]:6:3,'¦',KatPar[11]:6:3,'¦',SirIpar[11]:6:3,'¦',KatIpar[11]:6:3,'¦'
              ,SirNaf5[11]:6:3,'¦',KatNaf5[11]:6:3,'¦',SirNaf6[11]:6:3,'¦',KatNaf6[11]:6:3,'¦',SirArom[11]:6:3,'¦'
              ,KatArom[11]:6:3,'¦');
              writeln(re,' ¦  12 ¦',SirPar[12]:6:3,'¦',KatPar[12]:6:3,'¦',SirIpar[12]:6:3,'¦',KatIpar[12]:6:3,'¦'
              ,SirNaf5[12]:6:3,'¦',KatNaf5[12]:6:3,'¦',SirNaf6[12]:6:3,'¦',KatNaf6[12]:6:3,'¦',SirArom[12]:6:3,'¦'
              ,KatArom[12]:6:3,'¦');
              writeln(re,' ¦=====+======+======+======+======+======+======+======+======+======+======¦');
              writeln(re,' ¦Итого¦',SPar:6:3,'¦',KPar:6:3,'¦',SIpar:6:3,'¦',KIpar:6:3,'¦',SNaf5:6:3,'¦',KNaf5:6:3,
              '¦',SNaf6:6:3,'¦',KNaf6:6:3,'¦',SArom:6:3,'¦',KArom:6:3,'¦');
              writeln(re,' L=====¦======¦======¦======¦======¦======¦======¦======¦======¦======¦======-');
              writeln(re);

              writeln(re);
              writeln(re,'             Распределение компонентов по числу атомов углерода (',Nazvanie,')');
              writeln(re);
              writeln(re,'Число атомов C;н-Парафины;;и-Парафины;;Нафтены-5;;Нафтены-6;;Ароматика;');
              writeln(re,'              ; Сырье;Катализат;Сырье;Катализат;Сырье;Катализат;Сырье;Катализат;Сырье;Катализат');
              writeln(re,'3;',SirPar[3]:6:3,';',KatPar[3]:6:3,';',SirIpar[3]:6:3,';',KatIpar[3]:6:3,';',SirNaf5[3]:6:3,';',
KatNaf5[3]:6:3,';',SirNaf6[3]:6:3,';',KatNaf6[3]:6:3,';',SirArom[3]:6:3,';',KatArom[3]:6:3);
              writeln(re,'4;',SirPar[4]:6:3,';',KatPar[4]:6:3,';',SirIpar[4]:6:3,';',KatIpar[4]:6:3,';'
              ,SirNaf5[4]:6:3,';',KatNaf5[4]:6:3,';',SirNaf6[4]:6:3,';',KatNaf6[4]:6:3,';',SirArom[4]:6:3,';'
              ,KatArom[4]:6:3);
              writeln(re,'5;',SirPar[5]:6:3,';',KatPar[5]:6:3,';',SirIpar[5]:6:3,';',KatIpar[5]:6:3,';'
              ,SirNaf5[5]:6:3,';',KatNaf5[5]:6:3,';',SirNaf6[5]:6:3,';',KatNaf6[5]:6:3,';',SirArom[5]:6:3,';'
              ,KatArom[5]:6:3);
              writeln(re,'6;',SirPar[6]:6:3,';',KatPar[6]:6:3,';',SirIpar[6]:6:3,';',KatIpar[6]:6:3,';'
              ,SirNaf5[6]:6:3,';',KatNaf5[6]:6:3,';',SirNaf6[6]:6:3,';',KatNaf6[6]:6:3,';',SirArom[6]:6:3,';'
              ,KatArom[6]:6:3);
              writeln(re,'7;',SirPar[7]:6:3,';',KatPar[7]:6:3,';',SirIpar[7]:6:3,';',KatIpar[7]:6:3,';'
              ,SirNaf5[7]:6:3,';',KatNaf5[7]:6:3,';',SirNaf6[7]:6:3,';',KatNaf6[7]:6:3,';',SirArom[7]:6:3,';'
              ,KatArom[7]:6:3);
              writeln(re,'8;',SirPar[8]:6:3,';',KatPar[8]:6:3,';',SirIpar[8]:6:3,';',KatIpar[8]:6:3,';'
              ,SirNaf5[8]:6:3,';',KatNaf5[8]:6:3,';',SirNaf6[8]:6:3,';',KatNaf6[8]:6:3,';',SirArom[8]:6:3,';'
              ,KatArom[8]:6:3);
              writeln(re,'9;',SirPar[9]:6:3,';',KatPar[9]:6:3,';',SirIpar[9]:6:3,';',KatIpar[9]:6:3,';'
              ,SirNaf5[9]:6:3,';',KatNaf5[9]:6:3,';',SirNaf6[9]:6:3,';',KatNaf6[9]:6:3,';',SirArom[9]:6:3,';'
              ,KatArom[9]:6:3);
              writeln(re,'10;',SirPar[10]:6:3,';',KatPar[10]:6:3,';',SirIpar[10]:6:3,';',KatIpar[10]:6:3,';'
              ,SirNaf5[10]:6:3,';',KatNaf5[10]:6:3,';',SirNaf6[10]:6:3,';',KatNaf6[10]:6:3,';',SirArom[10]:6:3,';'
              ,KatArom[10]:6:3);
              writeln(re,'11;',SirPar[11]:6:3,';',KatPar[11]:6:3,';',SirIpar[11]:6:3,';',KatIpar[11]:6:3,';'
              ,SirNaf5[11]:6:3,';',KatNaf5[11]:6:3,';',SirNaf6[11]:6:3,';',KatNaf6[11]:6:3,';',SirArom[11]:6:3,';'
              ,KatArom[11]:6:3);
              writeln(re,'12;',SirPar[12]:6:3,';',KatPar[12]:6:3,';',SirIpar[12]:6:3,';',KatIpar[12]:6:3,';'
              ,SirNaf5[12]:6:3,';',KatNaf5[12]:6:3,';',SirNaf6[12]:6:3,';',KatNaf6[12]:6:3,';',SirArom[12]:6:3,';'
              ,KatArom[12]:6:3);
              writeln(re,'Итого;',SPar:6:3,';',KPar:6:3,';',SIpar:6:3,';',KIpar:6:3,';',SNaf5:6:3,';',KNaf5:6:3,
              ';',SNaf6:6:3,';',KNaf6:6:3,';',SArom:6:3,';',KArom:6:3);

              close(re);

   end;

procedure rezult_par(Nazvanie:string);
        begin

           for f1:=3 to 13 do
             begin

                  if (KatPar[f1]=0) and (SirPar[f1]=0) then
                     begin
                          StPar[f1]:=0;
                          Str(StPar[f1]:6:3,StrPar[f1]);
                          StPar1[f1]:=0;
                          Str(StPar1[f1]:6:3,StrPar1[f1]);
                     end;

                  if (KatPar[f1]=0) and (SirPar[f1]<>0) then
                     begin
                          StPar[f1]:=100;
                          Str(StPar[f1]:6:3,StrPar[f1]);
                          StrPar1[f1]:=' ---- ';
                     end;

                  if (KatPar[f1]<>0) and (SirPar[f1]=0) then
                     begin
                          StPar1[f1]:=100;
                          Str(StPar1[f1]:6:3,StrPar1[f1]);
                          StrPar[f1]:=' ---- ';
                     end;

                if (KatPar[f1]<>0) and (SirPar[f1]<>0) then
                 begin
                  if KatPar[f1]<SirPar[f1] then
                     begin
                          StrPar1[f1]:=' ---- ';
                          StPar[f1]:=(SirPar[f1]-KatPar[f1])/SirPar[f1]*100;
                          Str(StPar[f1]:6:3,StrPar[f1]);
                     end
                                           else
                     begin
                          StrPar[f1]:=' ---- ';
                          StPar1[f1]:=(KatPar[f1]-SirPar[f1])/KatPar[f1]*100;
                          Str(StPar1[f1]:6:3,StrPar1[f1]);

                     end;
                 end;
             end;

           if SPar>KPar then
                            begin
                                 StprPar1:=' ---- ';
                                 StpPar:=(SPar-KPar)/SPar*100;
                                 Str(StpPar:6:3,StprPar);
                            end
                        else
                            begin
                                 StprPar:=' ---- ';
                                 StpPar1:=(KPar-SPar)/KPar*100;
                                 Str(StpPar1:6:3,StprPar1);
                        end;


              assign(re,'rez\'+'par.rez');
              rewrite(re);
              writeln(re);
              writeln(re,'        Распределение компонентов по числу атомов углерода (',Nazvanie,') ');
              writeln(re);
              writeln(re,'  г=====T====================================================================¬');
              writeln(re,'  ¦Число¦                            н-Парафины                              ¦');
              writeln(re,'  ¦ ато-¦======T======T======T======T======T================T================¦');
              writeln(re,'  ¦ мов ¦ Сырье¦ Ката-¦ Бок. ¦ Кат.+¦ Пент.¦   Степень      ¦   Степень      ¦');
              writeln(re,'  ¦  С  ¦      ¦ лизат¦ погон¦  Б.П.¦  фр. ¦ превращения , %¦ образования , %¦');
              writeln(re,'  ¦=====+======+======+======+======+======+================+================¦');
writeln(re,'  ¦   3 ¦',SirPar[3]:6:3,'¦',KatPar0[3]:6:3,'¦',BpPar[3]:6:3,'¦',KatPar[3]:6:3,'¦'
,PentPar[3]:6:3,'¦     ',StrPar[3],'     ¦     ',StrPar1[3],'     ¦');
writeln(re,'  ¦   4 ¦',SirPar[4]:6:3,'¦',KatPar0[4]:6:3,'¦',BpPar[4]:6:3,'¦',KatPar[4]:6:3,'¦'
,PentPar[4]:6:3,'¦     ',StrPar[4],'     ¦     ',StrPar1[4],'     ¦');
writeln(re,'  ¦   5 ¦',SirPar[5]:6:3,'¦',KatPar0[5]:6:3,'¦',BpPar[5]:6:3,'¦',KatPar[5]:6:3,'¦'
,PentPar[5]:6:3,'¦     ',StrPar[5],'     ¦     ',StrPar1[5],'     ¦');
writeln(re,'  ¦   6 ¦',SirPar[6]:6:3,'¦',KatPar0[6]:6:3,'¦',BpPar[6]:6:3,'¦',KatPar[6]:6:3,'¦'
,PentPar[6]:6:3,'¦     ',StrPar[6],'     ¦     ',StrPar1[6],'     ¦');
writeln(re,'  ¦   7 ¦',SirPar[7]:6:3,'¦',KatPar0[7]:6:3,'¦',BpPar[7]:6:3,'¦',KatPar[7]:6:3,'¦'
,PentPar[7]:6:3,'¦     ',StrPar[7],'     ¦     ',StrPar1[7],'     ¦');
writeln(re,'  ¦   8 ¦',SirPar[8]:6:3,'¦',KatPar0[8]:6:3,'¦',BpPar[8]:6:3,'¦',KatPar[8]:6:3,'¦'
,PentPar[8]:6:3,'¦     ',StrPar[8],'     ¦     ',StrPar1[8],'     ¦');
writeln(re,'  ¦   9 ¦',SirPar[9]:6:3,'¦',KatPar0[9]:6:3,'¦',BpPar[9]:6:3,'¦',KatPar[9]:6:3,'¦'
,PentPar[9]:6:3,'¦     ',StrPar[9],'     ¦     ',StrPar1[9],'     ¦');
writeln(re,'  ¦  10 ¦',SirPar[10]:6:3,'¦',KatPar0[10]:6:3,'¦',BpPar[10]:6:3,'¦',KatPar[10]:6:3,'¦'
,PentPar[10]:6:3,'¦     ',StrPar[10],'     ¦     ',StrPar1[10],'     ¦');
writeln(re,'  ¦  11 ¦',SirPar[11]:6:3,'¦',KatPar0[11]:6:3,'¦',BpPar[11]:6:3,'¦',KatPar[11]:6:3,'¦'
,PentPar[11]:6:3,'¦     ',StrPar[11],'     ¦     ',StrPar1[11],'     ¦');
writeln(re,'  ¦  12 ¦',SirPar[12]:6:3,'¦',KatPar0[12]:6:3,'¦',BpPar[12]:6:3,'¦',KatPar[12]:6:3,'¦'
,PentPar[12]:6:3,'¦     ',StrPar[12],'     ¦     ',StrPar1[12],'     ¦');
writeln(re,'  ¦=====+======+======+======+======+======+================+================¦');
writeln(re,'  ¦Итого¦',SPar:6:3,'¦',KPar0:6:3,'¦',BPar:6:3,'¦',KPar:6:3,'¦',PPar:6:3,'¦     '
,StprPar,'     ¦     ',StprPar1,'     ¦');
writeln(re,'  L=====¦======¦======¦======¦======¦======¦================¦================-');
writeln(re);

              writeln(re);
              writeln(re,'         Распределение компонентов по числу атомов углерода (',Nazvanie,') ');
              writeln(re);
writeln(re,'Число атомов С;н-Парафины;;;;;;');
writeln(re,';Сырье;Катализат;Бок.погон;Кат+Б.П;Пент.фр.;Степень превращения, %;Степень образования, %');
writeln(re,'3;',SirPar[3]:6:3,';',KatPar0[3]:6:3,';',BpPar[3]:6:3,';',KatPar[3]:6:3,';',
           PentPar[3]:6:3,';',StrPar[3],';',StrPar1[3]);
writeln(re,'4;',SirPar[4]:6:3,';',KatPar0[4]:6:3,';',BpPar[4]:6:3,';',KatPar[4]:6:3,';',
           PentPar[4]:6:3,';',StrPar[4],';',StrPar1[4]);
writeln(re,'5;',SirPar[5]:6:3,';',KatPar0[5]:6:3,';',BpPar[5]:6:3,';',KatPar[5]:6:3,';',
           PentPar[5]:6:3,';',StrPar[5],';',StrPar1[5]);
writeln(re,'6;',SirPar[6]:6:3,';',KatPar0[6]:6:3,';',BpPar[6]:6:3,';',KatPar[6]:6:3,';',
           PentPar[6]:6:3,';',StrPar[6],';',StrPar1[6]);
writeln(re,'7;',SirPar[7]:6:3,';',KatPar0[7]:6:3,';',BpPar[7]:6:3,';',KatPar[7]:6:3,';',
           PentPar[7]:6:3,';',StrPar[7],';',StrPar1[7]);
writeln(re,'8;',SirPar[8]:6:3,';',KatPar0[8]:6:3,';',BpPar[8]:6:3,';',KatPar[8]:6:3,';',
           PentPar[8]:6:3,';',StrPar[8],';',StrPar1[8]);
writeln(re,'9;',SirPar[9]:6:3,';',KatPar0[9]:6:3,';',BpPar[9]:6:3,';',KatPar[9]:6:3,';',
           PentPar[9]:6:3,';',StrPar[9],';',StrPar1[9]);
writeln(re,'10;',SirPar[10]:6:3,';',KatPar0[10]:6:3,';',BpPar[10]:6:3,';',KatPar[10]:6:3,';',
           PentPar[10]:6:3,';',StrPar[10],';',StrPar1[10]);
writeln(re,'11;',SirPar[11]:6:3,';',KatPar0[11]:6:3,';',BpPar[11]:6:3,';',KatPar[11]:6:3,';',
           PentPar[11]:6:3,';',StrPar[11],';',StrPar1[11]);
writeln(re,'12;',SirPar[12]:6:3,';',KatPar0[12]:6:3,';',BpPar[12]:6:3,';',KatPar[12]:6:3,';',
           PentPar[12]:6:3,';',StrPar[12],';',StrPar1[12]);
writeln(re,'Итого;',SPar:6:3,';',KPar0:6:3,';',BPar:6:3,';',KPar:6:3,';',PPar:6:3,';',
           StprPar,';',StprPar1);
writeln(re);
              close(re);

end;

procedure rezult_ipar(Nazvanie:string);
        begin

           for f1:=3 to 13 do
             begin

                  if (KatIpar[f1]=0) and (SirIpar[f1]=0) then
                     begin
                          StIpar[f1]:=0;
                          Str(StIpar[f1]:6:3,StrIpar[f1]);
                          StIpar1[f1]:=0;
                          Str(StIpar1[f1]:6:3,StrIpar1[f1]);
                     end;

                  if (KatIpar[f1]=0) and (SirIpar[f1]<>0) then
                     begin
                          StIpar[f1]:=100;
                          Str(StIpar[f1]:6:3,StrIpar[f1]);
                          StrIpar1[f1]:=' ---- ';
                     end;

                  if (KatIpar[f1]<>0) and (SirIpar[f1]=0) then
                     begin
                          StIpar1[f1]:=100;
                          Str(StIpar1[f1]:6:3,StrIpar1[f1]);
                          StrIpar[f1]:=' ---- ';
                     end;

                if (KatIpar[f1]<>0) and (SirIpar[f1]<>0) then
                 begin
                  if KatIpar[f1]<SirIpar[f1] then
                     begin
                          StrIpar1[f1]:=' ---- ';
                          StIpar[f1]:=(SirIpar[f1]-KatIpar[f1])/SirIpar[f1]*100;
                          Str(StIpar[f1]:6:3,StrIpar[f1]);
                     end
                                           else
                     begin
                          StrIpar[f1]:=' ---- ';
                          StIpar1[f1]:=(KatIpar[f1]-SirIpar[f1])/KatIpar[f1]*100;
                          Str(StIpar1[f1]:6:3,StrIpar1[f1]);

                     end;
                 end;
             end;

           if SIpar>KIpar then
                            begin
                                 StprIpar1:=' ---- ';
                                 StpIpar:=(SIpar-KIpar)/SIpar*100;
                                 Str(StpIpar:6:3,StprIpar);
                            end
                        else
                            begin
                                 StprIpar:=' ---- ';
                                 StpIpar1:=(KIpar-SIpar)/KIpar*100;
                                 Str(StpIpar1:6:3,StprIpar1);
                        end;



              assign(re,'rez\'+'ipar.rez');
              rewrite(re);
              writeln(re);
              writeln(re,'        Распределение компонентов по числу атомов углерода (',Nazvanie,') ');
              writeln(re);
              writeln(re,'  г=====T====================================================================¬');
              writeln(re,'  ¦Число¦                            и-Парафины                              ¦');
              writeln(re,'  ¦ ато-¦======T======T======T======T======T================T================¦');
              writeln(re,'  ¦ мов ¦ Сырье¦ Ката-¦ Бок. ¦ Кат.+¦ Пент.¦   Степень      ¦   Степень      ¦');
              writeln(re,'  ¦  С  ¦      ¦ лизат¦ погон¦  Б.П.¦  фр. ¦ превращения , %¦ образования , %¦');
              writeln(re,'  ¦=====+======+======+======+======+======+================+================¦');
writeln(re,'  ¦   3 ¦',SirIpar[3]:6:3,'¦',KatIpar0[3]:6:3,'¦',BpIpar[3]:6:3,'¦',KatIpar[3]:6:3,'¦'
,PentIpar[3]:6:3,'¦     ',StrIpar[3],'     ¦     ',StrIpar1[3],'     ¦');
writeln(re,'  ¦   4 ¦',SirIpar[4]:6:3,'¦',KatIpar0[4]:6:3,'¦',BpIpar[4]:6:3,'¦',KatIpar[4]:6:3,'¦'
,PentIpar[4]:6:3,'¦     ',StrIpar[4],'     ¦     ',StrIpar1[4],'     ¦');
writeln(re,'  ¦   5 ¦',SirIpar[5]:6:3,'¦',KatIpar0[5]:6:3,'¦',BpIpar[5]:6:3,'¦',KatIpar[5]:6:3,'¦'
,PentIpar[5]:6:3,'¦     ',StrIpar[5],'     ¦     ',StrIpar1[5],'     ¦');
writeln(re,'  ¦   6 ¦',SirIpar[6]:6:3,'¦',KatIpar0[6]:6:3,'¦',BpIpar[6]:6:3,'¦',KatIpar[6]:6:3,'¦'
,PentIpar[6]:6:3,'¦     ',StrIpar[6],'     ¦     ',StrIpar1[6],'     ¦');
writeln(re,'  ¦   7 ¦',SirIpar[7]:6:3,'¦',KatIpar0[7]:6:3,'¦',BpIpar[7]:6:3,'¦',KatIpar[7]:6:3,'¦'
,PentIpar[7]:6:3,'¦     ',StrIpar[7],'     ¦     ',StrIpar1[7],'     ¦');
writeln(re,'  ¦   8 ¦',SirIpar[8]:6:3,'¦',KatIpar0[8]:6:3,'¦',BpIpar[8]:6:3,'¦',KatIpar[8]:6:3,'¦'
,PentIpar[8]:6:3,'¦     ',StrIpar[8],'     ¦     ',StrIpar1[8],'     ¦');
writeln(re,'  ¦   9 ¦',SirIpar[9]:6:3,'¦',KatIpar0[9]:6:3,'¦',BpIpar[9]:6:3,'¦',KatIpar[9]:6:3,'¦'
,PentIpar[9]:6:3,'¦     ',StrIpar[9],'     ¦     ',StrIpar1[9],'     ¦');
writeln(re,'  ¦  10 ¦',SirIpar[10]:6:3,'¦',KatIpar0[10]:6:3,'¦',BpIpar[10]:6:3,'¦',KatIpar[10]:6:3,'¦'
,PentIpar[10]:6:3,'¦     ',StrIpar[10],'     ¦     ',StrIpar1[10],'     ¦');
writeln(re,'  ¦  11 ¦',SirIpar[11]:6:3,'¦',KatIpar0[11]:6:3,'¦',BpIpar[11]:6:3,'¦',KatIpar[11]:6:3,'¦'
,PentIpar[11]:6:3,'¦     ',StrIpar[11],'     ¦     ',StrIpar1[11],'     ¦');
writeln(re,'  ¦  12 ¦',SirIpar[12]:6:3,'¦',KatIpar0[12]:6:3,'¦',BpIpar[12]:6:3,'¦',KatIpar[12]:6:3,'¦'
,PentIpar[12]:6:3,'¦     ',StrIpar[12],'     ¦     ',StrIpar1[12],'     ¦');
writeln(re,'  ¦=====+======+======+======+======+======+================+================¦');
writeln(re,'  ¦Итого¦',SIpar:6:3,'¦',KIpar0:6:3,'¦',BIpar:6:3,'¦',KIpar:6:3,'¦',PIpar:6:3,'¦     '
,StprIpar,'     ¦     ',StprIpar1,'     ¦');
writeln(re,'  L=====¦======¦======¦======¦======¦======¦================¦================-');
writeln(re);

              writeln(re);
              writeln(re,'         Распределение компонентов по числу атомов углерода (',Nazvanie,') ');
              writeln(re);
writeln(re,'Число атомов С;и-Парафины;;;;;;');
writeln(re,';Сырье;Катализат;Бок.погон;Кат+Б.П;Пент.фр.;Степень превращения, %;Степень образования, %');
writeln(re,'3;',SirIpar[3]:6:3,';',KatIpar0[3]:6:3,';',BpIpar[3]:6:3,';',KatIpar[3]:6:3,';',
           PentIpar[3]:6:3,';',StrIpar[3],';',StrIpar1[3]);
writeln(re,'4;',SirIpar[4]:6:3,';',KatIpar0[4]:6:3,';',BpIpar[4]:6:3,';',KatIpar[4]:6:3,';',
           PentIpar[4]:6:3,';',StrIpar[4],';',StrIpar1[4]);
writeln(re,'5;',SirIpar[5]:6:3,';',KatIpar0[5]:6:3,';',BpIpar[5]:6:3,';',KatIpar[5]:6:3,';',
           PentIpar[5]:6:3,';',StrIpar[5],';',StrIpar1[5]);
writeln(re,'6;',SirIpar[6]:6:3,';',KatIpar0[6]:6:3,';',BpIpar[6]:6:3,';',KatIpar[6]:6:3,';',
           PentIpar[6]:6:3,';',StrIpar[6],';',StrIpar1[6]);
writeln(re,'7;',SirIpar[7]:6:3,';',KatIpar0[7]:6:3,';',BpIpar[7]:6:3,';',KatIpar[7]:6:3,';',
           PentIpar[7]:6:3,';',StrIpar[7],';',StrIpar1[7]);
writeln(re,'8;',SirIpar[8]:6:3,';',KatIpar0[8]:6:3,';',BpIpar[8]:6:3,';',KatIpar[8]:6:3,';',
           PentIpar[8]:6:3,';',StrIpar[8],';',StrIpar1[8]);
writeln(re,'9;',SirIpar[9]:6:3,';',KatIpar0[9]:6:3,';',BpIpar[9]:6:3,';',KatIpar[9]:6:3,';',
           PentIpar[9]:6:3,';',StrIpar[9],';',StrIpar1[9]);
writeln(re,'10;',SirIpar[10]:6:3,';',KatIpar0[10]:6:3,';',BpIpar[10]:6:3,';',KatIpar[10]:6:3,';',
           PentIpar[10]:6:3,';',StrIpar[10],';',StrIpar1[10]);
writeln(re,'11;',SirIpar[11]:6:3,';',KatIpar0[11]:6:3,';',BpIpar[11]:6:3,';',KatIpar[11]:6:3,';',
           PentIpar[11]:6:3,';',StrIpar[11],';',StrIpar1[11]);
writeln(re,'12;',SirIpar[12]:6:3,';',KatIpar0[12]:6:3,';',BpIpar[12]:6:3,';',KatIpar[12]:6:3,';',
           PentIpar[12]:6:3,';',StrIpar[12],';',StrIpar1[12]);
writeln(re,'Итого;',SIpar:6:3,';',KIpar0:6:3,';',BIpar:6:3,';',KIpar:6:3,';',PIpar:6:3,';',
           StprIpar,';',StprIpar1);
writeln(re);
              close(re);
end;



   procedure rezult_naf5(Nazvanie:string);
        begin

           for f1:=3 to 13 do
             begin

                  if (KatNaf5[f1]=0) and (SirNaf5[f1]=0) then
                     begin
                          StNaf5[f1]:=0;
                          Str(StNaf5[f1]:6:3,StrNaf5[f1]);
                          StNaf51[f1]:=0;
                          Str(StNaf51[f1]:6:3,StrNaf51[f1]);
                     end;

                  if (KatNaf5[f1]=0) and (SirNaf5[f1]<>0) then
                     begin
                          StNaf5[f1]:=100;
                          Str(StNaf5[f1]:6:3,StrNaf5[f1]);
                          StrNaf51[f1]:=' ---- ';
                     end;

                  if (KatNaf5[f1]<>0) and (SirNaf5[f1]=0) then
                     begin
                          StNaf51[f1]:=100;
                          Str(StNaf51[f1]:6:3,StrNaf51[f1]);
                          StrNaf5[f1]:=' ---- ';
                     end;

                if (KatNaf5[f1]<>0) and (SirNaf5[f1]<>0) then
                 begin
                  if KatNaf5[f1]<SirNaf5[f1] then
                     begin
                          StrNaf51[f1]:=' ---- ';
                          StNaf5[f1]:=(SirNaf5[f1]-KatNaf5[f1])/SirNaf5[f1]*100;
                          Str(StNaf5[f1]:6:3,StrNaf5[f1]);
                     end
                                           else
                     begin
                          StrNaf5[f1]:=' ---- ';
                          StNaf51[f1]:=(KatNaf5[f1]-SirNaf5[f1])/KatNaf5[f1]*100;
                          Str(StNaf51[f1]:6:3,StrNaf51[f1]);

                     end;
                 end;
             end;

           if SNaf5>KNaf5 then
                            begin
                                 StprNaf51:=' ---- ';
                                 StpNaf5:=(SNaf5-KNaf5)/SNaf5*100;
                                 Str(StpNaf5:6:3,StprNaf5);
                            end
                        else
                            begin
                                 StprNaf5:=' ---- ';
                                 StpNaf51:=(KNaf5-SNaf5)/KNaf5*100;
                                 Str(StpNaf51:6:3,StprNaf51);
                        end;



              assign(re,'rez\'+'naf5.rez');
              rewrite(re);
              writeln(re);
              writeln(re,'        Распределение компонентов по числу атомов углерода (',Nazvanie,') ');
              writeln(re);
              writeln(re,'  г=====T====================================================================¬');
              writeln(re,'  ¦Число¦                           Нафтены - 5                              ¦');
              writeln(re,'  ¦ ато-¦======T======T======T======T======T================T================¦');
              writeln(re,'  ¦ мов ¦ Сырье¦ Ката-¦ Бок. ¦ Кат.+¦ Пент.¦   Степень      ¦   Степень      ¦');
              writeln(re,'  ¦  С  ¦      ¦ лизат¦ погон¦  Б.П.¦  фр. ¦ превращения , %¦ образования , %¦');
              writeln(re,'  ¦=====+======+======+======+======+======+================+================¦');
writeln(re,'  ¦   3 ¦',SirNaf5[3]:6:3,'¦',KatNaf50[3]:6:3,'¦',BpNaf5[3]:6:3,'¦',KatNaf5[3]:6:3,'¦'
,PentNaf5[3]:6:3,'¦     ',StrNaf5[3],'     ¦     ',StrNaf51[3],'     ¦');
writeln(re,'  ¦   4 ¦',SirNaf5[4]:6:3,'¦',KatNaf50[4]:6:3,'¦',BpNaf5[4]:6:3,'¦',KatNaf5[4]:6:3,'¦'
,PentNaf5[4]:6:3,'¦     ',StrNaf5[4],'     ¦     ',StrNaf51[4],'     ¦');
writeln(re,'  ¦   5 ¦',SirNaf5[5]:6:3,'¦',KatNaf50[5]:6:3,'¦',BpNaf5[5]:6:3,'¦',KatNaf5[5]:6:3,'¦'
,PentNaf5[5]:6:3,'¦     ',StrNaf5[5],'     ¦     ',StrNaf51[5],'     ¦');
writeln(re,'  ¦   6 ¦',SirNaf5[6]:6:3,'¦',KatNaf50[6]:6:3,'¦',BpNaf5[6]:6:3,'¦',KatNaf5[6]:6:3,'¦'
,PentNaf5[6]:6:3,'¦     ',StrNaf5[6],'     ¦     ',StrNaf51[6],'     ¦');
writeln(re,'  ¦   7 ¦',SirNaf5[7]:6:3,'¦',KatNaf50[7]:6:3,'¦',BpNaf5[7]:6:3,'¦',KatNaf5[7]:6:3,'¦'
,PentNaf5[7]:6:3,'¦     ',StrNaf5[7],'     ¦     ',StrNaf51[7],'     ¦');
writeln(re,'  ¦   8 ¦',SirNaf5[8]:6:3,'¦',KatNaf50[8]:6:3,'¦',BpNaf5[8]:6:3,'¦',KatNaf5[8]:6:3,'¦'
,PentNaf5[8]:6:3,'¦     ',StrNaf5[8],'     ¦     ',StrNaf51[8],'     ¦');
writeln(re,'  ¦   9 ¦',SirNaf5[9]:6:3,'¦',KatNaf50[9]:6:3,'¦',BpNaf5[9]:6:3,'¦',KatNaf5[9]:6:3,'¦'
,PentNaf5[9]:6:3,'¦     ',StrNaf5[9],'     ¦     ',StrNaf51[9],'     ¦');
writeln(re,'  ¦  10 ¦',SirNaf5[10]:6:3,'¦',KatNaf50[10]:6:3,'¦',BpNaf5[10]:6:3,'¦',KatNaf5[10]:6:3,'¦'
,PentNaf5[10]:6:3,'¦     ',StrNaf5[10],'     ¦     ',StrNaf51[10],'     ¦');
writeln(re,'  ¦  11 ¦',SirNaf5[11]:6:3,'¦',KatNaf50[11]:6:3,'¦',BpNaf5[11]:6:3,'¦',KatNaf5[11]:6:3,'¦'
,PentNaf5[11]:6:3,'¦     ',StrNaf5[11],'     ¦     ',StrNaf51[11],'     ¦');
writeln(re,'  ¦  12 ¦',SirNaf5[12]:6:3,'¦',KatNaf50[12]:6:3,'¦',BpNaf5[12]:6:3,'¦',KatNaf5[12]:6:3,'¦'
,PentNaf5[12]:6:3,'¦     ',StrNaf5[12],'     ¦     ',StrNaf51[12],'     ¦');
writeln(re,'  ¦=====+======+======+======+======+======+================+================¦');
writeln(re,'  ¦Итого¦',SNaf5:6:3,'¦',KNaf50:6:3,'¦',BNaf5:6:3,'¦',KNaf5:6:3,'¦',PNaf5:6:3,'¦     '
,StprNaf5,'     ¦     ',StprNaf51,'     ¦');
writeln(re,'  L=====¦======¦======¦======¦======¦======¦================¦================-');
writeln(re);

              writeln(re);
              writeln(re,'         Распределение компонентов по числу атомов углерода (',Nazvanie,') ');
              writeln(re);
writeln(re,'Число атомов С;Нафтены - 5;;;;;;');
writeln(re,';Сырье;Катализат;Бок.погон;Кат+Б.П;Пент.фр.;Степень превращения, %;Степень образования, %');
writeln(re,'3;',SirNaf5[3]:6:3,';',KatNaf50[3]:6:3,';',BpNaf5[3]:6:3,';',KatNaf5[3]:6:3,';',
           PentNaf5[3]:6:3,';',StrNaf5[3],';',StrNaf51[3]);
writeln(re,'4;',SirNaf5[4]:6:3,';',KatNaf50[4]:6:3,';',BpNaf5[4]:6:3,';',KatNaf5[4]:6:3,';',
           PentNaf5[4]:6:3,';',StrNaf5[4],';',StrNaf51[4]);
writeln(re,'5;',SirNaf5[5]:6:3,';',KatNaf50[5]:6:3,';',BpNaf5[5]:6:3,';',KatNaf5[5]:6:3,';',
           PentNaf5[5]:6:3,';',StrNaf5[5],';',StrNaf51[5]);
writeln(re,'6;',SirNaf5[6]:6:3,';',KatNaf50[6]:6:3,';',BpNaf5[6]:6:3,';',KatNaf5[6]:6:3,';',
           PentNaf5[6]:6:3,';',StrNaf5[6],';',StrNaf51[6]);
writeln(re,'7;',SirNaf5[7]:6:3,';',KatNaf50[7]:6:3,';',BpNaf5[7]:6:3,';',KatNaf5[7]:6:3,';',
           PentNaf5[7]:6:3,';',StrNaf5[7],';',StrNaf51[7]);
writeln(re,'8;',SirNaf5[8]:6:3,';',KatNaf50[8]:6:3,';',BpNaf5[8]:6:3,';',KatNaf5[8]:6:3,';',
           PentNaf5[8]:6:3,';',StrNaf5[8],';',StrNaf51[8]);
writeln(re,'9;',SirNaf5[9]:6:3,';',KatNaf50[9]:6:3,';',BpNaf5[9]:6:3,';',KatNaf5[9]:6:3,';',
           PentNaf5[9]:6:3,';',StrNaf5[9],';',StrNaf51[9]);
writeln(re,'10;',SirNaf5[10]:6:3,';',KatNaf50[10]:6:3,';',BpNaf5[10]:6:3,';',KatNaf5[10]:6:3,';',
           PentNaf5[10]:6:3,';',StrNaf5[10],';',StrNaf51[10]);
writeln(re,'11;',SirNaf5[11]:6:3,';',KatNaf50[11]:6:3,';',BpNaf5[11]:6:3,';',KatNaf5[11]:6:3,';',
           PentNaf5[11]:6:3,';',StrNaf5[11],';',StrNaf51[11]);
writeln(re,'12;',SirNaf5[12]:6:3,';',KatNaf50[12]:6:3,';',BpNaf5[12]:6:3,';',KatNaf5[12]:6:3,';',
           PentNaf5[12]:6:3,';',StrNaf5[12],';',StrNaf51[12]);
writeln(re,'Итого;',SNaf5:6:3,';',KNaf50:6:3,';',BNaf5:6:3,';',KNaf5:6:3,';',PNaf5:6:3,';',
           StprNaf5,';',StprNaf51);
writeln(re);

              close(re);

end;



   procedure rezult_naf6(Nazvanie:string);
        begin

           for f1:=3 to 13 do
             begin

                  if (KatNaf6[f1]=0) and (SirNaf6[f1]=0) then
                     begin
                          StNaf6[f1]:=0;
                          Str(StNaf6[f1]:6:3,StrNaf6[f1]);
                          StNaf61[f1]:=0;
                          Str(StNaf61[f1]:6:3,StrNaf61[f1]);
                     end;

                  if (KatNaf6[f1]=0) and (SirNaf6[f1]<>0) then
                     begin
                          StNaf6[f1]:=100;
                          Str(StNaf6[f1]:6:3,StrNaf6[f1]);
                          StrNaf61[f1]:=' ---- ';
                     end;

                  if (KatNaf6[f1]<>0) and (SirNaf6[f1]=0) then
                     begin
                          StNaf61[f1]:=100;
                          Str(StNaf61[f1]:6:3,StrNaf61[f1]);
                          StrNaf6[f1]:=' ---- ';
                     end;

                if (KatNaf6[f1]<>0) and (SirNaf6[f1]<>0) then
                 begin
                  if KatNaf6[f1]<SirNaf6[f1] then
                     begin
                          StrNaf61[f1]:=' ---- ';
                          StNaf6[f1]:=(SirNaf6[f1]-KatNaf6[f1])/SirNaf6[f1]*100;
                          Str(StNaf6[f1]:6:3,StrNaf6[f1]);
                     end
                                           else
                     begin
                          StrNaf6[f1]:=' ---- ';
                          StNaf61[f1]:=(KatNaf6[f1]-SirNaf6[f1])/KatNaf6[f1]*100;
                          Str(StNaf61[f1]:6:3,StrNaf61[f1]);

                     end;
                 end;
             end;

           if SNaf6>KNaf6 then
                            begin
                                 StprNaf61:=' ---- ';
                                 StpNaf6:=(SNaf6-KNaf6)/SNaf6*100;
                                 Str(StpNaf6:6:3,StprNaf6);
                            end
                        else
                            begin
                                 StprNaf6:=' ---- ';
                                 StpNaf61:=(KNaf6-SNaf6)/KNaf6*100;
                                 Str(StpNaf61:6:3,StprNaf61);
                        end;



              assign(re,'rez\'+'naf6.rez');
              rewrite(re);
              writeln(re);
              writeln(re,'        Распределение компонентов по числу атомов углерода (',Nazvanie,') ');
              writeln(re);
              writeln(re,'  г=====T====================================================================¬');
              writeln(re,'  ¦Число¦                           Нафтены - 6                              ¦');
              writeln(re,'  ¦ ато-¦======T======T======T======T======T================T================¦');
              writeln(re,'  ¦ мов ¦ Сырье¦ Ката-¦ Бок. ¦ Кат.+¦ Пент.¦   Степень      ¦   Степень      ¦');
              writeln(re,'  ¦  С  ¦      ¦ лизат¦ погон¦  Б.П.¦  фр. ¦ превращения , %¦ образования , %¦');
              writeln(re,'  ¦=====+======+======+======+======+======+================+================¦');
writeln(re,'  ¦   3 ¦',SirNaf6[3]:6:3,'¦',KatNaf60[3]:6:3,'¦',BpNaf6[3]:6:3,'¦',KatNaf6[3]:6:3,'¦'
,PentNaf6[3]:6:3,'¦     ',StrNaf6[3],'     ¦     ',StrNaf61[3],'     ¦');
writeln(re,'  ¦   4 ¦',SirNaf6[4]:6:3,'¦',KatNaf60[4]:6:3,'¦',BpNaf6[4]:6:3,'¦',KatNaf6[4]:6:3,'¦'
,PentNaf6[4]:6:3,'¦     ',StrNaf6[4],'     ¦     ',StrNaf61[4],'     ¦');
writeln(re,'  ¦   5 ¦',SirNaf6[5]:6:3,'¦',KatNaf60[5]:6:3,'¦',BpNaf6[5]:6:3,'¦',KatNaf6[5]:6:3,'¦'
,PentNaf6[5]:6:3,'¦     ',StrNaf6[5],'     ¦     ',StrNaf61[5],'     ¦');
writeln(re,'  ¦   6 ¦',SirNaf6[6]:6:3,'¦',KatNaf60[6]:6:3,'¦',BpNaf6[6]:6:3,'¦',KatNaf6[6]:6:3,'¦'
,PentNaf6[6]:6:3,'¦     ',StrNaf6[6],'     ¦     ',StrNaf61[6],'     ¦');
writeln(re,'  ¦   7 ¦',SirNaf6[7]:6:3,'¦',KatNaf60[7]:6:3,'¦',BpNaf6[7]:6:3,'¦',KatNaf6[7]:6:3,'¦'
,PentNaf6[7]:6:3,'¦     ',StrNaf6[7],'     ¦     ',StrNaf61[7],'     ¦');
writeln(re,'  ¦   8 ¦',SirNaf6[8]:6:3,'¦',KatNaf60[8]:6:3,'¦',BpNaf6[8]:6:3,'¦',KatNaf6[8]:6:3,'¦'
,PentNaf6[8]:6:3,'¦     ',StrNaf6[8],'     ¦     ',StrNaf61[8],'     ¦');
writeln(re,'  ¦   9 ¦',SirNaf6[9]:6:3,'¦',KatNaf60[9]:6:3,'¦',BpNaf6[9]:6:3,'¦',KatNaf6[9]:6:3,'¦'
,PentNaf6[9]:6:3,'¦     ',StrNaf6[9],'     ¦     ',StrNaf61[9],'     ¦');
writeln(re,'  ¦  10 ¦',SirNaf6[10]:6:3,'¦',KatNaf60[10]:6:3,'¦',BpNaf6[10]:6:3,'¦',KatNaf6[10]:6:3,'¦'
,PentNaf6[10]:6:3,'¦     ',StrNaf6[10],'     ¦     ',StrNaf61[10],'     ¦');
writeln(re,'  ¦  11 ¦',SirNaf6[11]:6:3,'¦',KatNaf60[11]:6:3,'¦',BpNaf6[11]:6:3,'¦',KatNaf6[11]:6:3,'¦'
,PentNaf6[11]:6:3,'¦     ',StrNaf6[11],'     ¦     ',StrNaf61[11],'     ¦');
writeln(re,'  ¦  12 ¦',SirNaf6[12]:6:3,'¦',KatNaf60[12]:6:3,'¦',BpNaf6[12]:6:3,'¦',KatNaf6[12]:6:3,'¦'
,PentNaf6[12]:6:3,'¦     ',StrNaf6[12],'     ¦     ',StrNaf61[12],'     ¦');
writeln(re,'  ¦=====+======+======+======+======+======+================+================¦');
writeln(re,'  ¦Итого¦',SNaf6:6:3,'¦',KNaf60:6:3,'¦',BNaf6:6:3,'¦',KNaf6:6:3,'¦',PNaf6:6:3,'¦     '
,StprNaf6,'     ¦     ',StprNaf61,'     ¦');
writeln(re,'  L=====¦======¦======¦======¦======¦======¦================¦================-');
writeln(re);

              writeln(re);
              writeln(re,'         Распределение компонентов по числу атомов углерода (',Nazvanie,') ');
              writeln(re);
writeln(re,'Число атомов С;Нафтены - 6;;;;;;');
writeln(re,';Сырье;Катализат;Бок.погон;Кат+Б.П;Пент.фр.;Степень превращения, %;Степень образования, %');
writeln(re,'3;',SirNaf6[3]:6:3,';',KatNaf60[3]:6:3,';',BpNaf6[3]:6:3,';',KatNaf6[3]:6:3,';',
           PentNaf6[3]:6:3,';',StrNaf6[3],';',StrNaf61[3]);
writeln(re,'4;',SirNaf6[4]:6:3,';',KatNaf60[4]:6:3,';',BpNaf6[4]:6:3,';',KatNaf6[4]:6:3,';',
           PentNaf6[4]:6:3,';',StrNaf6[4],';',StrNaf61[4]);
writeln(re,'5;',SirNaf6[5]:6:3,';',KatNaf60[5]:6:3,';',BpNaf6[5]:6:3,';',KatNaf6[5]:6:3,';',
           PentNaf6[5]:6:3,';',StrNaf6[5],';',StrNaf61[5]);
writeln(re,'6;',SirNaf6[6]:6:3,';',KatNaf60[6]:6:3,';',BpNaf6[6]:6:3,';',KatNaf6[6]:6:3,';',
           PentNaf6[6]:6:3,';',StrNaf6[6],';',StrNaf61[6]);
writeln(re,'7;',SirNaf6[7]:6:3,';',KatNaf60[7]:6:3,';',BpNaf6[7]:6:3,';',KatNaf6[7]:6:3,';',
           PentNaf6[7]:6:3,';',StrNaf6[7],';',StrNaf61[7]);
writeln(re,'8;',SirNaf6[8]:6:3,';',KatNaf60[8]:6:3,';',BpNaf6[8]:6:3,';',KatNaf6[8]:6:3,';',
           PentNaf6[8]:6:3,';',StrNaf6[8],';',StrNaf61[8]);
writeln(re,'9;',SirNaf6[9]:6:3,';',KatNaf60[9]:6:3,';',BpNaf6[9]:6:3,';',KatNaf6[9]:6:3,';',
           PentNaf6[9]:6:3,';',StrNaf6[9],';',StrNaf61[9]);
writeln(re,'10;',SirNaf6[10]:6:3,';',KatNaf60[10]:6:3,';',BpNaf6[10]:6:3,';',KatNaf6[10]:6:3,';',
           PentNaf6[10]:6:3,';',StrNaf6[10],';',StrNaf61[10]);
writeln(re,'11;',SirNaf6[11]:6:3,';',KatNaf60[11]:6:3,';',BpNaf6[11]:6:3,';',KatNaf6[11]:6:3,';',
           PentNaf6[11]:6:3,';',StrNaf6[11],';',StrNaf61[11]);
writeln(re,'12;',SirNaf6[12]:6:3,';',KatNaf60[12]:6:3,';',BpNaf6[12]:6:3,';',KatNaf6[12]:6:3,';',
           PentNaf6[12]:6:3,';',StrNaf6[12],';',StrNaf61[12]);
writeln(re,'Итого;',SNaf6:6:3,';',KNaf60:6:3,';',BNaf6:6:3,';',KNaf6:6:3,';',PNaf6:6:3,';',
           StprNaf6,';',StprNaf61);
writeln(re);

              close(re);

 end;



   procedure rezult_arom(Nazvanie:string);
        begin

           for f1:=3 to 13 do
             begin

                  if (KatArom[f1]=0) and (SirArom[f1]=0) then
                     begin
                          StArom[f1]:=0;
                          Str(StArom[f1]:6:3,StrArom[f1]);
                          StArom1[f1]:=0;
                          Str(StArom1[f1]:6:3,StrArom1[f1]);
                     end;

                  if (KatArom[f1]=0) and (SirArom[f1]<>0) then
                     begin
                          StArom[f1]:=100;
                          Str(StArom[f1]:6:3,StrArom[f1]);
                          StrArom1[f1]:=' ---- ';
                     end;

                  if (KatArom[f1]<>0) and (SirArom[f1]=0) then
                     begin
                          StArom1[f1]:=100;
                          Str(StArom1[f1]:6:3,StrArom1[f1]);
                          StrArom[f1]:=' ---- ';
                     end;

                if (KatArom[f1]<>0) and (SirArom[f1]<>0) then
                 begin
                  if KatArom[f1]<SirArom[f1] then
                     begin
                          StrArom1[f1]:=' ---- ';
                          StArom[f1]:=(SirArom[f1]-KatArom[f1])/SirArom[f1]*100;
                          Str(StArom[f1]:6:3,StrArom[f1]);
                     end
                                           else
                     begin
                          StrArom[f1]:=' ---- ';
                          StArom1[f1]:=(KatArom[f1]-SirArom[f1])/KatArom[f1]*100;
                          Str(StArom1[f1]:6:3,StrArom1[f1]);

                     end;
                 end;
             end;

           if SArom>KArom then
                            begin
                                 StprArom1:=' ---- ';
                                 StpArom:=(SArom-KArom)/SArom*100;
                                 Str(StpArom:6:3,StprArom);
                            end
                        else
                            begin
                                 StprArom:=' ---- ';
                                 StpArom1:=(KArom-SArom)/KArom*100;
                                 Str(StpArom1:6:3,StprArom1);
                        end;



              assign(re,'rez\'+'arom.rez');
              rewrite(re);
              writeln(re);
              writeln(re,'        Распределение компонентов по числу атомов углерода (',Nazvanie,') ');
              writeln(re);
              writeln(re,'  г=====T====================================================================¬');
              writeln(re,'  ¦Число¦                           Ароматика                                ¦');
              writeln(re,'  ¦ ато-¦======T======T======T======T======T================T================¦');
              writeln(re,'  ¦ мов ¦ Сырье¦ Ката-¦ Бок. ¦ Кат.+¦ Пент.¦   Степень      ¦   Степень      ¦');
              writeln(re,'  ¦  С  ¦      ¦ лизат¦ погон¦  Б.П.¦  фр. ¦ превращения , %¦ образования , %¦');
              writeln(re,'  ¦=====+======+======+======+======+======+================+================¦');
writeln(re,'  ¦   3 ¦',SirArom[3]:6:3,'¦',KatArom0[3]:6:3,'¦',BpArom[3]:6:3,'¦',KatArom[3]:6:3,'¦'
,PentArom[3]:6:3,'¦     ',StrArom[3],'     ¦     ',StrArom1[3],'     ¦');
writeln(re,'  ¦   4 ¦',SirArom[4]:6:3,'¦',KatArom0[4]:6:3,'¦',BpArom[4]:6:3,'¦',KatArom[4]:6:3,'¦'
,PentArom[4]:6:3,'¦     ',StrArom[4],'     ¦     ',StrArom1[4],'     ¦');
writeln(re,'  ¦   5 ¦',SirArom[5]:6:3,'¦',KatArom0[5]:6:3,'¦',BpArom[5]:6:3,'¦',KatArom[5]:6:3,'¦'
,PentArom[5]:6:3,'¦     ',StrArom[5],'     ¦     ',StrArom1[5],'     ¦');
writeln(re,'  ¦   6 ¦',SirArom[6]:6:3,'¦',KatArom0[6]:6:3,'¦',BpArom[6]:6:3,'¦',KatArom[6]:6:3,'¦'
,PentArom[6]:6:3,'¦     ',StrArom[6],'     ¦     ',StrArom1[6],'     ¦');
writeln(re,'  ¦   7 ¦',SirArom[7]:6:3,'¦',KatArom0[7]:6:3,'¦',BpArom[7]:6:3,'¦',KatArom[7]:6:3,'¦'
,PentArom[7]:6:3,'¦     ',StrArom[7],'     ¦     ',StrArom1[7],'     ¦');
writeln(re,'  ¦   8 ¦',SirArom[8]:6:3,'¦',KatArom0[8]:6:3,'¦',BpArom[8]:6:3,'¦',KatArom[8]:6:3,'¦'
,PentArom[8]:6:3,'¦     ',StrArom[8],'     ¦     ',StrArom1[8],'     ¦');
writeln(re,'  ¦   9 ¦',SirArom[9]:6:3,'¦',KatArom0[9]:6:3,'¦',BpArom[9]:6:3,'¦',KatArom[9]:6:3,'¦'
,PentArom[9]:6:3,'¦     ',StrArom[9],'     ¦     ',StrArom1[9],'     ¦');
writeln(re,'  ¦  10 ¦',SirArom[10]:6:3,'¦',KatArom0[10]:6:3,'¦',BpArom[10]:6:3,'¦',KatArom[10]:6:3,'¦'
,PentArom[10]:6:3,'¦     ',StrArom[10],'     ¦     ',StrArom1[10],'     ¦');
writeln(re,'  ¦  11 ¦',SirArom[11]:6:3,'¦',KatArom0[11]:6:3,'¦',BpArom[11]:6:3,'¦',KatArom[11]:6:3,'¦'
,PentArom[11]:6:3,'¦     ',StrArom[11],'     ¦     ',StrArom1[11],'     ¦');
writeln(re,'  ¦  12 ¦',SirArom[12]:6:3,'¦',KatArom0[12]:6:3,'¦',BpArom[12]:6:3,'¦',KatArom[12]:6:3,'¦'
,PentArom[12]:6:3,'¦     ',StrArom[12],'     ¦     ',StrArom1[12],'     ¦');
writeln(re,'  ¦=====+======+======+======+======+======+================+================¦');
writeln(re,'  ¦Итого¦',SArom:6:3,'¦',KArom0:6:3,'¦',BArom:6:3,'¦',KArom:6:3,'¦',PArom:6:3,'¦     '
,StprArom,'     ¦     ',StprArom1,'     ¦');
writeln(re,'  L=====¦======¦======¦======¦======¦======¦================¦================-');
writeln(re);

              writeln(re);
              writeln(re,'         Распределение компонентов по числу атомов углерода (',Nazvanie,') ');
              writeln(re);
writeln(re,'Число атомов С;Ароматика;;;;;;');
writeln(re,';Сырье;Катализат;Бок.погон;Кат+Б.П;Пент.фр.;Степень превращения, %;Степень образования, %');
writeln(re,'3;',SirArom[3]:6:3,';',KatArom0[3]:6:3,';',BpArom[3]:6:3,';',KatArom[3]:6:3,';',
           PentArom[3]:6:3,';',StrArom[3],';',StrArom1[3]);
writeln(re,'4;',SirArom[4]:6:3,';',KatArom0[4]:6:3,';',BpArom[4]:6:3,';',KatArom[4]:6:3,';',
           PentArom[4]:6:3,';',StrArom[4],';',StrArom1[4]);
writeln(re,'5;',SirArom[5]:6:3,';',KatArom0[5]:6:3,';',BpArom[5]:6:3,';',KatArom[5]:6:3,';',
           PentArom[5]:6:3,';',StrArom[5],';',StrArom1[5]);
writeln(re,'6;',SirArom[6]:6:3,';',KatArom0[6]:6:3,';',BpArom[6]:6:3,';',KatArom[6]:6:3,';',
           PentArom[6]:6:3,';',StrArom[6],';',StrArom1[6]);
writeln(re,'7;',SirArom[7]:6:3,';',KatArom0[7]:6:3,';',BpArom[7]:6:3,';',KatArom[7]:6:3,';',
           PentArom[7]:6:3,';',StrArom[7],';',StrArom1[7]);
writeln(re,'8;',SirArom[8]:6:3,';',KatArom0[8]:6:3,';',BpArom[8]:6:3,';',KatArom[8]:6:3,';',
           PentArom[8]:6:3,';',StrArom[8],';',StrArom1[8]);
writeln(re,'9;',SirArom[9]:6:3,';',KatArom0[9]:6:3,';',BpArom[9]:6:3,';',KatArom[9]:6:3,';',
           PentArom[9]:6:3,';',StrArom[9],';',StrArom1[9]);
writeln(re,'10;',SirArom[10]:6:3,';',KatArom0[10]:6:3,';',BpArom[10]:6:3,';',KatArom[10]:6:3,';',
           PentArom[10]:6:3,';',StrArom[10],';',StrArom1[10]);
writeln(re,'11;',SirArom[11]:6:3,';',KatArom0[11]:6:3,';',BpArom[11]:6:3,';',KatArom[11]:6:3,';',
           PentArom[11]:6:3,';',StrArom[11],';',StrArom1[11]);
writeln(re,'12;',SirArom[12]:6:3,';',KatArom0[12]:6:3,';',BpArom[12]:6:3,';',KatArom[12]:6:3,';',
           PentArom[12]:6:3,';',StrArom[12],';',StrArom1[12]);
writeln(re,'Итого;',SArom:6:3,';',KArom0:6:3,';',BArom:6:3,';',KArom:6:3,';',PArom:6:3,';',
           StprArom,';',StprArom1);
writeln(re);

              close(re);
        end;

end.
