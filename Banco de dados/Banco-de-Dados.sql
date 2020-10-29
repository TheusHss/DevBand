drop database DevBand;
create database DevBand;
use DevBand;
desc empresa;
desc laboratorio;
desc usuario;
desc sensor;
desc registro;
select * from empresa;
select * from laboratorio;
select * from sensor;
select * from registro;
select * from empresa, laboratorio, usuario, sensor, registro where fk_empresa=idEmpresa and fk_lab_user=idLab and fk_lab_sensor=idLab 
 and fk_sensor = idSensor;



-- Criando tabela Empresa --
create table empresa(
idEmpresa int primary key auto_increment,
cnpj char(18) not null,
razao_social varchar(80) not null,
nome_fantasia varchar(80),
cep char(9) not null,
numero int not null,
complemento varchar(60),
telefone varchar(20) not null,
email_empresa varchar(100) not null,
senha_empresa varchar(40) not null,
CHECK(length(senha_empresa) > 6)
);


-- Criando a tabela Laboratório --
create table laboratorio(
idLab int primary key auto_increment,
nome_lab varchar(50) not null,
fk_empresa int not null,
foreign key(fk_empresa) references empresa(idEmpresa)
);


-- Criando a tabela usuario --
create table usuario(
idUsuario int primary key auto_increment,
nome_user varchar(45) not null,
email_user varchar(100) not null,
senha_user varchar(60) not null,
fk_lab_user int not null,
foreign key(fk_lab_user) references laboratorio(idLab)
);


-- Criando tabela de sensores --
create table sensor(
idSensor int primary key auto_increment,
localizacao_sensor varchar(30) not null,
status_sensor varchar(20),
fk_lab_sensor int not null,
foreign key (fk_lab_sensor) references laboratorio(idLab),
CHECK(status_sensor = 'ativo' or status_sensor = 'inativo' or status_sensor = 'manutencao')
);

-- Criando tabela registros --
create table registro(
idRegistro int primary key auto_increment,
data_registro datetime default current_timestamp,
temperatura varchar(6),
umidade varchar(4),
fk_sensor int not null,
foreign key(fk_sensor) references sensor(idSensor)
);

-- Inserindo valor na tabela empresa --
insert into empresa(idEmpresa, cnpj, razao_social, nome_fantasia, cep, numero, complemento, email_empresa, senha_empresa, telefone) values
(null, '29.785.870/0001-03', 'Laboratorio Neo Quimica Com E Ind Ltda', 'Neoquimica', '19999060', 987, '', 'neoquimica01@gmail.com', 'neoquimica123', 11974230899),
(null, '20.785.870/0012-03', 'Laboratorio Xurinxunflai', 'Xurinxunflai', '67122351', 105, '', 'xurinxus123@yahoo.com.br', 'xurinxinhos10', 11982716288)
;


-- Inserindo valores na tabela laboratorio --
insert into  laboratorio(idLab, nome_lab, fk_empresa) values
(null,'Laboratório1',1),
(null,'Laboratório2',2),
(null,'Laboratório3',2);

-- Inserindo valores na tabela usuario --
insert into usuario (idUsuario, nome_user, email_user, senha_user, fk_lab_user) values
(null,'Carlos','usuario01@gmail.com','usuario1010',1),
(null, 'Matheus','usuario02@gmail.com','usuario2020',2),
(null, 'Hanan', 'usuario03@gmail.com','usuario3030',3),
(null, 'Wesley', 'usuario04@gmail.com', 'usuario4040', 2);

-- Inserindo valores na tabela sensor --
insert into sensor (idSensor, localizacao_sensor, status_sensor, fk_lab_sensor) values
(null, 'canto inferior esquerdo', 'ativo', 1),
(null, 'centro', 'manutencao', 2),
(null, 'canto superior esquerdo', 'ativo', 3),
(null, 'canto inferior direito', 'inativo', 2);

-- Inserindo valores na tabela registro --
insert into registro (temperatura, umidade , fk_sensor) values
('23.5°C', '49%', 1),
('26.9°C', '35%', 3);