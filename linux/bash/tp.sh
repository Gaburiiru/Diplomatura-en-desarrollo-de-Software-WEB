#!/bin/bash
# Author: elgabo
# tp

removerSegunTipo () {
	if [ -f $1 ]; then
        rm $1
        echo "El archivo $1 se ha removido con exito!"
    else
        rm -rf $1
        echo "El directorio $1 se ha removido con exito!"
	fi
}
#------------------------------Menu-------------------------------------
Menu(){
	echo "usted esta en:"
	pwd
	echo hello $USER welcome to menu
	echo
	echo 1-Navegar
	echo 2-Crear-directorio
	echo 3-Crear-archivo
	echo 4-Copiar
	echo 5-Mover
	echo 6-Pegar
	echo 7-Renombrar
	echo 8-Eliminar
	echo 9-Salir
	echo
}
#------------------------------Navegacion-------------------------------------
Navegar(){
	echo "bienvenido a la navegacion 🤑"
	echo "multu importan Navegar solo utilizando el nombre del directorio"
	echo "para retroceder una vez, apretar la tecla enter"
	echo
	nav=""
	read -p "1-retroceder 🔙, 2-avanzar 🔜 y 3-cancelar 🚫: " nav
	wea=0
	while [[ $wea < "1" ]];
	do
		case $nav in
			1)
				nav=""
				read -p "Ingrese donde desea moverse: " nav
		   	 	if [ -d $nav ]; then
                	cd ../$nav
                	pwd
					ls
				else
                	pwd
					echo la ruta no etsite
				fi
				wea=1
			;;
			2)
				nav=""
				read -p "Ingrese donde desea moverse: " nav
		   	 	if [ -d $nav ]; then
                	cd $nav
                	pwd
					ls
				else
                	pwd
					echo la ruta no etsite
        		fi
				wea=1
			;;
			3)
				wea=1
				echo Navegacion cancelada
				echo le tiene miedo al exito
			;;
			*)
			  	wea=0
			  	echo vuelva a ingresar 1 , 2 o 3
				nav=""
				read -p "1-retroceder 🔙, 2-avanzar 🔜 y 3-cancelar 🚫: " nav
			;;
		esac
	done
}
#------------------------------creandoD-------------------------------------
CrearD(){
	echo "bienvenido a crear un directorio 🤑"
	read -p "Ingrese el nombre del directorio nuevo: " dir

	if [ -d $dir ];then
			echo la carpeta $dir ya existe
	else
		mkdir $dir
		ls
		echo $dir se ha crado exitosamente
	fi
}
#------------------------------creandoA-------------------------------------
CrearA(){
	echo "bienvenido a crear un archivo 🤑"
	read -p "Ingrese el nombre del archivo nuevo: " arc

	if [ -e $arc ];then
		echo el archivo $arc ya existe
	else
		touch $arc
		ls
		echo se ha crado exitosamente
	fi
}
#-----------------------VARIABLES-AUXILIARES------------------------------
rutaGuardada="ninguno"
nombreArchivoGuardado="ninguno"
estadoPrePegar="ninguno"
#-------------------------GENERAR-RUTA-COMPLETA-ARCHIVO-------------------
generarRutaArchivo () {
	echo "$rutaGuardada/$nombreArchivoGuardado"
}
#------------------------------mover-------------------------------------
Mover(){
	echo "bienvenido a mover un archivo o directorio 🤑"
    read -p "Ingrese nombre del archivo o directorio a mover: " nombreArchivo
    if [ -e $nombreArchivo ]; then
	    nombreArchivoGuardado=$nombreArchivo
        rutaGuardada=$(pwd)
        estadoPrePegar="mover"
		echo "Archivo o directorio $nombreArchivo ah sido seleccionado con exito ✔️"
    else
        echo "No existe ningun archivo o directorio con ese nombre en el directorio actual ❌"
    fi
}
#------------------------------copiar-------------------------------------
Copiar(){
	echo "bienvenido a copiar un archivo o directorio 🤑"
	read -p "Ingrese nombre del archivo o directorio a copiar: " nombreArchivo
	if [ -e $nombreArchivo ]; then
		nombreArchivoGuardado=$nombreArchivo
		rutaGuardada=$(pwd)
		estadoPrePegar="copiar"
		echo "Archivo o directorio $nombreArchivo ah sido seleccionado con exito ✔️"
	else
		echo "No existe ningun archivo o directorio con ese nombre en la ubicacion actual ❌"
	fi
}
#------------------------------pegar-------------------------------------
Pegar () {
	echo "bienvenido a pegar un archivo o directorio 🤑"
	rutaOrigenArchivo="$(generarRutaArchivo)"
	if [ -e  $rutaOrigenArchivo ]; then
		if ! [ -e $nombreArchivoGuardado ]; then
			if [ -d $rutaOrigenArchivo ]; then
				if [[ $estadoPrePegar == "copiar" ]]; then
					cp -R $rutaOrigenArchivo .
					echo "El directorio $nombreArchivo se ha copiado con exito! ✔️"
				else
					mv $rutaOrigenArchivo .
					echo "El directorio $nombreArchivo se ha movido con exito! ✔️"
				fi
			else
                if [[ $estadoPrePegar == "copiar" ]]; then
                    cp $rutaOrigenArchivo .
	                echo "El archivo $nombreArchivo se ha copiado con exito! ✔️"
                else
                    mv $rutaOrigenArchivo .
		            echo "El archivo $nombreArchivo se ha movido con exito! ✔️"
                fi
			fi
		else
			echo "Ya existe un archivo con ese nombre en este directorio 😔"
		fi
	else
		echo "Ya no existe el archivo de origen o no se ha seleccionado un opcion copiar/mover! ❌"
	fi
}
#------------------------------renombrar-------------------------------------
Rename(){
	echo "bienvenido a renombrar un archivo 🤑"
	read -p "ingrese archivo o directorio a renombrar: " renombrar
	if [ -e $renombrar ] || [ -f $renombrar ]; then
		read -p "ingrese nuevo nombre de archivo o directorio: " nuevoNombre
		mv $renombrar $nuevoNombre
		echo el nombre $nuevoNombre se cambio exitosamente
	else
		echo no existe el archivo o directorio que desea renombrar
	fi
}
#------------------------------eliminar-------------------------------------
Delete(){
	echo "bienvenido a eliminar un archivo 🤑"
	read -p "Ingrese la ruta del archivo/directorio: " rutaObjetivo
	if [ -e $rutaObjetivo ]; then
		read -p "Esta seguro que desea remover $rutaObjetivo? [s/n]: " decision
		case $decision in
			"s")
				echo "El archivo o directorio ripio"
				removerSegunTipo $rutaObjetivo ;;
			"n")
				echo "Momento XD";;
			*)
				echo "Opcion no valida"
		esac
	else
		echo "El archivo o directorio no existe! 😔"
	fi
}
#-----------------------programa en si---------------------------
clear

Menu
variableUser=""
read -p "ingrese un comando: " variableUser

while [[ $variableUser != "9" ]];
do
	echo
	case $variableUser in
		1)
			Navegar	;;
		2)
			CrearD ;;
		3)
			CrearA ;;
		4)
			wea=0
			Copiar  ;;
		5)
            wea=0
			Mover ;;
		6)	
			Pegar ;;
		7)
			Rename ;;
		8)
			Delete ;;
		*)
       		echo "mijo usted esta pendejo 🧐"
	esac
	read -p "ingrese un comando: " variableUser
	clear
	Menu
done
echo "bai"