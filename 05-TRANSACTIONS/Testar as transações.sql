-- Testar as transações

-- Recriar a tabela de teste
CREATE TABLE staging_test (
    id INT,
    descricao VARCHAR(100)
);

-- Inserir os registos iniciais
INSERT INTO staging_test (id, descricao) VALUES 
(1, 'Teste um'), 
(2, 'Teste dois'), 
(3, 'Teste três');

-- Iniciar uma transação para testar a segurança com ROLLBACK
BEGIN TRAN;

-- Apagar os dados dentro da transação
DELETE FROM staging_test;

-- Consultar para ver que ficou vazia
SELECT * FROM staging_test; 

-- Voltar atrás (desfazer a exclusão)
ROLLBACK;

-- Consultar novamente para ver que os dados voltaram graças ao ROLLBACK!
SELECT * FROM staging_test;

-- Limpar o ambiente no final (se já não precisares da tabela)
DROP TABLE staging_test;