
INGRESAR_SISTEMA = "1"
OLVIDE_LA_CLAVE = "2"
SALIR = "3"
SEPARADOR = "\n" + "-" * 55 + "\n"

def cajeroAutomatico():
    # Esta es la clave bancaria de Frank, no lo hackeen!!!
    clave ="2503"
    opcion = 0
    continuar = True
    contador = 0

    while(continuar):    
        mostrarOpciones()
        opcion = input("--> Ingrese una opción: ")
        if opcion == INGRESAR_SISTEMA:
            claveIngresada = input("\nIngrese su clave bancaria: ")
            
            if claveIngresada == clave:
                mostrarClaveCorrecta()
            else:
                contador += 1
                if contador < 3:
                    mostrarErrorClaveIncorrecta()
                else:
                    mostrarBastaChicos()
                    continuar = False

        elif opcion == OLVIDE_LA_CLAVE:
            cambiarClave(clave)

        elif opcion == SALIR:
            print("\nHasta la próximaaa")
            continuar = False

        else:
            mostrarErrorOpcionInvalida()

def mostrarOpciones():
    print("1. Ingresar al sistema")
    print("2. Olvidé la clave")
    print("3. Salir")

# === Implementar ===
def cambiarClave(clave):
    Nclave = input("\nIngrese su Nueva clave bancaria: ")
    if len(Nclave) == 4:
        valor = Nclave.isdigit()
        if valor == True:
            clave = Nclave
            print(SEPARADOR)
            print("Clave cambiada exitosamente.", clave)
            print(SEPARADOR)
            validarContraseña(clave)
            
        else:
            print(SEPARADOR)
            print("Por favor man ingresa digitos numericos")
            print(SEPARADOR)                
    else:
        print(SEPARADOR)
        print("Por favor man ingresa una clave de 4 digitos")
        print(SEPARADOR)

def validarContraseña(clave):
    contraseña = input("Ingrese la clave bancaria ")
    if contraseña == clave:
        mostrarClaveCorrecta()
    else:
        mostrarErrorClaveIncorrecta()

# === Mensajes de error ===
def mostrarErrorClaveIncorrecta():
    print(SEPARADOR)
    print("La clave es incorrecta. Vuelva a intentar.")
    print(SEPARADOR)

def mostrarErrorOpcionInvalida():
    print(SEPARADOR)
    print("La opción ingresada no es válida. Vuelva a intentar.")
    print(SEPARADOR)

def mostrarClaveCorrecta():
    print(SEPARADOR)
    print("Bienvenido Franki-kun.")
    print(SEPARADOR)

def mostrarBastaChicos():
    print(SEPARADOR)
    print("ya wey.")
    print(SEPARADOR)
        
# No borrar esta línea
cajeroAutomatico()