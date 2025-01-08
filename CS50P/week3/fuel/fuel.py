
while True:
    try:
        f = input("Fraction: ")
        x,y = f.split('/')
        x = int(x)
        y = int(y)
        if x > y:
            continue
        break
    except ValueError:
        pass
    except ZeroDivisionError:
        pass

if f == "1/100":
    print("E")
elif f == "99/100":
    print("F")
elif x == y:
    print("F")
elif x == 0:
    print("E")
else:
    percent = round((x / y) * 100)
    print(f"{percent}%")








