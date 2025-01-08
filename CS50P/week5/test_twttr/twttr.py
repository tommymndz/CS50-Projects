def main():
    str = input("Input: ")
    print(shorten(str))


def shorten(word):

    eliminate = "aeiouAEIOU"

    for i in eliminate:
        word = word.replace(i, "")

    return word


if __name__ == "__main__":
    main()
