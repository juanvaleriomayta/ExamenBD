-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2018-06-30 15:16:47.776

-- tables
-- Table: AuxiliaresATSZ
CREATE TABLE AuxiliaresATSZ (
    idATZ char(6)  ,
    nombreATZ varchar(100)  ,
    direccionATZ varchar(100)  ,
    telefonoATZ char(7)  ,
    distritoATZ varchar(100)  ,
    provinciaATZ varchar(100)  ,
    DNI char(8)  ,
    numeroSS char(12)  ,
    Horarios_idHorario int  ,
    CONSTRAINT AuxiliaresATSZ_pk PRIMARY KEY  (idATZ)
);

-- Table: AuxiliaresTS
CREATE TABLE AuxiliaresTS (
    idATS char(6)  ,
    nombreATS varchar(100)  ,
    direccionATS varchar(100)  ,
    telefonoATS char(7)  ,
    distritoATS varchar(100)  ,
    provinciaATS varchar(100)  ,
    DNI char(8)  ,
    numeroSS char(12)  ,
    Horarios_idHorario int  ,
    CONSTRAINT AuxiliaresTS_pk PRIMARY KEY  (idATS)
);

-- Table: Celadores
CREATE TABLE Celadores (
    idCeladores char(4)  ,
    nombreC varchar(100)  ,
    direccionC varchar(100)  ,
    telefonoC char(7)  ,
    distritoC varchar(100)  ,
    provinciaC varchar(100)  ,
    DNI char(8)  ,
    numeroSS char(12)  ,
    Horarios_idHorario int  ,
    CONSTRAINT Celadores_pk PRIMARY KEY  (idCeladores)
);

-- Table: Horarios
CREATE TABLE Horarios (
    idHorario int identity(1,1) ,
    consultaH time(08)  ,
    diaH date  ,
    vacacionesH date  ,
    CONSTRAINT Horarios_pk PRIMARY KEY  (idHorario)
);

-- Table: Medicos
CREATE TABLE Medicos (
    idMedico char(4)  ,
    nombreM varchar(100)  ,
    direccionM varchar(100)  ,
    telefonoM char(7)  ,
    distritoM varchar(100)  ,
    provinciaM varchar(100)  ,
    DNI char(8)  ,
    numeroSS char(12)  ,
    numeroC char(4)  ,
    tipoM varchar(100)  ,
    Horarios_idHorario int  ,
    AuxiliaresTS_idATS char(6)  ,
    Pacientes_idPaciente char(4)  ,
    Celadores_idCeladores char(4)  ,
    AuxiliaresATSZ_idATZ char(6)  ,
    CONSTRAINT Medicos_pk PRIMARY KEY  (idMedico)
);

-- Table: Pacientes
CREATE TABLE Pacientes (
    idPaciente char(4)  ,
    nombreP varchar(100)  ,
    apellidoP varchar(100)  ,
    direccionP varchar(100)  ,
    telefonoP char(7)  ,
    DNI char(8)  ,
    numeroSSP char(12)  ,
    Horarios_idHorario int  ,
    CONSTRAINT Pacientes_pk PRIMARY KEY  (idPaciente)
);

-- foreign keys
-- Reference: AuxiliaresATSZ_Horarios (table: AuxiliaresATSZ)
ALTER TABLE AuxiliaresATSZ ADD CONSTRAINT AuxiliaresATSZ_Horarios
    FOREIGN KEY (Horarios_idHorario)
    REFERENCES Horarios (idHorario);

-- Reference: AuxiliaresTS_Horarios (table: AuxiliaresTS)
ALTER TABLE AuxiliaresTS ADD CONSTRAINT AuxiliaresTS_Horarios
    FOREIGN KEY (Horarios_idHorario)
    REFERENCES Horarios (idHorario);

-- Reference: Celadores_Horarios (table: Celadores)
ALTER TABLE Celadores ADD CONSTRAINT Celadores_Horarios
    FOREIGN KEY (Horarios_idHorario)
    REFERENCES Horarios (idHorario);

-- Reference: Medicos_AuxiliaresATSZ (table: Medicos)
ALTER TABLE Medicos ADD CONSTRAINT Medicos_AuxiliaresATSZ
    FOREIGN KEY (AuxiliaresATSZ_idATZ)
    REFERENCES AuxiliaresATSZ (idATZ);

-- Reference: Medicos_AuxiliaresTS (table: Medicos)
ALTER TABLE Medicos ADD CONSTRAINT Medicos_AuxiliaresTS
    FOREIGN KEY (AuxiliaresTS_idATS)
    REFERENCES AuxiliaresTS (idATS);

-- Reference: Medicos_Celadores (table: Medicos)
ALTER TABLE Medicos ADD CONSTRAINT Medicos_Celadores
    FOREIGN KEY (Celadores_idCeladores)
    REFERENCES Celadores (idCeladores);

-- Reference: Medicos_Horarios (table: Medicos)
ALTER TABLE Medicos ADD CONSTRAINT Medicos_Horarios
    FOREIGN KEY (Horarios_idHorario)
    REFERENCES Horarios (idHorario);

-- Reference: Medicos_Pacientes (table: Medicos)
ALTER TABLE Medicos ADD CONSTRAINT Medicos_Pacientes
    FOREIGN KEY (Pacientes_idPaciente)
    REFERENCES Pacientes (idPaciente);

-- Reference: Pacientes_Horarios (table: Pacientes)
ALTER TABLE Pacientes ADD CONSTRAINT Pacientes_Horarios
    FOREIGN KEY (Horarios_idHorario)
    REFERENCES Horarios (idHorario);

-- End of file.

