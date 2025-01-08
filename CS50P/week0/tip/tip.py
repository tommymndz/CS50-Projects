def main():
    dollars = dollars_to_float(input("How much was the meal? "))
    percent = percent_to_float(input("What percentage would you like to tip? "))
    tip = dollars * percent
    print(f"Leave ${tip:.2f}")


def dollars_to_float(d):
    dollar_no_sign = d.replace("$","")
    return float(dollar_no_sign)


def percent_to_float(p):
    percent_no_sign = p.replace("%","")
    return float(percent_no_sign) / 100

main()
