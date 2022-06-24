%处理参数,将OrgBrand和message整合成麻将组MahjongCount

%{

OrgBrand  %[]byte 未处理的所有牌的值 %不计花牌

%牌信息,如吃，碰，杠等
message=struct(...
    'chi',[],...   %吃得的顺子
    'peng',[],...  %碰得的刻子
    'gang',[],...  %杠 
         ...
    'HuaPai',[],...
    'Jiang' ,0, ...
	'TongTian' ,0, ... 
	'Zimo' ,0, ...
	'MenFeng' ,0, ...
	'TingBool' ,0 ...
);



%麻将组 
   MahjongCount=struct(...
    'Array_all' ,[], ...[]byte 所有牌的值
    'Arrat_num',0,  ...byte 总牌的数量
    ...刻与杠不重复计算，能记杠则不记刻。
	'Array_ke' ,[], ...  []byte 刻子数组 (只列第一个值) (包含暗刻和碰)（如顺子111万 只记19）
    'Array_m_ke'[], ...     []byte 明刻  （碰） 
	'Array_a_ke' ,[], ...  []byte 暗刻
    ... 
	'Array_shun' ,[], ...  []byte 顺子数组 (只列第一个值)
	'Array_c_shun',[], ...  []byte 吃牌获得的顺子 (吃)
	'Array_h_shun',[], ...  []byte 手牌中的顺子
    ...
	'Array_gang' ,[], ...  []byte 杠数组 (只列第一个值) (包含明杠 暗杠)
	'Array_m_gang',[], ...  []byte 明杠  (杠)
	'Array_a_gang' ,[], ...  []byte 暗杠
    ...
    'Array_dui',[],... []byte  对子 (只列第一个值) (由杠可得两个对子 由刻子可得一个对子)
    ...
    'HuaPai',[],...[]byte 花牌
    'Jiang' ,0, ...   byte  将牌值
	'QiDui' ,0, ...  boolean (1 or 0)  是否七对
	'TongTian' ,0, ...  boolean (1 or 0)  是否通天
	'Zimo' ,0, ... boolean (1 or 0)	是否自摸
	'MenFeng' ,0, ...  boolean (1 or 0) 当前胡牌玩家门风
	'TingBool' ,0    ... boolean (1 or 0) 是否报听
       );
%}

function MahjongCount = process(OrgBrand,message)
    MahjongCount=struct();
    %简单转换
    OrgBrand=sort(OrgBrand);
    MahjongCount.Array_all=OrgBrand;
    MahjongCount.Arrat_num=length(OrgBrand);
    huaPai=sort(message.HuaPai);
    MahjongCount.HuaPai=huaPai;
    MahjongCount.Jiang=message.Jiang;
    MahjongCount.TongTian=message.TongTian;
    MahjongCount.Zimo=message.Zimo;
    MahjongCount.MenFeng=message.MenFeng;
    MahjongCount.TingBool=message.TingBool;

    %获得去重牌组
    brand_wr = unique(OrgBrand);
    %刻子和杠子的预处理
    arr_ke=zeros(1,length(brand_wr));
    arr_gang=zeros(1,length(brand_wr));
    %有三个相同的数，为刻子；有四个相同的数，为杠
    for i=1:length(brand_wr)
        if(length(find(OrgBrand==brand_wr(i)))==3)
            arr_ke(i)=brand_wr(i);
        end
        if(length(find(OrgBrand==brand_wr(i)))==4)
            arr_gang(i)=brand_wr(i);
        end
    end
    arr_ke=arr_ke(arr_ke>0);
    arr_gang=arr_gang(arr_gang>0);

    %刻子
    arr_ke=sort(arr_ke);
    if(isempty(arr_ke))
        arr_ke=[];
    end
    MahjongCount.Array_ke=arr_ke; %全刻
    arr_m_ke=message.peng;
    arr_a_ke=zeros(1,length(arr_ke));
    %用全刻和明刻求暗刻
    arr=[arr_ke arr_m_ke];
    for i=1:length(arr_ke)
        if(length(find(arr==arr_ke(i)))==1)
            arr_a_ke(i)=arr_ke(i);
        end
    end
    arr_a_ke=arr_a_ke(arr_a_ke>0);
    arr_m_ke=sort(arr_m_ke);
    if(isempty(arr_m_ke))
        arr_m_ke=[];
    end
    MahjongCount.Array_m_ke=arr_m_ke; %明刻
    arr_a_ke=sort(arr_a_ke);
    if(isempty(arr_a_ke))
        arr_a_ke=[];
    end
    MahjongCount.Array_a_ke=arr_a_ke; %暗刻
     

    %杠子
    arr_gang=sort(arr_gang);
    if(isempty(arr_gang))
        arr_gang=[];
    end
    MahjongCount.Array_gang=arr_gang; %全杠
    arr_m_gang=message.gang; %杠
    arr_a_gang=zeros(1,length(arr_gang));
    %用全杠和明杠找暗杠
    arr=[arr_gang arr_m_gang];
    for i=1:length(arr_gang)
        if(length(find(arr==arr_gang(i)))==1)
            arr_a_gang(i)=arr_gang(i);
        end
    end
    arr_a_gang=arr_a_gang(arr_a_gang>0);
    arr_m_gang=sort(arr_m_gang);
    MahjongCount.Array_m_gang=arr_m_gang; %明杠
    arr_a_gang=sort(arr_a_gang);
    if(isempty(arr_a_gang))
        arr_a_gang=[];
    end
    MahjongCount.Array_a_gang=arr_a_gang; %暗杠


    %顺子 
    %先从去重后的brand_wr求出存在的顺子arr
    %再计算顺子n三个数(n,n+1,n+2)在原向量里的数量，以三种的最小值作为这个顺子的n的数目
    arr=zeros(1,length(brand_wr)-2);
    for i=1:length(brand_wr)-2
        if(brand_wr(i)+1==brand_wr(i+1)&&brand_wr(i+1)+1==brand_wr(i+2))
           arr(i)=brand_wr(i);
        end
    end
    arr=arr(arr>0);
    arr_all=OrgBrand(OrgBrand<28); %(字牌不算顺子)
    arr_shun=zeros(1,length(arr)*4);
    count=1;
    for i=1:length(arr)
        num=arr(i);
        len1=length(find(arr_all==num));
        len2=length(find(arr_all==(num+1)));
        len3=length(find(arr_all==(num+2)));
        minNum= min(len3,min(len2,len1));
        for j=1:minNum
            arr_shun(count)=num;
            count=count+1;
        end
    end
    arr_shun=arr_shun(arr_shun>0);
    if(isempty(arr_shun))
        arr_shun=[];
    end
    arr_shun=sort(arr_shun);
    MahjongCount.Array_shun=arr_shun; %全顺子
    MahjongCount.Array_c_shun=sort(message.chi);  %吃牌获得的顺子
    arr_c_shun=message.chi;
 
    %用arr_shun和arr_c_shun求 arr_h_shun
    index=zeros(1,length(arr_c_shun));
    for i = 1:length(arr_c_shun)
        ind=find(arr_shun==arr_c_shun(i));
        index(i)=ind(1);
    end
    index=index(index>0);
    arr_h_shun=arr_shun;
    arr_h_shun(index)=[];

    if(isempty(arr_h_shun))
         arr_h_shun=[];
    end
    arr_h_shun=sort(arr_h_shun);
    MahjongCount.Array_h_shun=arr_h_shun; %手牌中的顺子

 
    %对子  (由杠可得两个对子 由刻子可得一个对子)
    arr_dui=zeros(1,7);
    arr=OrgBrand;
    count = 1;
    %杠拆对子
    for i=1:length(MahjongCount.Array_gang)
        arr_dui(count)=MahjongCount.Array_gang(i);
        count=count+1;
        arr_dui(count)=MahjongCount.Array_gang(i);
        count=count+1;
        arr(arr==MahjongCount.Array_gang(i))=[];
    end
    %刻拆对子
    for i=1:length(MahjongCount.Array_ke)
        arr_dui(count)=MahjongCount.Array_ke(i);
        count=count+1;
        index=find(arr==MahjongCount.Array_ke(i));
        arr([index(1) index(2)])=[];
    end
    arr=sort(arr);
    
    for i=1:length(arr)-1
       if(arr(i)==arr(i+1))
            arr_dui(count)=arr(i);
        count=count+1;
       end
    end
    arr_dui=arr_dui(arr_dui>0);
    arr_dui=sort(arr_dui);
    MahjongCount.Array_dui=arr_dui;

    MahjongCount.QiDui=0;
    if(length(MahjongCount.Array_dui)==7)
        MahjongCount.QiDui=1;
    end

    %显示
    disp('MahjongCount:');
    disp(MahjongCount);
end

