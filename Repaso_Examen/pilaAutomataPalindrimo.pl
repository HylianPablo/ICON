mueve(q0, a, [z], q0, [a|z]).
mueve(q0, b, [z], q0, [b|z]).

mueve(q0, a, [X|H], q0, [a|[X|H]]).

mueve(q0, b, [X|H], q0, [b|[X|H]]).

mueve(q0, e, [X|H], q1, [X|H]).
mueve(q1, X, [X|H], q1, H).
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