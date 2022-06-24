%混幺九：由序数牌1、9和字牌的刻子、将牌组成的和牌，不计碰碰胡、全带幺、幺九刻。
function [confirm,ban]=  HUNYAOJIU(mjc,confirm,ban)
   ft = FanTypeOfIndex;
   if(ban(ft.HUNYAOJIU)==1)
       return;
   end
   %判断刻子
   ke_1=0;
   ke_9=0;
   ke_zhi=0;
   arr=mjc.Array_ke;
   for i=1:length(arr)
        num=arr(i);
        if(num==1||num==10||num==19)
            ke_1=ke_1+1;
        elseif(num==9||num==18||num==27)
            ke_9=ke_9+1;
        elseif(num>=28&&num<=34)
            ke_zhi=ke_zhi+1;
        end
   end
   if(ke_1<1||ke_9<1||ke_zhi<1)
       return;
   end
   %判断将牌
   if(mjc.Jiang<28||mjc.Jiang>34)
       return;
   end
   confirm(ft.HUNYAOJIU)=1;
   ban(ft.PENGPENGHU)=1;
   ban(ft.YAOJIUKE)=1;
   ban(ft.QUANDAIYAO)=1;
end

