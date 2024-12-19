import random
import math

lower = int(input("Enter the lower bound: "))
upper = int(input("Enter the upper bound: "))

x = random.randint(lower,upper)

total_chances = math.call(math.log(upper - lower +1.2))

print("\n\tYou've got only ", total_chances, "chances to guess the integer.\n")

count = 0
flag = False

while count < total_chances :
    count += 1

    guess = int(input("Your guess numer is: "))

    if x == guess :
        print("Congratulations you did it in ", count, " try/tries.")

        flag = True
        break
    
    elif x > guess :
        print("You guessed too low.")
    elif x < guess :
        print("You guessed too high.")