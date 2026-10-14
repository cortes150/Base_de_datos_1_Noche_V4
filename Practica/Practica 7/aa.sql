create database torneo_db;
use torneo_db;

create table torneo (
    id_torneo int auto_increment primary key,
    nombre varchar(50) not null,
    duracion varchar(30),
    fecha_inicio date,
    fecha_final date
);

create table equipo (
    id_equipo int auto_increment primary key,
    nombre varchar(50) not null,
    cantidad_jugadores int
);

create table jugador (
    id_jugador int auto_increment primary key,
    nombre_completo varchar(100),
    edad int,
    correo varchar(50),
    telefono varchar(20),
    id_equipo int,
    constraint fk_jugador_equipo foreign key (id_equipo) references equipo(id_equipo)
);

create table telefono (
    id_telefono int auto_increment primary key,
    numero varchar(20) not null,
    id_equipo int,
    constraint fk_telefono_equipo foreign key (id_equipo) references equipo(id_equipo)
);

create table correo (
    id_correo int auto_increment primary key,
    contrasena varchar(50) not null,
    id_equipo int,
    constraint fk_correo_equipo foreign key (id_equipo) references equipo(id_equipo)
);

create table notificacion (
    id_notificacion int auto_increment primary key,
    tipo varchar(30),
    fecha_envio datetime
);

create table inscripcion (
    id_inscripcion int auto_increment primary key,
    fecha_inscripcion date,
    tipo varchar(30),
    monto_total decimal(10,2),
    id_equipo int,
    id_torneo int,
    constraint fk_inscripcion_equipo foreign key (id_equipo) references equipo(id_equipo),
    constraint fk_inscripcion_torneo foreign key (id_torneo) references torneo(id_torneo)
);

create table pago (
    id_pago int auto_increment primary key,
    monto_pagado decimal(10,2),
    fecha_de_pago date,
    id_equipo int,
    constraint fk_pago_equipo foreign key (id_equipo) references equipo(id_equipo)
);

create table partido (
    id_partido int auto_increment primary key,
    nombre_de_equipo varchar(50),
    resultado varchar(20),
    horario time,
    fecha date,
    hora time,
    id_torneo int,
    constraint fk_partido_torneo foreign key (id_torneo) references torneo(id_torneo)
);