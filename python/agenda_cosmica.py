MAX_CANT_HORAS_DIARIAS = 24
MENU = "\t1) Agregar una actividad a la agenda \n\t2) Eliminar una actividad de la agenda \n\t3) Mostrar todas las actividades \n\t4) Salir"
AGREGAR_ACTIVIDAD = "1"
ELIMINAR_ACTIVIDAD = "2"
MOSTRAR_ACTIVIDADES = "3"
SALIR = "4"

agenda = {'lunes': [], 'martes': [], 'miercoles': [], 'jueves': [], 'viernes': [], 'sabado': [], 'domingo': []}

SEP = "\n==================================================================\n"

def menu_agenda():
    mensaje_Bienvenida()
    opcion = ""
    while opcion != SALIR:
        mostrar_menu()
        opcion = input("--> Ingrese una opción: ")
        if opcion == AGREGAR_ACTIVIDAD:
            agregar_Ac(agenda)
        elif opcion == ELIMINAR_ACTIVIDAD:
            eliminar_Ac(agenda)                          
        elif opcion == MOSTRAR_ACTIVIDADES:
            consultar_Ac(agenda)
        elif opcion == SALIR:
            mensaje_Despedida()
        else:
            mostrar_error_opcion()

#  Funciones de interfaz de usuario
def mostrar_menu():
    print(MENU)
    
def mensaje_Despedida():
    print("Hasta la proximaaa")
    print("sayonara")

def mensaje_Bienvenida():
    print("========== Bienvenido gestor de actividades ==========")

def mostrar_error_opcion():
    print("========== Esta opcion no se encuentra en el menu ==========")

def agregar_Ac(agenda):
    dia=input("ingrese dia: ")
    if dia in agenda.keys():
        if len(agenda[dia])==0:
            nombre=input("ingresa el nombre de la actividad: ")
            hora =int(input("ingresa una hora no mayor a 24: "))
            if(hora<=MAX_CANT_HORAS_DIARIAS):
                registro=(nombre,hora)
                agenda[dia].append(registro)
                print(SEP)
            else:
                print("agregue un horario no mayor a 24hs")
                print(SEP)
        else:
            for acti in agenda[dia]:
                nombreActividad,horas=acti
                horas += horas
                nombre=input("ingresa el nombre de la actividad: ")
                if(nombreActividad == nombre):
                    print("agregue una actividad con otro nombre chamaco")
                    print(SEP)
                    break
                else: 
                    hora =int(input("ingresa un horario: "))
                    horas += hora
                    if(horas<=MAX_CANT_HORAS_DIARIAS):
                        registro=(nombre,hora)
                        agenda[dia].append(registro)
                        print(SEP)
                        break
                    else:
                        disponible = MAX_CANT_HORAS_DIARIAS - horas
                        print("agregue un horario no mayor a 24hs")
                        print("la cantidad de horas disponibles es:{}".format(disponible))
    else:
        print("F su dia no existe")
        print(SEP)


def eliminar_Ac(agenda):
    dia=input("ingresa el dia: ")
    nombre=input("ingresa el nombre de la actividad que desea eliminar: ")
    for eliminar in agenda[dia]:
        nombreActividad,horas=eliminar
        if(nombreActividad == nombre):
            agenda[dia].remove(eliminar)
            print("Actividad eliminada satisfactoriamente xd")
            print(SEP)
            break
        else:
            print("solo puede eliminar una actividad que exista")
            print(SEP)
            break

            
def consultar_Ac(agenda):
    print("Actividades")
    for dia in agenda.keys():
        print("==== {} ==== \n".format(dia))
        for(actividad, cantHora) in agenda[dia]:
            print("> Nombre de la actividad: {0} -Hora de la actividad: {1}\n".format(actividad,cantHora))

menu_agenda()