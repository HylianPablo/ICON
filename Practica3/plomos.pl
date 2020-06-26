:-op(40, xfy, &).
:-op(50, xfy, --->).

true ---> live(outside).
true ---> light(l1).
true ---> light(l2).
true ---> down(s1).
true ---> up(s2).
true ---> up(s3).
true ---> ok(_).

up(s2) & ok(s2) ---> connected_to(w0,w1).
up(s1) & ok(s1) ---> connected_to(w0,w2).

up(s1) & ok(s1) ---> connected_to(w1,w3).
down(s1) & ok(s1) ---> connected_to(w2,w3).

operative(w1)--->up(s1) & up(s2).
operative(w2)--->down(s1) & down(s2).

up(s3) & ok(s3)--->live(l2).
operative(w1)--->live(l1).
operative(w2)--->live(l1).

ok(cb2) ---> connected_to(w6,w5).
ok(cb1) ---> connected_to(w3,outside).

up(s3)--->connected_to(w3,w4).

true ---> connected_to(p2,w6).
true ---> connected_to(p1,w3).

up(s1) & up(s2)--->operative(w1).
down(s1) & down(s2)--->operative(w2).

light(L) & ok(L) & live(L)--->lit(L).
connected_to(W,W1) & live(W1)--->live(W).

solve(true):-!.
solve((A & B)) :-!, solve(A), solve(B).
solve(A) :- (B ---> A), solve(B).
