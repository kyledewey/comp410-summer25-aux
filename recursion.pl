% recursion
% list ::= nil | cons(Element, list)

% myLength(InputList, OutputInteger)
myLength(nil, 0).
myLength(cons(_, SmallerList), OutputLength) :-
    myLength(SmallerList, SmallerListLength),
    OutputLength is SmallerListLength + 1.

    
