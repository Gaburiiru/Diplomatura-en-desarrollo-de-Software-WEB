#!/bin/bash
# Author: elgabo
# tpFINISHIM
Bd(){
	echo "CREATE TABLE Encargado(
		DNI INTEGER(8) NOT NULL,
		nombre VARCHAR(15) NOT NULL,
		apellido VARCHAR(15) NOT NULL,
		email VARCHAR(40) NOT NULL,
		CONSTRAINT dni_pk PRIMARY KEY (DNI)
	);
	" | sqlite3 tpFINISHIM.db

	echo "CREATE TABLE Telefono(
		id_telefono INTEGER(8) NOT NULL,
		telefono INTEGER(10) NOT NULL,
		dni_encargado_T INTEGER(11) NOT NULL,
		CONSTRAINT id_telefono_pk PRIMARY KEY (id_telefono),
		CONSTRAINT dni_encargado_T_fk FOREIGN KEY (dni_encargado_T) REFERENCES Encargado(DNI)
	);
	" | sqlite3 tpFINISHIM.db

	echo "CREATE TABLE Bar(
		id_bar INTEGER(11) NOT NULL,
		direccion VARCHAR(50) NOT NULL,
		capacidad INTEGER(20) NOT NULL,
		dni_encargado_B INTEGER(11) NOT NULL,
		CONSTRAINT id_bar_pk PRIMARY KEY (id_bar),
		CONSTRAINT dni_encargado_B_fk FOREIGN KEY (dni_encargado_B) REFERENCES Encargado(DNI)
	);
	" | sqlite3 tpFINISHIM.db

	echo "CREATE TABLE Banda(
		id_banda INTEGER(11) NOT NULL,
		nombre VARCHAR(50) NOT NULL,
		genero VARCHAR(20) NOT NULL,
		cantMiembros INTEGER(11) NOT NULL,
		CONSTRAINT id_banda_pk PRIMARY KEY (id_banda)
	);
	" | sqlite3 tpFINISHIM.db

	echo "CREATE TABLE Cancion(
		titulo VARCHAR(50) NOT NULL,
		album VARCHAR(50) NOT NULL,
		letra  VARCHAR(50),
		duracion FLOAT(11),
		id_banda_C INTEGER(11),
		CONSTRAINT titulo_album_pk PRIMARY KEY (titulo,album),
		CONSTRAINT id_banda_C_fk FOREIGN KEY (id_banda_C) REFERENCES Banda(id_banda)
	);
	" | sqlite3 tpFINISHIM.db

	echo "CREATE TABLE Recital(
		id_recital INTEGER(11) NOT NULL,
		precio_Entrada INTEGER(11) NOT NULL,
		fecha DATE NOT NULL,
		id_banda_R INTEGER(11),
		id_bar_R INTEGER(11),
		CONSTRAINT id_recital_pk PRIMARY KEY (id_recital),
		CONSTRAINT id_banda_R_fk FOREIGN KEY (id_banda_R) REFERENCES Banda(id_banda),
		CONSTRAINT id_bar_R_fk FOREIGN KEY (id_bar_R) REFERENCES Bar(id_bar)
	);
	" | sqlite3 tpFINISHIM.db
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