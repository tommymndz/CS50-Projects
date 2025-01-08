def main():
    str = input("Greeting: ")
    print(value(str))

def value(greeting):

    if "Hello" in greeting:
        return 0
    elif greeting.startswith("H"):
        return 20
    else:
        return 100

if __name__ == "__main__":
    main()
