{$O+}{$F+}
   UNIT kol_gr;

      INTERFACE
               uses crt,graph,graphics,kbd,print;

      type
       mass=array [1..1500] of word;
       Mas1=^Mass;
      var
         lmm:string[8];    { Название даты }
         lm:string[22];

         L1,L2,L3:string[2];
         Nomer:Mas1;
         DataDay:Mas1;
         DD:word;
         L_:char;
         i,j,j1,m:integer;

         AktKat:real;        { Активность катализатора       }
         KoksKat:real;       { Кокса на катализаторе         }
         KrekKat:real;       { Число крекинга                }

         Ust:word;
         NUst:string [3];
         SUst:string [40];

         minl1,minl2,minl3,minl11,minl21,minl31:integer;
         select:boolean;
         fil:text;
         DataOtbora,NDataOtbora,KDataOtbora:string [8];

   procedure gopa(PolnoeIma:string;var Put,Gopen:string);
   procedure Interval;
   procedure dan_gr(dan,Nazvanie:string;var cnl:text);
   procedure gr_Akt;
   procedure gr_koks;
   procedure gr_krek;
   procedure gr_dan_perestanovka;

   IMPLEMENTATION



procedure gopa(PolnoeIma:string;var Put,Gopen:string);
       var
         i:integer;
  begin
       i:=Length(PolnoeIma);
       repeat
            i:=i-1;
       until PolnoeIma[i]='\';
       Put:=copy(polnoeima,1,i-1);
       Gopen:=Copy(polnoeima,i+1,13);
       i:=pos('.',Gopen);
       if i<>0 then Gopen:=Copy(Gopen,1,i-1);
  end;




 procedure Interval;
   var f:text;

   begin
        assign(f,'gr_Akt.'+NUst);
        reset(f);
        readln(f,NDataOtbora);
        DataOtbora:='';
        while not(eof(f)) do
          begin
               readln(f,DataOtbora);
          end;
        KDataOtbora:=DataOtbora;
        close(f);
   end;





procedure gr_dan_perestanovka;
    var
     v1,v2,v3:word;
     numer:word;
     tempfile:text;
     stroka:char;
    begin
        new(nomer);new(DataDay);
        reset(fil);
        i:=1;
        while not(eof(fil)) do
          begin
               readln(fil,L1,L_,L2,L_,L3);
               val(L3,V3,code);
               val(L2,V2,code);
               val(L1,V1,code);
               DataDay^[i]:=0;
               DataDay^[i]:=V3*360+V2*30+V1;
               i:=i+1;
          end;
        close(fil);
        for j:=1 to i-1 do
        begin
         Nomer^[j]:=DataDay^[j];
        end;

      for j1:=1 to i-1 do
        for j:=1 to i-2 do
           begin
                if DataDay^[j]>DataDay^[j+1] then
                   begin
                        DD:=DataDay^[j];
                        DataDay^[j]:=DataDay^[j+1];
                        DataDay^[j+1]:=DD;
                   end;

           end;
        numer:=DataDay^[1];
        assign(tempfile,'temp');
        rewrite(tempfile);

        for j1:=1 to i-1 do
        begin
         if j1<>1 then numer:=DataDay^[j1];
         for j:=1 to i-1 do
          begin
           if nomer^[j]=numer then
	    begin
             reset(fil);
              for m:=1 to j-1 do readln(fil,Stroka);
	           while not(eoln(fil)) do
	                begin
	                     read(fil,Stroka);
                	     write(tempfile,Stroka);
	                end;
                   writeln(tempfile);
                   close(fil);
            end;
            end;

        end;
        close(tempfile);
        erase(fil);
        rename(tempfile,'gr_akt.'+NUst);

        Dispose(nomer);Dispose(DataDay);

    end;



   procedure dan_gr(dan,Nazvanie:string;var cnl:text);

      var
         temp:integer;
         save:boolean;
      begin

            assign(fil,'gr_akt.'+NUst);
           {$I-}
           reset(fil);
           temp:=IOResult;
           if temp=0 then
            begin
             save:=true;
             while not(eof(fil)) do
              begin
               readln(fil,lmm);
               if Nazvanie=lmm then save:=false;
              end;
            close(fil);
           end;
          if (save)and(temp=0) then
            begin
             append(fil);
             Writeln(fil,Nazvanie,AktKat:10:4,KoksKat:10:4,KrekKat:10:4);
            close(fil);
           end;
         if (save)and(temp<>0) then
            begin
             rewrite(fil);
             Writeln(fil,Nazvanie,AktKat:10:4,KoksKat:10:4,KrekKat:10:4);
            close(fil);
          end;
   {$I+}

   gr_dan_perestanovka;

   end;





procedure help_Akt;
begin
   textwindow(1,getmaxx-140,0, getmaxx, maxyg+85);
   println(6,'  Данный  график');
   println(6,'                ');
   println(6,'показывает зави-');
   println(6,'                ');
   println(6,'симость   актив-');
   println(6,'                ');
   println(6,'ности  катализа-');
   println(6,'                ');
   println(6,'  тора     от   ');
   println(6,'                ');
   println(6,'отбора данных.  ');
   println(6,'                ');
   println(6,' Все необходимые');
   println(6,'                ');
   println(6,'данные находятся');
   println(6,'                ');
   println(6,'в файле  GR_AKT.');

   textwindow(4,0,getmaxy-30, getmaxx, getmaxy);
   graphics.print(5,'   Esc - ');
   graphics.print(8,'Выход     ');
   graphics.print(5,'F4 - ');
   graphics.print(8,'Индикация математических значений    ');
   graphics.print(5,' Alt-P - ');
   graphics.print(8,'Печать ');
end;


procedure gr_Akt;

 var
    Name:string[8];
    gr,mode:integer;
    i:integer;
    stop:boolean;
  begin
       gr:=0;
       initgraph(gr,mode,'');
       MaximumGraph(1,maximum);

       openstek(1,maximum,sumktek);

       assign(fil,'gr_Akt.'+NUst);
       reset(fil);

       i:=1;
       while not(eof(fil)) do
                      begin
                       readln(fil,Name,AktKat);
                         readdata(1,10,1,I,i,AktKat,'',1,1,10,false);
                         i:=i+1;
                     end;
   graphdata;
   maxxg:=getmaxx-152 {div 2};
   maxyg:=getmaxy-100{-150};
   minxg:=0;minyg:=0;
   graphwindow(minxg,maxxg,minyg,maxyg,7,0,7,0,1,'Рис.                    '+SUst,11);
   graphtext('Изменение активности катализатора',3);
   graphos('В период с '+NDataOtbora+' по '+KDataOtbora,'Активность катализатора , %',3);
   graphica;
   help_Akt;

   stop:=true;
   repeat
   kbd.getkey(key);
    if key.Scan=62 then begin SetLabel; stop:=true; end;
    if key.Scan=1 then stop:=false;
    if key.Scan=25 then
      begin
       save(winxmin,winymin,winxmax,winymax);
       ClearDevice;
       load(winxmin,winymin);
       printscreen;
       help_Akt;
      end;
   until not(stop);

   CloseGraphics;
   closegraph;

 end;





procedure help_koks;
begin
   textwindow(1,getmaxx-140,0, getmaxx, maxyg+85);
   println(6,'  Данный  график');
   println(6,'                ');
   println(6,'показывает зави-');
   println(6,'                ');
   println(6,'симость   содер-');
   println(6,'                ');
   println(6,' жания     кокса');
   println(6,'                ');
   println(6,'на  катализаторе');
   println(6,'                ');
   println(6,'   от    даты   ');
   println(6,'                ');
   println(6,'отбора данных.  ');
   println(6,'                ');
   println(6,' Все необходимые');
   println(6,'                ');
   println(6,'данные находятся');
   println(6,'                ');
   println(6,'в файле  GR_AKT.');

   textwindow(4,0,getmaxy-30, getmaxx, getmaxy);
   graphics.print(5,'   Esc - ');
   graphics.print(8,'Выход     ');
   graphics.print(5,'F4 - ');
   graphics.print(8,'Индикация математических значений    ');
   graphics.print(5,' Alt-P - ');
   graphics.print(8,'Печать ');
end;


procedure gr_koks;

 var
    Name:string[8];
    gr,mode:integer;
    i:integer;
    stop:boolean;
  begin
       gr:=0;
       initgraph(gr,mode,'');
       MaximumGraph(1,maximum);

       openstek(1,maximum,sumktek);

       assign(fil,'gr_Akt.'+NUst);
       reset(fil);

       i:=1;
       while not(eof(fil)) do
                      begin
                       readln(fil,Name,AktKat,KoksKat);
                         readdata(1,10,1,I,i,KoksKat,'',1,1,10,false);
                         i:=i+1;
                     end;
   graphdata;
   maxxg:=getmaxx-152 {div 2};
   maxyg:=getmaxy-100{-150};
   minxg:=0;minyg:=0;
   graphwindow(minxg,maxxg,minyg,maxyg,7,0,7,0,1,'Рис.                    '+SUst,11);
   graphtext('Изменение содержания кокса на катализаторе',3);
   graphos('В период с '+NDataOtbora+' по '+KDataOtbora,'Содержание кокса на катализаторе , % вес.',3);
   graphica;
   help_Koks;

   stop:=true;
   repeat
   kbd.getkey(key);
    if key.Scan=62 then begin SetLabel; stop:=true; end;
    if key.Scan=1 then stop:=false;
    if key.Scan=25 then
      begin
       save(winxmin,winymin,winxmax,winymax);
       ClearDevice;
       load(winxmin,winymin);
       printscreen;
       help_Koks;
      end;
   until not(stop);

   CloseGraphics;
   closegraph;

 end;








procedure help_krek;
begin
   textwindow(1,getmaxx-140,0, getmaxx, maxyg+85);
   println(6,'  Данный  график');
   println(6,'                ');
   println(6,'показывает зави-');
   println(6,'                ');
   println(6,'симость    числа');
   println(6,'                ');
   println(6,'крекинга от даты');
   println(6,'                ');
   println(6,'отбора данных.  ');
   println(6,'                ');
   println(6,' Все необходимые');
   println(6,'                ');
   println(6,'данные находятся');
   println(6,'                ');
   println(6,'в файле  GR_AKT.');

   textwindow(4,0,getmaxy-30, getmaxx, getmaxy);
   graphics.print(5,'   Esc - ');
   graphics.print(8,'Выход     ');
   graphics.print(5,'F4 - ');
   graphics.print(8,'Индикация математических значений    ');
   graphics.print(5,' Alt-P - ');
   graphics.print(8,'Печать ');
end;


procedure gr_krek;

 var
    Name:string[8];
    gr,mode:integer;
    i:integer;
    stop:boolean;
  begin
       gr:=0;
       initgraph(gr,mode,'');
       MaximumGraph(1,maximum);

       openstek(1,maximum,sumktek);

       assign(fil,'gr_Akt.'+NUst);
       reset(fil);

       i:=1;
       while not(eof(fil)) do
                      begin
                       readln(fil,Name,AktKat,KoksKat,KrekKat);
                         readdata(1,10,1,I,i,KrekKat,'',1,1,10,false);
                         i:=i+1;
                     end;
   graphdata;
   maxxg:=getmaxx-152 {div 2};
   maxyg:=getmaxy-100{-150};
   minxg:=0;minyg:=0;
   graphwindow(minxg,maxxg,minyg,maxyg,7,0,7,0,1,'Рис.                    '+SUst,11);
   graphtext('Изменение числа крекинга',3);
   graphos('В период с '+NDataOtbora+' по '+KDataOtbora,'Число крекинга',3);
   graphica;
   help_Krek;

   stop:=true;
   repeat
   kbd.getkey(key);
    if key.Scan=62 then begin SetLabel; stop:=true; end;
    if key.Scan=1 then stop:=false;
    if key.Scan=25 then
      begin
       save(winxmin,winymin,winxmax,winymax);
       ClearDevice;
       load(winxmin,winymin);
       printscreen;
       help_Krek;
      end;
   until not(stop);

   CloseGraphics;
   closegraph;

 end;



 end.

