unit basres2;

interface
uses basa, unit5;
 var
      re:text;
      KirSir,KirKat,KirKatK,KirBp,KirPent:array[1..69] of real;
      S1,S2,S3,S4,S5,SS1,SS2,SS3,SS4,SS5:real;
      i:integer;
      t:integer;
      clavisha:char;
{          Puti,Nazvanie:string;}


   procedure rezultkir1(Nazvanie:string);
//   procedure rezultkir2(Nazvanie:string);
//   procedure orezultkir;

   IMPLEMENTATION

procedure rezultkir1(Nazvanie:string);
        begin
              assignfile(re,Putb+'\'+DataOt+'.sk');
              try
              rewrite(re);

{ S1:=0;S2:=0;//S3:=0;S4:=0;S5:=0;
 for i:=1 to 68 do
    begin
         S1:=S1+KirSir[i];
         S2:=S2+KirKat[i];
         S3:=S3+KirBp[i];
         S4:=S4+KirKatK[i];
         S5:=S5+KirPent[i];
    end;       }


{ for i:=1 to 68 do
    begin
         KirSir[i]:=(KirSir[i]*100)/S1;
         KirKat[i]:=(KirKat[i]*100)/S2;
         KirBp[i]:=(KirBp[i]*100)/S3;
         KirKatK[i]:=(KirKatK[i]*100)/S4;
         KirPent[i]:=(KirPent[i]*100)/S5;
    end;                   }


{ SS1:=0;SS2:=0;//SS3:=0;SS4:=0;SS5:=0;
 for i:=1 to 69 do
    begin
         SS1:=SS1+KirSir[i];
         SS2:=SS2+KirKat[i];
         SS3:=SS3+KirBp[i];
         SS4:=SS4+KirKatK[i];
         SS5:=SS5+KirPent[i];
    end;                       }

              writeln(re,' 1   ����        ',KirSir[1]:6:3);
              writeln(re,' 2   �p����      ',KirSir[2]:6:3);
              writeln(re,' 3   �-�����     ',KirSir[3]:6:3);
              writeln(re,' 4   �-�����     ',KirSir[4]:6:3);
              writeln(re,' 5   �-������    ',KirSir[5]:6:3);
              writeln(re,' 6   �-������    ',KirSir[6]:6:3);
              writeln(re,' 7   2,2-���     ',KirSir[7]:6:3);
              writeln(re,' 8   �-������    ',KirSir[8]:6:3);
              writeln(re,' 9   2,3-���     ',KirSir[9]:6:3);
              writeln(re,'10   2-��        ',KirSir[10]:6:3);
              writeln(re,'11   3-��        ',KirSir[11]:6:3);
              writeln(re,'12   �-������    ',KirSir[12]:6:3);
              writeln(re,'13   ���         ',KirSir[13]:6:3);
              writeln(re,'14   2,2-���     ',KirSir[14]:6:3);
              writeln(re,'15   2,4-���     ',KirSir[15]:6:3);
              writeln(re,'16   ������      ',KirSir[16]:6:3);
              writeln(re,'17   2,2,3-���   ',KirSir[17]:6:3);
              writeln(re,'18   3,3-���     ',KirSir[18]:6:3);
              writeln(re,'19   �������     ',KirSir[19]:6:3);
              writeln(re,'20   2-��        ',KirSir[20]:6:3);
              writeln(re,'21   2,3-���     ',KirSir[21]:6:3);
              writeln(re,'22   3-��        ',KirSir[22]:6:3);
              writeln(re,'23   1,3-����(�) ',KirSir[23]:6:3);
              writeln(re,'24   1,3-����(�) ',KirSir[24]:6:3);
              writeln(re,'25   1,2-����(�) ',KirSir[25]:6:3);
              writeln(re,'26   �-������    ',KirSir[26]:6:3);
              writeln(re,'27   1,2-����    ',KirSir[27]:6:3);
              writeln(re,'28   2,2-���     ',KirSir[28]:6:3);
              writeln(re,'29   1,1,3-����  ',KirSir[29]:6:3);
              writeln(re,'30   ���         ',KirSir[30]:6:3);
              writeln(re,'31   2,5-���     ',KirSir[31]:6:3);
              writeln(re,'32   2,4-���     ',KirSir[32]:6:3);
              writeln(re,'33   ���         ',KirSir[33]:6:3);
              writeln(re,'34   2,2,3-���   ',KirSir[34]:6:3);
              writeln(re,'35   1,2,4-����  ',KirSir[35]:6:3);
              writeln(re,'36   3,3-���     ',KirSir[36]:6:3);
              writeln(re,'37   ������      ',KirSir[37]:6:3);
              writeln(re,'38   1,2,3-����  ',KirSir[38]:6:3);
              writeln(re,'39   2,3,4-���   ',KirSir[39]:6:3);
              writeln(re,'40   2,3-���     ',KirSir[40]:6:3);
              writeln(re,'41   2-�,3-��    ',KirSir[41]:6:3);
              writeln(re,'42   1,1,2-����  ',KirSir[42]:6:3);
              writeln(re,'43   2-���       ',KirSir[43]:6:3);
              writeln(re,'44   4-���       ',KirSir[44]:6:3);
              writeln(re,'45   3,4-���     ',KirSir[45]:6:3);
              writeln(re,'46   3-���       ',KirSir[46]:6:3);
              writeln(re,'47   ����.�� �8  ',KirSir[47]:6:3);
              writeln(re,'48   �-�����     ',KirSir[48]:6:3);
              writeln(re,'49   1,2-����(�) ',KirSir[49]:6:3);
              writeln(re,'50   1,3-����(�) ',KirSir[50]:6:3);
              writeln(re,'51   2,3,5-���   ',KirSir[51]:6:3);
              writeln(re,'52   2,2-����    ',KirSir[52]:6:3);
              writeln(re,'53   2,4-����    ',KirSir[53]:6:3);
              writeln(re,'54   2,2,3-���   ',KirSir[54]:6:3);
              writeln(re,'55   2-�,4-��    ',KirSir[55]:6:3);
              writeln(re,'56   2,6-����    ',KirSir[56]:6:3);
              writeln(re,'57   2,5-����    ',KirSir[57]:6:3);
              writeln(re,'58   3,3-����    ',KirSir[58]:6:3);
              writeln(re,'59   ���+�����   ',KirSir[59]:6:3);
              writeln(re,'60   ����        ',KirSir[60]:6:3);
              writeln(re,'61   2,3,4-���   ',KirSir[61]:6:3);
              writeln(re,'62   �-������    ',KirSir[62]:6:3);
              writeln(re,'63   �-������    ',KirSir[63]:6:3);
              writeln(re,'64   �-�9        ',KirSir[64]:6:3);
              writeln(re,'65   �-������    ',KirSir[65]:6:3);
              writeln(re,'66   ����. �� �9 ',KirSir[66]:6:3);
              writeln(re,'67   �-�����     ',KirSir[67]:6:3);
              writeln(re,'68   �9+         ',KirSir[68]:6:3);
              writeln(re,'69   � �.�. �p   ',KirSir[69]:6:3);
              writeln(re,' 1   ����        ',KirKatK[1]:6:3);
              writeln(re,' 2   �p����      ',KirKatK[2]:6:3);
              writeln(re,' 3   �-�����     ',KirKatK[3]:6:3);
              writeln(re,' 4   �-�����     ',KirKatK[4]:6:3);
              writeln(re,' 5   �-������    ',KirKatK[5]:6:3);
              writeln(re,' 6   �-������    ',KirKatK[6]:6:3);
              writeln(re,' 7   2,2-���     ',KirKatK[7]:6:3);
              writeln(re,' 8   �-������    ',KirKatK[8]:6:3);
              writeln(re,' 9   2,3-���     ',KirKatK[9]:6:3);
              writeln(re,'10   2-��        ',KirKatK[10]:6:3);
              writeln(re,'11   3-��        ',KirKatK[11]:6:3);
              writeln(re,'12   �-������    ',KirKatK[12]:6:3);
              writeln(re,'13   ���         ',KirKatK[13]:6:3);
              writeln(re,'14   2,2-���     ',KirKatK[14]:6:3);
              writeln(re,'15   2,4-���     ',KirKatK[15]:6:3);
              writeln(re,'16   ������      ',KirKatK[16]:6:3);
              writeln(re,'17   2,2,3-���   ',KirKatK[17]:6:3);
              writeln(re,'18   3,3-���     ',KirKatK[18]:6:3);
              writeln(re,'19   �������     ',KirKatK[19]:6:3);
              writeln(re,'20   2-��        ',KirKatK[20]:6:3);
              writeln(re,'21   2,3-���     ',KirKatK[21]:6:3);
              writeln(re,'22   3-��        ',KirKatK[22]:6:3);
              writeln(re,'23   1,3-����(�) ',KirKatK[23]:6:3);
              writeln(re,'24   1,3-����(�) ',KirKatK[24]:6:3);
              writeln(re,'25   1,2-����(�) ',KirKatK[25]:6:3);
              writeln(re,'26   �-������    ',KirKatK[26]:6:3);
              writeln(re,'27   1,2-����    ',KirKatK[27]:6:3);
              writeln(re,'28   2,2-���     ',KirKatK[28]:6:3);
              writeln(re,'29   1,1,3-����  ',KirKatK[29]:6:3);
              writeln(re,'30   ���         ',KirKatK[30]:6:3);
              writeln(re,'31   2,5-���     ',KirKatK[31]:6:3);
              writeln(re,'32   2,4-���     ',KirKatK[32]:6:3);
              writeln(re,'33   ���         ',KirKatK[33]:6:3);
              writeln(re,'34   2,2,3-���   ',KirKatK[34]:6:3);
              writeln(re,'35   1,2,4-����  ',KirKatK[35]:6:3);
              writeln(re,'36   3,3-���     ',KirKatK[36]:6:3);
              writeln(re,'37   ������      ',KirKatK[37]:6:3);
              writeln(re,'38   1,2,3-����  ',KirKatK[38]:6:3);
              writeln(re,'39   2,3,4-���   ',KirKatK[39]:6:3);
              writeln(re,'40   2,3-���     ',KirKatK[40]:6:3);
              writeln(re,'41   2-�,3-��    ',KirKatK[41]:6:3);
              writeln(re,'42   1,1,2-����  ',KirKatK[42]:6:3);
              writeln(re,'43   2-���       ',KirKatK[43]:6:3);
              writeln(re,'44   4-���       ',KirKatK[44]:6:3);
              writeln(re,'45   3,4-���     ',KirKatK[45]:6:3);
              writeln(re,'46   3-���       ',KirKatK[46]:6:3);
              writeln(re,'47   ����.�� �8  ',KirKatK[47]:6:3);
              writeln(re,'48   �-�����     ',KirKatK[48]:6:3);
              writeln(re,'49   1,2-����(�) ',KirKatK[49]:6:3);
              writeln(re,'50   1,3-����(�) ',KirKatK[50]:6:3);
              writeln(re,'51   2,3,5-���   ',KirKatK[51]:6:3);
              writeln(re,'52   2,2-����    ',KirKatK[52]:6:3);
              writeln(re,'53   2,4-����    ',KirKatK[53]:6:3);
              writeln(re,'54   2,2,3-���   ',KirKatK[54]:6:3);
              writeln(re,'55   2-�,4-��    ',KirKatK[55]:6:3);
              writeln(re,'56   2,6-����    ',KirKatK[56]:6:3);
              writeln(re,'57   2,5-����    ',KirKatK[57]:6:3);
              writeln(re,'58   3,3-����    ',KirKatK[58]:6:3);
              writeln(re,'59   ���+�����   ',KirKatK[59]:6:3);
              writeln(re,'60   ����        ',KirKatK[60]:6:3);
              writeln(re,'61   2,3,4-���   ',KirKatK[61]:6:3);
              writeln(re,'62   �-������    ',KirKatK[62]:6:3);
              writeln(re,'63   �-������    ',KirKatK[63]:6:3);
              writeln(re,'64   �-�9        ',KirKatK[64]:6:3);
              writeln(re,'65   �-������    ',KirKatK[65]:6:3);
              writeln(re,'66   ����. �� �9 ',KirKatK[66]:6:3);
              writeln(re,'67   �-�����     ',KirKatK[67]:6:3);
              writeln(re,'68   �9+         ',KirKatK[68]:6:3);
              writeln(re,'69   � �.�. �p   ',KirKatK[69]:6:3);
              writeln(re,'                 ',StrToFl(BasaDan.F1.Text):3:0);
              writeln(re,'                 ',StrToFl(BasaDan.F2.Text):3:0);
              writeln(re,'                 ',StrToFl(BasaDan.F3.Text):3:0);
              writeln(re,'                 ',StrToFl(BasaDan.F4.Text):3:0);
              writeln(re,'                 ',StrToFl(BasaDan.F5.Text):3:0);
              writeln(re,'                 ',Ps:4:3);
              finally
              closefile(re);
              end;
  end;

end.
 