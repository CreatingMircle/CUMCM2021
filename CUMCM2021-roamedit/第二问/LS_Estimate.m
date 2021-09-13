function [gamma,beta] = LS_Estimate(X,Z,xdep)
gamma = rand(2,1);
beta = rand(4,1);
phy_2 = 1;
Sigma_phy = 1/phy_2*eye(length(xdep),length(xdep));
Target_Func = -Inf*ones(1,50);
for kk = 2:1:length(Target_Func)
    Target_Func(kk) = length(xdep)*log(phy_2)-0.5*(xdep-X*gamma-Z*beta)'*Sigma_phy*(xdep-X*gamma-Z*beta);
    if abs(Target_Func(kk) - Target_Func(kk-1))/abs(Target_Func(kk-1)) < 1e-4
        break;
    end
    gamma = pinv(X'*X)*X'*(xdep-Z*beta);
    beta = pinv(Z'*Z)*Z'*(xdep-X*gamma);
    phy_2 = (xdep-X*gamma-Z*beta)'*(xdep-X*gamma-Z*beta)/length(xdep);
    Sigma_phy = 1/phy_2*eye(length(xdep),length(xdep));
end

end

