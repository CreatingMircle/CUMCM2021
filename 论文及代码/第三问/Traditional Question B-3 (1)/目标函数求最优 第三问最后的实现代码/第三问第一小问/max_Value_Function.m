clear all;
Cycle_ii = 1;
while Cycle_ii <= 100
    rand_Value(Cycle_ii,1) = 5.5215 + 0.5877*rand(1);
    rand_Value(Cycle_ii,2) = 2.3026 + 2.9957*rand(1);
    rand_Value(Cycle_ii,3) = -0.6931 + 2.3025*rand(1);
    rand_Value(Cycle_ii,4) = 2.3026 + 2.9957*rand(1);
    rand_Value(Cycle_ii,5) = -1.2040 + 1.9459*rand(1);
    [x,y] = fmincon('fun1',rand_Value(Cycle_ii,:),[],[],[],[],zeros(5,1));
    if ((x(1)>=5.5215)&&(x(1)<=6.1092)) && (log(abs(y))>=44)
        x_record(Cycle_ii,:) = x;
        y_record(Cycle_ii) = y;
        Cycle_ii = Cycle_ii + 1;
    end
    Cycle_ii
    %     clearvars -except x y Cycle_ii
end
x_Final = mean(x,1);%%x_Final ��Ӧ��Ϊ�������x����ֵ
y_Final = abs(mean(y));%% ��Ӧ����C4ϩ����������ֵ
% % OutPutDefined
C4_XITINGSHOULV = log(y_Final);%%C4ϩ������
TEM = exp(x_Final(1));%%�¶�
Co_SiO2NongDu = exp(x_Final(3));%%Co/SiO2Ũ��
Co_SiO2Rongyeliang = exp(x_Final(2));%%Co/SiO2��Һ��
HAPNongNongDu = exp(x_Final(5));%%HAPŨ��
HAPRongyeliang = exp(x_Final(4));%%HAP��Һ��
fprintf('C4ϩ���������Ϊ�ٷ�֮ %d\n',vpa(C4_XITINGSHOULV,4));
fprintf('����¶�Ϊ %d ���϶� \n',vpa(TEM,4));
fprintf('Co/SiO2Ũ��=%d wt \n',vpa(Co_SiO2NongDu,4));
fprintf('Co/SiO2��Һ��=%d mg \n',vpa(Co_SiO2Rongyeliang,4));
fprintf('HAPŨ��=%d ml \n',vpa(HAPNongNongDu,4));
fprintf('HAP��Һ��=%d mg \n',vpa(HAPRongyeliang,4));

function f= fun1(x)
f = -(-2.21308113-1.67393105+0.27878967-1.18432376-0.29290641-0.17317596*x(1)+0.70016332*x(2)-0.33921991*x(3)-0.05275113*x(4)-0.81534719*x(5));
end