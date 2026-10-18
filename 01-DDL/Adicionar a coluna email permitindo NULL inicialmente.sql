-- Adicionar a coluna email permitindo NULL inicialmente

ALTER TABLE employees 
ADD email VARCHAR(100) NULL;