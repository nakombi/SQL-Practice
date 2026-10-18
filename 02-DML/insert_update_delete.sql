-- 02-DML: inserir, atualizar e apagar dados
USE SQL_Practice_Store;
GO

-- INSERT simples
INSERT INTO customers (customer_id, first_name, country, score)
VALUES (6, 'Felipe', 'Brazil', 780);

-- INSERT múltiplo (um único comando)
INSERT INTO customers (customer_id, first_name, country, score)
VALUES
    (7, 'Camila', 'Brazil', 650),
    (8, 'Lucas', 'Germany', 420);

-- UPDATE simples (o WHERE é essencial)
UPDATE customers
SET score = 500
WHERE customer_id = 4;

-- UPDATE múltiplo (várias colunas no mesmo SET)
UPDATE customers
SET country = 'Spain',
    score = 600
WHERE customer_id = 2;

-- UPDATE condicional (IS NULL, nunca = NULL)
UPDATE customers
SET score = 0
WHERE score IS NULL;

-- DELETE seguro: consulte antes de excluir
SELECT * FROM customers
WHERE score < 600;

-- Só depois de conferir, execute o DELETE com o mesmo WHERE
-- (execute uma vez, apenas no ambiente de estudo)
DELETE FROM customers
WHERE score < 600;

-- INSERT INTO ... SELECT: copiar dados entre tabelas
INSERT INTO customers_backup (customer_id, first_name, country, score)
SELECT customer_id, first_name, country, score
FROM customers
WHERE country = 'Brazil';

SELECT * FROM customers_backup;

-- Teste de memória: clientes_estoria
INSERT INTO clientes_estoria (customer_id, first_name, country, score)
VALUES
    (1, 'Flavio', 'Brasil Direita', 53),
    (2, 'Lula', 'Brasil Esquerda', 40),
    (3, 'Zema', 'Brasil Liberal', 7);

-- Semana 2: carga de vendas_ecommerce
INSERT INTO vendas_ecommerce (venda_id, cliente_nome, categoria_produto, valor_venda, data_venda) VALUES
(1, 'Ana Silva', 'Eletrônicos', 1500.00, '2026-03-01'),
(2, 'Bruno Souza', 'Livros', 120.50, '2026-03-02'),
(3, 'Carla Dias', 'Eletrônicos', 850.00, '2026-03-05'),
(4, 'Ana Silva', 'Casa e Cozinha', 300.00, '2026-03-10'),
(5, 'Daniel Costa', 'Livros', 75.00, '2026-03-12'),
(6, 'Bruno Souza', 'Eletrônicos', 1200.00, '2026-03-15'),
(7, 'Eva Santos', 'Casa e Cozinha', 450.00, '2026-03-18'),
(8, 'Carla Dias', 'Livros', 210.00, '2026-03-20');
GO
