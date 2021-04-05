Unit NewPerebor2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, IniFiles, ImgList, ComCtrls, ToolWin, ExtCtrls, StdCtrls,
  XPMan, jpeg, OleServer, ExcelXP, UMath, UFlowOfVO;

const

//h=1;                       // шаг
Param=6;              //6 количество определяемых параметров (на самом деле их 5 - ОЧ, Аром, Бензол, ДНП, Олефины), 1 это значение концентрации первого потока

// требуемые параметры
{TrebOch=92;
TrebDNPmin=50;
TrebDNPmax=100;
TrebBenzol=1;
TrebArom=35;
TrebOlef=18; }

SumPotokov=40;

{Och:array[1..n] of double=(85.91,93.2,104.28);
DNP:array[1..n] of double=(14.26,141.55,43.05);
Benzol:array[1..n] of double=(3.09,0,0.64);
Arom:array[1..n] of double=(80.54,0,25.58);
Olef:array[1..n] of double=(0,0,16.74);
Rashodi:array[1..n] of double=(50,20,30);
 }

type
Ishod=array of double; //массив концентраций
Maximum=array of double; // массив необходим для нахождения максимальной велечина в каждом столбце
Srav=array[1..2,1..Param] of double;
Rashod=array of double; // имеющиеся расходы

var

i,j:integer;
n: integer; //количетсво потоков
Och, DNP, Benzol, Arom, Olef, Rashodi: array of double;
Konets, MaKsVol:Maximum;  //Konets максимальное число содержания для перебираемого потока, для каждого потока максимальная концентрация так же будет зависить от количества ароматики, олефинов и др. Например если в потоке 80% ароматики то его не может быть больше чем 80/требование к ароматике. За этот параметр отвечает MaKsVol
C,C1:ishod;    // С- концентрации потоков
Svod:srav;
Maksimal:array of array of double;  // массив для поиска максимальной концентрации потока.
ProsentRash:Rashod;  //значения расходов и процентный расход
TrebOch, TrebDNPmin, TrebDNPmax, TrebBenzol,
TrebArom, TrebOlef: array of double;

OchS,DNPS,BenzolS,AromS,OlefS:double;     // итоговое содержание параметров
f1:text;

p:integer; //счетчик
Stoper,Prosent:integer;   //Stoper необходим для уменьшения количества заведомо неверных значений, Prosent ограничивает вывод результатов по расходам


//переменные для выбора ограниченного числа рецептов
MakSBenz:ishod;  //MakSBenz - массив в котором определяется насколько много бензина мы можем получить по заданной рецептуре.
MaksB:real; // нахождение максимума в предыдущей модели.
h:real; //пришлось вытащить из констант для организации динамического шага

procedure Nikotin(TotalFlComp: TTotalFlowCompaunding; indCond: integer);

implementation

Function Sum(C:ishod):double;
 var
   i:integer;
   Summa:double;
 begin
   For i:=1 to n do
    Summa:=Summa+C[i];
   Sum:=Summa; 
 end;




Procedure Maks(C:Ishod;MaKsVol:Maximum; var Konets:Maximum); // определение максимального значения в ряду
  var
    i,j:integer;
    Summa:double;
  begin
    For j:=1 to n-1 do
   begin
    Summa:=0;
    For i:=1 to n do
       if i>j then
         Summa:=Summa+C[i];
    Konets[j]:=100-Summa;
   end;
    Konets[n]:=100;
   For i:=2 to n do     //пока пришлось убрать, переменная конец последнего потока не равна 100 //Nikotin
    if Konets[i]>MaKsVol[i] then
      Konets[i]:=int(MaKsVol[i]);

  end;

Procedure Optimiz1(indCond: integer; c:Ishod;OchS,DNPS,BenzolS,AromS,OlefS:double; var Svod:Srav; var Stoper:integer);
 var
  i,j:integer;

    begin
         Stoper:=0;
         Svod[2,1]:=c[1];
         Svod[2,2]:=OchS;
         Svod[2,3]:=DNPS;
         Svod[2,4]:=BenzolS;
         Svod[2,5]:=AromS;
         Svod[2,6]:=OlefS;

       IF Svod[1,1]-Svod[2,1]<>h then
             For j:=1 to 6 do
                Svod[1,j]:=Svod[2,j];
    If C[1]>0 then
      begin
      // пока не знаю trebOch, добавил [0]
       If Svod[1,1]-Svod[2,1]=h then
         begin
            If Svod[2,2]<trebOch[indCond] then
              if ((Svod[1,2]-trebOch[indCond])>(Svod[2,2]-trebOch[indCond])) then
                  Stoper:=1;
            If (Svod[2,3]<TrebDNPmin[indCond]) or (Svod[2,3]>TrebDNPmax[indCond]) then
                begin
                    If Svod[2,3]<TrebDNPmin[indCond] then
                       If ((Svod[1,3]-TrebDNPmin[indCond])>(Svod[2,3]-TrebDNPmin[indCond])) then
                           Stoper:=1;
                    If Svod[2,3]>TrebDNPmax[indCond] then
                       If ((TrebDNPmax[indCond]-Svod[1,3])>(TrebDNPmax[indCond]-Svod[2,3])) then
                           Stoper:=1;
                end;

            If Svod[2,4]>trebBenzol[indCond] then
               if ((trebBenzol[indCond]-Svod[1,4])>(trebBenzol[indCond]-Svod[2,4])) then
                  Stoper:=1;

            If Svod[2,5]>TrebArom[indCond] then
               IF ((TrebArom[indCond]-Svod[1,5])>(TrebArom[indCond]-Svod[2,5])) then
                  Stoper:=1;
            If Svod[2,6]>TrebOlef[indCond] then
               if ((TrebOlef[indCond]-Svod[1,6])>(TrebOlef[indCond]-Svod[2,6])) then
                  Stoper:=1;
      end;


       //пробую написиать хитрую штуку ограничивающую по нижней границе октанового числа и возможно изменяющую шаг что бы быстрее достигнуть.
       // алгоритм прост. Нахожу на сколько пунктов изменяется октановое число, затам примерно определяю на сколько может измениться октановое число за оставшиеся шаги,
       // если даже с учетом умножения на поправочный коэффициет октановое продукта бкдет меньше чем требуемое значить отстанавливаем процесс.
            If (Svod[2,2]<trebOch[indCond]) and (C[1]>0) and (Stoper=0) then
               If (Svod[2,2]+(C[1]*(  (trebOch[indCond]-Svod[1,2])-(trebOch[indCond]-Svod[2,2]) )*1.3)<trebOch[indCond]) then
                     Stoper:=1;

            If (Svod[2,2]>trebOch[indCond]) and (C[1]>0) and (Stoper=0) then
               If (Svod[2,2]+(C[1]*(  (trebOch[indCond]-Svod[1,2])-(trebOch[indCond]-Svod[2,2]) )*1.3)>trebOch[indCond]) then
                 Stoper:=1;

        // если при прохождении оставшихся шагов все же октановое число будет достигнуто, то необходимо изменять шаг. Шаг будет изменяться в основной программе на значение стопера.
            if  (Svod[2,2]>trebOch[indCond]) and (C[1]>0) and (Stoper=0) then
               If (Svod[2,2]+(C[1]*(  (trebOch[indCond]-Svod[1,2])-(trebOch[indCond]-Svod[2,2]) )*1.3)<=trebOch[indCond]) then
                   If (Stoper<>1) and (Trunc((trebOch[indCond]-Svod[2,2])/((trebOch[indCond]-Svod[1,2])-(trebOch[indCond]-Svod[2,2]))-2 )>2) then

                       Stoper:=Trunc((trebOch[indCond]-Svod[2,2])/((trebOch[indCond]-Svod[1,2])-(trebOch[indCond]-Svod[2,2]))-2 );
                        //присваевается целаю часть формулы (разница между расчетом и требуемым октановым число)/(изменение октанового числа по отношению к предыдущему шагу)-2
             if  (Svod[2,2]<trebOch[indCond]) and (C[1]>0) and (Stoper=0) then
               If (Svod[2,2]+(C[1]*(  (trebOch[indCond]-Svod[1,2])-(trebOch[indCond]-Svod[2,2]) )*1.3)>=trebOch[indCond]) then
                   If (Stoper<>1) and (Trunc((trebOch[indCond]-Svod[2,2])/((trebOch[indCond]-Svod[1,2])-(trebOch[indCond]-Svod[2,2]))-2 )>2) then

                       Stoper:=Trunc((trebOch[indCond]-Svod[2,2])/((trebOch[indCond]-Svod[1,2])-(trebOch[indCond]-Svod[2,2]))-2 );

                      


             
         end;    





    end;
Procedure OptRashod(c:ishod; var ProsentRash:Rashod; var Prosent:integer);  // процедура пересчета массы имеющихся компанентов в проценты
var
 sum:double;
 i:integer;
begin
 Prosent:=0;

 For i:=1 to n do
   ProsentRash[i]:=Rashodi[i]/SumPotokov*100;

 For i:=1 to n do
   If C[i]>ProsentRash[i] then
     Prosent:=1;
end;

procedure Nikotin(TotalFlComp: TTotalFlowCompaunding; indCond: integer);
var
  ii, jj: integer;
  Conzen: TArrOfDouble;
  MyFlow:TFlowCompaunding;
  kk: integer;
begin
{---------------------}
kk:=length(TotalFlComp.ArrConditions.Conditions);

SetLength(TrebOch, kk);
SetLength(TrebDNPmin, kk);
SetLength(TrebDNPmax, kk);
SetLength(TrebBenzol, kk);
SetLength(TrebArom, kk);
SetLength(TrebOlef, kk);



for ii:=0 to kk-1 do
begin
  with TotalFlComp.ArrConditions.Conditions[ii] do
  begin
    TrebOch[ii]:=OV;
    TrebDNPmin[ii]:=restrictions[0];
    TrebDNPmax[ii]:=restrictions[1];
    TrebBenzol[ii]:=restrictions[2];
    TrebArom[ii]:=restrictions[3];
    TrebOlef[ii]:=restrictions[4];

  end;
end;

MyFlow:=TFlowCompaunding.Create;
n:=length(TotalFlComp.Flows);

Setlength(Konets, n+1);
Setlength(MaKsVol, n+1);
Setlength(C, n+1);
Setlength(MaksBenz, n+1);
Setlength(C1, n+1);
Setlength(ProsentRash, n+1);
Setlength(Maksimal, n+1, 4);  // т.к. [1..n, 1..3]

Setlength(Och, n+1);
Setlength(DNP, n+1);
Setlength(Benzol, n+1);
Setlength(Arom, n+1);
Setlength(Olef, n+1);
Setlength(Rashodi, n+1);

for ii:=1 to n do
begin
  with TotalFlComp.Flows[ii-1] do
  begin
    DNP[ii]:=GetDNP(Components, TotalFlComp.FlowTemp);
    Och[ii]:=FlowOctaneValue;
    Arom[ii]:=0;
    for jj:=65 to 78 do
    begin
      Arom[ii]:=Arom[ii]+Components[jj-1].ConcentrComp;
    end;
    Olef[ii]:=0;
    for jj:=79 to 110 do
    begin
      Olef[ii]:=Olef[ii]+Components[jj-1].ConcentrComp;
    end;
    Benzol[ii]:=0;
    for jj:=65 to 65 do
    begin
      Benzol[ii]:=Benzol[ii]+Components[jj-1].ConcentrComp;
    end;
    // это под вопросом
    Rashodi[ii]:=Expenditure;
  end;
end;
// это под вопросом
OchS:= TotalFlComp.TotalFlowOctaneValue;
{-------------------------}


assign(f1,'rez_'+TotalFlComp.ArrConditions.Conditions[indCond].Name+'.txt');
rewrite(f1);



For i:=0 to n do   // нахождение максимального содержания потока в зависимости от требаваний к бензолу, олефинам и т.д
   begin     { в этой части пришлось поставить цикл от 0, в оригенали у меня было от одного Nikotin}
       If Benzol[i]<>0 then
         Maksimal[i,1]:=TrebBenzol[0]/Benzol[i]*100;
       If Arom[i]<>0 then
        Maksimal[i,2]:=TrebArom[0]/Arom[i]*100;
       If Olef[i]<>0 then
        Maksimal[i,3]:=TrebOlef[0]/Olef[i]*100;
   end;
   For j:=0 to n do    // выбор минимальной величины из найденых (не имеет значения, что, например по олефинам поток можно вовлекать до 50%, если по ароматике можно только 20% программа должна запоминать 20)
    begin
      MaKsVol[j]:=Maksimal[j,1];
       For i:=0 to 3 do
        begin
         If (Maksimal[j,i]<MaKsVol[j]) and (Maksimal[j,i]<>0) then
              MaKsVol[j]:=Maksimal[j,i];
         If (MaKsVol[j]=0) or (Maksimal[j,i]>100) then
            MaKsVol[j]:=100;
        end;
    end;





For i:=1 to n do
C[i]:=0;
p:=0;
Svod[1,1]:=10000; //начальное значение этого параметра д.б. больше 100 потом пересчитается

 // в Sg1 выдаются все значения концентраций потоков для дальнейшей обработки.   Nikotin
     UFlowOfVO.FormFlowofOV.SG1.ColCount:=n+2;  // Количество столбцов будет зависить от количества потоков+ номер столбца + возможные требования. Требования указывабтся среди требований к бензинам. По умолчанию ставятся максимальное количество получаемого бензина
         



While (C[n]<=99) and (C[n]<=MaKsVol[n]) do
 begin
  For i:=1 to n do
   If C[i]>100 then
    ShowMessage('Беда');
 // блок расчета основных параметров
  OchS:=0;
  DNPS:=0;
  BenzolS:=0;
  AromS:=0;
  OlefS:=0;

  OchS:= TotalFlComp.TotalFlowOctaneValue;
  with TotalFlComp do
  begin
    DNPS:=MyFlow.GetDNP(Components, FlowTemp);
    OchS:=TotalFlowOctaneValue;
    AromS:=0;
    for jj:=65 to 78 do
    begin
      AromS:=AromS+Components[jj-1].ConcentrComp;
    end;
    OlefS:=0;
    for jj:=79 to 110 do
    begin
      OlefS:=OlefS+Components[jj-1].ConcentrComp;
    end;
    BenzolS:=0;
    for jj:=65 to 65 do
    begin
      BenzolS:=BenzolS+Components[jj-1].ConcentrComp;
    end;
  end;
        
   Maks(C,MaKsVol,Konets);
   Optimiz1(indCond, c,OchS,DNPS,BenzolS,AromS,OlefS,Svod,Stoper);
   h:=1;
   i:=1;


      While (C[i]=Konets[i]) and (i<>n) do
        If i<n then                           // Новое
            i:=i+1;

  {    IF Stoper=1 then                                // Если значения стали ухудшаться увеличиваем следующее значение
        begin
         IF (i<>n) then
          begin
           If C[i+1]>=Konets[i+1] then
            Stoper:=0;
           If C[i+1]<Konets[i+1] then
            C[i+1]:=C[i+1]+h;

          end;
         If (i=n) and (C[i]+h<100) then
            C[i]:=100-h;
         If (i=n) and (C[i]+h=100) then
            C[i]:=100;
        end;                              // В процедуре Optimiz1 организованно динамическое изменение шага
              If Stoper>1 then
                begin
                    If (C[i]+Stoper>=Konets[i]) and (C[i]<Konets[i]-1) then
                          C[i]:=Konets[i]-1;
                    If (C[i]+Stoper>=Konets[i]) and (C[i]=Konets[i]-1) then
                          Stoper:=0;
                    If C[i]+Stoper<Konets[i] then
                          C[i]:=C[i]+Stoper;

                end; }
     //         If Stoper<=0 then
                  C[i]:=C[i]+h;
                  If i>1 then
                       For j:=i-1 downto 1 do
                            C[j]:=0;
                  Maks(C,MaKsVol,Konets);
                  C[1]:=Konets[1];


{Кусок кода добавлен Долгановым 15.09.14}
  SetLength(Conzen, length(C)-1);
  for ii:=0 to length(Conzen)-1 do
  begin
    Conzen[ii]:=C[ii+1];
  end;
  TotalFlComp.CalcOfRatios(Conzen);


  // под вопросом
  OchS:= TotalFlComp.TotalFlowOctaneValue;
  with TotalFlComp do
  begin
    DNPS:=MyFlow.GetDNP(Components, FlowTemp);
    OchS:=TotalFlowOctaneValue;
    AromS:=0;
    for jj:=65 to 78 do
    begin
      AromS:=AromS+Components[jj-1].ConcentrComp;
    end;
    OlefS:=0;
    for jj:=79 to 110 do
    begin
      OlefS:=OlefS+Components[jj-1].ConcentrComp;
    end;
    BenzolS:=0;
    for jj:=65 to 65 do
    begin
      BenzolS:=BenzolS+Components[jj-1].ConcentrComp;
    end;
  end;
{-------------------------------------------}



//Вывод результатов
//  Prosent:=0;
//  OptRashod(c,ProsentRash,Prosent);
 {    If AromS<=TrebArom[indCond] then
       If OchS>=TrebOch[indCond] then
        IF (OchS<=TrebOch[indCond]+1) then
       If (DNPS>=TrebDNPmin[indCond]) and (DNPS<=TrebDNPmax[indCond]) then
        If BenzolS<=TrebBenzol[indCond] then
         If OlefS<=TrebOlef[indCond] then }
      //   If Prosent<1 then            //а это требование ограничивает значения по расходам

           begin
               For i:=1 to n do
                  write(f1, C[i]:3:0, '   ');
                  writeln(f1, '  OchS=',OchS:5:1,' DNPS=',DNPS:5:1,' BenzolS=',BenzolS:5:2,' AromS=',AromS:5:2,'  OlefS=', OlefS:5:2);

            // организую выдачу концентраций и других параметров в SG1 Nikotin
             For i:=1 to n do
               UFlowOfVO.FormFlowofOV.SG1.Cells[i,p]:=FloatToStr(C[i]);

             // нахожднеие количества получаемого бензина для данной рецептуры
                For j:=0 to n do
                     MaksBenz[j]:=0;   //отчистка массива

                 For j:=1 to n do
                      If (C[j]<>0) then
                        begin
                          MaksBenz[j]:=Rashodi[j]/C[j];      // нахожу отношения массы потока к его процентам в рецепте
                          MaksB:=MaksBenz[j]; // считаем максимумом любое соотношение все равно какое лишь бы не ноль
                        end;
                 For i:=1 to n do
                     If MaksBenz[i]<>0 then
                       If MaksB>=MaksBenz[i] then
                         MaksB:=MaksBenz[i];
                   UFlowOfVO.FormFlowofOV.SG1.Cells[0, p]:=FloatToStr(p);
                   UFlowOfVO.FormFlowofOV.SG1.Cells[n+1, p]:=FloatToStr(int(MaksB*100));
                   UFlowOfVO.FormFlowofOV.SG1.RowCount:=UFlowOfVO.FormFlowofOV.SG1.RowCount+1;

    p:=p+1;        //количество вариантов по требованию Nikotin
           end;

 end;
 writeln(f1, p);

 closefile(f1);
 If p>0 then        // защита от ошибок если не найдено ни одного варианта
   begin
     UFlowOfVO.FormFlowofOV.ListBox1.Items.LoadFromFile('rez_'+TotalFlComp.ArrConditions.Conditions[indCond].Name+'.txt');


     MaksB:=StrToFloat(UFlowOfVO.FormFlowofOV.SG1.Cells[n+1,0]);    // сперва опредиляем максимумально возможное количество бензина
      For i:=0 to UFlowOfVO.FormFlowofOV.SG1.RowCount-2 do
       IF MaksB<StrToFloat(UFlowOfVO.FormFlowofOV.SG1.Cells[n+1,i]) then
           MaksB:=StrToFloat(UFlowOfVO.FormFlowofOV.SG1.Cells[n+1,i]);



     case UFlowOfVO.FormFlowofOV.RadioGroup1.ItemIndex of
         0:begin     // выдача вариантов смешения для получения максимального количества бензина
             j:=1;
             For i:=1 to UFlowOfVO.FormFlowofOV.SG1.RowCount-2 do
                  If MaksB=StrToFloat(UFlowOfVO.FormFlowofOV.SG1.Cells[n+1,i]) then
                      begin
                        UFlowOfVO.FormFlowofOV.SG2.Cells[0,j]:=FloatToStr(MaksB);
                        UFlowOfVO.FormFlowofOV.SG2.Cells[1,j]:=UFlowOfVO.FormFlowofOV.ListBox1.Items[i];
                        UFlowOfVO.FormFlowofOV.SG2.RowCount:=UFlowOfVO.FormFlowofOV.SG2.RowCount+1;
                        j:=j+1;
                        end;

           end;
         1:begin   // выдача рецептов для заданного количества бензина

              If StrToFloat(UFlowOfVO.FormFlowofOV.Edit8.Text)>MaksB then
                  ShowMessage('К сожалению при смешении выбранных потоков не возможно получить заданное количество бензина '+UFlowOfVO.FormFlowofOV.Edit8.Text+', максимально возможное составляет '+FloatToStr(MaksB));

              If StrToFloat(UFlowOfVO.FormFlowofOV.Edit8.Text)<MaksB then
                  MaksB:=StrToFloat(UFlowOfVO.FormFlowofOV.Edit8.Text);
              j:=1;
              For i:=1 to UFlowOfVO.FormFlowofOV.SG1.RowCount-2 do
                   If MaksB<=StrToFloat(UFlowOfVO.FormFlowofOV.SG1.Cells[n+1,i]) then
                     begin
                        UFlowOfVO.FormFlowofOV.SG2.Cells[0,j]:=FloatToStr(MaksB);
                        UFlowOfVO.FormFlowofOV.SG2.Cells[1,j]:=UFlowOfVO.FormFlowofOV.ListBox1.Items[i];
                        UFlowOfVO.FormFlowofOV.SG2.RowCount:=UFlowOfVO.FormFlowofOV.SG2.RowCount+1;
                        j:=j+1;
                     end;

           end;
     end;    
       UFlowOfVO.FormFlowofOV.SG2.Cells[0,0]:='Кол-во бензина';
       UFlowOfVO.FormFlowofOV.SG2.Cells[1,0]:='Показатели качества';
       UFlowOfVO.FormFlowofOV.SG2.RowCount:=UFlowOfVO.FormFlowofOV.SG2.RowCount-1;
   end;


end;

end.