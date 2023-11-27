create database DB_CDS;
use DB_CDS;

/*--------------------------------------------tabela artista--------------------------------------------*/

create table TB_artista(
Cod_Art int primary key not null auto_increment,
Nome_Art varchar(100) not null unique key
);

desc TB_artista;
select * from TB_artista;
drop table TB_artista;

insert into TB_artista
(Nome_Art) value
('Rihanna'),
('Lady Gaga'),
('Katy Perry'),
('Jão');

/*--------------------------------------------tabela gravadora--------------------------------------------*/

create table TB_gravadora(
Cod_Grav int primary key not null auto_increment,
Nome_Grav varchar(100) not null unique key
);

desc TB_gravadora;
select * from TB_gravadora;

insert into TB_gravadora
(Nome_Grav) value
('Som Livre'),
('Sony Music'),
('Universal Music'),
('Warner Music');

/*--------------------------------------------tabela categoria--------------------------------------------*/

create table TB_categoria(
Cod_Cat int primary key not null auto_increment,
Nome_Cat varchar(50) not null unique key
);

desc TB_categoria;
select * from TB_categoria;

insert into TB_categoria
(Nome_Cat) value
('Sertanejo'),
('Pop'),
('Rock'),
('eletronico');

/*--------------------------------------------tabela estado--------------------------------------------*/

create table TB_estado(
sigla_est char(2) not null primary key,
nome_est char(50) not null unique
);

desc TB_estado;
select * from TB_estado;
drop table TB_estado;

insert into TB_estado
(sigla_est, nome_est) value
('MG', 'Minas Gerais'),
('SP', 'São Paulo'),
('BA', 'Bahia'),
('RJ', 'Rio de Janeiro');

/*--------------------------------------------tabela cidade--------------------------------------------*/

create table TB_cidade(
cod_cid int not null primary key auto_increment
);

alter table TB_cidade add column FK_sigla_est char(2);
alter table TB_cidade add column nome_cid varchar(100) not null;

alter table TB_cidade
add constraint FK_sigla_est
foreign key (FK_sigla_est) references TB_estado(sigla_est);

desc TB_cidade;
select * from TB_cidade;
drop table TB_cidade;

insert into TB_cidade
(nome_cid) value
('Porto Seguro'),
('Franco da Rocha'),
('Belo Horizonte'),
('Niterói');

start transaction;
rollback;

update TB_cidade
set FK_sigla_est = 'RJ'
where nome_cid = 'Niterói';

select * from TB_cidade;

select TB_cidade.nome_cid, TB_estado.sigla_est
from TB_cidade join TB_estado
on TB_estado.sigla_est = TB_cidade.FK_sigla_est;

/*--------------------------------------------tabela cliente--------------------------------------------*/

create table TB_cliente(
cod_cli int not null primary key auto_increment,
nome_cli varchar(100) not null,
end_cli varchar(200) not null,
renda_cli  decimal(10,2) not null check (renda_cli >=0) default 0,
sexo_cli char(1) not null check (sexo_cli in ('F', 'M')) default 'F'
);

alter table TB_cliente add column FK_cod_cid int;
alter table TB_cliente add column nome_cli varchar(100) not null;
alter table TB_cliente add column end_cli varchar(200) not null;
alter table TB_cliente add column renda_cli decimal(10,2) not null check (renda_cli >=0);/*averigua se o valor inserido é superior a 0*/
alter table TB_cliente alter renda_cli set default 0;
alter table TB_cliente add column sexo_cli char(1) not null check (sexo_cli in ('F', 'M'));  /*aceita apenas os valores F ou M*/
alter table TB_cliente alter sexo_cli set default 'F';
alter table TB_cliente alter FK_cod_cid set default 1;

alter table TB_cliente
add constraint FK_cod_cid
foreign key (FK_cod_cid) references TB_cidade (cod_cid);

start transaction;
rollback;

desc TB_cliente;
select * from TB_cliente;
drop table TB_cliente;

insert into TB_cliente
(nome_cli, end_cli, renda_cli, sexo_cli) value
('Robervina', 'rua dos torto, 56 - Vila doidera, Carapiqininha- São Paulo', 4650.00, 'F'),
('Gerigonço da Silva', 'Avenida paraguai, 987 - Morro do Equador, Romanópolis - Rio de Janeiro', '2500.00', 'M'),
('flobernildo Silvestre da Fonseca', 'Rua Jurupinengua, 44 - Vilate sézamo, Banacaxera - Bahia', '3000.00', 'M'),
('Vilson Xucrévson', 'Travessa Julinho Golbsvelto Cunha, 356 - Perdigo Fernando, Minas Gerais', 1780.00, 'M');

start transaction;
rollback;

update TB_cliente
set FK_cod_cid = 4
where nome_cli = 'Vilson Xucrévson';

select TB_cliente.nome_cli, TB_cliente.end_cli, TB_cidade.cod_cid
from TB_cliente join TB_cidade
on TB_cidade.cod_cid = TB_cliente.FK_cod_cid;

/*--------------------------------------------tabela conjuge--------------------------------------------*/

create table TB_conjuge(
PK_cod_cli int not null auto_increment,
nome_conj varchar(100) not null,
renda_conj decimal (10,2) not null check (renda_conj >=0) default 0,
sexo_conj char(1) not null check (sexo_conj in('F', 'M')) default 'M',
primary key (PK_cod_cli),
foreign key (PK_cod_cli) references TB_cliente(cod_cli)
);


desc TB_conjuge;
select * from TB_conjuge;

insert into TB_conjuge
(nome_conj, renda_conj, sexo_conj) value
('xubireno silvio', 2000.89, 'M'),
('xubirena silvia', 2000.89, 'F'),
('glesis valda', 2000.89, 'F'),
('fuliciano baloni', 2000.89, 'M');

select TB_conjuge.nome_conj, TB_conjuge.sexo_conj, TB_cliente.nome_cli
from TB_conjuge join TB_cliente
on TB_cliente.cod_cli = TB_conjuge.PK_cod_cli;

/*--------------------------------------------tabela funcionario--------------------------------------------*/

create table TB_funcionario(
cod_func int primary key not null auto_increment,
nome_func varchar(100) not null,
end_func varchar(200) not null,
sal_func decimal(10,2) not null check (sal_func >=0) default 0,
sexo_func char(1) not null check(sexo_func in('F', 'M')) default 'M'
);

desc TB_funcionario;
select * from TB_funcionario;

insert into TB_funcionario
(nome_func, end_func, sal_func, sexo_func) value
('xubireno silvio', 'aaaaaaaa, 34 - vvvvvv, ccccc', 2000.89, 'M'),
('xubireno silvio', 'aaaaaaaa, 34 - vvvvvv, ccccc', 2000.89, 'M'),
('xubire silia', 'aaaaaaaa, 34 - vvvvvv, ccccc', 2000.89, 'F'),
('gleici', 'aaaaaaaa, 34 - vvvvvv, ccccc', 2000.89, 'F');

/*--------------------------------------------tabela dependente--------------------------------------------*/

create table TB_dependente(
cod_dep int primary key not null auto_increment,
cod_func int,
nome_dep varchar(100) not null,
sexo_dep char(1) not null check (sexo_dep in ('F', 'M')),
foreign key (cod_func) references TB_funcionario(cod_func)
);

start transaction;
rollback;

update TB_dependente
set cod_func = 3
where nome_dep = 'hermionda greta';

select TB_dependente.nome_dep, TB_dependente.sexo_dep, TB_funcionario.nome_func
from TB_dependente join TB_funcionario
on TB_funcionario.cod_func = TB_dependente.cod_func;

drop table TB_dependente;

desc TB_dependente;
select * from TB_dependente;


insert into TB_dependente
(nome_dep, sexo_dep) value
('julin silvo', 'M'),
('mourice lapro', 'M'),
('guiliana carmoso', 'F'),
('hermionda greta', 'F');



/*--------------------------------------------tabela titulo--------------------------------------------*/

create table tb_titulo(
cod_tit int primary key not null auto_increment,
cod_cat int,
cod_grav int,
nome_CD varchar(100) unique,
val_CD decimal (10,2) not null check (val_CD >0),
Qtd_estq int not null check (Qtd_estq >=0),
foreign key (cod_cat) references TB_categoria(cod_cat),
foreign key (cod_grav) references TB_gravadora(cod_grav)
);

drop table tb_titulo;
desc tb_titulo;
select * from tb_titulo;

insert into tb_titulo
(nome_CD, val_CD, Qtd_estq) value
('Piratas', 30.50, 1000),
('A Girl Like Me', 44.99, 145),
('One of the Boys', 45.99, 103),
('The Fame', 49.90, 52);

start transaction;
rollback;

update tb_titulo
set cod_grav = 4
where nome_CD = 'One of the Boys';

select tb_titulo.nome_CD, tb_titulo.val_CD, TB_categoria.nome_cat
from tb_titulo join TB_categoria
on TB_categoria.cod_cat = tb_titulo.cod_cat;

select tb_titulo.nome_CD, tb_titulo.val_CD, TB_gravadora.nome_grav
from tb_titulo join TB_gravadora
on TB_gravadora.cod_grav = tb_titulo.cod_grav;

/*--------------------------------------------tabela pedido--------------------------------------------*/

create table tb_pedido(
num_ped int not null primary key auto_increment,
cod_cli int,
cod_func int,
data_ped datetime(4) not null,
val_ped decimal (10,2) not null check (val_ped >=0) default 0
);

alter table tb_pedido
add foreign key (cod_cli) references TB_cliente (cod_cli);

alter table tb_pedido
add foreign key (cod_func) references TB_funcionario (cod_func);

desc tb_pedido;
select * from tb_pedido;

insert into tb_pedido
(data_ped, val_ped) value
('2023-09-15 13:40:25', 32.50),
('2023-06-28 15:28:53', 45.50),
('2022-04-02 09:10:39', 50.45),
('2022-08-21 16:50:12', 30.50); 

start transaction;
rollback;

update tb_pedido
set cod_func = 1
where val_ped = 32.50;

select tb_pedido.data_ped, tb_pedido.val_ped, TB_cliente.nome_cli
from tb_pedido join TB_cliente
on TB_cliente.cod_cli = tb_pedido.cod_cli;

select tb_pedido.data_ped, tb_pedido.val_ped, TB_funcionario.nome_func
from tb_pedido join TB_funcionario
on TB_funcionario.cod_func = tb_pedido.cod_func;

/*--------------------------------------------tabela titulo pedido--------------------------------------------*/

create table tb_tituloPedido(
num_ped int not null auto_increment,
cod_tit int not null,
qtd_CD int not null check (qtd_CD >=1),
val_CD decimal (10,2) not null check (val_CD >0),
constraint primary key (num_ped, cod_tit),
foreign key (num_ped) references tb_pedido (num_ped),
foreign key (cod_tit) references tb_titulo (cod_tit)
);

desc tb_tituloPedido;
select * from tb_tituloPedido;

select tb_tituloPedido.qtd_CD, tb_tituloPedido.val_CD, tb_pedido.data_ped
from tb_tituloPedido join tb_pedido
on tb_pedido.num_ped = tb_tituloPedido.num_ped;



insert into tb_tituloPedido
(cod_tit, qtd_CD, val_CD) value
(1, 2, 30.50),
(2, 5, 45.00),
(3, 1, 22.49),
(4, 3, 33.99);

/*--------------------------------------------tabela titulo artista-------------------------------------------*/

create table tb_tituloArtista(
cod_tit int not null auto_increment,
cod_art int not null,
constraint primary key (cod_tit, cod_art),
foreign key (cod_tit) references tb_titulo(cod_tit),
foreign key (cod_art) references tb_Artista(cod_art)
);

desc tb_tituloArtista;
select * from tb_tituloArtista;

insert into tb_tituloArtista
(cod_art) value
(1),
(2),
(3),
(4);

select tb_tituloArtista.cod_art, tb_Artista.nome_art
from tb_tituloArtista join tb_Artista
on tb_Artista.cod_art = tb_tituloArtista.cod_art;

select tb_tituloArtista.cod_tit, tb_titulo.nome_CD
from tb_tituloArtista join tb_titulo
on tb_titulo.cod_tit= tb_tituloArtista.cod_tit;