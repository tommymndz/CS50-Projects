import sys
import random
from pyfiglet import Figlet

figlet = Figlet()

if len(sys.argv) == 1:
    isRandomFont = True
elif len(sys.argv) == 3 and (sys.argv[1] == "-f" or sys.argv[1] == "--font"):
    isRandomFont = False
else:
    sys.exit("Invalid Usage")

#You can then get a list of available fonts with code like this:
figlet.getFonts()

if isRandomFont == False:
    try:
        figlet.setFont(font=sys.argv[2])
    except:
        sys.exit("Invalid Usage")

else:
    font = random.choice(figlet.getFonts())

str = input("Input: ")

print(f"Output: {figlet.renderText(str)}")
