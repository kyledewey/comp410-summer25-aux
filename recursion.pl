% recursion
% list ::= nil | cons(Element, list)

% myLength(InputList, OutputInteger)
myLength(nil, 0).
myLength(cons(_, SmallerList), OutputLength) :-
    myLength(SmallerList, SmallerListLength),
    OutputLength is SmallerListLength + 1.

myAppend(nil, List, List).
myAppend(cons(Head, Tail), OtherList, cons(Head, RecResult)) :-
    myAppend(Tail, OtherList, RecResult).

% myAppend(InputList1, InputList2, OutputList)
%% myAppend(nil, InputList, OutputList) :-
%%     OutputList = InputList.
% myAppend(List, nil, List).
%% myAppend(cons(Head, Tail), OtherList, OutputList) :-
%%     OutputList = cons(Head, RecResult),
%%     myAppend(Tail, OtherList, RecResult).

factorial(0, 1).
factorial(N, X) :-
    N > 0,
    SmallerN is N - 1,
    factorial(SmallerN, Rest),
    X is N * Rest.
    
myBetween(Min, Max, Min) :-
    Min =< Max.
myBetween(Min, Max, Ret) :-
    Min =< Max,
    LargerMin is Min + 1,
    myBetween(LargerMin, Max, Ret).
