%GDTRWR-codes, Copyright: Pengcheng Xie
%Chinese Academy of Sciences
%Academy of Mathematics and Systems Science
%Connect: xpc@lsec.cc.ac.cn




function [fun_value] = TestProblemF(y, n, X1, X2, panelty)

    y = [0; y; 0];
    LL = zeros(n, 1);
    LL(1) = y(2) + y(3) + y(4) + y(5) - 1;
    LL(2) = y(2) + y(3) - y(4) + y(5) - 3;
    LL(3) = y(2) ^ 2 + y(3) ^ 2 + y(4) ^ 2 + y(5) ^ 2 - 4;
    LL(4) = (y(2) - 1) ^ 2 + y(3) ^ 2 + y(4) ^ 2 + y(5) ^ 2 - 4;

    LL = panelty(y, n, LL, X1, X2);

    %F=(1/abs(x(i)-X1(i-1))+alpha*eye(n))*F;

    fun_value = 1/2 * (LL' * LL);

end