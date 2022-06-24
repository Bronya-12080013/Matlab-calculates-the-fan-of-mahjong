%断幺：和牌中没有序数牌1、9及字牌。不计无字。
function [confirm,ban]= DUANYAO(mjc,confirm,ban)
    ft = FanTypeOfIndex;
   if(ban(ft.DUANYAO)==1)
       return;
   end
    arr=mjc.Array_all;
    for i = 1:length(arr)
        num = arr(i);
        %判断牌中是否含序数牌1、9及字牌
        if(num==1||num==9||num==10||num==18||num==19||num==27||(28<=num&&num<=34))
            return;
        end
    end
    confirm(ft.DUANYAO)=1;
    ban(ft.WUZHI)=1;
end

