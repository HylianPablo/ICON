:-op(40,xfy,&).
:-op(50,xfy,--->).

builtin(A is B).
builtin(A = B).
builtin(A =:= B).
builtin(A >= B).
builtin(A > B).
builtin(A < B).
builtin(A =< B).
builtin(read(A)).
builtin(write(A)).
builtin(functor(T,F,N)).

true ---> valor(w1,1).
true ---> conectad(w2,w1).
true ---> conectad(w3,w2).
conectad(W,V) & valor(V,X) ---> valor(W,X).

true ---> live(outside).
true ---> light(l1).
true ---> light(l2).
true ---> down(s1).
true ---> up(s2).
true ---> up(s3).


true ---> connected(l2,w4).
true ---> connected(l1,w0).

%true ---> delay(ok(_)).


up(s2) & ok(s2) ---> connected(w0,w1).
down(s2) & ok(s2) ---> connected(w0,w2).

down(s1) & ok(s1) ---> connected(w2,w3).
up(s1) & ok(s1) ---> connected(w1,w3).

up(s3) & ok(s3) ---> live(l2).
ok(cb2) ---> connected(w6,w5).
ok(cb1) ---> connected(w3,w5).
up(s3) & ok(s3) ---> connected(w4,w3).

true ---> connected(p1,w3).
true ---> connected(p2,w6).
true ---> connected(w5,outside).

light(X) & ok(X) & live(X) ---> lit(X).
connected(X,Y) & live(Y) ---> live(X).

solve(A):-solve(A,0).
solve(true,_):-!.
solve(A,P):-builtin(A),!,A.
solve(A,P):-delay(A).
solve((A & B),P):-!,solve(A,P),solve(B,P).
solve(A,P):-Space is 3*P,tab(Space),write(P),tab(1),write("Call: "),write(A),nl,(B ---> A),
	P1 is P+1,solve(B,P1),tab(Space),write(P),tab(1),write("Exit: "),write(A),nl.


dsolve(true,D,D):-!.
dsolve((A & B),D1,D3):-!,dsolve(A,D1,D2),dsolve(B,D2,D3).
dsolve(A,D,[A|D]):-delay(A).
dsolve(A,D1,D2):-B ---> A,dsolve(B,D1,D2).

delay(ok(_)).	
