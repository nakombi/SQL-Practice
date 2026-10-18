-- Desafio Engenharia de Dados, movimentação e cópia de cargas entre tabelas
-- Criando tabela
CREATE TABLE customers_backup (
    customer_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    country VARCHAR(50) NULL,
    score INT NULL,
    CONSTRAINT PK_customers_backup PRIMARY KEY (customer_id)
);

-- Copiando Clientes
INSERT INTO customers_backup (customer_id, first_name, country, score)
SELECT customer_id, first_name, country, score
FROM customers
WHERE country = 'Brazil';

SELECT * FROM customers_backup;