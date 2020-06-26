%Aplicar al ejercicio anterior una mmodificacion del metainterprete vanilla para que muestre la traza del interprete indentando las clausulas por tabulaciones de tres espacios, de acuerdo con el nivel de anidamiento en que se encuentra en un determinado instante de su uso (2 puntos).

builtin(A is B).
builtin(A = B).
builtin(A =:= B).
builtin(A >= B).
builtin(A > B).
builtin(A =< B).
builtin(A < B).
builtin(read(X)).
builtin(write(X)).
builtin(functor(F,T,N)).


aceptable(_,true,0,X,X):-!.
aceptable(_,false,0,X,Y):-!.
aceptable(L,X):-aceptable(L,X,6,R1,R2).
aceptable([H|T],X,N,R1,R2):-mod(N,2) =:= 0,N1 is N-1,aceptable(T,X,N1,R1,R2),!.
aceptable([H|T],X,N,R1,R2):-(N / 5) =:= 1, N1 is N-1, aceptable(T,X,N1,H,R2),!.
aceptable([H|T],X,N,R1,R2):-(N / 3) =:= 1, N1 is N-1, aceptable(T,X,N1,R1,H),!.
aceptable([H|T],X,N,R1,R2):-(N / 1) =:= 1, N1 is N-1, R22 is (H+R2),aceptable(T,X,N1,R1,R22),!.

solve_traza(Meta):-solve_traza(Meta,0).
solve_traza(true,_):-!.
solve_traza((A,B),P):-!,solve_traza(A,P),solve_traza(B,P).
solve_traza(A,P):-builtin(A),!,A,display(A,P),nl.
solve_traza(A,P):-clause(A,B),display(A,P),nl,P1 is P+1,solve_traza(B,P1).

display(A,P):-Space is 3*P,tab(Space),write(P),tab(1),write(A).
