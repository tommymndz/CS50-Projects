import random
# Prompts the user for a level, If the user does not input a positive integer, the program should prompt again.
while True:
    try:
        n = int(input("Level: "))
        if n > 0:
            break
    except:
        pass

#Randomly generates an integer between 1 and n, inclusive, using the random module.
RandomInt = random.randint(1, n)

#Prompts the user to guess that integer. If the guess is not a positive integer, the program should prompt the user again.
while True:
    try:
        guess = int(input("Guess: "))
        if guess > 0:
            if guess > RandomInt:
                print("Too large!")
            elif guess < RandomInt:
                print("Too small!")
            else:
                print("Just right!")
                break
    except:
        pass


