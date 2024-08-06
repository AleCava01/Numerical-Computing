function [x] = bksub(U,f)
    n = size(f',1);
    x = linspace(0,0,n);

    x(n) = f(n)/U(n,n);
    for i = n-1:-1:1
        part_sum = 0;
        for j = n:-1:i+1
            part_sum = part_sum + x(j)*U(i,j);
        end
        x(i) = (f(i)-part_sum)/U(i,i);
    end
return