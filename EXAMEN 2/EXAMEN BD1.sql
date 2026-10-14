create database uniProyect_db,
use uniProyecto_db

create table estudiante(
id_estudiante auto_increment primary key,
nombre varchar (100) not null,
ap.paterno varchar (10) not null,
ap.materno varchar (10) not null,
edad int not null,
);

create table registro(
id_registro int auto_increment primary key,
tema varchar (50) not null,
categoria varchar (50) not null,
fecha int not null,
hora int not null ,
constraint fk_registro foreign key (id_estudiante) references registro(id_registro)
);

create table materia(
id_materia int auto_increment primary key,
turno varchar (50) not null,
duracion int not null,
nombre varchar (50) not null,
constraint fk_estudiante foreign key (id_materia) references materia(id_materia)
);

create table jurado( 
id_jurado int auto_increment primary key,
nombre varchar (50) not null,
edad int not null,
cargo varchar (50) not null
);

create table proyecto( 
id_proyecto int auto_increment primary key,
asignatura varchar (50) not null,
nombre varchar (50) not null,
observaciones varchar (500) not null,
categoria_de_tipo varchar (50) not null,
constraint fk_id_estudiante foreign key (id_proyecto) references proyecto(id_proyecto)
constraint fk_id_jurado foreign key (id_jurado) references proyecto(id_proyecto)
);

create table evaluacion(
id_evaluacion int auto_increment primary key,
puntaje double not null,
observacion varchar (500) not null,
criterio varchar (100) not 
constraint fk_id_proyecto foreign key (id_proyecto) references proyecto(id_proyecto)
constraint fk_id_jurado foreign key (id_jurado) references proyecto(id_evaluacion)
);
