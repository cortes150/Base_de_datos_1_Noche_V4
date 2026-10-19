create database UniProjects;
use UniProjects;

create table Estudiante (
    id_estudiante int auto_increment primary key,
    nombre varchar(80) not null,
    apellido varchar(80) not null,
    correo varchar(120) not null,
    alter table estudiante add nuevo_estudiante varchar (100) not null
);
/* agrega una restriccion chekk llamada select * from selecciono los todos*/
/*una insercion llenar datos a la tabla evalucacion 
a cada tabla 5 inserciones 
una insercion en evaluacion */
CREATE TABLE Materia (
    id_materia INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Proyecto (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    tema VARCHAR(150) NOT NULL,
    categoria VARCHAR(80),
    fecha_presentacion DATE,
    id_materia INT NOT NULL,
    FOREIGN KEY (id_materia)
        REFERENCES Materia(id_materia)
        alter table Jurado add categoria varchar (50) not null,
);

CREATE TABLE Jurado (
    id_jurado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    alter table Jurado drop especialidad varchar(50) not null,
    alter table Jurado add categoria varchar (50) not null,
);

CREATE TABLE Participacion (
    id_participacion INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT NOT NULL,
    id_proyecto INT NOT NULL,
    rol VARCHAR(60),
    fecha_ingreso DATE,
    UNIQUE (id_estudiante, id_proyecto),
    FOREIGN KEY (id_estudiante)
        REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_proyecto)
        REFERENCES Proyecto(id_proyecto)
);

CREATE TABLE Evaluacion (
    id_evaluacion INT AUTO_INCREMENT PRIMARY KEY,
    id_jurado INT NOT NULL,
    id_proyecto INT NOT NULL,
    criterio VARCHAR(150) NOT NULL,
    puntaje DECIMAL(6,2) NOT NULL,
    observaciones TEXT,
    calificacion_final DECIMAL(6,2),
    FOREIGN KEY (id_jurado) REFERENCES Jurado(id_jurado),
	FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id_proyecto),
    constraint fk_evaluacion_criterio foreign key (id_criterio) references criterio(id_criterio),
    constraint fk_evaluacion_puntaje foreign key (id_puntaje) references puntaje(id_puntaje),
    constraint fk_evaluacion_observaciones foreign key (id_observaciones) references obaservaciones(id_observaciones)
);

