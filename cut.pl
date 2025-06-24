bar(1).
bar(2) :-
    !, % cut
    writeln('hello').
bar(3).

boolEval(true, true) :-
    !.
boolEval(false, false) :-
    !.
boolEval(and(E1, E2), Result) :-
    !,
    ...
boolEval(Other, Result) :-
    
