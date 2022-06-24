%一般高：同一种花色两副相同的顺子
function [confirm,ban] = YIBANGAO(mjc,confirm,ban)
  ft = FanTypeOfIndex;
   if(ban(ft.YIBANGAO)==1)
       return;
   end
    arr=mjc.Array_shun;
    arr_wr=unique(arr); %去重
    bol = 0;
    for i =1:length(arr_wr)
        if(length(find(arr==arr_wr(i)))>=2) %判断是否存在两个相同的顺子
            bol=1;
            break;
        end
    end
    if(bol==1)
        confirm(ft.YIBANGAO)=1;
    end
end

