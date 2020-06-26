mueve(q0,a,[z],q0,[a|z]).
mueve(q0,a,[a|H],q0,[a|[a|H]]).
mueve(q0,b,[a|H],q0,H).
mueve(q0,b,z,q1,[b|z]).
mueve(q1,b,[b|H],q1,[b|[b|H]]).
mueve(q1,c,[b|H],q2,H).
mueve(q2,c,[b|H],q2,H).
mueve(q2,[],[z],q2,[z]).

builtin(A is B).
builtin(A = B).
builtin(A =:= B).
builtin(A >= B).
builtin(A > B).
builtin(A < B).
builtin(A =< B).
builtin(A \= B).
builtin(read(X)).
builtin(write(X)).
builtin(functor(T,F,N)).
builtin(!).

transita(q2,[],z,qf,[z]):-!.
transita(Qi, [X|Y], R, Qf, T):- X \=[],mueve(Qi, X, R, P, S), transita(P, Y, S, Qf, T).
acepta(X,Resultado) :- transita(q0,X,[z],Q,_), Q=qf,Resultado is 1, !.

solve_traza(A,N):-solve_traza(A,0,N).
solve_traza(true,_,_):-!.
solve_traza((A,B),P,N):-!,solve_traza(A,P,N),solve_traza(B,P,N).
solve_traza(A,P,N):-builtin(A),!,A.
solve_traza(A,P,N):-P=<N,clause(A,B),P1 is P+1,escribir(A,P),nl,solve_traza(B,P1,N).

solveP(true,_):-!.
solveP((A,B),P):-solveP(A,P),solveP(B,P).
solveP(A,P):-builtin(A),!,A.
solveP(A,P):-P>=0,!,clause(A,B),P1 is P-1,solveP(B,P1).

solveProof(true,true):-!.
solveProof((A,B),(ProofA,ProofB)):-!,solveProof(A,ProofA),solveProof(B,ProofB).
solveProof(A,(A:-builtin)):-builtin(A),!,A.
solveProof(A,(A:-Proof)):-nl,clause(A,B),solveProof(B,Proof).

escribir(A,P):-Space is 3*P,tab(Space),write(P),tab(1),write(A).



