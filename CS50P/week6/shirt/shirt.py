import sys
from PIL import Image, ImageOps
import os

if len(sys.argv) == 3:
    extensions = [".jpg", ".jpeg", ".png"]
    extension1 = os.path.splitext(sys.argv[1])
    extension2 = os.path.splitext(sys.argv[2])
    if extension1[1] == extension2[1] and extension1[1] in extensions:
        try:
            image = Image.open(sys.argv[1])

        except FileNotFoundError:
            sys.exit("Input does not exist")

        shirt = Image.open("shirt.png")
        size = shirt.size
        image = ImageOps.fit(image, size)
        image.paste(shirt, shirt)
        image.save(sys.argv[2])

    elif extension1[1] != extension2[1]:
        sys.exit("Input and output have different extensions")
    else:
        sys.exit("wrong extension")

elif len(sys.argv) < 3:
    sys.exit("Too few command-line argument")
elif len(sys.argv) > 3:
    sys.exit("Too many command-line argument")

