/*Incluindo dados de Usuário  */

INSERT INTO USUARIO (login, senha) VALUES ('op1', 'op1');
INSERT INTO USUARIO (login, senha) VALUES ('op2', 'op2');
INSERT INTO USUARIO (login, senha) VALUES ('op3', 'op3');

/*Consultando dados de Usuário  */
SELECT * FROM USUARIO



/*Incluindo dados de Produto  */

INSERT INTO Produto(nome, quantidade_estoque, preco_venda) VALUES ('Banana', '100', '5.00');
INSERT INTO Produto(nome, quantidade_estoque, preco_venda) VALUES ('Laranja', '500', '2.00');
INSERT INTO Produto(nome, quantidade_estoque, preco_venda) VALUES ('Manga', '800', '4.00');
INSERT INTO Produto(nome, quantidade_estoque, preco_venda) VALUES ('Kiwi', '1000', '8.00');
INSERT INTO Produto(nome, quantidade_estoque, preco_venda) VALUES ('Pessego', '600', '7.00');


/*Consultando dados de Produto  */
SELECT * FROM Produto;


/*Incluindo dados de Pessoa*/

INSERT INTO Pessoa(id_Pessoa, nome, logradouro, numero, complemento, bairro, cidade, estado, email, telefone)
VALUES
    (NEXT VALUE FOR PessoaSequence, 'Joao Silva', 'Rua Orucum', '12', 'fundos','Bangu','Rio de Janeiro', 'RJ','joaosilva@riacho.com', '1111-1111'),
    (NEXT VALUE FOR PessoaSequence, 'Maria Souza', 'Rua Banguense', '84', 'Apto 102','Bangu','Rio de Janeiro', 'RJ','maria.souza@riacho.com', '2222-2222'),
    (NEXT VALUE FOR PessoaSequence, 'Janete Brito', 'Rua Flores Brancas', '20', '','Bangu','Rio de Janeiro', 'RJ','janetebrito@riacho.com', '3333-3333'),
    (NEXT VALUE FOR PessoaSequence, 'JJC', 'Av. Rio Branco', '135', '','Centro','Rio de Janeiro', 'RJ','jjc@riacho.com', '2222-1111'),
    (NEXT VALUE FOR PessoaSequence, 'ABC', 'Av. Alm. Pedrosa', '356', 'sala 115','Centro','Rio de Janeiro', 'RJ','abc@riacho.com', '3333-2222'),
    (NEXT VALUE FOR PessoaSequence, 'Frutalicia LTDA', 'Rua Paz', '26', '','Botafogo','Rio de Janeiro', 'RJ','Frutalicia@riacho.com', '4444-1111');


/*Incluindo dados de Pessoa Física*/
	INSERT INTO Pessoa_Fisica(id_Pessoa, cpf) SELECT p.id_Pessoa, '11111111111'
	FROM Pessoa p WHERE p.nome = 'Joao Silva';
	INSERT INTO Pessoa_Fisica(id_Pessoa, cpf) SELECT p.id_Pessoa, '22222222222'
	FROM Pessoa p WHERE p.nome = 'Maria Souza';
	INSERT INTO Pessoa_Fisica(id_Pessoa, cpf) SELECT p.id_Pessoa, '33333333333'
	FROM Pessoa p WHERE p.nome = 'Janete Brito';

/*Incluindo dados de Pessoa Jurídica*/
	INSERT INTO Pessoa_Juridica(id_Pessoa, cnpj) SELECT p.id_Pessoa, '11.111.111/0001-00'
	FROM Pessoa p WHERE p.nome = 'JJC';
	INSERT INTO Pessoa_Juridica(id_Pessoa, cnpj) SELECT p.id_Pessoa, '22.111.122/0001-00'
	FROM Pessoa p WHERE p.nome = 'ABC';
	INSERT INTO Pessoa_Juridica(id_Pessoa, cnpj) SELECT p.id_Pessoa, '11.352.168/0001-00'
	FROM Pessoa p WHERE p.nome = 'Frutalicia LTDA';


/*Consultando dados de Pessoa */

	SELECT
    Pessoa.id_Pessoa,
	nome,
	logradouro,
	numero,
	complemento,
	bairro,
	cidade,
	estado,
	email,
	telefone,
	Pessoa_Fisica.cpf AS documento  
FROM
    Pessoa JOIN Pessoa_Fisica ON Pessoa.id_Pessoa = Pessoa_Fisica.id_Pessoa
UNION ALL
SELECT 
 Pessoa.id_Pessoa,
	nome,
	logradouro,
	numero,
	complemento,
	bairro,
	cidade,
	estado,
	email,
	telefone,
	Pessoa_Juridica.cnpj AS tipo
FROM
    Pessoa JOIN Pessoa_Juridica ON Pessoa.id_Pessoa = Pessoa_Juridica.id_Pessoa



/*Incluindo Movimento de Compra */

INSERT INTO Movimento_Compra(id_Usuario, id_Produto, id_Pessoa, quantidade_comprada, preco_unitario) VALUES (1, 1, 4, 50, 2.00);
INSERT INTO Movimento_Compra(id_Usuario, id_Produto, id_Pessoa, quantidade_comprada, preco_unitario) VALUES (1, 2, 4, 10, 1.00);
INSERT INTO Movimento_Compra(id_Usuario, id_Produto, id_Pessoa, quantidade_comprada, preco_unitario) VALUES (1, 3, 4, 100, 3.00);
INSERT INTO Movimento_Compra(id_Usuario, id_Produto, id_Pessoa, quantidade_comprada, preco_unitario) VALUES (2, 4, 5, 50, 3.00);
INSERT INTO Movimento_Compra(id_Usuario, id_Produto, id_Pessoa, quantidade_comprada, preco_unitario) VALUES (2, 5, 5, 150, 2.00);
INSERT INTO Movimento_Compra(id_Usuario, id_Produto, id_Pessoa, quantidade_comprada, preco_unitario) VALUES (2, 3, 6, 50, 1.00);
INSERT INTO Movimento_Compra(id_Usuario, id_Produto, id_Pessoa, quantidade_comprada, preco_unitario) VALUES (1, 2, 6, 250, 1.00);
INSERT INTO Movimento_Compra(id_Usuario, id_Produto, id_Pessoa, quantidade_comprada, preco_unitario) VALUES (2, 5, 6, 250, 1.00);
INSERT INTO Movimento_Compra(id_Usuario, id_Produto, id_Pessoa, quantidade_comprada, preco_unitario) VALUES (1, 1, 6, 300, 1.00);

/*Consultando Movimento de Compra  */

select * from Movimento_Compra


/*Incluindo Movimento de Venda */

INSERT INTO Movimento_Venda(id_Usuario, id_Produto, id_Pessoa, quantidade_vendida) VALUES (1, 1, 1, 50);
INSERT INTO Movimento_Venda(id_Usuario, id_Produto, id_Pessoa, quantidade_vendida) VALUES (1, 2, 1, 10);
INSERT INTO Movimento_Venda(id_Usuario, id_Produto, id_Pessoa, quantidade_vendida) VALUES (1, 3, 3, 100);
INSERT INTO Movimento_Venda(id_Usuario, id_Produto, id_Pessoa, quantidade_vendida) VALUES (2, 4, 2, 50);
INSERT INTO Movimento_Venda(id_Usuario, id_Produto, id_Pessoa, quantidade_vendida) VALUES (2, 5, 2, 150);
INSERT INTO Movimento_Venda(id_Usuario, id_Produto, id_Pessoa, quantidade_vendida) VALUES (2, 1, 3, 50);
INSERT INTO Movimento_Venda(id_Usuario, id_Produto, id_Pessoa, quantidade_vendida) VALUES (1, 4, 1, 10);
INSERT INTO Movimento_Venda(id_Usuario, id_Produto, id_Pessoa, quantidade_vendida) VALUES (1, 5, 3, 100);
INSERT INTO Movimento_Venda(id_Usuario, id_Produto, id_Pessoa, quantidade_vendida) VALUES (2, 3, 2, 50);
INSERT INTO Movimento_Venda(id_Usuario, id_Produto, id_Pessoa, quantidade_vendida) VALUES (2, 2, 2, 150);


/*Consultando Movimento de Venda */

select * from Movimento_Venda



/*Consultando Todos os movimentos - Venda e Compra*/

SELECT
    id_mov_venda AS id_movimento,
    id_Usuario,
	id_Pessoa,
    Movimento_Venda.id_Produto,
	quantidade_vendida AS quantidade,
	'S' AS tipo,
	produto.preco_venda AS ValorUnitario
  
FROM
    Movimento_Venda JOIN Produto ON Movimento_Venda.id_Produto = Produto.id_Produto 
UNION ALL
SELECT
    id_mov_compra AS id_movimento,
    id_Usuario,
	id_Pessoa,
    Movimento_Compra.id_Produto,
	quantidade_comprada AS quantidade,
	'E' AS tipo,
	preco_unitario AS valorUnitario
FROM
    Movimento_Compra;
 

 /*Efetuar as seguintes consultas sobre os dados inseridos:*/
 /*a.	Dados completos de pessoas físicas.*/

SELECT * FROM Pessoa_Fisica;


 /*b.	Dados completos de pessoas jurídicas.*/

 SELECT * FROM Pessoa_Juridica;


/*3. Movimentações de entrada, com produto, fornecedor, quantidade, preço unitário e valor total.*/

  SELECT id_Produto, id_Pessoa AS FORNECEDOR, 
  quantidade_comprada AS QUANTIDADE, 
  preco_unitario AS PRECO_UNITARIO, 
  preco_unitario * quantidade_comprada AS TOTAL 
  FROM Movimento_Compra

  /* - Alterando IDs por nome */



SELECT Produto.nome AS PRODUTO, 
Pessoa.nome AS FORNECEDOR, 
quantidade_comprada AS QUANTIDADE, 
preco_unitario AS PRECO_UNITARIO,
preco_unitario * quantidade_comprada  AS TOTAL 
FROM Movimento_Compra 
JOIN Produto ON Movimento_Compra.id_Produto = Produto.id_Produto
JOIN Pessoa ON Movimento_Compra.id_Pessoa = Pessoa.id_Pessoa




/*4. Movimentações de saída, com produto, comprador, quantidade, preço unitário e valor total.*/

SELECT Movimento_Venda.id_Produto, id_Pessoa AS COMPRADOR, 
quantidade_vendida AS QUANTIDADE, 
Produto.preco_venda AS PRECO_UNITARIO, Produto.preco_venda * quantidade_vendida AS TOTAL 
FROM Movimento_Venda
JOIN PRODUTO ON Movimento_Venda.id_Produto = Produto.id_Produto


/* - Alterando IDs por nome */

SELECT produto.nome, pessoa.nome AS COMPRADOR, 
quantidade_vendida AS QUANTIDADE, 
Produto.preco_venda AS PRECO_UNITARIO, 
Produto.preco_venda * quantidade_vendida AS TOTAL 
FROM Movimento_Venda
JOIN PRODUTO ON Movimento_Venda.id_Produto = Produto.id_Produto
JOIN Pessoa ON Movimento_venda.id_Pessoa = Pessoa.id_pessoa



/*b.	Valor total das entradas agrupadas por produto.*/

SELECT Produto.nome, 
SUM(quantidade_comprada) AS QUANTIDADE, 
Produto.preco_venda AS PRECO_UNITARIO, 
SUM(Produto.preco_venda) * SUM(quantidade_comprada) AS TOTAL 
FROM Movimento_Compra
JOIN Produto ON Movimento_Compra.id_Produto = Produto.id_Produto

GROUP BY Produto.nome,  Produto.preco_venda;



/*c.	Valor total das saídas agrupadas por produto.*/

SELECT  Produto.nome, 
SUM(quantidade_vendida) AS QUANTIDADE, 
Produto.preco_venda AS PRECO_UNITARIO, 
SUM(Produto.preco_venda) * SUM(quantidade_vendida) AS TOTAL 
FROM Movimento_Venda
JOIN Produto ON Movimento_Venda.id_Produto = Produto.id_Produto
GROUP BY  Produto.nome, Produto.preco_venda;


/*d.	Operadores que não efetuaram movimentações de entrada (compra).*/

SELECT login FROM Usuario 
WHERE id_Usuario NOT IN (SELECT id_Usuario FROM Movimento_Compra)


/*e.	Valor total de entrada, agrupado por operador.*/

SELECT Usuario.login AS OPERADOR, sum(preco_unitario) * sum(quantidade_comprada) AS TOTAL 
FROM Movimento_Compra 
JOIN Usuario ON Movimento_Compra.id_Usuario = Usuario.id_Usuario
GROUP BY Usuario.login;



/*f. Valor total de saída, agrupado por operador.*/

SELECT Usuario.login AS OPERADOR, sum(Produto.preco_venda) * sum(quantidade_vendida) AS TOTAL 
FROM Movimento_Venda
JOIN Usuario ON Movimento_Venda.id_Usuario = Usuario.id_Usuario
JOIN Produto ON Movimento_Venda.id_Produto = Produto.id_Produto
GROUP BY Usuario.login;


/*g. Valor médio de venda por produto, utilizando média ponderada.*/

SELECT Produto.nome AS PRODUTO,
AVG(Produto.preco_venda * quantidade_vendida) AS Valor_Medio
FROM Movimento_Venda
JOIN Produto ON Movimento_Venda.id_Produto = Produto.id_Produto
GROUP BY Produto.nome;
