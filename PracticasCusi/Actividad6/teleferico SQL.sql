drop database teleferico_db;
create database teleferico_db;
use teleferico_db;

create table linea (
    id_linea int auto_increment primary key ,
    nombre_linea varchar(50) not null,
    color varchar(50) not null
);

create table estacion (
    id_estacion int auto_increment primary key,
    nombre_estacion varchar(50) not null,
    ubicacion varchar(50),
    id_linea int not null,
    constraint fk_estacion_linea foreign key (id_linea) 
        references linea(id_linea) on delete cascade on update cascade
);

create table cabina (
    id_cabina int auto_increment primary key,
    capacidad int not null,
    estado varchar(50) not null, 
    id_linea int not null,
    constraint fk_cabina_linea foreign key (id_linea) 
        references linea(id_linea) on delete cascade on update cascade
);

create table viaje (
    id_viaje int auto_increment primary key,
    fecha date not null,
    hora time not null,
    id_cabina int not null,
    constraint fk_viaje_cabina foreign key (id_cabina) 
        references cabina(id_cabina) on delete cascade on update cascade
);

create table  pasajero (
    id_pasajero int auto_increment primary key,
    nombre_completo varchar(50) not null,
    nombre varchar(50) not null,
    apellido_p varchar(50) not null,
    apellido_m varchar(50),
    correo varchar(50),
    telefono varchar(50)
);

create table tarjeta (
    id_tarjeta int auto_increment primary key,
    saldo decimal(10,2) not null,
    fecha_emision date not null,
    id_pasajero int not null,
    constraint fk_tarjeta_pasajero foreign key (id_pasajero) 
        references pasajero(id_pasajero) on delete cascade on update cascade
);

create table recarga (
    id_recarga int auto_increment primary key,
    monto decimal(10,2) not null,
    fecha_recarga date not null,
    id_tarjeta int not null,
    constraint fk_recarga_tarjeta foreign key (id_tarjeta) 
        references tarjeta(id_tarjeta) on delete cascade on update cascade
);

create table ingreso (
    id_ingreso int auto_increment primary key,
    fecha_hora date not null,
    id_tarjeta int not null,
    id_estacion int not null,
    constraint fk_ingreso_tarjeta foreign key (id_tarjeta) 
        references tarjeta(id_tarjeta) on delete cascade on update cascade,
    constraint fk_ingreso_estacion foreign key (id_estacion) 
        references estacion(id_estacion) on delete cascade on update cascade
);

create table mantenimiento (
    id_mantenimiento int auto_increment primary key,
    fecha_mantenimiento date not null,
    tipo_mantenimiento varchar(50) not null,
    descripcion text,
    id_cabina int not null,
    constraint fk_mantenimiento_cabina foreign key (id_cabina) 
        references cabina(id_cabina) on delete cascade on update cascade
);