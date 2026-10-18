SELECT TOP 3 * -- limite do topo + quantos
FROM customers -- qual tabela
WHERE country = 'Brazil' -- filtro do país (texto entre aspas)
ORDER BY score DESC; -- coluna + sentido (do maior para o menor)

SELECT TOP 2 * -- limite do topo + quantos
FROM customers -- qual tabela
WHERE country = 'Brazil' -- filtro do país (texto entre aspas)
ORDER BY score DESC; -- coluna + sentido (do maior para o menor)

SELECT TOP 3 * -- limite do topo + quantos
FROM customers -- qual tabela
WHERE country = 'Brazil' -- filtro do país (texto entre aspas)
ORDER BY score ASC; -- coluna + sentido (do menor para o maior)