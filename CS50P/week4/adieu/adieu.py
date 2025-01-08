import inflect


#crear instancia del motor (para que funcione)
p = inflect.engine()

names = []

try:
    while True:
        name = input("Name: ")
        #colocar cada nombre en la lista names[]
        names.append(name)

except:
    pass

#funcion para dar formato a la lista con , y and
formatted_names = p.join(names)

#imprimir nueva linea
print()
#imprimir salida
print(f"Adieu, adieu, to {formatted_names}")
