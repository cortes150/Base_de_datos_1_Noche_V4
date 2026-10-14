create database biblioteca_db;
use biblioteca_db;

create table estudiante (
    id_estudiante int auto_increment primary key,
    c_unico_de_matricula varchar(50) not null,
    nombre_completo varchar(100),
    carrera varchar(50),
    semestre varchar(20),
    calle varchar(50),
    numero varchar(10),
    ciudad varchar(50)
);

create table bibliotecario (
    id_bibliotecario int auto_increment primary key,
    cod_empleado varchar(30) not null,
    nombre_completo varchar(100),
    turno varchar(20),
    telefono_contacto varchar(20),
    anos_de_experiencia int
);

create table libro (
    id_libro int auto_increment primary key,
    cod_isbn varchar(30) not null,
    titulo varchar(100) not null,
    editorial varchar(50),
    ano_de_publicacion int,
    categoria varchar(50)
);

create table prestamo (
    id_prestamo int auto_increment primary key,
    fecha_de_prestamo date,
    fecha_de_devolucion_prevista date,
    fecha_de_devolucion_real date,
    tiempo_prestamo varchar(30),
    id_estudiante int,
    id_bibliotecario int,
    id_libro int,
    constraint fk_prestamo_estudiante foreign key (id_estudiante) references estudiante(id_estudiante),
    constraint fk_prestamo_bibliotecario foreign key (id_bibliotecario) references bibliotecario(id_bibliotecario),
    constraint fk_prestamo_libro foreign key (id_libro) references libro(id_libro)
);