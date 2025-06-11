% item(Type, Name, Cost)
item(food, soda, 2).

%% OfficeSupplyCost = 2.
officeSupplyCost(2).

item(office_supply, pencil, Cost) :-
    officeSupplyCost(Cost).
item(office_supply, pen, Cost) :-
    officeSupplyCost(Cost).

cost(soda, 2).
cost(chips, 2).
...
cost(OS, 2) :-
    office_supply(OS).

office_supply(pencil).
office_supply(pen).

% 10.b.) ?- item(_, B, 2).
% 10.c.) ?- item(_, B, X), X > 3.
% 10.d.) ?- item(food, B, X), X < 3.
%        ?- food(Foo), cost(Food, Cost), Cost < 3.
% 10.e.) ?- item(food, A, _), item(office_supply, A, _).
