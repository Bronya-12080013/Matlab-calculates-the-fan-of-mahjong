%全小  由序数牌123组成的和牌。不计小于五、无字。
function [confirm,ban]= QUANXIAO(mjc,confirm,ban)
   ft = FanTypeOfIndex;
   if(ban(ft.QUANXIAO)==1)
       return;
   end
   bol=1;
   arr = mjc.Array_all;
   for i=1:length(arr)
       num=arr(i);
       %[1 2 3 10 11 12 19 20 21 ] 分别是 1饼 2饼 3饼 1条 2条 3条 1万 2万 3万的编号
       if(length(find([1 2 3 10 11 12 19 20 21]==num))<1) %判断是否都为序数牌123
            bol=0;
            break;
       end
   end
   if(bol==1)
        confirm(ft.QUANXIAO)=1;
        ban(ft.XIAOYUWU)=1;
        ban(ft.WUZHI)=1;
   end

end

