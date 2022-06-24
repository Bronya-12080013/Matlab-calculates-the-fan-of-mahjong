%全带幺：每副顺子、刻子、将牌都有幺九牌
function [confirm,ban]= QUANDAIYAO(mjc,confirm,ban)
    ft = FanTypeOfIndex;
   if(ban(ft.QUANDAIYAO)==1)
       return;
   end
   
   %幺九牌
   nums=[1 9 10 18 19 27 28 29 30 31 32 33 34];

   %判断将牌为幺九牌
   if(length(find(nums==mjc.Jiang))~=1)
       return;
   end

   arr_ke=mjc.Array_ke;
   arr_gang=mjc.Array_gang;
   %判断刻子含有幺九牌
   if(~isempty(arr_ke))
   for i=1:length(arr_ke)
        if (isempty(find(nums==arr_ke(i), 1)))
            return;
        end
   end
   end
   
   %判断杠含有幺九牌
   if(~isempty(arr_gang))
   for i=1:length(arr_gang)
        if (isempty(find(nums==arr_gang(i), 1)))
          return;
        end
   end
   end

   %判断顺子含有幺九牌 %顺子没有字牌
   nums=[1 7 10 16 19 25];
   arr_shun = mjc.Array_shun;
   for i=1:length(arr_shun)
        if (isempty(find(nums==arr_shun(i), 1)))
            return;
        end
   end

   confirm(ft.QUANDAIYAO)=1;
end

