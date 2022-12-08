#!/bin/bash
# Author: elgabo
# tpFINISHIM
Bd(){
	echo "ingrese nombre de la base de datos"
	read -p "existente para sobreescribir o nueva para crear: " bd
	
	echo sqlite3 $bd.db;
	cat CREATE.sql | sqlite3 $bd.db
}

Insert(){
	cat INSERT.sql | sqlite3 $bd.db
}

Reset(){
	cat RESET.sql | sqlite3 $bd.db
}

#----------------------------------------------------------------------------
Menu(){
	echo hello $USER welcome to menu
	echo
    echo "Gestor base de datos"
    echo "1. Crear la base de datos "
    echo "2. Insertar datos"
    echo "3. Resetear la base de datos "
	echo "4-Salir"
	echo
}
#-----------------------programa en si---------------------------

clear

Menu
variableUser=""
read -p "ingrese un comando: " variableUser

while [[ $variableUser != "4" ]];
do
	echo
	case $variableUser in
		1)
			Bd;;
		2)
			Insert;;
		3)
			Reset;;
	esac

	read -p "ingrese un comando: " variableUser
	clear
	Menu

done

echo bai