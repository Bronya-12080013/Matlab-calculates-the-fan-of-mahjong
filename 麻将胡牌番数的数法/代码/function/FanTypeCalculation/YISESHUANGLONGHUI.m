%一色双龙会:一种花色的两个老少副，5为将牌。不计平和、七对、清一色、无字、一般高、老少副
function [confirm,ban]=YISESHUANGLONGHUI(mjc,confirm,ban)
   ft = FanTypeOfIndex;
   if(ban(ft.YISESHUANGLONGHUI)==1)
       return;
   end
   %取顺子数组
   arr_shun=mjc.Array_shun;
   %挨个判断
   bing_123 = 0; 
   bing_789 = 0; 
   tiao_123 = 0; 
   tiao_789 = 0; 
   wan_123 = 0;  
   wan_789 = 0;
   for i=1:length(arr_shun)
       num = arr_shun(i);
       if(num==1) 
            bing_123 = bing_123+1;
       end

        if(num==7)
            bing_789 = bing_789+1;
        end

        if(num==10)
            tiao_123 = tiao_123+1;
        end

        if(num==16)
            tiao_789 =  tiao_789+1;
        end
        
        if(num==19)
            wan_123 = wan_123+1;
        end

        if(num==25)
            wan_789 = wan_789+1;
        end
   end

   bol = 0;
   if( bing_123==2&&bing_789==2)
       %判断将牌
        if(mjc.Jiang==5)
            bol=1;
        end
   elseif(tiao_123==2&&tiao_789==2)
       %判断将牌
        if(mjc.Jiang==14)
            bol=1;
        end 
   elseif(wan_123==2&&wan_789==2)
       %判断将牌
        if(mjc.Jiang==23)
            bol=1;
        end
   end

   if(bol==1)
        confirm(ft.YISESHUANGLONGHUI)=1;
        %不计平和、七对、清一色、无字、一般高、老少副
        ban(ft.PINGHU)=1;
        ban(ft.QIDUI)=1;
        ban(ft.QINGYISE)=1;
        ban(ft.WUZHI)=1;
        ban(ft.YIBANGAO)=1;
        ban(ft.LAOSHAOFU)=1;
   end


   
end

