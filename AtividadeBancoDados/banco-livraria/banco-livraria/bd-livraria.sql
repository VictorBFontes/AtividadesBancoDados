create database db_livraria;
use db_livraria;

-- tabela livros
create table tb_livro(
	PK_ID_livro int not null primary key auto_increment,
    nome_livro varchar (100),
    genero_livro enum ('romance', 'misterio', 'aventura', 'suspense','comedia','ficcao','policial','biografia'),
    data_publi date,
    capa_livro enum ('roller', 'mole','cartao','parana'),
    valor_livro decimal (10,2),
    rating enum ('otimo','bom', 'regular','ruim','pessimo'),
    fk_id_autor int,
    fk_id_editora int,
    
    foreign key (fk_id_autor) references tb_autor(pk_id_autor), -- chave primária da tabela autor
    foreign key (fk_id_editora) references tb_editora(pk_id_editora) -- chave primária da tabela editora
);

desc tb_livro;

-- adicionando o valor POESIA na coluna gênero livro com o comando modify
alter table tb_livro modify genero_livro enum('romance', 'misterio', 'aventura', 'suspense','comedia','ficcao','policial','biografia', 'poesia');

-- livros da Gillian Flynn
insert into tb_livro(nome_livro, genero_livro, data_publi, capa_livro, valor_livro, rating, fk_id_autor, fk_id_editora) value
('Objetos Cortantes', 'romance', '2006-09-26', 'roller', 69.90, 'regular', 1, 1),
('Lugares Obscuros', 'romance', '2009-05-05', 'cartao', 38.30, 'bom', 1, 1),
('Garota Exemplar', 'romance', '2012-05-24', 'roller', 56.08, 'bom', 1, 1),
('O Adulto', 'suspense', '2015-11-03', 'cartao', 12.52, 'bom', 1, 1);

-- livros do Paulo Coelho
insert into tb_livro(nome_livro, genero_livro, data_publi, capa_livro, valor_livro, rating, fk_id_autor, fk_id_editora) values
('O Alquimista', 'romance', '2017-04-05', 'parana', 40.15, 'otimo', 2, 2),
('Brida', 'ficcao', '2017-07-05', 'roller', 49.90, 'otimo', 2, 2),
('Maktub', 'ficcao', '2018-03-23', 'roller', 37.56, 'regular', 2, 2),
('Veronika Decide Morrer', 'romance','2017-07-12', 'parana', 34.30, 'bom', 2, 2),
('Onze Minutos', 'romance', '2017-07-12', 'roller', 35.92, 'regular', 2, 2);

-- inserção dos livros da Fuvest
insert into tb_livro(nome_livro, genero_livro, data_publi, capa_livro, valor_livro, rating, fk_id_autor, fk_id_editora) values
('Poemas escolhidos', 'poesia', '2011-04-04', 'mole',59.90, 'regular', 3, 3),
('Quincas Borba', 'romance', '2013-07-10', 'roller', 35.92, 'regular', 4, 4),
('Claro Enigma', 'Poesia',  '1951-02-22', 'roller', 30, 'bom', 5 ,5),
('Angustia', 'Romance',  '1936-03-27', 'roller', 30, 'bom', 5 , 5),
('Mayombe', 'Ficcao', '1979-05-27', 'roller', 52.77, 'bom', 6 ,6),
('A Reliquia','Ficcao',  '1887-05-02', 'roller', 30, 'bom', 7 ,7),
('Campo Geral', 'ficcao', '1994-01-21', 'roller', 41.32, 'bom', 9 ,2),
('Romanceiro da Inconfidência', 'poesia', '1935-12-24', 'parana', 79,'regular', 10, 8),
('Nove Noites', 'ficcao', '1994-05-27', 'roller', 44.94, 'regular', 11 , 3);

select * from tb_livro;

-- tabela autor
create table tb_autor(
	pk_id_autor int not null auto_increment primary key,
	nome_autor varchar (100),
	endereco_autor varchar (50),
	pais_origem varchar (50),
    data_nascimento date
);

-- inserção dos autores Gillian Flynn e Paulo  Coelho
insert into tb_autor(nome_autor, endereco_autor, pais_origem, data_nascimento) value
('Gillian Flynn', 'Chicago - EUA', 'EUA', '1971-02-24'),
('Paulo Coelho de Souza', 'Genebra - Suiça', 'Brasil', '1947-08-24');

-- inserção dos autores dos livros da Fuvest
insert into tb_autor(nome_autor, endereco_autor, pais_origem, data_nascimento) value
('Gregório de Matos', 'Recife', 'Brasil', '1636-12-23'),
('Machado de Assis', 'Rio de Janeiro', 'Brasil', '1908-06-21'),
('Carlos Drummond de Andrade', 'Rio de Janeiro', 'Brasil', '1902-10-31'),
('Graciliano Ramos', 'Rio de Janeiro', 'Brasil', '1892-10-27'),
('Eça de Queirós', 'Neuilly-sur-Seine', 'Portugal', '1845-11-25'),
('Pepetela', 'Sao Paulo', 'Angola', '1914-10-29'),
('Guimarães Rosa', 'Rio de Janeiro', 'Brasil', '1908-06-27'),
('Cecília Meireles', 'Rio de Janeiro', 'Brasil', '1901-11-07'),
('Bernardo Carvalho', 'Salvador', 'Brail', '1960-09-05');


select * from tb_autor;

-- tabela editora
create table tb_editora(
	pk_id_editora int primary key not null auto_increment,
	nome_editora varchar(20),
	telefone_editora varchar(20),
	endereco_editora varchar(50)
);

insert into tb_editora (nome_editora, telefone_editora, endereco_editora) value
('Intríseca', '55 21 3206-7400', 'Av. das Américas, 500 - Barra da Tijuca');

insert into tb_editora(nome_editora, telefone_editora, endereco_editora) value
('Paralela', '(11) 3707-3500', 'rua martins luizo, 87');

insert into tb_editora(nome_editora, telefone_editora, endereco_editora) value
('Companhia das Letras', '(11)9111-185', 'rua Launa, 584'),
('Penguin-Companhia', '+351 214676749', 'Rua Alexandre Herculano, Lisboa, Portugal'),
('José Olympio', '(11)9111-185', 'rua Gabriella, 131'),
('Leya', '(11)5517-551', 'rua Pingo, 84'),
('Typographia', '(11)9471-551', 'rua cristal, 98'),
('Editora Global', '11 3277-7999', 'Rua Pirapitingui, 111, Liberdade');


select * from tb_editora;
