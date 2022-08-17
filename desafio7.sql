SELECT
	art.name AS artista,
    alb.title AS album,
	COUNT(alb.title) AS seguidores
FROM SpotifyClone.artist AS art
INNER JOIN SpotifyClone.album AS alb
	ON alb.artist_id = art.artist_id
INNER JOIN SpotifyClone.following AS fol
	ON fol.artist_id = alb.artist_id
GROUP BY album, artista
ORDER BY seguidores DESC, artista ASC, album ASC;
