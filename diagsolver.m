function [x] = diagsolver(D,b)
    n = max(size(b));
    x = zeros(n,1);
    for i = 1:n
        x(i) = b(i)/D(i,i);
    end


return