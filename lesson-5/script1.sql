/* MS SQL */

/* We show DIRTY READ with MS SQL because Postgres doesn't
   support READ UNCOMMITTED level. */

CREATE TABLE Users
(
	userId INT NOT NULL PRIMARY KEY,
	name NVARCHAR(100) NOT NULL
);

INSERT INTO Users
(userid, name)
VALUES
(1, 'Jacob'),
(2, 'John'),
(3, 'James');

CREATE TABLE Messages
(
	messageId INT NOT NULL PRIMARY KEY,
	fromUserId INT NOT NULL,
	toUserId INT NOT NULL,
	subject NVARCHAR(100) NOT NULL,
	body NTEXT NOT NULL,
);

INSERT INTO Messages
(messageId, fromUserId, toUserId, subject, body)
VALUES
(1, 1, 2, 'Hello', 'Boo!'),
(2, 1, 3, 'Hi', 'Foo!'),
(3, 2, 1, 'Who are you?', 'Boo yourself!'),
(4, 2, 3, 'Who is Jacob?', 'I don''t know him.');

CREATE TABLE Attachments
(
	attachmentId INT NOT NULL PRIMARY KEY,
	messageId INT NOT NULL,
	filename NVARCHAR(100) NOT NULL,
	data VARBINARY(MAX) NOT NULL
);

INSERT INTO Attachments
(attachmentId, messageId, filename, data)
VALUES
(1, 3, 'a.bin', 0x0102030405060708090A0B0C0D0E0F),
(2, 3, 'b.bin', 0x1112131415161718191A1B1C1D1E1F),
(3, 3, 'c.txt', CONVERT(VARBINARY(MAX), 'To be or not to be. That''s question!'));


SELECT Users.name, SUM(DATALENGTH(data))
FROM Users
LEFT JOIN Messages ON Users.userId = Messages.fromUserId
LEFT JOIN Attachments ON Messages.messageId = Attachments.messageId
GROUP BY Users.userId, Users.name;

SELECT Users.name
FROM Users
LEFT JOIN Messages ON Users.userId = Messages.fromUserId
LEFT JOIN Attachments ON Messages.messageId = Attachments.messageId
GROUP BY Users.userId, Users.name
HAVING SUM(DATALENGTH(data)) IS NOT NULL AND SUM(DATALENGTH(data)) >= 50;

-- Transaction #1

BEGIN TRANSACTION;
INSERT INTO Attachments
(attachmentId, messageId, filename, data)
VALUES
(4, 3, 'd.bin', 0x2122232425262728292A2B2C2D2E2F);
ROLLBACK;

-- Transaction #2

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

SELECT Users.name
FROM Users
LEFT JOIN Messages ON Users.userId = Messages.fromUserId
LEFT JOIN Attachments ON Messages.messageId = Attachments.messageId
GROUP BY Users.userId, Users.name
HAVING SUM(DATALENGTH(data)) IS NOT NULL AND SUM(DATALENGTH(data)) >= 80;