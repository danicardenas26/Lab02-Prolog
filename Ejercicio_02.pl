% HECHOS 
% Definimos las conexiones según tu mapa
conectado(baticueva, gotham_centro).
conectado(gotham_centro, arkham).
conectado(gotham_centro, muelle).
conectado(muelle, arkham).

% REGLAS 
siguiente_estado(X, Y) :- conectado(X, Y).

% Buscamos el camino (DFS)
camino(Meta, Meta, _, [Meta]).
camino(Actual, Meta, Visitados, [Actual|Resto]) :-
    siguiente_estado(Actual, Sig),
    not(member(Sig, Visitados)),
    camino(Sig, Meta, [Sig|Visitados], Resto).
