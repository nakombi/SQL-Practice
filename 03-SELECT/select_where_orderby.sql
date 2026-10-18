-- 03-SELECT: consultas e filtros
USE SQL_Practice_Store;
GO

-- Consulta geral
SELECT * FROM customers;

-- Colunas específicas
SELECT first_name, country
FROM customers;

-- Filtro por texto (texto entre aspas simples)
SELECT *
FROM customers
WHERE country = 'Brazil';

-- Filtro por número (número sem aspas)
SELECT *
FROM customers
WHERE score > 700;

-- Valores únicos
SELECT DISTINCT country
FROM customers;

-- Ordenação do maior para o menor
SELECT *
FROM customers
ORDER BY score DESC;

-- Os 3 maiores scores (o ORDER BY garante quais linhas voltam)
SELECT TOP 3 *
FROM customers
ORDER BY score DESC;

-- Os 3 melhores clientes do Brasil
SELECT TOP 3 *
FROM customers
WHERE country = 'Brazil'
ORDER BY score DESC;

-- Datas: formato AAAA-MM-DD
SELECT *
FROM orders
WHERE order_date >= '2026-02-01';

-- Valores: pedidos de 200 ou mais, do maior para o menor
SELECT *
FROM orders
WHERE total_amount >= 200
ORDER BY total_amount DESC;
GO
