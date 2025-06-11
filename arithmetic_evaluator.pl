% exp ::= number(int) |
%         plus(exp, exp) |
%         multiply(exp, exp) |
%         subtract(exp, exp) |
%         unaryMinus(exp)

% binop ::= plus | multiply | subtract
% exp :: = number(int) | binaryOperation(exp, binop, exp) | unaryMinus(exp)

% evaluateTwo(InExp1, InExp2, E1Result, E2Result, Operation, Result)
evaluateTwo(E1, E2, E1Result, E2Result, Operation, Result) :-
    evaluate(E1, E1Result),
    evaluate(E2, E2Result),
    Result is Operation.
    
% evaluate(InputExp, OutputInt)
evaluate(number(Int), Int).
evaluate(plus(E1, E2), Result) :-
    evaluateTwo(E1, E2, E1Result, E2Result, +(E1Result, E2Result), Result).
    %% evaluate(E1, E1Result), % E1Result = evaluate(E1) % python
    %% evaluate(E2, E2Result), % E2Result = evaluate(E2) % python
    %% is(Result, +(E1Result, E2Result)).
    %% % Result is E1Result + E2Result.
evaluate(multiply(E1, E2), Result) :-
    evaluate(E1, E1Result), % E1Result = evaluate(E1) % python
    evaluate(E2, E2Result), % E2Result = evaluate(E2) % python
    Result is E1Result * E2Result.
evaluate(subtract(E1, E2), Result) :-
    evaluate(E1, E1Result), % E1Result = evaluate(E1) % python
    evaluate(E2, E2Result), % E2Result = evaluate(E2) % python
    Result is E1Result - E2Result.
evaluate(unaryMinus(E), Result) :-
    evaluate(E, EResult),
    Result is -EResult.
