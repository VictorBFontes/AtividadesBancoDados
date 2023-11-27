create database db_clinica;
use db_clinica;

create table tb_medico(
	pk_id_medico int not null primary key auto_increment,
    nome_medico varchar(45) not null,
    telefone_medico varchar(9) not null unique
);

create table tb_paciente(
	pk_id_paciente int not null primary key auto_increment,
    nome_paciente varchar(45) not null,
    telefone_paciente varchar(9) not null unique,
    convenio varchar(45)
);

create table tb_receitaMedica(
	pk_id_receitaMedica int not null primary key auto_increment,
    descricao varchar(500)
);

create table tb_consulta(
	pk_id_consulta int not null primary key auto_increment,
    data_consulta datetime not null,
    fk_medico int not null,
    fk_paciente int not null,
    fk_receitaMedica int not null,
    
    foreign key(fk_medico) references tb_medico(pk_id_medico),
    foreign key(fk_paciente) references tb_paciente(pk_id_paciente),
    foreign key(fk_receitaMedica) references tb_receitaMedica(pk_id_receitaMedica)
);