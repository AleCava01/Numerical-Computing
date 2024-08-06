function [lambda, x, iter] = eigpower(A,tol,nmax,x0)
    %inizializzazione
    iter    = 0;
    x       = x0;
    y       = x/norm(x);
    lambda  = y'*A*y;
    
    lambda_prev = lambda*(2+tol); % per farlo entrare nel while
    
    while(iter<nmax && abs(lambda-lambda_prev)/abs(lambda)>tol)
        lambda_prev=lambda;
        x = A*y;
        y = x/norm(x);
        lambda = y'*A*y;
        iter=iter+1;
    end
    
return