''' Escribir una función que dado el nombre de un archivo csv devuelva un diccionario
donde la clave es el número de línea y su valor asociado la cantidad de palabras que tiene esa línea.
Asumir que cada línea contiene palabras separadas únicamente por comas y el mismo no tiene encabezado.

Nota: al finalizar la ejecución de la función (haya ocurrido un error o no), todos los archivos abiertos deben quedar cerrados.

palabra1,palabra2,palabra3,... --> ['palabra1', 'palabra2', 'palabra3']
palabra4,

diccionario = {1: 3, 2: 1, ...}

'''

import csv

def cant_palabras_por_linea(nombre_csv):
    
    diccionario = {} # diccionario que voy a devolver
    
    with open(nombre_csv, "r") as archivo:
        archivo_csv = csv.reader(archivo, delimiter=",", lineterminator="\n")
        cant_palabras = 0
        nro_linea = 1
        
        for linea in archivo_csv:
            cant_palabras = len(linea)
            diccionario[nro_linea] = cant_palabras
            nro_linea += 1
    
    return diccionario

print(cant_palabras_por_linea("palabra_loca.csv"))