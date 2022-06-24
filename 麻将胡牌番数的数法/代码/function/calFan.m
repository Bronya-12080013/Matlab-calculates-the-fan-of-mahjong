%计算番数
function [fanName,fanNum]=calFan(OrgBrand,message)
addpath(genpath('./tool'));
addpath(genpath('./FanTypeCalculation'));

%调用process对参数进行处理整合
mjc = process(OrgBrand,message);
%代表81个番种 (1或0)
confirm=zeros(1,81); %番种成立
ban=zeros(1,81);    %番种不记

%对81个番种逐个判断 已实现部分函数

%88番
[confirm,ban]=DASIXI(mjc,confirm,ban); %大四喜
%[confirm,ban]=SHISANYAO(mjc,confirm,ban);
%[confirm,ban]=LIANQIDUI(mjc,confirm,ban);
%[confirm,ban]=SIGANG(mjc,confirm,ban);
%[confirm,ban]=JIUBAOLIANDENG(mjc,confirm,ban); 
%[confirm,ban]=LVYISE(mjc,confirm,ban);
%[confirm,ban]=DASANYUAN(mjc,confirm,ban);

%64番
[confirm,ban]=YISESHUANGLONGHUI(mjc,confirm,ban); %一色双龙会
%[confirm,ban]=SIANKE(mjc,confirm,ban);
[confirm,ban]=ZIYISE(mjc,confirm,ban); %字一色
%[confirm,ban]=XIAOSANYUAN(mjc,confirm,ban);
%[confirm,ban]=XIAOSIXI(mjc,confirm,ban);
%[confirm,ban]=QINGYAOJIU(mjc,confirm,ban);

%48番
[confirm,ban]=YISESIJIEGAO(mjc,confirm,ban); %一色四节高
%[confirm,ban]=YISESITONGSHUN(mjc,confirm,ban); 

%32番
[confirm,ban]=HUNYAOJIU(mjc,confirm,ban); %混幺九
%[confirm,ban]=SANGANG(mjc,confirm,ban); 
%[confirm,ban]=YISESIBUGAO(mjc,confirm,ban); 

%24番
[confirm,ban]=QUANXIAO(mjc,confirm,ban); %全小
%[confirm,ban]=QUANZHONG(mjc,confirm,ban);
%[confirm,ban]=QUANDA(mjc,confirm,ban);
%[confirm,ban]=YISESANJIEGAO(mjc,confirm,ban);
%[confirm,ban]=YISESANTONGSHUN(mjc,confirm,ban);
%[confirm,ban]=QINGYISE(mjc,confirm,ban);
%[confirm,ban]=QUANSHUANGKE(mjc,confirm,ban);
%[confirm,ban]=QIXINGBUKAO(mjc,confirm,ban);
%[confirm,ban]=QIDUI(mjc,confirm,ban);

%16番
[confirm,ban]=SANANKE(mjc,confirm,ban); %三暗刻
%[confirm,ban]=SANTONGKE(mjc,confirm,ban);
%[confirm,ban]=QUANDAIWU(mjc,confirm,ban);
%[confirm,ban]=YISESANBUGAO(mjc,confirm,ban);
%[confirm,ban]=SANSESHUANLONGHUI(mjc,confirm,ban);
%[confirm,ban]=QINGLONG(mjc,confirm,ban);

%12番
[confirm,ban]=SANFENGKE(mjc,confirm,ban);%三风刻
%[confirm,ban]=XIAOYUWU(mjc,confirm,ban);
%[confirm,ban]=DAYUWU(mjc,confirm,ban);
%[confirm,ban]=ZHUHELONG(mjc,confirm,ban);
%[confirm,ban]=QUANBUKAO(mjc,confirm,ban);

%8番
[confirm,ban]=HUALONG(mjc,confirm,ban); %花龙
%[confirm,ban]=QIANGGANGHU(mjc,confirm,ban);
%[confirm,ban]=GANGSHANGKAIHUA(mjc,confirm,ban);
%[confirm,ban]=HAIDILAOYUE(mjc,confirm,ban);
%[confirm,ban]=MIAOSHOUHUICHUN(mjc,confirm,ban);
%[confirm,ban]=WUFANHE(mjc,confirm,ban);
%[confirm,ban]=SANSESANJIE(mjc,confirm,ban);
%[confirm,ban]=SANSESANTONGSHUN(mjc,confirm,ban);
%[confirm,ban]=TUIBUDAO(mjc,confirm,ban);

%6番
[confirm,ban]=SHUANGJIANKE(mjc,confirm,ban); %双箭刻
%[confirm,ban]=SHUANGANGANG(mjc,confirm,ban);
%[confirm,ban]=QUANQIUREN(mjc,confirm,ban);
%[confirm,ban]=WUMENGQI(mjc,confirm,ban);
%[confirm,ban]=SANSESANBUGAO(mjc,confirm,ban);
%[confirm,ban]=HUNYISE(mjc,confirm,ban);
%[confirm,ban]=PENGPENGHU(mjc,confirm,ban);

%4番
[confirm,ban]=QUANDAIYAO(mjc,confirm,ban); %全带幺
%[confirm,ban]=HUJUEZHANG(mjc,confirm,ban);
[confirm,ban]=SHUANGMINGGANG(mjc,confirm,ban); %双明杠
%[confirm,ban]=BUQIUREN(mjc,confirm,ban);

%2番
[confirm,ban]=DUANYAO(mjc,confirm,ban); %断幺
%[confirm,ban]=ANGANG(mjc,confirm,ban);
%[confirm,ban]=SHUANGANKE(mjc,confirm,ban);
%[confirm,ban]=SHUANGTONGKE(mjc,confirm,ban);
%[confirm,ban]=SIGUIYI(mjc,confirm,ban);
%[confirm,ban]=PINGHU(mjc,confirm,ban);
%[confirm,ban]=MENQIANQING(mjc,confirm,ban);
%[confirm,ban]=MENFENGKE(mjc,confirm,ban);
%[confirm,ban]=QUANFENGKE(mjc,confirm,ban);
%[confirm,ban]=JIANKE(mjc,confirm,ban);

%1番
[confirm,ban]=YIBANGAO(mjc,confirm,ban); %一般高
[confirm,ban]=ZIMO(mjc,confirm,ban);  %自摸
%[confirm,ban]=DANDIAOJIANG(mjc,confirm,ban);
%[confirm,ban]=KANZHANG(mjc,confirm,ban);
%[confirm,ban]=BIANZHANG(mjc,confirm,ban);
%[confirm,ban]=WUZHI(mjc,confirm,ban);
%[confirm,ban]=QUEYIMENG(mjc,confirm,ban);
%[confirm,ban]=MINGGANG(mjc,confirm,ban);
%[confirm,ban]=YAOJIUKE(mjc,confirm,ban);
%[confirm,ban]=LAOSHAOFU(mjc,confirm,ban);
%[confirm,ban]=LIANLIU(mjc,confirm,ban);
%[confirm,ban]=XIXIANGFENG(mjc,confirm,ban);

%花牌补记
[add,confirm,ban]=HUAPAI(mjc,confirm,ban); %花牌

%同时处理confirm和ban,得出番种 (在以上各个番种函数已用ban进行判断，此处非必要)
AprFan=zeros(1,81);
for i=1:81
    if(confirm(i)==1&&ban(i)==0)
        AprFan(i)=1;
    end
end

%获取番种名fanName  根据番种获取最大的番数fanNum
fanName=cell(length(find(AprFan==1)),1);
fanNum=0;
count = 1;
for i=81:-1:1
    if(AprFan(i)==1)
        %根据番种id,调用IndexForName获取番种名
        fanName(count,1)=cellstr(IndexForName(i));
        count=count+1;
        %花牌不记 
        if(i==1)
            continue;
        end
        %根据番种id 调用FanNum获取番数
        fanNum=fanNum+FanNum(i);
    end
end
%返回结果 %补花
 fanNum=fanNum+add;
end

 