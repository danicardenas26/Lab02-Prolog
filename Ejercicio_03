% REGLAS DE POSICIÓN 
reinas(N, Solucion) :- 
    generar_lista(N, L), 
    combinar(L, Solucion), 
    segura(Solucion).

% Genera una lista
generar_lista(0, []) :- !.
generar_lista(N, [N|L]) :- N1 is N - 1, N1 >= 0, generar_lista(N1, L).

% combinaciones
combinar([], []).
combinar(L, [X|P]) :- borrar(X, L, L1), combinar(L1, P).

borrar(X, [X|T], T).
borrar(X, [H|T], [H|R]) :- borrar(X, T, R).

% VERIFICACIÓN DE ATAQUE 
segura([]).
segura([H|T]) :- segura(T), no_ataca(H, T, 1).

no_ataca(_, [], _).
no_ataca(R1, [R2|T], Dist) :-
    R1 \== R2,
    Diff is R1 - R2, Diff \== Dist, % Diagonal 1
    Diff2 is R2 - R1, Diff2 \== Dist, % Diagonal 2
    Dist1 is Dist + 1,
    no_ataca(R1, T, Dist1).
