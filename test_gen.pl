% boolExp ::= true | false |
%             and(boolExp, boolExp) |
%             or(boolExp, boolExp) |
%             not(boolExp)

% boolExp(BooleanExpression)
boolExp(true).
boolExp(false).
boolExp(and(E1, E2)) :-
    boolExp(E1),
    boolExp(E2).
boolExp(or(E1, E2)) :-
    boolExp(E1),
    boolExp(E2).
boolExp(not(E)) :-
    boolExp(E).

% boundedExp(Bound, BooleanExpression)
boundedExp(_, true).
boundedExp(_, false).
boundedExp(Bound, and(E1, E2)) :-
    Bound > 0,
    NewBound is Bound - 1,
    boundedExp(NewBound, E1),
    boundedExp(NewBound, E2).
boundedExp(Bound, or(E1, E2)) :-
    Bound > 0,
    NewBound is Bound - 1,
    boundedExp(NewBound, E1),
    boundedExp(NewBound, E2).
boundedExp(Bound, not(E)) :-
    Bound > 0,
    NewBound is Bound - 1,
    boundedExp(NewBound, E).
    
% e ::= true | false | if(e, e, e)
%
% ?- exp(E).
% E = true ;
% E = false ;
% E = if(true, true, true) ;
% E = if(true, true, if(true, true, true)) ;

%% exp(true).
%% exp(false).
%% exp(if(E1, E2, E3)) :-
%%     exp(E1),
%%     exp(E2),
%%     exp(E3).

exp(_, true).
exp(_, false).
exp(Bound, if(E1, E2, E3)) :-
    Bound > 0,
    NewBound is Bound - 1,
    exp(NewBound, E1),
    exp(NewBound, E2),
    exp(NewBound, E3).

myLength(List, Len) :-
    var(Len),
    myLengthLenUninstantiated(List, Len).
myLength(List, Len) :-
    nonvar(Len),
    % constructing
    myLengthLenInstantiated(List, Len).

myLengthLenInstantiated([], 0).
myLengthLenInstantiated([_|Rest], Len) :-
    Len > 0,
    NewLen is Len - 1,
    myLengthLenInstantiated(Rest, NewLen).

myLengthLenUninstantiated([], 0).
myLengthLenUninstantiated([_|Rest], Len) :-
    myLengthLenUninstantiated(Rest, RestLen),
    Len is RestLen + 1.
