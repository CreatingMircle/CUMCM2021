y1 = [2.07 
5.85 
14.97 
19.68 
36.80 
];%%乙醇转化率(%) 需要手动替换的数据1

y2 = [34.05
37.43
46.94
49.7
47.21
];%%C4烯烃选择性(%) 需要手动替换的数据2

Y=[y1,y2];%%观测值

%% 温度
x1 = [250
275
300
325
350
];%%温度 需要手动替换的数据3
x2 = x1;
X = [x1,x2];
%% 催化剂相应指标 Co/SiO2浓度，Co/SiO2溶液量（多少多少毫升），HAP浓度，HAP溶液量
% <<<<<<<<<<<<<<<<<<<<<只替换这部分<<<<<<<<<<<<<<<<<<<<
 Co_Nong = 1;%%Co/SiO2浓度
 Co_Ti = 200;%%Co/SiO2溶液量
 HAP_Nong = 1.68;%%HAP浓度
 HAP_Ti = 200;%%HAP溶液量
%  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
% %  构造Z矩阵 这部分不要动
zz = [Co_Nong Co_Ti HAP_Nong HAP_Ti];
for channel_ii = 1:1:size(x1,1)
    Z(channel_ii,:) = zz;
end
%% 这部分不要动
nvar = size(Y,2);
regressors = X;
for ii=1:nvar
    xvec = Y(:,ii);
    [G(:,ii),B(:,ii)] = LS_Estimate(X,Z, xvec);   
end
%% 只需要提取G就是需要的数据内容
