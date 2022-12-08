import csv

alumnos = {}
notas = []

def crearArchivoCSV():
    with open("promedios.csv","w") as archivoCSV:
        print("El archivo csv fue creado exitosamente \n")

        archivoCSV.close()

def calcularPromedio(nombre):
    for indice in notas:
        num = 0
        for i in range(len(indice)):
            indice[i] = int(indice[i])    
            num += indice[i]
            #aca no se puede agregar ZeroDivisionError porque si se agrega una nota como 0 se va a dividir por el indice que va a ser 1 xd   
            promedio = (num/len(indice))
                
        key, value = nombre, promedio
        alumnos[key]=value
    print("promedio del alumno {} cargado".format(key))    
    cargarNombre(key)
    cargarPromedio(value)

def cargarNombre(key):
    try:
        with open("promedios.csv","r+") as archivoCSV:
            encabezados = archivoCSV.readline()
            agregar = csv.writer(archivoCSV, lineterminator=";")
            encabezados = encabezados.rstrip("\n").upper().split(",")
            agregar.writerow([key])

            archivoCSV.close()
    except FileNotFoundError:
        print("soy una linea que nunca se va a ejecutar porque siempre se va a generar promedios.csv xd")

def cargarPromedio(value):
    try:
        with open("promedios.csv","r+") as archivoCSV:
            encabezados = archivoCSV.readline()
            agregar = csv.writer(archivoCSV, lineterminator="\n")
            encabezados = encabezados.rstrip("\n").upper().split(",")
            agregar.writerow([value])

            archivoCSV.close()
    except FileNotFoundError:
        print("soy una linea que nunca se va a ejecutar porque siempre se va a generar promedios.csv xd")

def leerNotas():
    try:
        try:
            with open("notasAlumnos.csv") as archivo:
                encabezados = archivo.readline()
                archivo_reader = csv.reader(archivo,delimiter=",")
                encabezados = encabezados.rstrip("\n").upper().split(",")

                for fila in archivo_reader:
                    nombre = (fila[1])
                    notas.append(fila[2:])

                    calcularPromedio(nombre)

                archivo.close()
        except IndexError:
            print("Si es tan amable modifique su archivo csv para tener un delimiter=',' en caso de tener un delimiter=';'")
    except FileNotFoundError:
        print("manito no encuentro el archivo ._.")
        print("Si puede ser tan amable de renombrar su archivo como *notasAlumnos.csv* uwu\n")

crearArchivoCSV()
leerNotas()