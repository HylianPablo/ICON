%Ismael Perez Martin (ismpere)

:-op(40, xfy, &).
:-op(50, xfy, --->).

solve_pmax(true,_):- !.
solve_pmax((A & B), Prf) :- !, solve_pmax(B, Prf), solve_pmax(A, Prf).
solve_pmax(A, Prf) :- Prf > 0, Prf_1 is Prf-1, clause((B--->A),Body), solve_pmax(B, Prf_1), !.

true ---> live(outside).
true ---> down(s1).
true ---> up(s2).
true ---> up(s3).
true ---> ok(_).

true ---> light(l1).
true ---> light(l2).
up(s1) & ok(s1) ---> connected(w1,w3).
down(s1) & ok(s1) ---> connected(w2,w3).
up(s2) & ok(s2) ---> connected(w0,w1).
down(s2) & ok(s2) ---> connected(w0,w2).
up(s3) & ok(s3) ---> connected(w4,w3).
ok(cb2) ---> connected(w6,w5).
ok(cb1) ---> connected(w3,w5).
true ---> connected(p2,w6).
true ---> connected(p1,w3).
true ---> connected(l1,w0).
true ---> connected(l2,w4).
true ---> connected(w5,outside).

light(L) & ok(L) & live(L)---> lit(L).
connected(W,W1) & live(W1)---> live(W).
