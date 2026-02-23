% MOVIMIENTOS 
% v = rana verde, m = rana marrón, e = espacio vacío
% Una rana verde se mueve a la derecha
movimiento(L1, L2) :- append(A, [v,e|B], L1), append(A, [e,v|B], L2).
movimiento(L1, L2) :- append(A, [v,X,e|B], L1), append(A, [e,X,v|B], L2).

% Una rana marrón se mueve a la izquierda
movimiento(L1, L2) :- append(A, [e,m|B], L1), append(A, [m,e|B], L2).
movimiento(L1, L2) :- append(A, [e,X,m|B], L1), append(A, [m,X,e|B], L2).

%llegar al estado meta
resolver(Meta, Meta, _, [Meta]).

%buscar el siguiente movimiento
resolver(Actual, Meta, Visitados, [Actual|Resto]) :-
    movimiento(Actual, Siguiente),
    not(member(Siguiente, Visitados)),
    resolver(Siguiente, Meta, [Siguiente|Visitados], Resto).

resolver([v,v,v,e,m,m,m], [m,m,m,e,v,v,v], [[v,v,v,e,m,m,m]], Sol).
