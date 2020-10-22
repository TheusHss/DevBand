CREATE DATABASE DevBand;

create TABLE  Farmacia (
idFarmacia int primary key auto_increment,
nomeFarmacia varchar (40),
CNPJ char (14) not null,
CEP char (8) not null, 
endereco varchar (50),
numero int 
);

create table usuario (
idUsuario int primary key auto_increment,
nome varchar (50),
data_nasc date, 
cpf char (11) not null,	
Email varchar (60),
Fk_farmacia int, 
foreign key (Fk_farmacia) references hospital (idfarmacia)
  );
  
  create table sensor (
  idSensor int primary key auto_increment,
  ala varchar (30),
  status_sensor varchar (10),
  check (status_sensor = "inativo" or status_sensor = "ativo" or status_sensor = "manutencao"),
  Fk_farmacia int, 
  foreign key (Fk_farmacia) references hospital (idFarmacia)
  );
  
  create table registro (
  idRegistro int primary key auto_increment,
  data_hora datetime,
  temperatura float, 
  umidade float,
  Fk_sensor int,
  foreign key (Fk_sensor) references sensor (idSensor) 
  );
  
  desc hospital;
  insert into hospital values (null, "Hospital São Rosa", "98765400011234", "85854190", "Rua Dr Jao Vitor Rosa", 17),
  (null, "Hospital São Dorival", "98765400011235", "85854191", "Rua Dr Dorival Ramos", 23),
  (null, "Hospital São Matheus", "98765400011236", "85854951", "Rua Maheus Henrique", 19);

  insert into usuario values ( null, "Christian Silva", "1998-01-15", "12345698711", "christian.bandtec@gmail.com", 1),
  ( null, "Felipe Olegário", "1997-08-25", "12345698724", "felipe.bandtec@gmail.com", 2),
  ( null, "Valmor Machado", "1982-09-21", "12345698717", "valmor.bandtec@gmail.com", 3),
  ( null, "Vivian Santa Catarina", "1995-12-28", "12345698456", "vivian.bandtec@gmail.com", 1),
  ( null, "Fernando Brandão", "1964-05-08", "12345699685", "brandão.bandtec@gmail.com", 3);
  
  insert into sensor values (null, "Ala Cirúrgica 1", "ativo", 1),
  (null, "Ala Recuperação", "inativo", 2),
  (null, "Ala Pediatrica", "ativo", 2),
  (null, "Ala Psiquiatrica", "inativo", 3),
  (null, "Ala Recepção", "ativo", 1);
  
insert into registro values (null, '2020-09-05 21:35:15', 23, 40, 5),
(null, '2020-09-15 09:35:13', 22, 35, 4),
(null, '2020-09-16 06:00:59', 24, 60, 3),
(null, '2020-09-17 07:15:29', 19, 55, 2),
(null, '2020-09-18 20:55:19', 21, 27, 2),
(null, '2020-09-19 12:19:18', 25, 75, 1),
(null, '2020-09-20 09:05:17', 21, 15, 5),
(null, '2020-09-21 22:59:16', 18, 49, 3);

select * from sensor



  
  
