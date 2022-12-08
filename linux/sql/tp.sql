CREATE TABLE Compania (
    id_compania INTEGER NOT NULL,
    nombre VARCHAR(40) NOT NULL,

    CONSTRAINT id_compania_pk PRIMARY KEY (id_compania)
);

CREATE TABLE Paciente (
    id_paciente INTEGER,
    nombre VARCHAR(40) NOT NULL,
    f_nac DATE NOT NULL,
    direccion VARCHAR(40),
    id_compania INTEGER,

    CONSTRAINT id_paciente_pk PRIMARY KEY (id_paciente),
    CONSTRAINT id_compania_fk FOREIGN KEY (id_compania) REFERENCES Compania(id_compania)
);

CREATE TABLE Doctor (
    num_lic INTEGER NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    f_ejercio DATE NOT NULL,
    especializacion VARCHAR(40),

    CONSTRAINT num_lic_pk PRIMARY KEY (num_lic)
);

CREATE TABLE Visita (
    id_visita INTEGER NOT NULL,
    f_visita DATE NOT NULL,
    diagnostico VARCHAR(40) NOT NULL,
    id_paciente INTEGER NOT NULL,
    id_doctor INTEGER NOT NULL,

    CONSTRAINT id_visita_pk PRIMARY KEY (id_visita),
    CONSTRAINT id_paciente_fk FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    CONSTRAINT id_doctor_fk FOREIGN KEY (id_doctor) REFERENCES Doctor(num_lic)
);