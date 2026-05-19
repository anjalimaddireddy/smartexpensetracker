USE expense_db;

-- 1. Monthly spending
SELECT 
    MONTH(expense_date) AS month,
    SUM(amount) AS total_spent
FROM Expenses
GROUP BY MONTH(expense_date)
ORDER BY month;

-- 2. Category-wise spending
SELECT 
    c.category_name,
    SUM(e.amount) AS total_spent
FROM Expenses e
JOIN Categories c ON e.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_spent DESC;

-- 3. Top categories using window function
SELECT category_name, total,
RANK() OVER (ORDER BY total DESC) AS rank_no
FROM (
    SELECT c.category_name, SUM(e.amount) AS total
    FROM Expenses e
    JOIN Categories c ON e.category_id = c.category_id
    GROUP BY c.category_name
) t;

-- 4. Budget vs actual
SELECT 
    c.category_name,
    b.budget_amount,
    COALESCE(SUM(e.amount),0) AS spent
FROM Budgets b
JOIN Categories c ON b.category_id = c.category_id
LEFT JOIN Expenses e ON b.category_id = e.category_id
GROUP BY c.category_name, b.budget_amount;