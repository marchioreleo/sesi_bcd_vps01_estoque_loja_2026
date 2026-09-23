# SESI BCD VPS01 — Estoque de uma Loja

## 📦 Tema: Estoque de uma Loja

Este projeto apresenta um banco de dados para gerenciamento do estoque de uma loja de roupas.

O sistema permite controlar produtos, categorias, fornecedores, quantidade disponível em estoque e movimentações de entrada e saída de mercadorias.

O banco de dados foi desenvolvido utilizando **MySQL**, com o uso de chaves primárias e estrangeiras para estabelecer os relacionamentos entre as entidades.

---

## 🧩 MER/DER Conceitual

O modelo conceitual representa as principais entidades do sistema, seus atributos, relacionamentos e cardinalidades.

![MER/DER Conceitual](MER_DER_Conceitual.png)

### Relacionamentos

- **Fornecedor 1:N Produto** — um fornecedor pode fornecer vários produtos.
- **Categoria 1:N Produto** — uma categoria pode classificar vários produtos.
- **Produto 1:N Estoque** — conforme o DDL atual, um produto pode estar associado a vários registros de estoque.
- **Produto 1:N Movimentação** — um produto pode possuir várias movimentações de estoque.

> No MER conceitual, as chaves estrangeiras não são representadas como atributos, pois os relacionamentos representam essas associações.

---

## 🗃️ MER/DER Lógico

O modelo lógico apresenta as tabelas, atributos, chaves primárias (PK) e chaves estrangeiras (FK).

![MER/DER Lógico](MER_DER_Logico.png)

---

# 📖 Dicionário de Dados

| **Entidade** | **Atributo** | **Tipo** | **Tamanho** | **Descrição** |
|---|---|---|---|---|
| Categoria | id | Inteiro | 11 | Identificador da categoria, PK, auto incrementável |
| Categoria | nome | Texto | 100 | Nome da categoria |
| Categoria | descricao | Texto | — | Descrição da categoria |
| Fornecedor | id | Inteiro | 11 | Identificador do fornecedor, PK, auto incrementável |
| Fornecedor | razao_social | Texto | 50 | Razão social do fornecedor |
| Fornecedor | nome_fantasia | Texto | 50 | Nome fantasia do fornecedor |
| Fornecedor | cnpj | Texto | 20 | CNPJ do fornecedor |
| Fornecedor | telefone | Texto | 16 | Telefone do fornecedor |
| Fornecedor | email | Texto | 50 | E-mail do fornecedor |
| Fornecedor | endereco | Texto | 100 | Endereço do fornecedor |
| Produto | id | Inteiro | 11 | Identificador do produto, PK, auto incrementável |
| Produto | nome | Texto | 100 | Nome do produto |
| Produto | descricao | Texto | 200 | Descrição do produto |
| Produto | preco | Decimal | 10,2 | Preço do produto |
| Produto | marca | Texto | 50 | Marca do produto |
| Produto | id_categoria | Inteiro | 11 | Identificador da categoria, FK referenciando Categoria (id) |
| Produto | id_fornecedor | Inteiro | 11 | Identificador do fornecedor, FK referenciando Fornecedor (id) |
| Estoque | id_estoque | Inteiro | 11 | Identificador do estoque, PK, auto incrementável |
| Estoque | id_produto | Inteiro | 11 | Identificador do produto, FK referenciando Produto (id) |
| Estoque | quantidade | Inteiro | 11 | Quantidade disponível em estoque |
| Estoque | quantidade_minima | Inteiro | 11 | Quantidade mínima para controle do estoque |
| Estoque | localizacao | Texto | 50 | Localização do produto no estoque |
| Movimentação | id_movimentacao | Inteiro | 11 | Identificador da movimentação, PK, auto incrementável |
| Movimentação | id_produto | Inteiro | 11 | Identificador do produto, FK referenciando Produto (id) |
| Movimentação | tipo | ENUM | ENTRADA/SAIDA | Tipo da movimentação |
| Movimentação | quantidade | Inteiro | 11 | Quantidade de produtos movimentados |
| Movimentação | data | Data/Hora | — | Data e hora da movimentação |

---

# 📊 Dados de Teste

Os dados de teste estão disponíveis em arquivos CSV correspondentes às tabelas do banco:

- [📄 categoria.csv](categoria.csv)
- [📄 fornecedor.csv](fornecedor.csv)
- [📄 produto.csv](produto.csv)
- [📄 estoque.csv](estoque.csv)
- [📄 movimentacao.csv](movimentacao.csv)

---

# 🛠️ DDL — Criação do Banco de Dados

O DDL é responsável pela criação do banco de dados, das tabelas, das chaves primárias e dos relacionamentos.

```sql
DROP DATABASE IF EXISTS estoque;

CREATE DATABASE estoque;

USE estoque;

CREATE TABLE categoria(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

CREATE TABLE fornecedor(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    razao_social VARCHAR(50) NOT NULL,
    nome_fantasia VARCHAR(50) NOT NULL,
    cnpj VARCHAR(20) NOT NULL,
    telefone VARCHAR(16) NOT NULL,
    email VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NOT NULL
);

CREATE TABLE produto(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(200),
    preco DECIMAL(10,2) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    id_categoria INT NOT NULL,
    id_fornecedor INT NOT NULL
);

CREATE TABLE estoque(
    id_estoque INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    quantidade_minima INT NOT NULL,
    localizacao VARCHAR(50) NOT NULL
);

CREATE TABLE movimentacao(
    id_movimentacao INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_produto INT NOT NULL,
    tipo ENUM('ENTRADA', 'SAIDA') NOT NULL,
    quantidade INT NOT NULL,
    data DATETIME NOT NULL DEFAULT(CURTIME())
);

ALTER TABLE produto
ADD CONSTRAINT fk_categoria
FOREIGN KEY (id_categoria) REFERENCES categoria(id);

ALTER TABLE produto
ADD CONSTRAINT fk_fornecedor
FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id);

ALTER TABLE estoque
ADD CONSTRAINT fk_estoque_produto
FOREIGN KEY (id_produto) REFERENCES produto(id);

ALTER TABLE movimentacao
ADD CONSTRAINT fk_movimentacao_produto
FOREIGN KEY (id_produto) REFERENCES produto(id);
```

---

# 📝 DML — População do Banco de Dados

O DML insere os dados de teste nas tabelas do banco.

```sql
USE estoque;

INSERT INTO categoria(nome, descricao) VALUES
('Upper body', 'Components of the upper part of an armour'),
('Central piece', 'Components of the central part of an armour'),
('Lower body', 'Components of the lower part of an armour');

INSERT INTO fornecedor(
    razao_social,
    nome_fantasia,
    cnpj,
    telefone,
    email,
    endereco
) VALUES
(
    'Giovanni''s.ltd',
    'Giovanni''s smithy',
    '53.673,123/0001-10',
    '(39)12942-1583',
    'giovannismithy@email.com',
    'Passo dello Stelvio - 1'
),
(
    'Mario''s.ltd',
    'Mario''s little forge',
    '34.145.102/0001-99',
    '(39)81924-1567',
    'mariolittleforge@email.com',
    'Grande Strada delle Dolomiti - 67'
),
(
    'Luigi''s.ltd',
    'Luigi''s shop',
    '42.783.567/0001-45',
    '(39)44128-1532',
    'luigishop@email.com',
    'Strada della Forra - 30'
);

INSERT INTO produto(
    nome,
    descricao,
    preco,
    marca,
    id_categoria,
    id_fornecedor
) VALUES
(
    'Sallet',
    'Italian 15th-century helmet',
    2000.00,
    'Giovanni''s smithy',
    1,
    1
),
(
    'Cuirass',
    'Italian 15th-century main chest armour',
    4000.00,
    'Mario''s little forge',
    2,
    2
),
(
    'Sabaton',
    'Italian 15th-century armoured boots',
    1200.00,
    'Luigi''s shop',
    3,
    3
);

INSERT INTO estoque(
    id_produto,
    quantidade,
    quantidade_minima,
    localizacao
) VALUES
(1, 15, 1, 'Lombardia'),
(2, 7, 1, 'Veneto'),
(3, 20, 1, 'Lombardia');

INSERT INTO movimentacao(
    id_produto,
    tipo,
    quantidade,
    data
) VALUES
(1, 'ENTRADA', 4, CURDATE()),
(2, 'SAIDA', 3, CURDATE()),
(3, 'SAIDA', 6, CURDATE());
```

---

# 💻 Tecnologias Utilizadas

- **MySQL** — criação e gerenciamento do banco de dados.
- **Draw.io / diagrams.net** — criação dos modelos MER/DER.
- **CSV** — armazenamento dos dados de teste.
- **GitHub** — versionamento e entrega do projeto.

---

# 📁 Estrutura do Repositório

```text
sesi_bcd_vps01_tema_2026/
│
├── README.md
├── ddl.sql
├── dml.sql
│
├── MER_DER_Conceitual.png
├── MER_DER_Logico.png
│
├── categoria.csv
├── fornecedor.csv
├── produto.csv
├── estoque.csv
└── movimentacao.csv
```

---

# 📌 Nome do Repositório

```text
sesi_bcd_vps01_tema_2026
```

Projeto desenvolvido para o desafio **Tema 02 — Estoque de uma Loja**.