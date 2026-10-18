-- Deixar as colunas obrigatórias como NOT NULL

ALTER TABLE employees ALTER COLUMN employee_id INT NOT NULL;
ALTER TABLE employees ALTER COLUMN employee_name VARCHAR(100) NOT NULL;