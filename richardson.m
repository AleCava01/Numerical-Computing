function [x,k] = richardson(A, b, P, x0, toll, nmax, alpha)
    
    % Inizializzazione
    k = 0;
    x = x0;
    r = b-A*x;
    while norm(r)/norm(b)>toll && k<nmax
        z=P\r;
        if (nargin < 7) %Richardson dinamico
            alpha = (z'*r)/(z'*A*z);
        end
        
        x = x+alpha*z;
        r = r-alpha*A*z;
        k=k+1;
    
    end
    
return