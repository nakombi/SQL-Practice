-- clientes com total acima de 1000.00

SELECT cliente_nome, SUM(valor_venda) AS total_gasto
FROM vendas_ecommerce
GROUP BY cliente_nome
HAVING SUM(valor_venda) > 1000.00;