SELECT 
	u.name AS usuario,
	COUNT(o.user_id) AS qt_de_musicas_ouvidas,
	ROUND(SUM(s.length/60), 2) AS total_minutos
FROM SpotifyClone.user AS u
INNER JOIN SpotifyClone.onrepeat AS o
	ON u.user_id = o.user_id
INNER JOIN SpotifyClone.song AS s
	ON s.song_id = o.song_id
GROUP BY u.name
ORDER BY u.name;
