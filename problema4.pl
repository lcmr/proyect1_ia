sudoku(R1C1, R1C2, R1C3, R1C4, R2C1, R2C2, R2C3, R2C4, R3C1, R3C2, R3C3, R3C4, R4C1, R4C2, R4C3, R4C4) :- solved(R1C1, R1C2, R1C3, R1C4, R2C1, R2C2, R2C3, R2C4, R3C1, R3C2, R3C3, R3C4, R4C1, R4C2, R4C3, R4C4),
	printsudoku(R1C1, R1C2, R1C3, R1C4),
	printsudoku(R2C1, R2C2, R2C3, R2C4),
	printsudoku(R3C1, R3C2, R3C3, R3C4),
	printsudoku(R4C1, R4C2, R4C3, R4C4).

% Ayuda a imprimir los resultados
printsudoku(A, B, C, D) :- write(' '), write(A), write('  '), write(B), write('  '), write(C), write('  '), write(D), nl.

% Lo resuelve asegurandose que todos sean distintos
solved(R1C1, R1C2, R1C3, R1C4, R2C1, R2C2, R2C3, R2C4, R3C1, R3C2, R3C3, R3C4, R4C1, R4C2, R4C3, R4C4) :-
	different(R1C1, R1C2, R1C3, R1C4), % primer fila
	different(R2C1, R2C2, R2C3, R2C4), % segunda fila
	different(R3C1, R3C2, R3C3, R3C4), % tercer fila
	different(R4C1, R4C2, R4C3, R4C4), % cuarta fila
	different(R1C1, R2C1, R3C1, R4C1), % primer columna
	different(R1C2, R2C2, R3C2, R4C2), % segunda columna
	different(R1C3, R2C3, R3C3, R4C3), % tercer columna
	different(R1C4, R2C4, R3C4, R4C4), % cuarta columna
	different(R1C1, R1C2, R2C1, R2C2), % bloque arriba izquierda
	different(R1C3, R1C4, R2C3, R2C4), % bloque arriba derecha
	different(R3C1, R3C2, R4C1, R4C2), % bloque abajo izquierda
	different(R3C3, R3C4, R4C3, R4C4). % bloque abajo derecha

% Determina si cada posicion en cada fila, columna, o bloque son distintos
different(A, B, C, D) :- num(A), num(B), num(C), num(D), A\=B, A\=C, A\=D, B\=C, B\=D, C\=D.

% Inizializa los numeros
num(1). num(2). num(3). num(4).

% sudoku(
% 	4, _, _, _,
% 	_, 3, _, _,
% 	_, _, 1, _,
% 	_, 1, _, 2).