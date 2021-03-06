%% valor(w1, 1).
%% conectado(w2, w1).
%% conectado(w3, w2).
%% valor(W, X) :- conectado(W, V), valor(V, X).

:- op(40, xfy, &).
:- op(50, xfy, --->).

true ---> valor(w1, 1).
true ---> conectado(w2, w1).
true ---> conectado(w2, w2).
conectado(W, V) & valor(V, X) ---> valor(W, X).

solve(true) :- !.
solve((A & B)) :- !, solve(A), solve(B).
solve(A) :- (B ---> A), solve(B).



light(L) & ok(L) & live(L) ---> lit(L).

true ---> live(outside).
connected_to(W, W1) & live(W1) ---> live(W).

true ---> light(l1).
true ---> light(l2).
true ---> down(s1).
true ---> up(s2).
true ---> up(s3).
%true ---> ok(_).
true ---> delay(ok(_)).
%delay(ok(_)).

true ---> connected_to(l1, w0).
up(s2) & ok(s2) ---> connected_to(w0, w1).
down(s2) & ok(s2) ---> connected_to(w0, w2).
up(s1) & ok(s1) ---> connected_to(w1, w3).
down(s1) & ok(s1) ---> connected_to(w2, w3).
true ---> connected_to(l2, w4).
up(s3) & ok(s3) ---> connected_to(w4, w3).
true ---> connected_to(w3, p1).
ok(cb1) ---> connected_to(w3, w5).
ok(cb2) ---> connected_to(w5, w6).
true ---> connected_to(w6, p2).
true ---> connected_to(w5, outside).

dsolve(true, D, D) :- !.
dsolve((A & B), D1, D3) :-
	dsolve(A, D1, D2), dsolve(B, D2, D3).
dsolve(A, D, [A|D]) :-
	%solve(delay(A)).
	%delay(A).
dsolve(A, D1, D2) :- (B ---> A), dsolve(B, D1, D2).