/* Postgres */

CREATE TABLE Performers
(
	performerId INT NOT NULL PRIMARY KEY,
	name VARCHAR(80) NOT NULL
);

INSERT INTO Performers
(performerId, name)
VALUES
(1, 'Ed Sheeran'),
(2, 'Nothing but Thieves'),
(3, 'Greta Van Fleet');
