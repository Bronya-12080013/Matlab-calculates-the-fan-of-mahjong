%一色四节高:同一种花色四副依次递增1的刻子（杠）。不计一色三同顺、一色三节高、碰碰和
function [confirm,ban]= YISESIJIEGAO(mjc,confirm,ban)
   ft = FanTypeOfIndex;
   if(ban(ft.YISESIJIEGAO)==1)
       return;
   end
    
   if(length(mjc.Array_ke)==4||length(mjc.Array_gang)==4) %判断刻子或杠是否有4副 
        %设置为arr
        if(length(mjc.Array_ke)==4)
            arr = mjc.Array_ke;
        end
        if(length(mjc.Array_gang)==4)
            arr = mjc.Array_gang;
        end

        for i =1:length(arr) %判断arr是否具有花色（即都是序数牌，而不是字牌）
            if(27<arr(i))
                return;
            end
        end

        %判断arr是否递增1  (mjc.Array_ke和mjc.Array_gang是有序的)
        if(arr(4)-arr(1)==3)
            confirm(ft.YISESIJIEGAO)=1;
            ban(ft.YISESANTONGSHUN)=1;
            ban(ft.YISESANJIEGAO)=1;
            ban(ft.PENGPENGHU)=1;
        end
        
   end
end


