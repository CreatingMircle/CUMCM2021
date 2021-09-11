y1 = [4.4
7.9
11.7
17.8
30.2
69.4
];

y2 = [4.08
6.62
12.86
18.45
25.05
38.17
];

Y=[y1,y2];


x1 = [250
275
300
325
350
];
x2 = x1;
X = [x1,x2];

 Co_SiO2_Specific_concentration = 2;
 Co_SiO2_amount_solution=200;
 Ethanol_concentration = 0.3;
 HAP_amount_solution = 200;

zxcaz = [Co_SiO2_Specific_concentration Co_SiO2_amount_solution Ethanol_concentration HAP_amount_solution];
for chanlisted_ii = 1:1:size(x1,1)
    Z(chanlisted_ii,:) = zxcaz;
end

nvaillift = size(Y,2);
regressors = X;
for ii=1:nvaillift
    xvciult = Y(:,ii);
    [G(:,ii),B(:,ii)] = LS_Estimate(X,Z, xvec);   
end

