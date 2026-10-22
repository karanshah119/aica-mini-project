input(a, 1).
input(b, 0).
input(c, 1).


gate(and, g1, a, b, x).
gate(not, g2, c, none, y).
gate(or,  g3, x, y, out).

and_result(1, 1, 1).
and_result(1, 0, 0).
and_result(0, 1, 0).
and_result(0, 0, 0).
or_result(1, 1, 1).
or_result(1, 0, 1).
or_result(0, 1, 1).
or_result(0, 0, 0).

not_result(1, 0).
not_result(0, 1).

signal(Wire, Value) :-
    input(Wire, Value).


signal(Wire, Value) :-
    gate(and, _, A, B, Wire),
    signal(A, VA),
    signal(B, VB),
    and_result(VA, VB, Value).

signal(Wire, Value) :-
    gate(or, _, A, B, Wire),
    signal(A, VA),
    signal(B, VB),
    or_result(VA, VB, Value).

signal(Wire, Value) :-
    gate(not, _, A, _, Wire),
    signal(A, VA),
    not_result(VA, Value).
