unit basres5;

interface

               uses basres1,basres2;

   var
    i,f1:integer;
    OKir:array[1..69] of real;

   procedure avtomatik;

   IMPLEMENTATION
   Uses basa_tv;
 {*************************Расчет сырья**************************************}
   procedure avtomatik;
                       begin
                            for i:=1 to 69 do
                               begin
                                    OKir[i]:=0;
                                    KirSir[i]:=0;
                               end;

                            {DisableCommands([cmorezult,cmparrez,
                                             cmiparrez,cmnaf5rez,cmnaf6rez,
                                             cmaromrez,cmorezultkir]);}
                            Form1.OpenDialog1.Filter:='Данные по сырью|*.sir';
                            Form1.OpenDialog1.Execute; {and FileExists(Form1.OpenDialog1.Filename) then}
                            dan:=Form1.OpenDialog1.FileName;

                            gopa{(dan,Puti,Nazvanie)};

                            if dan<>'' then
                                      begin
                                           assignfile(fi,'basa.dat');
                                           assignfile(cnl,dan);
                                           reset(cnl);
                                           rewrite(fi);
                                           while (eof(cnl)=false) do
                                                      begin
                                                           readln(cnl,sss);
                                                           writeln(fi,sss);
                                                      end;
                                           closefile(cnl);
                                           closefile(fi);
                                      end
                                 else exit;

                             rasbasa;


                             assignfile(fff,'trafaret');
                             reset(fff);

                             for i:=1 to 56 do readln(fff,stroka[i]);

                             closefile(fff);
                             assignfile(fff,'rez\'+'prot2');
                             rewrite(fff);
                             for i:=1 to 43 do writeln(fff,stroka[i]);
                             for f1:=3 to 12 do
                             begin
                                  write(fff,'  ');
                                  str(f1:2,simbol1);
                                  write(fff,simbol1);
                                  str(par[f1]:5:2,simbol);
                                  write(fff,l,'   ',simbol);
                                  str(ipar1[f1]:5:2,simbol);
                                  write(fff,l,simbol);
                                  str(naf51[f1]:5:2,simbol);
                                  write(fff,l,simbol);
                                  str(naf61[f1]:5:2,simbol);
                                  write(fff,l,simbol);
                                  str(arom1[f1]:5:2,simbol);
                                  writeln(fff,l,simbol);
                             end;
                             for i:=54 to 56 do writeln(fff,stroka[i]);
                             closefile(fff);
                            { rename(fff,'rez\'+'prot2');}

                             for f1:=3 to 13 do
                                begin
                                     SirPar[f1]:=par[f1];
                                     SirIpar[f1]:=ipar1[f1];
                                     SirNaf5[f1]:=naf51[f1];
                                     SirNaf6[f1]:=naf61[f1];
                                     SirArom[f1]:=arom1[f1];
                                end;

                             SPar:=0;SIpar:=0;SNaf5:=0;SNaf6:=0;SArom:=0;
                             for f1:=3 to 13 do
                                begin
                                     SPar:=SirPar[f1]+SPar;
                                     SIpar:=SirIpar[f1]+SIpar;
                                     SNaf5:=SirNaf5[f1]+SNaf5;
                                     SNaf6:=SirNaf6[f1]+SNaf6;
                                     SArom:=SirArom[f1]+SArom;
                                end;

                            OKir[47]:=SirNaf5[3]+SirNaf5[4]+SirNaf5[5]+
                                      SirNaf5[6]+SirNaf5[7]+SirNaf5[8]+
                                      SirNaf6[3]+SirNaf6[4]+SirNaf6[5]+
                                      SirNaf6[6]+SirNaf6[7]+SirNaf6[8]-
                                      OKir[8]-OKir[13]-OKir[19]-OKir[23]
                                      -OKir[24]-OKir[25]-
                                      OKir[27]-OKir[29]-OKir[30]-OKir[33]-
                                      OKir[35]-OKir[38]-OKir[42]-
                                      OKir[49]-OKir[50]{-OKir[59]}-
                                      OKir[60];

                            OKir[64]:=SirIpar[9]-OKir[51]-OKir[52]-OKir[53]
                                      -OKir[54]-OKir[55]-OKir[56]
                                      -OKir[57]-OKir[58]-OKir[61] ;

                            OKir[66]:=SirNaf5[9]+SirNaf6[9];

                            OKir[68]:=SirPar[9]+SirPar[10]+SirPar[11]+
                                      SirPar[12]+SirPar[13]+
                                      SirIpar[9]+SirIpar[10]+SirIpar[11]+
                                      SirIpar[12]+SirIpar[13]+
                                      SirNaf5[9]+SirNaf5[10]+SirNaf5[11]+
                                      SirNaf5[12]+SirNaf5[13]+
                                      SirNaf6[9]+SirNaf6[10]+SirNaf6[11]+
                                      SirNaf6[12]+SirNaf6[13]
                                      -OKir[51]-OKir[52]-OKir[53]
                                      -OKir[54]-OKir[55]-OKir[56]
                                      -OKir[57]-OKir[58]-OKir[61]
                                      -OKir[64]-OKir[66];

                            OKir[69]:=SirArom[9]+SirArom[10]+SirArom[11]+
                                      SirArom[12]+SirArom[13];
                            OKir[68]:=OKir[68]+OKir[69];


                            for i:=1 to 69 do
                               begin
                                    KirSir[i]:=OKir[i];
                               end;

                  {EnableCommands([cmrezult,cmrezultkir]);}
//                  EnableCommands([cmraskat]);
  //                DisableCommands([cmrassir]);
{***************************************************************************}
   end;

end.
