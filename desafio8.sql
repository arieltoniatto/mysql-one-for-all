SELECT
	art.name AS artista,
    alb.title AS album
FROM SpotifyClone.artist AS art
INNER JOIN SpotifyClone.album AS alb
	ON alb.artist_id = art.artist_id
WHERE art.name = 'Elis Regina';
