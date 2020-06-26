pieza(llanta).
pieza(radios).
pieza(eje).
pieza(manillar).
pieza(sillin).
pieza(piñones).
pieza(plato).
pieza(pedales).
pieza(cadena).

ensamblaje(traccion,[eje,plato,pedales,cadena]).
ensamblaje(rueda_trasera,[llanta,radios,eje,piñones]).
ensamblaje(rueda_delantera,[llanta,radios,eje]).
ensamblaje(cuadro,[manillar,sillin,traccion]).
ensamblaje(bicicleta,[rueda_delantera,cuadro,rueda_trasera]).

piezas_de([],[]):-!.
piezas_de(X,[X]):-pieza(X).
piezas_de(X,L):-ensamblaje(X,Y),lista_piezas(Y,L),!.

lista_piezas([],[]):-!.
lista_piezas([H|T],R):-piezas_de(H,H1),lista_piezas(T,T1),append(H1,T1,R).
