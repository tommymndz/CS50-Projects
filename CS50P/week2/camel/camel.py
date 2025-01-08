s = input("camelCase: ")

print("snake_case: ", end="")

for i in s:
    if i.isupper():
        print("_" + i.lower(), end="")
    else:
        print(i, end="")
print()
