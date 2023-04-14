/* Postgres */

INSERT INTO Performers
(performerId, name)
VALUES
(4, 'Mark Shevchenko');

SELECT Performers.name, COUNT(Albums.*)
FROM Performers
JOIN Albums ON Performers.performerId = Albums.performerId
GROUP BY Performers.performerId;

SELECT Performers.name, COUNT(Albums.*)
FROM Performers
LEFT JOIN Albums ON Performers.performerId = Albums.performerId
GROUP BY Performers.performerId;