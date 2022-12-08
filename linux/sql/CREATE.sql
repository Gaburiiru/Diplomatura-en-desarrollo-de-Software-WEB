CREATE TABLE Encargado(
    dni INTEGER(8) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    email VARCHAR(40) NOT NULL,
    telefono INTEGER(10) NOT NULL,
    telefono_Sec INTEGER(10),
    CONSTRAINT dni_pk PRIMARY KEY (dni)
);

CREATE TABLE Bar(
    id_bar INTEGER(10) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    capacidad INTEGER(20) NOT NULL,
    dni_encargado_B INTEGER(8) NOT NULL,
    CONSTRAINT id_bar_pk PRIMARY KEY (id_bar),
    CONSTRAINT dni_encargado_B_fk FOREIGN KEY (dni_encargado_B) REFERENCES Encargado(dni)
);

CREATE TABLE Banda(
    id_banda INTEGER(10) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    genero VARCHAR(20) NOT NULL,
    integrantes INTEGER(10) NOT NULL,
    CONSTRAINT id_banda_pk PRIMARY KEY (id_banda)
);

CREATE TABLE Cancion(
    titulo VARCHAR(50) NOT NULL,
    album VARCHAR(50) NOT NULL,
    letra  VARCHAR(50),
    duracion FLOAT(3),
    id_banda_C INTEGER(10),
    CONSTRAINT titulo_album_pk PRIMARY KEY (titulo,album,id_banda_C),
    CONSTRAINT id_banda_C_fk FOREIGN KEY (id_banda_C) REFERENCES Banda(id_banda)
);

CREATE TABLE Recital(
    precio_Entrada INTEGER(10) NOT NULL,
    fecha DATE NOT NULL,
    id_banda_R INTEGER(10),
    id_bar_R INTEGER(10),
    CONSTRAINT id_recital_pk PRIMARY KEY (id_banda_R,id_bar_R,fecha),
    CONSTRAINT id_banda_R_fk FOREIGN KEY (id_banda_R) REFERENCES Banda(id_banda),
    CONSTRAINT id_bar_R_fk FOREIGN KEY (id_bar_R) REFERENCES Bar(id_bar)
);