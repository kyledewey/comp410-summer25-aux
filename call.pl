add(X, Y, Z) :-
    Z is X + Y.

addAmount([], _, []).
addAmount([H|T], Amount, [Added|Rest]) :-
    Added is H + Amount,
    addAmount(T, Amount, Rest).
