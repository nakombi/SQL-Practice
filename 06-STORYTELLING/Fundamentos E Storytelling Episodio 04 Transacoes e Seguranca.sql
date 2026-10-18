/*
================================================================================
ESTÓRIA 4: O Guardião do Cofre (Transações e Segurança)
================================================================================
O dia está a terminar e tens de realizar uma tarefa de manutenção crítica numa 
tabela de testes de carga, a staging_test. O gestor avisa-te:
— Cuidado para não apagares dados de produção por engano!

Tu sabes que na engenharia de dados, um erro de exclusão pode custar milhões à 
empresa. Por isso, lembras-te das ferramentas de limpeza e das redes de segurança.

Primeiro, aprendeste a diferença entre as três formas de apagar coisas. O 
DELETE FROM ... WHERE é o bisturi: apaga apenas as linhas específicas que escolheres 
com base numa condição, permitindo registar cada alteração. O TRUNCATE TABLE é 
a escavadora: esvazia a tabela inteira num piscar de olhos, de forma muito rápida, 
mas sem aceitar filtros WHERE. E o DROP TABLE é a dinamite: deita abaixo a tabela 
inteira, apagando tanto os dados como a própria estrutura da base de dados para sempre.

(Pausa curta... respira fundo)

Mas como és um profissional precavido, antes de executar qualquer comando perigoso 
em ambientes reais, usas a tua arma secreta: a transação com BEGIN TRAN.

Tu inicias a transação, executas o DELETE para testar, consultas a tabela e vês 
que ela ficou vazia por engano. Em vez de entrar em pânico, respiras fundo e dás 
o comando mágico: ROLLBACK. No segundo seguinte, dás um SELECT e vês todos os dados 
a ressurgirem intactos na tela, como se nada tivesse acontecido.

Fechas o teu ambiente de desenvolvimento com a certeza de que dominaste os ciclos 
de vida, as estruturas, as consultas e a segurança dos dados. O teu treino prático 
está completo.
================================================================================
*/


-- =============================================================================
-- QUERY PRÁTICA: Traduzindo a estória para comandos executáveis no SQL Server
-- Título sugerido para salvar: Episodio_04_Transacoes_e_Seguranca.sql
-- =============================================================================

USE SQL_Practice_Store;
GO

-- 1. Criar a tabela temporária de teste 'staging_test'
CREATE TABLE staging_test (
    id INT,
    descricao VARCHAR(100)
);
GO

-- 2. Inserir registos de teste na tabela
INSERT INTO staging_test (id, descricao) VALUES 
(1, 'Teste um'), 
(2, 'Teste dois'), 
(3, 'Teste três');
GO

-- Visualizar os dados iniciais
SELECT * FROM staging_test;
GO

-- 3. A Rede de Segurança: Transações com BEGIN TRAN e ROLLBACK
-- Isto protege-nos contra erros de exclusão acidentais em produção!
BEGIN TRAN;

-- Executar um apagão geral sem WHERE (simulando um erro ou teste crítico)
DELETE FROM staging_test;

-- Consultar para ver que a tabela ficou vazia
SELECT * FROM staging_test; 

-- O PANIC MÁGICO: Decidir voltar atrás na transação e restaurar os dados!
ROLLBACK;

-- Consultar novamente para confirmar que os dados voltaram graças ao ROLLBACK
SELECT * FROM staging_test;
GO

-- 4. Demonstração final das diferenças de limpeza:
-- DELETE: Apaga linhas de forma controlada (permite WHERE)
DELETE FROM staging_test WHERE id = 1;
GO

-- TRUNCATE TABLE: Esvazia todas as linhas rapidamente (sem aceitar WHERE)
TRUNCATE TABLE staging_test;
GO

-- DROP TABLE: Destrói completamente a tabela e a sua estrutura do banco de dados
DROP TABLE staging_test;
GO