# public class Number {
#   public int value;
#   public Number(int value) {
#     this.value = value;
#   }
# }
class Number:
    def __init__(self, value):
        self.value = value
    def toNumber(self):
        return self.value

    
class Plus:
    def __init__(self, left, right):
        self.left = left
        self.right = right
    def toNumber(self):
        return self.left.toNumber() + self.right.toNumber()
    
class Multiply:
    def __init__(self, left, right):
        self.left = left
        self.right = right
    def toNumber(self):
        return self.left.toNumber() * self.right.toNumber()

class Subtract:
    def __init__(self, left, right):
        self.left = left
        self.right = right
    def toNumber(self):
        return self.left.toNumber() - self.right.toNumber()

class UnaryMinus:
    def __init__(self, child):
        self.child = child
    def toNumber(self):
        return -self.child.toNumber()
    
# 8
# Number(8)

# 2 + 3
# Plus(Number(2), Number(3))

# 3 * 4 + 5
# Plus(Multiply(Number(3), Number(4)),
#      Number(5))

# 4 - 5
# Subtract(Number(4), Number(5))

# -(2 + 2)
# UnaryMinus(Plus(Number(2),
#                 Number(2)))

# takes an AST, returns a Python number
def evaluate(node):
    if isinstance(node, Number):
        return node.value
    elif isinstance(node, Plus):
        leftResult = evaluate(node.left)
        rightResult = evaluate(node.right)
        return leftResult + rightResult
    elif isinstance(node, Multiply):
        leftResult = evaluate(node.left)
        rightResult = evaluate(node.right)
        return leftResult * rightResult
    elif isinstance(node, Subtract):
        return evaluate(node.left) - evaluate(node.right)
    elif isinstance(node, UnaryMinus):
        return -evaluate(node.child)
