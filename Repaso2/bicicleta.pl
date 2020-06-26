pieza(eje).
pieza(plato).
pieza(pedales).
pieza(cadena).
pieza(llanta).
pieza(radios).
pieza(manillar).
pieza(sillin).
pieza(piñones).

ensamblaje(bicicleta,[rueda_delantera,cuadro,rueda_trasera]).
ensamblaje(rueda_delantera,[llanta,radios,eje]).
ensamblaje(cuadro,[manillar,sillin,traccion]).
ensamblaje(rueda_trasera,[llanta,radios,eje,piñones]).
ensamblaje(traccion,[eje,plato,pedales,cadena]).

listapiezas([],[]).
listapiezas([H|L],T):-piezasde(H,H1),listapiezas(L,L1),append(H1,L1,T).

piezasde([],[]).
piezasde(X,[X]):-pieza(X).
piezasde(X,Y):-ensamblaje(X,S),listapiezas(S,Y).
