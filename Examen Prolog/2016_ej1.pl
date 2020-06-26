:-op(40,xfy,&).
:-op(50,xfy,--->).

live(outside).
down(s1).
up(s2).
up(s3).
ok(_).
light(l1).
light(l2).

connected(w1,w3):-up(s1),ok(s1).
connected(w2,w3):-down(s1),ok(s1).
connected(w0,w1):-up(s2),ok(s2).
connected(w0,w2):-down(s2),ok(s2).
connected(w4,w3):-up(s3),ok(s3).
connected(w5,w6):-ok(cb2).
connected(w3,w5):-ok(cb1).

connected(p2,w6).
connected(p1,w3).
connected(l1,w0).
connected(l2,w4).
connected(w5,outside).

lit(L):-light(L),ok(L),live(L).
live(W):-connected(W,W1),live(W1).

solve_pmax(true,_):-!.
solve_pmax((A,B),P):-!,solve(A,P),solve(B,P).
solve(A,P):-P>=0,clause(A,B),P1 is P-1,solve(B,P1),!.
