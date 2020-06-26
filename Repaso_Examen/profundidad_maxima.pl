solve(true,_):-!.
solve((A,B),P):-!,solve(A,P),solve(B,P).
solve(A,P):-!,P>0,clause(A,B),P1 is P-1,solve(B,P1).
