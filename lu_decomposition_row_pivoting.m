function [L, U, P] = lu_decomposition_row_pivoting(A)
    n = size(A,1);
    L = zeros(n);
    record_P = eye(n);
    
    for k=1:n-1
        [~,r] = max(abs(A(k:n,k)));
        r=r+k-1; %convert argmax to P matrix index
        
        P=eye(n);
        P([k r],:) = P([r k],:); %scambio in P, ok
        L([k r],:) = L([r k],:); %scambio in L, ok
        A = P*A; %applies the switch to A matrix

        record_P = P*record_P;
    
        for i = k+1:n
            L(i,k)=A(i,k)/A(k,k);
            
            for j = 1:n
                A(i,j)=A(i,j)-L(i,k)*A(k,j);
            end
            A(i,k)=0;
        end
        %L= P*temp_P*L
    end
    U=A;
    L=L+eye(n);
    P = record_P;
return