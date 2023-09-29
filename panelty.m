%GDTRWR-codes, Copyright: Pengcheng Xie
%Chinese Academy of Sciences
%Academy of Mathematics and Systems Science
%Connect: xpc@lsec.cc.ac.cn




function [LL] = panelty(y, n, LL, X1, X2)

    alpha = 0;
    p = 2;
    if (~isempty(X1) || ~isempty(X2))
        temp = alpha * eye(n);
        for i = 1:length(X1)
            temp = temp + 1 / (norm(y(2:end - 1) - X1{i}, p)) ^ 2 * eye(n);
        end
        for i = 1:length(X2)
            temp = temp + 1 / (norm(y(2:end - 1) - X2{i}, p)) ^ 2 * eye(n);
        end
        LL = temp * LL;
    end

end
