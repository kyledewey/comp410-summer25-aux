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

% FOR NEXT TIME: finish going through 3 - 5
