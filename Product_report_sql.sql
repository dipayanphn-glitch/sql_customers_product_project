CREATE VIEW gold_report_products AS

-- WITH base_query AS (
--     -- Base query joining sales and products
--     SELECT
--         f.order_number,
--         f.order_date,
--         f.customer_key,
--         f.sales_amount,
--         f.quantity,
--         p.product_key,
--         p.product_name,
--         p.category,
--         p.subcategory,
--         p.cost,
--         p.product_line
--     FROM gold_fact_sales f
--     LEFT JOIN gold_dim_products p
--     ON f.product_key = p.product_key
--     WHERE f.order_date IS NOT NULL
-- ),

-- product_aggregation AS (
--     SELECT
--         product_key,
--         product_name,
--         category,
--         subcategory,
--         cost,
--         product_line,

--         -- Aggregated metrics
--         COUNT(DISTINCT order_number) AS total_orders,
--         SUM(sales_amount) AS total_sales,
--         SUM(quantity) AS total_quantity,
--         COUNT(DISTINCT customer_key) AS total_customers,
--         MAX(order_date) AS last_sale,

--         -- Lifespan in months
--         TIMESTAMPDIFF(MONTH, MIN(order_date), MAX(order_date)) AS lifespan

--     FROM base_query
--     GROUP BY
--         product_key,
--         product_name,
--         category,
--         subcategory,
--         cost,
--         product_line
-- )

-- SELECT
--     product_key,
--     product_name,
--     category,
--     subcategory,
--     cost,
--     product_line,
--     total_orders,
--     total_sales,
--     total_quantity,
--     total_customers,
--     last_sale,
--     lifespan,

--     -- Recency
--     TIMESTAMPDIFF(MONTH, last_sale, CURDATE()) AS recency,

--     -- Product segment by revenue
--     CASE
--         WHEN total_sales > 50000 THEN "High-Performer"
--         WHEN total_sales >= 10000 THEN "Mid-Range"
--         ELSE "Low-Performer"
--     END AS product_segment,

--     -- Average order revenue (AOR)
--     CASE
--         WHEN total_orders = 0 THEN 0
--         ELSE ROUND(total_sales / total_orders, 2)
--     END AS avg_order_revenue,

--     -- Average monthly revenue
--     CASE
--         WHEN lifespan = 0 THEN total_sales
--         ELSE ROUND(total_sales / lifespan, 2)
--     END AS avg_monthly_revenue

-- FROM product_aggregation;

-- select * from gold_report_products
--  
--  
