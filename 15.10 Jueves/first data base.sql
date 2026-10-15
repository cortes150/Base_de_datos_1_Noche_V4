create database cocacola_db;
use cocacola_db;

create table categoria (
    id_categoria int auto_increment primary key,
    nombre_categoria varchar(50) not null,
    estado boolean not null 

);
create table planta_produccion (
    id_planta_produccion int auto_increment primary key,
    nombre varchar(80) not null,
    latitud float not null,
    longitud float not null
);

create table ciudad (
    id_ciudad int auto_increment primary key,
    id_planta_produccion int,
    nombre varchar(80) not null,
    constraint fk_ciudad_planta foreign key (id_planta_produccion) references planta_produccion(id_planta_produccion)
);

create table producto (
    id_producto int auto_increment primary key,
    nombre varchar(80) not null,
    precio decimal(10,2) not null,
    caducidad int not null,
    id_categoria int not null,
    constraint fk_producto_categoria foreign key (id_categoria) references categoria(id_categoria)
);

CREATE TABLE inventario (
    id_inventario int auto_increment primary key,
    stock int not null,
    id_producto int,
    constraint fk_inventario_producto foreign key (id_producto) references producto(id_producto)
);

create table usuario (
    id_usuario int auto_increment primary key,
    id_planta_produccion int,
    nombre varchar(80) not null,
    rol varchar(80) not null,
    correo varchar(80) not null,
    constraint fk_usuario_planta foreign key (id_planta_produccion) references planta_produccion(id_planta_produccion)
);

create table distribuidor (
    id_distribuidor int auto_increment primary key, 	
    nombre varchar(80) not null,
    correo varchar(80) not null,
    telefono int not null
);

create table ruta (
    id_ruta int auto_increment primary key,
    id_distribuidor int,
    nombre varchar(80) not null,
    distancia varchar(50) not null,
    dest_inicio varchar(100) not null,
    dest_final varchar(100) not null,
    constraint fk_ruta_distribuidor foreign key (id_distribuidor) references distribuidor(id_distribuidor)
);

create table pedido (
    id_pedido int auto_increment primary key,
    nombre varchar(50) not null,
    num_pedido int not null,
    id_categoria int,
    id_distribuidor int,
    constraint fk_pedido_categoria foreign key (id_categoria) references categoria(id_categoria),
    constraint fk_pedido_distribuidor foreign key(id_distribuidor) references distribuidor(id_distribuidor)
);

create table entrega (
    id_entrega int auto_increment primary key,
    hora time not null,
    fecha date not null,
    estado varchar(50) not null,
    id_distribuidor int,
    id_pedido int,
    id_ruta int,
    constraint fk_entrega_distribuidor foreign key (id_distribuidor) references distribuidor(id_distribuidor),
    constraint fk_entrega_pedido foreign key (id_pedido) references pedido(id_pedido),
    constraint fk_entrega_ruta foreign key (id_ruta) references ruta(id_ruta)
);
insert into categoria(nombre, estado)
values
('lacteos', 1),
('bebidas', 1),
('limpieza', 0),
('Snacks', 0),
('conservas', 1);

insert into planta_produccion(nombre, latidud, longitud)
values
('Planta La Paz', -16.500, -68.1500),
('Planta Cochabamba', -17.3900, -66.1600),
('Planta Santa Cruz', -17.7800, -63.1800),
('Planta Oruro', -17.9600, -67.1100),
('Planta Sucre', -19.0300, -65.2600);

insert into ciudad(id_planta_produccion, nombre)
values
('La Paz'),
('Cochabamba'),
('Santa Cruz'),
('Oruro'),
('Sucre');

insert into producto(nombre, precio, caducidad, id_categoria)
values
('Agua Mineral', 5.00, 365, 1),
('Lecha', 7.50, 30, 2),
('Detergente', 15.00, 730, 3),
('Papas Fritas', 4.00, 180, 4),
('Atun en Lata', 12.00, 730, 5);

insert into usuario(nombre, rol, correo, id_planta_produccion)
values
('Juan Perez', 'Administrador', 'juan@gmail.com'),
('Maria Lopez', 'Empleado', 'maria@gmail.com'),
('Pedro Rojas', 'Supervisor', 'pedro@gmail.com'),
('Ana Flores', 'Empleado', 'ana@gmail.com'),
('Luis Vargas', 'Administrador', 'luis@gmail.com');

insert into distribuido(nombre, telefono, correo)
values
('Distribuidor Andina', 70123451, 'andina@gmail.com'),
('Distribuidor Central', 70234562, 'central@gmail.com'),
('Distribuidor del Sur', 70345673, 'sur@gmail.com'),
('Distribuidor Norte', 70456784, 'norte@gmail.com'),
('Distribuidor Oriente', 70567895, 'oriente@gmail.com');