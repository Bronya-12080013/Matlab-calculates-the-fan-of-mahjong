%三暗刻：三副暗刻（暗杠）
function  [confirm,ban]= SANANKE(mjc,confirm,ban)
   ft = FanTypeOfIndex;
   if(ban(ft.SANANKE)==1)
       return;
   end
  if(length(mjc.Array_a_ke)<3) %判断是否有三副暗刻
      return;
  end
  confirm(ft.SANANKE)=1;
end

