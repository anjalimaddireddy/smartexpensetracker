USE expense_db;

DELIMITER //

CREATE PROCEDURE AddExpense(
    IN u_id INT,
    IN c_id INT,
    IN amt DECIMAL(10,2),
    IN exp_date DATE
)
BEGIN
    INSERT INTO Expenses(user_id, category_id, amount, expense_date)
    VALUES(u_id, c_id, amt, exp_date);
END //

DELIMITER ;