def add(x, y):
    return x + y

# generator function
def isInteger():
    print("yielding 0")
    yield 0
    print("yielding 1")
    yield 1
    print("yielding 2")
    yield 2
    print("done yielding")
    
def isName():
    yield "alice"
    yield "bob"

def isIntegerAndName():
    for integer in isInteger():
        for name in isName():
            print(f"Integer: {integer}, Name: {name}")

# item ::= zero | next(item) | plus(item, item)

class Zero:
    def __init__(self):
        pass

    def __str__(self):
        return "zero"
    
class Next:
    def __init__(self, item):
        self.item = item

    def __str__(self):
        return f"next({str(self.item)})"
    
class Plus:
    def __init__(self, left, right):
        self.left = left
        self.right = right

    def __str__(self):
        return f"plus({str(self.left)}, {str(self.right)})"
    
def genItem():
    # genItem(zero).
    yield Zero()

    # genItem(next(I)) :-
    #   genItem(I).
    for i in genItem():
        yield Next(i)

    # genItem(plus(I1, I2)) :-
    #   genItem(I1),
    #   genItem(I2).
    for i1 in genItem():
        for i2 in genItem():
            yield Plus(i1, i2)

def boundedGenItem(bound):
    # boundedGenItem(_, zero).
    yield Zero()

    # boundedGenItem(Bound, next(I)) :-
    #   Bound > 0,
    #   NewBound is Bound - 1,
    #   boundedGenItem(NewBound, I).
    if bound > 0:
        for i in boundedGenItem(bound - 1):
            yield Next(i)

    # boundedGenItem(Bound, plus(I1, I2)) :-
    #   Bound > 0,
    #   NewBound is Bound - 1,
    #   boundedGenItem(NewBound, I1),
    #   boundedGenItem(NewBound, I2).
    if bound > 0:
        for i1 in boundedGenItem(bound - 1):
            for i2 in boundedGenItem(bound - 1):
                yield Plus(i1, i2)

    
def optimizedBoundedGenItem(bound):
    yield Zero()

    if bound > 0:
        for i1 in optimizedBoundedGenItem(bound - 1):
            yield Next(i1)
            for i2 in optimizedBoundedGenItem(bound - 1):
                yield Plus(i1, i2)

def myNumber():
    yield 0
    yield 1
    yield 2

# makePair(pair(A, B)) :-
#   myNumber(A),
#   myNumber(B).
def makePair():
    for i1 in myNumber():
        for i2 in myNumber():
            yield (i1, i2)

# exp ::= variable(x) | variable(y) | call(exp, exp)

class Variable:
    def __init__(self, name):
        self.name = name
    def __str__(self):
        return f"variable({self.name})"
    
class Call:
    def __init__(self, e1, e2):
        self.e1 = e1
        self.e2 = e2
    def __str__(self):
        return f"call({str(self.e1)}, {str(self.e2)})"
    
# gen(_, variable(x)).
# gen(_, variable(y)).
# gen(Bound, call(E1, E2)) :-
#   Bound > 0,
#   NewBound is Bound - 1,
#   gen(NewBound, E1),
#   gen(NewBound, E2).

def variable():
    yield "x"
    yield "y"

def genCalls(bound):
    if bound > 0:
        for var in variable():
            yield var

def gen(bound):
    yield Variable("x")
    yield Variable("y")

    if bound > 0:
        newBound = bound - 1
        for e1 in gen(newBound):
            for e2 in gen(newBound):
                yield Call(e1, e2)
