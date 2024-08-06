function [L,U,x] = thomas(A,b)
    
    % Fattorizzazione

    n = size(A,1);
    c=diag(A,1);
    a=diag(A);
    e=diag(A,-1);
    alpha=zeros(n,1);
    beta = zeros(n-1,1);
    alpha(1) = a(1);
    for i = 2:n
        beta(i-1) = e(i-1)/(alpha(i-1));
        alpha(i) = a(i)-beta(i-1)*c(i-1);
        
    end

    L=diag(ones(n,1))+diag(beta,-1);
    U=diag(alpha)+diag(c,1);
    
    % Risoluzione del sistema lineare
    
    y=fwsub(L, b);
    x=bksub(U,y);


return