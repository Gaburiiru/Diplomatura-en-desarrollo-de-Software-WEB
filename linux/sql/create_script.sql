
CREATE TABLE Usuario (
    dni INTEGER NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    edad INTEGER NOT NULL,
    mail VARCHAR(255),

    CONSTRAINT dni_pk PRIMARY KEY (dni)
);

CREATE TABLE Auto (
    patente VARCHAR(255) NOT NULL,
    color VARCHAR(255) NOT NULL,
    user_dni INTEGER NOT NULL UNIQUE,

    CONSTRAINT patente_pk PRIMARY KEY (patente),
    CONSTRAINT auto_usuario_fk FOREIGN KEY (user_dni) REFERENCES Usuario(dni)

);

CREATE TABLE Hijo (
    hijo_dni INTEGER NOT NULL,
    nombre VARCHAR(255),
    user_dni INTEGER NOT NULL,

    CONSTRAINT hijo_dni_pk PRIMARY KEY (hijo_dni, user_dni),
    CONSTRAINT hijo_usuario_fk FOREIGN KEY (user_dni) REFERENCES Usuario(dni)

);

CREATE TABLE Entity (
    id_3 INTEGER NOT NULL,
    hijo_dni INTEGER NOT NULL,
    user_dni INTEGER NOT NULL,

    CONSTRAINT entity_usuario_fk FOREIGN KEY (user_dni) REFERENCES Usuario(dni),
    CONSTRAINT entity_hijo_fk FOREIGN KEY (hijo_dni) REFERENCES Hijo(hijo_dni),
    CONSTRAINT hijo_dni_pk PRIMARY KEY (id_3, hijo_dni, user_dni)
);

CREATE TABLE Empresa (
    cuit INTEGER NOT NULL,
    nombre VARCHAR(255),

    CONSTRAINT cuit_pk PRIMARY KEY (cuit)
);

CREATE TABLE Contrato (
    firma VARCHAR(255) NOT NULL,
    empresa_cuit INTEGER NOT NULL,
    usuario_dni INTEGER NOT NULL,

    CONSTRAINT contrato_empresa_fk FOREIGN KEY (empresa_cuit) REFERENCES Empresa(cuit),
    CONSTRAINT contrato_usuario_fk FOREIGN KEY (usuario_dni) REFERENCES Usuario(dni),
    CONSTRAINT contrato_pk PRIMARY KEY (firma)
);



CREATE TABLE Mamifero (
    nombre VARCHAR(255) NOT NULL,
    edad INTEGER NOT NULL,
    ladridos INTEGER NOT NULL,
    horas_suenio INTEGER NOT NULL,

    CONSTRAINT mamifero_pk PRIMARY KEY (nombre)
);

CREATE TABLE Perro (
    nombre VARCHAR(255) NOT NULL,
    ladridos INTEGER NOT NULL,

    CONSTRAINT perro_mamifero_fk FOREIGN KEY (nombre) REFERENCES Mamifero(nombre)
);

CREATE TABLE Gato (
    nombre VARCHAR(255) NOT NULL,
    horas_suenio INTEGER NOT NULL,

    CONSTRAINT gato_mamifero_fk FOREIGN KEY (nombre) REFERENCES Mamifero(nombre)
);
