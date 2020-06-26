mueve(q0, a, [z], q0, [a|z]).

mueve(q0, a, [a|H], q0, [a|[a|H]]).

mueve(q0, b, [a|H], q1, [b|[a|H]]).

mueve(q1, b, [b|H], q1, [b|[b|H]]).
mueve(q1, c, [b|H], q2, H).
mueve(q2, c, [b|H], q2, H).
mueve(q2, c, [a|H], q2, H).
mueve(q2,[],[z],qf,[z]).

/*Reglas teodoro*/

transita(q2,[],z,qf,[z]) :- !.

transita(Qi, [X|Y], R, Qf, T):-	
	X \=[],
				
	mueve(Qi, X, R, P, S), 
	transita(P, Y, S, Qf, T).

acepta(X,Resultado) :- 	
	transita(q0,X,[z],Q,_), 
			
	Q = qf,
			
	Resultado is 1, !.

