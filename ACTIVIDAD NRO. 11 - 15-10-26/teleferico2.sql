create database teleferico_db;
use teleferico_db;

create table linea (
    id_linea int auto_increment primary key,
    nombre varchar(30) not null,
    color varchar(30) not null
);
INSERT INTO linea (nombre, color) VALUES
('Línea Roja', 'Rojo'),
('Línea Amarilla', 'Amarillo'),
('Línea Verde', 'Verde'),
('Línea Azul', 'Azul'),
('Línea Plateada', 'Plateado');

create table pasajero (
    id_pasajero int auto_increment primary key,
    nombre varchar(30) not null,
    apellido varchar(30) not null,
    ci int not null,
    telefono int
);

INSERT INTO pasajero (nombre, apellido, ci, telefono) VALUES
('Carlos', 'Mamani', 6842109, 71523489),
('Mariana', 'Condori', 5920147, 72091433),
('Rodrigo', 'Quispe', 8401923, 76541290),
('Elena', 'Flores', 4910283, 73048122),
('Alejandro', 'Vargas', 9182374, 78912304);


create table estacion (
    id_estacion int auto_increment primary key,
    nombre varchar(40) not null,
    id_linea int,

    constraint fk_estacion_linea 
        foreign key (id_linea) references linea (id_linea)
);

INSERT INTO estacion (nombre, id_linea) VALUES
('Estación Central', 1),
('Estación Cementerio', 1),
('Estación Buenos Aires', 2),
('Estación Mirador', 2),
('Estación Irpavi', 3);

create table cabina (
    id_cabina int auto_increment primary key,
    numero_cabina int not null,
    capacidad int not null,
    estado varchar(20),
    id_linea int,

    constraint fk_cabina_linea 
        foreign key (id_linea) references linea (id_linea)
);

INSERT INTO cabina (numero_cabina, capacidad, estado, id_linea) VALUES
(101, 10, 'Operativa', 1),
(102, 10, 'Operativa', 1),
(205, 10, 'En mantenimiento', 2),
(310, 10, 'Operativa', 3),
(415, 10, 'Operativa', 4);

create table tarjeta (
    id_tarjeta int auto_increment primary key,
    codigo_tarjeta varchar(30) not null,
    saldo float not null,
    tipo varchar(20) not null,
    id_pasajero int,

    constraint fk_tarjeta_pasajero 
        foreign key (id_pasajero) references pasajero (id_pasajero)
);

INSERT INTO tarjeta (codigo_tarjeta, saldo, tipo, id_pasajero) VALUES
('TC-849201', 35.50, 'Regular', 1),
('TC-592018', 12.00, 'Estudiante', 2),
('TC-103948', 50.00, 'Regular', 3),
('TC-772910', 5.50, 'Tercera Edad', 4),
('TC-384912', 20.00, 'Preferencial', 5);

create table mantenimiento (
    id_mantenimiento int auto_increment primary key,
    fecha date not null,
    tipo varchar(30) not null,
    descripcion varchar(100),
    id_cabina int,

    constraint fk_mantenimiento_cabina 
        foreign key (id_cabina) references cabina (id_cabina)
);

INSERT INTO mantenimiento (fecha, tipo, descripcion, id_cabina) VALUES
('2026-09-10', 'Preventivo', 'Revisión periódica de mordazas y suspensión', 1),
('2026-09-15', 'Correctivo', 'Ajuste en sensor de cierre de puertas', 3),
('2026-09-22', 'Preventivo', 'Lubricación de componentes de rodaje', 2),
('2026-10-01', 'Preventivo', 'Inspección de rodillos y alineación de cable', 4),
('2026-10-10', 'Inspección', 'Prueba de frenos y cable guía', 5);

create table viaje (
    id_viaje int auto_increment primary key,
    fecha date not null,
    hora varchar(20) not null,
    id_cabina int,

    constraint fk_viaje_cabina 
        foreign key (id_cabina) references cabina (id_cabina)
);

INSERT INTO viaje (fecha, hora, id_cabina) VALUES
('2026-10-14', '07:30', 1),
('2026-10-14', '08:15', 2),
('2026-10-14', '12:45', 4),
('2026-10-15', '18:20', 5),
('2026-10-15', '19:10', 1);

create table recarga (
    id_recarga int auto_increment primary key,
    fecha date not null,
    monto float not null,
    id_tarjeta int,

    constraint fk_recarga_tarjeta 
        foreign key (id_tarjeta) references tarjeta (id_tarjeta)
);

INSERT INTO recarga (fecha, monto, id_tarjeta) VALUES
('2026-10-12', 20.00, 1),
('2026-10-13', 10.00, 2),
('2026-10-14', 50.00, 3),
('2026-10-14', 15.00, 4),
('2026-10-15', 30.00, 5);

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

INSERT INTO ingreso (fecha, hora, id_tarjeta, id_estacion) VALUES
('2026-10-15', '07:25', 1, 1),
('2026-10-15', '08:10', 2, 2),
('2026-10-15', '12:40', 3, 3),
('2026-10-15', '17:55', 4, 4),
('2026-10-15', '18:30', 5, 5);


SHOW TABLES;