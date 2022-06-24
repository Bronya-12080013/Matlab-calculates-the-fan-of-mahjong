%根据番种id获取番种对应的番数
function num=FanNum(index)
        % switch index   %报错
     switch 1<=index&&index<=81  %这里要进行判断 
         case 1<=index&&index<=13
            num=1;
         case 14<=index&&index<=23
             num=2;
         case 24<=index&&index<=27
             num=4;
         case 28<=index&&index<=34
             num=6;
         case 35<=index&&index<=43
             num=8;
         case 44<=index&&index<=48
             num=12; 
         case 49<=index&&index<=54
             num=16;             
          case 55<=index&&index<=63
             num=24;   
         case 64<=index&&index<=66
             num=32;   
         case 67<=index&&index<=68
             num=48;   
         case 69<=index&&index<=74
             num=64;   
         case 75<=index&&index<=81
             num=88;   
         otherwise
             num=-1;
     end
end

