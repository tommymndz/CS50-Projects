greetings = input("Greeting: ")

if "Hello" in greetings:
    print("$0")
elif greetings.startswith("H"):
    print("$20")
else:
    print("$100")
