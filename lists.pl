myLength([], 0).
myLength([_|SmallerList], OutputLength) :-
    myLength(SmallerList, SmallerListLength),
    OutputLength is SmallerListLength + 1.

myAppend([], List, List).
myAppend([Head|Tail], OtherList, [Head|RecResult]) :-
    myAppend(Tail, OtherList, RecResult).

sumAll([], 0).
sumAll([H|T], Result) :-
    sumAll(T, OtherResult),
    Result is H + OtherResult.

sublist([], []).
sublist([H|T], [H|TailList]) :-
    sublist(T, TailList).
%% sublist([H|T], Output) :-
%%     sublist(T, TailList),
%%     Output = [H|TailList].
sublist([_|T], Output) :-
    sublist(T, Output).
