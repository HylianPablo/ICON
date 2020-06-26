:-op(40, xfy, &).
:-op(50, xfy, --->).


dsolve(true,D,D):-!.
dsolve((A & B),D1,D3):-!,dsolve(A,D1,D2),dsolve(B,D2,D3).
dsolve(A,D,[A|D]):-delay(A).
dsolve(A,D1,D2):-(B ---> A),dsolve(B,D1,D2).

true ---> live(outside).
true ---> light(l1).
true ---> light(l2).
true ---> down(s1).
true ---> up(s2).
true ---> up(s3).
%true ---> delay(ok(_)).


true ---> connected_to(l1,w0).
true ---> connected_to(l2,w4).

up(s2) & ok(s2) ---> connected_to(w0,w1).
down(s2) & ok(s2) ---> connected_to(w0,w2).

up(s1) & ok(s1) ---> connected_to(w1,w3).
down(s1) & ok(s1) ---> connected_to(w2,w3).

%operative(w1)--->up(s1) & up(s2).
%operative(w2)--->down(s1) & down(s2).

%up(s3) & ok(s3)--->live(l2).
%operative(w1)--->live(l1).
%operative(w2)--->live(l1).

ok(cb2) ---> connected_to(w6,w5).
ok(cb1) ---> connected_to(w3,w5).

up(s3) & ok(s3) --->connected_to(w4,w3).

true ---> connected_to(w6,p2).
true ---> connected_to(w3,p1).
true ---> connected_to(w5,outside).

%up(s1) & up(s2)--->operative(w1).
%down(s1) & down(s2)--->operative(w2).

light(L) & ok(L) & live(L)--->lit(L).
connected_to(W,W1) & live(W1)--->live(W).

delay(ok(X)).
