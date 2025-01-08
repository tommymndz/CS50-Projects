string = input("Input: ")

eliminate = "aeiouAEIOU"

for i in eliminate:
    string = string.replace(i, "")

print(string)


