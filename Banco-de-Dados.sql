create database DevBand;
use DevBand;
desc empresa;
desc laboratorio;
desc usuario;
desc sensor;
desc registro;
select * from empresa;
select * from sensor;
select * from registro;
select * from empresa, laboratorio where idEmpresa=fk_empresa;
select * from empresa,laboratorio,usuario where idEmpresa=fk_empresa and idLab=fk_lab_user;
select * from empresa,laboratorio,sensor, usuario where idEmpresa=fk_empresa and idLab=fk_lab_user and fk_lab_sensor=idLab;

-- Criando tabela Empresa --
create table empresa(
idEmpresa int primary key auto_increment,
cnpj char(18) not null,
razao_social varchar(80) not null,
nome_fantasia varchar(80),
estado char(2) not null,
cidade varchar(50) not null,
bairro varchar(50) not null,
logradouro varchar(80) not null,
numero int not null,
complemento varchar(60),
email varchar(100) not null,
senha varchar(15)
);
alter table empresa rename column email to email_empresa;
alter table empresa rename column senha to senha_empresa;
alter table empresa add column telefone bigint not null;
alter table empresa add column CEP bigint not null;

-- Criando a tabela Laboratório --
create table laboratorio(
idLab int primary key auto_increment,
nome_lab varchar(50) not null,
fk_empresa int,
foreign key(fk_empresa) references empresa(idEmpresa)
);

-- Modificando fk_empresa para not null --
alter table laboratorio modify fk_empresa int not null;

-- Criando a tabela usuario --
create table usuario(
idUsuario int primary key auto_increment,
email varchar(100) not null,
senha varchar(15) not null,
fk_laboratorio int not null,
foreign key(fk_laboratorio) references laboratorio(idLab)
);
alter table usuario rename column fk_laboratorio to fk_lab_user;
alter table usuario rename column email to email_user;
alter table usuario rename column senha to senha_user;

-- Criando tabela de sensores --
create table sensor(
idSensor int primary key auto_increment,
nome_sensor varchar(30) not null,
status_sensor varchar(20),
fk_lab_sensor int not null,
foreign key (fk_lab_sensor) references laboratorio(idLab),
CHECK(status_sensor = 'ativo' or status_sensor = 'inativo' or status_sensor = 'manutencao')
);
alter table sensor add column tipo_sensor char(1) not null;
-- CHECK: 1 = TEMPERATURA, 2 = UMIDADE, 3 = TEMPERATURA E UMIDADE --
alter table sensor add CHECK( tipo_sensor = '1' or tipo_sensor = '2' or tipo_sensor = '3');

-- Criando tabela registros --
create table registro(
idRegistro int primary key auto_increment,
dataRegistro datetime default current_timestamp,
indice varchar(5) not null
);
alter table registro add column fk_sensor int not null;
alter table registro add foreign key(fk_sensor) references sensor(idSensor);

-- Inserindo valor na tabela empresa --
insert into empresa(idEmpresa, cnpj, razao_social, nome_fantasia, estado, cidade, bairro, logradouro, numero, complemento, email_empresa, senha_empresa, telefone, CEP) values
(null,'29.785.870/0001-03','Laboratorio Neo Quimica Com E Ind Ltda','Neoquimica','SP','Sao Paulo','Itaquera',' Via Anhanguera',987,'sem complemento','neoquimica01@gmail.com','neoquimica123',11974230899,19999060);

-- Inserindo valores na tabela laboratorio --
insert into  laboratorio(idLab, nome_lab, fk_empresa) values
(null,'Laboratório1',1); 
insert into laboratorio(idLab, nome_lab, fk_empresa) values
(null,'Laboratório2',1),
(null,'Laboratório3',1);

-- Inserindo valores na tabela usuario --
insert into usuario (idUsuario, email_user, senha_user, fk_lab_user) values
(null,'usuario01@gmail.com','usuario1010',1),
(null,'usuario02@gmail.com','usuario2020',1),
(null,'usuario03@gmail.com','usuario3030',1);

-- Inserindo valores na tabela sensor --
insert into sensor (idSensor, nome_sensor, status_sensor, fk_lab_sensor, tipo_sensor) values
(null,'sensor1','ativo',2,'1'),
(null,'sensor2','manutencao',2,'2'),
(null,'sensor3','ativo',1,'1'),
(null,'sensor4','inativo',3,'3');

-- Inserindo valores na tabela registro --
insert into registro (idRegistro, indice, fk_sensor) values
(null,'23.4',3);


