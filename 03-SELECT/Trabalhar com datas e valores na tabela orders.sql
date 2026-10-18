-- Valores únicos DISTINCT

SELECT DISTINCT country
FROM customers;

-- Ordenação de dados ORDER BY DESC

SELECT *
FROM customers
ORDER BY score DESC;

-- Limitação de resultados TOP + ORDER BY

SELECT TOP 3 *
FROM customers
ORDER BY score DESC;

-- Trabalhar com datas e valores na tabela orders
-- Lista os pedidos realizados a partir de 1 de fevereiro de 2026:
SELECT *
FROM orders
WHERE order_date >= '2026-02-01';

-- Lista os pedidos com o valor total superior ou igual a 200

SELECT *
FROM orders
WHERE total_amount >= 200
ORDER BY total_amount DESC;

-- Consultar execução da tabela

EXEC sp_help 'orders';