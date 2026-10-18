/*
============================================================
DESAFIOS DE SQL
Tópicos: Agregações, GROUP BY, HAVING, WHERE e Transações
============================================================

DESAFIO 1 — Total de vendas por categoria
Objetivo:
Calcular o valor total de vendas para cada categoria de produto.

Conceitos: SUM(), GROUP BY.


DESAFIO 2 — Total gasto por cliente
Objetivo:
Calcular o valor total acumulado de compras por cliente,
mostrando apenas aqueles cujo total seja superior a 1000.00.

Conceitos: SUM(), GROUP BY, HAVING.


DESAFIO 3 — Teste de transação e recuperação de dados
Objetivo:
1. Iniciar uma transação com BEGIN TRAN.
2. Excluir todos os registros da tabela de vendas usando DELETE
   sem a cláusula WHERE.
3. Verificar se a tabela ficou vazia.
4. Executar ROLLBACK para recuperar os registros excluídos.

Conceitos: BEGIN TRAN, DELETE, ROLLBACK.

Atenção: execute o teste em um ambiente de treinamento e
confirme que a transação foi revertida corretamente.

============================================================
*/	