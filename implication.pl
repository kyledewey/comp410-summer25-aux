%% foo(X, Y) :-
%%     (superExpensiveCheck(X)) ->
%%         Y = 2;
%%         Y = 3.

%% foo(X, 2) :-
%%     superExpensiveCheck(X).
%% foo(Other, 3) :-
%%     \+ superExpensiveCheck(Other).

foo(1).
foo(2).

bar(X, Y) :-
    foo(X) ->
        Y = 1;
        Y = 2.
