# sesi_bcd_vps01_estoque_loja_2026

## Estoque de uma loja VPS01

## Dicionário de dados

| **Entidade** | **Atributo**      | **Tipo** | **Tamanho** | **Descrição**                                                 |
| ------------ | ----------------- | -------- | ----------- | ------------------------------------------------------------- |
| Categoria    | id                | Inteiro  | 11          | Identificador, PK, Auto incrementável                         |
| Categoria    | nome              | Texto    | 100         | Nome da categoria                                             |
| Categoria    | descricao         | Texto    | -           | Descrição da categoria                                        |
| Fornecedor   | id                | Inteiro  | 11          | Identificador, PK, Auto incrementável                         |
| Fornecedor   | razao_social      | Texto    | 50          | Razão social do fornecedor                                    |
| Fornecedor   | nome_fantasia     | Texto    | 50          | Nome fantasia do fornecedor                                   |
| Fornecedor   | cnpj              | Texto    | 20          | CNPJ do fornecedor                                            |
| Fornecedor   | telefone          | Texto    | 16          | Telefone do fornecedor                                        |
| Fornecedor   | email             | Texto    | 50          | E-mail do fornecedor                                          |
| Fornecedor   | endereco          | Texto    | 100         | Endereço completo do fornecedor                               |
| Produto      | id                | Inteiro  | 11          | Identificador, PK, Auto incrementável                         |
| Produto      | nome              | Texto    | 100         | Nome do produto                                               |
| Produto      | descricao         | Texto    | 200         | Descrição do produto                                          |
| Produto      | preco             | Decimal  | 10,2        | Preço do produto                                              |
| Produto      | marca             | Texto    | 50          | Marca do produto                                              |
| Produto      | id_categoria      | Inteiro  | 11          | Identificador da categoria, FK referenciando Categoria (id)   |
| Produto      | id_fornecedor     | Inteiro  | 11          | Identificador do fornecedor, FK referenciando Fornecedor (id) |
| Estoque      | id_estoque        | Inteiro  | 11          | Identificador, PK, Auto incrementável                         |
| Estoque      | id_produto        | Inteiro  | 11          | Identificador do produto, FK referenciando Produto (id)       |
| Estoque      | quantidade        | Inteiro  | 11          | Quantidade disponível em estoque                              |
| Estoque      | quantidade_minima | Inteiro  | 11          | Quantidade mínima para controle de estoque                    |
| Estoque      | localizacao       | Texto    | 50          | Localização do produto no estoque                             |
| Movimentacao | id_movimentacao   | Inteiro  | 11          | Identificador, PK, Auto incrementável                         |
| Movimentacao | id_produto        | Inteiro  | 11          | Identificador do produto, FK referenciando Produto (id)       |
| Movimentacao | tipo              | Texto    | -           | Tipo de movimentação (ENTRADA ou SAIDA)                       |
| Movimentacao | quantidade        | Inteiro  | 11          | Quantidade de produtos movimentados                           |
| Movimentacao | data              | Data     | -           | Data em que a movimentação foi registrada                     |
