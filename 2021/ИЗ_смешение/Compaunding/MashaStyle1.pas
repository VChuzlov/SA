unit MashaStyle1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, IniFiles, ImgList, ComCtrls, ToolWin, ExtCtrls, StdCtrls,
  XPMan, jpeg, OleServer, ExcelXP, UMath, UFlowOfVO, Math;



const
//n=12;                       //���������� �������
h=0.01;                       // ���

//����������

{TrebOch=92;
TrebDNPmin=50;
TrebDNPmax=100;
TrebBenzol=1;
TrebArom=35;
TrebOlef=18;
TrebSera=1;
TrebKolVo=1000;
TrebMTBE=15;  }





// ������: �����,��-1/1,���.1000,���.600,������,����������,���������,�������,����,��.62-85 ���-10,��.62-85 �100 ���,������� �400 ���
{Och:array[1..n] of real=(89.19,91.01,104.01,94.2,117,90.67,91.47,96.62,125,59.3,60.41,49.37);
DNP:array[1..n] of real=(43.21,53.57,24.27,32.81,7.15,62.82,140.47,34.69,40.31,26.11,24.29,17.55);
Benzol:array[1..n] of real=(0.72,0.75,2.7,4.19,0,0.03,0,0,0,0.32,1.36,0.03);
Arom:array[1..n] of real=(23.77,34.49,77.5,61.54,100,0.06,0,0,0,5.04,1.52,0.48);
Olef:array[1..n] of real=(26.88,19.79,0,0,0,0,0,0,0,0.03,0,1.46);
Rashodi:array[1..n] of real=(50,200,200,200,200,200,200,200,200,200,200,200);
Sera:array[1..n] of real=(5,3,0,0,0,0,0,0,0,0,0,0);

type
potok=array[1..n] of real;
}


var
//I:integer;
FaktOch,FaktDNP,FaktBenzol,FaktArom,FaktOlef,FaktSera,FaktKolVo:real;
Rash: TArrOfDouble;  // ���������� ���������� ������� � �����
iter:integer; // ���������� ��������
Ref1000Stop,Ref600Stop,ToluolStop:integer;

procedure ProcMashaStyle(TotalFlComp: TTotalFlowCompaunding; indCond: integer);

implementation
var
TrebOch, TrebDNPmin, TrebDNPmax,
TrebBenzol, TrebArom, TrebOlef,
TrebSera, TrebKolVo, TrebMTBE: TArrOfDouble;
Och, DNP, Benzol, Arom, Olef, Rashodi, Sera: TArrOfDouble;


Function RashSera(TrebSera,FaktSera:real;i:integer):real; 
 begin
 If Sera[i]<>0 then
   RashSera:=(TrebSera-FaktSera)/Sera[i];
 If Sera[i]=0 then              //���� � ������ ��� ���������� ������ �� ���� ���������� ������ ����� �� ������
   RashSera:=1;
 end;
function RashOlef(TrebOlef,FaktOlef:real;i:integer):real; 
 begin
 If Olef[i]<>0 then
   RashOlef:=(TrebOlef-FaktOlef)/Olef[i];
 If Olef[i]=0 then
   RashOlef:=1;
 end;
function RashArom(TrebArom,FaktArom:real;i:integer):real;
 begin
 If Arom[i]<>0 then
   RashArom:=(TrebArom-FaktArom)/Arom[i];
 If Arom[i]=0 then
   RashArom:=1;
 end; 
function RashBenzol(TrebBenzol,FaktBenzol:real;i:integer):real; 
 begin
  If Benzol[i]<>0 then
   RashBenzol:=(TrebBenzol-FaktBenzol)/Benzol[i];
  If Benzol[i]=0 then
   RashBenzol:=1;
 end;
function RashDNPmin(TrebDNPmin,FaktDNP:real;i:integer):real;
 begin
  
   RashDNPmin:=(TrebDNPmin-FaktDNP)/DNP[i];
  //���� ��������� �������� ����� ��� ������ ����� ���� ����� ��� �� � ���� ������... ������ �� ���� ������
 end;
function RashDNPmax(TrebDNPmax,FaktDNP:real;i:integer):real;
 begin
  
   RashDNPmax:=(TrebDNPmax-FaktDNP)/DNP[i];
  
 end;
function RashOchmin(TrebOch,FaktOch:real;i:integer):real;
 begin
  
   RashOchmin:=(TrebOch-FaktOch)/Och[i];
  
 end; 
function RashOchmax(TrebOch,FaktOch:real;i:integer):real;
 begin
  
   RashOchmax:=(FaktOch-TrebOch)/Och[i];
  
 end;
 

Procedure AllTreb(TotalFlComp: TTotalFlowCompaunding; var FaktOch,FaktDNP,FaktBenzol,FaktArom,FaktOlef,FaktSera,FaktKolVo:real);
var
 i, n, ii, jj:integer;
 RashoProsent:TArrOfDouble;
 MyFlow:TFlowCompaunding;

 begin
  FaktOch:=0;
  FaktDNP:=0;
  FaktBenzol:=0;
  FaktArom:=0;
  FaktOlef:=0;
  FaktSera:=0;
  FaktKolVo:=0;


  // ��� ���� ��������� ��� ���������
n:=length(TotalFlComp.Flows);

For i:=1 to n do
    FaktKolVo:=FaktKolVo+Rash[i];     //���������� �������� ���������� ������



for ii:=1 to n do
begin
  MyFlow:=TotalFlComp.GetFlowOfIndexOfCondition(ii);
  if MyFlow<>nil then
  with MyFlow do
  begin
    DNP[ii]:=GetDNP(Components, TotalFlComp.FlowTemp);
    Och[ii]:=FlowOctaneValue(TotalFlComp.FlowTemp);
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
    Sera[ii]:=0;
    if GetCompOfName('Sera')<>nil then
      Sera[ii]:=Sera[ii]+GetCompOfName('Sera').ConcentrComp;

    // ��� ��� ��������
    Expenditure:=Rash[ii];
  end;
end;
// ��� ��� ��������
FaktOch := TotalFlComp.TotalFlowOctaneValue;
FaktOch := FaktOch*FaktKolVo;

  For i:=1 to n do
    begin

       //FaktOch:=FaktOch+Rash[i]*Och[i];
       FaktDNP:=FaktDNP+Rash[i]*DNP[i];
       FaktBenzol:=FaktBenzol+Rash[i]*Benzol[i];
       FaktArom:=FaktArom+Rash[i]*Arom[i];
       FaktOlef:=FaktOlef+Rash[i]*Olef[i];
       FaktSera:=FaktSera+Rash[i]*Sera[i];
   end;


end;

procedure ProcMashaStyle(TotalFlComp: TTotalFlowCompaunding; indCond: integer);
label m1,m2;
var
  kk, ii, n, i: integer;
  str: string;
  MyFlow:TFlowCompaunding;
  sum, h_kol: double;
begin
FaktOch:=0;
FaktDNP:=0;
FaktBenzol:=0;
FaktArom:=0;
FaktOlef:=0;
FaktSera:=0;
FaktKolVo:=0;

Ref1000Stop:=0;
Ref600Stop:=0;
ToluolStop:=0;
// ��� ���� ���������� ���������
{--------}
  kk:=length(TotalFlComp.ArrConditions.Conditions);

SetLength(TrebOch, kk);
SetLength(TrebDNPmin, kk);
SetLength(TrebDNPmax, kk);
SetLength(TrebBenzol, kk);
SetLength(TrebArom, kk);
SetLength(TrebOlef, kk);

SetLength(TrebSera, kk);
SetLength(TrebKolVo, kk);
SetLength(TrebMTBE, kk);


for ii:=0 to kk-1 do
begin
  with TotalFlComp.ArrConditions.Conditions[ii] do
  begin
    TrebOch[ii]:=OV;
    TrebDNPmin[ii]:=restrictions[0];
    TrebDNPmax[ii]:=restrictions[1];
    TrebBenzol[ii]:=restrictions[2]-0.02;
    TrebArom[ii]:=restrictions[3]-0.02;
    TrebOlef[ii]:=restrictions[4];

    TrebSera[ii]:=restrictions[5];
    TrebKolVo[ii]:=restrictions[6];
    TrebMTBE[ii]:=restrictions[7];

  end;
end;



{--------}
h_kol:=TrebKolVo[indCond]*0.1;
n:=length(TotalFlComp.Flows);

SetLength(Rash, n+1);
SetLength(Sera, n+1);

Setlength(Och, n+1);
Setlength(DNP, n+1);
Setlength(Benzol, n+1);
Setlength(Arom, n+1);
Setlength(Olef, n+1);
Setlength(Rashodi, n+1);



if indCond=0 then
begin
  for ii:=0 to Length(TotalFlComp.Flows)-1 do
  begin
    TotalFlComp.Flows[ii].ExistExpenditure2:=TotalFlComp.Flows[ii].ExistExpenditure;
  end;
end;

for ii:=1 to n do
begin
  if TotalFlComp.GetFlowOfIndexOfCondition(ii)<>nil then
    Rashodi[ii]:=TotalFlComp.GetFlowOfIndexOfCondition(ii).ExistExpenditure2
  else
    Rashodi[ii]:=0; // ������ �����������, ��� ������� ������ ���������� ����������
end;



for ii:=0 to Length(TotalFlComp.Flows)-1 do
begin
  TotalFlComp.Flows[ii].Expenditure:=0;
end;

m2:
Ref1000Stop:=0;
Ref600Stop:=0;
ToluolStop:=0;
For i:=1 to n do
 Rash[i]:=0;
//GOBKK

// �������� �� ��������
AllTreb(TotalFlComp, FaktOch,FaktDNP,FaktBenzol,FaktArom,FaktOlef,FaktSera,FaktKolVo);

If RashSera(TrebSera[indCond],FaktSera,1)<RashOlef(TrebOlef[indCond],FaktOlef,1) then
 Rash[1]:=RashSera(TrebSera[indCond],FaktSera,1)
   else
 Rash[1]:=RashOlef(TrebOlef[indCond],FaktOlef,1);

If Rash[1]>Rashodi[1]/TrebKolVo[indCond] then
   Rash[1]:=Rashodi[1]/TrebKolVo[indCond];

// �������� �� ��������
AllTreb(TotalFlComp, FaktOch,FaktDNP,FaktBenzol,FaktArom,FaktOlef,FaktSera,FaktKolVo);
// ���� ���� ����������� ��������� ��1-1 �� ��������� ���� ��� �� ��������� ���
IF (FaktOlef<TrebOlef[indCond]) and (FaktSera<TrebSera[indCond]) then
 begin
   If RashSera(TrebSera[indCond],FaktSera,2)<RashOlef(TrebOlef[indCond],FaktOlef,2) then
     Rash[2]:=RashSera(TrebSera[indCond],FaktSera,2)
      else
     Rash[2]:=RashOlef(TrebOlef[indCond],FaktOlef,2);
   If Rash[2]>Rashodi[2]/TrebKolVo[indCond] then
     Rash[2]:=Rashodi[2]/TrebKolVo[indCond];
 end;
//writeln('Kt1-1=',Rash[2]);

AllTreb(TotalFlComp, FaktOch,FaktDNP,FaktBenzol,FaktArom,FaktOlef,FaktSera,FaktKolVo);
//writeln(FaktOch:5:2,' ',FaktDNP:5:2,' ',FaktBenzol:5:2,' ',FaktArom:5:2,' ',FaktOlef:5:2,' ',FaktSera:5:2,' ',FaktKolVo:5:2);
//��������� 1000

m1: IF (Ref1000Stop=0) then
      begin
        If RashBenzol(TrebBenzol[indCond],FaktBenzol,3)<RashArom(TrebArom[indCond],FaktArom,3) then
          Rash[3]:=RashBenzol(TrebBenzol[indCond],FaktBenzol,3)
            else
          Rash[3]:=RashArom(TrebArom[indCond],FaktArom,3);
        If Rash[3]>Rashodi[3]/TrebKolVo[indCond] then
          Rash[3]:=Rashodi[3]/TrebKolVo[indCond];

          AllTreb(TotalFlComp, FaktOch,FaktDNP,FaktBenzol,FaktArom,FaktOlef,FaktSera,FaktKolVo);
      end;
//��������� 600
    If (Ref600Stop=0) then
    begin 
        If RashBenzol(TrebBenzol[indCond],FaktBenzol,4)<RashArom(TrebArom[indCond],FaktArom,4) then
         Rash[4]:=RashBenzol(TrebBenzol[indCond],FaktBenzol,4)
        else
          Rash[4]:=RashArom(TrebArom[indCond],FaktArom,4);
        If Rash[4]>Rashodi[4]/TrebKolVo[indCond] then
          Rash[4]:=Rashodi[4]/TrebKolVo[indCond];
     AllTreb(TotalFlComp, FaktOch,FaktDNP,FaktBenzol,FaktArom,FaktOlef,FaktSera,FaktKolVo);
    end;

//������
    IF (ToluolStop=0) then
      begin
        If RashBenzol(TrebBenzol[indCond],FaktBenzol,5)<RashArom(TrebArom[indCond],FaktArom,5) then
          Rash[5]:=RashBenzol(TrebBenzol[indCond],FaktBenzol,5)
           else
          Rash[5]:=RashArom(TrebArom[indCond],FaktArom,5);
        If Rash[5]>Rashodi[5]/TrebKolVo[indCond] then
           Rash[5]:=Rashodi[5]/TrebKolVo[indCond];

        AllTreb(TotalFlComp, FaktOch,FaktDNP,FaktBenzol,FaktArom,FaktOlef,FaktSera,FaktKolVo);
      end;

      // ���������� �����������
If FaktDNP<TrebDNPmin[indCond] then
 begin
     Rash[6]:=RashDNPmin(TrebDNPmin[indCond],FaktDNP,6);
    If Rash[6]>Rashodi[6]/TrebKolVo[indCond] then
     Rash[6]:=Rashodi[6]/TrebKolVo[indCond];

   IF FaktKolVo<1 then
     IF FaktKolVo+Rash[6]>1 then
       If Rash[5]>0 then
        begin
                 If Rash[1]=0 then
                  begin
                   If (Rash[5]>0) then
                     Rash[5]:=Rash[5]-0.01;
                   IF Rash[5]<0 then
                      Rash[5]:=0;
                      ToluolStop:=1;
                   end;



               If Rash[2]=0 then
                begin
                   If (Rash[1]>0) then
                     Rash[1]:=Rash[1]-0.01;
                   IF Rash[1]<0 then
                      Rash[1]:=0;
                end;


                If (Rash[2]>0) then
                   Rash[2]:=Rash[2]-0.01;
                 IF Rash[2]<0 then
                    Rash[2]:=0;






           If Ref1000Stop=0 then
             Rash[3]:=0;
           If Ref600Stop=0 then
             Rash[4]:=0;
           If ToluolStop=0 then
             Rash[5]:=0;
           Rash[6]:=0;
           Rash[7]:=0;
           Rash[8]:=0;
           Rash[9]:=0;

   AllTreb(TotalFlComp, FaktOch,FaktDNP,FaktBenzol,FaktArom,FaktOlef,FaktSera,FaktKolVo);

                   GoTo M1;
     end;
     AllTreb(TotalFlComp, FaktOch,FaktDNP,FaktBenzol,FaktArom,FaktOlef,FaktSera,FaktKolVo);
 end;
// ���������� ����������
If FaktDNP<TrebDNPmin[indCond] then
 begin
     Rash[7]:=RashDNPmin(TrebDNPmin[indCond],FaktDNP,7);
   If Rash[7]>Rashodi[7]/TrebKolVo[indCond] then
     Rash[7]:=Rashodi[7]/TrebKolVo[indCond];

IF FaktKolVo<1 then
     IF FaktKolVo+Rash[7]>1 then
       If Rash[5]>0 then
        begin
                 If Rash[1]=0 then
                  begin
                   If (Rash[5]>0) then
                     Rash[5]:=Rash[5]-0.01;
                   IF Rash[5]<0 then
                      Rash[5]:=0;
                      ToluolStop:=1;
                   end;



               If Rash[2]=0 then
                begin
                   If (Rash[1]>0) then
                     Rash[1]:=Rash[1]-0.01;
                   IF Rash[1]<0 then
                      Rash[1]:=0;
                end;
          

                If (Rash[2]>0) then
                   Rash[2]:=Rash[2]-0.01;
                 IF Rash[2]<0 then
                    Rash[2]:=0;






           If Ref1000Stop=0 then
             Rash[3]:=0;
           If Ref600Stop=0 then
             Rash[4]:=0;
           If ToluolStop=0 then
             Rash[5]:=0;
           Rash[6]:=0;
           Rash[7]:=0;
           Rash[8]:=0;
           Rash[9]:=0;

   AllTreb(TotalFlComp, FaktOch,FaktDNP,FaktBenzol,FaktArom,FaktOlef,FaktSera,FaktKolVo);

                   GoTo M1;
    end;
    AllTreb(TotalFlComp, FaktOch,FaktDNP,FaktBenzol,FaktArom,FaktOlef,FaktSera,FaktKolVo);
 end;


//���������� ��������
If FaktOch<TrebOch[indCond] then
  begin
    Rash[8]:=RashOchmin(TrebOch[indCond],FaktOch,8);
    If Rash[8]>Rashodi[8]/TrebKolVo[indCond] then
     Rash[8]:=Rashodi[8]/TrebKolVo[indCond];
  begin 
     IF FaktKolVo<1 then
        If abs(TrebOch[indCond]-FaktOch)>0.2 then
          IF FaktKolVo+Rash[8]>1 then
             If Rash[1]>0 then
                begin

                  //������� �� ���������� ���������� �����
                    If Rash[2]=0 then
                      begin
                       If (Rash[1]>0) then
                          Rash[1]:=Rash[1]-0.01;
                       IF Rash[1]<0 then
                          Rash[1]:=0;
                      end;
                     If (Rash[2]>0) then
                       Rash[2]:=Rash[2]-0.01;
                     IF Rash[2]<0 then
                       Rash[2]:=0;
                     
                     For i:=3 to 9 do
                       Rash[i]:=0;
                     
                     AllTreb(TotalFlComp,FaktOch,FaktDNP,FaktBenzol,FaktArom,FaktOlef,FaktSera,FaktKolVo);
                     IF Rash[1]>0 then
                      GoTo M1;
                end;
  end;
   AllTreb(TotalFlComp, FaktOch,FaktDNP,FaktBenzol,FaktArom,FaktOlef,FaktSera,FaktKolVo);
   end;
// ���������� ����
If FaktOch<TrebOch[indCond] then
  begin
    Rash[9]:=RashOchmin(TrebOch[indCond],FaktOch,9);
    If Rash[9]>Rashodi[9]/TrebKolVo[indCond] then
     Rash[9]:=Rashodi[9]/TrebKolVo[indCond];
    If Rash[9]>TrebMTBE[indCond]/100 then
       Rash[9]:=TrebMTBE[indCond]/100;

   AllTreb(TotalFlComp, FaktOch,FaktDNP,FaktBenzol,FaktArom,FaktOlef,FaktSera,FaktKolVo);
   end;


// ���������� ����������� �������
   // 62-85 ���-10
 If (FaktOch>=TrebOch[indCond]) and (FaktKolVo-1<0) and (Rash[10]<Rashodi[10]/TrebKolVo[indCond]) then
     begin
       Rash[10]:=Rash[10]+(1-FaktKolVo);
       If Rash[10]>Rashodi[10]/TrebKolVo[indCond] then
         Rash[10]:=Rashodi[10]/TrebKolVo[indCond];
       //writeln('62-85 ���-10=',Rash[10]:5:2);
       AllTreb(TotalFlComp, FaktOch,FaktDNP,FaktBenzol,FaktArom,FaktOlef,FaktSera,FaktKolVo);
       //writeln(FaktOch:5:2,' ',FaktDNP:5:2,' ',FaktBenzol:5:2,' ',FaktArom:5:2,' ',FaktOlef:5:2,' ',FaktSera:5:2,' ',FaktKolVo:5:2);

    end;
 // 62-85 C100 ���
 If (FaktOch>=TrebOch[indCond]) and (FaktKolVo-1<0) and (Rash[11]<Rashodi[11]/TrebKolVo[indCond]) then
     begin
       Rash[11]:=Rash[11]+(1-FaktKolVo);
       If Rash[11]>Rashodi[11]/TrebKolVo[indCond] then
         Rash[11]:=Rashodi[11]/TrebKolVo[indCond];
       //writeln('62-85 C100 ���=',Rash[11]:5:2);
       AllTreb(TotalFlComp, FaktOch,FaktDNP,FaktBenzol,FaktArom,FaktOlef,FaktSera,FaktKolVo);
       //writeln(FaktOch:5:2,' ',FaktDNP:5:2,' ',FaktBenzol:5:2,' ',FaktArom:5:2,' ',FaktOlef:5:2,' ',FaktSera:5:2,' ',FaktKolVo:5:2);


    end;

 //������� �400
  If (FaktOch>=TrebOch[indCond]) and (FaktKolVo-1<0) and (Rash[12]<Rashodi[12]/TrebKolVo[indCond]) then
     begin
       Rash[12]:=Rash[12]+(1-FaktKolVo);
       If Rash[12]>Rashodi[12]/TrebKolVo[indCond] then
         Rash[12]:=Rashodi[12]/TrebKolVo[indCond];
       //writeln('������� �400=',Rash[12]:5:2);
       AllTreb(TotalFlComp, FaktOch,FaktDNP,FaktBenzol,FaktArom,FaktOlef,FaktSera,FaktKolVo);
       //writeln(FaktOch:5:2,' ',FaktDNP:5:2,' ',FaktBenzol:5:2,' ',FaktArom:5:2,' ',FaktOlef:5:2,' ',FaktSera:5:2,' ',FaktKolVo:5:2);

    end;

 AllTreb(TotalFlComp,FaktOch,FaktDNP,FaktBenzol,FaktArom,FaktOlef,FaktSera,FaktKolVo);
      
If (FaktKolVo-1<0) or (FaktOch-TrebOch[indCond]>0.2) or (FaktDNP>TrebDNPmax[indCond]) or
   (FaktBenzol>TrebBenzol[indCond]+0.02) or (FaktArom>TrebArom[indCond]+0.2) or
   (FaktOlef>TrebOlef[indCond]) or (FaktSera>TrebSera[indCond]+0.001) then
                begin
      // If TrebOch[indCond]<90 then
          begin
            //������� �� ���������� ���������� ��������� 600
               If Rash[3]=0 then 
                begin
                   If (Rash[4]>0) then
                     Rash[4]:=Rash[4]-0.01;  
                   IF Rash[4]<0 then
                      Rash[4]:=0;
                      Ref600Stop:=1;
                end;
            
            //������� �� ���������� ���������� ��������� 1000
               If Rash[5]=0 then 
                begin
                   If (Rash[3]>0) then
                     Rash[3]:=Rash[3]-0.01;  
                   IF Rash[3]<0 then
                      Rash[3]:=0;
                      Ref1000Stop:=1;
                end;
          
          
          //������� �� ���������� ���������� �������
               If Rash[1]=0 then
                begin
                   If (Rash[5]>0) then
                     Rash[5]:=Rash[5]-0.01;  
                   IF Rash[5]<0 then
                      Rash[5]:=0;
                      ToluolStop:=1;
                end;            
          end;
          
          
          
          //������� �� ���������� ���������� �����
               If Rash[2]=0 then
                begin
                   If (Rash[1]>0) then
                     Rash[1]:=Rash[1]-0.01;  
                   IF Rash[1]<0 then
                      Rash[1]:=0;
                end;
          
          //������� �� ���������� ���������� �� 1/1
                 If (Rash[2]>0) then
                   Rash[2]:=Rash[2]-0.01;  
                 IF Rash[2]<0 then
                    Rash[2]:=0;
                 
If Ref1000Stop=0 then        
Rash[3]:=0;
If Ref600Stop=0 then                    
Rash[4]:=0;
If ToluolStop=0 then
Rash[5]:=0;
Rash[6]:=0;
Rash[7]:=0;
Rash[8]:=0;
Rash[9]:=0;
                     
AllTreb(TotalFlComp,FaktOch,FaktDNP,FaktBenzol,FaktArom,FaktOlef,FaktSera,FaktKolVo);
                 IF (Ref1000Stop=0) or (Rash[3]>0) or (Ref600Stop=0) or (Rash[4]>0)  then
                   GoTo M1;
                   
                  
                end;


 AllTreb(TotalFlComp,FaktOch,FaktDNP,FaktBenzol,FaktArom,FaktOlef,FaktSera,FaktKolVo);
 // �������� �� ������
sum:=0;
 for ii:=1 to n do
begin
  sum:=sum+Rash[ii];
end;

if
(
((sum=0) and (TrebKolVo[indCond]>0))
or (
(FaktKolVo-1<0)
or (FaktOch-TrebOch[indCond]>0.2)
or (FaktDNP>TrebDNPmax[indCond])
or (FaktDNP<TrebDNPmin[indCond])
or (FaktBenzol>TrebBenzol[indCond]+0.02)
or (FaktArom>TrebArom[indCond]+0.2)
or (FaktOlef>TrebOlef[indCond])
or (FaktSera>TrebSera[indCond]+0.001)
    )
)
then
begin
  TrebKolVo[indCond]:=TrebKolVo[indCond]-h_kol;
  if TrebKolVo[indCond]>0 then
    goto M2
  else
    TrebKolVo[indCond]:=0;
end;
{if TrebKolVo[indCond]>sum then
begin
  CreateMessageDialog('�� �����? ������� ������, ��� �����..', mtConfirmation, [mbYes, mbNo]).ShowModal;
  exit;
end; }


 FormFlowofOV.StringGridResult.RowCount:=8;
 FormFlowofOV.StringGridResult.ColCount:=indCond+2;
 FormFlowofOV.StringGridResult.Cells[0,0]:='��������';

 FormFlowofOV.StringGridResult.Cells[1+indCond,0]:=TotalFlComp.ArrConditions.Conditions[indCond].Name;
 FormFlowofOV.StringGridResult.Cells[0,1]:='����.��';
 FormFlowofOV.StringGridResult.Cells[1+indCond,1]:=FloatToStr(roundto(FaktOch,-2));
 FormFlowofOV.StringGridResult.Cells[0,2]:='����.���';
 FormFlowofOV.StringGridResult.Cells[1+indCond,2]:=FloatToStr(roundto(FaktDNP,-2));
 FormFlowofOV.StringGridResult.Cells[0,3]:='����.����.';
 FormFlowofOV.StringGridResult.Cells[1+indCond,3]:=FloatToStr(roundto(FaktBenzol,-2));
 FormFlowofOV.StringGridResult.Cells[0,4]:='����.����.';
 FormFlowofOV.StringGridResult.Cells[1+indCond,4]:=FloatToStr(roundto(FaktArom,-2));
 FormFlowofOV.StringGridResult.Cells[0,5]:='����.����.';
 FormFlowofOV.StringGridResult.Cells[1+indCond,5]:=FloatToStr(roundto(FaktOlef,-2));
 FormFlowofOV.StringGridResult.Cells[0,6]:='����.����';
 FormFlowofOV.StringGridResult.Cells[1+indCond,6]:=FloatToStr(roundto(FaktSera, -4));
 FormFlowofOV.StringGridResult.Cells[0,7]:='����.���-��';
 FormFlowofOV.StringGridResult.Cells[1+indCond,7]:=FloatToStr(roundto(TrebKolVo[indCond],-2));

 FormFlowofOV.SG1Itog.Cells[0,0]:='�����';
 FormFlowofOV.SG1Itog.ColCount:=indCond+2;
 FormFlowofOV.SG1Itog.Cells[1+indCond,0]:=TotalFlComp.ArrConditions.Conditions[indCond].Name;
 For ii:=1 to n do
  begin
    if TotalFlComp.GetFlowOfIndexOfCondition(ii)<>nil then
    FormFlowofOV.SG1Itog.Cells[0,ii]:=TotalFlComp.GetFlowOfIndexOfCondition(ii).Name;
    FormFlowofOV.SG1Itog.Cells[1+indCond,ii]:=FloatToStr(roundto(Rash[ii],-3));

  end;
  sum:=0;
  For ii:=1 to n do
    sum:=sum+roundto(Rash[ii],-3);

  for ii:=0 to Length(TotalFlComp.Flows)-1 do
  begin
    TotalFlComp.Flows[ii].Expenditure:=TotalFlComp.Flows[ii].ExistExpenditure;
  end;

  for ii:=1 to n do
  begin
    MyFlow:=TotalFlComp.GetFlowOfIndexOfCondition(ii);
    if MyFlow<>nil then
      MyFlow.ExistExpenditure2:=
        MyFlow.ExistExpenditure2-Rash[ii]*TrebKolVo[indCond];
    if MyFlow<>nil then
      if MyFlow.ExistExpenditure2<0 then
      begin
        MyFlow.ExistExpenditure2:=0;
      end;
  end;

end;

end.