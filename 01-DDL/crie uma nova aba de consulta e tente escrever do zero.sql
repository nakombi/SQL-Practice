/* O Teste de Memória Sem olhar para o código! Abra o seu SSMS SQL Server Management Studio, 
crie uma nova aba de consulta e tente escrever do zero, sem consultar os scripts anteriores, 
a seguinte estrutura que criamos na estória da Loja do Bairro*/

CREATE TABLE clientes_estoria (
	customer_id INT NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	country VARCHAR(50) NULL,
	score INT NULL,
CONSTRAINT pk_clientes_estoria PRIMARY KEY (customer_id));