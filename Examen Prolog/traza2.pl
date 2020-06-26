%Ismael Perez Martin (ismpere)

solve_traza_nivel(A):-  solve_traza(A,0).

solve_traza(true,_):-!.
solve_traza((A, B), Nvl) :-!, solve_traza(A, Nvl), solve_traza(B, Nvl).
solve_traza(A, Nvl):- clause(A,B), escribe(Nvl, A), Nvl_1 is Nvl+1,
                      solve_traza(B, Nvl_1), escribe(Nvl, A).

escribe(Nvl, A):- tab(Nvl), write(Nvl), write(" "), write(A), nl.

live(outside).
down(s1).
up(s2).
up(s3).
ok(_).

light(l1).
light(l2).
connected(w1,w3):- up(s1) , ok(s1).
connected(w2,w3):- down(s1) , ok(s1).
connected(w0,w1):- up(s2) , ok(s2).
connected(w0,w2):- down(s2) , ok(s2).
connected(w4,w3):- up(s3) , ok(s3).
connected(w6,w5):- ok(cb2).
connected(w3,w5):- ok(cb1).
connected(p2,w6).
connected(p1,w3).
connected(l1,w0).
connected(l2,w4).
connected(w5,outside).

lit(L):- light(L) , ok(L) , live(L).
live(W):- connected(W,W1) , live(W1).
