drop database unifest_db;
create database unifest_db;
use unifest_db;

create table evento (
    id_evento int auto_increment primary key,
    nombre_evento varchar(100) not null,
    fecha date not null,
    hora time not null,
    lugar varchar(100) not null,
    aforo_maximo int not null
);

create table asistente (
    id_asistente int auto_increment primary key,
    nombre_completo varchar(70) not null,
    nombre varchar(50) not null,
    apellido_p varchar(50) not null,
    apellido_m varchar(50),
    tipo_usuario varchar(50) not null,
    correo varchar(100) not null,
    telefono varchar(50)
);

create table tipo_entrada (
    id_tipo_entrada int auto_increment primary key,
    nombre_tipo varchar(50) not null,
    precio decimal(10,2) not null,
    descripcion text,
    id_evento int not null,
    constraint fk_tipoentrada_evento foreign key (id_evento) 
        references evento(id_evento) on delete CASCADE on update cascade
);

create table entrada (
    id_entrada int auto_increment primary key,
    tipo_emision varchar(50) not null, 
    estado_pago varchar(50) not null, 
    monto_total decimal(10,2) not null,
    saldo_pendiente decimal(10,2) not null,
    id_asistente int not null,
    id_tipo_entrada int not null,
    constraint fk_entrada_asistente foreign key (id_asistente) 
        references asistente(id_asistente) on delete cascade on update cascade,
    constraint fk_entrada_tipo foreign key (id_tipo_entrada) 
        references tipo_entrada(id_tipo_entrada) on delete cascade on update cascade
);

create table pago (
    id_pago int auto_increment primary key,
    monto_pagado decimal(10,2) not null,
    fecha_pago date not null,
    id_entrada int not null,
    constraint fk_pago_entrada foreign key (id_entrada) 
        references entrada(id_entrada) on delete cascade on update cascade
);

create table asistencia (
    id_asistencia int auto_increment primary key,
    fecha_registro date not null,
    estado_asistencia varchar(50) not null, 
    id_evento int not null,
    id_asistente int not null,
    constraint fk_asistencia_evento foreign key (id_evento) 
        references evento(id_evento) on delete cascade on update cascade,
    constraint fk_asistencia_asistente foreign key (id_asistente) 
        references asistente(id_asistente) on delete cascade on update cascade	
);

create table notificacion (
    id_notificacion int auto_increment primary key,
    tipo varchar(50) not null, 
    mensaje text not null,
    fecha_envio date not null,
    id_evento int not null,
    id_asistente int not null,
    constraint fk_notificacion_evento foreign key (id_evento) 
        references evento(id_evento) on delete cascade on update cascade,
    constraint fk_notificacion_asistente foreign key (id_asistente) 
        references asistente(id_asistente) on delete cascade on update cascade
);