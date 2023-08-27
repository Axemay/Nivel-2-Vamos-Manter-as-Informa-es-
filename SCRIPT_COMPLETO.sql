create database loja;

use loja;

CREATE SEQUENCE PessoaSequence START WITH 1 INCREMENT BY 1;

CREATE TABLE Pessoa(
    id_Pessoa INTEGER PRIMARY KEY NOT NULL DEFAULT (NEXT VALUE FOR PessoaSequence),
    nome VARCHAR(100) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    numero INTEGER,
    complemento VARCHAR(50),
    bairro VARCHAR(30) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    email VARCHAR(50) NOT NULL,
    telefone VARCHAR(15) NOT NULL
); 

CREATE TABLE Pessoa_Juridica(
    id_Pessoa INTEGER PRIMARY KEY,
    cnpj VARCHAR(25) NOT NULL,
    FOREIGN KEY(id_Pessoa) REFERENCES Pessoa(id_Pessoa)
);


CREATE TABLE Pessoa_Fisica(
    id_Pessoa INTEGER PRIMARY KEY,
    cpf VARCHAR(15) NOT NULL, 
    FOREIGN KEY(id_Pessoa) REFERENCES Pessoa(id_Pessoa)
);

CREATE TABLE Produto(
    id_Produto INTEGER PRIMARY KEY NOT NULL IDENTITY(1,1),
    nome VARCHAR(50) NOT NULL,
    quantidade_estoque INTEGER NOT NULL,
    preco_venda MONEY NOT NULL
);

CREATE TABLE Usuario(
    id_Usuario INTEGER PRIMARY KEY NOT NULL IDENTITY(1,1),
    login VARCHAR(50) NOT NULL,
    senha VARCHAR(10) NOT NULL
);

CREATE TABLE Movimento_Compra(
    id_mov_compra INTEGER PRIMARY KEY NOT NULL IDENTITY(1,1),
    id_Usuario INTEGER NOT NULL,
    id_Produto INTEGER NOT NULL,
    id_Pessoa INTEGER NOT NULL,
    quantidade_comprada INTEGER NOT NULL,
    preco_unitario MONEY NOT NULL,
    FOREIGN KEY(id_Usuario) REFERENCES Usuario(id_Usuario),
    FOREIGN KEY(id_Produto) REFERENCES Produto(id_Produto),
    FOREIGN KEY(id_Pessoa) REFERENCES Pessoa_Juridica(id_Pessoa)
);

CREATE TABLE Movimento_Venda(
    id_mov_venda INTEGER PRIMARY KEY NOT NULL IDENTITY(1,1),
    id_Usuario INTEGER NOT NULL,
    id_Produto INTEGER NOT NULL,
    id_Pessoa INTEGER NOT NULL,
    quantidade_vendida INTEGER NOT NULL,
    FOREIGN KEY(id_Usuario) REFERENCES Usuario(id_Usuario),
    FOREIGN KEY(id_Produto) REFERENCES Produto(id_Produto),
    FOREIGN KEY(id_Pessoa) REFERENCES Pessoa_Fisica(id_Pessoa)
);