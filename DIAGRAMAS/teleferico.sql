create database teleferico_db;
use teleferico_db;

create table linea (
    id_linea int auto_increment primary key,
    nombre_de_linea varchar(80) not null
);

create table estacion (
    id_estacion int auto_increment primary key,
    id_linea int not null,
    nombre_de_estacion varchar(80) not null,
    ubicacion varchar(100) not null,
    constraint fk_estacion_linea foreign key (id_linea) references linea(id_linea)
);

create table cabina (
    id_cabina int auto_increment primary key,
    id_linea int not null,
    numero_de_cabina int not null,
    estado varchar(50) not null,
    constraint fk_cabina_linea foreign key (id_linea) references linea(id_linea)
);

create table mantenimiento (
    id_mantenimiento int auto_increment primary key,
    id_cabina int not null,
    observacion text not null,
    fecha_de_mantenimiento date not null,
    tipo_de_mantenimiento varchar(80) not null,
    constraint fk_mantenimiento_cabina foreign key (id_cabina) references cabina(id_cabina)
);

create table pasajero (
    id_pasajero int auto_increment primary key,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    datos_contacto varchar(100) not null
);

create table tarjeta (
    id_tarjeta int auto_increment primary key,
    id_pasajero int not null,
    saldo decimal(10,2) not null,
    constraint fk_tarjeta_pasajero foreign key (id_pasajero) references pasajero(id_pasajero)
);

-- 7. Recarga (conectada a tarjeta)
CREATE TABLE recarga (
    id_recarga INT AUTO_INCREMENT PRIMARY KEY,
    id_tarjeta INT NOT NULL,
    saldo_anterior DECIMAL(10,2) NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    saldo_nuevo DECIMAL(10,2) NOT NULL,
    fecha_de_recarga DATETIME NOT NULL,
    CONSTRAINT fk_recarga_tarjeta FOREIGN KEY (id_tarjeta) REFERENCES tarjeta(id_tarjeta)
);

-- 8. Viaje (conectado a cabina)
CREATE TABLE viaje (
    id_viaje INT AUTO_INCREMENT PRIMARY KEY,
    id_cabina INT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    CONSTRAINT fk_viaje_cabina FOREIGN KEY (id_cabina) REFERENCES cabina(id_cabina)
);

-- 9. Registro de Ingreso (conecta tarjeta, estacion y viaje)
CREATE TABLE registro_ingreso (
    id_ingreso INT AUTO_INCREMENT PRIMARY KEY,
    id_tarjeta INT NOT NULL,
    id_estacion INT NOT NULL,
    id_viaje INT NOT NULL,
    CONSTRAINT fk_reg_tarjeta FOREIGN KEY (id_tarjeta) REFERENCES tarjeta(id_tarjeta),
    CONSTRAINT fk_reg_estacion FOREIGN KEY (id_estacion) REFERENCES estacion(id_estacion),
    CONSTRAINT fk_reg_viaje FOREIGN KEY (id_viaje) REFERENCES viaje(id_viaje)
);