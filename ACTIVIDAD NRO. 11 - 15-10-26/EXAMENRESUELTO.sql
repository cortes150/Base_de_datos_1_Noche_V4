create database uni_proyects_db;
use uni_proyects_db;

create table estudiante(
id_estudiante int auto_increment primary key,
nombre varchar(50),
apellido_paterno varchar(50),
apellido_materno varchar(50),
matricula int not null
);
alter table estudiante modify column nombre varchar(100) not null;
alter table estudiante add column correo varchar(50);
desc estudiante;
alter table estudiante add constraint uq_estudiante_correo
unique (correo);
create table proyecto(
id_proyecto int auto_increment primary key,
titulo varchar(100) not null,
fecha date
);
alter table proyecto add column id_materia int;
alter table proyecto add constraint fk_proyecto_materia_prueba
foreign key (id_materia) references materia(id_materia);
alter table proyecto add column categoria varchar(50);
alter table proyecto modify column titulo varchar(250);

alter table proyecto rename column tema to nombre_tema;

alter table proyecto add constraint pk_proyecto
primary key (id_proyecto);

desc proyecto;
create table estudiante_proyecto(
id_estudiante_proyecto int auto_increment primary key,
id_estudiante int,
id_proyecto int,

constraint fk_estudiante_estudiante_proyecto 
foreign key (id_estudiante) references estudiante(id_estudiante),

constraint fk_proyecto_estudiante_proyecto
foreign key (id_proyecto) references proyecto(id_proyecto)
);

create table materia (
id_materia int auto_increment primary key,
nombre varchar(50) not null,
turno varchar(50),
id_proyecto int,
constraint fk_proyecto_materia
foreign key (id_proyecto) references proyecto(id_proyecto)
);

alter table materia add constraint pk_materia
primary key (id_materia);



create table jurado(
id_jurado int auto_increment primary key,
nombre varchar(100) not null,
especialidad varchar(50)
);
alter table jurado drop column especialidad;
desc jurado;

create table evaluacion(
id_evaluacion int auto_increment primary key,
id_jurado int,
id_proyecto int,

constraint fk_jurado_evaluacion
foreign key (id_jurado) references jurado(id_jurado),
constraint fk_proyecto_evaluacion
foreign key (id_proyecto) references proyecto(id_proyecto)
);
alter table evaluacion add column puntaje int;

alter table evaluacion add constraint chk_evaluacion_puntajee
check(puntaje>=0 and puntaje<=100);
desc evaluacion;

insert into estudiante(nombre,apellido_paterno,apellido_materno,matricula,correo)
values
('alex','herrera','ticona',273843,'cc@gmail.com'),
('fernando','perez','mon',54334,'bbbb@gmail.com');

select * from estudiante


INSERT INTO proyecto (titulo, fecha, categoria) 
VALUES 
('Sistema de Gestión de Inventario', '2023-11-01', 'Software'),
('Brazo Robótico Automatizado', '2023-11-02', 'Hardware');

INSERT INTO jurado (nombre) 
VALUES 
('Ing. Carlos Mendoza'),
('Dra. Ana Torres');

INSERT INTO evaluacion (id_jurado, id_proyecto, puntaje) 
VALUES 
(1, 1, 95),
(2, 1, 88),
(1, 2, 75);

SELECT * FROM evaluacion;