-- Filtro de agregados (HAVING)

SELECT country, COUNT(*) AS total_clientes
FROM customers
GROUP BY country
HAVING COUNT(*) >= 2;

-- Desafio de fixação
SELECT customer_id, SUM(total_amount) AS total_gasto
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > 350;