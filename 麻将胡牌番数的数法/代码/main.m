%主函数
function main(OrgBrand,message)
    %添加文件路径
    addpath(genpath('./function'));
    %调用calFan函数
    [fanName,fanNum]=calFan(OrgBrand,message);

%判断是否胡牌
%以上的81个番种代码未全部实现,故此处可能造成误判 %请用Test里的用例进行测试
if(fanNum==-1)
    disp('未胡牌');
    return;
end

%显示结果
disp('符合番种:')
disp(fanName);
disp('番数:') 
disp(num2str(fanNum)+"番");
end

