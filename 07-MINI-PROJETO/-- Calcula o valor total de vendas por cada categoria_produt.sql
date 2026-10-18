-- Calcula o valor total de vendas por cada categoria_produto

SELECT categoria_produto, SUM (valor_venda) AS total_vendas
FROM vendas_ecommerce 
GROUP BY categoria_produto;