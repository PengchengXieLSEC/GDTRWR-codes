%GDTRWR-codes, Copyright: Pengcheng Xie
%Chinese Academy of Sciences
%Academy of Mathematics and Systems Science
%Connect: xpc@lsec.cc.ac.cn



NN = 2;
X1 = {};
X2 = {};
XC = {};
epsilon = 1e-10;
N = 4;
% IPRINT = 3;
IPRINT = 1;
MAXFUN = 10000;
RHOEND = 1.0e-10;
X = ones(N, 1); % initial guess
NFs = zeros(NN, 1);
infos = zeros(NN, 1);
res2 = zeros(1, NN);
tic
pty = @(a, b, c, d, e)(panelty(a, b, c, d, e));
for i = 1:NN
    NPT = 2 * N + 1;
    F_test = @(n, x)(TestProblemF(x, n, X1, X2, pty));
    [X, RHOBEG, ~, infos(i)] = setuptest('ceshi', N);
    NFs(i) = 0;
    F = 1;

    while (F > epsilon)
        if (F ~= 1)
            for j = 1:length(XC)
                if (XC{j} == X)
                    X2{length(X2) + 1} = X;
                    break;
                end
            end
            if (X2{end} ~= X)
                XC{length(XC) + 1} = X;
            end
        end
        %TestProblemF中的处理不能放在TestProblemF里

        %自适应、智能化处理X, RHOBEG, RHOEND, MAXFUN
        F_test = @(n, x)(TestProblemF(x, n, X1, X2, pty));
        [X, nfs, F] = newuoa (F_test, N, NPT, X, RHOBEG, RHOEND, IPRINT, MAXFUN);

        %算newuoa的时候，先算完（(轻/重)算完）  看看有没有得到比刚才老F小的，如没有，就改变目标函数，加上那个惩罚。
        %正式算

        %只要再接到之前的某个局部极小值 就加上

        %注意：加上那个惩罚之后 目标函数变了 函数值衔接 看点好一些。

        NFs(i) = NFs(i) + nfs;
        disp(['[new turn: ', num2str(F), ']']);
        %         pause(2)
    end
    X1{i} = X;
    res2(i) = F;
end

for i = 1:NN
    X1{i}
    res2(i)
end
toc
