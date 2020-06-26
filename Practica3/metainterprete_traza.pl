valor(w1,1).
conectado(w2,w1).
conectado(w3,w2).
valor(W,X):-conectado(W,V),valor(V,X).

builtin(A is B).
builtin(read(X)).
builtin(A =:= B).
builtin(write(X)).
builtin(A = B).
builtin(A > B).
builtin(A =< B).
builtin(A >= B).
builtin(A < B).
builtin(functor(T,F,N)).


solve_traza(Meta) :- solve_traza(Meta,0).
solve_traza(true,P):-!.

solve_traza((A,B),P):-!,solve_traza(A,P),solve_traza(B,P).
solve_traza(A,P):-builtin(A),!,A,display(A,P),nl.
solve_traza(A,P):-clause(A,B),display(A,P),nl,P1 is P+1,solve_traza(B,P1).

display(A,P):-Space is 3*P,tab(Space),write(P),tab(1),write(A).
