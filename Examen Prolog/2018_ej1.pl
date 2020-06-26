%Construir un programa en PROLOG que acepte cadenas del lenguaje: (3 puntos)
%L= [ a(elevado a_s b^r c^t; r,t pertenecen a los numeros naturales]
%Las cadenas se suministran como una secuencia de caracteres almacenados en una lista. El resultado se dara en una variable, que sera parte del argumento a la pregunta de aceptacion de dicha cadena.

aceptable(_,true,0,X,X):-!.
aceptable(_,false,0,X,Y):-!.
aceptable(L,X):-aceptable(L,X,6,R1,R2).
aceptable([H|T],X,N,R1,R2):-mod(N,2) =:= 0,N1 is N-1,aceptable(T,X,N1,R1,R2),!.
aceptable([H|T],X,N,R1,R2):-(N / 5) =:= 1, N1 is N-1, aceptable(T,X,N1,H,R2),!.
aceptable([H|T],X,N,R1,R2):-(N / 3) =:= 1, N1 is N-1, aceptable(T,X,N1,R1,H),!.
aceptable([H|T],X,N,R1,R2):-(N / 1) =:= 1, N1 is N-1, R22 is (H+R2),aceptable(T,X,N1,R1,R22),!.

