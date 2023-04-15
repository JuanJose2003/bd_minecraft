drop database if exists bd_minecraft;
create database bd_minecraft;
use bd_minecraft;
create table jugadores (
id_jugador int not null auto_increment,
nombre_jugador varchar(20) not null,
pais varchar(20) not null,
mes_inicio varchar(15) not null,
primary key (id_jugador)
);
create table inventario (
cod_inventario int not null auto_increment,
cantidad_objetos int not null,
encantamientos varchar(20) not null,
id_jugador int not null,
primary key (cod_inventario, id_jugador)
);
create table logros (
id_logro int not null auto_increment,
nombre_logro varchar(20) not null,
recompensa varchar(15) not null,
primary key (id_logro)
);

create table servidores (
ip_servidor int not null auto_increment,
nombre_servidor varchar(20) not null,
estado varchar(15) not null,
año_creacion int not null,
primary key (ip_servidor)
);
create table mundo (
id_mundo int not null auto_increment,
dificultad varchar(20) not null,
fecha_creacion date not null,
modo_juego varchar(20) not null,
primary key (id_mundo)
);

create table dimensiones (
id_dimension int not null auto_increment,
nombre_dimension varchar(20) not null,
nivel_acceso int not null,
primary key (id_dimension)
);

create table biomas (
id_bioma int not null auto_increment,
tipo_bioma varchar(20) not null,
poblacion varchar(10) not null,
primary key (id_bioma)
);

 create table bloques (
 cod_bloque int not null ,
 tipo_bloque varchar(50)not null,
 primary key (cod_bloque)
);
 create table recursos (
 id_recurso int not null auto_increment,
 tipo_recurso varchar(20) not null,
 localizacion_recurso varchar(20) not null,
 primary key (id_recurso)
 );
 create table elementos (
 id_elemento int not null auto_increment,
 tipo_elemento varchar(20) not null,
 medio_fabricacion varchar(20) not null,
 primary key (id_elemento)
 );
 create table herramientas (
 cod_herramienta int not null auto_increment,
 tipo_herramienta varchar(20) not null,
 duracion_herramienta varchar(20) not null,
 primary key (cod_herramienta)
 ); 
 create table pueden_conseguir (
id_logro int not null,
id_jugador int not null,
primary key (id_logro, id_jugador)
);
 create table pueden_acceder (
id_jugador int not null,
ip_servidor int not null,
primary key (id_jugador, ip_servidor)
);
 create table acceden (
id_jugador int not null,
id_mundo int not null,
primary key (id_jugador,id_mundo)
);
 create table tienen (
id_mundo int not null,
id_bioma int not null,
primary key (id_mundo,id_bioma)
);
create table pueden_haber (
id_mundo int not null,
id_dimension int not null,
primary key (id_mundo,id_dimension)
);
 create table esta_conformado_por (
 id_mundo int not null,
 id_recurso int not null,
 primary key (id_mundo,id_recurso)
 );
 
 create table esta_formado_por (
 id_mundo int not null,
 cod_bloque int not null,
 primary key (id_mundo,cod_bloque)
 );
 
create table se_puede_encontrar (
id_mundo int not null,
id_elemento int not null,
primary key (id_mundo,id_elemento)
);
 

create table se_destruyen_con (
 cod_bloque int not null,
 cod_herramienta int not null,
 primary key (cod_bloque,cod_herramienta)
);
 
 alter table inventario
 add constraint FK_id_jugador foreign key (id_jugador) references jugadores (id_jugador)
 on update cascade;
 alter table pueden_conseguir
 add constraint FK_id_logro foreign key (id_logro) references logros (id_logro),
 add constraint FK_id_jugador2 foreign key (id_jugador) references jugadores (id_jugador)
 on update cascade;
 alter table pueden_acceder
 add constraint FK_id_jugador3 foreign key (id_jugador) references jugadores (id_jugador),
 add constraint FK_ip_servidor foreign key (ip_servidor) references servidores (ip_servidor)
 on update cascade;
 alter table acceden
 add constraint FK_id_jugador4 foreign key (id_jugador) references jugadores (id_jugador),
 add constraint FK_id_mundo foreign key (id_mundo) references mundo (id_mundo)
 on update cascade;
 alter table tienen
 add constraint FK_id_mundo2 foreign key (id_mundo) references mundo (id_mundo),
 add constraint FK_id_bioma foreign key (id_bioma) references biomas (id_bioma)
 on update cascade;
 alter table pueden_haber
 add constraint FK_id_mundo4 foreign key (id_mundo) references mundo (id_mundo),
 add constraint FK_id_dimension2 foreign key (id_dimension) references dimensiones (id_dimension)
 on update cascade;
 alter table esta_conformado_por 
 add constraint FK_id_mundo3 foreign key (id_mundo) references mundo (id_mundo),
 add constraint FK_id_recurso foreign key (id_recurso) references recursos (id_recurso)
 on update cascade;
alter table esta_formado_por
 add constraint FK_id_mundo5 foreign key (id_mundo) references mundo (id_mundo),
 add constraint FK_cod_bloque foreign key (cod_bloque) references bloques (cod_bloque)
 on update cascade; 
 alter table se_puede_encontrar
 add constraint FK_id_mundo6 foreign key (id_mundo) references mundo (id_mundo),
 add constraint FK_id_elemento foreign key (id_elemento) references elementos (id_elemento)
 on update cascade;
 alter table se_destruyen_con
 add constraint FK_cod_bloque2 foreign key (cod_bloque) references bloques (cod_bloque),
 add constraint FK_cod_herramienta foreign key (cod_herramienta) references herramientas (cod_herramienta)
 on update cascade;
 
 insert into jugadores values (98985,'Ramon','Mongolia','Febrero');
 insert into jugadores values (45879,'Melo','Madagascar','Junio');
 insert into jugadores values (77584,'Ricardo','Portugal','Febrero');
 insert into jugadores values (42236,'Orlando','Noruega','Diciembre');
 insert into jugadores values (45678,'Miguel','Peru','Marzo');
 
 insert into inventario values (512,64,'protectores',98985);
 insert into inventario values (441,64,'durabilidad',45879);
 insert into inventario values (512,64,'ofensivo',77584);
 insert into inventario values (512,64,'disparo',42236);
 insert into inventario values (512,64,'maldiciones',45678);
 
 insert into logros value (2626,'madera de lider','experiencia');
 insert into logros value (4523,'pescador','experiencia');
 insert into logros value (4536,'cazador','experiencia');
 insert into logros value (7945,'todopoderoso','experiencia');
 insert into logros value (4312,'arquero','experiencia');

insert into servidores value (105.10,'Hypixel','estable',2013);
insert into servidores value (110.3,'Supercraft','estable',2020);
insert into servidores value (99.10,'Complex Gaming','inestable',2019);
insert into servidores value (140.5,'ZoneCraft ','estable',2019);
insert into servidores value (187.1,'2b2t','inestable',2010); 

insert into mundo value (20,'dificil','2010-12-1','competitivo');
insert into mundo value (21,'facil','2014-01-25','creativo');
insert into mundo value (22,'medio','2020-08-7','online');
insert into mundo value (23,'dificil','2011-04-13','online');
insert into mundo value (24,'facil','2018-10-5','competitivo');

insert into dimensiones values (10.2,'nether',30);
insert into dimensiones values (5.23,'overworld',0);
insert into dimensiones values (15.1,'end',65);
insert into dimensiones values (20.6,'the void',15);
insert into dimensiones values (1.5,'the aether',50);

insert into biomas values (1515,'bosque','si');
insert into biomas values (4999,'jungla','no');
insert into biomas values (0864,'desierto','si');
insert into biomas values (3012,'campo de hielo','no');
insert into biomas values (1304,'sabana','si');

insert into recursos value (1,'oro','mineria');
insert into recursos value (2,'hierro','mineria');
insert into recursos value (3,'diamante','mineria');
insert into recursos value (4,'madera','arboles');
insert into recursos value (5,'piedra','tierra');

insert into bloques value (6,'piedra');
insert into bloques value (7,'lana');
insert into bloques value (8,'obsidiana');
insert into bloques value (9,'minerales');
insert into bloques value (10,'tierra');

insert into elementos value (11,'armadura','hierro');
insert into elementos value (12,'carne','animales');
insert into elementos value (13,'tnt','polvora');
insert into elementos value (14,'tinte','flores');
insert into elementos value (15,'libros','papel');

insert into herramientas value (30,'pico','50 golpes');
insert into herramientas value (31,'espada','100 golpes');
insert into herramientas value (32,'hacha','50 golpes');
insert into herramientas value (33,'caña','10 pescas');
insert into herramientas value (34,'tijeras','10 cortes');

insert into pueden_conseguir value (2626,98985);
insert into pueden_conseguir value (4523,45879);
insert into pueden_conseguir value (4536,77584);
insert into pueden_conseguir value (7945,42236);
insert into pueden_conseguir value (4312,45678);

insert into pueden_acceder value (98985,105.10);
insert into pueden_acceder value (45879,110.3);
insert into pueden_acceder value (77584,99.10);
insert into pueden_acceder value (42236,140.5);
insert into pueden_acceder value (45678,187.1);

insert into acceden value (98985, 20);
insert into acceden value (45879, 21);
insert into acceden value (77584, 22);
insert into acceden value (42236, 23);
insert into acceden value (45678, 24);

insert into tienen value (20,1515);
insert into tienen value (21,4999);
insert into tienen value (22,0864);
insert into tienen value (23,3012);
insert into tienen value (24,1304);

insert into pueden_haber value (20,10.2);
insert into pueden_haber value (21,5.23);
insert into pueden_haber value (22,15.1);
insert into pueden_haber value (23,20.6);
insert into pueden_haber value (24,1.5);

insert into esta_conformado_por value (20,1);
insert into esta_conformado_por value (21,2);
insert into esta_conformado_por value (22,3);
insert into esta_conformado_por value (23,4);
insert into esta_conformado_por value (24,5);

insert into esta_formado_por value (20,6);
insert into esta_formado_por value (21,7);
insert into esta_formado_por value (22,8);
insert into esta_formado_por value (23,9);
insert into esta_formado_por value (24,10);

insert into se_puede_encontrar value (20,11);
insert into se_puede_encontrar value (21,12);
insert into se_puede_encontrar value (22,13);
insert into se_puede_encontrar value (23,14);
insert into se_puede_encontrar value (24,15);

insert into se_destruyen_con value (6,30);
insert into se_destruyen_con value (7,31);
insert into se_destruyen_con value (8,32);
insert into se_destruyen_con value (9,33);
insert into se_destruyen_con value (10,34);


