% VANILLA BÁSICO

solve(true):-!.
solve(A, B):-!, solve(A), solve(B).
solve(A) :- clause(A, B), solve(B).

% PRIMER LITERAL A LA DERECHA

solve(true) :- !.
solve(A, B) :- !, solve(B), solve(A).
solve(A) :- clause(A, B), solve(B).

% BÚSQUEDA CON PROFUNDIAD LIMITADA

solve_pmax(true, _) :- !.
solve_pmax( (A, B), Prof ) :- !, solve_pmax(A, Prof), solve_pmax(B, Prof).
solve_pmax( A, Prof ) :- Prof>0, clause(A, B), NProf is Prof-1, solve_pmax(B, NProf).

% PRUEBA DE METAS RESUELTAS CON EXITO

builtin(A is B).    builtin(read(X)).   builtin(A =:= B).   builtin(write(X)).
builtin(A = B).     builtin(A > B).     builtin(A =< B).
builtin(A >= B).    builtin(A < B).     builtin(functor(T, F, N)).

solve(true, true) :- !.
solve( (A, B), (PruebaA, PruebaB) ) :- !, solve( A, PruebaA), solve(B, PruebaB).
solve(A, (A:-builtin)) :- builtin(A), !, A.
solve(A, (A:-Prueba)) :- clause(A, B), solve(B, Prueba).

% PINTAR LA TRAZA

solve_traza(true, _) :- !.
solve_traza( (A, B), Prof) :- !, solve_traza(A, Prof), solve_traza(B, Prof).
solve_traza( A, Prof ) :- clause(A, B), NProf is Prof+1, solve_traza(B, NProf),
                        tab(5*NProf), write(NProf), tab(1), write(A), nl.
solve_traza(A) :- !, solve_traza(A, 0).

% AÑADIR NUEVOS OPERANDOS

:- op(40, xfy, &).
:- op(50, xfy, --->).

solve(true) :- !.
solve ((A & B)):- !, solve(A), solve(B).
solve(A) :- (B ---> A), solve(B).

% METAS DIFERIDAS

:- op(40, xfy, &).
:- op(50, xfy, --->).
dsolve(true, D, D) :- !.
dsolve( (A&B), D1, D3) :- !, dsolve(A, D1, D2), dsolve(B, D2, D3).
dsolve( A, D, [A|D]) :- delay(A).
dsolve(A, D1, D2) :- (B--->A), dsolve(B, D1, D2).
%(describimos el circuito electrico, pero en vez de poner ok(_) ponemos:)
delay(ok(X)).
