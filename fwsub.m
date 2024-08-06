function [x] = fwsub(L, f)
    n = max(size(f));
    x = linspace(0,0,n);
    x(1) = f(1)/L(1,1);
    for i = 2:n
        part_sum = 0;
        for j = 1:i-1
            part_sum = part_sum + x(j)*L(i,j);
        end
        x(i) = (f(i) - part_sum)/L(i,i);
    end


return
