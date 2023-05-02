/* Postgres */

CREATE TABLE Payments
(
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	amount MONEY
);

INSERT INTO Payments
(name, amount)
VALUES
('Bank', 0.0),
('William', 5.0),
('John', 7.0),
('Jones', 6.0);

SELECT * FROM Payments;