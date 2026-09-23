drop database if exists estoque;

create database estoque;

use estoque;

create table categoria(
    id int primary key auto_increment not null,
    nome varchar(100) not null,
    descricao text
);

create table fornecedor(
    id int primary key auto_increment not null,
    razao_social varchar(50) not null,
    nome_fantasia varchar(50) not null,
    cnpj varchar(20) not null,
    telefone varchar(16) not null,
    email varchar(50) not null,
    endereco varchar(100) not null
);

create table produto(
    id int primary key auto_increment not null,
    nome varchar(100) not null,
    descricao varchar(200),
    preco decimal(10,2) not null,
    marca varchar(50) not null,
    id_categoria int not null,
    id_fornecedor int not null
);

create table estoque(
    id_estoque int primary key auto_increment not null,
    id_produto int not null,
    quantidade int not null,
    quantidade_minima int not null,
    localizacao varchar(50) not null
);

create table movimentacao(
    id_movimentacao int primary key auto_increment not null,
    id_produto int not null,
    tipo enum('ENTRADA', 'SAIDA') not null,
    quantidade int not null,
    data datetime not null default(curtime())
);

alter table produto add constraint fk_categoria foreign key (id_categoria) references categoria(id);

alter table produto add constraint fk_fornecedor foreign key (id_fornecedor) references fornecedor(id);

alter table estoque add constraint fk_estoque_produto foreign key (id_produto) references produto(id);

alter table movimentacao add constraint fk_movimentacao_produto foreign key (id_produto) references produto(id);

