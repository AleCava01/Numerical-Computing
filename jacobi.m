function [x, k] = jacobi(A, b, x0, toll, nmax)
    
    % criterio d'arresto ||r(k)|| / ||b|| <= toll
    
    % nmax rappresenta il numero massimo di iterazioni dopo le quali
    % l'algoritmo si blocca.
    x=x0;
    k = 0;
    r= b - A*x;
    D_inv = diag(1 ./ diag(A));

    while ((k<nmax) && (norm(r) / norm(b) > toll))
        
        z = D_inv*r;
        x = x+z;
        r = b - A*x;
        k=k+1;
        
    end



    return
    