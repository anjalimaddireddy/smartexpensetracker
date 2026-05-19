USE expense_db;

-- Users
INSERT INTO Users (name) VALUES
('Sujatha'),
('Ravi'),
('Anita');

-- Categories
INSERT INTO Categories (category_name) VALUES
('Food'),
('Travel'),
('Shopping'),
('Bills');

-- Budgets
INSERT INTO Budgets (user_id, category_id, budget_amount) VALUES
(1, 1, 5000),
(1, 2, 3000),
(1, 3, 4000),
(1, 4, 2000);

-- Expenses
INSERT INTO Expenses (user_id, category_id, amount, expense_date) VALUES
(1, 1, 1200, '2025-01-05'),
(1, 1, 1800, '2025-01-10'),
(1, 2, 2500, '2025-01-15'),
(1, 3, 3500, '2025-02-01'),
(1, 4, 1500, '2025-02-05'),
(1, 1, 2200, '2025-02-10'),
(1, 2, 1000, '2025-03-01'),
(1, 3, 2800, '2025-03-05');