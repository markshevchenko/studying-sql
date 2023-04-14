/* Postgres */

SELECT Performers.name, Albums.name, Songs.name, duration
FROM Performers
JOIN Albums ON Performers.performerId = Albums.performerId
JOIN AlbumsSongs ON AlbumsSongs.albumId = Albums.albumId
JOIN Songs ON AlbumsSongs.songId = Songs.songId
WHERE Performers.name = 'Ed Sheeran';

SELECT Albums.name, Songs.name, duration
FROM Albums
JOIN AlbumsSongs ON AlbumsSongs.albumId = Albums.albumId
JOIN Songs ON AlbumsSongs.songId = Songs.songId
WHERE Albums.name = '+';
