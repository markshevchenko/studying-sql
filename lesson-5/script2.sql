/* Postgres */

CREATE TABLE Customers
(
	customerId SERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(40)
);

INSERT INTO Customers
(name)
VALUES
('Apple'),
('Google'),
('Microsoft');

CREATE TABLE Orders
(
	orderId SERIAL NOT NULL PRIMARY KEY,
	customerId INT NOT NULL,
	paidAt DATE NOT NULL,
	amount DECIMAL NOT NULL
);

INSERT INTO Orders
(customerId, paidAt, amount)
VALUES
(1, '2023-01-01', 1000),
(1, '2023-02-01', 1500),
(1, '2023-03-01', 2000),
(2, '2023-01-01', 3000),
(2, '2023-02-01', 4000),
(2, '2023-03-01', 3000),
(3, '2023-01-01', 2000),
(3, '2023-02-01', 1500),
(3, '2023-03-01', 4000);

SELECT Customers.name, SUM(Orders.amount)
FROM Customers
LEFT JOIN Orders ON Customers.customerId = Orders.customerId
GROUP BY Customers.customerId;

-- Lost updates on READ COMMITTED

BEGIN ISOLATION LEVEL READ COMMITTED;
SELECT * FROM Orders;
UPDATE Orders SET amount = amount + 100 WHERE orderId = 4;
COMMIT;

-- Unrepeatable reads

ALTER TABLE Customers ADD COLUMN bonus DECIMAL NOT NULL DEFAULT 0;

SELECT SUM(Orders.amount)
FROM Customers
LEFT JOIN Orders ON Customers.customerId = Orders.customerId
WHERE Customers.customerId = 3
GROUP BY Customers.customerId;

SELECT CASE WHEN SUM(Orders.amount) > 9000.0 THEN 0.10
            WHEN SUM(Orders.amount) > 5000.0 THEN 0.07
			WHEN SUM(Orders.amount) > 2000.0 THEN 0.03
			ELSE 0.00
	   END
FROM Customers
LEFT JOIN Orders ON Customers.customerId = Orders.customerId
--WHERE Customers.customerId = 3
GROUP BY Customers.customerId;

