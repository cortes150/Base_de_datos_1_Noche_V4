create database juego_torneo_db;
use juego_torneo_db;

create table torneo (
    id_torneo int auto_increment primary key,
    nombre varchar(40) not null,
    juego varchar(30) not null,
    fecha_inicio date not null,
    fecha_fin date not null,
    costo_inscripcion float not null
);
create table equipo (
    id_equipo int auto_increment primary key,
    nombre varchar(30) not null,
    capitan varchar(30)
);
create table jugador (
    id_jugador int auto_increment primary key,
    nombre varchar(30) not null,
    apellidos varchar(30) not null,
    nickname varchar(30) not null,
    correo varchar(40) not null,
    telefono int not null,
    id_equipo int,

    constraint fk_jugador_equipo 
        foreign key (id_equipo) references equipo (id_equipo)
);
create table inscripcion (
    id_inscripcion int auto_increment primary key,
    fecha_inscripcion date not null,
    monto_total float not null,
    monto_pagado float not null,
    saldo_pendiente float not null,
    estado_pago varchar(20) not null,
    id_torneo int,
    id_equipo int,

    constraint fk_inscripcion_torneo 
        foreign key (id_torneo) references torneo (id_torneo),

    constraint fk_inscripcion_equipo 
        foreign key (id_equipo) references equipo (id_equipo)
);
create table partido (
    id_partido int auto_increment primary key,
    fecha date not null,
    hora varchar(20) not null,
    prioridad varchar(30) not null,
    kills_equipo_a int not null default 0,
    kills_equipo_b int not null default 0,
    resultado varchar(30),
    id_torneo int,
    id_equipo_a int,
    id_equipo_b int,

    constraint fk_partido_torneo 
        foreign key (id_torneo) references torneo (id_torneo),

    constraint fk_partido_equipo_a 
        foreign key (id_equipo_a) references equipo (id_equipo),

    constraint fk_partido_equipo_b 
        foreign key (id_equipo_b) references equipo (id_equipo)
);
create table recordatorio (
    id_recordatorio int auto_increment primary key,
    mensaje varchar(100) not null,
    fecha_envio date not null,
    canal varchar(20) not null,
    id_partido int,
    id_equipo int,

    constraint fk_recordatorio_partido 
        foreign key (id_partido) references partido (id_partido),

    constraint fk_recordatorio_equipo 
        foreign key (id_equipo) references equipo (id_equipo)
);