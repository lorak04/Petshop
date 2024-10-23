-- Criando o banco de dados 
create database petshop
character set utf8mb4
collate utf8mb4_unicode_ci;

use petshop;

create table Estoque (
	id_estoque INT auto_increment primary key,
    nome_produto varchar(100) not null, 
    quantidade int not null, 
    preco decimal(10, 2) not null, 
    data_entrada date not null, 
    descricao_produto text
);

create table Clientes (
	id_cliente INT auto_increment primary key,
    nome_cliente varchar(100) not null, 
    telefone varchar(15),
    email varchar(100),
    endereco text, 
    data_registro date not null
);

create table Funcionarios (
	id_funcionario INT auto_increment primary key,
    nome_funcionario varchar(100) not null, 
    telefone varchar(15),
    email varchar(100), 
    cargo varchar(50),
    salario decimal(10, 2),
    data_contratacao date not null
);

create table Servicos (
	id_servico INT auto_increment primary key,
    nome_servico varchar(100) not null, 
    descricao_servico text, 
    preco_servico decimal(10, 2) not null, 
    duracao_estimada time
);

create table Vendas (
	id_venda INT auto_increment primary key,
    data_venda date not null, 
    total decimal(10, 2) not null,
    id_cliente int,
    id_funcionario int
);

create table Agendamento (
	id_agendamento INT auto_increment primary key,
    data_agendamento date not null, 
    horario time not null, 
    observadores text
);

create table Itens_Venda (
	id_item_venda INT auto_increment primary key,
    id_venda int, 
    id_estoque int, 
    quantidade_vendida int not null, 
    preco_unitario decimal(10, 2) not null, 
    constraint fk_itens_venda_venda foreign key (id_venda) references Vendas(id_venda),
    constraint fk_itens_venda_estoque foreign key (id_estoque) references Estoque(id_estoque)
);













