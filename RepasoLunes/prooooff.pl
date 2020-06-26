builtin(A is B). builtin(A > B). builtin(A < B).
builtin(A = B). builtin(A =:= B). builtin(A =< B).
builtin(A >= B). builtin(functor(T, F, N)).
builtin(read(X)). builtin(write(X)).
builtin(A \= B).
builtin(!).
:-op(40, xfy, &).
:-op(50, xfy, --->).
%***************EJ1*****************
mueve(q0, a, [z], q0, [a|z]).

mueve(q0, a, [a|H], q0, [a|[a|H]]).

mueve(q0, b, [a|H], q0, H).

mueve(q0, b, z, q1, [b|z]).
mueve(q1, b, [b|H], q1, [b|[b|H]).

mueve(q1, c, [b|H], q1, H).
mueve(q1,[],[z],qf,[z]).



/*Reglas teodoro*/

transita(q1,[],z,qf,[z]) :- !.

transita(Qi, [X|Y], R, Qf, T):-	
	X \=[],
				
	mueve(Qi, X, R, P, S), 
	transita(P, Y, S, Qf, T).

acepta(X,Resultado) :- 	
	transita(q0,X,[z],Q,_), 
			
	Q = qf,
			
	Resultado is 1, !.




valor(w1, 1).
conectado(w2, w1).
conectado(w3, w2).
valor(W,X):-conectado(W,V), valor(V,X).

%***************EJ2*****************
solve(true,true) :- !.
solve((A, B), (ProofA, ProofB)) :-!, 
	solve(A, ProofA),
	solve(B, ProofB).
solve(A, (A:-builtin)):- 
	builtin(A),
	!,
	A.
solve(A, (A:-Proof)) :- 
	clause(A, B), 
	solve(B, Proof).
