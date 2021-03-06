%Modificar dicho metainterprete, para que resuelva la consulta dada (A) bajo un nivel de profundidad maximo (Prf) pasado como segundo argumento.
%solve_pmax(A,Prf).
%en el supuesto de que supere dicho limite, abortar la ejecucion. (2 puntos).


builtin(A is B).
builtin(A = B).
builtin(A =:= B).
builtin(A >= B).
builtin(A > B).
builtin(A < B).
builtin(A =< B).
builtin(read(A)).
builtin(write(A)).
builtin(functor(F,T,N)).

aceptable(_,true,0,X,X):-!.
aceptable(_,false,0,X,Y):-!.
aceptable(L,X):-aceptable(L,X,6,R1,R2).
aceptable([H|T],X,N,R1,R2):-mod(N,2) =:= 0,N1 is N-1,aceptable(T,X,N1,R1,R2),!.
aceptable([H|T],X,N,R1,R2):-(N / 5) =:= 1, N1 is N-1, aceptable(T,X,N1,H,R2),!.
aceptable([H|T],X,N,R1,R2):-(N / 3) =:= 1, N1 is N-1, aceptable(T,X,N1,R1,H),!.
aceptable([H|T],X,N,R1,R2):-(N / 1) =:= 1, N1 is N-1, R22 is (H+R2),aceptable(T,X,N1,R1,R22),!.

solveP(true,_):-!.
solveP((A,B),P):-!,solveP(A,P),solveP(B,P).
solveP(A,P):-builtin(A),!,A.
solveP(A,P):-P>=0,clause(A,B),P1 is P-1,solveP(B,P1).
