-- 04-AGGREGATIONS: agregações, GROUP BY e HAVING
USE SQL_Practice_Store;
GO

-- Funções de agregação (tabela orders)
SELECT SUM(total_amount) AS valor_total_geral FROM orders;
SELECT COUNT(*) AS total_pedidos FROM orders;
SELECT AVG(total_amount) AS media_pedidos FROM orders;
SELECT MIN(total_amount) AS menor_pedido, MAX(total_amount) AS maior_pedido FROM orders;

-- Total gasto por cliente
SELECT customer_id, SUM(total_amount) AS total_gasto
FROM orders
GROUP BY customer_id;

-- Clientes por país
SELECT country, COUNT(*) AS total_clientes
FROM customers
GROUP BY country;

-- HAVING: países com pelo menos dois clientes
SELECT country, COUNT(*) AS total_clientes
FROM customers
GROUP BY country
HAVING COUNT(*) >= 2;

-- HAVING: clientes que gastaram mais de 350
SELECT customer_id, SUM(total_amount) AS total_gasto
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > 350;

-- Semana 2, desafio 1: total de vendas por categoria
SELECT categoria_produto, SUM(valor_venda) AS total_vendas
FROM vendas_ecommerce
GROUP BY categoria_produto;

-- Semana 2, desafio 2: clientes com total acima de 1000.00
SELECT cliente_nome, SUM(valor_venda) AS total_gasto
FROM vendas_ecommerce
GROUP BY cliente_nome
HAVING SUM(valor_venda) > 1000.00;
GO
