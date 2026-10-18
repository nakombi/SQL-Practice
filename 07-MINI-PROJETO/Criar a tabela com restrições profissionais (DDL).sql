USE SQL_Practice_Store;
GO

-- Apagar a tabela caso já exista, para começarmos com um ambiente limpo
IF OBJECT_ID('vendas_ecommerce', 'U') IS NOT NULL
    DROP TABLE vendas_ecommerce;
GO

-- Criar a tabela com restrições profissionais (DDL)
CREATE TABLE vendas_ecommerce (
    venda_id INT NOT NULL,
    cliente_nome VARCHAR(100) NOT NULL,
    categoria_produto VARCHAR(50) NOT NULL,
    valor_venda DECIMAL(10,2) NOT NULL,
    data_venda DATE NOT NULL,
    CONSTRAINT PK_vendas_ecommerce PRIMARY KEY (venda_id)
);
GO