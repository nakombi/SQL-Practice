-- Mantenção e segurança
-- Criar a tabela e inserir os dados

CREATE TABLE staging_test (
    id INT,
    descricao VARCHAR(100)
);

-- Inserir registos de teste

INSERT INTO staging_test (id, descricao) VALUES
(1, 'Teste um'),
(2, 'Teste dois'),
(3, 'Teste três');

-- Testar o DELETE
DELETE FROM staging_test WHERE id = 1;

SELECT * FROM staging_test;

-- Testar Truncate
TRUNCATE TABLE staging_test;

SELECT * FROM staging_test;

-- DROP TABLE

DROP TABLE staging_test;

SELECT * FROM staging_test;