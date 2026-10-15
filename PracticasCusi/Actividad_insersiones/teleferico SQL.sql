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

insert into linea (nombre_linea, color) values 
('Línea Roja', 'Rojo'),
('Línea Amarilla', 'Amarillo'),
('Línea Verde', 'Verde'),
('Línea Azul', 'Azul'),
('Línea Morada', 'Morado');
select * from linea;

insert into pasajero (nombre_completo, nombre, apellido_p, apellido_m, correo, telefono) values 
('Juan Pérez Gómez', 'Juan', 'Pérez', 'Gómez', 'juan.perez@gmail.com', '70123456'),
('María Mamani Rojas', 'María', 'Mamani', 'Rojas', 'maria.mamani@gmail.com', '71234567'),
('Carlos Quispe Condori', 'Carlos', 'Quispe', 'Condori', 'carlos.q@gmail.com', '72345678'),
('Ana Limachi Ticona', 'Ana', 'Limachi', 'Ticona', 'ana.limachi@gmail.com', '73456789'),
('Luis Vargas Choque', 'Luis', 'Vargas', 'Choque', 'luis.vargas@gmail.com', '74567890');
select * from pasajero;

insert into estacion (nombre_estacion, ubicacion, id_linea) values 
('Estación 16 de Julio', 'El Alto', 1),
('Estación Cementerio', 'La Paz', 1),
('Estación Sopocachi', 'La Paz', 2),
('Estación San Jorge', 'La Paz', 3),
('Estación 6 de Marzo', 'El Alto', 4);
select * from estacion;

insert into cabina (capacidad, estado, id_linea) values 
(10, 'Operativo', 1),
(10, 'Operativo', 1),
(8, 'En revisión', 2),
(10, 'Operativo', 3),
(8, 'Operativo', 4);
select * from cabina; 

insert into tarjeta (saldo, fecha_emision, id_pasajero) values 
(50.00, '2026-01-10', 1),
(25.50, '2026-02-15', 2),
(100.00, '2026-03-01', 3),
(10.00, '2026-03-10', 4),
(75.20, '2026-04-05', 5);
select * from tarjeta;

insert into recarga (monto, fecha_recarga, id_tarjeta) values 
(30.00, '2026-04-10', 1),
(20.00, '2026-04-11', 2),
(50.00, '2026-04-12', 3),
(15.00, '2026-04-13', 4),
(40.00, '2026-04-14', 5);
select * from recarga;

insert into ingreso (fecha_hora, id_tarjeta, id_estacion) values 
('2026-04-15', 1, 1),
('2026-04-15', 2, 2),
('2026-04-15', 3, 3),
('2026-04-15', 4, 4),
('2026-04-15', 5, 5);
select * from ingreso;

insert into viaje (fecha, hora, id_cabina) values 
('2026-04-15', '08:30:00', 1),
('2026-04-15', '09:00:00', 2),
('2026-04-15', '09:30:00', 3),
('2026-04-15', '10:00:00', 4),
('2026-04-15', '10:30:00', 5);
select * from viaje;

insert into mantenimiento (fecha_mantenimiento, tipo_mantenimiento, descripcion, id_cabina) values 
('2026-03-10', 'Preventivo', 'Revisión general del sistema eléctrico y sensores', 1),
('2026-03-15', 'Correctivo', 'Cambio de polea principal por desgaste', 2),
('2026-03-20', 'Preventivo', 'Lubricación de cables y pruebas de freno de emergencia', 3),
('2026-03-25', 'Correctivo', 'Reparación de puerta automática de cabina', 4),
('2026-04-01', 'Preventivo', 'Inspección trimestral de rutina y limpieza general', 5);
select * from mantenimiento;