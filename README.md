# SQL-Practice

Repositório de estudo de SQL com foco em Engenharia de Dados.

- **Banco:** SQL Server Express (T-SQL), usando o SSMS
- **Banco de testes:** `SQL_Practice_Store`
- **Tabelas:** `customers`, `orders`, `employees`, `customers_backup`, `clientes_estoria`, `vendas_ecommerce`

## Estrutura

| Pasta | Conteúdo |
|---|---|
| `01-DDL/` | `CREATE TABLE`, `ALTER TABLE`, `DROP TABLE`, chaves primárias e estrangeiras |
| `02-DML/` | `INSERT`, `UPDATE`, `DELETE`, `INSERT INTO ... SELECT` |
| `03-SELECT/` | `SELECT`, `WHERE`, `DISTINCT`, `ORDER BY`, `TOP` |
| `04-AGGREGATIONS/` | `SUM`, `COUNT`, `AVG`, `MIN`, `MAX`, `GROUP BY`, `HAVING` |
| `05-TRANSACTIONS/` | `BEGIN TRAN`, `ROLLBACK`, `COMMIT`, `DELETE` x `TRUNCATE` x `DROP` |

## Progresso

- [x] Nível 1: DDL (tabelas, tipos, `NOT NULL`, chave primária)
- [x] Nível 2: DML (inserir, atualizar, apagar com segurança, cópia de dados)
- [x] Nível 3: consultas e filtros
- [x] Nível 4: agregações, `GROUP BY` e `HAVING`
- [x] Nível 5: manutenção e transações
- [x] Semana 2: mini-projeto `vendas_ecommerce`
- [ ] Nível 6: `JOIN` (`INNER`, `LEFT`)
- [ ] Próximos: `CASE WHEN`, `LIKE`/`IN`/`BETWEEN`, subconsultas, CTEs, window functions

## Como usar

1. Abra o SSMS e conecte na instância local.
2. Execute os scripts na ordem das pastas.
3. Selecione apenas o bloco que quer rodar antes de clicar em Executar.

## Regras de ouro

- Antes de um `UPDATE` ou `DELETE`, rode um `SELECT` com o mesmo `WHERE`.
- Em dados importantes, use `BEGIN TRAN` e confira antes do `COMMIT`.
- Os scripts de `DELETE` e `DROP` são para o ambiente de estudo.
