1)JOIN

SELECT c.customer_name, o.order_id, o.total_amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

2)Insight: Who is buying again and again

SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id) > 1; 

3)Who gives most revenue

SELECT c.customer_name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;

4)Which city gives more sales.

SELECT c.city, SUM(o.total_amount) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY revenue DESC;                 

5)Growth over time.

SELECT TO_CHAR(order_date, 'YYYY-MM') AS month,
       SUM(total_amount) AS revenue
FROM orders
GROUP BY TO_CHAR(order_date, 'YYYY-MM')
ORDER BY month;

6)Top Customer using Window Function

SELECT customer_name, total_spent
FROM (
    SELECT c.customer_name,
           SUM(o.total_amount) AS total_spent,
           RANK() OVER (ORDER BY SUM(o.total_amount) DESC) rnk
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_name
)
WHERE rnk = 1;



5)