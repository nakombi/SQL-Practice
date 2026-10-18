-- Atualização condicional em massa

UPDATE customers
SET score = 0
WHERE score IS NULL;