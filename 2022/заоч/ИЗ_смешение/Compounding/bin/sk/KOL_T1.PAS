{$O+}{$F+}
   UNIT kol_t1;

      INTERFACE
               uses crt,graph,graphics,kbd,print,kol_gr;

      type Massiv= array [1..100] of integer;

      var
         Name:string[8];
         gr,mode:integer;
         i,i1,i2:integer;
         stop:boolean;
         StopShow:boolean;
         List:^Massiv;
         NumberList:^integer;
         StopTab:boolean;
         Max:^real;


         s1,s2,s11,s22:string[10];
         s3:string[3];       {номер листа}
         s4:string[3];    {номер компонента}
         N,O:integer;

   procedure table_Akt;
   procedure table_Koks;
   procedure table_Krek;
   procedure PrintTable;
   procedure MenuFirst;
   procedure MenuMain;
   procedure MenuEnd;
   procedure MenuNo;

   IMPLEMENTATION





procedure PrintTable;
      begin
       setviewport(0,0,getmaxx,getmaxy,true);
       save(0,getmaxy-30,getmaxx,getmaxy);
       setcolor(0);
       textwindow(0,0,getmaxy-33,getmaxx,getmaxy);
       printscreen;
       load(0,getmaxy-30);
      end;
procedure MenuFirst;
begin
   if NumberList^=1 then ShowLineDown(1,0,0,'~Esc -~ Выход   ~Alt-P -~ Печать ',5,8)
   else ShowLineDown(1,0,0,'~Esc -~ Выход               '+chr(25)+' ~-~ Следующий лист                 ~Alt-P -~ Печать ',5,8);
   StopShow:=false;
   stop:=true;
   repeat
   kbd.getkey(key);
    if key.Scan=1 then begin stop:=false;StopTab:=true;end;
    if key.Scan=80 then
     begin stop:=false;close(fil);i1:=1;
           if NumberList^=1 then i:=i else i:=i+1; reset(fil);end;
    if key.Scan=25 then PrintTable;
   until not(stop);
end;
procedure MenuMain;
begin
ShowLineDown(1,0,0,'~Esc -~ Выход     '+chr(25)+
                   ' ~-~ Следующий лист    '+chr(24)+
                   ' ~-~ Предыдущий лист     ~Alt-P -~ Печать ',5,8);
   StopShow:=false;
   stop:=true;
   repeat
   kbd.getkey(key);
    if key.Scan=1 then begin stop:=false;StopTab:=true;end;
    if key.Scan=72 then begin close(fil);i:=i-1;i1:=1;reset(fil);stop:=false;end;
    if key.Scan=80 then begin close(fil);i:=i+1;i1:=1;reset(fil);stop:=false;end;
    if key.Scan=25 then PrintTable
   until not(stop);
end;
procedure MenuEnd;
begin
   ShowLineDown(1,0,0,'   ~Esc -~ Выход           '+chr(24)+' ~-~ Предыдущий лист            ~Alt-P -~ Печать ',5,8);
   StopShow:=false;
   stop:=true;
   repeat
   kbd.getkey(key);
    if key.Scan=1 then begin stop:=false;StopTab:=true;end;
    if key.Scan=72 then begin stop:=false;close(fil);i1:=1;i:=i-1; reset(fil);end;
    if key.Scan=25 then PrintTable;
   until not(stop);
end;
procedure MenuNo;
begin
   ShowLineDown(1,0,0,'   ~Esc -~ Выход                                            ~Alt-P -~ Печать ',5,8);
   StopShow:=false;
   stop:=true;
   repeat
   kbd.getkey(key);
    if key.Scan=1 then begin stop:=false;StopTab:=true;end;
    if key.Scan=25 then PrintTable;
   until not(stop);
end;


procedure table_Akt;

  begin
   new(List);new(NumberList);new(Max);
   gr:=0;initgraph(gr,mode,''); assign(fil,'gr_Akt.'+NUst);reset(fil);
   j:=0;StopShow:=false;
   while not(eof(fil)) do begin j:=j+1; readln(fil); end;close(fil);
   for i:=1 to 100 do List^[i]:=0;NumberList^:=trunc(j/15);Max^:=j/15;
   if Max^>NumberList^ then NumberList^:=NumberList^+1;
   dispose(Max);Max:=nil;
   for i:=1 to NumberList^ do List^[i]:=i;
   textwindow(1,40,20,getmaxx-40,getmaxy-50);
   TextSmoothOn;
   println(4,''); println(4,'  Изменение активности катализатора от даты отбора данных.');println(6,'');
   SetViewPort(0, 0, GetMaxX, GetMaxY, True);SetColor(9);
   rectangle(45,25,getmaxx-45,55);
   assign(fil,'gr_Akt.'+NUst);reset(fil); i:=1;i1:=1; StopTab:=false;

while not(StopTab) do
begin
 if (i1>15) then
  begin
        if (i=1) then MenuFirst
        else MenuMain;
  end
 else
 begin
  if i1=1 then
   begin
         rectangle(500,70,570,90);
         textwindow(9,500,70,570,90);SetLineStyle(0,0,0);
         graphics.print(13,'Лист ');str(i,s3);graphics.print(13,s3);
         SetViewPort(0, 0, GetMaxX, GetMaxY, True);
         SetColor(9);SetLineStyle(0,0,0);
         rectangle((getmaxx div 2 - 250)-3,(getmaxy div 2 - 145)-3,(getmaxx div 2 + 250)+3,(getmaxy div 2 + 145)+3);
         SetViewPort(0, 0, GetMaxX, GetMaxY, True);
         textwindow(9,(getmaxx div 2 - 250),(getmaxy div 2 - 145),(getmaxx div 2 + 250),(getmaxy div 2 + 145));
         println(2,'');
         println(2,'  N      Дата отбора             Активность катализатора , %');
         println(2,'');
         setcolor(9);line(0,50,getmaxx,50);println(9,'');
         println(6,'');println(6,'');
   for i2:=1 to (List^[i]-1)*15 do readln(fil);
   end;

  readln(fil,Name,AktKat);
         str(AktKat:10:6,s1);

         str((((i-1)*15)+i1):3,s4);
         graphics.print(2,s4);
         graphics.print(6,'        ');
         graphics.print(3,Name);
         graphics.print(6,'                    ');
         graphics.print(3,s1);
         println(6,'');println(6,'');
         setcolor(9);line(0,50+i1*16,getmaxx,50+i1*16);
         line(180,0,180,50+i1*16);line(50,0,50,50+i1*16);i1:=i1+1;
         if eof(fil) then StopShow:=true;

 end;
 if (StopShow)and(NumberList^<>1) then MenuEnd;
 if (StopShow)and(NumberList^=1) then MenuNo;
end;
   dispose(List);dispose(NumberList);
   List:=nil;NumberList:=nil;
          close(fil);

   CloseGraphics;
   closegraph;

end;








procedure table_Koks;

  begin
   new(List);new(NumberList);new(Max);
   gr:=0;initgraph(gr,mode,''); assign(fil,'gr_Akt.'+NUst);reset(fil);
   j:=0;StopShow:=false;
   while not(eof(fil)) do begin j:=j+1; readln(fil); end;close(fil);
   for i:=1 to 100 do List^[i]:=0;NumberList^:=trunc(j/15);Max^:=j/15;
   if Max^>NumberList^ then NumberList^:=NumberList^+1;
   dispose(Max);Max:=nil;
   for i:=1 to NumberList^ do List^[i]:=i;
   textwindow(1,40,20,getmaxx-40,getmaxy-50);
   TextSmoothOn;
   println(4,''); println(4,'  Изменение содержания кокса на катализаторе от даты отбора данных.');println(6,'');
   SetViewPort(0, 0, GetMaxX, GetMaxY, True);SetColor(9);
   rectangle(45,25,getmaxx-45,55);
   assign(fil,'gr_Akt.'+NUst);reset(fil); i:=1;i1:=1; StopTab:=false;

while not(StopTab) do
begin
 if (i1>15) then
  begin
        if (i=1) then MenuFirst
        else MenuMain;
  end
 else
 begin
  if i1=1 then
   begin
         rectangle(500,70,570,90);
         textwindow(9,500,70,570,90);SetLineStyle(0,0,0);
         graphics.print(13,'Лист ');str(i,s3);graphics.print(13,s3);
         SetViewPort(0, 0, GetMaxX, GetMaxY, True);
         SetColor(9);SetLineStyle(0,0,0);
         rectangle((getmaxx div 2 - 250)-3,(getmaxy div 2 - 145)-3,(getmaxx div 2 + 250)+3,(getmaxy div 2 + 145)+3);
         SetViewPort(0, 0, GetMaxX, GetMaxY, True);
         textwindow(9,(getmaxx div 2 - 250),(getmaxy div 2 - 145),(getmaxx div 2 + 250),(getmaxy div 2 + 145));
         println(2,'                                   Содержание кокса     ');
         println(2,'  N      Дата отбора                                    ');
         println(2,'                               на  катализатора , % вес.');
         setcolor(9);line(0,50,getmaxx,50);println(9,'');
         println(6,'');println(6,'');
   for i2:=1 to (List^[i]-1)*15 do readln(fil);
   end;

  readln(fil,Name,AktKat,KoksKat);
         str(KoksKat:10:6,s1);

         str((((i-1)*15)+i1):3,s4);
         graphics.print(2,s4);
         graphics.print(6,'        ');
         graphics.print(3,Name);
         graphics.print(6,'                    ');
         graphics.print(3,s1);
         println(6,'');println(6,'');
         setcolor(9);line(0,50+i1*16,getmaxx,50+i1*16);
         line(180,0,180,50+i1*16);line(50,0,50,50+i1*16);i1:=i1+1;
         if eof(fil) then StopShow:=true;

 end;
 if (StopShow)and(NumberList^<>1) then MenuEnd;
 if (StopShow)and(NumberList^=1) then MenuNo;
end;
   dispose(List);dispose(NumberList);
   List:=nil;NumberList:=nil;
          close(fil);

   CloseGraphics;
   closegraph;

end;












procedure table_Krek;

  begin
   new(List);new(NumberList);new(Max);
   gr:=0;initgraph(gr,mode,''); assign(fil,'gr_Akt.'+NUst);reset(fil);
   j:=0;StopShow:=false;
   while not(eof(fil)) do begin j:=j+1; readln(fil); end;close(fil);
   for i:=1 to 100 do List^[i]:=0;NumberList^:=trunc(j/15);Max^:=j/15;
   if Max^>NumberList^ then NumberList^:=NumberList^+1;
   dispose(Max);Max:=nil;
   for i:=1 to NumberList^ do List^[i]:=i;
   textwindow(1,40,20,getmaxx-40,getmaxy-50);
   TextSmoothOn;
   println(4,''); println(4,'  Изменение числа крекинга от даты отбора данных.');println(6,'');
   SetViewPort(0, 0, GetMaxX, GetMaxY, True);SetColor(9);
   rectangle(45,25,getmaxx-45,55);
   assign(fil,'gr_Akt.'+NUst);reset(fil); i:=1;i1:=1; StopTab:=false;

while not(StopTab) do
begin
 if (i1>15) then
  begin
        if (i=1) then MenuFirst
        else MenuMain;
  end
 else
 begin
  if i1=1 then
   begin
         rectangle(500,70,570,90);
         textwindow(9,500,70,570,90);SetLineStyle(0,0,0);
         graphics.print(13,'Лист ');str(i,s3);graphics.print(13,s3);
         SetViewPort(0, 0, GetMaxX, GetMaxY, True);
         SetColor(9);SetLineStyle(0,0,0);
         rectangle((getmaxx div 2 - 250)-3,(getmaxy div 2 - 145)-3,(getmaxx div 2 + 250)+3,(getmaxy div 2 + 145)+3);
         SetViewPort(0, 0, GetMaxX, GetMaxY, True);
         textwindow(9,(getmaxx div 2 - 250),(getmaxy div 2 - 145),(getmaxx div 2 + 250),(getmaxy div 2 + 145));
         println(2,'');
         println(2,'  N      Дата отбора             Число крекинга');
         println(2,'');
         setcolor(9);line(0,50,getmaxx,50);println(9,'');
         println(6,'');println(6,'');
   for i2:=1 to (List^[i]-1)*15 do readln(fil);
   end;

  readln(fil,Name,AktKat,KoksKat,KrekKat);
         str(KrekKat:10:6,s1);

         str((((i-1)*15)+i1):3,s4);
         graphics.print(2,s4);
         graphics.print(6,'        ');
         graphics.print(3,Name);
         graphics.print(6,'                    ');
         graphics.print(3,s1);
         println(6,'');println(6,'');
         setcolor(9);line(0,50+i1*16,getmaxx,50+i1*16);
         line(180,0,180,50+i1*16);line(50,0,50,50+i1*16);i1:=i1+1;
         if eof(fil) then StopShow:=true;

 end;
 if (StopShow)and(NumberList^<>1) then MenuEnd;
 if (StopShow)and(NumberList^=1) then MenuNo;
end;
   dispose(List);dispose(NumberList);
   List:=nil;NumberList:=nil;
          close(fil);

   CloseGraphics;
   closegraph;

end;






END.