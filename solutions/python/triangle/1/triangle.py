def equilateral(sides):
    return (sides[1] == sides[2] and sides[2] == sides[0] and sides[0] == sides[1]) and is_triangle(sides)


def isosceles(sides):
    return (sides[1] == sides[2] or sides[2] == sides[0] or sides[0] == sides[1]) and is_triangle(sides)


def scalene(sides):
    return (not (sides[1] == sides[2] or sides[2] == sides[0] or sides[0] == sides[1])) and is_triangle(sides)

def is_triangle(sides):
    return ((sides[0] + sides[1]) >= sides[2] and (sides[1] + sides[2]) >= sides[0] and (sides[0] + sides[2]) >= sides[1]) and all([side>0 for side in sides])
