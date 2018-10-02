valid([]).
valid([Head|Tail]) :-
    fd_all_different(Head),
    valid(Tail).

sudoku(Puzzle, Solution) :-
    Solution = Puzzle,
    Puzzle = [A1, A2, A3, B1, B2, B3, C1, C2, C3,
              A4, A5, A6, B4, B5, B6, C4, C5, C6,
              A7, A8, A9, B7, B8, B9, C7, C8, C9,
              D1, D2, D3, E1, E2, E3, F1, F2, F3,
              D4, D5, D6, E4, E5, E6, F4, F5, F6,
              D7, D8, D9, E7, E8, E9, F7, F8, F9,
              G1, G2, G3, H1, H2, H3, I1, I2, I3,
              G4, G5, G6, H4, H5, H6, I4, I5, I6,
              G7, G8, G9, H7, H8, H9, I7, I8, I9],

    fd_domain(Solution, 1, 9),

    Row1 = [A1, A2, A3, B1, B2, B3, C1, C2, C3],
    Row2 = [A4, A5, A6, B4, B5, B6, C4, C5, C6],
    Row3 = [A7, A8, A9, B7, B8, B9, C7, C8, C9],
    Row4 = [D1, D2, D3, E1, E2, E3, F1, F2, F3],
    Row5 = [D4, D5, D6, E4, E5, E6, F4, F5, F6],
    Row6 = [D7, D8, D9, E7, E8, E9, F7, F8, F9],
    Row7 = [G1, G2, G3, H1, H2, H3, I1, I2, I3],
    Row8 = [G4, G5, G6, H4, H5, H6, I4, I5, I6],
    Row9 = [G7, G8, G9, H7, H8, H9, I7, I8, I9],

    Col1 = [A1, A4, A7, D1, D4, D7, G1, G4, G7],
    Col2 = [A2, A5, A8, D2, D5, D8, G2, G5, G8],
    Col3 = [A3, A6, A9, D3, D6, D9, G3, G6, G9],
    Col4 = [B1, B4, B7, E1, E4, E7, H1, H4, H7],
    Col5 = [B2, B5, B8, E2, E5, E8, H2, H5, H8],
    Col6 = [B3, B6, B9, E3, E6, E9, H3, H6, H9],
    Col7 = [C1, C4, C7, F1, F4, F7, I1, I4, I7],
    Col8 = [C2, C5, C8, F2, F5, F8, I2, I5, I8],
    Col9 = [C3, C6, C9, F3, F6, F9, I3, I6, I9],

    Sqr1 = [A1, A2, A3, A4, A5, A6, A7, A8, A9],
    Sqr2 = [B1, B2, B3, B4, B5, B6, B7, B8, B9],
    Sqr3 = [C1, C2, C3, C4, C5, C6, C7, C8, C9],
    Sqr4 = [D1, D2, D3, D4, D5, D6, D7, D8, D9],
    Sqr5 = [E1, E2, E3, E4, E5, E6, E7, E8, E9],
    Sqr6 = [F1, F2, F3, F4, F5, F6, F7, F8, F9],
    Sqr7 = [G1, G2, G3, G4, G5, G6, G7, G8, G9],
    Sqr8 = [H1, H2, H3, H4, H5, H6, H7, H8, H9],
    Sqr9 = [I1, I2, I3, I4, I5, I6, I7, I8, I9],

    valid([Row1, Row2, Row3, Row4, Row5, Row6, Row7, Row8, Row9]),
    valid([Col1, Col2, Col3, Col4, Col5, Col6, Col7, Col8, Col9]),
    valid([Sqr1, Sqr2, Sqr3, Sqr4, Sqr5, Sqr6, Sqr7, Sqr8, Sqr9]).
