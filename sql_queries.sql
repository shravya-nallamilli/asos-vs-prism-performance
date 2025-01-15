-- Gross Margin
SELECT 
    ((SUM(item_quantity * item_price) - SUM(cost_of_item)) / SUM(item_quantity * item_price)) * 100 AS gross_margin_percentage
FROM 
    `prism-insights.prism_acquire.transactionsanditems` AS t
JOIN 
    `prism_acquire.product_costs` AS pc
ON 
    t.item_id = pc.item_id;

-- Active Customers
SELECT
    COUNT(DISTINCT user_crm_id) AS active_customers
FROM
    `prism-insights.prism_acquire.transactions`
WHERE
    user_crm_id IS NOT NULL;

-- Visits
SELECT
    COUNT(DISTINCT session_id) AS visits
FROM
    `prism-insights.prism_acquire.sessions`;

-- Orders
SELECT
    COUNT(DISTINCT transaction_id) AS orders
FROM
    `prism-insights.prism_acquire.transactions`;

-- Net Sales Margin (NSM)
SELECT
    SAFE_DIVIDE((SUM(item_price * item_quantity) - SUM(cost_of_item)), SUM(item_price * item_quantity)) * 100 AS net_sales_margin_percentage
FROM
    `prism-insights.prism_acquire.transactionsanditems` AS tai
JOIN
    `prism-insights.prism_acquire.product_costs` AS pc
ON
    tai.item_id = pc.item_id;

-- Average Basket Value (ABV)
SELECT
    SAFE_DIVIDE(SUM(transaction_total), COUNT(DISTINCT transaction_id)) AS average_basket_value
FROM
    `prism-insights.prism_acquire.transactions`;

-- Conversion Rate
SELECT
    SAFE_DIVIDE(
        COUNT(DISTINCT CASE WHEN event_name = 'purchase' THEN session_id END),
        NULLIF(COUNT(DISTINCT CASE WHEN event_name = 'view_item' THEN session_id END), 0)
    ) * 100 AS conversion_rate
FROM
    `prism-insights.prism_acquire.funnelevents`;

-- Distribution of Expenses
SELECT
    SUM(tai.item_quantity * pc.cost_of_item) AS total_product_cost
FROM
    `prism-insights.prism_acquire.transactionsanditems` AS tai
JOIN
    `prism-insights.prism_acquire.product_costs` AS pc
ON
    tai.item_id = pc.item_id;
