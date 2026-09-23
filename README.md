# sesi_bcd_vps01_estoque_loja_2026

## Dicionário de Dados

### Tabela `categoria`

| Campo       | Tipo    | Tamanho | Chave | Nulo | Descrição                         |
| ----------- | ------- | ------: | ----- | ---- | --------------------------------- |
| `id`        | INT     |       — | PK    | Não  | Identificador único da categoria. |
| `nome`      | VARCHAR |     100 | —     | Não  | Nome da categoria do produto.     |
| `descricao` | TEXT    |       — | —     | Sim  | Descrição detalhada da categoria. |

### Tabela `fornecedor`

| Campo           | Tipo    | Tamanho | Chave | Nulo | Descrição                                 |
| --------------- | ------- | ------: | ----- | ---- | ----------------------------------------- |
| `id`            | INT     |       — | PK    | Não  | Identificador único do fornecedor.        |
| `razao_social`  | VARCHAR |      50 | —     | Não  | Razão social da empresa fornecedora.      |
| `nome_fantasia` | VARCHAR |      50 | —     | Não  | Nome comercial utilizado pelo fornecedor. |
| `cnpj`          | VARCHAR |      20 | —     | Não  | CNPJ do fornecedor.                       |
| `telefone`      | VARCHAR |      16 | —     | Não  | Telefone de contato do fornecedor.        |
| `email`         | VARCHAR |      50 | —     | Não  | E-mail de contato do fornecedor.          |
| `endereco`      | VARCHAR |     100 | —     | Não  | Endereço do fornecedor.                   |

### Tabela `produto`

| Campo           | Tipo    | Tamanho | Chave | Nulo | Descrição                                             |
| --------------- | ------- | ------: | ----- | ---- | ----------------------------------------------------- |
| `id`            | INT     |       — | PK    | Não  | Identificador único do produto.                       |
| `nome`          | VARCHAR |     100 | —     | Não  | Nome do produto.                                      |
| `descricao`     | VARCHAR |     200 | —     | Sim  | Descrição do produto.                                 |
| `preco`         | DECIMAL |    10,2 | —     | Não  | Preço de venda do produto.                            |
| `marca`         | VARCHAR |      50 | —     | Não  | Marca ou fabricante do produto.                       |
| `id_categoria`  | INT     |       — | FK    | Não  | Identificador da categoria à qual o produto pertence. |
| `id_fornecedor` | INT     |       — | FK    | Não  | Identificador do fornecedor responsável pelo produto. |

### Tabela `estoque`

| Campo               | Tipo    | Tamanho | Chave | Nulo | Descrição                                                    |
| ------------------- | ------- | ------: | ----- | ---- | ------------------------------------------------------------ |
| `id_estoque`        | INT     |       — | PK    | Não  | Identificador único do registro de estoque.                  |
| `id_produto`        | INT     |       — | FK    | Não  | Identificador do produto armazenado no estoque.              |
| `quantidade`        | INT     |       — | —     | Não  | Quantidade atual disponível do produto.                      |
| `quantidade_minima` | INT     |       — | —     | Não  | Quantidade mínima desejada para manter o produto em estoque. |
| `localizacao`       | VARCHAR |      50 | —     | Não  | Local onde o produto está armazenado.                        |

### Tabela `movimentacao`

| Campo             | Tipo |       Tamanho | Chave | Nulo | Descrição                                                             |
| ----------------- | ---- | ------------: | ----- | ---- | --------------------------------------------------------------------- |
| `id_movimentacao` | INT  |             — | PK    | Não  | Identificador único da movimentação.                                  |
| `id_produto`      | INT  |             — | FK    | Não  | Identificador do produto movimentado.                                 |
| `tipo`            | ENUM | ENTRADA/SAIDA | —     | Não  | Indica se a movimentação representa uma entrada ou saída de produtos. |
| `quantidade`      | INT  |             — | —     | Não  | Quantidade de produtos movimentados.                                  |
| `data`            | DATE |             — | —     | Não  | Data em que a movimentação foi registrada.                            |

### Relacionamentos

| Tabela origem  | Campo           | Tabela relacionada | Campo relacionado | Relacionamento          |
| -------------- | --------------- | ------------------ | ----------------- | ----------------------- |
| `produto`      | `id_categoria`  | `categoria`        | `id`              | Categoria → Produtos    |
| `produto`      | `id_fornecedor` | `fornecedor`       | `id`              | Fornecedor → Produtos   |
| `estoque`      | `id_produto`    | `produto`          | `id`              | Produto → Estoque       |
| `movimentacao` | `id_produto`    | `produto`          | `id`              | Produto → Movimentações |

### Legenda

* **PK (Primary Key):** chave primária que identifica cada registro de forma única.
* **FK (Foreign Key):** chave estrangeira utilizada para relacionar tabelas.
* **Não nulo:** o campo deve obrigatoriamente receber um valor.
* **Nulo:** o campo pode ficar sem valor.
* **AUTO_INCREMENT:** o banco gera automaticamente o próximo identificador.
