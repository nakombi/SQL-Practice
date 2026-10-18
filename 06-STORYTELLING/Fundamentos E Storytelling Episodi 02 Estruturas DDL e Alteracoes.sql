/*
================================================================================
ESTÓRIA 2: Os Alicerces e a Organização do Terreno (DDL e DML Avançado)
================================================================================
Imagina que chegas à empresa e o projeto mudou de escala. O teu gestor diz:
— Precisamos de criar uma nova área para gerir os funcionários e garantir que 
ninguém entra no sistema sem dados válidos.

Tu abres o SQL Server e começas a desenhar o banco de dados do zero usando a 
linguagem DDL. Escreves CREATE TABLE employees. Dentro dos parênteses, defines 
cada coluna com o seu tipo exato: o INT para números inteiros do identificador, 
o VARCHAR para o nome, o DATE para a data de admissão e o DECIMAL para o salário.

Mas tu sabes que um engenheiro de dados sénior não deixa portas abertas. Por isso, 
aplicas restrições rigorosas: defines o NOT NULL para obrigar o preenchimento de 
campos obrigatórios e crias uma Primary Key (CONSTRAINT PK_employees) para garantir 
que cada funcionário tem um bilhete de identidade único e intocável.

(Pausa curta... respira fundo)

O tempo passa e a empresa cresce. O gestor chega de novo e diz:
— Precisamos de guardar o e-mail de cada funcionário na tabela que criamos ontem.

É aqui que usas o comando de alteração estrutural, o ALTER TABLE. Tu escreves 
ALTER TABLE employees ADD email VARCHAR(100) NULL, expandindo a estrutura sem 
precisares de apagar nada. E se mais à frente decidires que o e-mail afinal não 
é necessário? Usas o mesmo ALTER TABLE com o comando DROP COLUMN email para limpar a tabela.

Tu aprendeste que alterar a estrutura de uma tabela em produção exige cuidado, 
porque estás a mexer diretamente no esqueleto do sistema da empresa.
================================================================================
*/


-- =============================================================================
-- QUERY PRÁTICA: Traduzindo a estória para comandos executáveis no SQL Server
-- Título sugerido para salvar: Episodio_02_Estruturas_DDL_e_Alteracoes.sql
-- =============================================================================

USE SQL_Practice_Store;
GO

-- 1. DDL Avançado: Criar a tabela 'employees' com tipos de dados e restrições rigorosas
CREATE TABLE employees (
    employee_id INT NOT NULL,              -- Identificador inteiro obrigatório
    employee_name VARCHAR(100) NOT NULL,    -- Nome do funcionário obrigatório
    hire_date DATE NULL,                    -- Data de admissão (opcional)
    salary DECIMAL(10,2) NULL,              -- Salário com precisão decimal (opcional)
    
    -- Restrição de Chave Primária (Primary Key) para garantir unicidade
    CONSTRAINT PK_employees PRIMARY KEY (employee_id)
);
GO

-- 2. Consultar a estrutura inicial da tabela criada
SELECT * FROM employees;
GO

-- 3. Evolução Estrutural (ALTER TABLE - Adicionar Coluna): 
-- Adicionando a coluna 'email' permitindo valores NULL inicialmente
ALTER TABLE employees 
ADD email VARCHAR(100) NULL;
GO

-- Verificando a tabela com a nova coluna email
SELECT * FROM employees;
GO

-- 4. Evolução Estrutural (ALTER TABLE - Remover Coluna):
-- Simulando a decisão de remover o campo de e-mail caso já não seja necessário
ALTER TABLE employees 
DROP COLUMN email;
GO

-- Verificando a tabela após a remoção da coluna
SELECT * FROM employees;
GO