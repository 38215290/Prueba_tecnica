CREATE VIEW sales_region AS
	SELECT 
    region,  
    SUM(total_revenue) AS total_sales_region
FROM 
    ventas
GROUP BY 
    region;
    
CREATE VIEW sales_category AS
	SELECT 
    product_category,  
    SUM(total_revenue) AS total_sales_category
FROM 
    ventas
GROUP BY 
    product_category;
-- propuesta de optimizacion--
SELECT product_category, 
	SUM(total_revenue) as total,
	RANK() OVER (ORDER BY SUM(total_revenue) DESC) AS sales_rank
FROM ventas
WHERE total_revenue IS NOT NULL
GROUP BY product_category;
