USE expense_db;

DELIMITER //

CREATE TRIGGER check_budget
AFTER INSERT ON Expenses
FOR EACH ROW
BEGIN
    DECLARE total_spent DECIMAL(10,2);
    DECLARE budget DECIMAL(10,2);

    SELECT SUM(amount) INTO total_spent
    FROM Expenses
    WHERE category_id = NEW.category_id;

    SELECT budget_amount INTO budget
    FROM Budgets
    WHERE category_id = NEW.category_id;

    IF total_spent > budget THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Budget exceeded!';
    END IF;
END //

DELIMITER ;