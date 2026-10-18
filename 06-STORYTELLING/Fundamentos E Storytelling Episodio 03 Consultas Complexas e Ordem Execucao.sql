/*
================================================================================
ESTÓRIA 3: O Detetive de Dados e os Segredos do Ordenamento 
(Consultas Complexas e Ordem de Execução)
================================================================================
Numa tarde calma, a diretoria de operações pede-te um relatório analítico complexo:
— Queremos os clientes do Brasil, ordenados do maior para o menor score, mas traz-me 
apenas os três primeiros.

Tu arregaças as mangas e crias a consulta perfeita. Começas com um SELECT TOP 3 * 
FROM customers. Depois, aplicas o filtro de linha com o WHERE country = 'Brazil', 
segues ordenando com o ORDER BY score DESC para trazer os maiores scores primeiro, 
e ainda usas um DISTINCT nas tuas consultas para garantir que nenhum país se repete 
quando queres ver categorias únicas. Tu percebes que estás a combinar filtros de 
colunas, de linhas, de ordenação e de limites numa única frase em SQL.

(Pausa curta... respira fundo)

Mas a verdadeira magia acontece dentro da cabeça do motor do SQL Server. Tu 
perguntas-te: — Como é que o banco de dados lê este monstro de código?

O professor explicou-te o segredo que separa um programador comum de um engenheiro 
de dados: a Ordem de Execução é totalmente diferente da ordem em que escreves o código!

Quando escreves, começas sempre pelo SELECT. Mas o banco de dados nunca começa 
por aí. A primeira coisa que o SQL faz por trás dos panos é olhar para o FROM — 
ele vai buscar a tabela inteira à base de dados. Em segundo lugar, ele aplica o 
WHERE para cortar logo as linhas que não interessam, aliviando o peso do processamento. 
Em terceiro lugar, se houver um GROUP BY, ele agrupa os dados restantes. Em quarto, 
aplica o HAVING. O SELECT com as colunas que tu pediste só é executado quase no 
final, no quinto passo! Depois vem o ORDER BY para ordenar, e o TOP é estritamente 
a última coisa a acontecer, cortando o resultado final no número exato de linhas que pediste.

Tu sorris ao perceber que, entendendo essa lógica de bastidores, nunca mais vais 
escrever uma consulta cega na tua carreira.
================================================================================
*/


-- =============================================================================
-- QUERY PRÁTICA: Traduzindo a estória para comandos executáveis no SQL Server
-- Título sugerido para salvar: Episodio_03_Consultas_Complexas_e_Ordem_Execucao.sql
-- =============================================================================

USE SQL_Practice_Store;
GO

-- 1. Consulta Complexa combinando SELECT, TOP, WHERE, ORDER BY e DISTINCT
-- Listar os países únicos de forma limpa
SELECT DISTINCT country 
FROM customers;
GO

-- Trazer os top 3 clientes do Brasil com as maiores pontuações
-- (Note que a ordem de ESCRITA começa por SELECT TOP 3, mas a execução real nos bastidores é diferente!)
SELECT TOP 3 customer_id, first_name, country, score
FROM customers
WHERE country = 'Brazil'
ORDER BY score DESC;
GO

-- 2. Demonstração prática da Ordem de Execução do Motor do SQL Server:
/* 
   Ordem de Escrita (Como nós programamos):
   1. SELECT (Quais colunas/limites ver)
   2. FROM (De que tabela)
   3. WHERE (Condição das linhas)
   4. GROUP BY (Agrupamentos)
   5. HAVING (Filtro de agregados)
   6. ORDER BY (Ordenação)
   7. TOP (Corte final)

   Ordem de Execução Real (Como o SQL Server processa nos bastidores):
   1. FROM       -> Vai buscar a tabela base
   2. WHERE      -> Filtra as linhas iniciais
   3. GROUP BY   -> Agrupa os dados
   4. HAVING     -> Filtra os grupos agregados
   5. SELECT     -> Projeta as colunas pedidas e elimina duplicados (DISTINCT)
   6. ORDER BY   -> Ordena o resultado
   7. TOP        -> Corta o número exato de linhas a retornar
*/