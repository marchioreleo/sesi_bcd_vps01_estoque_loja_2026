use estoque;

insert into categoria(nome, descricao) values
("Upper body", "Components of the upper part of an armour"),
("Central piece", "Components of the central part of an armour"),
("Lower body", "Components of the lower part of an armour");

insert into fornecedor(razao_social, nome_fantasia, cnpj, telefone, email, endereco) values
("Giovanni's.ltd", "Giovanni's smithy", "53.673,123/0001-10", "(39)12942-1583", "giovannismithy@email.com", "Passo dello Stelvio - 1"),
("Mario's.ltd", "Mario's little forge", "34.145.102/0001-99", "(39)81924-1567", "mariolittleforge@email.com", "Grande Strada delle Dolomiti - 67"),
("Luigi's.ltd", "Luigi's shop", "42.783.567/0001-45", "(39)44128-1532", "luigishop@email.com", "Strada della Forra - 30");

insert into produto(nome, descricao, preco, marca, id_categoria, id_fornecedor) values
("Sallet", "Italian 15th-century helmet", 2000, "Giovanni's smithy", 1, 1),
("Cuirass", "Italian 15th-century main chest armour", 4000, "Mario's little forge", 1, 2),
("Sabaton", "Italian 15th-century armoured boots", 1200, "Luigi's shop", 3, 3);

insert into estoque(id_estoque, id_produto, quantidade, quantidade_minima, localizacao) values
(1, 1, 15, 1, "Lombardia"),
(2, 2, 7, 1, "Veneto"),
(3, 3, 20, 1, "Lombardia");

insert into movimentacao(id_movimentacao, id_produto, tipo, quantidade) values
(1, 1, "ENTRADA", 4),
(2, 2, "SAIDA", 3),
(3, 3, "SAIDA", 6);
