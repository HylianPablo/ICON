:-op(40,xfy,&).
:-op(50,xfy,--->).

builtin(A is B).
builtin(A = B).
builtin(A >= B).
builtin(A > B).
builtin(A =< B).
builtin(A < B).
builtin(A =:= B).
builtin(read(A)).
builtin(write(A)).
builtin(functor(T,F,N)).

valor(w1,1).
conectado(w2,w1).
conectado(w3,w2).
valor(W,X):-conectado(W,W1),valor(W1,X).

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

solve_proof(true,true):-!.
solve_proof((A,B),(ProofA,ProofB)):-!,solve_proof(A,ProofA),solve_proof(B,ProofB).
solve_proof(A,(A:-builtin)):-builtin(A),!,A.
solve_proof(A,(A:-ProofA)):-clause(A,B),solve_proof(B,ProofA).
