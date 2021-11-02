-- Pre-work Query
WITH customers AS(
SELECT id as customer_id, name, email
FROM analytics-engineers-club.coffee_shop.customers
)

, orders_by_customer AS(
SELECT customer_id, MIN(created_at) AS first_order_at, COUNT(id) AS number_of_orders
FROM analytics-engineers-club.coffee_shop.orders
GROUP BY customer_id
)

SELECT customers.customer_id, name, email, first_order_at, number_of_orders
FROM customers
INNER JOIN orders_by_customer ON
    customers.customer_id = orders_by_customer.customer_id
ORDER BY first_order_at
LIMIT 5