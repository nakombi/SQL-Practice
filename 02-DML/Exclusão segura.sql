-- Exclusão segura
-- Consulta
SELECT * FROM customers
WHERE score < 600;

-- Execução
DELETE FROM customers
WHERE score < 600;

SELECT * FROM customers;