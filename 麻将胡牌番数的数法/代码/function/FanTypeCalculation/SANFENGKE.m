%三风刻：和牌中，有三副风刻（杠）。组成三风刻的三副刻子不计幺九刻。
function  [confirm,ban]= SANFENGKE(mjc,confirm,ban)
   ft = FanTypeOfIndex;
   if(ban(ft.SANFENGKE)==1)
       return;
   end
   num_ke=length(mjc.Array_ke);
   num_gang=length(mjc.Array_gang);
    %判断刻或杠的数量是否在3及以上
   if(num_ke>=3||num_gang>=3)
        if(num_ke>=3) 
            arr = mjc.Array_ke;
        else 
            arr = mjc.Array_gang;
        end
        bol = 1;
         %判断风刻（杠）的数目在3及以上
        for i = 1:length(arr)
            if(arr(i)<28||arr(i)>31)
                bol=0;
                break;
            end
        end
        if(bol==1)
            confirm(ft.SANFENGKE)=1;
            ban(ft.YAOJIUKE)=1;
        end
   end
end
