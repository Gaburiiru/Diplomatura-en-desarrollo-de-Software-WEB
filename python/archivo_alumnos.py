'''Se tiene un archivo con los alumnos de una materia,
y se desea dividirlos en dos grupos de prácticas:

grupo 1 para los alumnos con padrón impar,
grupo 2 para los alumnos con padrón par.

La lista de alumnos se encuentra en un archivo en formato CSV. El número de columnas es 3, y el formato es: 

numero_padron,nombre,apellido

Se pide escribir una función que reciba como parámetro el nombre del archivo de alumnos y escriba dos archivos, grupo1.csv y grupo2.csv, con la lista de padrones correspondientes, uno por línea.

Nota: al finalizar la ejecución de la función (haya ocurrido un error o no), todos los archivos abiertos deben quedar cerrados.
'''

import csv

def asignar_grupos(ruta_alumnos):
    with open(ruta_alumnos, encoding="UTF-8") as archivo_alumnos, open("grupo_1.csv", "w") as grupo_1, open("grupo_2.csv", "w") as grupo_2:
        alumnos_csv = csv.reader(archivo_alumnos, delimiter=";", lineterminator="\n")
        grupo_1_csv = csv.writer(grupo_1, delimiter=";", lineterminator="\n")
        grupo_2_csv = csv.writer(grupo_2, delimiter=";", lineterminator="\n")
        
        for numero_padron, nombre, apellido in alumnos_csv:
            fila = (numero_padron,nombre,apellido)
            
            if int(numero_padron) % 2 == 0:
                grupo_2_csv.writerow(fila)
            else:
                grupo_1_csv.writerow(fila)
    print("Se han generado los archivos =)")
    
asignar_grupos("alumnos.csv")