-- Funções de agregação (tabela orders)

-- Soma
SELECT SUM(total_amount) AS valor_total_geral
FROM orders;

-- Contagem
SELECT COUNT(*) AS total_pedidos
FROM orders;

-- Média
SELECT AVG(total_amount) AS media_pedidos
FROM orders;

-- Mínimo e máximo
SELECT MIN(total_amount) AS menor_pedido, MAX(total_amount) AS maior_pedido
FROM orders;