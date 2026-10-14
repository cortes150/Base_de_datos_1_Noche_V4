create database torneos_db;
use torneos_db;

create table torneo (
    id_torneo int auto_increment primary key,
    nombre varchar(80) not null,
    fecha_inicio date not null,
    fecha_fin date not null,
    costo_inscripcion decimal(10,2) not null,
    duracion_dias int not null
);

create table equipo (
    id_equipo int auto_increment primary key,
    nombre varchar(80) not null,
    correo varchar(80) not null
);

create table telefono_equipo (
    id_telefono INT AUTO_INCREMENT PRIMARY KEY,
    id_equipo INT NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    CONSTRAINT fk_tel_equipo FOREIGN KEY (id_equipo) REFERENCES equipo(id_equipo)
);

create table jugador (
    id_jugador int auto_increment primary key,
    id_equipo int,
    nickname varchar(50) not null,
    nombre_completo varchar(100) not null,
    correo varchar(80) not null,
    edad int not null,
    fecha_nacimiento date not null,
    constraint fk_jugador_equipo foreign key (id_equipo) references equipo(id_equipo)
);

create table telefono_jugador (
    id_telefono int auto_increment primary key,
    id_jugador int not null,
    telefono varchar(20) not null,
    constraint fk_tel_jugador foreign key (id_jugador) references jugador(id_jugador)
);

create table inscripcion (
    id_inscripcion int auto_increment primary key,
    id_torneo int not null,
    id_equipo int not null,
    fecha_inscripcion date not null,
    monto_total decimal(10,2) not null,
    estado varchar(50) not null,
    constraint fk_insc_torneo foreign key (id_torneo) references torneo(id_torneo),
    constraint fk_insc_equipo foreign key (id_equipo) references equipo(id_equipo)
);

create table pago (
    id_pago int auto_increment primary key,
    id_inscripcion int not null,
    fecha_pago date not null,
    monto_pagado decimal(10,2) not null,
    metodo varchar(50) not null,
    saldo_pendiente decimal(10,2) not null,
    constraint fk_pago_inscripcion foreign key (id_inscripcion) references inscripcion(id_inscripcion)
);

create table partido (
    id_partido int auto_increment primary key,
    id_torneo int not null,
    horario time not null,
    fecha date not null,
    resultado varchar(50) not null,
    kills_a int not null,
    kills_b int not null,
    id_equipo_a int not null,
    id_equipo_b int not null,
    constraint fk_partido_torneo foreign key (id_torneo) references torneo(id_torneo),
    constraint fk_partido_eq_a foreign key (id_equipo_a) references equipo(id_equipo),
    constraint fk_partido_eq_b foreign key (id_equipo_b) references equipo(id_equipo)
);

CREATE TABLE notificacion (
    id_notificacion INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    canal VARCHAR(50) NOT NULL,
    fecha_envio DATETIME NOT NULL,
    mensaje TEXT NOT NULL,
    estado VARCHAR(50) NOT NULL,
    CONSTRAINT fk_notif_jugador FOREIGN KEY (id_jugador) REFERENCES jugador(id_jugador)
);