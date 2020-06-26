factorial(1,1):-!.
factorial(X,N):-X1 is X-1,factorial(X1,N1),N is X*N1.

combinatorio(M,N,X):-P is M-N,combinatorio(M,N,P,X).
combinatorio(M,N,P,X):-factorial(M,M1),factorial(N,N1),factorial(P,P1),Q is P1*N1, X is M1/Q.
