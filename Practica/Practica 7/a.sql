create database transporte_db;
use transporte_db;

create table linea (
    id_linea int auto_increment primary key,
    nombre varchar(50) not null,
    color varchar(30)
);

create table estacion (
    id_estacion int auto_increment primary key,
    nombre varchar(50) not null,
    latitud float,
    altitud float,
    id_linea int,
    constraint fk_estacion_linea foreign key (id_linea) references linea(id_linea)
);

create table cabina (
    id_cabina int auto_increment primary key,
    capacidad int,
    id_linea int,
    constraint fk_cabina_linea foreign key (id_linea) references linea(id_linea)
);

create table pasajero (
    id_pasajero int auto_increment primary key,
    nombre_completo varchar(100),
    telefono varchar(20)
);

create table tarjeta (
    id_tarjeta int auto_increment primary key,
    tipo_de_tarjeta varchar(30),
    id_pasajero int,
    constraint fk_tarjeta_pasajero foreign key (id_pasajero) references pasajero(id_pasajero)
);

create table viaje (
    id_viaje int auto_increment primary key,
    fecha date,
    hora time,
    id_cabina int,
    id_pasajero int,
    constraint fk_viaje_cabina foreign key (id_cabina) references cabina(id_cabina),
    constraint fk_viaje_pasajero foreign key (id_pasajero) references pasajero(id_pasajero)
);

create table recarga (
    id_recarga int auto_increment primary key,
    monto decimal(10,2),
    saldo_anterior decimal(10,2),
    fecha datetime,
    id_tarjeta int,
    constraint fk_recarga_tarjeta foreign key (id_tarjeta) references tarjeta(id_tarjeta)
);