drop database gimnasio_db;
create database gimnasio_db;
use gimnasio_db;

create table socio (
    id_socio int auto_increment primary key,
    nombre varchar(60) not null,
    apellido_paterno varchar(60) not null,
    apellido_materno varchar(60),
    fecha_nacimiento date not null,
    edad int,
    calle varchar(100),
    numero varchar(15),
    ciudad varchar(60),
    correo_electronico varchar(120),
    telefono_contacto varchar(25)
);

create table clase (
    id_clase int auto_increment primary key,
    nombre_clase varchar(100) not null,
    tipo_actividad varchar(80),
    duracion int,
    horario varchar(80),
    nivel_dificultad varchar(30)
);

create table entrenador (
    id_empleado int auto_increment primary key,
    nombre varchar(60) not null,
    apellido_paterno varchar(60) not null,
    apellido_materno varchar(60),
    especialidad varchar(100),
    años_experiencia int,
    telefono_contacto varchar(25),
    turno_trabajo varchar(30)
);

create table inscripcion (
    id_inscripcion int auto_increment primary key,
    fecha_inscripcion date not null,
    asistencia boolean,
    pagos_realizados decimal(10,2),

    id_socio int not null,
    id_clase int not null,
    id_empleado int not null,

    constraint fk_inscripcion_socio
        foreign key (id_socio)
        references socio(id_socio),

    constraint fk_inscripcion_clase
        foreign key (id_clase)
        references clase(id_clase),

    constraint fk_inscripcion_entrenador
        foreign key (id_empleado)
        references entrenador(id_empleado)
);