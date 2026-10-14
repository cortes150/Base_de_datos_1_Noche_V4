drop database gamearena_db;
create database gamearena_db;
use gamearena_db;

create table torneo (
    id_torneo int auto_increment primary key,
    nombre varchar(50) not null,
    duracion varchar(50) not null,
    fecha_inicio date not null,
    fecha_final date not null
);

create table equipo (
    id_equipo int auto_increment primary key,
    nombre varchar(50) not null,
    cantidad_jugadores int not null
);

create table telefono (
    id_telefono int auto_increment primary key,
    numero varchar(50) not null,
    id_equipo int not null,
    constraint fk_telefono_equipo foreign key (id_equipo) 
        references equipo(id_equipo) on delete cascade on update cascade
);

create table correo (
    id_correo int auto_increment primary key,
    contrasena varchar(50) not null,
    id_equipo int not null,
    constraint fk_correo_equipo foreign key (id_equipo) 
        references equipo(id_equipo) on delete cascade on update cascade
);

create table jugador (
    id_jugador int auto_increment primary key,
    nombre_completo varchar(50) not null,
    nombre varchar(50) not null,
    apellido_p varchar(50) not null,
    apellido_m varchar(50),
    edad int not null,
    correo varchar(50),
    telefono varchar(50)
);

create table notificacion (
    id_notificacion int auto_increment primary key,
    tipo varchar(50) not null, 
    fecha_envio date not null
);

create table inscripcion (
    id_inscripcion int auto_increment primary key,
    fecha_inscripcion date not null,
    tipo varchar(50) not null,
    monto_total decimal(10,2) not null
);

create table pago (
    id_pago int auto_increment primary key,
    monto_pagado decimal(10,2) not null,
    fecha_de_pago date not null,
    id_equipo int not null,
    constraint fk_pago_equipo foreign key (id_equipo) 
        references equipo(id_equipo) on delete cascade on update cascade
);

create table partido (
    id_partido int auto_increment primary key,
    nombre_de_equipo varchar(50) not null,
    resultado varchar(50) not null, 
    horario varchar(50) not null,
    fecha date not null,
    hora time not null,
    id_torneo int not null,
    constraint fk_partido_torneo foreign key (id_torneo) 
        references torneo(id_torneo) on delete cascade on update cascade
);