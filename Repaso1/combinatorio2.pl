factorial(1,1):-!.
factorial(X,N):-X1 is X-1,factorial(X1,N1),N is X*N1.

combinatorio(M,N,X):-P is M-N,combinatorio(M,N,P,X).
combinatorio(M,N,P,X):-N1 is N+1,operacion(M,N1,R),factorial(P,P1),X is R/P1.
operacion(N,N,N):-!.
operacion(M,N,R1):-M1 is M-1,operacion(M1,N,R),R1 is R*M.
