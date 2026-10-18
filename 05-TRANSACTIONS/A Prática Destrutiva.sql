/* A Prática Destrutiva (Para aprender como o erro funciona)
Faça o teste de quebrar o código propositalmente numa tabela temporária*/

UPDATE clientes_estoria
SET score =0;

SELECT * FROM clientes_estoria;

-- Sem WHERE: altera as 3 linhas
UPDATE clientes_estoria SET score = 0;

-- Com WHERE: altera só 1 linha
UPDATE clientes_estoria SET score = 40 WHERE customer_id = 2,
clientes_estoria SET score = 53 WHERE customer_id = 1,
clientes_estoria SET score = 7 WHERE customer_id = 3;

BEGIN TRAN;

UPDATE clientes_estoria SET score = 0;
SELECT * FROM clientes_estoria;   -- tudo zerado

SELECT * FROM clientes_estoria;
SELECT @@TRANCOUNT;

ROLLBACK;                          -- desfaz tudo