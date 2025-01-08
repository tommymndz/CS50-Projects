File = input("File Name: ").lower().strip()

if ".gif" in File:
    print("image/gif")
elif ".jpg" in File:
    print("image/jpeg")
elif ".jpeg" in File:
    print("image/jpeg")
elif ".png" in File:
    print("image/png")
elif ".pdf" in File:
    print("application/pdf")
elif ".txt" in File:
    print("text/plain")
elif ".zip" in File:
    print("application/zip")
else:
    print("application/octet-stream")
