total = 50

while total > 0:
    insert = int(input("Insert Coin: "))

    if insert in [5, 10, 25]:
        total = total - insert
        if total > 0:
            print(f"Amount Due: {total}")
        elif total <= 0:
            print(f"Change Owed: {total * -1}")
    else:
        print(f"Amount Due: {total}")




