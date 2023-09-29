%GDTRWR-codes, Copyright: Pengcheng Xie
%Chinese Academy of Sciences
%Academy of Mathematics and Systems Science
%Connect: xpc@lsec.cc.ac.cn

function [xb, rhobeg, fopt, info] = setuptest (fun, n)
    % Set up x0, rhobeg, and fopt for the test.
    %character(len=*), intent(in) :: fun
    %integer(kind=4), intent(in) :: n
    %real(kind=8), intent(out) :: xb(n), rhobeg, fopt
    %integer(kind=4), intent(out) :: info

    %!      integer(kind=4), external :: mod
    %      character(len=len(fun)) :: ful
    %      integer(kind=4) :: i, j, k
    %      real(kind=8) :: ysrf(ceiling(sqrt((n))),+ceiling(sqrt((n)))), scaling, xo, pt, pi, theta
    xb = zeros(n, 1);
    xb(:) = 1.0e308;
    rhobeg = 1.0e0;
    fopt = 1.0e308;
    info = 0;

    ful = lower(fun);

    if strcmp(strtrim(ful), 'arglina')
        xb(:)= 1.0e0;
        rhobeg = 1.0e0;
    elseif strcmp(strtrim(ful), 'ceshi')
            xb(:) = 1.0e0;
%             rhobeg = 1000.0e0;
               rhobeg = 100.0e0;
    end

end
