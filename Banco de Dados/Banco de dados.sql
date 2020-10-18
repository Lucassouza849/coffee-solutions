create table empresa (
idEmpresa int primary key auto_increment,
razaoSocial varchar(100) not null,
cnpj char(18) not null,
email varchar(100) not null,
fkUsuario int,
fkTelefone int,
fkEndereco int,
fkSensor int
);

create table endereco (
idEndereco int primary key auto_increment,
cep char(9) not null,
estado char(2) not null,
cidade varchar(100) not null,
bairro varchar(100) not null,
logradouro varchar(100) not null,
numero varchar(10) not null
);

create table telefone (
idTelefone int primary key auto_increment,
numero varchar(20) not null,
tipo varchar(5) not null,
check (tipo = "fixo" or "movel")
);

create table usuario (
idUsuario int primary key auto_increment,
login varchar(20) not null,
senha varchar(20) not null,
email varchar(50) not null
);

create table sensor (
idSensor int primary key auto_increment,
tipo varchar(45) not null,
statusSensor varchar(10) not null,
check (statusSensor = "ativo" or "inativo" or "manutencao"),
fkRegistro int
);

create table localSensor (
idLocal int primary key auto_increment,
quadrante varchar(100) not null,
fkSensor int
);

create table registro (
idRegistro int primary key auto_increment,
datahora datetime not null,
valor decimal(3,1) not null,
check (valor <= 100 and valor >= 0),
medicao varchar(2) not null,
check (valor = "%" or "°C")
);