#Python practice code

def arithmetic_operation(a, b):
    input(a, b)
    if(b == 0):
        print("Division by 0.")    
    else:
        quotient = a/b    
    return (a+b),(a-b),(a*b), quotient
print()


def EvenorOdd(num):
    input(num)
    if(num/2):
        print("Even")
    else:
        print("Odd")
        
def count_occurrences(list, element):
    input(list)
    return list.count(element)