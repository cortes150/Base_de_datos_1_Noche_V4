create database gimnasio2_db;
use gimnasio2_db;

create table socio (
    id_socio int auto_increment primary key,
    nombre varchar(30) not null,
    apellido_paterno varchar(30) not null,
    apellido_materno varchar(30),
    fecha_nacimiento date not null,
    edad int not null,
    calle varchar(30) not null,
    numero varchar(10) not null,
    ciudad varchar(30) not null,
    correo varchar(40) not null,
    telefono int not null
);
create table clase (
    id_clase int auto_increment primary key,
    nombre varchar(30) not null,
    tipo_actividad varchar(30) not null,
    duracion int not null,
    horario varchar(20) not null,
    nivel_dificultad varchar(20) not null
);
create table entrenador (
    id_entrenador int auto_increment primary key,
    nombre varchar(30) not null,
    apellido_paterno varchar(30) not null,
    apellido_materno varchar(30),
    especialidad varchar(30) not null,
    anios_experiencia int not null,
    telefono int not null,
    turno_trabajo varchar(20) not null
);
create table inscripcion (
    id_inscripcion int auto_increment primary key,
    fecha_inscripcion date not null,
    asistencia varchar(20),
    pago float not null,
    
    id_socio int,
    id_clase int,
    id_entrenador int,

    constraint fk_inscripcion_socio 
        foreign key (id_socio) references socio (id_socio),
        
    constraint fk_inscripcion_clase 
        foreign key (id_clase) references clase (id_clase),
        
    constraint fk_inscripcion_entrenador 
        foreign key (id_entrenador) references entrenador (id_entrenador)
);