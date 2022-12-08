from __future__ import print_function


try:
    num1=int(input("ingrese el 1 numero: "))
    num2=int(input("ingrese el 2 numero: "))
    resultado=num1/num2
    print(resultado)
except ValueError:
    print("error xd tenes que ingresar numeros")
except ZeroDivisionError:
    print("pelotudo no se puede dividir por 0")
finally:
    print("multo epico")