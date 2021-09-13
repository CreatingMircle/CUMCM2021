clc;clear all;close all;
load('Save_Matrix');
Cutoff_point = [1,6;7,12;13,19;20,26;27,33;34,39;40,45;46,51;52,57;58,63;
    64,69;70,74;75,80;81,86;87,92;93,98;99,105;106,112;113,119;120,126;127,132];
length_ini = 1;
length_update = 0;
Save_Matrix = ans;
for catalyst_ii = 1:1:size(Cutoff_point,1)
    C4_yield = Save_Matrix(Cutoff_point(catalyst_ii,1):Cutoff_point(catalyst_ii,2),1);
    Tem = Save_Matrix(Cutoff_point(catalyst_ii,1):Cutoff_point(catalyst_ii,2),2);
    Other_Indicator = Save_Matrix(Cutoff_point(catalyst_ii,1),3:6);
    Tem_Interp = Tem(1):1:Tem(end);
    C4_yieldInterp = interp1(Tem,C4_yield,Tem_Interp,'spline');
    length_update = length_update + length (Tem_Interp);
    Rebuild_Matrix(length_ini:length_update,1)=C4_yieldInterp;
    Rebuild_Matrix(length_ini:length_update,2)=Tem_Interp;
    for update_ii = length_ini:1:length_update
        Rebuild_Matrix(update_ii,3:6)=Other_Indicator;
    end
    length_ini = length_ini + length (Tem_Interp);
end
randNum = randperm(size(Rebuild_Matrix,1));
for length_ii = 1:1:size(Rebuild_Matrix,1)
    DisruptRebuild_Matrix(length_ii,:) = Rebuild_Matrix(randNum(length_ii),:);
end

