drop database CoffeSolutions;

create database CoffeSolutions;

use CoffeSolutions;

create table empresa (
idEmpresa int primary key auto_increment,
razaoSocial varchar(100) not null,
cnpj char(18) not null,
email varchar(100) not null
);

insert into empresa values (null, "Café & exportação", "31.638.206/0001-75", "cafe.exportacao@gmail.com");
insert into empresa values (null, "Café do mato", "37.422.421/0001-10", "cafe.mato@gmail.com");
insert into empresa values (null, "Fazenda do tião", "13.542.406/0001-48", "fazenda.tiao@gmail.com");
insert into empresa values (null, "Dois irmãos", "68.210.227/0001-03", "dois.irmaos@gmail.com");

select * from empresa;

create table endereco (
idEndereco int primary key auto_increment,
cep char(9) not null,
estado char(2) not null,
cidade varchar(100) not null,
bairro varchar(100) not null,
logradouro varchar(100) not null,
numero varchar(10) not null,
fkEmpresa int,
foreign key (fkEmpresa) references empresa(idEmpresa)
);

insert into endereco values (null, "13310-600", "SP", "Itu", "Parque das Rosas", "Avenida Caetano Ruggieri", "4520", 1);
insert into endereco values (null, "07032-120", "SP", "Guarulhos", "Vila Zamataro", "Rua Soldado Albino César", "25", 2);
insert into endereco values (null, "07864-090", "SP", "Franco da Rocha", "Parque Pretoria", "Rua Andorinha", "10", 3);
insert into endereco values (null, "06142-260", "SP", "Osasco", "Novo Osasco", "Rua Pedro Ronda", "170", 4);

select * from endereco;


create table telefone (
idTelefone int primary key auto_increment,
numero varchar(20) not null,
tipo varchar(5) not null,
check (tipo = "fixo" or tipo = "movel"),
fkEmpresa int,
foreign key (fkEmpresa) references empresa(idEmpresa)
);

insert into telefone values (null, "(11) 3702-1160", "fixo", 1);
insert into telefone values (null, "(11) 99484-2230", "movel", 1);

insert into telefone values (null, "(11) 3916-9031", "fixo", 2);
insert into telefone values (null, "(11) 99898-8744", "movel", 2);

insert into telefone values (null, "(11) 2552-3751", "fixo", 3);
insert into telefone values (null, "(11) 99412-4408", "movel", 3);

insert into telefone values (null, "(11) 2903-4897", "fixo", 4);
insert into telefone values (null, "(11) 99977-8511", "movel", 4);

select * from telefone;

create table usuario (
idUsuario int primary key auto_increment,
login varchar(20) not null,
senha varchar(20) not null,
email varchar(50) not null,
fkEmpresa int,
foreign key (fkEmpresa) references empresa(idEmpresa)
);

select * from usuario;

insert into usuario values (null, "Diretor", "joao123", "joao.silva@gmail.com", 1);
insert into usuario values (null, "Gerente", "rafael123", "rafael.santos@gmail.com", 1);
insert into usuario values (null, "Técnico", "luiz123", "luiz.araujo@gmail.com", 1);

insert into usuario values (null, "Diretor", "caloros123", "carlos.monteiro@gmail.com", 2);
insert into usuario values (null, "Gerente", "Lucas123", "lucas.castro@gmail.com", 2);
insert into usuario values (null, "Técnico", "luiz123", "luiz.araujo@gmail.com", 2);

insert into usuario values (null, "Diretor", "roberto123", "roberto.silva@gmail.com", 3);
insert into usuario values (null, "Gerente", "bruno123", "bruno.gouveia@gmail.com", 3);
insert into usuario values (null, "Técnico", "ramon123", "ramon.santos@gmail.com", 3);

insert into usuario values (null, "Diretor", "vitor123", "vitor.pedrosa@gmail.com", 4);
insert into usuario values (null, "Gerente", "fabio123", "fabio.lopes@gmail.com", 4);
insert into usuario values (null, "Técnico", "rogerio123", "ramon.souza@gmail.com", 4);

create table localSensor (
idLocal int primary key auto_increment,
quadrante varchar(100) not null,
fkEmpresa int,
foreign key (fkEmpresa) references empresa(idEmpresa)
);

select * from localSensor;

insert into localSensor values (null, "primeiro quadrante", 1);
insert into localSensor values (null, "segundo quadrante", 1);
insert into localSensor values (null, "terceiro quadrante", 1);
insert into localSensor values (null, "quarto quadrante", 1);

insert into localSensor values (null, "primeiro quadrante", 2);
insert into localSensor values (null, "segundo quadrante", 2);
insert into localSensor values (null, "terceiro quadrante", 2);
insert into localSensor values (null, "quarto quadrante", 2);


insert into localSensor values (null, "primeiro quadrante", 3);
insert into localSensor values (null, "segundo quadrante", 3);
insert into localSensor values (null, "terceiro quadrante", 3);
insert into localSensor values (null, "quarto quadrante", 3);

insert into localSensor values (null, "primeiro quadrante", 4);
insert into localSensor values (null, "segundo quadrante", 4);
insert into localSensor values (null, "terceiro quadrante", 4);
insert into localSensor values (null, "quarto quadrante", 4);

create table sensor (
idSensor int primary key auto_increment,
statusSensor varchar(10) not null,
check (statusSensor = "ativo" or statusSensor = "inativo" or statusSensor = "manutencao"),
fkLocalSensor int,
foreign key (fkLocalSensor) references localsensor(idLocal)
);

insert into sensor values (null, "ativo", 1);
insert into sensor values (null, "ativo", 2);
insert into sensor values (null, "manutencao", 3);
insert into sensor values (null, "ativo", 4);
insert into sensor values (null, "ativo", 5);
insert into sensor values (null, "ativo", 6);
insert into sensor values (null, "manutencao", 7);
insert into sensor values (null, "manutencao", 8);
insert into sensor values (null, "ativo", 9);
insert into sensor values (null, "ativo", 10);
insert into sensor values (null, "ativo", 11);
insert into sensor values (null, "ativo", 12);
insert into sensor values (null, "ativo", 13);
insert into sensor values (null, "ativo", 14);
insert into sensor values (null, "manutencao", 15);
insert into sensor values (null, "ativo", 16);

select * from sensor;

create table registro (
idRegistro int primary key auto_increment,
datahora datetime not null,
temperatura decimal(3,1) not null,
umidade decimal(3,1) not null,
check (umidade <= 100 and umidade >= 0),
fkSensor int,
foreign key (fkSensor) references sensor(idSensor)
);

select * from registro;

insert into registro values(null, sysdate(), 30, 50, 1);
insert into registro values(null, sysdate(), 30, 49, 1);
insert into registro values(null, sysdate(), 30, 48, 1);
insert into registro values(null, sysdate(), 30, 49, 1);
insert into registro values(null, sysdate(), 30, 48, 1);
insert into registro values(null, sysdate(), 30, 49, 1);


insert into registro values(null, sysdate(), 28, 60, 2);
insert into registro values(null, sysdate(), 30, 69, 2);
insert into registro values(null, sysdate(), 30, 68, 2);
insert into registro values(null, sysdate(), 30, 69, 2);
insert into registro values(null, sysdate(), 30, 68, 2);
insert into registro values(null, sysdate(), 30, 69, 2);


insert into registro values(null, sysdate(), 28, 60, 3);
insert into registro values(null, sysdate(), 25, 69, 3);
insert into registro values(null, sysdate(), 27, 68, 3);
insert into registro values(null, sysdate(), 26, 69, 3);
insert into registro values(null, sysdate(), 27, 68, 3);
insert into registro values(null, sysdate(), 28, 69, 3);

insert into registro values(null, sysdate(), 29, 60, 4);
insert into registro values(null, sysdate(), 29, 69, 4);
insert into registro values(null, sysdate(), 29, 68, 4);
insert into registro values(null, sysdate(), 28, 69, 4);
insert into registro values(null, sysdate(), 29, 68, 4);
insert into registro values(null, sysdate(), 28, 69, 4);

insert into registro values(null, sysdate(), 29, 60, 5);
insert into registro values(null, sysdate(), 29, 69, 5);
insert into registro values(null, sysdate(), 29, 68, 5);
insert into registro values(null, sysdate(), 28, 69, 5);
insert into registro values(null, sysdate(), 29, 68, 5);
insert into registro values(null, sysdate(), 28, 69, 5);

insert into registro values(null, sysdate(), 29, 60, 6);
insert into registro values(null, sysdate(), 29, 69, 6);
insert into registro values(null, sysdate(), 29, 68, 6);
insert into registro values(null, sysdate(), 28, 69, 6);
insert into registro values(null, sysdate(), 29, 68, 6);
insert into registro values(null, sysdate(), 28, 69, 6);

insert into registro values(null, sysdate(), 29, 60, 7);
insert into registro values(null, sysdate(), 29, 69, 7);
insert into registro values(null, sysdate(), 29, 68, 7);
insert into registro values(null, sysdate(), 28, 69, 7);
insert into registro values(null, sysdate(), 29, 68, 7);
insert into registro values(null, sysdate(), 28, 69, 7);

insert into registro values(null, sysdate(), 29, 60, 8);
insert into registro values(null, sysdate(), 29, 69, 8);
insert into registro values(null, sysdate(), 29, 68, 8);
insert into registro values(null, sysdate(), 28, 69, 8);
insert into registro values(null, sysdate(), 29, 68, 8);
insert into registro values(null, sysdate(), 28, 69, 8);

insert into registro values(null, sysdate(), 29, 60, 9);
insert into registro values(null, sysdate(), 29, 69, 9);
insert into registro values(null, sysdate(), 29, 68, 9);
insert into registro values(null, sysdate(), 28, 69, 9);
insert into registro values(null, sysdate(), 29, 68, 9);
insert into registro values(null, sysdate(), 28, 69, 9);

insert into registro values(null, sysdate(), 29, 60, 10);
insert into registro values(null, sysdate(), 29, 69, 10);
insert into registro values(null, sysdate(), 29, 68, 10);
insert into registro values(null, sysdate(), 28, 69, 10);
insert into registro values(null, sysdate(), 29, 68, 10);
insert into registro values(null, sysdate(), 28, 69, 10);

insert into registro values(null, sysdate(), 29, 60, 11);
insert into registro values(null, sysdate(), 29, 69, 11);
insert into registro values(null, sysdate(), 29, 68, 11);
insert into registro values(null, sysdate(), 28, 69, 11);
insert into registro values(null, sysdate(), 29, 68, 11);
insert into registro values(null, sysdate(), 28, 69, 11);

insert into registro values(null, sysdate(), 29, 60, 12);
insert into registro values(null, sysdate(), 29, 69, 12);
insert into registro values(null, sysdate(), 29, 68, 12);
insert into registro values(null, sysdate(), 28, 69, 12);
insert into registro values(null, sysdate(), 29, 68, 12);
insert into registro values(null, sysdate(), 28, 69, 12);

insert into registro values(null, sysdate(), 29, 60, 13);
insert into registro values(null, sysdate(), 29, 69, 13);
insert into registro values(null, sysdate(), 29, 68, 13);
insert into registro values(null, sysdate(), 28, 69, 13);
insert into registro values(null, sysdate(), 29, 68, 13);
insert into registro values(null, sysdate(), 28, 69, 13);

insert into registro values(null, sysdate(), 29, 60, 14);
insert into registro values(null, sysdate(), 29, 69, 14);
insert into registro values(null, sysdate(), 29, 68, 14);
insert into registro values(null, sysdate(), 28, 69, 14);
insert into registro values(null, sysdate(), 29, 68, 14);
insert into registro values(null, sysdate(), 28, 69, 14);

insert into registro values(null, sysdate(), 29, 60, 15);
insert into registro values(null, sysdate(), 29, 69, 15);
insert into registro values(null, sysdate(), 29, 68, 15);
insert into registro values(null, sysdate(), 28, 69, 15);
insert into registro values(null, sysdate(), 29, 68, 15);
insert into registro values(null, sysdate(), 28, 69, 15);

insert into registro values(null, sysdate(), 29, 60, 16);
insert into registro values(null, sysdate(), 29, 69, 16);
insert into registro values(null, sysdate(), 29, 68, 16);
insert into registro values(null, sysdate(), 28, 69, 16);
insert into registro values(null, sysdate(), 29, 68, 16);
insert into registro values(null, sysdate(), 28, 69, 16);
