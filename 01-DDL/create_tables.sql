-- 01-DDL: criação e alteração de tabelas (SQL Server / T-SQL)
USE SQL_Practice_Store;
GO

-- Nível 1: employees, com ALTER TABLE para NOT NULL e PRIMARY KEY
CREATE TABLE employees (
    employee_id INT,
    employee_name VARCHAR(100),
    hire_date DATE,
    salary DECIMAL(10,2)
);

ALTER TABLE employees ALTER COLUMN employee_id INT NOT NULL;
ALTER TABLE employees ALTER COLUMN employee_name VARCHAR(100) NOT NULL;
ALTER TABLE employees ADD CONSTRAINT PK_employees PRIMARY KEY (employee_id);

-- Versão direta, já com as restrições (use no lugar do bloco acima):
-- CREATE TABLE employees (
--     employee_id INT NOT NULL,
--     employee_name VARCHAR(100) NOT NULL,
--     hire_date DATE NULL,
--     salary DECIMAL(10,2) NULL,
--     CONSTRAINT PK_employees PRIMARY KEY (employee_id)
-- );
GO

-- customers e orders: estrutura conforme o sp_help.
-- Reconstruída a partir da estrutura observada; o script original pode ter pequenas diferenças.
-- CREATE TABLE customers (
--     customer_id INT NOT NULL,
--     first_name VARCHAR(50) NOT NULL,
--     country VARCHAR(50) NULL,
--     score INT NULL,
--     CONSTRAINT PK_customers PRIMARY KEY (customer_id)
-- );
--
-- CREATE TABLE orders (
--     order_id INT NOT NULL,
--     customer_id INT NOT NULL,
--     order_date DATE NOT NULL,
--     quantity INT NOT NULL,
--     total_amount DECIMAL(10,2) NOT NULL,
--     CONSTRAINT PK_orders PRIMARY KEY (order_id),
--     CONSTRAINT FK_orders_customers FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
-- );

-- Desafio extra: tabela de backup com a mesma estrutura de customers
CREATE TABLE customers_backup (
    customer_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    country VARCHAR(50) NULL,
    score INT NULL,
    CONSTRAINT PK_customers_backup PRIMARY KEY (customer_id)
);
GO

-- Teste de memória: clientes_estoria
CREATE TABLE clientes_estoria (
    customer_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    country VARCHAR(50) NULL,
    score INT NULL,
    CONSTRAINT pk_clientes_estoria PRIMARY KEY (customer_id)
);
GO

-- Semana 2: mini-projeto de vendas
IF OBJECT_ID('vendas_ecommerce', 'U') IS NOT NULL
    DROP TABLE vendas_ecommerce;
GO

CREATE TABLE vendas_ecommerce (
    venda_id INT NOT NULL,
    cliente_nome VARCHAR(100) NOT NULL,
    categoria_produto VARCHAR(50) NOT NULL,
    valor_venda DECIMAL(10,2) NOT NULL,
    data_venda DATE NOT NULL,
    CONSTRAINT PK_vendas_ecommerce PRIMARY KEY (venda_id)
);
GO

-- Conferir a estrutura de uma tabela
-- EXEC sp_help 'orders';
