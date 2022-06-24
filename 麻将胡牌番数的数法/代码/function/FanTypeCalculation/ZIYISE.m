%字一色，由字牌的刻子（杠）、将牌组成的和牌。不计碰碰和、全带幺、幺九刻。
function [confirm,ban]=ZIYISE(mjc,confirm,ban)
    ft = FanTypeOfIndex;
   if(ban(ft.ZIYISE)==1)
       return;
   end
 arr=mjc.Array_all;
 for i=1:length(arr)
    if(arr(i)<28||arr(i)>34)
        return;
    end
 end
   confirm(ft.ZIYISE)=1;
   ban(ft.PENGPENGHU)=1;
   ban(ft.QUANDAIYAO)=1;
   ban(ft.YAOJIUKE)=1;
end

