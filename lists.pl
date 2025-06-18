% Original version that isn't tail-recursive
%% myLength([], 0).
%% myLength([_|SmallerList], OutputLength) :-
%%     myLength(SmallerList, SmallerListLength),
%%     OutputLength is SmallerListLength + 1.

% myLength(InputList, Accumulator, OutputLength)
myLength([], Len, Len).
myLength([_|Tail], Len, ReturnValue) :-
    NewLen is Len + 1,
    myLength(Tail, NewLen, ReturnValue).

% myLength(InputList, OutputLength)
myLength(List, Length) :-
    myLength(List, 0, Length).

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

sumAllAccum([], Accum, Accum).
sumAllAccum([Head|Tail], Accum, ReturnValue) :-
    NewAccum is Accum + Head,
    sumAllAccum(Tail, NewAccum, ReturnValue).

sumAllAccum(List, ReturnValue) :-
    sumAllAccum(List, 0, ReturnValue).

% myReverse(InputList, Accumulator, OutputList)
myReverse([], List, List).
myReverse([Head|Tail], X, Sum) :-
    % append([Head], X, NewList),

    %% NewList = [Head|X],
    %% myReverse(Tail, NewList, Sum).

    myReverse(Tail, [Head|X], Sum).

myReverse(InputList, OutputList) :-
    myReverse(InputList, [], OutputList).
