%自摸
function [confirm,ban] = ZIMO(mjc,confirm,ban)
 ft = FanTypeOfIndex;
   if(ban(ft.ZIMO)==1)
       return;
   end    

   if(mjc.Zimo==1)
        confirm(ft.ZIMO)=1;
    end
end

