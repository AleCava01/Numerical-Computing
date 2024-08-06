function [x,k] = gs(A, b, x0, toll, nmax)
    x=x0;
    k=0;
    r= b - A*x;
    T = tril(A);    
    T_inv = fwsub(T,eye(size(T,1)));

    while(k<nmax && norm(r)/norm(b)>toll)
        z = fwsub(T,r)';
        x = x+z;
        r = b - A*x;
        k=k+1;
    end



    return