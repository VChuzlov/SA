unit basa_tv;

interface

uses basres2,Unitb2, Unitb3, Unitb4, basa, ChekSub;
type
  cena=array[1..70] of extended;
   initdata=record
    l:integer;
    c:cena;
   end;
CONST
  l='       ';
VAR
   dt:initdata;
   aia,aiaaa:double;
   InitPath,dan,sss:string;
   cnl,fi:text;
   FileToOpen:Text;
   f1,i,dlina:integer;
   q,q1:char;
   q3,q5:integer;
   q4,simbol1:string[2];
   n,simbol:string[5];
   stroka: array [1..56] of string;
   ivan:string[21];
   f2:string[3];
   f,ff,fff:text;
   file1:file;
   name,ima:string[42];
   c:array[1..350] of double;
   stop:boolean;
   SirPar,KatPar0,KatPar,BpPar,PentPar:array [3..13] of double;
   SirIpar,KatIpar0,KatIpar,BpIpar,PentIpar:array [3..13] of double;
   SirNaf5,KatNaf50,KatNaf5,BpNaf5,PentNaf5:array [3..13] of double;
   SirNaf6,KatNaf60,KatNaf6,BpNaf6,PentNaf6:array [3..13] of double;
   SirArom,KatArom0,KatArom,BpArom,PentArom:array [3..13] of double;
   par,ipar,naf5,naf6,arom:array[3..13] of double;
   ipar1,naf51,naf61,arom1:array[3..13] of double;
   SPar,SIpar,SNaf5,SNaf6,SArom:double;
   KPar0,KIpar0,KNaf50,KNaf60,KArom0:double;
   KPar,KIpar,KNaf5,KNaf6,KArom:double;
   BPar,BIpar,BNaf5,BNaf6,BArom:double;
   PPar,PIpar,PNaf5,PNaf6,PArom:double;
   sum,sum1:double;
   Tn1,Tn2,Tn3,Tn4,Tk1,Tk2,Tk3,Tk4,dT1,dT2,dT3,dT4:double;
   parafin,izoparafin,naften5,naften6,aromatika:double;
   parafin1,izoparafin1,naften51,naften61,aromatika1:double;
   PolnoeIma,Put,Gopen:string;
   OKir:array[1..69] of double;
   Puti,Nazvanie:string;
   DirData,flName:string;
   DiskDirData:byte;
procedure gopa;
procedure rasbasa;
procedure BasaMake;
procedure N6Click;
procedure N7Click;
//procedure N8Click;
procedure N9Click;
//procedure N11Click;
procedure N12Click;
implementation

procedure gopa;
var
 i:integer;
begin
     Polnoeima:=dan;
     i:=Length(PolnoeIma);
      repeat
       i:=i-1;
      until PolnoeIma[i]='\';
     Gopen:=Copy(polnoeima,i+1,13);
     Polnoeima:=Copy(Polnoeima,1,i-1);
     flName:=Gopen;
      repeat
       i:=i-1;
      until Polnoeima[i]='\';
     Put:=Copy(polnoeima,1,i-1);
     i:=pos('.',Gopen);
     if i<>0 then Gopen:=Copy(Gopen,1,i-1);
end;
procedure rasbasa;
var pos:integer;
    z:char;
begin
     for f1:=3 to 13 do
       begin
         par[f1]:=0;ipar[f1]:=0;naf5[f1]:=0;naf6[f1]:=0;
         arom[f1]:=0;ipar1[f1]:=0;naf51[f1]:=0;naf61[f1]:=0;
         arom1[f1]:=0;
       end;
     sum:=0;sum1:=0;parafin:=0;izoparafin:=0;naften5:=0;
     naften6:=0;aromatika:=0;parafin1:=0;izoparafin1:=0;
     naften51:=0;naften61:=0;aromatika1:=0;
     For i:=1 to 69 do OKir[i]:=0;
     i:=0;
     AssignFile(fI,InitPath+'\basa.dat');
     Reset(fi);
     while not eof(fi) do
         begin
           i:=i+1;
           readln(fi,ima,c[i]);
           stop:=false;

     if ima='Ethane                                    'then OKir[1]:=c[i] else
     if ima='Propane                                   'then begin OKir[2]:=OKir[2]+c[i]; Par[3]:=Par[3]+c[i] end else
     if ima='i-Butane                                  'then begin IPar[4]:=IPar[4]+c[i]; OKir[3]:=OKir[3]+c[i] end else
     if ima='n-Butane                                  'then begin Par[4]:=Par[4]+c[i]; OKir[4]:=OKir[4]+c[i] end else
     if ima='i-Pentane                                 'then begin IPar[5]:=IPar[5]+c[i]; OKir[5]:=OKir[5]+c[i] end else
     if ima='n-Pentane                                 'then begin Par[5]:=Par[5]+c[i]; OKir[6]:=c[i]+OKir[6] end else
     if ima='2,2-Dimethylbutane                        'then begin IPar[6]:=IPar[6]+c[i]; OKir[7]:=c[i]+OKir[7] end else
     if ima='Cyclopentane                              'then begin Naf5[5]:=Naf5[5]+c[i]; OKir[8]:=c[i]+OKir[8] end else
     if ima='2,3-Dimethylbutane                        'then begin IPar[6]:=IPar[6]+c[i]; OKir[9]:=c[i]+OKir[9] end else
     if ima='2-Methylpentane                           'then begin IPar[6]:=IPar[6]+c[i]; OKir[10]:=c[i]+OKir[10] end else
     if ima='3-Methylpentane                           'then begin IPar[6]:=IPar[6]+c[i]; OKir[11]:=c[i]+OKir[11] end else
     if ima='n-Hexane                                  'then begin Par[6]:=Par[6]+c[i]; OKir[12]:=c[i]+OKir[12] end else
     if ima='Methylcyclopentane                        'then begin Naf5[6]:=Naf5[6]+c[i]; OKir[13]:=c[i]+OKir[13] end else
     if ima='2,2-Dimethylpentane                       'then begin IPar[7]:=IPar[7]+c[i]; OKir[14]:=c[i]+OKir[14] end else
     if ima='2,4-Dimethylpentane                       'then begin IPar[7]:=IPar[7]+c[i]; OKir[15]:=c[i]+OKir[15] end else
     if ima='Benzene                                   'then begin Arom[6]:=Arom[6]+c[i]; OKir[16]:=c[i]+OKir[16] end else
     if ima='2,2,3-Trimethylbutane                     'then begin IPar[7]:=IPar[7]+c[i]; OKir[17]:=c[i]+OKir[17] end else
     if ima='3,3-Dimethylpentane                       'then begin IPar[7]:=IPar[7]+c[i]; OKir[18]:=c[i]+OKir[18] end else
     if ima='Cyclohexane                               'then begin Naf6[6]:=Naf6[6]+c[i]; OKir[19]:=c[i]+OKir[19] end else
     if ima='2-Methylhexane                            'then begin IPar[7]:=IPar[7]+c[i]; OKir[20]:=c[i]+OKir[20] end else
           if ima='2,3-Dimethylpentane                       '
              then begin IPar[7]:=IPar[7]+c[i]; OKir[21]:=c[i]+OKir[21] end else
           if ima='3-Methylhexane                            '
              then begin IPar[7]:=IPar[7]+c[i]; OKir[22]:=c[i]+OKir[22] end else
           if ima='1c,3-Dimethylcyclopentane                 '
              then begin Naf5[7]:=Naf5[7]+c[i]; OKir[23]:=c[i]+OKir[23] end else
           if ima='1t,3-Dimethylcyclopentane                 '
              then begin Naf5[7]:=Naf5[7]+c[i]; OKir[24]:=c[i]+OKir[24] end else
           if ima='1t,2-Dimethylcyclopentane                 '
              then begin Naf5[7]:=Naf5[7]+c[i]; OKir[25]:=c[i]+OKir[25] end else
           if ima='n-Heptane                                 '
              then begin Par[7]:=Par[7]+c[i]; OKir[26]:=c[i]+OKir[26] end else
           if ima='1c,2-Dimethylcyclopentane                 '
              then begin Naf5[7]:=Naf5[7]+c[i]; OKir[27]:=c[i]+OKir[27] end else
           if ima='2,2-Dimethylhexane                        '
              then begin IPar[8]:=IPar[8]+c[i]; OKir[28]:=c[i]+OKir[28] end else
           if ima='1,1,3-Trimethylcyclopentane               '
              then begin Naf5[8]:=Naf5[8]+c[i]; OKir[29]:=c[i]+OKir[29] end else
           if ima='Methylcyclohexane                         '
              then begin Naf6[7]:=Naf6[7]+c[i]; OKir[30]:=c[i]+OKir[30] end else
           if ima='2,5-Dimethylhexane                        '
              then begin IPar[8]:=IPar[8]+c[i]; OKir[31]:=c[i]+OKir[31] end else
           if ima='2,4-Dimethylhexane                        '
              then begin IPar[8]:=IPar[8]+c[i]; OKir[32]:=c[i]+OKir[32] end else
           if ima='Ethylcyclopentane                         '
              then begin Naf5[7]:=Naf5[7]+c[i]; OKir[33]:=c[i]+OKir[33] end else
           if ima='2,2,3-Trimethylpentane                    '
              then begin IPar[8]:=IPar[8]+c[i]; OKir[34]:=c[i]+OKir[34] end else
           if ima='1,2,4-Trimethylcyclopentane               '
              then begin Naf5[8]:=Naf5[8]+c[i]; OKir[35]:=c[i]+OKir[35] end else
           if ima='3,3-Dimethylhexane                        '
              then begin IPar[8]:=IPar[8]+c[i]; OKir[36]:=c[i]+OKir[36] end else
           if ima='Toluene                                   '
              then begin Arom[7]:=Arom[7]+c[i]; OKir[37]:=c[i]+OKir[37] end else
           if ima='1,2,3-Trimethylcyclopentane               '
              then begin Naf5[8]:=Naf5[8]+c[i]; OKir[38]:=c[i]+OKir[38] end else
           if ima='2,3,4-Trimethylpentane                    '
              then begin IPar[8]:=IPar[8]+c[i]; OKir[39]:=c[i]+OKir[39] end else
           if ima='2,3-Dimethylhexane                        '
              then begin IPar[8]:=IPar[8]+c[i]; OKir[40]:=c[i]+OKir[40] end else
           if ima='2-Methyl-3-ethylpentane                   '
              then begin IPar[8]:=IPar[8]+c[i]; OKir[41]:=c[i]+OKir[41] end else
           if ima='1,1,2-Trimethylcyclopentane               '
              then begin Naf5[8]:=Naf5[8]+c[i]; OKir[42]:=c[i]+OKir[42] end else
           if ima='2-Methylheptane                           '
              then begin IPar[8]:=IPar[8]+c[i]; OKir[43]:=c[i]+OKir[43] end else
           if ima='4-Methylheptane                           '
              then begin IPar[8]:=IPar[8]+c[i]; OKir[44]:=c[i]+OKir[44] end else
           if ima='3,4-Dimethylhexane                        '
              then begin IPar[8]:=IPar[8]+c[i]; OKir[45]:=c[i]+OKir[45] end else
           if ima='3-Methylheptane                           '
              then begin IPar[8]:=IPar[8]+c[i]; OKir[46]:=c[i]+OKir[46] end else
           if ima='n-Octane                                  '
              then begin Par[8]:=Par[8]+c[i]; OKir[48]:=c[i]+OKir[48] end else
           if ima='1t,2-Dimethylcyclohexane                  '
              then begin Naf6[8]:=Naf6[8]+c[i]; OKir[49]:=c[i]+OKir[49] end else
           if ima='1t,3-Dimethylcyclohexane                  '
              then begin Naf6[8]:=Naf6[8]+c[i]; OKir[50]:=c[i]+OKir[50] end else
           if ima='2,3,5-Trimethylhexane                     '
              then begin IPar[9]:=IPar[9]+c[i]; OKir[51]:=c[i]+OKir[51] end else
           if ima='2,2-Dimethylheptane                       '
              then begin IPar[9]:=IPar[9]+c[i]; OKir[52]:=c[i]+OKir[52] end else
           if ima='2,4-Dimethylheptane                       '
              then begin IPar[9]:=IPar[9]+c[i]; OKir[53]:=c[i]+OKir[53] end else
           if ima='2,2,3-Trimethylhexane                     '
              then begin IPar[9]:=IPar[9]+c[i]; OKir[54]:=c[i]+OKir[54] end else
           if ima='2-Methyl-4-ethylhexane                    '
              then begin IPar[9]:=IPar[9]+c[i]; OKir[55]:=c[i]+OKir[55] end else
           if ima='2,6-Dimethylheptane                       '
              then begin IPar[9]:=IPar[9]+c[i]; OKir[56]:=c[i]+OKir[56] end else
           if ima='2,5-Dimethylheptane                       '
              then begin IPar[9]:=IPar[9]+c[i]; OKir[57]:=c[i]+OKir[57] end else
           if ima='3,3-Dimethylheptane                       '
              then begin IPar[9]:=IPar[9]+c[i]; OKir[58]:=c[i]+OKir[58] end else

           if ima='Ethylcyclohexane                          '
              then begin Naf6[8]:=Naf6[8]+c[i]; OKir[59]:=OKir[59]+c[i] end else
           if ima='Ethylbenzene                              '
              then begin Arom[8]:=Arom[8]+c[i]; OKir[59]:=OKir[59]+c[i] end else

           if ima='Trimethylcyclopentane                     '
              then begin Naf5[8]:=Naf5[8]+c[i]; OKir[60]:=c[i]+OKir[60] end else
           if ima='2,3,4-Trimethylhexane                     '
              then begin IPar[9]:=IPar[9]+c[i]; OKir[61]:=c[i]+OKir[61] end else
           if ima='p-Xylene                                  '
              then begin Arom[8]:=Arom[8]+c[i]; OKir[62]:=c[i]+OKir[62] end else
           if ima='m-Xylene                                  '
              then begin Arom[8]:=Arom[8]+c[i]; OKir[63]:=c[i]+OKir[63] end else
           if ima='o-Xylene                                  '
              then begin Arom[8]:=Arom[8]+c[i]; OKir[65]:=c[i]+OKir[65] end else
           if ima='n-Nonane                                  '
              then begin Par[9]:=Par[9]+c[i]; OKir[67]:=c[i]+OKir[67] end else
      begin
      for f1:=4 to 13 do
       begin
         str(f1,f2);
         AssignFile(f,InitPath+'\ipar.'+f2);
         Reset(f);
          if stop=false then
           while (not eof(f)) do
            begin
              readln(f,pos,z,name);
               if name=ima then
                begin
                  OKir[pos]:=OKir[pos]+c[i];
                  ipar[f1]:=ipar[f1]+c[i];
                  stop:=True;
                end;
            end;
         CloseFile(f);
       end;

      for f1:=3 to 13 do
        begin
          str(f1,f2);
          AssignFile(f,InitPath+'\par.'+f2);
          Reset(f);
           if stop=false then
             while (not eof(f)) do
               begin
                readln(f,pos,z,name);
                 if name=ima then
                  begin
                    OKir[pos]:=OKir[pos]+c[i];
                    par[f1]:=par[f1]+c[i];
                    stop:=True;
                  end;
               end;
          CloseFile(f);
        end;


     for f1:=5 to 13 do
      begin
        str(f1,f2);
        AssignFile(f,InitPath+'\naf5.'+f2);
        Reset(f);
         if stop=false then
          while (not eof(f)) do
           begin
             readln(f,pos,z,name);
              if name=ima then
               begin
                 OKir[pos]:=OKir[pos]+c[i];
                 naf5[f1]:=naf5[f1]+c[i];
                 stop:=True;
               end;
           end;
        CloseFile(f);
      end;

   for f1:=6 to 13 do
    begin
      str(f1,f2);
      AssignFile(f,InitPath+'\naf6.'+f2);
      Reset(f);
       if stop=false then
        while (not eof(f)) do
         begin
           readln(f,pos,z,name);
            if name=ima then
             begin
               OKir[pos]:=OKir[pos]+c[i];
               naf6[f1]:=naf6[f1]+c[i];
               stop:=True;
             end;
         end;
      CloseFile(f);
    end;

   for f1:=6 to 13 do
    begin
      str(f1,f2);
      AssignFile(f,InitPath+'\arom.'+f2);
      Reset(f);
      if stop=false then
       while (not eof(f)) do
        begin
          readln(f,pos,z,name);
          if name=ima then
           begin
             OKir[pos]:=OKir[pos]+c[i];
             arom[f1]:=arom[f1]+c[i];
             stop:=True;
           end;
        end;
      CloseFile(f);
    end;

   AssignFile(f,InitPath+'\nlo');
      Reset(f);
       if stop=false then
         while (not eof(f)) do
           begin
             readln(f,name);
              if name=ima then  stop:=True;
           end;
      CloseFile(f);


    if stop=False then
               begin
                   formb2.label2.caption:=ima;
                   formb2.ShowModal;
                   If formb2.ModalResult=6 then
                    begin
                    formb3.ShowModal;
                    formb4.showmodal;
             case q3 of
             1: begin
                pos:=AddSub.FindName(ima,InitPath+'\pars.'+q4);
                OKir[pos]:=OKir[pos]+c[i];
                AssignFile(f,InitPath+'\par.'+q4);
                par[q5]:=par[q5]+c[i]
                end;
             2: begin
                pos:=AddSub.FindName(ima,InitPath+'\ipars.'+q4);
                OKir[pos]:=OKir[pos]+c[i];
                AssignFile(f,InitPath+'\ipar.'+q4);
                ipar[q5]:=ipar[q5]+c[i]
                end;
             3: begin
                pos:=AddSub.FindName(ima,InitPath+'\naf5s.'+q4);
                OKir[pos]:=OKir[pos]+c[i];
                AssignFile(f,InitPath+'\naf5.'+q4);
                naf5[q5]:=naf5[q5]+c[i]
                end;
             4: begin
                pos:=AddSub.FindName(ima,InitPath+'\naf6s.'+q4);
                OKir[pos]:=OKir[pos]+c[i];
                AssignFile(f,InitPath+'\naf6.'+q4);
                naf6[q5]:=naf6[q5]+c[i]
                end;
             5: begin
                pos:=AddSub.FindName(ima,InitPath+'\aroms.'+q4);
                OKir[pos]:=OKir[pos]+c[i];
                AssignFile(f,InitPath+'\arom.'+q4);
                arom[q5]:=arom[q5]+c[i]
                end;
             end;
          Append(f);
          writeln(f,pos,' ',ima);
          closefile(f);
                      end;
              end;
            end;
      end;
    closefile(fi);
    for f1:=3 to 13 do
       begin
            parafin:=parafin+par[f1];
            izoparafin:=izoparafin+ipar[f1];
            naften5:=naften5+naf5[f1];
            naften6:=naften6+naf6[f1];
            aromatika:=aromatika+arom[f1];
       end;
    sum:=parafin+izoparafin+naften5+naften6+aromatika;
    for f1:=3 to 13 do
      begin
           ipar1[f1]:=ipar[f1]*(100-parafin)/(sum-parafin);
           naf51[f1]:=naf5[f1]*(100-parafin)/(sum-parafin);
           naf61[f1]:=naf6[f1]*(100-parafin)/(sum-parafin);
           arom1[f1]:=arom[f1]*(100-parafin)/(sum-parafin);
      end;
    for f1:=3 to 13 do
       begin
            parafin1:=parafin1+par[f1];
            izoparafin1:=izoparafin1+ipar1[f1];
            naften51:=naften51+naf51[f1];
            naften61:=naften61+naf61[f1];
            aromatika1:=aromatika1+arom1[f1];
       end;
    sum1:=parafin1+izoparafin1+naften51+naften61+aromatika1;
    erase(fi);
    stop:=true;
end;
procedure N6Click;
begin
     for i:=1 to 69 do
      begin
        OKir[i]:=0;
        KirSir[i]:=0;
      end;
        dan:=Putb+'\'+DataOt+FileRas[1];
        gopa;
        assignfile(fi,InitPath+'\basa.dat');
        assignfile(cnl,dan);
        try
        reset(cnl);
        rewrite(fi);
         while (eof(cnl)=false) do
          begin
            readln(cnl,sss);
            writeln(fi,sss);
          end;
        finally
        closefile(cnl);
        closefile(fi);
        end;
        rasbasa;
     assignfile(fff,InitPath+'\trafaret');
     reset(fff);
     for i:=1 to 56 do readln(fff,stroka[i]);
     closefile(fff);
     for f1:=3 to 13 do
      begin
        SirPar[f1]:=par[f1];
        SirIpar[f1]:=ipar[f1];
        SirNaf5[f1]:=naf5[f1];
        SirNaf6[f1]:=naf6[f1];
        SirArom[f1]:=arom[f1];
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
{     OKir[3]:=SirIPar[4];
     OKir[4]:=SirPar[4];
     OKir[5]:=SirIpar[5];
     OKir[6]:=SirPar[5];
     OKir[12]:=SirPar[6];
     OKir[26]:=SirPar[7];
     OKir[48]:=SirPar[8];
     OKir[67]:=SirPar[9];}
     OKir[47]:=SirNaf5[5]+
       SirNaf5[6]+SirNaf5[7]+SirNaf5[8]+
       SirNaf6[6]+SirNaf6[7]+SirNaf6[8]-
       OKir[8]-OKir[13]-OKir[19]-OKir[23]
       -OKir[24]-OKir[25]-
       OKir[27]-OKir[29]-OKir[30]-OKir[33]-
       OKir[35]-OKir[38]-OKir[42]-
       OKir[49]-OKir[50]-(OKir[59]-SirArom[8]+OKir[62]+OKir[63]+OKir[65])-
       OKir[60];

     OKir[64]:=SirIpar[9]-OKir[51]-OKir[52]-OKir[53]
       -OKir[54]-OKir[55]-OKir[56]
       -OKir[57]-OKir[58]-OKir[61] ;

     OKir[66]:=SirNaf5[9]+SirNaf6[9];

     OKir[68]:=SirPar[10]+SirPar[11]+
       SirPar[12]+SirPar[13]+
       SirIpar[10]+SirIpar[11]+
       SirIpar[12]+SirIpar[13]+
       {SirNaf5[9]+}SirNaf5[10]+SirNaf5[11]+
       SirNaf5[12]+SirNaf5[13]+
       {SirNaf6[9]+}SirNaf6[10]+SirNaf6[11]+
       SirNaf6[12]+SirNaf6[13]
       {-OKir[51]-OKir[52]-OKir[53]
       -OKir[54]-OKir[55]-OKir[56]
       -OKir[57]-OKir[58]-OKir[61]
       -OKir[66]};

     OKir[69]:=SirArom[9]+SirArom[10]+SirArom[11]+
       SirArom[12]+SirArom[13];
     OKir[68]:=OKir[68]+OKir[69];

     for i:=1 to 69 do KirSir[i]:=OKir[i];

end;
procedure N7Click;
begin
     for i:=1 to 69 do
      begin
        OKir[i]:=0;
        KirKat[i]:=0;
      end;
      dan:=Putb+'\'+DataOt+FileRas[2];
         AssignFile(fi,InitPath+'\basa.dat');
         AssignFile(cnl,dan);
         reset(cnl);
         rewrite(fi);
         while (eof(cnl)=false) do
          begin
            readln(cnl,sss);
            writeln(fi,sss);
          end;
        CloseFile(cnl);
        CloseFile(fi);
        rasbasa;
     for f1:=3 to 13 do
      begin
        KatPar0[f1]:=par[f1];
        KatIpar0[f1]:=ipar[f1];
        KatNaf50[f1]:=naf5[f1];
        KatNaf60[f1]:=naf6[f1];
        KatArom0[f1]:=arom[f1];
      end;

     KPar0:=0;KIpar0:=0;KNaf50:=0;KNaf60:=0;KArom0:=0;

     for f1:=3 to 13 do
      begin
        KPar0:=KatPar0[f1]+KPar0;
        KIpar0:=KatIpar0[f1]+KIpar0;
        KNaf50:=KatNaf50[f1]+KNaf50;
        KNaf60:=KatNaf60[f1]+KNaf60;
        KArom0:=KatArom0[f1]+KArom0;
      end;
     for f1:=3 to 13 do
      begin
        KatPar[f1]:=par[f1];
        KatIpar[f1]:=ipar1[f1];
        KatNaf5[f1]:=naf51[f1];
        KatNaf6[f1]:=naf61[f1];
        KatArom[f1]:=arom1[f1];
      end;
     KPar:=0;KIpar:=0;KNaf5:=0;KNaf6:=0;KArom:=0;
     for f1:=3 to 13 do
      begin
        KPar:=KatPar[f1]+KPar;
        KIpar:=KatIpar[f1]+KIpar;
        KNaf5:=KatNaf5[f1]+KNaf5;
        KNaf6:=KatNaf6[f1]+KNaf6;
        KArom:=KatArom[f1]+KArom;
      end;
      OKir[47]:=KatNaf5[5]+
       KatNaf5[6]+KatNaf5[7]+KatNaf5[8]+
       KatNaf6[6]+KatNaf6[7]+KatNaf6[8]-
       OKir[8]-OKir[13]-OKir[19]-OKir[23]
       -OKir[24]-OKir[25]-
       OKir[27]-OKir[29]-OKir[30]-OKir[33]-
       OKir[35]-OKir[38]-OKir[42]-
       OKir[49]-OKir[50]-(OKir[59]-KatArom[8]+OKir[62]+OKir[63]+OKir[65])-
       OKir[60];

     OKir[64]:=KatIpar[9]-OKir[51]-OKir[52]-OKir[53]
       -OKir[54]-OKir[55]-OKir[56]
       -OKir[57]-OKir[58]-OKir[61] ;

     OKir[66]:=KatNaf5[9]+KatNaf6[9];

     OKir[68]:=KatPar[10]+KatPar[11]+
       KatPar[12]+KatPar[13]+
       KatIpar[10]+KatIpar[11]+
       KatIpar[12]+KatIpar[13]+
       {KatNaf5[9]+}KatNaf5[10]+KatNaf5[11]+
       KatNaf5[12]+KatNaf5[13]+
       {KatNaf6[9]+}KatNaf6[10]+KatNaf6[11]+
       KatNaf6[12]+KatNaf6[13]
       {-OKir[51]-OKir[52]-OKir[53]
       -OKir[54]-OKir[55]-OKir[56]
       -OKir[57]-OKir[58]-OKir[61]
       -OKir[66]};

     OKir[69]:=KatArom[9]+KatArom[10]+KatArom[11]+
       KatArom[12]+KatArom[13];
     OKir[68]:=OKir[68]+OKir[69];

     for i:=1 to 69 do KirKat[i]:=OKir[i];
end;
procedure N9Click;
begin
    for i:=1 to 69 do
     begin
      OKir[i]:=0;
      KirBp[i]:=0;
     end;
      dan:=Putb+'\'+DataOt+FileRas[3];
        assignfile(fi,InitPath+'\basa.dat');
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
        rasbasa;
    for f1:=3 to 13 do
     begin
       BpPar[f1]:=par[f1];
       BpIpar[f1]:=ipar[f1];
       BpNaf5[f1]:=naf5[f1];
       BpNaf6[f1]:=naf6[f1];
       BpArom[f1]:=arom[f1];
     end;
    BPar:=0;BIpar:=0;BNaf5:=0;BNaf6:=0;BArom:=0;
    for f1:=3 to 13 do
     begin
       BPar:=BpPar[f1]+BPar;
       BIpar:=BpIpar[f1]+BIpar;
       BNaf5:=BpNaf5[f1]+BNaf5;
       BNaf6:=BpNaf6[f1]+BNaf6;
       BArom:=BpArom[f1]+BArom;
     end;

     OKir[47]:=BpNaf5[5]+
       BpNaf5[6]+BpNaf5[7]+BpNaf5[8]+
       BpNaf6[6]+BpNaf6[7]+BpNaf6[8]-
       OKir[8]-OKir[13]-OKir[19]-OKir[23]
       -OKir[24]-OKir[25]-
       OKir[27]-OKir[29]-OKir[30]-OKir[33]-
       OKir[35]-OKir[38]-OKir[42]-
       OKir[49]-OKir[50]-(OKir[59]-BpArom[8]+OKir[62]+OKir[63]+OKir[65])-
       OKir[60];

     OKir[64]:=BpIpar[9]-OKir[51]-OKir[52]-OKir[53]
       -OKir[54]-OKir[55]-OKir[56]
       -OKir[57]-OKir[58]-OKir[61] ;

     OKir[66]:=BpNaf5[9]+BpNaf6[9];

     OKir[68]:=BpPar[10]+BpPar[11]+
       BpPar[12]+BpPar[13]+
       BpIpar[10]+BpIpar[11]+
       BpIpar[12]+BpIpar[13]+
       {BpNaf5[9]+}BpNaf5[10]+BpNaf5[11]+
       BpNaf5[12]+BpNaf5[13]+
       {BpNaf6[9]+}BpNaf6[10]+BpNaf6[11]+
       BpNaf6[12]+BpNaf6[13]
       {-OKir[51]-OKir[52]-OKir[53]
       -OKir[54]-OKir[55]-OKir[56]
       -OKir[57]-OKir[58]-OKir[61]
       -OKir[66]};

     OKir[69]:=BpArom[9]+BpArom[10]+BpArom[11]+
       BpArom[12]+BpArom[13];
    OKir[68]:=OKir[68]+OKir[69];
    for i:=1 to 69 do
     begin
       KirBp[i]:=OKir[i];
     end;
end;
procedure N12Click;
begin
     G:=Gk1*Pk+Gbp*Pbp;
     for i:=1 to 69 do
      begin
        KirKatK[i]:=Gk1*Pk/G*KirKat[i]+((Gbp*Pbp)/G)*KirBp[i];
      end;
     rezultkir1(Nazvanie);
end;

procedure BasaMake;
begin
N6Click;
N7Click;
If Gbp<>0 then N9Click;
N12Click;
end;

end.
