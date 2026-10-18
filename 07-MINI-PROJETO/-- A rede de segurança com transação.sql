-- A rede de segurança com transação

BEGIN TRAN;

DELETE FROM vendas_ecommerce;
SELECT * FROM vendas_ecommerce;      -- deve voltar vazio

ROLLBACK;

SELECT * FROM vendas_ecommerce;      -- as 8 vendas de volta