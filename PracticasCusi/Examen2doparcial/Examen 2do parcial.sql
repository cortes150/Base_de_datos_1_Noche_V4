drop database UniProjects_db;
create database UniProjects_db;
use UniProjects_db;

create table estudiante(
id_estudiante int auto_increment primary key,
nombre_completo varchar(50) not null,
nombre varchar(50) not null,
ap_paterno varchar(50) not null,
ap_materno varchar(50) not null,
credencial varchar(50) not null,
telefono int not null 
);

create table proyecto(
id_proyecto int auto_increment primary key,
nombre varchar(50) not null,
informe varchar(50) not null,
cantidad int not null,
fecha_presentacion date not null

add column observaciones varchar(500)
and column table proyecto

add column categoria varchar(50)
and column table proyecto

modify column table proyecto 

delete column espercialidad table jurado  

    constraint fk_proyecto_proyecto
    foreign key (id_proyecto) references proyecto (id_proyecto)
);

create table jurado(
id_jurado int auto_increment primary key,
nombre varchar(50) not null,
telefono int not null,
correo varchar(50) not null, 
especialidad varchar(50) not null
);

create table materia(
id_materia int auto_increment primary key,
nombre varchar(50) not null,
cantidad int not null

);

create table evaluacion(
id_evaluacion int auto_increment primary key,
criterios varchar(50) not null,
puntaje int not null,
observaciones varchar(50)not null
);

create table estudiante_proyecto(
id_estudiante_proyecto int auto_increment primary key,
nombre varchar (50) not null
);