  %大四喜:和牌中，有东、南、西、北四副刻子（杠）。不计三风刻、碰碰胡、圈风刻、门风刻、幺九刻。
function [confirm,ban]=DASIXI(mjc,confirm,ban)
   ft = FanTypeOfIndex; 
   %
   if(ban(ft.DASIXI)==1)
       return
   end
   num_ke=length(mjc.Array_ke);
   num_gang=length(mjc.Array_gang);
   if(num_ke==4||num_gang==4)
        if(num_ke==4) 
            arr = mjc.Array_ke;
        else 
            arr = mjc.Array_gang;
        end
        bol = 1; 
        %判断刻(杠)是否为东、南、西、北 (刻，杠不会存在重复)
        for i = 1:length(arr)
            if(arr(i)<28||arr(i)>31)
                bol=0;
                break;
            end
        end
        if(bol==1)
            %大四喜
             confirm(ft.DASIXI)=1;
             %不计三风刻、碰碰胡、圈风刻、门风刻、幺九刻。
             ban(ft.SANFENGKE)=1;
              ban(ft.PENGPENGHU)=1;
              ban(ft.QUANFENGKE)=1;
             ban(ft.MENFENGKE)=1;
             ban(ft.YAOJIUKE)=1;
        end
   end


