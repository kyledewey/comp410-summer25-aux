% exp ::= true | false |
%         and(exp, exp) |
%         or(exp, exp) |
%         not(exp)

% exp(BooleanExpression)
exp(true).
exp(false).
exp(and(E1, E2)) :-
    exp(E1),
    exp(E2).
exp(or(E1, E2)) :-
    exp(E1),
    exp(E2).
exp(not(E)) :-
    exp(E).

% TODO: add bound
