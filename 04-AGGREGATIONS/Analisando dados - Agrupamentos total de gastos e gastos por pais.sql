-- Agrupamento (GROUP BY)

-- Total gasto por cliente
SELECT customer_id, SUM(total_amount) AS total_gasto
FROM orders
GROUP BY customer_id;

-- Clientes por país
SELECT country, COUNT(*) AS total_clientes
FROM customers
GROUP BY country;