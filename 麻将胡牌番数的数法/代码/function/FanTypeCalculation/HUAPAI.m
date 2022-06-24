%花牌
function [add,comfirm,ban] = HUAPAI(mjc,comfirm,ban)
    ft = FanTypeOfIndex;
   if(ban(ft.HUAPAI)==1)
       return;
   end    
   len=length(mjc.HuaPai);
   if(len>0)
   comfirm(ft.HUAPAI)=1;
   add=len;
   else
       add=0;
   end
   
end

