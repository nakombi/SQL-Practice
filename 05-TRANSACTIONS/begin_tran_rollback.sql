-- 05-TRANSACTIONS: transações e comandos de manutenção
USE SQL_Practice_Store;
GO

-- Rede de segurança: DELETE sem WHERE dentro de uma transação
-- Selecione o bloco INTEIRO, do BEGIN TRAN ao último SELECT, antes de executar.
BEGIN TRAN;

DELETE FROM vendas_ecommerce;
SELECT * FROM vendas_ecommerce;   -- deve voltar vazio

ROLLBACK;

SELECT * FROM vendas_ecommerce;   -- as 8 vendas de volta

-- Verificar se há transação aberta (esperado: 0)
SELECT @@TRANCOUNT;

-- Prática destrutiva controlada: UPDATE sem WHERE dentro de uma transação
BEGIN TRAN;

UPDATE clientes_estoria SET score = 0;
SELECT * FROM clientes_estoria;   -- tudo zerado

ROLLBACK;

SELECT * FROM clientes_estoria;   -- scores originais de volta

-- DELETE x TRUNCATE x DROP, em uma tabela de teste
CREATE TABLE staging_test (
    id INT,
    descricao VARCHAR(100)
);

INSERT INTO staging_test (id, descricao) VALUES
(1, 'Teste um'),
(2, 'Teste dois'),
(3, 'Teste três');

DELETE FROM staging_test WHERE id = 1;   -- remove linhas específicas
TRUNCATE TABLE staging_test;             -- esvazia a tabela, mantém a estrutura
DROP TABLE staging_test;                 -- apaga dados e estrutura
GO
