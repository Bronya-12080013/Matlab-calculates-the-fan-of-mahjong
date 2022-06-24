%花龙：一种花色的123、另一种花色的456、第三种花色的789三副顺子。
function [confirm,ban]=  HUALONG(mjc,confirm,ban)
     ft = FanTypeOfIndex;
   if(ban(ft.HUALONG)==1)
       return;
   end
   arr = mjc.Array_shun;
   if length(arr)<3
       return;
   end
   % 设3*3矩阵 1、2、3行各表示饼、条、万三种花色 1、2、3列各表示序数1、2、3
   type =zeros(3,3);
   for i = 1:length(arr)
        num=arr(i);
        if(num==1)
            type(1,1)=1;
        elseif(num==4)
            type(1,2)=1;
        elseif(num==7)
            type(1,3)=1;
        elseif(num==10)
            type(2,1)=1;
        elseif(num==13)
            type(2,2)=1;
        elseif(num==16)
            type(2,3)=1;
        elseif(num==19)
            type(3,1)=1;
        elseif(num==22)
            type(3,2)=1;
        elseif(num==25)
            type(3,3)=1;
        end
   end
   bol = 0;
   %遍历6种情况
   if(type(1,1)==1&&type(2,2)==1&&type(3,3)==1)
      bol=1;
   end
   if(type(1,1)==1&&type(2,3)==1&&type(3,2)==1)
      bol=1;
   end
   if(type(1,2)==1&&type(2,3)==1&&type(3,1)==1)
      bol=1;
   end
   if(type(1,2)==1&&type(2,1)==1&&type(3,3)==1)
      bol=1;
   end
   if(type(1,3)==1&&type(2,1)==1&&type(3,2)==1)
      bol=1;
   end
   if(type(1,3)==1&&type(2,2)==1&&type(3,1)==1)
      bol=1;
   end

   if(bol==1)
        confirm(ft.HUALONG)=1;
   end


end

