agenda = {'lunes': [('h',2),('w',2)], 'martes': []}
MAX=24
def eliminar(agenda):
    dia=input("ingrese dia: ")
    nombreAc=input("ingresa el nombre de la actividad: ")
    for i in agenda[dia]:
        nombreActividad,horas=i
        if(nombreActividad == nombreAc):
            agenda[dia].remove(i)
            print(agenda)
            
def agregar_actividad(agenda):
    dia=input("ingrese dia: ")
    if dia in agenda.keys():
        if len(agenda[dia])==0:
            nombreAc=input("ingresa el nombre de la actividad: ")
            hora =int(input("ingresa hora no mayor a 24: "))
            if(hora<=MAX):
                registro=(nombreAc,hora)
                agenda[dia].append(registro)
                print(agenda)
                print(hora)
            else:
                print("mijo usted esta pendejo xdxdxd")
        else:
            for i in agenda[dia]:
                nombreActividad,horas=i
                horas += horas
                nombreAc=input("ingresa el nombre de la actividad: ")
                if(nombreActividad != nombreAc):
                    hora =int(input("ingresa hora no mayor a 24: "))
                    horas += hora
                    if(horas<=MAX):
                        registro=(nombreAc,hora)
                        agenda[dia].append(registro)
                        print(agenda)
                        print(horas)
                        break
                    else:
                        print("mijo usted esta pendejo")
                else:
                    print("agregue una actividad con otro nombre chamaco")
    else:
        print("su dia no existe")
agregar_actividad(agenda)

