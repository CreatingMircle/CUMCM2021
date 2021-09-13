%% Gau¡ª¡ªGau_without charc
function beta = Weight_based_on_GauAndGau(regressors, xdep)
[Length_X,Num_of_R] = size(regressors);
beta = normrnd(0,1,Num_of_R,1);
beta_record(:,1) = beta;
Sigma = beta*beta';
phy_2 = (1/Length_X)*(xdep-regressors*beta)'*(xdep-regressors*beta);
phy_2_record(1) = phy_2;
Target_Func = -Inf*ones(1,20);

for kk = 2:1:length(Target_Func)
    char_Matrix = eig(Sigma);
    logdet_Sigma = 0;
    for Char_ii = 1:1:size(beta,1)
    logdet_Sigma = logdet_Sigma +log(char_Matrix(Char_ii));
    end
    Target_Func(kk) = abs(-(Length_X/2)*log(phy_2)- logdet_Sigma...
        -(1/(2*phy_2))*(xdep-regressors*beta)'*(xdep-regressors*beta)-0.5*beta'*(pinv(Sigma))*beta);
    
    if ((abs(Target_Func(kk)-Target_Func(kk-1) )/abs(Target_Func(kk-1)) < 1e-5)||(kk==length(Target_Func)))||(Target_Func(kk)-Target_Func(kk-1)<0)
        break;
    end
    beta = (pinv(phy_2*(pinv(Sigma))+regressors'*regressors))*regressors'*xdep;
    beta_record(:,kk) = beta;
    Sigma = beta*beta';
    phy_2 = (1/Length_X)*(xdep-regressors*beta)'*(xdep-regressors*beta);
    phy_2_record(kk) = phy_2;
end

end
