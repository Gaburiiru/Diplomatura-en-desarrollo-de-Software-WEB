#!/bin/bash
#Author:ElBrujas
#Actividad 27-4

#Funcion par imprimir el menu, solo estetica
imprimirMenu () {
	echo "Bienvenido a su gestor de archivos"
	echo "1. Copiar archivo"
	echo "2. Mover archivo"
	echo "3. Remover archivo"
	echo "4. Salir"	
}

#Funcion para notificar si no existe el archivo/directorio objetivo o el directorio destino.
#El primer parametro que recibe es la ruta del archivo/directorio y el segundo la ruta de un directorio.
#A esta funcion se la llama sabiendo que uno de los 2 parametros no existe, por lo que si el archivo/directorio objetivo existe asumimos que la ruta no valida es la del directorio.
imprimirErrorExistencia () {
        if [ -e $1 ]; then
		echo "La ruta destino no existe!"
	else
		echo "El archivo a copiar no existe!"
	fi
}

#Recibe 2 rutas de archivos/directorios por parametro, si ambos existen "retorna true".
#En bash el return no se usa para lo que esperamos, por eso debemos ingeniarnos una alternativa.
#Recordemos que las funciones son como mini scripts/comandos, con esto en mente solo debemos recordar como hacemor para capturar la salida de un script/coamndo.
#Cuidado, si hay mas de un echo en nuestra funcion estos tambien seran capturados!
comprobarExistencia () {
	proceder=0
	if [ -e $1 ] && [ -e $2 ]; then
		proceder=1
	fi
	echo $proceder
}

#El primer parametro es la ruta del archivo/directorio objetivo, consultamos si es de tipo archivo o directorio y procedemos a copiar segun el caso en la ruta dada por el segundo parametro.
copiarSegunTipo () {
	if [ -f $1 ]; then
		cp $1 $2
		echo "El archivo se ha copiado con exito!"
	else
		cp -R $1 $2
		echo "El directorio se ha copiado con exito!"
	fi
}

#Idem a copiarSegunTipo, no hay diferencia en el codigo para mover un directorio o un archivo, se dividio en 2 casos para poder mostrar un mensaje personalizado en cada caso.
moverSegunTipo () {
	if [ -f $1 ]; then
                mv $1 $2
                echo "El archivo se ha movido con exito!"
        else    
                mv $1 $2
                echo "El directorio se ha movido con exito!"
        fi
}

#Recibe la ruta del archivo/directorio a eliminar, en este caso si varia el codigo para cada caso.
removerSegunTipo () {
	if [ -f $1 ]; then
                rm $1
                echo "El archivo se ha removido con exito!"
        else
                rm -rf $1
                echo "El directorio se ha removido con exito!"
        fi
}

#Pide la ruta del archivo a elminar por teclado, si existe pide confirmar la elminacion por teclado, si la respuesta es afirmativa llama a la funcion removerSegunTipo con rutaObjetivo como argumento.
remover () {
	read -p "Ingrese la ruta del archivo/directorio: " rutaObjetivo

	if [ -e $rutaObjetivo ]; then
		
		read -p "Esta seguro que desea remover el archivo/directorio? [s/n]: " decision
		
		case $decision in
			"s")
				removerSegunTipo $rutaObjetivo ;;
			"n")
				echo "Entendible, tenga un buen dia..." ;;
			*)
				echo "Opcion no valida"
		esac
	else
		echo "El archivo/directorio no existe!"
	fi
}

#Pide las rutas del archivo/directorio objetivo por teclado.
#Comprueba la validez de ambas rutas y captura el resultado de esa funcion.
#Si ambas rutas son validas se llama a la funcion copiarSegunTipo.
#De lo contrario se llama a la funcion imprimirErrorExistencia.
copiar () {
	read -p "Ingrese la ruta del archivo: " rutaArchivo
	read -p "Ingrese la ruta del directorio destino: " rutaDestino

	noHayErrores=$(comprobarExistencia $rutaArchivo $rutaDestino)

	if [ $noHayErrores -eq 1 ]; then
		copiarSegunTipo $rutaArchivo $rutaDestino
	else
		imprimirErrorExistencia $rutaArchivo $rutaDestino
	fi
}

#Idem a copiar
mover () {
	read -p "Ingrese la ruta del archivo: " rutaArchivo
        read -p "Ingrese la ruta del directorio destino: " rutaDestino
       
        noHayErrores=$(comprobarExistencia $rutaArchivo $rutaDestino)

        if [ $noHayErrores -eq 1 ]; then
                moverSegunTipo $rutaArchivo $rutaDestino
        else
                imprimirErrorExistencia $rutaArchivo $rutaDestino
        fi
}

#Control principal del menu
clear
imprimirMenu
read -p "Ingrese una opcion: " entrada


while [[ $entrada != "4" ]]
do	
	case $entrada in
        	1)	
                	copiar ;;
	        2)
	                mover ;;
       		3)
	                remover ;;
        	*)
               		echo "No es una opcion valida"

	esac

	read -p "Ingrese una opcion: " entrada
	clear
	imprimirMenu
done

echo "saliendo del programa..."

#Nota: No implementar la funcionalidad de comprobar duplicados hasta que los profes encuentren una forma no rebuscada de que funcione.
