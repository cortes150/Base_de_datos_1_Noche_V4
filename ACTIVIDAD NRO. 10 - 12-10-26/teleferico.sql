create database teleferico_db;
use teleferico_db;

create table linea (
    id_linea int auto_increment primary key,
    nombre varchar(30) not null,
    color varchar(30) not null
);
create table pasajero (
    id_pasajero int auto_increment primary key,
    nombre varchar(30) not null,
    apellido varchar(30) not null,
    ci int not null,
    telefono int
);
create table estacion (
    id_estacion int auto_increment primary key,
    nombre varchar(40) not null,
    id_linea int,

    constraint fk_estacion_linea 
        foreign key (id_linea) references linea (id_linea)
);

create table cabina (
    id_cabina int auto_increment primary key,
    numero_cabina int not null,
    capacidad int not null,
    estado varchar(20),
    id_linea int,

    constraint fk_cabina_linea 
        foreign key (id_linea) references linea (id_linea)
);

create table tarjeta (
    id_tarjeta int auto_increment primary key,
    codigo_tarjeta varchar(30) not null,
    saldo float not null,
    tipo varchar(20) not null,
    id_pasajero int,

    constraint fk_tarjeta_pasajero 
        foreign key (id_pasajero) references pasajero (id_pasajero)
);

create table mantenimiento (
    id_mantenimiento int auto_increment primary key,
    fecha date not null,
    tipo varchar(30) not null,
    descripcion varchar(100),
    id_cabina int,

    constraint fk_mantenimiento_cabina 
        foreign key (id_cabina) references cabina (id_cabina)
);
create table viaje (
    id_viaje int auto_increment primary key,
    fecha date not null,
    hora varchar(20) not null,
    id_cabina int,

    constraint fk_viaje_cabina 
        foreign key (id_cabina) references cabina (id_cabina)
);
create table recarga (
    id_recarga int auto_increment primary key,
    fecha date not null,
    monto float not null,
    id_tarjeta int,

    constraint fk_recarga_tarjeta 
        foreign key (id_tarjeta) references tarjeta (id_tarjeta)
);
create table ingreso (
    id_ingreso int auto_increment primary key,
    fecha date not null,
    hora varchar(20) not null,
    id_tarjeta int,
    id_estacion int,

    constraint fk_ingreso_tarjeta 
        foreign key (id_tarjeta) references tarjeta (id_tarjeta),

    constraint fk_ingreso_estacion 
        foreign key (id_estacion) references estacion (id_estacion)
);