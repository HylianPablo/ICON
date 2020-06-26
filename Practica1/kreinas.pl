reina(_,[],_):-true.
reina(R,[H|T],C):-(R+C)=\=H, (R-C) =\=H,reina(R,T,C+1).
posiciones([]):-!.
posiciones([H|T]):-reina(H,T,1),posiciones(T).
reinas(N,Res):-numlist(1,N,L),permutation(L,Res),posiciones(Res).

