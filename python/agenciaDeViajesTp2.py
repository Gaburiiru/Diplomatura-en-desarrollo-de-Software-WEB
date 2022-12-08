# Opciones del menu
AGREGAR_PASAJERO = "1"
DETALLE_DESTINO = "2"
CONSULTAR_PASAJERO = "3"
CONSULTAR_PASAJEROS = "4"
SALIR = "5"

MENU = "\t1) Agregar un pasajero y su destino \n\t2) Ver detalle del destino \n\t3) Consultar por el destino de un pasajero \n\t4) Consultar por todos los pasajeros \n\t5) Salir"

SEP = "\n=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=\n"

destinosDisponibles = ["cordoba","mendoza","bariloche"]

def gestor_de_viajes():
    
    reservas = []
    
    mostrar_mensaje_bienvenida()
    opcion = ""

    while opcion != SALIR:
        mostrar_menu()
        
        opcion = input("--> Ingrese una opción: ")
        
        if opcion == AGREGAR_PASAJERO:
            agregar_pasajero(reservas)
            
        elif opcion == DETALLE_DESTINO:
            ver_detalle_destino(reservas)              
            
        elif opcion == CONSULTAR_PASAJERO:
            consultar_pasajero(reservas)
            
        elif opcion == CONSULTAR_PASAJEROS:
            listar_pasajeros(reservas)

        elif opcion == SALIR:
            mostrar_mensaje_despedida()

        else:
            mostrar_error_opcion()

#  Funciones de interfaz de usuario
def mostrar_mensaje_bienvenida():
    print("========== Bienvenido al gestor de viajes ==========")
    
def mostrar_menu():
    print(MENU)

def mostrar_error_opcion():
    print("Opcion invalida. Vuelva a intentar.")
    
def mostrar_mensaje_despedida():
    print("Hasta la proximaaa")
    print("sayonara")

# Implementar
def agregar_pasajero(reservas):
    destino = []
    n = 0
    while n < 1:
        nombre = input("ingrese un nombre: ")
        if len(nombre) == 0:
            n=0
        else:
            n=1
        
    print("Ingrese uno de los sig. destinos: /cordoba/mendoza/bariloche/")

    d = 0
    while d < 1:
        destino = input("ingrese un destino: ")
        if len(destino) == 0:
            d=0
        else:
            d=1
        
    if destino in destinosDisponibles:
        reservas.append({"nombre":nombre,"destino":destino})
        
        print(reservas)
    else:
        print("Debe agregar uno de los destinos ofrecidos .-.")
    print(SEP)
    
def ver_detalle_destino(reservas):

    dAs = 0
    while dAs < 1:
        destinoAsaber = input("ingrese el destino que desea consultar /cordoba/mendoza/bariloche/: ")
        if not destinoAsaber in destinosDisponibles:
            dAs=0
        else:
            dAs=1

    pasajerosViajan=[]
    cantPasa = 0
    for reserva in reservas:
        if reserva["destino"] == destinoAsaber:
            cantPasa += 1
            pasajerosViajan.append(reserva['nombre'])

    print("la cantidad de pasajeros que va/n a {} es {} y es/son {}".format(destinoAsaber,cantPasa,pasajerosViajan))
    print(SEP)

def consultar_pasajero(reservas):
    nombrePasajero=input("ingrese el nombre del pasajero que desea saber su destino: ")
    
    p=0
    if len(reservas) == 0:
        print("Debe agregar un pasajero plis")

    for pasajero in reservas:
        if pasajero["nombre"] == nombrePasajero:
            destinoPasajero=pasajero['destino']
            p=1
    if p==1:
        print("El/la pasajero/a {} va a {}".format(nombrePasajero,destinoPasajero))
    else:
        print("El pasajero que ingreso no existe xd")
    print(SEP)

def listar_pasajeros(reservas):
    for pasajeros in reservas:
        print(pasajeros)
    if len(reservas) == 0:
        print("Mas solo que vegano en asado familiar")
        print("No hay pasajeros")
    print(SEP)

# No borrar -BUENO-
gestor_de_viajes()