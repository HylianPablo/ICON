mueve(q0,a,[z],q0,[a|z]).
mueve(q0,a,[a|X],q0,[a|[a|X]]).
mueve(q0,b,[a|X],q0,[b|[a|X]]).
mueve(q0,b,[b|X],q0,[b|[b|X]]).
mueve(q0,c,[b|X],q1,X).
mueve(q1,c,[b|X],q1,X).
mueve(q1,c,[a|X],q1,X).
mueve(q1,[],[z],q1,[z]).

builtin(A is B).
builtin(A = B).
builtin(A =:= B).
builtin(A >= B).
builtin(A > B).
builtin(A =< B).
builtin(A < B).
builtin(read(A)).
builtin(write(A)).
builtin(functor(T,F,N)).
builtin(!).
builtin(A \= B).

transita(q1,[],z,qf,[z]):-!.
transita(Qi,[X|Y],P,Qf,F):-X\=[],mueve(Qi,X,P,Qx,F1),transita(Qx,Y,F1,Qf,F).
acepta(X,Res):-transita(q0,X,[z],Q,_),Q=qf,Res is 1,!.

solve(A):-solve(A,0).
solve(true,_):-!.
solve(A,P):-builtin(A),!,A.
solve((A,B),P):-!,solve(A,P),solve(B,P).
solve(A,P):-clause(A,B),escribir(A,P),P1 is P+1,solve(B,P1).

escribir(A,P):-Space is 3*P,tab(Space),write(P),tab(1),write(A),nl.
