%双箭刻：和牌中，有箭牌的两副刻子（杠）。不计箭刻，组成双箭刻的两副刻子不计幺九刻。
function  [confirm,ban]=SHUANGJIANKE(mjc,confirm,ban)
   ft = FanTypeOfIndex;
   if(ban(ft.SHUANGJIANKE)==1)
       return;
   end
   %判断刻或杠的数量是否在2及以上
   if(length(mjc.Array_ke)>=2||length(mjc.Array_gang)>=2)
        if(length(mjc.Array_ke)>=2)
            arr=mjc.Array_ke;
        else
            arr=mjc.Array_gang;
        end

        num=0;
        %判断箭牌刻（杠）的数目在2及以上
        for i=1:length(arr)
            if(32<=arr(i)&&arr(i)<=34)
                num=num+1;
            end
        end
        if(num>=2)
            confirm(ft.SHUANGJIANKE)=1;
            ban(ft.JIANKE)=1;
            ban(ft.YAOJIUKE)=1;
        end
   end
end

