/*
================================================================================
ESTÓRIA 1: O Primeiro Desafio de Dados na Loja do Bairro
================================================================================
Imagina que acabaste de entrar numa empresa de comércio e o teu gestor chega à 
tua mesa com um problema urgente.
— Olá! Nós precisamos de organizar a nossa base de dados de clientes e pedidos, 
mas ela está uma confusão. Podes ajudar-nos?

Tu sorris, abres a tua ferramenta de trabalho, o SQL Server, e decides começar 
pelo alicerce de tudo: a estrutura.
No teu primeiro passo, usas a linguagem de definição de dados, o famoso DDL. 
Com um comando simples chamado CREATE TABLE, tu defines a identidade da tabela, 
dizes quais são as colunas, o tipo de cada informação (como números inteiros ou 
textos) e aplicas regras de segurança, como o NOT NULL para garantir que ninguém 
entra no sistema sem nome, e a PRIMARY KEY, que funciona como o bilhete de 
identidade único de cada registo.

(Pausa curta... respira fundo)

Com a tabela criada, o gestor traz-te novos dados que chegaram por e-mail e 
precisam de ser guardados. É aqui que entras no mundo da manipulação, o DML.
Tu usas o comando INSERT INTO para adicionar os novos clientes um a um ou em lote. 
Mas de repente, reparas que um cliente ficou com o país errado e outro está com 
a pontuação desatualizada. O que fazes? Utilizas o UPDATE combinado com o SET 
para corrigir a informação, tendo sempre o cuidado de usar o WHERE para apontar 
exatamente a linha certa. Sem o WHERE, alterarias a tabela inteira por engano! 
E para apagar o que já não serve, recorres ao DELETE com a mesma cautela, 
consultando primeiro os dados para não perderes nada importante.

(Pausa curta... respira fundo)

Agora que a casa está arrumada e os dados estão corretos, a diretoria da empresa 
aparece com perguntas de negócio. É a altura de usar as consultas, o coração do SELECT.
Tu queres ver tudo? Usas SELECT *. Queres apenas o nome e o país? Especificas 
as colunas separadas por vírgula. Querias filtrar apenas os clientes do Brasil? 
Adicionas o WHERE country = 'Brazil'. Precisas de listar os países sem repetições? 
Colocas um DISTINCT. E se a diretoria te pedir apenas os três melhores clientes? 
Juntas o ORDER BY do maior para o menor com um limite no topo usando o TOP 3.

(Pausa curta... respira fundo)

Mas a diretoria quer ir mais longe. Eles não querem apenas ver linhas; querem 
respostas inteligentes. É aí que entram as agregações e o GROUP BY.
O gestor pergunta: — Qual foi o total faturado por cada cliente?
Tu fechas os olhos e lembras-te da lógica: se vais agrupar por cliente, usas o 
GROUP BY customer_id e aplicas uma função matemática como o SUM(total_amount) 
para somar as vendas de cada um. E se quiseres filtrar o resultado desse agrupamento 
— por exemplo, mostrar apenas os clientes cuja soma ultrapasse um determinado valor 
— tu não podes usar o WHERE. Tens de usar o seu irmão mais velho, o HAVING.

(Pausa curta... respira fundo)

Por fim, antes de ires embora para casa, o teu gestor avisa-te sobre a manutenção 
do sistema. Ele explica-te que se precisares de apagar linhas específicas usas 
o DELETE, mas se o objetivo for esvaziar a tabela inteira num piscar de olhos 
para uma nova carga de dados, o TRUNCATE TABLE é o mais rápido. Contudo, se a 
ordem for destruir a tabela por completo — apagar a estrutura e os dados do mapa —, 
usas o temido DROP TABLE.

Tu fechas o portátil com um sorriso. Em pouco tempo, aprendeste a criar, manipular, 
consultar e analisar dados como um verdadeiro profissional. O teu primeiro dia como 
Engenheiro de Dados foi um sucesso absoluto.
================================================================================
*/


-- =============================================================================
-- QUERY PRÁTICA: Traduzindo a estória para comandos executáveis no SQL Server
-- =============================================================================

-- 1. Criar a base de dados de trabalho (se ainda não existir)
CREATE DATABASE LojaDoBairro;
GO

USE LojaDoBairro;
GO

-- 2. DDL: Criar a tabela de clientes com restrições (PRIMARY KEY e NOT NULL)
CREATE TABLE clientes_estoria (
    customer_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    country VARCHAR(50) NULL,
    score INT NULL,
    CONSTRAINT PK_clientes_estoria PRIMARY KEY (customer_id)
);
GO

-- 3. DML: Inserir novos clientes (em lote)
INSERT INTO clientes_estoria (customer_id, first_name, country, score) VALUES
(1, 'Ana', 'Brazil', 850),
(2, 'Bruno', 'Portugal', 600),
(3, 'Carla', 'Brazil', 720),
(4, 'Daniel', 'USA', 400),
(5, 'Eva', 'Brazil', 910);
GO

-- 4. DML: Corrigir informações com UPDATE e WHERE
UPDATE clientes_estoria
SET country = 'Spain', score = 650
WHERE customer_id = 2;
GO

-- 5. Consultas (SELECT, colunas específicas, WHERE, DISTINCT, TOP e ORDER BY)
-- Ver tudo
SELECT * FROM clientes_estoria;

-- Ver apenas nome e país
SELECT first_name, country FROM clientes_estoria;

-- Filtrar clientes do Brasil
SELECT * FROM clientes_estoria WHERE country = 'Brazil';

-- Listar países sem repetição
SELECT DISTINCT country FROM clientes_estoria;

-- Top 3 clientes com maior pontuação
SELECT TOP 3 * 
FROM clientes_estoria 
ORDER BY score DESC;
GO

-- 6. Análise de Dados: Agregações com GROUP BY e HAVING
-- Simular uma tabela de pedidos para testar o agrupamento e o HAVING
CREATE TABLE pedidos_estoria (
    order_id INT NOT NULL,
    customer_id INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    CONSTRAINT PK_pedidos_estoria PRIMARY KEY (order_id)
);

INSERT INTO pedidos_estoria (order_id, customer_id, total_amount) VALUES
(101, 1, 200.00),
(102, 1, 300.00),
(103, 3, 150.00),
(104, 5, 500.00);

-- Total faturado por cliente usando GROUP BY e SUM
-- Filtrando grupos com o HAVING (soma superior a 200)
SELECT customer_id, SUM(total_amount) AS total_faturado
FROM pedidos_estoria
GROUP BY customer_id
HAVING SUM(total_amount) > 200;
GO

-- 7. Manutenção e Limpeza (DELETE, TRUNCATE e DROP)
-- Apagar registos específicos com DELETE e WHERE
DELETE FROM pedidos_estoria WHERE order_id = 101;

-- Esvaziar a tabela de pedidos rapidamente com TRUNCATE
TRUNCATE TABLE pedidos_estoria;

-- Destruir a tabela e a sua estrutura com DROP TABLE
DROP TABLE pedidos_estoria;
DROP TABLE clientes_estoria;
GO