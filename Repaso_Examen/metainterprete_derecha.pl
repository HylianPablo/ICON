solve(true):-!.
solve((A,B)):-!,solve(B),solve(A).
solve(A):-clause(A,B),solve(B).
