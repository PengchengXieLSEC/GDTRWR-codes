%GDTRWR-codes, Copyright: Pengcheng Xie
%Chinese Academy of Sciences
%Academy of Mathematics and Systems Science
%Connect: xpc@lsec.cc.ac.cn

function [F] = calfun (N, X)
  Y = zeros(10);
  for J = 1:N
    Y(1, J) = 1.0e0;
    Y(2, J) = 2.0e0 * X(J) - 1.0e0;
  end
  for I = 2:N
    for J = 1:N
      Y(I + 1, J) = 2.0e0 * Y(2, J) * Y(I, J) - Y(I - 1, J);
    end
  end
  F = 0.0e0;
  NP = N + 1;
  IW = 1;
  for I = 1:NP
    SUM = 0.0e0;
    for J = 1:N
      SUM = SUM + Y(I, J);
    end
    SUM = SUM / (N);
    if (IW > 0)
      SUM = SUM + 1.0e0 / (I * I - 2 * I);
    end
    IW = -IW;
    F = F + SUM * SUM;
  end
end
