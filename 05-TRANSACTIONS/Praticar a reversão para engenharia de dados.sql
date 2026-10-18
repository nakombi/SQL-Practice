-- Praticar a reversão p/ engenharia de dados

BEGIN TRAN;
DELETE FROM staging_test;
SELECT * FROM staging_test;   -- vazia
ROLLBACK;
SELECT * FROM staging_test;   -- os dados voltaram