create database grupo_hospital;
use grupo_hospital;

create table hospitais(
	idHospital int primary key auto_increment,
    nomeHosp varchar(30),
    CNPJ char(14),
    cep char(8),
    numero int
    )auto_increment=1;
    
create table usuarios(
	idUsuario int primary key auto_increment,
    nome varchar(30),
    data_nasc date,
    cpf char(11),
    celular varchar(11),
    email varchar(30),
    fk_hospital int,
    foreign key(fk_hospital) references hospitais(idHospital)
    );
    
create table sensores(
	idSensor int primary key auto_increment,
    qtdSensor int,
    fk_hospital int,
    foreign key(fk_hospital) references hospitais(idHospital),
    fk_usuario int,
    foreign key(fk_usuario) references usuarios(idUsuario)
    );
    
    insert into hospitais (nomeHosp,CNPJ,cep,numero) values
    ('Clinicas Sousa', '12345678910111', '05572100', 1009),
    ('Hospital Bandeirantes', '45632178596412', '05578120', 859);
    
    select*from hospitais;
    
    insert into usuarios(nome, data_nasc, cpf, celular, email, fk_hospital) values
    ('felipe brabo', '2000-07-07', '48963818828', '11963353621', 'felipepatolino0@gmail.com', 1),
    ('matheus sousa', '1999-01-23', '30332385808', '11963352147', 'matheus.sousa@gmail.com', 2),
    ('joão vitor', '2002-10-05', '29863574123', '11958741236', 'joao.vitor@gmail.com', 1);
    
    select*from usuarios;
    
    insert into sensores(qtdSensor, fk_hospital, fk_usuario) values
    (20, 1, 2),
    (30, 2, 3),
    (15, 1, 1);
    
    select*from sensores;
    