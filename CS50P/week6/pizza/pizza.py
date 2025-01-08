from tabulate import tabulate
import sys
import csv

list = []

if len(sys.argv) < 2:
    sys.exit("Too few command-line arguments")
elif len(sys.argv) > 2:
    sys.exit("Too many command-line arguments")
elif not sys.argv[1].endswith(".csv"):
    sys.exit("Not a CSV file")
else:
    try:
        with open(sys.argv[1]) as file:
            reader = csv.reader(file)
            for row in reader:
                list.append(row)
            print(tabulate(list, tablefmt = "grid", headers = "firstrow"))

    except FileNotFoundError:
        sys.exit("File does not exist")

