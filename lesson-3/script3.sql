/* MySQL */

/* Add `orderNo` column */

ALTER TABLE AlbumsSongs ADD orderNo INT NOT NULL DEFAULT 0;
SHOW CREATE TABLE AlbumsSongs;

UPDATE AlbumsSongs SET orderNo = 1 WHERE albumId = 1 AND songId = 1;
UPDATE AlbumsSongs SET orderNo = 2 WHERE albumId = 1 AND songId = 2;
UPDATE AlbumsSongs SET orderNo = 3 WHERE albumId = 1 AND songId = 3;
UPDATE AlbumsSongs SET orderNo = 4 WHERE albumId = 1 AND songId = 4;
UPDATE AlbumsSongs SET orderNo = 5 WHERE albumId = 1 AND songId = 5;
UPDATE AlbumsSongs SET orderNo = 6 WHERE albumId = 1 AND songId = 6;
UPDATE AlbumsSongs SET orderNo = 7 WHERE albumId = 1 AND songId = 7;
UPDATE AlbumsSongs SET orderNo = 8 WHERE albumId = 1 AND songId = 8;
UPDATE AlbumsSongs SET orderNo = 9 WHERE albumId = 1 AND songId = 9;
UPDATE AlbumsSongs SET orderNo = 10 WHERE albumId = 1 AND songId = 10;
UPDATE AlbumsSongs SET orderNo = 11 WHERE albumId = 1 AND songId = 11;
UPDATE AlbumsSongs SET orderNo = 12 WHERE albumId = 1 AND songId = 12;

UPDATE AlbumsSongs SET orderNo = 1 WHERE albumId = 2 AND songId = 13;
UPDATE AlbumsSongs SET orderNo = 2 WHERE albumId = 2 AND songId = 14;
UPDATE AlbumsSongs SET orderNo = 3 WHERE albumId = 2 AND songId = 15;
UPDATE AlbumsSongs SET orderNo = 4 WHERE albumId = 2 AND songId = 16;
UPDATE AlbumsSongs SET orderNo = 5 WHERE albumId = 2 AND songId = 17;
UPDATE AlbumsSongs SET orderNo = 6 WHERE albumId = 2 AND songId = 18;
UPDATE AlbumsSongs SET orderNo = 7 WHERE albumId = 2 AND songId = 19;
UPDATE AlbumsSongs SET orderNo = 8 WHERE albumId = 2 AND songId = 20;
UPDATE AlbumsSongs SET orderNo = 9 WHERE albumId = 2 AND songId = 21;
UPDATE AlbumsSongs SET orderNo = 10 WHERE albumId = 2 AND songId = 22;
UPDATE AlbumsSongs SET orderNo = 11 WHERE albumId = 2 AND songId = 23;
UPDATE AlbumsSongs SET orderNo = 12 WHERE albumId = 2 AND songId = 24;

UPDATE AlbumsSongs SET orderNo = 1 WHERE albumId = 3 AND songId = 1;
UPDATE AlbumsSongs SET orderNo = 1 WHERE albumId = 4 AND songId = 2;

UPDATE AlbumsSongs SET orderNo = 1 WHERE albumId = 5 AND songId = 25;
UPDATE AlbumsSongs SET orderNo = 2 WHERE albumId = 5 AND songId = 26;
UPDATE AlbumsSongs SET orderNo = 3 WHERE albumId = 5 AND songId = 27;
UPDATE AlbumsSongs SET orderNo = 4 WHERE albumId = 5 AND songId = 28;
UPDATE AlbumsSongs SET orderNo = 5 WHERE albumId = 5 AND songId = 29;
UPDATE AlbumsSongs SET orderNo = 6 WHERE albumId = 5 AND songId = 30;
UPDATE AlbumsSongs SET orderNo = 7 WHERE albumId = 5 AND songId = 31;
UPDATE AlbumsSongs SET orderNo = 8 WHERE albumId = 5 AND songId = 32;
UPDATE AlbumsSongs SET orderNo = 9 WHERE albumId = 5 AND songId = 33;
UPDATE AlbumsSongs SET orderNo = 10 WHERE albumId = 5 AND songId = 34;
UPDATE AlbumsSongs SET orderNo = 11 WHERE albumId = 5 AND songId = 35;
UPDATE AlbumsSongs SET orderNo = 12 WHERE albumId = 5 AND songId = 36;

UPDATE AlbumsSongs SET orderNo = 1 WHERE albumId = 6 AND songId = 37;

UPDATE AlbumsSongs SET orderNo = 1 WHERE albumId = 7 AND songId = 48;
UPDATE AlbumsSongs SET orderNo = 2 WHERE albumId = 7 AND songId = 49;
UPDATE AlbumsSongs SET orderNo = 3 WHERE albumId = 7 AND songId = 50;
UPDATE AlbumsSongs SET orderNo = 4 WHERE albumId = 7 AND songId = 51;

UPDATE AlbumsSongs SET orderNo = 1 WHERE albumId = 8 AND songId = 38;
UPDATE AlbumsSongs SET orderNo = 2 WHERE albumId = 8 AND songId = 39;
UPDATE AlbumsSongs SET orderNo = 3 WHERE albumId = 8 AND songId = 40;
UPDATE AlbumsSongs SET orderNo = 4 WHERE albumId = 8 AND songId = 41;
UPDATE AlbumsSongs SET orderNo = 5 WHERE albumId = 8 AND songId = 42;
UPDATE AlbumsSongs SET orderNo = 6 WHERE albumId = 8 AND songId = 43;
UPDATE AlbumsSongs SET orderNo = 7 WHERE albumId = 8 AND songId = 44;
UPDATE AlbumsSongs SET orderNo = 8 WHERE albumId = 8 AND songId = 45;
UPDATE AlbumsSongs SET orderNo = 9 WHERE albumId = 8 AND songId = 46;
UPDATE AlbumsSongs SET orderNo = 10 WHERE albumId = 8 AND songId = 47;

ALTER TABLE AlbumsSongs ALTER orderNo DROP DEFAULT;
SHOW CREATE TABLE AlbumsSongs;

/* Cumulative sum */

SELECT Albums.name, AlbumsSongs.*
FROM Albums
JOIN AlbumsSongs ON Albums.albumId = AlbumsSongs.albumId
WHERE Albums.albumId = 1;

SELECT Albums.name, AlbumsSongs.*, AlbumsSongs2.*
FROM Albums
JOIN AlbumsSongs ON Albums.albumId = AlbumsSongs.albumId
JOIN AlbumsSongs AlbumsSongs2 ON AlbumsSongs.albumId = AlbumsSongs2.albumId
                             AND AlbumsSongs.orderNo >= AlbumsSongs2.orderNo
WHERE Albums.albumId = 1;

SELECT Albums.name, Songs.name, Songs2.duration, AlbumsSongs.*, AlbumsSongs2.*
FROM Albums
JOIN AlbumsSongs ON Albums.albumId = AlbumsSongs.albumId
JOIN AlbumsSongs AlbumsSongs2 ON AlbumsSongs.albumId = AlbumsSongs2.albumId
                             AND AlbumsSongs.orderNo >= AlbumsSongs2.orderNo
JOIN Songs ON AlbumsSongs.songId = Songs.songId
JOIN Songs Songs2 ON AlbumsSongs2.songId = Songs2.songId
WHERE Albums.albumId = 1;

SELECT Albums.name, AlbumsSongs.orderNo, Songs.name, SEC_TO_TIME(SUM(TIME_TO_SEC(Songs2.duration)))
FROM Albums
JOIN AlbumsSongs ON Albums.albumId = AlbumsSongs.albumId
JOIN AlbumsSongs AlbumsSongs2 ON AlbumsSongs.albumId = AlbumsSongs2.albumId
                             AND AlbumsSongs.orderNo >= AlbumsSongs2.orderNo
JOIN Songs ON AlbumsSongs.songId = Songs.songId
JOIN Songs Songs2 ON AlbumsSongs2.songId = Songs2.songId
WHERE Albums.albumId = 1
GROUP BY Songs.songId
ORDER BY AlbumsSongs.orderNo;
