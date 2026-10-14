create database eventos_db;
use eventos_db;

create table usuario (
    id_usuario int auto_increment primary key,
    nombre varchar(80) not null,
    tipo_usuario varchar(50) not null,
    datos_contacto varchar(100) not null
);

create table evento (
    id_evento int auto_increment primary key,
    aforo int not null,
    lugar varchar(100) not null,
    hora time not null,
    fecha date not null
);

create table  tipo_entrada (
    id_tipo_entrada int auto_increment primary key,
    id_evento int not null,
    precio decimal(10,2) not null,
    constraint fk_tipo_entrada_evento foreign key (id_evento) references evento(id_evento)
);

create table asistencia_evento (
    id_asistencia int auto_increment primary key,
    id_evento int not null,
    id_usuario int not null,
    estado_asistencia varchar(50) not null,
    fecha_asistencia date not null,
    constraint fk_asist_evento foreign key  (id_evento) references evento(id_evento),
	constraint fk_asist_usuario foreign key (id_usuario) references usuario(id_usuario)
);

CREATE TABLE entrada (
    id_entrada INT AUTO_INCREMENT PRIMARY KEY,
    id_tipo_entrada INT NOT NULL,
    codigo_qr VARCHAR(255) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    modalidad VARCHAR(50) NOT NULL,
    CONSTRAINT fk_entrada_tipo FOREIGN KEY (id_tipo_entrada) REFERENCES tipo_entrada(id_tipo_entrada)
);

CREATE TABLE compra (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_tipo_entrada INT NOT NULL,
    CONSTRAINT fk_compra_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    CONSTRAINT fk_compra_tipo_entrada FOREIGN KEY (id_tipo_entrada) REFERENCES tipo_entrada(id_tipo_entrada)
);

CREATE TABLE pago (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_compra INT NOT NULL,
    fecha_de_pago DATE NOT NULL,
    monto_pagado DECIMAL(10,2) NOT NULL,
    saldo_pendiente DECIMAL(10,2) NOT NULL,
    tipo_pago VARCHAR(50) NOT NULL,
    CONSTRAINT fk_pago_compra FOREIGN KEY (id_compra) REFERENCES compra(id_compra)
);