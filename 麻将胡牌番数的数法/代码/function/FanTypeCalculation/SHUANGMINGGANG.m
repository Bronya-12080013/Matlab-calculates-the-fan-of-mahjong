%双明杠：2个明杠。
function [confirm,ban] = SHUANGMINGGANG(mjc,confirm,ban)
    ft = FanTypeOfIndex;
   if(ban(ft.SHUANGMINGGANG)==1)
       return;
   end
   arr=mjc.Array_m_gang;
   if(length(arr)>=2)
        confirm(ft.SHUANGMINGGANG)=1;
        ban(ft.MINGGANG)=1;
   end
end

