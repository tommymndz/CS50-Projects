import json
import requests
import sys

if len(sys.argv) != 2:
    sys.exit("Missing command-line argument")

try:
    response = requests.get("https://api.coindesk.com/v1/bpi/currentprice.json")

    current = response.json()

    rate_usd = current["bpi"]["USD"]["rate_float"]

    num = float(sys.argv[1])
    result = num * rate_usd

    print(f"${result:,.4f}")

except requests.RequestException:
    sys.exit("Command-line argument is not a number")

except ValueError:
    sys.exit("Command-line argument is not a number")


