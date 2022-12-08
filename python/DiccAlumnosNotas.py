'''Escribir un programa que simule un sistema de carga de notas de alumnos. Debe almacenar, para cada alumno, todas sus notas y permitir 
Dar de alta un alumno
Cargar notas de un alumno existente
Eliminar un alumno
Calcular el promedio de un alumno
Mostrar todos los alumnos con sus respectivas calificaciones
'''

# alumnos = { "Nombre Alumnno 1": [10, 10, 9], "Nombre Alumnno 2": [8, 7] }

alumnos = {}

def agregar_alumno():
    
    alumno = input("Ingrese el nombre del alumno: ")
    notas = []
    alumnos[alumno] = notas

    mostrar_mensaje_alta_satisfactoria()

def cargar_notas_x_alumno_existente():
    alumno = input("Ingrese el nombre del alumno: ")
    
    if existe_alumno(alumno, alumnos):
        agregar_nota(alumno, alumnos)

def eliminar_alumno():
    alumno = input("Ingrese el nombre del alumno: ")

    if existe_alumno(alumno, alumnos):
        alumnos.pop(alumno)
        print("El alumno", alumno, "fue eliminado con exito")

def calcular_promedio_alumno():
    alumno = input("Ingrese el nombre del alumno: ")

    if existe_alumno(alumno, alumnos):
        print("El promedio de {} es {}".format(alumno, promedio(alumnos[alumno])))

def mostrar_mensaje_alta_satisfactoria():
    print("El alumno fue dado de alta satisfactoriamente")

def existe_alumno(alumno, alumnos):
    if alumno in alumnos:
        return True
    print("El alumno no existe")
    return False

def agregar_nota(alumno, alumnos):
    alumnos[alumno].append(int(input("Ingrese la nota: ")))
    print("La nota fue cargada con exito")

def promedio(notas):
    suma_notas = 0
    for nota in notas:
        suma_notas += nota
    return suma_notas/len(notas)

agregar_alumno()
cargar_notas_x_alumno_existente()
eliminar_alumno()
calcular_promedio_alumno()

print(alumnos)