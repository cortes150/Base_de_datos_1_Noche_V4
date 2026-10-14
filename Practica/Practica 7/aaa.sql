
CREATE DATABASE tienda_Uni;
USE tienda_Uni;

CREATE TABLE CLIENTE (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono int NOT NULL
);
CREATE TABLE VENTA (
    id_venta int PRIMARY KEY,
    fecha DATE NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);

CREATE TABLE PRODUCTO (
    id_producto INT PRIMARY KEY,
    producto VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL
);
CREATE TABLE DETALLE_VENTA (
    id_venta_detalle int primary key,
    id_venta int,
    id_producto INT,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES VENTA(id_venta),
    FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto)
);