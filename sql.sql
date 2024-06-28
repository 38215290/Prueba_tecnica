SELECT product_category, 
	SUM(total_revenue) as total,
	RANK() OVER (ORDER BY SUM(total_revenue) DESC) AS sales_rank
FROM ventas
WHERE total_revenue IS NOT NULL
GROUP BY product_category;
