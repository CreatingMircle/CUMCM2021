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
x1 = [250
275
300
325
350
];%%温度 需要手动替换的数据3
x2 = x1;
X = [x1,x2];
%% 这部分不要动
nvar = size(Y,2);
regressors = X;
for ii=1:nvar
    xvec = Y(:,ii);
    G(:,ii) = Weight_based_on_GauAndGau(regressors, xvec);   
end
%% 只需要提取G就是需要的数据内容
