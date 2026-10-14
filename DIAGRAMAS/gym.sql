create database gimnasio_db;
use gimnasio_db;

create table socio (
    id_socio int auto_increment primary key,
    nombre_completo varchar(100) not null,
    fecha_nacimiento date not null,
    edad int not null,
    correo_electronico varchar(80) not null,
    calle varchar(80) not null,
    numero varchar(20) not null,
    ciudad varchar(50) not null
);

create table telefono_socio (
    id_telefono int auto_increment primary key,
    id_socio int not null,
    telefono varchar(20) not null,
    constraint fk_tel_socio foreign key (id_socio) references socio(id_socio)
);

create table entrenador (
    id_entrenador int auto_increment primary key,
    nombre varchar(50) not null,
    ap_paterno varchar(50) not null,
    ap_materno varchar(50) not null,
    especialidad varchar(80) not null,
    anos_experiencia int not null,
    turno_trabajo varchar(50) not null
);

create table telefono_entrenador (
    id_telefono int auto_increment primary key,
    id_entrenador int not null,
    telefono varchar(20) not null,
    constraint fk_tel_entrenador foreign key (id_entrenador) references entrenador(id_entrenador)
);

create table clase (
    id_clase int auto_increment primary key,
    id_entrenador int not null,
    nombre_clase varchar(80) not null,
    nivel_dificultad varchar(50) not null,
    horario varchar(50) not null,
    duracion varchar(50) not null,
    tipo_actividad varchar(80) not null,
    constraint fk_clase_entrenador foreign key (id_entrenador) references entrenador(id_entrenador)
);

create table inscripcion_clase (
    id_inscripcion int auto_increment primary key,
    id_socio int not null,
    id_clase int not null,
    fecha_inscripcion date not null,
    asistencia boolean not null,
    pagos_realizados decimal(10,2) not null,
    constraint fk_insc_socio foreign key (id_socio) references socio(id_socio),
    constraint fk_insc_clase foreign key (id_clase) references clase(id_clase)
);