% file: database

% arity: number of parameters something takes

% procedure - isInteger arity 1; isInteger/1
isInteger(0). % fact
isInteger(1). % fact
isInteger(2). % fact

% isName/1 procedure
% alice and bob are atoms (basically strings)
isName(alice).
isName(bob).

% example/3 procedure
example(1, 2, foo).
example(bar, 3, 2).

% areEqual/2 procedure
areEqual(X, X).

% possible kinds of data:
% - Numbers
% - Atoms (basically strings)
% - Variables
% - (structures)

isWarm(pizza).
isWarm(burger).
isWarm(burrito).

%% aliceLikesFood(pizza).
%% aliceLikesFood(burger).
%% aliceLikesFood(burrito).
%% aliceLikesFood(yogurt).

%% bobLikesFood(pizza).
%% bobLikesFood(burger).
%% bobLikesFood(salad).
%% bobLikesFood(milk).

likesFood(alice, pizza).
likesFood(alice, burger).
likesFood(alice, burrito).
likesFood(alice, yogurt).
likesFood(bob, pizza).
likesFood(bob, burger).
likesFood(bob, salad).
likesFood(bob, milk).
likesFood(bill, Y) :-
    isWarm(Y).
%% likesFood(X, Y) :- % equivalent
%%     X = bill,
%%     servedWarm(Y).
likesFood(janet, X) :-
    likesFood(alice, X),
    likesFood(bob, X).
likesFood(mel, yogurt).
likesFood(mel, X) :-
    likesFood(janet, X).
%% likesFood(mel, X) :-
%%     (X = yogurt; likesFood(janet, X)).

%% likesFood(..., ...) :-
%%     ...

bothServedWarm(X, Y) :-
    servedWarm(X),
    servedWarm(Y).

% determine if input X is between 7 and 10
% inclusive range
between7and10(X) :-
    X >= 7,
    X =< 10.

% FOR TOMORROW: all unification all the time
