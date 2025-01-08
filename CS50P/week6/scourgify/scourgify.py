import sys
import csv

list = []

if len(sys.argv) > 3:
    sys.exit("Too many command-line arguments")
elif len(sys.argv) < 3:
    sys.exit("Too few command-line arguments")
elif not sys.argv[1].endswith(".csv") and not sys.argv[2].endswith(".csv"):
    sys.exit("Not a CSV file")
else:
    try:
        with open(sys.argv[1]) as file:
            reader = csv.DictReader(file)
            for line in reader:
                lastname, firstname = line["name"].split(", ")
                house = line["house"]
                list.append({"first": firstname, "last": lastname, "house": house})


        #write to new file
        with open(sys.argv[2], 'w') as outfile:
            writer = csv.DictWriter(outfile, fieldnames = ["first", "last", "house"])
            writer.writeheader()
            for row in list:
                writer.writerow(row)

    except FileNotFoundError:
        sys.exit(f"Could not read {sys.argv[1]}")

