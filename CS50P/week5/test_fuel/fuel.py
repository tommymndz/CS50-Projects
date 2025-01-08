def main():
    fraction = input("Fraction: ")
    fraction_converted = convert(fraction)
    output = gauge(fraction_converted)
    print(output)

def convert(fraction):
    while True:
        try:
            x,y = fraction.split('/')
            x = int(x)
            y = int(y)

            f = x / y

            if f <= 1:
                 p = int(f * 100)
                 return p
            else:
                 fraction = input("Fraction: ")
                 pass
        except (ValueError,ZeroDivisionError):
            raise

def gauge(percentage):
    if percentage <= 1:
        return "E"
    elif percentage >= 99:
        return "F"
    else:
        return f"{percentage}%"



if __name__ == "__main__":
    main()





