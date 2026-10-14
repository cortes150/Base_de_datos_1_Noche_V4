create database universidad_db;
use universidad_db;
 create table estudiante(
 id_estudiante int auto_increment primary key,
 nombre varchar(50),
 apellido_p varchar(20),
 apellido_m varchar(30),
 edad int 
 );
 create table materia_p(
  id_materia_p int auto_increment primary key,
  nombre varchar(30),
  cod int
 );
 create table feria(
 id_feria int auto_increment primary key,
 nombre varchar (30),
 tipo_feria  varchar(30)
 );
 create table jurado(
 id_jurado int auto_increment primary key,
 especialidad varchar(39),
 nombre varchar(40),
 telefono int 
 );
 
 create table estudiante_proyecto(
 id_estudiante_proyecto int auto_increment primary key,
 rol varchar(20),
 id_estudiante int,
 id_proyecto int
 
 
 );
 create table proyecto(
 id_proyecto int auto_increment primary key,
 tiulo varchar(39),
 tema varchar(34),
 fecha_presentacion datetime,
 id_feria int,
 id_materia_p int
 
 );
create table estudiante_materia_p(
id_estudante_materia_p int auto_increment primary key,
cantidad int,
id_estudiante int,
id_materia_p int,
constraint fk_estudiante_materia_estudiante foreign key (estudiante) references estudiante(id_estudiante),
constraint fk_estudiante_materia_materia_p foreign key (materia_p) references materia_p(id_materia_p)
);
create table tema(
id_tema int auto_increment primary key,
nombre varchar(39),
contenido varchar(233),
id_proyecto int,
constraint fk_tema_proyecto foreign key (proyecto) references proyecto(id_proyecto),
);
create table evaluacion(
id_evaluacion int auto_increment primary key,
nota_final int,
id_proyecto int,
id_jurado int,
constraint fk_evalucion_proyecto foreign key (proyecto) references proyecto(id_proyecto),

);

-- secc 4
alter table proyecto add column observaciones varchar(500)

alter table proyecto modify column titulo varchar(250)

alter table proyecto rename column tema to nombre_tema

alter table proyecto add column categoria varchar (50)

alter table drop column especialidad
--
alter table materia_P

alter table estudiante unique correo 



 
