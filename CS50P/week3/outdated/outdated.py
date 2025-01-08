calendar = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
]

#prompt user
while True:
    try:
        date = input("Date: ")

        if "/" in date:
            months,days,years = date.split('/')
            if int(months) >= 1 and int(months) <= 12 and int(days) >= 1 and int(days) <= 31:
                break

        elif "," in date:
            date = date.replace(",", "")
            months,days,years = date.split(" ")
            if months in calendar and int(days) <= 31:
                months = calendar.index(months) + 1
                break


    except:
        print()
        pass



print(f"{int(years)}-{int(months):02}-{int(days):02}")



