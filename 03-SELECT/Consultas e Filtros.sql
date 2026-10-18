-- Consultas e Filtros

-- Consulta geral
SELECT * FROM customers;

-- Colunas específicas
SELECT first_name, country
FROM customers;

-- Filtro por texto
SELECT *
FROM customers
WHERE country = 'Brazil';

-- Filtro por número
SELECT *
FROM customers
WHERE score > 700;